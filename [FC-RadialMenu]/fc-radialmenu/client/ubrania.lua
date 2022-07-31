local lastTorso  = {}
local lastPants  = {}
local lastBoots  = {}
local lastMask   = {}
local lastHelmet = {}
local lastWlosy  = {}

local nakedTorso  = false
local nakedPants  = false
local nakedBoots  = false
local nakedMask   = false
local nakedHelmet = false
local nakedWlosy = false


AddEventHandler('fc-radialmenu:OpenClothesMenu', function()
    OpenAccessoryMenu()
end)

-- MENU

function OpenAccessoryMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'set_unset_accessory',
	{
		title = 'Załóż / Zdejmij',
		align = 'right',
		elements = {
			{label = 'Czapka / Hełm', value = 'helmet'},
			{label = 'Akcesoria na uszy', value = 'uszy'},
			{label = 'Maska', value = 'mask'},
			{label = 'Okulary', value = 'okulary'},
			{label = 'Łańcuch / Krawat ', value = 'lancuch'},
			{label = 'Zegarek ', value = 'zegarek'},
			{label = 'Bransoleta ', value = 'bransoleta'},
			{label = 'Kamizelka', value = 'kamizelka'},
			{label = 'Tułów', value = 'torso'},
			{label = 'Spodnie', value = 'pants'},
			{label = 'Buty', value = 'boots'},
			{label = 'Torba / Plecak', value = 'torba'},
		}
	}, function(data, menu)		
		if data.current.value == 'pants' then
			TriggerEvent('fc-radialmenu:ToggleProps', 'legs')
		elseif data.current.value == 'torso' then
			TriggerEvent('fc-radialmenu:ToggleProps', 'jackets')
            TriggerEvent('fc-radialmenu:ToggleProps', 'undershirts')
		elseif data.current.value == 'boots' then
            TriggerEvent('fc-radialmenu:ToggleProps', 'shoes')
		elseif data.current.value == 'mask' then	
			TriggerEvent('fc-radialmenu:ToggleProps', 'masks')
		elseif data.current.value == 'helmet' then	
			TriggerEvent('fc-radialmenu:ToggleProps', 'hats')
		elseif data.current.value == 'torba' then	
			TriggerEvent('fc-radialmenu:ToggleProps', 'bags')
		elseif data.current.value == 'okulary' then	
			TriggerEvent('fc-radialmenu:ToggleProps', 'glasses')
		elseif data.current.value == 'lancuch' then	
			TriggerEvent('fc-radialmenu:ToggleProps', 'neck')
		elseif data.current.value == 'zegarek' then	
			TriggerEvent('fc-radialmenu:ToggleProps', 'watches')
		elseif data.current.value == 'bransoleta' then	
			TriggerEvent('fc-radialmenu:ToggleProps', 'braclets')
		elseif data.current.value == 'kamizelka' then	
			TriggerEvent('fc-radialmenu:ToggleProps', 'vest')
		elseif data.current.value == 'uszy' then	
			TriggerEvent('fc-radialmenu:ToggleProps', 'earrings')
		end
	end, function(data, menu)
		menu.close()
	end)
end

-- Funkcje


function Pants()
    TriggerEvent('skinchanger:getSkin', function(skin)
      if skin.sex == 0 then
          local newPostac = {}
          if not nakedPants then
              lastPants = {
                  bPants    = skin['pants_1'], 
                  bPantsCol = skin['pants_2']
              }
          
              newPostac['pants_1'] = 21
              newPostac['pants_2'] = 0
              nakedPants = true
          
          else
              newPostac['pants_1'] = lastPants.bPants
              newPostac['pants_2'] = lastPants.bPantsCol
              nakedPants = false
          end	
          TriggerEvent('skinchanger:loadClothes', skin, newPostac)
      else
          local newPostac = {}
          if not nakedPants then
              lastPants = {
                  bPants    = skin['pants_1'], 
                  bPantsCol = skin['pants_2']
              }
          
              newPostac['pants_1'] = 15
              newPostac['pants_2'] = 0
              nakedPants = true
          
          else
              newPostac['pants_1'] = lastPants.bPants
              newPostac['pants_2'] = lastPants.bPantsCol
              nakedPants = false
          end	
          TriggerEvent('skinchanger:loadClothes', skin, newPostac)
      end
      local lib, anim = 'clothingtrousers', 'try_trousers_neutral_c'
          ESX.Streaming.RequestAnimDict(lib, function()
              TaskPlayAnim(PlayerPedId(), lib, anim, 44.0, -8.0, -1, 48, 0, false, false, false)			
          end)
    end)
  end
  
  function Torso()
      TriggerEvent('skinchanger:getSkin', function(skin)
          if skin.sex == 0 then
              local postac2 = skin
              local newPostac2 = {}
              if not nakedTorso then			
          
                  lastTorso = {
                      aTorso = skin['torso_1'], 
                      aTorsoCol = skin['torso_2'],
                      aTShirt = skin['tshirt_1'],
                      aTShirtCol = skin['tshirt_2'],
                      aArms = skin['arms']
                  }
              
                  newPostac2['torso_1'] = 15
                  newPostac2['torso_2'] = 0
                  newPostac2['tshirt_1'] = 15
                  newPostac2['tshirt_2'] = 0
                  newPostac2['arms'] = 15
                  nakedTorso = true
              else
                  newPostac2['torso_1'] = lastTorso.aTorso
                  newPostac2['torso_2'] = lastTorso.aTorsoCol
                  newPostac2['tshirt_1'] = lastTorso.aTShirt
                  newPostac2['tshirt_2'] = lastTorso.aTShirtCol
                  newPostac2['arms'] = lastTorso.aArms
                  nakedTorso = false
              end
              TriggerEvent('skinchanger:loadClothes', skin, newPostac2)
          else
              local postac2 = skin
              local newPostac2 = {}
              if not nakedTorso then			
          
                  lastTorso = {
                      aTorso = skin['torso_1'], 
                      aTorsoCol = skin['torso_2'],
                      aTShirt = skin['tshirt_1'],
                      aTShirtCol = skin['tshirt_2'],
                      aArms = skin['arms']
                  }
              
                  newPostac2['torso_1'] = 15
                  newPostac2['torso_2'] = 0
                  newPostac2['tshirt_1'] = 2
                  newPostac2['tshirt_2'] = 0
                  newPostac2['arms'] = 15
                  nakedTorso = true
              else
                  newPostac2['torso_1'] = lastTorso.aTorso
                  newPostac2['torso_2'] = lastTorso.aTorsoCol
                  newPostac2['tshirt_1'] = lastTorso.aTShirt
                  newPostac2['tshirt_2'] = lastTorso.aTShirtCol
                  newPostac2['arms'] = lastTorso.aArms
                  nakedTorso = false
              end
              TriggerEvent('skinchanger:loadClothes', skin, newPostac2)
          end
  
          local lib, anim = 'clothingshirt', 'try_shirt_positive_a'
          ESX.Streaming.RequestAnimDict(lib, function()
              TaskPlayAnim(PlayerPedId(), lib, anim, 44.0, -8.0, -1, 48, 0, false, false, false)			
          end)
      end)
  end
  
  function Boots()
      TriggerEvent('skinchanger:getSkin', function(skin)
          if skin.sex == 0 then
              local postac2 = skin
              local newPostac2 = {}
              if not nakedBoots then			
          
                  lastBoots = {
                      aBoots = skin['shoes_1'], 
                      aBootsCol = skin['shoes_2']
                  }
              
                  newPostac2['shoes_1'] = 34
                  newPostac2['shoes_2'] = 0
                  nakedBoots = true
  
                  local lib, anim = 'clothingshoes', 'try_shoes_positive_d'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 44.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
              else
                  newPostac2['shoes_1'] = lastBoots.aBoots
                  newPostac2['shoes_2'] = lastBoots.aBootsCol
                  nakedBoots = false
                  local lib, anim = 'clothingshoes', 'try_shoes_positive_d'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 44.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
              end
              TriggerEvent('skinchanger:loadClothes', skin, newPostac2)
          else
              local postac2 = skin
              local newPostac2 = {}
              if not nakedBoots then			
          
                  lastBoots = {
                      aBoots = skin['shoes_1'], 
                      aBootsCol = skin['shoes_2']
                  }
              
                  newPostac2['shoes_1'] = 35
                  newPostac2['shoes_2'] = 0
                  nakedBoots = true
  
                  local lib, anim = 'clothingshoes', 'try_shoes_positive_d'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 44.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
              else
                  newPostac2['shoes_1'] = lastBoots.aBoots
                  newPostac2['shoes_2'] = lastBoots.aBootsCol
                  nakedBoots = false
  
                  local lib, anim = 'clothingshoes', 'try_shoes_positive_d'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 44.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
              end
              TriggerEvent('skinchanger:loadClothes', skin, newPostac2)		
          end
      end)
  end
  
  --okularki local lib, anim = 'clothingspecs', 'take_off'
  
  function Mask()
      TriggerEvent('skinchanger:getSkin', function(skin)
          local postac2 = skin
          local newPostac2 = {}
          if not nakedMask then			
          
              lastMask = {
                  aMask 	 = skin['mask_1'], 
                  aMaskCol = skin['mask_2']
              }
              
              if lastMask.aMask == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz maski!')
                  return
              else
              
                  newPostac2['mask_1'] = -1
                  newPostac2['mask_2'] = 0				
              
                  local lib, anim = 'misscommon@std_take_off_masks', 'take_off_mask_ps'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(750)
                  ClearPedTasks(PlayerPedId())
              end
              nakedMask = true
          else
              if lastMask.aMask == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz maski!')
              else
                  newPostac2['mask_1'] = lastMask.aMask
                  newPostac2['mask_2'] = lastMask.aMaskCol
                  
                  local lib, anim = 'misscommon@van_put_on_masks', 'put_on_mask_rds'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1350)
                  ClearPedTasks(PlayerPedId())
              end
              nakedMask = false
          end
          TriggerEvent('skinchanger:loadClothes', skin, newPostac2)
      end)
  end
  
  
  
  
  
  function Helmet()	
      TriggerEvent('skinchanger:getSkin', function(skin)
          local postac2 = skin
          local newPostac2 = {}
          if not nakedHelmet then			
          
              lastHelmet = {
                  aHelmet = skin['helmet_1'], 
                  aHelCol = skin['helmet_2']
              }
              
              if lastHelmet.aHelmet == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz hełmu lub czapki!')
                  return
              else
                  newPostac2['helmet_1'] = -1
                  newPostac2['helmet_2'] = 0
                  
                  local lib, anim = 'veh@bike@common@front@base', 'take_off_helmet_stand'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1150)
                  ClearPedTasks(PlayerPedId())
              end
              nakedHelmet = true
          else
              if lastHelmet.aHelmet == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz hełmu lub czapki!')
              else
                  newPostac2['helmet_1'] = lastHelmet.aHelmet
                  newPostac2['helmet_2'] = lastHelmet.aHelCol
                  
                  local lib, anim = 'missheistdockssetup1hardhat@', 'put_on_hat'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1450)
                  --ClearPedTasks(PlayerPedId())
              end
              nakedHelmet = false
          end
          TriggerEvent('skinchanger:loadClothes', skin, newPostac2)
      end)
  end


function wlosy()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local postac2 = skin
        local newPostac2 = {}
        if not nakedWlosy then			
        
            lastWlosy = {
                aHelmet = skin['helmet_1'], 
                aHelCol = skin['helmet_2']
            }

            newPostac2['helmet_1'] = -1
            newPostac2['helmet_2'] = 0
            ClearPedTasks(PlayerPedId())

            nakedWlosy = true
        else
            newPostac2['helmet_1'] = lastWlosy.aHelmet
            newPostac2['helmet_2'] = lastWlosy.aHelCol
            nakedWlosy = false
        end
        TriggerEvent('skinchanger:loadClothes', skin, newPostac2)
    end)
end
  
  
  
  
  function Torba()	
      TriggerEvent('skinchanger:getSkin', function(skin)
          local postac2 = skin
          local newPostac2 = {}
          if not nakedBags then			
          
              lastBags = {
                  aBags = skin['bags_1'], 
                  aBagCol = skin['bags_2']
              }
              
              if lastBags.aBags == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz torby!')
                  return
              else
                  newPostac2['bags_1'] = -1
                  newPostac2['bags_2'] = 0
                  
                  local lib, anim = 'clothingshirt', 'check_out_a'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1150)
                  ClearPedTasks(PlayerPedId())
              end
              nakedBags = true
          else
              if lastBags.aBags == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz torby!')
              else
                  newPostac2['bags_1'] = lastBags.aBags
                  newPostac2['bags_2'] = lastBags.aBagCol
                  
                  local lib, anim = 'clothingshirt', 'check_out_a'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1450)
                  --ClearPedTasks(PlayerPedId())
              end
              nakedBags = false
          end
          TriggerEvent('skinchanger:loadClothes', skin, newPostac2)
      end)
  end
  
  
  
  function Okulary()	
      TriggerEvent('skinchanger:getSkin', function(skin)
          local postac2 = skin
          local newPostac2 = {}
          if not nakedGlasses then			
          
              lastGlasses = {
                  aGlasses = skin['glasses_1'], 
                  aGlassCol = skin['glasses_2']
              }
              
              if lastGlasses.aGlasses == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz okularów!')
                  return
              else
  
                  if skin.sex == 0 then
                      newPostac2['glasses_1'] = 0
                      newPostac2['glasses_2'] = 0
                  elseif skin.sex == 1 then
                      newPostac2['glasses_1'] = 5
                      newPostac2['glasses_2'] = 0
                  end
                  
                  local lib, anim = 'clothingspecs', 'take_off'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1150)
                  ClearPedTasks(PlayerPedId())
              end
              nakedGlasses = true
          else
              if lastGlasses.aGlasses == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz okularów!')
              else
                  newPostac2['glasses_1'] = lastGlasses.aGlasses
                  newPostac2['glasses_2'] = lastGlasses.aGlassCol
                  
                  local lib, anim = 'clothingspecs', 'take_off'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1450)
                  --ClearPedTasks(PlayerPedId())
              end
              nakedGlasses = false
          end
          TriggerEvent('skinchanger:loadClothes', skin, newPostac2)
      end)
  end
  
  
  
  function Lancuch()	
      TriggerEvent('skinchanger:getSkin', function(skin)
          local postac2 = skin
          local newPostac2 = {}
          if not nakedChain then			
          
              lastChain = {
                  aChain = skin['chain_1'], 
                  aChaCol = skin['chain_2']
              }
              
              if lastChain.aChain == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz okularów!')
                  return
              else
                  newPostac2['chain_1'] = -1
                  newPostac2['chain_2'] = 0
                  
                  local lib, anim = 'clothingtie', 'check_out_a'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1150)
                  ClearPedTasks(PlayerPedId())
              end
              nakedChain = true
          else
              if lastChain.aChain == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz okularów!')
              else
                  newPostac2['chain_1'] = lastChain.aChain
                  newPostac2['chain_2'] = lastChain.aChaCol
                  
                  local lib, anim = 'clothingtie', 'check_out_a'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1450)
                  --ClearPedTasks(PlayerPedId())
              end
              nakedChain = false
          end
          TriggerEvent('skinchanger:loadClothes', skin, newPostac2)
      end)
  end
  
  
  
  function Zegarek()	
      TriggerEvent('skinchanger:getSkin', function(skin)
          local postac2 = skin
          local newPostac2 = {}
          if not nakedWatches then			
          
              lastWatches = {
                  aWatches = skin['watches_1'], 
                  aWatCol = skin['watches_2']
              }
              
              if lastWatches.aWatches == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz zegarka!')
                  return
              else
                  newPostac2['watches_1'] = -1
                  newPostac2['watches_2'] = 0
                  
                  local lib, anim = 'clothingshoes', 'try_shoes_positive_a'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1150)
                  ClearPedTasks(PlayerPedId())
              end
              nakedWatches = true
          else
              if lastWatches.aWatches == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz zegarka!')
              else
                  newPostac2['watches_1'] = lastWatches.aWatches
                  newPostac2['watches_2'] = lastWatches.aWatCol
                  
                  local lib, anim = 'clothingshoes', 'try_shoes_positive_a'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1450)
                  --ClearPedTasks(PlayerPedId())
              end
              nakedWatches = false
          end
          TriggerEvent('skinchanger:loadClothes', skin, newPostac2)
      end)
  end
  
  function Bransoleta()	
      TriggerEvent('skinchanger:getSkin', function(skin)
          local postac2 = skin
          local newPostac2 = {}
          if not nakedBracelets then			
          
              lastBracelets = {
                  aBracelets = skin['bracelets_1'], 
                  aBratCol = skin['bracelets_2']
              }
              
              if lastBracelets.aBracelets == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz bransolety!')
                  return
              else
                  newPostac2['bracelets_1'] = -1
                  newPostac2['bracelets_2'] = 0
                  
                  local lib, anim = 'clothingshoes', 'try_shoes_positive_a'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1150)
                  ClearPedTasks(PlayerPedId())
              end
              nakedBracelets = true
          else
              if lastBracelets.aBracelets == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz bransolety!')
              else
                  newPostac2['bracelets_1'] = lastBracelets.aBracelets
                  newPostac2['bracelets_2'] = lastBracelets.aBraBra
                  
                  local lib, anim = 'clothingshoes', 'try_shoes_positive_a'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1450)
                  --ClearPedTasks(PlayerPedId())
              end
              nakedBracelets = false
          end
          TriggerEvent('skinchanger:loadClothes', skin, newPostac2)
      end)
  end 
  
  
  function Kamizelka()	
      TriggerEvent('skinchanger:getSkin', function(skin)
          local postac2 = skin
          local newPostac2 = {}
          if not nakedBproof then			
          
              lastBproof = {
                  aBproof = skin['bproof_1'], 
                  aBprCol = skin['bproof_2']
              }
              
              if lastBproof.aBproof == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz kamizelki!')
                  return
              else
                  newPostac2['bproof_1'] = -1
                  newPostac2['bproof_2'] = 0
                  
                  local lib, anim = 'clothingshirt', 'check_out_c'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1150)
                  ClearPedTasks(PlayerPedId())
              end
              nakedBproof = true
          else
              if lastBproof.aBproof == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz kamizelki!')
              else
                  newPostac2['bproof_1'] = lastBproof.aBproof
                  newPostac2['bproof_2'] = lastBproof.aBprBra
                  
                  local lib, anim = 'clothingshirt', 'check_out_c'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1450)
                  ClearPedTasks(PlayerPedId())
              end
              nakedBproof = false
          end
          TriggerEvent('skinchanger:loadClothes', skin, newPostac2)
      end)
  end 
  
  
  function Uszy()	
      TriggerEvent('skinchanger:getSkin', function(skin)
          local postac2 = skin
          local newPostac2 = {}
          if not nakedEar_accessories then			
          
              lastEar_accessories = {
                  aEar_accessories = skin['ears_1'], 
                  aEar_accessoriesCol = skin['ears_2']
              }
              
              if lastEar_accessories.aEar_accessories == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz bransolety!')
                  return
              else
                  newPostac2['ears_1'] = -1
                  newPostac2['ears_2'] = 0
                  
                  local lib, anim = 'clothingtie', 'check_out_a'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1150)
                  ClearPedTasks(PlayerPedId())
              end
              nakedEar_accessories = true
          else
              if lastEar_accessories.aEar_accessories == -1 then
                  ESX.ShowNotification('~r~Nie posiadasz bransolety!')
              else
                  newPostac2['ears_1'] = lastEar_accessories.aEar_accessories
                  newPostac2['ears_2'] = lastEar_accessories.aEarBra
                  
                  local lib, anim = 'clothingtie', 'check_out_a'
                  ESX.Streaming.RequestAnimDict(lib, function()
                      TaskPlayAnim(PlayerPedId(), lib, anim, 24.0, -8.0, -1, 48, 0, false, false, false)			
                  end)
                  
                  Citizen.Wait(1450)
                  --ClearPedTasks(PlayerPedId())
              end
              nakedEar_accessories = false
          end
          TriggerEvent('skinchanger:loadClothes', skin, newPostac2)
      end)
  end 