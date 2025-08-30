-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v_u_2 = game:GetService("UserInputService")
game:GetService("RunService")
local v3 = game.Players.LocalPlayer
local v_u_4 = game.ReplicatedStorage.Source.Client.Triggers
local v_u_5 = v3.PlayerGui.QuickWarp
local v_u_6 = v3.PlayerGui.ShipControl
local v_u_7 = v3.PlayerGui.Overlays.Standard.Flying.Wrapper.Hotkeys
local v_u_8 = require(game.ReplicatedStorage.Source.Common.Constants.Schemes)
local v_u_9 = require(game.ReplicatedStorage.Source.Client.Camera)
local v_u_10 = require(game.ReplicatedStorage.Source.Client.Targeter)
local v_u_11 = require(game.ReplicatedStorage.Source.Client.Flight.Docking)
local v_u_12 = require(game.ReplicatedStorage.Source.Client.Util.Overlays.Hotkeys)
local v_u_13 = require(game.ReplicatedStorage.Source.Client.Camera.Flight)
local v_u_14 = require(game.ReplicatedStorage.Source.Client.Flight.State)
require(game.ReplicatedStorage.Source.Client.Flight.State.Warp)
local v_u_15 = require(game.ReplicatedStorage.Source.Client.Flight.State.Jump)
local v_u_16 = require(game.ReplicatedStorage.Source.Client.Flight.State.Shared)
local v_u_17 = require(game.ReplicatedStorage.Source.Client.DataSync.Settings)
require(game.ReplicatedStorage.Source.Common.Stores.Turrets)
local v18 = require(game.ReplicatedStorage.Source.Common.Constants.RotateModes)
local v_u_19 = v_u_16.keyDown
local v20 = require(game.ReplicatedStorage.Source.Client.Constants.Perspectives)
local v_u_21 = v20.COCKPIT
local v_u_22 = require(script.Helpers)
local v_u_23 = require(script.Hardpoints)
local v_u_24 = require(script.Turrets)
local v_u_25 = require(script.Modules)
local v_u_26 = require(script.Movement)
local v_u_27 = v18.VELOCITY
local v_u_28 = {
    [Enum.KeyCode.One] = 3,
    [Enum.KeyCode.Two] = 4,
    [Enum.KeyCode.Three] = 5,
    [Enum.KeyCode.Four] = 6,
    [Enum.KeyCode.Five] = 7,
    [Enum.KeyCode.Six] = 8,
    [Enum.KeyCode.Seven] = 9,
    [Enum.KeyCode.Eight] = 10
}
local v_u_29 = {
    "ShipPrimary",
    "ShipSecondary",
    "Ship1",
    "Ship2",
    "Ship3",
    "Ship4",
    "Ship5",
    "Ship6",
    "Ship7",
    "Ship8"
}
local function v_u_35(p30, p31)
    -- upvalues: (copy) v_u_14, (copy) v_u_9, (copy) v_u_19, (copy) v_u_16, (copy) v_u_8, (copy) v_u_26, (copy) v_u_11, (copy) v_u_15, (copy) v_u_25, (copy) v_u_13, (copy) v_u_17, (copy) v_u_12, (copy) v_u_28, (copy) v_u_23, (copy) v_u_24
    if v_u_14.isFlying() then
        if p31 or v_u_9.getCameraType() ~= "Flight" and not v_u_9.isSwitching() then
            return false
        end
        if p30.UserInputType == Enum.UserInputType.Keyboard then
            local v32 = p30.KeyCode
            if v32 == Enum.KeyCode.W then
                v_u_19.W = true
                return
            end
            if v32 == Enum.KeyCode.S then
                v_u_19.S = true
                if v_u_16.controlScheme == v_u_8.FIGHTER then
                    v_u_26.checkBackwards(true)
                    return
                end
            else
                if v32 == Enum.KeyCode.A then
                    v_u_19.A = true
                    return
                end
                if v32 == Enum.KeyCode.D then
                    v_u_19.D = true
                    return
                end
                if v32 == Enum.KeyCode.Q then
                    v_u_19.Q = true
                    return
                end
                if v32 == Enum.KeyCode.E then
                    v_u_19.E = true
                    return
                end
                if v32 == Enum.KeyCode.R then
                    v_u_19.R = true
                    return
                end
                if v32 == Enum.KeyCode.F then
                    v_u_19.F = true
                    if v_u_16.controlScheme == v_u_8.CAPITAL then
                        v_u_26.checkBackwards(true)
                        return
                    end
                else
                    if v32 == Enum.KeyCode.T then
                        v_u_19.T = true
                        return
                    end
                    if v32 == Enum.KeyCode.G then
                        v_u_19.G = true
                        return
                    end
                    if v32 == Enum.KeyCode.X then
                        v_u_26.stop()
                        v_u_11.cancel()
                        v_u_15.stopCharging()
                        return
                    end
                    if v32 == Enum.KeyCode.LeftShift then
                        if v_u_16.controlScheme == v_u_8.FIGHTER then
                            v_u_25.toggle(-1)
                            return
                        end
                    else
                        if v32 == Enum.KeyCode.LeftAlt then
                            v_u_16.freeRotate = true
                            return
                        end
                        if v32 == Enum.KeyCode.B then
                            v_u_13.reverse()
                            return
                        end
                        local v33
                        if v_u_17.get("TurretDetails") == 1 then
                            v33 = v32 == Enum.KeyCode.Comma
                        else
                            v33 = v32 == Enum.KeyCode.Tilde and true or v32 == Enum.KeyCode.Backquote
                        end
                        if v33 then
                            v_u_12.displayHotkeyDetails()
                            return
                        end
                        local v34 = v_u_28[v32]
                        if v34 then
                            v_u_23.enable(v34)
                            v_u_24.enable(v34)
                            v_u_25.toggle(v34)
                            return
                        end
                    end
                end
            end
        elseif true then
            if not v_u_16.targeting then
                v_u_23.enable(1)
                v_u_24.enable(1)
                v_u_25.toggle(1)
                return
            end
        elseif p30.UserInputType == Enum.UserInputType.MouseButton2 and not v_u_16.targeting then
            v_u_23.enable(2)
            v_u_24.enable(2)
            v_u_25.toggle(2)
        end
    end
end
local function v_u_41(p36, p37)
    -- upvalues: (copy) v_u_19, (copy) v_u_16, (copy) v_u_8, (copy) v_u_26, (copy) v_u_25, (copy) v_u_14, (copy) v_u_13, (copy) v_u_17, (copy) v_u_12, (copy) v_u_28, (copy) v_u_23, (copy) v_u_24
    if not p37 or p36.UserInputType == Enum.UserInputType.MouseButton1 then
        if p36.UserInputType == Enum.UserInputType.Keyboard then
            local v38 = p36.KeyCode
            if v38 == Enum.KeyCode.W then
                v_u_19.W = false
                return
            end
            if v38 == Enum.KeyCode.S then
                v_u_19.S = false
                if v_u_16.controlScheme == v_u_8.FIGHTER then
                    v_u_26.checkBackwards(false)
                    return
                end
            else
                if v38 == Enum.KeyCode.A then
                    v_u_19.A = false
                    return
                end
                if v38 == Enum.KeyCode.D then
                    v_u_19.D = false
                    return
                end
                if v38 == Enum.KeyCode.Q then
                    v_u_19.Q = false
                    return
                end
                if v38 == Enum.KeyCode.E then
                    v_u_19.E = false
                    return
                end
                if v38 == Enum.KeyCode.R then
                    v_u_19.R = false
                    return
                end
                if v38 == Enum.KeyCode.F then
                    v_u_19.F = false
                    if v_u_16.controlScheme == v_u_8.CAPITAL then
                        v_u_26.checkBackwards(false)
                        return
                    end
                else
                    if v38 == Enum.KeyCode.T then
                        v_u_19.T = false
                        return
                    end
                    if v38 == Enum.KeyCode.G then
                        v_u_19.G = false
                        return
                    end
                    if v38 == Enum.KeyCode.LeftShift then
                        if v_u_16.controlScheme == v_u_8.FIGHTER then
                            v_u_25.disable(-1)
                            return
                        end
                    else
                        if v38 == Enum.KeyCode.LeftAlt then
                            v_u_16.freeRotate = false
                            return
                        end
                        if v38 == Enum.KeyCode.V then
                            if v_u_14.isFlying() then
                                v_u_13.cyclePerspective()
                                return
                            end
                        else
                            if v38 == Enum.KeyCode.B then
                                v_u_13.resetReverse()
                                return
                            end
                            local v39
                            if v_u_17.get("TurretDetails") == 1 then
                                v39 = v38 == Enum.KeyCode.Comma
                            else
                                v39 = v38 == Enum.KeyCode.Tilde and true or v38 == Enum.KeyCode.Backquote
                            end
                            if v39 then
                                v_u_12.hideHotkeyDetails()
                                return
                            end
                            local v40 = v_u_28[v38]
                            if v40 then
                                v_u_23.disable(v40)
                                v_u_24.disable(v40)
                                return
                            end
                        end
                    end
                end
            end
        else
            if p36.UserInputType == Enum.UserInputType.MouseButton1 then
                v_u_23.disable(1)
                v_u_24.disable(1)
                return
            end
            if p36.UserInputType == Enum.UserInputType.MouseButton2 then
                v_u_23.disable(2)
                v_u_24.disable(2)
            end
        end
    end
end
local function v_u_48(p42)
    -- upvalues: (copy) v_u_16, (copy) v_u_8, (copy) v_u_13, (copy) v_u_21, (copy) v_u_9, (copy) v_u_14, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_27, (copy) v_u_17, (copy) v_u_26
    if p42.UserInputType == Enum.UserInputType.MouseMovement and (v_u_16.controlScheme == v_u_8.FIGHTER or v_u_13.getPerspective() == v_u_21) and v_u_9.getCameraType() == "Flight" then
        local v43 = v_u_14.isFlying() and (v_u_14.shipIsControllable() and not v_u_16.freeRotate and not (v_u_5.Enabled or v_u_6.Enabled))
        if v43 then
            v43 = not v_u_7:GetAttribute("Detailed")
        end
        if v43 then
            if v_u_16.rotateMode == v_u_27 then
                local v44 = v_u_17.get("Inverted") and 1 or -1
                local v45 = -p42.Delta.X / 600 * 2
                local v46 = v44 * p42.Delta.Y / 600 * 2
                v_u_26.addRotateVelocity(v45, v46)
                return
            end
            local v47 = v_u_17.get("Inverted") and 1 or -1
            v_u_26.rotate(-p42.Delta.X / 600, v47 * p42.Delta.Y / 600)
        end
    end
end
local function v_u_54()
    -- upvalues: (copy) v_u_22, (copy) v_u_16, (copy) v_u_29, (copy) v_u_12
    local v49 = v_u_22.canUseEquipment()
    for v50, v51 in pairs(v_u_16.hotkeyGroups) do
        if typeof(v51) == "table" then
            local v52 = v_u_29[v50]
            local v53
            if v50 == v_u_16.pointGroup or v50 == v_u_16.logisticsGroup then
                v53 = not v_u_22.canUseTargetedEquipment()
                if #v_u_16.hotkeyTargets[v50] > 0 then
                    if not v_u_12.isActive(v52) then
                        v_u_12.activate(v52)
                    end
                else
                    v_u_12.deactivate(v52)
                end
            else
                v53 = not v49
            end
            v_u_12.setDisabled(v52, v53)
        end
    end
end
local function v_u_55()
    -- upvalues: (copy) v_u_54, (copy) v_u_22, (copy) v_u_10, (copy) v_u_25
    v_u_54()
    if not v_u_22.canUseTargetedEquipment() and v_u_10.isEnabled() then
        v_u_10.disable()
    end
    v_u_25.updateHotkeys()
end
local function v_u_56()
    -- upvalues: (copy) v_u_54, (copy) v_u_22, (copy) v_u_10, (copy) v_u_25
    while true do
        v_u_54()
        if not v_u_22.canUseTargetedEquipment() and v_u_10.isEnabled() then
            v_u_10.disable()
        end
        v_u_25.updateHotkeys()
        task.wait(0.25)
    end
end
function v1.check()
    -- upvalues: (copy) v_u_16, (copy) v_u_29, (copy) v_u_12
    for v57, _ in pairs(v_u_16.hotkeyGroups) do
        if v57 > 0 then
            local v58 = v_u_16.hotkeyTargets[v57]
            local v59 = v_u_29[v57]
            v_u_12.setTargets(v59, v58)
        end
    end
end
function v1.setup()
    -- upvalues: (copy) v_u_2, (copy) v_u_35, (copy) v_u_41, (copy) v_u_48, (copy) v_u_16, (copy) v_u_4, (copy) v_u_55, (copy) v_u_56
    v_u_2.InputBegan:Connect(v_u_35)
    v_u_2.InputEnded:Connect(v_u_41)
    v_u_2.InputChanged:Connect(v_u_48)
    v_u_2.WindowFocusReleased:Connect(function()
        -- upvalues: (ref) v_u_16
        v_u_16.freeRotate = false
    end)
    v_u_4.TargetChanged.Event:Connect(v_u_55)
    v_u_4.RefreshHotkeys.Event:Connect(v_u_55)
    v_u_4.ShipChanged.Event:Connect(v_u_55)
    task.spawn(v_u_56)
end
return v1