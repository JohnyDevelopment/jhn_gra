local Main = {
    string = "kys",
    charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
}
RegisterCommand("xx", function() 
    Main.startGame()
end)
Main.startGame = function()
    Main.index = 0

    Main.string = ""

    for i = 1, 10 do
        Main.index = math.random(1, Main.charset:len())
        Main.string = Main.string .. Main.charset:sub(Main.index, Main.index)
    end
    TriggerClientEvent('chatMessage', -1, "System gier: Przepisz to jak najszybciej /reedm "..Main.string, {255, 0, 0})
end
SetTimeout(1800000, function()
    Main.startGame()
end)

RegisterCommand('reedm', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)

    local code = args[1]

    if Main.string == "kys" then 
        xPlayer.showNotification('Ktos byl przed tobą')
    else 
        if Main.string == code then 
            Main.string = "kys"
            xPlayer.showNotification('Gratuluje byles pierwszy!')
            xPlayer.addAccountMoney('money', 500000)
            xPlayer.addInventoryItem('weaponcheast', 1)
        else 
            xPlayer.showNotification('Blednie przepisales kod!')
        end
    end
end)