local LAM = LibStub("LibAddonMenu-2.0")

function TGC.CreateMenu()

  local panelData = {
    type = "panel",
		name = "The Gaming Council",
		displayName = ZO_HIGHLIGHT_TEXT:Colorize("The Gaming Council"),
		author = "alexdragian",
		version = TGC.version,
		slashCommand = "/tgc",
		website = "http://tgcguild.com",
		registerForRefresh = true,
		registerForDefaults = true
  }

  TGC.LAMPanel = LAM:RegisterAddonPanel("TheGamingCouncilOptions", panelData)

  local optionsData = {}

  optionsData[#optionsData + 1] = {
    type = "submenu",
    name = "Guild Recuriting",
    controls = {
      {
        type = "checkbox",
        name = "Enable History Scanner",
        tooltip = "History scanner looks up the history from the start of the guild to see who has been a member before.\n\nWarning this hits the ESO API and can disconnect you if you have other addons that do the same, like master merchant.",
        getFunc = function() return TGC.db.options.guildOptions.scanHistory end,
        setFunc = function(newValue)
          TGC.db.options.guildOptions.scanHistory = newValue
        end,
        width = "full",
        default = TGC.db.options.guildOptions.scanHistory,
      }
    }
  }

  optionsData[#optionsData + 1] = {
    type = "submenu",
    name = "Set Tracker - Environment",
    controls = {
      {
        type = "checkbox",
        name = "PvE",
        tooltip = "Check to offer information on PvE gear, uncheck to mark all PvE gear as trash.",
        getFunc = function() return TGC.db.options.setTracker.pveType end,
        setFunc = function(newValue)
          TGC.db.options.setTracker.pveType = newValue
        end,
        width = "full",
        default = TGC.db.options.setTracker.pveType,
      }, {
        type = "checkbox",
        name = "PvP",
        tooltip = "Check to offer information on PvP gear, uncheck to mark all PvP gear as trash.",
        getFunc = function() return TGC.db.options.setTracker.pvpType end,
        setFunc = function(newValue)
          TGC.db.options.setTracker.pvpType = newValue
        end,
        width = "full",
        default = TGC.db.options.setTracker.pvpType,
      }
    }
  }

  optionsData[#optionsData + 1] = {
    type = "submenu",
    name = "Set Tracker - Role",
    controls = {
      {
        type = "checkbox",
        name = "Tank",
        tooltip = "Check to offer information on tanking gear, uncheck to mark all tank gear as trash.",
        getFunc = function() return TGC.db.options.setTracker.tankRole end,
        setFunc = function(newValue)
          TGC.db.options.setTracker.tankRole = newValue
        end,
        width = "full",
        default = TGC.db.options.setTracker.tankRole,
      }, {
        type = "checkbox",
        name = "Healer",
        tooltip = "Check to offer information on healing gear, uncheck to mark all healer gear as trash.",
        getFunc = function() return TGC.db.options.setTracker.healRole end,
        setFunc = function(newValue)
          TGC.db.options.setTracker.healRole = newValue
        end,
        width = "full",
        default = TGC.db.options.setTracker.healRole,
      }, {
        type = "checkbox",
        name = "Magic DPS",
        tooltip = "Check to offer information on magic dps gear, uncheck to mark all magic dps gear as trash.",
        getFunc = function() return TGC.db.options.setTracker.magDpsRole end,
        setFunc = function(newValue)
          TGC.db.options.setTracker.magDpsRole = newValue
        end,
        width = "full",
        default = TGC.db.options.setTracker.magDpsRole,
      }, {
        type = "checkbox",
        name = "Stamina DPS",
        tooltip = "Check to offer information on stamina dps gear, uncheck to mark all stamina dps gear as trash.",
        getFunc = function() return TGC.db.options.setTracker.stamDpsRole end,
        setFunc = function(newValue)
          TGC.db.options.setTracker.stamDpsRole = newValue
        end,
        width = "full",
        default = TGC.db.options.setTracker.stamDpsRole,
      }, {
        type = "checkbox",
        name = "Support",
        tooltip = "Check to offer information on support gear, uncheck to mark all support gear as trash.",
        getFunc = function() return TGC.db.options.setTracker.supportRole end,
        setFunc = function(newValue)
          TGC.db.options.setTracker.supportRole = newValue
        end,
        width = "full",
        default = TGC.db.options.setTracker.supportRole,
      }
    }
  }

  optionsData[#optionsData + 1] = {
    type = "submenu",
    name = "Set Tracker - Other Options",
    controls = {
      {
        type = "checkbox",
        name = "Trait Trashing",
        tooltip = "Check to offer information on gear regarless of trait, uncheck to mark all gear that doesn't match a build spec with trait as trash.",
        getFunc = function() return TGC.db.options.setTracker.onlyCorrectTrait end,
        setFunc = function(newValue)
          TGC.db.options.setTracker.onlyCorrectTrait = newValue
        end,
        width = "full",
        default = TGC.db.options.setTracker.onlyCorrectTrait,
      }
    }
  }

  LAM:RegisterOptionControls("TheGamingCouncilOptions", optionsData)

end