cookbook_file "/etc/hosts" do
    source "broken_hosts"
    owner "root"
    group "root"
    mode 00644
end
