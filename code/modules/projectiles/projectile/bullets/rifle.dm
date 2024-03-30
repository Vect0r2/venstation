// .223 (M-90gl Carbine)

/obj/projectile/bullet/a223
	name = ".223 bullet"
	damage = 35
	armour_penetration = 30
	wound_bonus = -40

/obj/projectile/bullet/a223/weak //centcom
	damage = 20

/obj/projectile/bullet/a223/phasic
	name = ".223 phasic bullet"
	icon_state = "gaussphase"
	damage = 30
	armour_penetration = 100
	projectile_phasing =  PASSTABLE | PASSGLASS | PASSGRILLE | PASSCLOSEDTURF | PASSMACHINE | PASSSTRUCTURE | PASSDOORS

// .310 Strilka (Sakhno Rifle)

/obj/projectile/bullet/strilka310
	name = ".310 Strilka bullet"
	damage = 60
	armour_penetration = 10
	wound_bonus = -45
	wound_falloff_tile = 0

/obj/projectile/bullet/strilka310/surplus
	name = ".310 Strilka surplus bullet"
	weak_against_armour = TRUE //this is specifically more important for fighting carbons than fighting noncarbons. Against a simple mob, this is still a full force bullet
	armour_penetration = 0

/obj/projectile/bullet/strilka310/enchanted
	name = "enchanted .310 bullet"
	damage = 20
	stamina = 80

// Harpoons (Harpoon Gun)

/obj/projectile/bullet/harpoon
	name = "harpoon"
	icon_state = "gauss"
	damage = 60
	armour_penetration = 50
	wound_bonus = -20
	bare_wound_bonus = 80
	embedding = list(embed_chance=100, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)
	wound_falloff_tile = -5
	shrapnel_type = null

// Rebar (Rebar Crossbow)
/obj/projectile/bullet/rebar
	name = "rebar"
	icon_state = "rebar"
	damage = 30
	speed = 0.4
	dismemberment = 1 //because a 1 in 100 chance to just blow someones arm off is enough to be cool but also not enough to be reliable
	armour_penetration = 10
	wound_bonus = -20
	bare_wound_bonus = 20
	embedding = list(embed_chance=60, fall_chance=2, jostle_chance=2, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=3, jostle_pain_mult=2, rip_time=10)
	embed_falloff_tile = -5
	wound_falloff_tile = -2
	shrapnel_type = /obj/item/stack/rods

/obj/projectile/bullet/rebarsyndie
	name = "rebar"
	icon_state = "rebar"
	damage = 35
	speed = 0.4
	dismemberment = 2 //It's a budget sniper rifle.
	armour_penetration = 20 //A bit better versus armor. Gets past anti laser armor or a vest, but doesnt wound proc on sec armor.
	wound_bonus = 10
	bare_wound_bonus = 10
	embedding = list(embed_chance=80, fall_chance=1, jostle_chance=3, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=3, jostle_pain_mult=2, rip_time=14)
	embed_falloff_tile = -3
	shrapnel_type = /obj/item/stack/rods

/obj/projectile/bullet/molten_glob
	name = "rebar"
	icon_state = "rebar"
	damage = 15
	speed = 4
	shrapnel_type = /obj/item/burning_mass
	embedding = list("embed_chance" = 100, ignore_throwspeed_threshold = TRUE, "pain_mult" = 0, "jostle_pain_mult" = 0, "fall_chance" = 0.5)

/obj/projectile/bullet/molten_glob/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/carbon_victim = target
		carbon_victim.adjust_fire_stacks(10)
		carbon_victim.ignite_mob()

/obj/item/burning_mass
	name = "burning mass"
	desc = "You wouldn't want to see this inside you!"
	icon = 'icons/obj/science/vatgrowing.dmi' //WIP
	icon_state = "globule" //WIP
	embedding = list("embed_chance" = 100, ignore_throwspeed_threshold = TRUE, "pain_mult" = 0, "jostle_pain_mult" = 0, "fall_chance" = 0.5)

	var/mob/living/carbon/human/victim
	victim = null

/obj/item/burning_mass/embedded(mob/living/carbon/human/embedded_mob, obj/item/bodypart/part)
	. = ..()
	victim = embedded_mob
	START_PROCESSING(SSobj, src)

/obj/item/burning_mass/process()
	victim.adjust_fire_stacks(3)
	victim.ignite_mob()

