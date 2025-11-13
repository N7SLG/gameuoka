/obj/effect/gravity_orb
    var/mob/owner
    var/radius = 1
    var/duration = 400
    var/strength = 1
    var/active = 0
    icon = "sharinganthing.dmi"

    New(loc, o, r=1)
        ..()
        owner = o
        radius = r
        duration = 400
        strength = 1 + floor(owner.Mnin / 300)
        active = 0
        // position the orb at provided loc
        if(loc) src.loc = loc

    proc/activate()
        if(active) return
        active = 1
        spawn(duration)
            for(var/i=0;i<duration;i+=10)
                // attract mobs within radius slowly
                for(var/m in world)
                    if(m && m.loc && dist(m.loc, src.loc) <= radius && m != owner)
                        // move mob one step toward orb
                        var/nx = m.loc.x + sign(src.loc.x - m.loc.x)
                        var/ny = m.loc.y + sign(src.loc.y - m.loc.y)
                        var/nloc = locate(nx, ny)
                        if(nloc && nloc != m.loc)
                            try(m.Move(nloc))
                sleep(10)
            // end effect, delete orb
            if(src) src.Del()