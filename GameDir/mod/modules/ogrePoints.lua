local this = {}

this.registerIvars = {
    "dp_show",
    "dp_modify"
}

this.dp_show = function()
    InfMenu.Print("Demon points: "..tostring(vars.missionOgrePoint))
end

local function OnChangeOgrePoints()
    vars.missionOgrePoint = Ivars.dp_modify:Get()
end


this.dp_modify={
    save=IvarProc.CATEGORY_EXTERNAL,
    range={min=-0,max=100000,increment=50},
    default=vars.missionOgrePoint,
    OnChange = OnChangeOgrePoints,
}
this.registerMenus = {
    "dpMenu",
}

this.dpMenu = {
    parentRefs = {"InfMenuDefs.safeSpaceMenu", "InfMenuDefs.inMissionMenu"},
    options = {
        "ogrePoints.dp_show",
        "ogrePoints.dp_modify",
    }
}

this.langStrings = {
    eng = {
        dpMenu = "Demon Points",
        dp_show = "Show demon points",
        dp_modify = "Adjust demon points value"
    },
    help = {
        eng = {
            dpMenu = "Display the current amount of demon points.",
            dp_show = "Prints your current demon point count to the iDroid log.",
        },
    }
}

return this
