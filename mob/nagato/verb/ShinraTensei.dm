/mob/nagato/verb/ShinraTensei
    verb
        UseShinra(target as mob)
            set name = "Shinra Tensei"
            set desc = "Almighty Push. Push target(s) away. Costs chakra."
            if(!usr || !target) return
            if(!(usr.admin==1||usr.owner==1) && src.Mchakra < 200) return usr << "Not enough chakra."
            if(!(usr.admin==1||usr.owner==1)) src.Mchakra -= 200
            usr << "You focus and unleash Shinra Tensei!"
            target << "[usr] uses Shinra Tensei on you!"
            // particle FX on caster and target
            flick("smoke2", usr)
            flick("smoke2", target)
            // attempt to push target away from caster by 1-2 tiles depending on caster's Mnin level
            var/level = usr.Mnin or 1
            var/push = 1 + floor(level/300) // grows slowly; tweak as needed
            for(var/i=1;i<=push;i++)
                if(target && usr && target.loc && usr.loc)
                    var/dx = target.loc.x - usr.loc.x
                    var/dy = target.loc.y - usr.loc.y
                    // normalize to single-step direction
                    dx = 0
                    dy = 0
                    if(dx < 0) dx = -1
                    if(dx > 0) dx = 1
                    if(dy < 0) dy = -1
                    if(dy > 0) dy = 1
                    // compute new coords
                    var/newx = target.loc.x + sign(target.loc.x - usr.loc.x)
                    var/newy = target.loc.y + sign(target.loc.y - usr.loc.y)
                    var/newloc = locate(newx, newy)
                    if(newloc && newloc != target.loc)
                        try(target.Move(newloc))
            // brief stagger
            target.staggered = 1
            spawn(15) target.staggered = 0
            return