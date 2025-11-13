/mob/nagato/verb/Suppression
    verb
        UseSuppression(target as mob)
            set name = "Suppression"
            set desc = "Soul extraction-style effect (Human Path)."
            if(!usr || !target) return
            if(!(usr.admin==1||usr.owner==1) && src.Mchakra < 120) return usr << "Not enough chakra."
            if(!(usr.admin==1||usr.owner==1)) src.Mchakra -= 120
            usr << "You touch the target's soul and extract information."
            // FX
            flick("aura", usr)
            flick("aura", target)
            // reveal stat snapshot (placeholder)
            target.revealed = 1
            spawn(30) target.revealed = 0
            return