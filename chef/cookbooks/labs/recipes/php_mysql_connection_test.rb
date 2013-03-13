cookbook_file "/var/www/html/index.php" do
    source "php_mysql_connection_test.php"
    owner "root"
    group "root"
    mode 00644
end
