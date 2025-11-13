/mob/nagato/verb/Rinnegan
    verb
        UseRinnegan(target as mob)
            set name = "Activate Rinnegan"
            set desc = "Activate passive Rinnegan sight to gain insight and small buffs."
            if(!usr) return
            if(usr.rinnegan_active)
                usr << "Your Rinnegan is already active."
                return
            usr << "<font color=purple>Your Rinnegan flares with insight."
            // Add an overlay to the player's icon to indicate active Rinnegan.
            // Re-uses 'sharinganthing.dmi' if present in project; adjust filename if needed.
            if(!usr.overlays) usr.overlays = list()
            usr.overlays += "sharinganthing.dmi"
            usr.rinnegan_active = 1
            // particle feedback
            flick("aura", usr)
            // auto-deactivate after some time (ticks)
            spawn(600)
                usr.rinnegan_active = 0
                // remove overlay safely
                if(usr.overlays && "sharinganthing.dmi" in usr.overlays)
                    usr.overlays = usr.overlays.Remove("sharinganthing.dmi")
                usr << "Your Rinnegan calms down."
            return