local lgi = require("lgi")
local Gtk = lgi.require("Gtk", "3.0")
local Gio = lgi.Gio

local app = Gtk.Application {
	application_id = "org.example.App"
}

function app:on_startup()
	local window = require "window"
	window:set_application(self)
end

function app:on_activate()
	self.active_window:present()
end

app:run(arg)