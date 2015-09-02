module("luci.controller.addtest",package.seeall)

function index()
    entry({"admin","system","addtest"},alias("admin","system","addtest","set"),_("AddTest"),99).index=true
    entry({"admin","system","addtest","set"},cbi("addtest"),_("Set"),1)
    entry({"admin","system","addtest","info"},call("action_info"),_("Info"),2)
end

function action_info()
    if not nixio.fs.access("/tmp/addtest") then
        return
    end

    local info = nixio.fs.readfile("/tmp/addtest")
    luci.template.render("addtest_info",{info=info})
end
