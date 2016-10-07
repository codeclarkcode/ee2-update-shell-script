# ExpressionEngine 2 Update Shell Script

Use this script through SSH to automate the task of moving files, fixing permissions, etc. when updating your ExpressionEngine 2 website to the latest version.

To Begin:

1. Upload the unzipped new version folder (named `ExpressionEngine2.xx.x`) to your site's root folder.
2. Login to your website server via SSH.
3. Change directory (`cd`) to your site's root folder.
4. Run the update script!

After Updating (optional):

* After completing the database update by visiting your site's control panel you can remove the `installer` folder with:
```
rm -R system/installer
```

* If you've backed up your old files and no longer need them on your web server, you can remove them with:
```
rm admin.php_old
rm index.php_old
rm -R images_old
rm -R system_old
rm -R themes_old
```
