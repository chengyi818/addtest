require("nixio.fs")

m=Map("addtest",translate("Luci practice"),translate("fat cheng's test"))

s=m:section(TypedSection,"arguments","")
s.addremove=true
s.anonymous=false

enable=s:option(Flag,"enable",translate("Enable"))
interval=s:option(Value,"interval",translate("Interval"))
content=s:option(Value,"content",translate("Content"))

local apply=luci.http.formvalue("cbi.apply")
if apply then
    io.popen("/etc/init.d/addtestd restart")
end

return m
