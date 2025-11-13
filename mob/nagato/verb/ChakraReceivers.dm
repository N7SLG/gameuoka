/mob/nagato/verb/ChakraReceivers
    verb
        UseReceivers(target as mob)
            set name = "Chakra Receivers"
            set desc = "Use black rods to disrupt chakra and strike."
            if(!usr || !target) return
            if(!(usr.admin==1||usr.owner==1) && src.Mchakra < 60) return usr << "Not enough chakra."
            if(!(usr.admin==1||usr.owner==1)) src.Mchakra -= 60
            usr << "You drive a chakra receiver into your target."
            target << "[usr] strikes you with a chakra receiver!"
            flick("bolt", usr)
            flick("bolt", target)
            if(target && (target.Mhp))
                target.Mhp = max(0, target.Mhp - 80)
            return