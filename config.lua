Config = {}
Translation = {}

Config.Debug = false  --enable this if you encounter errors or if you are interested in some extra debug prints
Config.Locale = 'en'    --en or de feel free to add more and PR it on GitHub
Config.UseOldESX = false  --enable this if you are using Esx V1 Final or 1.2 Anything below 1.2 will not work you should not use these old versions anyways remember to change your fxmanifest.lua if enabled

Config.Account = 'black_money'  --the account where the player receives the money

Config.LoudMoney = 10000    --the amount of Money the player receives when he does the loud approach
Config.SilentMoney = math.random(5000, 7000)  --the amount of Money the player receives when he does the silent approach

Config.RobberyTimer = 30000    --the time frame after a robbery in which no new robbery can be started (default 5 Minutes)

Config.ThermiteDifficulty = 3   --the difficulty of the Thermite Minigame (1-10)    float numbers don't work
Config.ThermiteIncorrectBlocks = 2  --the amount of mistakes the player can make before failing (cannot be higher then the value above)
Config.ThermiteBlockShow = 3    --the amount of time the player sees the correct blocks in the beginning (float numbers don't work)
Config.ThermiteFailTime = 10    --the amount of time the player has to complete the minigame (float numbers don't work)
Config.ThermiteTime = 15000     --the amount of time that the thermite takes to explode after the minigame (in milliseconds)

Config.HackingDifficulty = 3.7  --the difficulty of the hacking minigame (0 - 5)    float numbers work

Config.ATMModels = {    --the hashes from the ATM Models, if you use custom Models for ATMS you have to add those here if you don't know what this means just don't change it it will work with every vanilla atm by default
    {name = 'ATM', propHash = 506770882 , id = 277},
    {name = 'ATM', propHash = -870868698, id = 277},
    {name = 'ATM', propHash = -1364697528, id = 277},
    {name = 'ATM', propHash = -1126237515, id = 277},
}

Translation = {         --Add more under en if you want to Translate the Script
    ['en'] = {
        ['Robbery_menu_header'] = 'ATM Robbery',
        ['Robbery_menu_desc'] = 'There are 2 Ways to Rob an ATM, if you do it silently the police might not be alerted',
        ['Robbery_menu_loud'] = '~r~Blow the ATM up',
        ['Robbery_menu_loud_desc'] = 'Blowing the ATM up will result in you getting the most cash, however it will attract attention',
        ['Robbery_menu_silent'] = 'Hack the ATM',
        ['Robbery_menu_silent_desc'] = 'Hacking the ATM results in receiving less cash, however there is a chance the Police wont notice',
        ['Rob_ATM'] = 'Press ~g~G~s~ to rob the ATM',
        ['Robbery_loud_progressbar'] = 'Melting the Lock...',
        ['robbery_succesfull'] = 'You succesfully completed the Robbery',
        ['robbery_loud_failure'] = 'The Thermite didnt explode',
        ['thermite_ticking'] = 'Thermite is about to explode...',
        ['recently_robbed'] = 'This ATM was recently robbed and has no Money in it, come back later',
        ['robbery_silent_failure'] = 'You failed the Hack',
        ['police_notify'] = 'An ATM is currently being robbed, the position has been noted on your GPS'

    },
    ['de'] = {
        ['Robbery_menu_header'] = 'Geldautomat Überfallen',
        ['Robbery_menu_desc'] = 'Es gibt 2 Wege den Geldautomaten zu überfallen, wenn du den leisen weg nimmst alamierst du vielleicht nicht die Polizei',
        ['Robbery_menu_loud'] = '~r~Sprenge den Geldautomaten',
        ['Robbery_menu_loud_desc'] = 'Wenn du den Geldautomaten sprengst bekommst du das meiste Geld, du wirst aber auch sehr viel aufmerksamkeit auf dich ziehen',
        ['Robbery_menu_silent'] = 'Hacke den Geldautomaten',
        ['Robbery_menu_silent_desc'] = 'Wenn du den Geldautomaten hackst bekommst du weniger Geld, aber es gibt die Chance das die Polizei dich nicht bemerkt',
        ['Rob_ATM'] = 'Drücke ~g~G~s~ um den Geldautomaten zu überfallen',
        ['Robbery_loud_progressbar'] = 'Schloss wird geschmolzen...',
        ['robbery_succesfull'] = 'Du hast den Überfall erfolgreich abgeschlossen',
        ['robbery_loud_failure'] = 'Das Thermit ist nicht explodiert',
        ['thermite_ticking'] = 'Thermit explodiert gleich...',
        ['recently_robbed'] = 'Dieser Geldautomat wurde gerade erst ausgeraubt und enthält kein Geld, komme später wieder',
        ['robbery_silent_failure'] = 'Der Hack war nicht erfolgreich',
        ['police_notify'] = 'Ein Geldautomat wird gerade ausgeraubt, die Position ist auf deinem Navi markiert'
    },
	['es'] = {
        ['Robbery_menu_header'] = 'Robo de ATM',
        ['Robbery_menu_desc'] = 'Hay 2 Maneras de Robar un ATM, si lo haces de forma silenciosa la Policía podría no ser alertada',
        ['Robbery_menu_loud'] = '~r~Explotar el ATM',
        ['Robbery_menu_loud_desc'] = 'Explotar el ATM resultará en que obtengas más dinero, sin embargo, atraerá la atención',
        ['Robbery_menu_silent'] = 'Hackear el ATM',
        ['Robbery_menu_silent_desc'] = 'Hackear el ATM resultará en recibir menos dinero, sin embargo, hay una oportunidad de que la Policía no sea notificada',
        ['Rob_ATM'] = 'Presiona ~g~G~s~ para Robar el ATM',
        ['Robbery_loud_progressbar'] = 'Derritiendo la Cerradura...',
        ['robbery_succesfull'] = 'Completaste el Robo satisfactoriamente',
        ['robbery_loud_failure'] = 'La Termita no explotó',
        ['thermite_ticking'] = 'La Termita va a explotar...',
        ['recently_robbed'] = 'Este ATM ya fue robado y no queda más Dinero en él, vuelve después',
        ['robbery_silent_failure'] = 'Fallaste el Hackeo',
        ['police_notify'] = 'Un ATM está siendo robado en este momento, la posición ha sido anotada en tu GPS'

    }
}