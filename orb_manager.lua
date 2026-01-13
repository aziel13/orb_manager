
local args = {...}

crafting_item = nil

valid_inputs = {"1","energized steel", "2","Blazing Crystal", "3","spirited crystal","4","niotic crystal","5","ender core","6","uranite"}

options_for_input = {"1: energized steel", "2: Blazing Crystal", "3: spirited crystal","4: niotic crystal", "5: Ender Core","6: uranite"}


ingr = {}

ingr["gold_ingot"] = "minecraft:gold_ingot"
ingr["iron_ingot"] = "minecraft:iron_ingot"
ingr["blaze_rod"] = "minecraft:blaze_rod"
ingr["diamond"] = "minecraft:diamond"
ingr["emerald"] = "minecraft:emerald"
ingr["redstone_block"] = "minecraft:redstone_block"
ingr["nether_star"] = "minecraft:nether_star"
ingr["blaze_crystal_block"] = "powah:crafting/blazing_crystal_block"
ingr["tiny_capacitor"] = "powah:crafting/capacitor_basic_tiny"
ingr["dielectric_casing"] = "powah:crafting/dielectric_casing"
ingr["ender_eye"] = "minecraft:ender_eye"
ingr["uranium_ingot"] = "ftbmaterials:uranium_ingot"

orb_name = "powah:energizing_orb"
chest = peripheral.find(orb_name)
chestCount = 0

orb_inv = {}

counter = 1

local first_output = true

local redstone_on_msg_displayed = false

local redstone_off_msg_displayed = false



function rs_reset()

    redstone.setOutput("left", false)
    redstone.setOutput("right", false)
    redstone.setOutput("front", false)

end

function rs_toggle(message,state)

    if redstone.getOutput("left") and redstone_on_msg_displayed == false then
        print(message)
        redstone_on_msg_displayed = true
    elseif redstone_off_msg_displayed == false then
        redstone_off_msg_displayed = true
    end
    
    redstone.setOutput("left", state)
    redstone.setOutput("right", state)
    redstone.setOutput("front", state)
    
end

function energized_steel()

            if first_output then
                print("crafting energized steel")
                first_output = false

                -- first_output end
            end

            local one_iron = 0
            local one_gold = 0


            for i, item in pairs(orb_inv) do

                if orb_inv[i].name == ingr["iron_ingot"] then

                    one_iron = one_iron + item.count

                end

                if orb_inv[i].name == ingr["gold_ingot"] then

                   one_gold = one_gold + item.count

                end

            end

            if one_iron == 1 and one_gold == 1  then

                rs_toggle("One Gold and One Iron ingot detected. Turning redstone on",true)

            else

                rs_toggle("Orb inventroy not equal to one gold ingot and one iron ingot. Turning redstone off",false)

            end

end

function blazing_crystal()
    if first_output then
        print("crafting blazing crystal")
        first_output = false
        print(orb_inv[1].name)
        -- first_output end
    end

    local one_blaze_rod = false

    print(ingr["blaze_rod"])

    print(orb_inv[1].name)
    print(orb_inv[1].count)

    if orb_inv[1].name == ingr["blaze_rod"] and orb_inv[1].count == 1 then

       one_blaze_rod = true

    else

       one_blaze_rod = false

    end

    print("one_blaze_rod: ")
    print(one_blaze_rod)

    if one_blaze_rod  then

        rs_toggle("One blaze rod detected. Turning redstone on",true)

    else

        rs_toggle("Orb inventroy not equal to one blaze rod. Turning redstone off",false)

    end
end

function niotic_crystal()
    if first_output then
           print("crafting niotic crystal")
           first_output = false
           print(orb_inv[1].name)
           -- first_output end
       end

       local one_diamond = false

       print(ingr["diamond"])

       print(orb_inv[1].name)
       print(orb_inv[1].count)

       if orb_inv[1].name == ingr["diamond"] and orb_inv[1].count == 1 then

          one_diamond = true

       else

          one_diamond = false

       end

       print("one_blaze_rod: ")
       print(one_diamond)

       if one_diamond  then

           rs_toggle("One diamond detected. Turning redstone on",true)

       else

           rs_toggle("Orb inventroy not equal to one diamond. Turning redstone off",false)

       end
end

function spirited_crystal()
    if first_output then
        print("crafting spirited crystal crystal")
        first_output = false
        print(orb_inv[1].name)
        -- first_output end
    end

    local one_emerald = false

    print(ingr["emerald"])

    print(orb_inv[1].name)
    print(orb_inv[1].count)

    if orb_inv[1].name == ingr["emerald"] and orb_inv[1].count == 1 then

     one_emerald = true

    else

     one_emerald = false

    end

    print("one_blaze_rod: ")
    print(one_emerald)

    if one_emerald  then

      rs_toggle("One emerald detected. Turning redstone on",true)

    else

      rs_toggle("Orb inventroy not equal to one emerald. Turning redstone off",false)

    end
end

function nitro_crystal()
   if first_output then
           print("crafting nitro crystal")
           first_output = false
           print(orb_inv[1].name)
           -- first_output end
       end

        local one_nether_star = 0
        local two_redstone_blocks = 0
        local one_blazing_crystal_block = 0



       for i, item in pairs(orb_inv) do

            print("slot: ".. i .."name: "..item.name .." count: ".. item.count)
            if orb_inv[i].name == ingr["nether_star"] and orb_inv[i].count == 1 then

                          one_nether_star = one_nether_star + 1

            end

            if orb_inv[i].name == ingr["redstone_block"] and (orb_inv[i].count == 1 or orb_inv[i].count == 2) then
                if two_redstone_blocks == 0 then
                    two_redstone_blocks = orb_inv[i].count
                elseif two_redstone_blocks == 1 then
                    two_redstone_blocks = two_redstone_blocks + orb_inv[i].count
                end
            end

            if orb_inv[i].name == ingr["blaze_crystal_block"] and orb_inv[i].count == 1 then

                one_blazing_crystal_block = one_blazing_crystal_block + 1

            end

       end



       print("one_blaze_rod: ")
       print(one_nether_star)

       if one_nether_star == 1 and two_redstone_blocks == 2 and one_blazing_crystal_block == 1   then

         rs_toggle("Two redstone blocks, one nether star, and one blaze crystal block detected. Turning redstone on",true)

       else

         rs_toggle("Orb inventroy not equal to one emerald. Turning redstone off",false)

       end
end

function ender_core()
    if first_output then
              print("crafting ender core")
              first_output = false
              print(orb_inv[1].name)
              -- first_output end
          end

           local tiny_capacitor = 0
           local dielectric_casing = 0
           local ender_eye = 0

          print(orb_inv[1].name)
          print(orb_inv[1].count)

          for i, item in pairs(orb_inv) do


              if orb_inv[i].name == ingr["tiny_capacitor"] and orb_inv[i].count == 1 then

               tiny_capacitor = tiny_capacitor + 1

              end

               if orb_inv[i].name == ingr["dielectric_casing"] and (orb_inv[i].count == 1 or orb_inv[i].count == 2) then
                   if dielectric_casing == 0 then
                       dielectric_casing = orb_inv[i].count
                   elseif dielectric_casing == 1 then
                       dielectric_casing = dielectric_casing + orb_inv[i].count
                   end
               end

               if orb_inv[i].name == ingr["ender_eye"] and orb_inv[i].count == 1 then

                   ender_eye = ender_eye + 1

               end

          end

          if tiny_capacitor == 1 and dielectric_casing == 2 and ender_eye == 1   then

            rs_toggle(" tiny_capacitor, dielectric_casing, and one ender_eye detected. Turning redstone on",true)

          else

            rs_toggle("Orb inventroy not equal to one emerald. Turning redstone off",false)

          end
end

function uranite()
    if first_output then
           print("crafting uranite")
           first_output = false
           print(orb_inv[1].name)
           -- first_output end
       end

       local one_emerald = false

       if orb_inv[1].name == ingr["uranium_ingot"] and orb_inv[1].count == 1 then

        one_uranium_ingot = true

       else

        one_uranium_ingot = false

       end

       print("uranium_ingot: ")
       print(one_uranium_ingot)

       if one_uranium_ingot  then

         rs_toggle("One uranium_ingot detected. Turning redstone on",true)

       else

         rs_toggle("Orb inventroy not equal to one emerald. Turning redstone off",false)

       end
end

function main()

    --start
    rs_reset()

    if chest ~= nil then
        for i, v in ipairs(args) do
            print("Argument " .. i .. ": " .. v)

            if contains_string( valid_inputs,  v)   then
                crafting_item = v
            end

        end

        for slot, item in pairs(chest.list()) do
            orb_inv[counter] = item
            counter = counter + 1
            chestCount = chestCount + 1
            print("slot: "..slot.."item name: "..item.name.." Count: "..item.count)
        end

        if crafting_item == nil then
            while true do
                print("Select one of the following(type in the number or word): ")
                print("Otherwise type 0 or quit to quit")

                for i, v in ipairs(options_for_input) do
                    print(i .. ": "..v)
                end

                local input = read()
                if string.lower(input) == "0" or string.lower(input) == "quit" then
                    print("Quiting")
                    return
                end
                if string.lower(input) == "1" or string.lower(input) == "energized steel" then
                   crafting_item = "esteel"
                   break
                end

                if string.lower(input) == "2" or string.lower(input) == "blazing crystal" then
                    crafting_item = "blazing"
                    break
                end

                if string.lower(input) == "3" or string.lower(input) == "niotic crystal" then
                    crafting_item = "niotic"
                    break
                end

                if string.lower(input) == "4" or string.lower(input) == "spirited crystal" then
                    crafting_item = "spirited"
                    break
                end
                if string.lower(input) == "5" or string.lower(input) == "nitro crystal" then
                    crafting_item = "nitro"
                    break
                end
                if string.lower(input) == "6" or string.lower(input) == "ender core" then
                    crafting_item = "ender"
                    break
                end
                if string.lower(input) == "7" or string.lower(input) == "uranite" then
                    crafting_item = "uranite"
                    break
                end

            end
        end


        print("Crafting "..crafting_item)


        while crafting_item ~= nil  do



            chest = peripheral.find(orb_name)

            chestCount = 0
            for slot, item in pairs(chest.list()) do
                chestCount = chestCount +1
            end
            -- update orb_inv if chest count changed

            if chestCount ~= #orb_inv  then
                print(chestCount)
                orb_inv = {}
                counter = 1
                for slot, item in pairs(chest.list()) do
                    orb_inv[counter] = item
                    counter = counter + 1
                    print("slot: "..slot.."item name: "..item.name.." Count: "..item.count)
                end
                first_output = true
                redstone_on_msg_displayed = false
                redstone_off_msg_displayed = false
            end
            if first_output then
                print(chestCount)
            end

            if crafting_item == "esteel" and #orb_inv == 2 then
                energized_steel()
            elseif crafting_item == "blazing" and #orb_inv == 1 then
                blazing_crystal()
            elseif crafting_item == "niotic" and #orb_inv == 1 then
                niotic_crystal()
            elseif crafting_item == "spirited" and #orb_inv == 1 then
                spirited_crystal()
            elseif crafting_item == "nitro" and #orb_inv == 4 then
                 nitro_crystal()
            elseif crafting_item == "ender" and #orb_inv == 4 then
                    ender_core()
            elseif crafting_item == "uranite" and #orb_inv == 1 then
                    uranite()
           else -- if count 2 else
               rs_toggle("redstone off",false)



             -- end if esteel
             end


            sleep()
            --while end
        end
    else
        print("Program requires a ".. orb_name.." placed behind the computer")
        return
    end

end

main()