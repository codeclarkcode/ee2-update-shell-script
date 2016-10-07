# Add '_new' and move into root folder
mv ExpressionEngine2.xx.x/admin.php admin.php_new
mv ExpressionEngine2.xx.x/index.php index.php_new
mv ExpressionEngine2.xx.x/images images_new
mv ExpressionEngine2.xx.x/system system_new
mv ExpressionEngine2.xx.x/themes themes_new
rmdir ExpressionEngine2.xx.x

# Copy config files to the appropriate new version folder
rsync system/expressionengine/config/config.php system_new/expressionengine/config/config.php
rsync system/expressionengine/config/database.php system_new/expressionengine/config/database.php

# Copy template files to the appropriate new version folder
# (Exclude the htaccess file that EE creates, but include index.html because that is the name of the default template group file)
rsync -a --exclude=.htaccess system/expressionengine/templates/default_site/* system_new/expressionengine/templates/default_site/

# Copy add-on files to the appropriate new version folder
# (Exclude index.html files that EE uses for 403 forbidden)
rsync -a --exclude=index.html --exclude=.htaccess system/expressionengine/third_party/* system_new/expressionengine/third_party/
rsync -a --exclude=index.html --exclude=.htaccess themes/third_party/* themes_new/third_party/

# Copy image files to the appropriate new version folder
# (Exclude index.html files that EE uses for 403 forbidden)
rsync -a --exclude=index.html --exclude=.htaccess images/avatars/uploads/* images_new/avatars/uploads/
rsync -a --exclude=index.html --exclude=.htaccess images/captchas/* images_new/captchas/
rsync -a --exclude=index.html --exclude=.htaccess images/member_photos/* images_new/member_photos/
rsync -a --exclude=index.html --exclude=.htaccess images/pm_attachments/* images_new/pm_attachments/
rsync -a --exclude=index.html --exclude=.htaccess images/signature_attachments/* images_new/signature_attachments/
rsync -a --exclude=index.html --exclude=.htaccess images/uploads/* images_new/uploads/

# Fix permissions
chmod 666 system_new/expressionengine/config/config.php
chmod 666 system_new/expressionengine/config/database.php
chmod -R 777 system_new/expressionengine/cache
chmod -R 777 system_new/expressionengine/templates
chmod -R 777 images_new/avatars/uploads
chmod -R 777 images_new/captchas
chmod -R 777 images_new/member_photos
chmod -R 777 images_new/pm_attachments
chmod -R 777 images_new/signature_attachments
chmod -R 777 images_new/uploads

# Rename current version to '_old'
mv admin.php admin.php_old
mv index.php index.php_old
mv images images_old
mv system system_old
mv themes themes_old

# Remove the '_new' from the new version
mv admin.php_new admin.php
mv index.php_new index.php
mv images_new images
mv system_new system
mv themes_new themes
