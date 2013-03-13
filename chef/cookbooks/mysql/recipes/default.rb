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
    command "/etc/init.d/mysql start; mysql -u root < /tmp/mysql.user.sql; /etc/init.d/mysql stop"
    action :nothing
end

service "mysql" do
    action [:disable, :stop]
end
