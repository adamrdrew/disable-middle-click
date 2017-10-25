#!/usr/bin/ruby
class DisableMiddleClick
    MAGIC_STRINGS = {
        device_name: "ELAN",
        tab: "\t",
        newline: "\n",
        equals: "=",
        prop_name: "Middle Emulation Enabled",
        prop_id_start: "(",
        prop_id_end: "):",
        prop_off: "1",
    }

    COMMANDS = {
        list_devices: "xinput --list",
        list_props: "xinput --list-props",
        set_prop: "xinput --set-prop"
    }

    def self.findLine(cmd, lineSubstring)
        cmd.split(MAGIC_STRINGS[:newline]).select {|item| item.index(lineSubstring)}.first
    end

    def self.getDeviceID
        touchPad   = self.findLine(`#{COMMANDS[:list_devices]}`, MAGIC_STRINGS[:device_name])
        touchPad.split(MAGIC_STRINGS[:tab])[1].split(MAGIC_STRINGS[:equals]).last
    end

    def self.getPropID(deviceID)
        prop   = self.findLine(`#{COMMANDS[:list_props]} #{deviceID}`, MAGIC_STRINGS[:prop_name])
        prop.split(MAGIC_STRINGS[:prop_id_start]).last.split(MAGIC_STRINGS[:prop_id_end]).first
    end
    
    def self.disable
        deviceID = self.getDeviceID
        propID   = self.getPropID(deviceID)
        `#{COMMANDS[:set_prop]} #{deviceID} #{propID} #{MAGIC_STRINGS[:prop_off]}`
    end

end
DisableMiddleClick.disable