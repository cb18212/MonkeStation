/datum/design/component/security_record
	name = "Security Record Component"
	id = "comp_sec"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/glass = 500, /datum/material/copper = 1500)
	build_path = /obj/item/circuit_component/sec_status
	category = list(WIREMOD_CIRCUITRY, "initial", "Security")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/component/send_data
	name = "Send Data Component"
	id = "comp_data_send"
	build_path = /obj/item/circuit_component/send_data
	category = list(WIREMOD_CIRCUITRY, WIREMOD_LOGIC_COMPONENTS, WIREMOD_OUTPUT_COMPONENTS)

/datum/design/component/receive_data
	name = "Receive Data Component"
	id = "comp_data_recv"
	build_path = /obj/item/circuit_component/receive_data
	category = list(WIREMOD_CIRCUITRY, WIREMOD_LOGIC_COMPONENTS, WIREMOD_INPUT_COMPONENTS)

/datum/design/component/pinpointer
	name = "Proximity Pinpointer Component"
	id = "comp_pinpointer"
	build_path = /obj/item/circuit_component/pinpointer
	category = list(WIREMOD_CIRCUITRY, WIREMOD_INPUT_COMPONENTS)

/datum/design/component/viewer
	name = "Viewer Component"
	id = "comp_viewer"
	build_path = /obj/item/circuit_component/viewer
	category = list(WIREMOD_CIRCUITRY, WIREMOD_INPUT_COMPONENTS)

/datum/design/component/find_by_name
	name = "Find Entity By Name Component"
	id = "comp_find_name"
	build_path = /obj/item/circuit_component/find_name
	category = list(WIREMOD_CIRCUITRY, WIREMOD_LIST_COMPONENTS)

/datum/design/circuit_goggles_shell
	name = "Circuit Goggles Shell"
	desc = "A wearable shell."
	id = "circuit_goggles_shell"
	build_path = /obj/item/clothing/glasses/circuit_goggles
	materials = list(/datum/material/glass = 3000, /datum/material/iron = 5000, /datum/material/copper = 1000)
	build_type = PROTOLATHE | COMPONENT_PRINTER
	category = list(WIREMOD_CIRCUITRY, WIREMOD_SHELLS)
