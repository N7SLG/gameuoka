/mob/nagato/verb/AnimalPath
    verb
        SummonAnimal()
            set name = "Summon: Animal Path"
            set desc = "Summon a large creature to fight for you."
            if(!usr) return
            if(!(usr.admin==1||usr.owner==1) && src.Mchakra < 300) return usr << "Not enough chakra."
            if(!(usr.admin==1||usr.owner==1)) src.Mchakra -= 300
            usr << "A titanic beast appears in obedience to your summon."
            // create a simple summoned NPC using existing Summon.dm if available, else place marker
            if(usr.loc)
                var/summ = new /mob/summon(usr.loc)
                summ.master = usr
                summ.health = 500 + usr.Mnin
                usr << "Your summon stands ready."
            usr.summon_active = 1
            spawn(200) usr.summon_active = 0
            return