/obj/structure/closet/secure_closet/quartermaster/Initialize()
	new /obj/item/clothing/suit/hooded/wintercoat/cargo/head(src)
	new /obj/item/gun/energy/disabler/head(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/clothing/under/misc/parade/qm(src)
	new /obj/item/clothing/under/rank/cargo/qm/dark(src)
	new /obj/item/clothing/under/rank/cargo/qm/turtle(src)
	new /obj/item/clothing/suit/qm(src)
	. = ..()

/obj/structure/closet/secure_closet/engineering_chief/Initialize()
	new /obj/item/clothing/suit/hooded/wintercoat/engineering/head(src)
	new /obj/item/storage/lockbox/medal/ce(src)
	new /obj/item/clothing/under/rank/engineering/chief_engineer/hazard(src)
	. = ..()

/obj/structure/closet/secure_closet/chief_medical/Initialize()
	new /obj/item/storage/belt/medical/surgeryfilled(src)
	new /obj/item/clothing/under/rank/medical/chief_medical_officer/triage(src)
	new /obj/item/clothing/glasses/sunglasses/chemical(src)
	new /obj/item/clothing/suit/hooded/wintercoat/medical/head(src)
	new /obj/item/gun/syringe/rifle(src)
	new /obj/item/clothing/head/beret/cmo(src)
	new /obj/item/storage/lockbox/medal/cmo(src)
	. = ..()

/obj/structure/closet/secure_closet/research_director/Initialize()
	new /obj/item/clothing/suit/hooded/wintercoat/science/head(src)
	new /obj/item/gun/energy/e_gun/homedef(src)
	new /obj/item/clothing/suit/neocoat/rd(src)
	new /obj/item/clothing/suit/toggle/labcoat/rd(src)
	new /obj/item/clothing/glasses/hud/diagnostic/sunglasses(src)
	. = ..()

/obj/structure/closet/secure_closet/captains/Initialize()
	. = ..()

/obj/structure/closet/secure_closet/hop/Initialize()
	new /obj/item/clothing/suit/hooded/wintercoat/captain/hop(src)
	new /obj/item/clothing/under/misc/parade/hop(src)
	new /obj/item/gun/energy/e_gun/hop(src)
	new /obj/item/clothing/suit/armor/hopcoat(src)
	new /obj/item/clothing/suit/armor/hopjacket(src)
	new /obj/item/clothing/under/rank/command/head_of_personnel/formal(src)

	//Random ID
	var randomid = pick(subtypesof(/obj/item/card/id/random))
	new randomid(src)
	. = ..()

/obj/structure/closet/secure_closet/hos/Initialize()
	new /obj/item/clothing/suit/hooded/wintercoat/security/head(src)
	new /obj/item/clothing/suit/armor/hos/peacoat(src)
	. = ..()

//Medalboxes, was apparently removed at one point? Either way, it was supposed to be ported over.
/obj/item/storage/lockbox/medal/cmo
	name = "Chief Medical Officer's medal box"
	desc = "A locked box used to store medals to be given to those exhibiting excellence in the medical field."
	req_access = list(ACCESS_CMO)

/obj/item/storage/lockbox/medal/cmo/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/clothing/accessory/medal/ribbon/cmo(src)
	new /obj/item/clothing/accessory/medal/med_medal
	new /obj/item/clothing/accessory/medal/med_medal2

/obj/item/clothing/accessory/medal/ribbon/cmo
	name = "\"medical excellence\" award"
	desc = "An award bestowed only upon those who have proven themselves a worthy follower of the Hippocratic Oath, which does not include 'Do no harm'."
	icon = 'ModularTegustation/Teguicons/tegu_medals.dmi'
	icon_state = "medical"

/obj/item/storage/lockbox/medal/ce
	name = "Chief Engineer's medal box"
	desc = "A locked box used to store medals to be given to those exhibiting excellence in Engineering or Atmospherics."
	req_access = list(ACCESS_CE)

/obj/item/storage/lockbox/medal/ce/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/clothing/accessory/medal/ribbon/ce(src)

/obj/item/clothing/accessory/medal/ribbon/ce
	name = "\"engineer of the shift\" award"
	desc = "An award bestowed only upon those who have mastered the craft of Engineering or Atmospherics, Glory to Engitopia."
	icon = 'ModularTegustation/Teguicons/tegu_medals.dmi'
	icon_state = "engineering"

// Overwrites the update_overlays on cards.dm to ensure tegu jobs get their icons.
/obj/item/card/id/update_overlays()
	. = ..()
	if(!uses_overlays)
		return
	cached_flat_icon = null
	var/job = assignment ? ckey(GetJobName()) : null
	if(registered_name && registered_name != "Captain")
		. += mutable_appearance(icon, "assigned")
	if(job)
		. += mutable_appearance(return_icon_job(), "id[job]") // Using a return proc that points to your job's icon. Was "job_icon", but this is moved to the job itself as "id_icon"
