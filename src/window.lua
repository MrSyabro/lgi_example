local lgi = require "lgi"
local Gtk = lgi.Gtk
local Gio = lgi.Gio

local data = lgi.assert(resource:lookup_data("/org/example/App/window.ui", Gio.ResourceLookupFlags.NONE))
local UI = lgi.assert(Gtk.Builder.new_from_string(data:get_data(), data:get_size())).objects

function UI.Window:on_show()
	print("Window show")
	
	self:show()
end

function UI.source_button:on_clicked()
	print("Source button clicked")
	os.execute "xdg-open https://github.com/lgi-devs/lgi"
end

function UI.about_button:on_clicked()
	print("About button clicked")
	local dialog = Gtk.AboutDialog {
		authors = {"Alexandr"},
                transient_for = self,
                modal = true,
		program_name = CONFIG.name,
		version = CONFIG.version,
		website = "https://github.com/MrSyabro/lgi_example"
	}
	dialog:present()
end

return UI.Window