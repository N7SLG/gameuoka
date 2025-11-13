/mob/nagato/verb/ChibakuTensei
    verb
        UseChibaku(target as mob)
            set name = "Chibaku Tensei"
            set desc = "Creates a gravity core that traps targets. High cost."
            if(!usr) return
            if(!(usr.admin==1||usr.owner==1) && src.Mchakra < 500) return usr << "Not enough chakra."
            if(!(usr.admin==1||usr.owner==1)) src.Mchakra -= 500
            usr << "You summon a grievous gravity core. The area trembles."
            // spawn a visible gravity orb object at caster's loc
            var/obj/effect/gravity_orb/orb = new /obj/effect/gravity_orb(usr.loc, usr, 1 + floor(usr.Mnin/300))
            orb.activate()
            return