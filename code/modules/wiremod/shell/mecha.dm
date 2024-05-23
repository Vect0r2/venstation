/obj/item/mech_controller
	name = "MOD circuit adapter module"
	desc = "A module shell that allows a circuit to be inserted into, and interface with, a MODsuit."

	//A reference to the shell component
	var/datum/component/shell/shell

/obj/mech_controller/Initialize(mapload)
	. = ..()
	AddComponent( \
		/datum/component/shell, \
		unremovable_circuit_components = list(new /obj/item/circuit_component/bot), \
		capacity = SHELL_CAPACITY_LARGE, \
		shell_flags = SHELL_FLAG_USB_PORT, \
	)
