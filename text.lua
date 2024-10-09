--[[by mada

Mada admin v1]]

local admin = loadstring(game:HttpGet("https://pastebin.com/raw/WPq8Cx9f"))():create({
    ["name"] = "cool admin"; 
    ["prefix"] = ";"; -- prefix !!! 
    ["key"] = Enum.KeyCode.Semicolon; -- prefix key code !!! (https://create.roblox.com/docs/reference/engine/enums/KeyCode)
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Commande pour téléporter l'administrateur à un joueur
admin:addcmd({"view"}, function(targetUser)
    local targetPlayer = game:GetService("Players"):FindFirstChild(targetUser)
    if targetPlayer and targetPlayer.Character then
        local camera = workspace.CurrentCamera
        camera.CameraSubject = targetPlayer.Character:FindFirstChild("Humanoid")
        camera.CFrame = targetPlayer.Character.PrimaryPart.CFrame
        admin:system("Vous êtes maintenant en vue de " .. targetPlayer.DisplayName)
    else
        admin:system("Utilisateur non trouvé : " .. targetUser)
    end
end)

-- Commande pour changer la gravité de l'administrateur
admin:addcmd({"gravity"}, function(value)
    local gravity = tonumber(value) or 196.2 -- valeur par défaut
    workspace.Gravity = gravity
    admin:system("La gravité a été changée à " .. gravity .. ".")
end)

-- Commande pour rendre un joueur invisible
admin:addcmd({"invisible"}, function()
    character.HumanoidRootPart.Transparency = 1
    for _, part in ipairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Transparency = 1
        end
    end
    admin:system("Vous êtes maintenant invisible.")
end)

-- Commande pour rendre un joueur visible
admin:addcmd({"visible"}, function()
    character.HumanoidRootPart.Transparency = 0
    for _, part in ipairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Transparency = 0
        end
    end
    admin:system("Vous êtes maintenant visible.")
end)

-- Commande pour exécuter un script à partir d'une URL
admin:addcmd({"run"}, function(url)
    if url and url:match("^https?://") then
        local success, err = pcall(function()
            loadstring(game:HttpGet(url))()
        end)
        if success then
            admin:system("Le script a été exécuté avec succès.")
        else
            admin:system("Erreur lors de l'exécution du script : " .. err)
        end
    else
        admin:system("Veuillez fournir une URL valide.")
    end
end)

-- Commande pour activer le vol
admin:addcmd({"fly"}, function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Jfdedit3/Jfdedit3/refs/heads/main/Fly%20script%20by%20chatgpt"))()
    end)
    if success then
        admin:system("Le script de vol a été exécuté avec succès.")
    else
        admin:system("Erreur lors de l'exécution du script de vol : " .. err)
    end
end)

-- Notifications des commandes disponibles
local function notifyCommands()
    local commands = {
        ";say <message> - Affiche un message dans le chat.",
        ";view <user> - Téléporte l'administrateur à un joueur spécifié.",
        ";gravity <value> - Change la gravité de l'administrateur.",
        ";invisible - Rendre l'administrateur invisible.",
        ";visible - Rendre l'administrateur visible.",
        ";run <url> - Exécute un script à partir de l'URL fournie.",
        ";fly - Active le vol pour l'administrateur."
    }

    for _, command in ipairs(commands) do
        admin:system(command)
    end
end

-- Appeler la fonction pour notifier les commandes disponibles
notifyCommands()