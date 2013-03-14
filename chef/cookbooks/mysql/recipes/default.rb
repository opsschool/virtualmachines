#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/tmp/mysql.user.sql" do
    source "mysql.user.sql"
    owner "root"
    group "root"
    mode 00400
end

package "mysql-server" do
    action :install
    notifies :run, "execute[set_mysql_users]", :immediately
end

execute "set_mysql_users" do
    command "/etc/init.d/mysqld start; mysql -u root < /tmp/mysql.user.sql; /etc/init.d/mysqld stop"
    action :nothing
end

cookbook_file "/etc/my.cnf" do
    source "my.cnf-nosocket"
    owner "root"
    group "root"
    mode 00444
end

service "mysqld" do
    action [:disable, :stop]
end
