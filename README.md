## Cypht

This is the official docker image of [Cypht](https://cypht.org/).

### Features of this image

* Alpine linux based image that is less than 50MB
* Bundled nginx and PHP 7.1 provides everything in one image
* Performs same install steps as found on [Cypht install page](https://cypht.org/install.html)
* All Cypht mods and configuration options can be set via environment variables
* Automatic database setup (if configured to use database)

### Example docker-compose

* Starts a database container to be for user authentication
* Starts the Cypht container available on port 80 of the host with ...
  * A local volume declared for persisting user settings across container reboots.
  * An initial user account for authentication
  * Environment variables for accessing the database container

*NOTE: Please change usernames and passwords before using this docker-compose in your environment*

```
version: '3'
services:
  db:
    image: mariadb:10
    volumes:
      - ./db:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=root_password
      - MYSQL_DATABASE=cypht
      - MYSQL_USER=cypht
      - MYSQL_PASSWORD=cypht_password
  cypht:
    image: sailfrog/cypht-docker:latest
    volumes:
      - ./cypht/users:/var/lib/hm3/users
    ports:
      - "80:80"
    environment:
      - CYPHT_AUTH_USERNAME=admin
      - CYPHT_AUTH_PASSWORD=admin_password
      - CYPHT_DB_CONNECTION_TYPE=host
      - CYPHT_DB_HOST=db
      - CYPHT_DB_NAME=cypht
      - CYPHT_DB_USER=cypht
      - CYPHT_DB_PASS=cypht_password
      - CYPHT_SESSION_TYPE=DB
```

### Environment variables

See [hm3.sample.ini](https://github.com/jasonmunro/cypht/blob/master/hm3.sample.ini) file for more information about each setting.

* **CYPHT_SESSION_TYPE** : How logged in state is maintained (default : PHP - Not sure why yet but PHP sessions are not working in this image right now, but DB sessions do so I added it to the example docker compose above)
* **CYPHT_AUTH_TYPE** : Type of user authentication *(default : DB)*
* **CYPHT_AUTH_USERNAME** : User account to be created in database for authentication *(default : blank)*
* **CYPHT_AUTH_PASSWORD** : Password for the user *(default : blank)*
* **CYPHT_LDAP_AUTH_SERVER** : LDAP server (only used if auth_type is LDAP) *(default : localhost)*
* **CYPHT_LDAP_AUTH_PORT** : LDAP server port (only used if auth_type is LDAP) *(default : 389)*
* **CYPHT_LDAP_AUTH_TLS** : LDAP server encryption (only used if auth_type is LDAP) *(default : blank)*
* **CYPHT_LDAP_AUTH_BASE_DN** : LDAP server base dn (only used if auth_type is LDAP) *(default : "example,dc:com")*
* **CYPHT_IMAP_AUTH_NAME** : IMAP server name/label in UI (only used if auth_type is IMAP) *(default : localhost)*
* **CYPHT_IMAP_AUTH_SERVER** : IMAP server (only used if auth_type is IMAP) *(default : localhost)*
* **CYPHT_IMAP_AUTH_PORT** : IMAP server port (only used if auth_type is IMAP) *(default : 143)*
* **CYPHT_IMAP_AUTH_TLS** : IMAP server encryption (only used if auth_type is IMAP) *(default : blank)*
* **CYPHT_POP3_AUTH_NAME** : POP3 server name/label in UI (only used if auth_type is POP3) *(default : localhost)*
* **CYPHT_POP3_AUTH_SERVER** : POP3 server (only used if auth_type is POP3) *(default : localhost)*
* **CYPHT_POP3_AUTH_PORT** : POP3 server port (only used if auth_type is POP3) *(default : 110)*
* **CYPHT_POP3_AUTH_TLS** : POP3 server encryption (only used if auth_type is POP3) *(default : blank)*
* **CYPHT_DEFAULT_SMTP_NAME** : Default SMTP server name/label in UI for all users (only makes sense if auth_type is IMAP or POP3) *(default : blank)*
* **CYPHT_DEFAULT_SMTP_SERVER** : Default SMTP server for all users (only makes sense if auth_type is IMAP or POP3) *(default : blank)*
* **CYPHT_DEFAULT_SMTP_PORT** : Default SMTP server port for all users (only makes sense if auth_type is IMAP or POP3) *(default : blank)*
* **CYPHT_DEFAULT_SMTP_TLS** : Default SMTP server encryption for all users (only makes sense if auth_type is IMAP or POP3) *(default : blank)*
* **CYPHT_DEFAULT_SMTP_NO_AUTH** : Whether or not default SMTP server for all users requires authentication (only makes sense if auth_type is IMAP or POP3) *(default : blank)*
* **CYPHT_USER_CONFIG_TYPE** : Where user settings are stored *(default : file)*
* **CYPHT_USER_SETTINGS_DIR** : Directory for storing user settings (only used if user_config_type is file) *(default : /var/lib/hm3/users)*
* **CYPHT_ATTACHMENT_DIR** : Directory for temporarily storing attachments of outgoing messages *(default : /var/lib/hm3/attachments)*
* **CYPHT_APP_DATA_DIR** : Directory for storing module configuration files *(default : /var/lib/hm3/app_data)*
* **CYPHT_DISABLE_ORIGIN_CHECK** : Disable origin header check *(default : false)*
* **CYPHT_ADMIN_USERS** : Comma-delimited list of admin users receiving special rights *(default : blank)*
* **CYPHT_COOKIE_DOMAIN** : Domain to be set in cookie domain property *(default : blank)*
* **CYPHT_DEFAULT_EMAIL_DOMAIN** : Default email domain for users that do not login with full IMAP email address *(default : blank)*
* **CYPHT_REDIRECT_AFTER_LOGIN** : Force redirect to specific page after login *(default : blank)*
* **CYPHT_APP_NAME** : Label that appears to UI *(default : Cypht)*
* **CYPHT_DEFAULT_LANGUAGE** : Default language for users that have not set a language *(default : en)*
* **CYPHT_JS_COMPRESS** : Optionally compress JS resources *(default : false)*
* **CYPHT_CSS_COMPRESS** : Optionally compress CSS resources *(default : false)*
* **CYPHT_ENABLE_MEMCACHED** : Enable memcached to cache data *(default : true)*
* **CYPHT_MEMCACHED_SERVER** : Memcached server *(default : 127.0.0.1)*
* **CYPHT_MEMCACHED_PORT** : Memcached server port *(default : 11211)*
* **CYPHT_MEMCACHED_AUTH** : Enable SASL authentication for memcached *(default : false)*
* **CYPHT_MEMCACHED_USER** : Memcached server SASL authentication username *(default : blank)*
* **CYPHT_MEMCACHED_PASS** : Memcached server SASL authentication password *(default : blank)*
* **CYPHT_ALLOW_LONG_SESSION** : Keep user logged in across multiple browser sessions *(default : false)*
* **CYPHT_LONG_SESSION_LIFETIME** : Number of days users will remain logged in (only used if allow_long_session is true) *(default : 30)*
* **CYPHT_ENCRYPT_AJAX_REQUESTS** : Encrypt AJAX responses (adds 70KB to page load size) *(default : blank)*
* **CYPHT_ENCRYPT_LOCAL_STORAGE** : Encrypt browser local storage (adds 70KB to page load size) *(default : blank)*
* **CYPHT_DISABLE_IP_CHECK** : Disable automatic logout if IP address changes *(default : false)*
* **CYPHT_ALLOW_EXTERNAL_IMAGE_SOURCES** : Allow external images to be loaded when viewing an HTML formatted E-mail message *(default : false)*
* **CYPHT_SINGLE_SERVER_MODE** : Restrict Cypht to single email source and default SMTP server *(default : false)*
* **CYPHT_DISABLE_EMPTY_SUPERGLOBALS** : Do not empty PHP super globals for easier 3rd party integration *(default : false)*
* **CYPHT_DISABLE_OPEN_BASEDIR** : Do not apply open basedir restrictions for easier 3rd party integration *(default : false)*
* **CYPHT_DISABLE_INI_SETTINGS** : Do not tweak ini settings for easier 3rd party integration *(default : false)*
* **CYPHT_DISABLE_FINGERPRINT** : Do not user browser fingerprint for easier 3rd party integration *(default : false)*
* **CYPHT_DB_CONNECTION_TYPE** : Database connection type if database is used for authentication, sessions, or user settings *(default : host)*
* **CYPHT_DB_HOST** : Database host or IP address (only used if db_connection_type is "host") *(default : 127.0.0.1)*
* **CYPHT_DB_SOCKET** : Database socket (only used if db_connection_type is "socket") *(default : /var/lib/mysqld/mysqld.sock)*
* **CYPHT_DB_NAME** : Name of the database *(default : test)*
* **CYPHT_DB_USER** : User for connecting to database *(default : test)*
* **CYPHT_DB_PASS** : Password for user connecting to database *(default : 123456)*
* **CYPHT_DB_DRIVER** : Type of database driver *(default : mysql)*
* **CYPHT_MODULE_CORE** : Enable/disable Cypht core (must always be enabled) *(default : enable)*
* **CYPHT_MODULE_CONTACTS** : Enable/disable support for contacts (requires ldap_contacts, gmail_contacts, or local_contacts to be enabled as well) *(default : enable)*
* **CYPHT_MODULE_LOCAL_CONTACTS** : Enable/disable support for local storage for contacts *(default : enable)*
* **CYPHT_MODULE_LDAP_CONTACTS** : Enable/disable support for LDAP server contacts *(default : disable)*
* **CYPHT_MODULE_GMAIL_CONTACTS** : Enable/disable support for read-only Gmail contacts *(default : disable)*
* **CYPHT_MODULE_FEEDS** : Enable/disable support for RSS/ATOM feed *(default : enable)*
* **CYPHT_MODULE_POP3** : Enable/disable support for POP3 email accounts *(default : enable)*
* **CYPHT_MODULE_IMAP** : Enable/disable support for IMAP email accounts *(default : enable)*
* **CYPHT_MODULE_2FA** : Enable/disable support for two-factor authentication using TOTP *(default : disable)*
* **CYPHT_MODULE_SMTP** : Enable/disable support for outbound email via SMTP *(default : enable)*
* **CYPHT_MODULE_ACCOUNT** : Enable/disable support for creating accounts and user password updates (only used if auth_type is DB) *(default : enable)*
* **CYPHT_MODULE_IDLE_TIMER** : Enable/disable support for automatic logout when idle *(default : enable)*
* **CYPHT_MODULE_CALENDAR** : Enable/disable support for basic calendar *(default : enable)*
* **CYPHT_MODULE_THEMES** : Enable/disable support for updating UI via css *(default : enable)*
* **CYPHT_MODULE_NUX** : Enable/disable support for new user experience (common email services and development updates) *(default : enable)*
* **CYPHT_MODULE_DEVELOPER** : Enable/disable support for resources and install details for debugging *(default : enable)*
* **CYPHT_MODULE_GITHUB** : Enable/disable support for Github repository tracking *(default : disable)*
* **CYPHT_MODULE_RECAPTCHA** : Enable/disable support for Recaptcha on login *(default : disable)*
* **CYPHT_MODULE_WORDPRESS** : Enable/disable support for WordPress.com notifications *(default : disable)*
* **CYPHT_MODULE_HISTORY** : Enable/disable support for list of message read since login *(default : enable)*
* **CYPHT_MODULE_SAVED_SEARCHES** : Enable/disable support for saving and re-running searches easily *(default : enable)*
* **CYPHT_MODULE_NASA** : Enable/disable support for NASA Astronomy Picture of the Day *(default : disable)*
* **CYPHT_MODULE_PROFILES** : Enable/disable support for  profiles setting reply-to, name, and signatures *(default : enable)*
* **CYPHT_MODULE_INLINE_MESSAGE** : Enable/disable support for viewing messages in an inline reading-pane rather than new page *(default : enable)*
* **CYPHT_MODULE_IMAP_FOLDERS** : Enable/disable support for adding/renaming/deleting folders in IMAP accounts *(default : enable)*
* **CYPHT_MODULE_KEYBOARD_SHORTCUTS** : Enable/disable support for keyboard shortcuts for navigations and actions *(default : enable)*
* **CYPHT_MODULE_SITE** : Enable/disable support for site-specific overrides (without hacking core code) *(default : disable)*
* **CYPHT_MODULE_DYNAMIC_LOGIN** : Enable/disable support for authenticating against populate mail services (only used if auth_type is dynamic) *(default : disable)*
* **CYPHT_MODULE_API_LOGIN** : Enable/disable support for API based login that returns JSON response *(default : disable)*
* **CYPHT_API_LOGIN_KEY** : API key for api login *(default : blank)*
* **CYPHT_MODULE_RECOVER_SETTINGS** : Enable/disable support for recovering encrypted user settings after IMAP/POP3 password change *(default : disable)*
* **CYPHT_MODULE_HELLO_WORLD** : Enable/disable support for the example module set with lots of comments *(default : disable)*
* **CYPHT_MODULE_DESKTOP_NOTIFICATIONS** : Enable/disable support for desktop notifications *(default : disable)*
* **CYPHT_DEFAULT_SETTING_NO_PASSWORD_SAVE** : Default for saving passwords between logins *(default : false)*
* **CYPHT_DEFAULT_SETTING_IMAP_PER_PAGE** : Default for number of messages per page for IMAP folders *(default : 20)*
* **CYPHT_DEFAULT_SETTING_SIMPLE_MSG_PARTS** : Default for IMAP message structure detail on message view page *(default : false)*
* **CYPHT_DEFAULT_SETTING_MSG_PART_ICONS** : Default for showing icons for each IMAP message part type *(default : true)*
* **CYPHT_DEFAULT_SETTING_TEXT_ONLY** : Default for preferring text part when viewing a message *(default : false)*
* **CYPHT_DEFAULT_SETTING_SENT_PER_SOURCE** : Default for per-source max for combined sent view *(default : 20)*
* **CYPHT_DEFAULT_SETTING_SENT_SINCE** : Default for per-source time limit for combined sent view *(default : '-1 week')*
* **CYPHT_DEFAULT_SETTING_SHOW_LIST_ICONS** : Default for displaying source icons in message lists *(default : true)*
* **CYPHT_DEFAULT_SETTING_START_PAGE** : Default for redirect page after login *(default : none)*
* **CYPHT_DEFAULT_SETTING_DISABLE_DELETE_PROMPT** : Default for prompting when deleting something *(default : false)*
* **CYPHT_DEFAULT_SETTING_NO_FOLDER_ICONS** : Default for hiding icons in the folder list *(default : false)*
* **CYPHT_DEFAULT_SETTING_ALL_EMAIL_PER_SOURCE** : Default for per-source max for all email combined view *(default : 20)*
* **CYPHT_DEFAULT_SETTING_ALL_EMAIL_SINCE** : Default for per-source time limit for all email combined view *(default : '-1 week')*
* **CYPHT_DEFAULT_SETTING_ALL_SINCE** : Default for per-source time limit for everything combined view *(default : '-1 week')*
* **CYPHT_DEFAULT_SETTING_ALL_PER_SOURCE** : Default for per-source max for everything combined view *(default : 20)*
* **CYPHT_DEFAULT_SETTING_UNREAD_PER_SOURCE** : Default for per-source max for unread combined view *(default : 20)*
* **CYPHT_DEFAULT_SETTING_FLAGGED_PER_SOURCE** : Default for per-source max for flagged combined view *(default : 20)*
* **CYPHT_DEFAULT_SETTING_FLAGGED_SINCE** : Default for per-source time limit for flagged combined view *(default : '-1 week')*
* **CYPHT_DEFAULT_SETTING_UNREAD_SINCE** : Default for per-source time limit for unread combined view *(default : '-1 week')*
* **CYPHT_DEFAULT_SETTING_TIMEZONE** : Default for timezone used to display dates *(default : 'UTC')*
* **CYPHT_DEFAULT_SETTING_LIST_STYLE** : Default for message list format *(default : 'email_style')*
* **CYPHT_DEFAULT_SETTING_LANGUAGE** : Default for interface language *(default : 'en')*
* **CYPHT_DEFAULT_SETTING_UNREAD_EXCLUDE_FEEDS** : Default for hiding news feed items from unread combined view *(default : false)*
* **CYPHT_DEFAULT_SETTING_FEED_LIMIT** : Default for per-source max for news feeds *(default : 20)*
* **CYPHT_DEFAULT_SETTING_FEED_SINCE** : Default for per-source time limit for news feeds *(default : '-1 week')*
* **CYPHT_DEFAULT_SETTING_SMTP_COMPOSE_TYPE** : Default for plain text or HTML formatted email on compose page *(default : 0)*
* **CYPHT_DEFAULT_SETTING_SMTP_AUTO_BCC** : Default for automatically BCCing sender on outbound email *(default : false)*
* **CYPHT_DEFAULT_SETTING_THEME** : Default for UI theme *(default : 'default')*
* **CYPHT_DEFAULT_SETTING_UNREAD_EXCLUDE_WORDPRESS** : Default for hiding WordPress notifications from the unread combined view *(default : false)*
* **CYPHT_DEFAULT_SETTING_WORDPRESS_SINCE** : Default for time limit for WordPress notifications *(default : '-1 week')*
* **CYPHT_DEFAULT_SETTING_UNREAD_EXCLUDE_GITHUB** : Default for hiding GitHub notifications from the unread combined view *(default : false)*
* **CYPHT_DEFAULT_SETTING_GITHUB_LIMIT** : Default for per-source max for GitHub notifications *(default : 20)*
* **CYPHT_DEFAULT_SETTING_GITHUB_SINCE** : Default for time limit for GitHub notifications *(default : '-1 weeks')*
* **CYPHT_DEFAULT_SETTING_INLINE_MESSAGE** : Default for displaying message details inline from message list *(default : false)*
* **CYPHT_DEFAULT_SETTING_ENABLE_KEYBOARD_SHORTCUTS** : Default for enabling keyboard shortcuts *(default : 1)*

