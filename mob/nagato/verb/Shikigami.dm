/mob/nagato/verb/Shikigami
    verb
        UseShikigami(target as mob)
            set name = "Shikigami no Mai"
            set desc = "Paper manipulation: toss razor paper constructs."
            if(!usr) return
            if(!(usr.admin==1||usr.owner==1) && src.Mchakra < 80) return usr << "Not enough chakra."
            if(!(usr.admin==1||usr.owner==1)) src.Mchakra -= 80
            usr << "You send paper shikigami to tear at your foe."
            // visual paper FX
            flick("papers", usr)
            flick("papers", target)
            if(target && (target.Mhp))
                target.Mhp = max(0, target.Mhp - 50)
            return