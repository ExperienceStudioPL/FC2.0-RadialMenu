Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

Config = {}

Config.MenuItems = {

    {
        id = 'mainmenu',
        tip = 'Menu Główne Postaci',
        displayName = 'Menu Główne',
        key = 'F1',
        enableMenu = function()
            return true
        end,
        items = {

            {
                id    = 'dokumenty',
                title = 'Dokumenty',
                icon = '#dokumenty',
                items = {
                    {
                        id    = 'dowod',
                        title = 'Dowód Osobisty',
                        icon = '#dokumenty',
                        type = 'server',
                        event = 'dowod',
                        shouldClose = true,
                    },
                    {
                        id    = 'wizytowka',
                        title = 'Wizytówka',
                        icon = '#dokumenty',
                        type = 'server',
                        event = 'wizytowka',
                        shouldClose = true,
                    },
                }
            },

            {
                id = 'ubrania',
                title = 'Menu Ubrań',
                icon = '#ubrania',
                type = 'client',
                event = 'OTWORZJEBANEKURWAJEVJAWJREAWJEJUBRANIE:EW12312312',
                shouldClose = true,
            }
        }
    },
}

Config.MenuEvents = {
}

Config.MenuAdd = {

    {
        id = 'mainmenu',
        addElement = function()
            return exports['fc-itemplayerhas']:IsPlayerHasItem('phone')
        end,
        item ='phone',
        items = {
            {
                id    = 'telefon',
                title = 'Telefon',
                icon = '#phone',
                type = 'client',
                event = 'gcPhone:forceOpenPhone',
                shouldClose = true,
            },
        }
    },

    {
        id = 'mainmenu',
        addElement = function()
            return IsPedSittingInAnyVehicle(GetPlayerPed(-1)) == false
        end,
        items = {
            {
                id    = 'animacje',
                title = 'Animacje',
                icon = '#kidos',
                type = 'client',
                event = 'animacje',
                shouldClose = true, 
            },
        }
    },

    {
        id = 'mainmenu',
        addElement = function()
            return IsPedSittingInAnyVehicle(GetPlayerPed(-1))
        end,
        items = {
            {
                id    = 'zarzadzanieautem',
                title = 'Pojazd',
                icon = '#general-keys-give',
                items = {
                    {
                        id = 'doors',
                        title = 'Drzwi',
                        icon = '#car_door',
                        items = {
                            {
                                id    = 'leweprzednie',
                                title = 'Lewe Przednie Drzwi',
                                icon = '#general-keys-give',
                                type = 'client',
                                event = 'fc-radialmenu:LP',
                                shouldClose = false,
                            },
                            {
                                id    = 'praweprzednie',
                                title = 'Prawe Przednie Drzwi',
                                icon = '#general-keys-give',
                                type = 'client',
                                event = 'fc-radialmenu:PP',
                                shouldClose = false,
                            },
                            {
                                id    = 'lewetylne',
                                title = 'Lewe Tylne Drzwi',
                                icon = '#general-keys-give',
                                type = 'client',
                                event = 'fc-radialmenu:LT',
                                shouldClose = false,
                            },
                            {
                                id    = 'prawetylne',
                                title = 'Prawe Tylnie Drzwi',
                                icon = '#general-keys-give',
                                type = 'client',
                                event = 'fc-radialmenu:PT',
                                shouldClose = false,
                            },
                            {
                                id    = 'maska',
                                title = 'Maska',
                                icon = '#general-keys-give',
                                type = 'client',
                                event = 'fc-radialmenu:M',
                                shouldClose = false,
                            },
                            {
                                id    = 'bagaznik',
                                title = 'Bagażnik',
                                icon = '#general-keys-give',
                                type = 'client',
                                event = 'fc-radialmenu:B',
                                shouldClose = false,
                            },
                        }
                    },
                    {
                        id = 'doors',
                        title = 'Siedzenie',
                        icon = '#car_seat',
                        items = {
                            {
                                id    = 'lewetylne',
                                title = 'Siedzenie 2',
                                icon = '#car_seat',
                                type = 'client',
                                event = 'fc-radialmenu:LT',
                                shouldClose = false,
                            },
                            {
                                id    = 'prawetylne',
                                title = 'Siedzenie 4',
                                icon = '#car_seat',
                                type = 'client',
                                event = 'fc-radialmenu:PT',
                                shouldClose = false,
                            },
                            {
                                id    = 'maska',
                                title = 'Siedzenie 3',
                                icon = '#car_seat',
                                type = 'client',
                                event = 'fc-radialmenu:M',
                                shouldClose = false,
                            },
                            {
                                id    = 'bagaznik',
                                title = 'Siedzenie 1',
                                icon = '#car_seat',
                                type = 'client',
                                event = 'fc-radialmenu:B',
                                shouldClose = false,
                            },
                        }
                    },
                    {
                        id = 'carradio',
                        title = 'Radio Samochodowe',
                        icon ='#radio',
                        type = 'client',
                        event = 'fc-radialmenu:radiocar',
                        shouldClose = true,
                    }
                }
            },
        }
    },


    {
        id = 'mainmenu',
        addElement = function()
            return ESX.PlayerData.job.name == 'police'
        end,
        items = {
            {
                id = 'menu-pracy',
                title = 'Menu Pracy',
                icon = '#main',
                items = {
                    {
                        id    = 'odznaka',
                        title = 'Odznaka',
                        icon = '#main',
                        type = 'server',
                        event = 'esx_dowod:pokaodznake',
                        shouldClose = true,
                    },
                    {
                        id    = 'mdc',
                        title = 'MDT',
                        icon = '#tablet',
                        type = 'client',
                        event = 'tabletpol',
                        shouldClose = true,
                    },
                    {
                        id = '10-13menu',
                        title = 'Powiadomienia',
                        icon = '#main',
                        items = {
                            {
                                id    = '10-13a',
                                title = '10-13A',
                                icon = '#main',
                                type = 'client',
                                event = 'break_10-13srp:notifya',
                                shouldClose = true,
                            },
                            {
                                id    = '10-13b',
                                title = '10-13B',
                                icon = '#main',
                                type = 'client',
                                event = 'break_10-13srp:notifyb',
                                shouldClose = true,
                            },
                        }
                    },
                    {
                        id    = 'animacje',
                        title = 'Obiekty',
                        icon = '#object',
                        items = {
                            {
                                id    = 'kolczatka',
                                title = 'Kolczatka',
                                icon = '#spike',
                                type = 'client',
                                event = 'loaf_spikestrips:placeSpikestrip',
                                shouldClose = true,
                            },
                        }
                    },
                },
            }
        }
    },

    {
        id = 'mainmenu',
        addElement = function()
            return ESX.PlayerData.job.name == 'sheriff'
        end,
        items = {
            {
                id = 'menu-pracy',
                title = 'Menu Pracy',
                icon = '#main',
                items = {
                    {
                        id    = 'odznaka',
                        title = 'Odznaka',
                        icon = '#main',
                        type = 'server',
                        event = 'odznaka',
                        shouldClose = true,
                    },
                    {
                        id    = 'mdc',
                        title = 'MDC',
                        icon = '#main',
                        type = 'client',
                        event = 'tabletpol',
                        shouldClose = true,
                    },
                    {
                        id = '10-13menu',
                        title = 'Powiadomienia',
                        icon = '#main',
                        items = {
                            {
                                id    = '10-13a',
                                title = '10-13A',
                                icon = '#main',
                                type = 'client',
                                event = 'break_10-13srp:notifya',
                                shouldClose = true,
                            },
                            {
                                id    = '10-13b',
                                title = '10-13B',
                                icon = '#main',
                                type = 'client',
                                event = 'break_10-13srp:notifyb',
                                shouldClose = true,
                            },
                        }
                    },

                },
            }
        }
    },

    {
        id = 'mainmenu',
        addElement = function()
            return ESX.PlayerData.job.name == 'offpolice'
        end,
        items = {
            {
                id = 'menu-pracy',
                title = 'Menu Pracy',
                icon = '#main',
                items = {
                    {
                        id    = 'odznaka',
                        title = 'Odznaka',
                        icon = '#main',
                        type = 'server',
                        event = 'odznaka',
                        shouldClose = true,
                    },

                },
            }
        }
    },

    {
        id = 'mainmenu',
        addElement = function()
            return ESX.PlayerData.job.name == 'offsheriff'
        end,
        items = {
            {
                id = 'menu-pracy',
                title = 'Menu Pracy',
                icon = '#main',
                items = {
                    {
                        id    = 'odznaka',
                        title = 'Odznaka',
                        icon = '#main',
                        type = 'server',
                        event = 'odznaka',
                        shouldClose = true,
                    },

                },
            }
        }
    },


    {
        id = 'mainmenu',
        addElement = function()
            return ESX.PlayerData.job.name == 'mecano'
        end,
        items = {
            {
                id = 'menu-pracy',
                title = 'Menu Pracy',
                icon = '#main',
                items = {
                    {
                        id    = 'mdc',
                        title = 'MDC',
                        icon = '#main',
                        type = 'client',
                        event = 'tabletmechanic',
                        shouldClose = true,
                    },
                }
            }
        }
    },


    {
        id = 'mainmenu',
        addElement = function()
            return ESX.PlayerData.job.name == 'ambulance'
        end,
        items = {
            {
                id = 'menu-pracy',
                title = 'Menu Pracy',
                icon = '#main',
                items = {
                    {
                        id    = 'mdc',
                        title = 'MDC',
                        icon = '#main',
                        type = 'client',
                        event = 'tabletmed',
                        shouldClose = true,
                    },

                },
            }
        }
    },
}