#!/bin/sh

CYPHT_CONFIG_FILE=/usr/local/share/cypht/hm3.ini

#
# Update ini file based on environment variables (only if the specific environment variable is set)
#

# General Settings
if [ ! -z ${CYPHT_SESSION_TYPE+x} ]; then sed -i "s/session_type=.*/session_type=${CYPHT_SESSION_TYPE}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_AUTH_TYPE+x} ]; then sed -i "s/auth_type=.*/auth_type=${CYPHT_AUTH_TYPE}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_LDAP_AUTH_SERVER+x} ]; then sed -i "s/ldap_auth_server=.*/ldap_auth_server=${CYPHT_LDAP_AUTH_SERVER}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_LDAP_AUTH_PORT+x} ]; then sed -i "s/ldap_auth_port=.*/ldap_auth_port=${CYPHT_LDAP_AUTH_PORT}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_LDAP_AUTH_TLS+x} ]; then sed -i "s/ldap_auth_tls=.*/ldap_auth_tls=${CYPHT_LDAP_AUTH_TLS}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_LDAP_AUTH_BASE_DN+x} ]; then sed -i "s/ldap_auth_base_dn=.*/ldap_auth_base_dn=${CYPHT_LDAP_AUTH_BASE_DN}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_IMAP_AUTH_NAME+x} ]; then sed -i "s/imap_auth_name=.*/imap_auth_name=${CYPHT_IMAP_AUTH_NAME}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_IMAP_AUTH_SERVER+x} ]; then sed -i "s/imap_auth_server=.*/imap_auth_server=${CYPHT_IMAP_AUTH_SERVER}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_IMAP_AUTH_PORT+x} ]; then sed -i "s/imap_auth_port=.*/imap_auth_port=${CYPHT_IMAP_AUTH_PORT}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_IMAP_AUTH_TLS+x} ]; then sed -i "s/imap_auth_tls=.*/imap_auth_tls=${CYPHT_IMAP_AUTH_TLS}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_POP3_AUTH_NAME+x} ]; then sed -i "s/pop3_auth_name=.*/pop3_auth_name=${CYPHT_POP3_AUTH_NAME}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_POP3_AUTH_SERVER+x} ]; then sed -i "s/pop3_auth_server=.*/pop3_auth_server=${CYPHT_POP3_AUTH_SERVER}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_POP3_AUTH_PORT+x} ]; then sed -i "s/pop3_auth_port=.*/pop3_auth_port=${CYPHT_POP3_AUTH_PORT}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_POP3_AUTH_TLS+x} ]; then sed -i "s/pop3_auth_tls=.*/pop3_auth_tls=${CYPHT_POP3_AUTH_TLS}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DEFAULT_SMTP_NAME+x} ]; then sed -i "s/default_smtp_name=.*/default_smtp_name=${CYPHT_DEFAULT_SMTP_NAME}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DEFAULT_SMTP_SERVER+x} ]; then sed -i "s/default_smtp_server=.*/default_smtp_server=${CYPHT_DEFAULT_SMTP_SERVER}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DEFAULT_SMTP_PORT+x} ]; then sed -i "s/default_smtp_port=.*/default_smtp_port=${CYPHT_DEFAULT_SMTP_PORT}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DEFAULT_SMTP_TLS+x} ]; then sed -i "s/default_smtp_tls=.*/default_smtp_tls=${CYPHT_DEFAULT_SMTP_TLS}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DEFAULT_SMTP_NO_AUTH+x} ]; then sed -i "s/default_smtp_no_auth=.*/default_smtp_no_auth=${CYPHT_DEFAULT_SMTP_NO_AUTH}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_USER_CONFIG_TYPE+x} ]; then sed -i "s/user_config_type=.*/user_config_type=${CYPHT_USER_CONFIG_TYPE}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_USER_SETTINGS_DIR+x} ]; then sed -i "s!user_settings_dir=.*!user_settings_dir=${CYPHT_USER_SETTINGS_DIR}!" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_ATTACHMENT_DIR+x} ]; then sed -i "s/attachment_dir=.*/attachment_dir=${CYPHT_ATTACHMENT_DIR}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_APP_DATA_DIR+x} ]; then sed -i "s/app_data_dir=.*/app_data_dir=${CYPHT_APP_DATA_DIR}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DISABLE_ORIGIN_CHECK+x} ]; then sed -i "s/disable_origin_check=.*/disable_origin_check=${CYPHT_DISABLE_ORIGIN_CHECK}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_ADMIN_USERS+x} ]; then sed -i "s/admin_users=.*/admin_users=${CYPHT_ADMIN_USERS}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_COOKIE_DOMAIN+x} ]; then sed -i "s/cookie_domain=.*/cookie_domain=${CYPHT_COOKIE_DOMAIN}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DEFAULT_EMAIL_DOMAIN+x} ]; then sed -i "s/default_email_domain=.*/default_email_domain=${CYPHT_DEFAULT_EMAIL_DOMAIN}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_REDIRECT_AFTER_LOGIN+x} ]; then sed -i "s/redirect_after_login=.*/redirect_after_login=${CYPHT_REDIRECT_AFTER_LOGIN}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_APP_NAME+x} ]; then sed -i "s/app_name=.*/app_name=${CYPHT_APP_NAME}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DEFAULT_LANGUAGE+x} ]; then sed -i "s/default_language=.*/default_language=${CYPHT_DEFAULT_LANGUAGE}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_JS_COMPRESS+x} ]; then sed -i "s/js_compress=.*/js_compress=${CYPHT_JS_COMPRESS}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_CSS_COMPRESS+x} ]; then sed -i "s/css_compress=.*/css_compress=${CYPHT_CSS_COMPRESS}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_ENABLE_MEMCACHED+x} ]; then sed -i "s/enable_memcached=.*/enable_memcached=${CYPHT_ENABLE_MEMCACHED}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_MEMCACHED_SERVER+x} ]; then sed -i "s/memcached_server=.*/memcached_server=${CYPHT_MEMCACHED_SERVER}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_MEMCACHED_PORT+x} ]; then sed -i "s/memcached_port=.*/memcached_port=${CYPHT_MEMCACHED_PORT}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_MEMCACHED_AUTH+x} ]; then sed -i "s/memcached_auth=.*/memcached_auth=${CYPHT_MEMCACHED_AUTH}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_MEMCACHED_USER+x} ]; then sed -i "s/memcached_user=.*/memcached_user=${CYPHT_MEMCACHED_USER}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_MEMCACHED_PASS+x} ]; then sed -i "s/memcached_pass=.*/memcached_pass=${CYPHT_MEMCACHED_PASS}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_ALLOW_LONG_SESSION+x} ]; then sed -i "s/allow_long_session=.*/allow_long_session=${CYPHT_ALLOW_LONG_SESSION}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_LONG_SESSION_LIFETIME+x} ]; then sed -i "s/long_session_lifetime=.*/long_session_lifetime=${CYPHT_LONG_SESSION_LIFETIME}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_ENCRYPT_AJAX_REQUESTS+x} ]; then sed -i "s/encrypt_ajax_requests=.*/encrypt_ajax_requests=${CYPHT_ENCRYPT_AJAX_REQUESTS}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_ENCRYPT_LOCAL_STORAGE+x} ]; then sed -i "s/encrypt_local_storage=.*/encrypt_local_storage=${CYPHT_ENCRYPT_LOCAL_STORAGE}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DISABLE_IP_CHECK+x} ]; then sed -i "s/disable_ip_check=.*/disable_ip_check=${CYPHT_DISABLE_IP_CHECK}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_SINGLE_SERVER_MODE+x} ]; then sed -i "s/single_server_mode=.*/single_server_mode=${CYPHT_SINGLE_SERVER_MODE}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DISABLE_EMPTY_SUPERGLOBALS+x} ]; then sed -i "s/disable_empty_superglobals=.*/disable_empty_superglobals=${CYPHT_DISABLE_EMPTY_SUPERGLOBALS}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DISABLE_OPEN_BASEDIR+x} ]; then sed -i "s/disable_open_basedir=.*/disable_open_basedir=${CYPHT_DISABLE_OPEN_BASEDIR}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DISABLE_INI_SETTINGS+x} ]; then sed -i "s/disable_ini_settings=.*/disable_ini_settings=${CYPHT_DISABLE_INI_SETTINGS}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DISABLE_FINGERPRINT+x} ]; then sed -i "s/disable_fingerprint=.*/disable_fingerprint=${CYPHT_DISABLE_FINGERPRINT}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DB_CONNECTION_TYPE+x} ]; then sed -i "s/db_connection_type=.*/db_connection_type=${CYPHT_DB_CONNECTION_TYPE}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DB_HOST+x} ]; then sed -i "s/db_host=.*/db_host=${CYPHT_DB_HOST}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DB_SOCKET+x} ]; then sed -i "s/db_socket=.*/db_socket=${CYPHT_DB_SOCKET}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DB_NAME+x} ]; then sed -i "s/db_name=.*/db_name=${CYPHT_DB_NAME}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DB_USER+x} ]; then sed -i "s/db_user=.*/db_user=${CYPHT_DB_USER}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DB_PASS+x} ]; then sed -i "s/db_pass=.*/db_pass=${CYPHT_DB_PASS}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_DB_DRIVER+x} ]; then sed -i "s/db_driver=.*/db_driver=${CYPHT_DB_DRIVER}/" ${CYPHT_CONFIG_FILE}; fi
if [ ! -z ${CYPHT_API_LOGIN_KEY+x} ]; then sed -i "s/api_login_key=.*/api_login_key=${CYPHT_API_LOGIN_KEY}/" ${CYPHT_CONFIG_FILE}; fi

# Modules

enable_disable_module() {
    local module=${1}
    local setting=${2}
    # For some reason, "(; )?" isn't working but ";\{0,1\} \{0,1\}" does the same thing
    if [ ${setting} = enable ]
    then
        sed -i "s/^;\{0,1\} \{0,1\}modules\[\]=${module}/modules[]=${module}/" ${CYPHT_CONFIG_FILE}
        if [ ${module} = api_login ]; then sed -i "s/;\{0,1\} \{0,1\}api_login_key=/api_login_key=/" ${CYPHT_CONFIG_FILE}; fi
    else
        sed -i "s/^;\{0,1\} \{0,1\}modules\[\]=${module}/; modules[]=${module}/" ${CYPHT_CONFIG_FILE}
        if [ ${module} = api_login ]; then sed -i "s/;\{0,1\} \{0,1\}api_login_key=/; api_login_key=/" ${CYPHT_CONFIG_FILE}; fi
    fi
}

if [ ! -z ${CYPHT_MODULE_CORE+x} ]; then enable_disable_module core ${CYPHT_MODULE_CORE}; fi
if [ ! -z ${CYPHT_MODULE_CONTACTS+x} ]; then enable_disable_module contacts ${CYPHT_MODULE_CONTACTS}; fi
if [ ! -z ${CYPHT_MODULE_LOCAL_CONTACTS+x} ]; then enable_disable_module local_contacts ${CYPHT_MODULE_LOCAL_CONTACTS}; fi
if [ ! -z ${CYPHT_MODULE_LDAP_CONTACTS+x} ]; then enable_disable_module ldap_contacts ${CYPHT_MODULE_LDAP_CONTACTS}; fi
if [ ! -z ${CYPHT_MODULE_GMAIL_CONTACTS+x} ]; then enable_disable_module gmail_contacts ${CYPHT_MODULE_GMAIL_CONTACTS}; fi
if [ ! -z ${CYPHT_MODULE_FEEDS+x} ]; then enable_disable_module feeds ${CYPHT_MODULE_FEEDS}; fi
if [ ! -z ${CYPHT_MODULE_POP3+x} ]; then enable_disable_module pop3 ${CYPHT_MODULE_POP3}; fi
if [ ! -z ${CYPHT_MODULE_IMAP+x} ]; then enable_disable_module imap ${CYPHT_MODULE_IMAP}; fi
if [ ! -z ${CYPHT_MODULE_2FA+x} ]; then enable_disable_module 2fa ${CYPHT_MODULE_2FA}; fi
if [ ! -z ${CYPHT_MODULE_SMTP+x} ]; then enable_disable_module smtp ${CYPHT_MODULE_SMTP}; fi
if [ ! -z ${CYPHT_MODULE_ACCOUNT+x} ]; then enable_disable_module account ${CYPHT_MODULE_ACCOUNT}; fi
if [ ! -z ${CYPHT_MODULE_IDLE_TIMER+x} ]; then enable_disable_module idle_timer ${CYPHT_MODULE_IDLE_TIMER}; fi
if [ ! -z ${CYPHT_MODULE_CALENDAR+x} ]; then enable_disable_module calendar ${CYPHT_MODULE_CALENDAR}; fi
if [ ! -z ${CYPHT_MODULE_THEMES+x} ]; then enable_disable_module themes ${CYPHT_MODULE_THEMES}; fi
if [ ! -z ${CYPHT_MODULE_NUX+x} ]; then enable_disable_module nux ${CYPHT_MODULE_NUX}; fi
if [ ! -z ${CYPHT_MODULE_DEVELOPER+x} ]; then enable_disable_module developer ${CYPHT_MODULE_DEVELOPER}; fi
if [ ! -z ${CYPHT_MODULE_GITHUB+x} ]; then enable_disable_module github ${CYPHT_MODULE_GITHUB}; fi
if [ ! -z ${CYPHT_MODULE_RECAPTCHA+x} ]; then enable_disable_module recaptcha ${CYPHT_MODULE_RECAPTCHA}; fi
if [ ! -z ${CYPHT_MODULE_WORDPRESS+x} ]; then enable_disable_module wordpress ${CYPHT_MODULE_WORDPRESS}; fi
if [ ! -z ${CYPHT_MODULE_HISTORY+x} ]; then enable_disable_module history ${CYPHT_MODULE_HISTORY}; fi
if [ ! -z ${CYPHT_MODULE_SAVED_SEARCHES+x} ]; then enable_disable_module saved_searches ${CYPHT_MODULE_SAVED_SEARCHES}; fi
if [ ! -z ${CYPHT_MODULE_NASA+x} ]; then enable_disable_module nasa ${CYPHT_MODULE_NASA}; fi
if [ ! -z ${CYPHT_MODULE_PROFILES+x} ]; then enable_disable_module profiles ${CYPHT_MODULE_PROFILES}; fi
if [ ! -z ${CYPHT_MODULE_INLINE_MESSAGE+x} ]; then enable_disable_module inline_message ${CYPHT_MODULE_INLINE_MESSAGE}; fi
if [ ! -z ${CYPHT_MODULE_IMAP_FOLDERS+x} ]; then enable_disable_module imap_folders ${CYPHT_MODULE_IMAP_FOLDERS}; fi
if [ ! -z ${CYPHT_MODULE_KEYBOARD_SHORTCUTS+x} ]; then enable_disable_module keyboard_shortcuts ${CYPHT_MODULE_KEYBOARD_SHORTCUTS}; fi
if [ ! -z ${CYPHT_MODULE_SITE+x} ]; then enable_disable_module site ${CYPHT_MODULE_SITE}; fi
if [ ! -z ${CYPHT_MODULE_DYNAMIC_LOGIN+x} ]; then enable_disable_module dynamic_login ${CYPHT_MODULE_DYNAMIC_LOGIN}; fi
if [ ! -z ${CYPHT_MODULE_API_LOGIN+x} ]; then enable_disable_module api_login ${CYPHT_MODULE_API_LOGIN}; fi
if [ ! -z ${CYPHT_MODULE_RECOVER_SETTINGS+x} ]; then enable_disable_module recover_settings ${CYPHT_MODULE_RECOVER_SETTINGS}; fi
if [ ! -z ${CYPHT_MODULE_HELLO_WORLD+x} ]; then enable_disable_module hello_world ${CYPHT_MODULE_HELLO_WORLD}; fi

#
# Wait for database to be ready then setup tables for sessions, authentication, and settings as needed
#
session_type=$(sed -n 's/session_type=//p' ${CYPHT_CONFIG_FILE})
auth_type=$(sed -n 's/auth_type=//p' ${CYPHT_CONFIG_FILE})
user_config_type=$(sed -n 's/user_config_type=//p' ${CYPHT_CONFIG_FILE})
db_host=$(sed -n 's/db_host=//p' ${CYPHT_CONFIG_FILE})
db_name=$(sed -n 's/db_name=//p' ${CYPHT_CONFIG_FILE})
db_user=$(sed -n 's/db_user=//p' ${CYPHT_CONFIG_FILE})
db_pass=$(sed -n 's/db_pass=//p' ${CYPHT_CONFIG_FILE})
db_driver=$(sed -n 's/db_driver=//p' ${CYPHT_CONFIG_FILE})
if [ "${session_type}" = "DB" ] || [ "${auth_type}" = "DB" ] || [ "${user_config_type}" = "DB" ]
then
    sed -i "s/CYPHT_SESSION_TYPE/${session_type}/" /tmp/cypht_setup_database.php
    sed -i "s/CYPHT_AUTH_TYPE/${auth_type}/" /tmp/cypht_setup_database.php
    sed -i "s/CYPHT_USER_CONFIG_TYPE/${user_config_type}/" /tmp/cypht_setup_database.php
    sed -i "s/CYPHT_DB_HOST/${db_host}/" /tmp/cypht_setup_database.php
    sed -i "s/CYPHT_DB_NAME/${db_name}/" /tmp/cypht_setup_database.php
    sed -i "s/CYPHT_DB_USER/${db_user}/" /tmp/cypht_setup_database.php
    sed -i "s/CYPHT_DB_PASS/${db_pass}/" /tmp/cypht_setup_database.php
    sed -i "s/CYPHT_DB_DRIVER/${db_driver}/" /tmp/cypht_setup_database.php
    php /tmp/cypht_setup_database.php
fi

#
# Additional tasks based on the newly-configured settings
#

# Settings Location - create directory if config type is "file"
user_config_type=$(sed -n 's/user_config_type=//p' ${CYPHT_CONFIG_FILE})
user_settings_dir=$(sed -n 's/user_settings_dir=//p' ${CYPHT_CONFIG_FILE})
if [ "${user_config_type}" = "file" ]
then
    mkdir -p ${user_settings_dir}
    chown www-data:www-data ${user_settings_dir}
fi

# Attachment Location - create directory
attachment_dir=$(sed -n 's/attachment_dir=//p' ${CYPHT_CONFIG_FILE})
mkdir -p ${attachment_dir}
chown www-data:www-data ${attachment_dir}

# Application Data Location - create directory
app_data_dir=$(sed -n 's/app_data_dir=//p' ${CYPHT_CONFIG_FILE})
mkdir -p ${app_data_dir}
chown www-data:www-data ${app_data_dir}

#
# Generate the run-time configuration
#
cd /usr/local/share/cypht
php ./scripts/config_gen.php

#
# Enable the program in the web-server
#
rm -r /var/www
ln -s /usr/local/share/cypht/site /var/www

#
# Create user account in database (or change password if user already exists)
#
php ./scripts/create_account.php ${CYPHT_AUTH_USERNAME} ${CYPHT_AUTH_PASSWORD}
#OR maybe run the following if the user already exists...
#php ./scripts/update_password.php ${CYPHT_AUTH_USERNAME} ${CYPHT_AUTH_PASSWORD}

#
# Close out tasks
#

# now that we're definitely done writing configuration, let's clear out the relevant environment variables (so that stray "phpinfo()" calls don't leak secrets from our code)
#for e in "${envs[@]}"; do
#    unset "$e"
#done

# Start supervisord and services
/usr/bin/supervisord -c /etc/supervisord.conf

exec "$@"
