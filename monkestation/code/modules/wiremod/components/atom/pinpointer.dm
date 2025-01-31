/*
	Ported from /tg/station:
	https://github.com/tgstation/tgstation/blob/a82ce8a2c1dee4cd908dfe79e484b255ff9bbe9a/code/modules/wiremod/components/atom/pinpointer.dm
*/

/**
 * # Pinpointer Component
 *
 * Receive the location of a target organism
 */
/obj/item/circuit_component/pinpointer
	display_name = "Proximity Pinpoiner"
	display_desc = "A component that returns the xyz co-ordinates of its entity input, as long as its in view."

	var/datum/port/input/target

	var/datum/port/output/x_pos
	var/datum/port/output/y_pos
	var/datum/port/output/z_pos
	var/datum/port/output/on_error

	var/max_range = 7

	circuit_flags = CIRCUIT_FLAG_INPUT_SIGNAL|CIRCUIT_FLAG_OUTPUT_SIGNAL

/obj/item/circuit_component/pinpointer/Initialize(mapload)
	. = ..()
	target = add_input_port("Target entity", PORT_TYPE_ATOM, FALSE)

	x_pos = add_output_port("X", PORT_TYPE_NUMBER)
	y_pos = add_output_port("Y", PORT_TYPE_NUMBER)
	z_pos = add_output_port("Z", PORT_TYPE_NUMBER)
	on_error = add_output_port("Failed", PORT_TYPE_SIGNAL)

/obj/item/circuit_component/pinpointer/Destroy()
	target = null

	x_pos = null
	y_pos = null
	z_pos = null
	on_error = null
	return ..()

/obj/item/circuit_component/pinpointer/input_received(datum/port/input/port)
	. = ..()
	if(.)
		return


	if(isnull(target.input_value))
		x_pos.set_output(null)
		y_pos.set_output(null)
		z_pos.set_output(null)
		on_error.set_output(COMPONENT_SIGNAL)
		return

	var/atom/target_entity = target.input_value

	if(isInSight(target_entity, loc) && IN_GIVEN_RANGE(loc, target_entity, max_range))
		var/turf/location = get_turf(target_entity)

		x_pos.set_output(location?.x)
		y_pos.set_output(location?.y)
		z_pos.set_output(location?.z)
	else
		x_pos.set_output(null)
		y_pos.set_output(null)
		z_pos.set_output(null)
		on_error.set_output(COMPONENT_SIGNAL)
		return TRUE
