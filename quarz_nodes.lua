-- Copyright (C) 2022 Norbert Thien, multimediamobil - Region Süd, Lizenz: Creative Commons BY-SA 4.0

local definition = {    -- Beginn verschachtelte Tabelle
	{"quarz_1", "1"}, -- 1. Eintrag der Unter-Tabelle für Node-Name, Textur, Rezept - 2. Eintrag für Description
    {"quarz_2", "2"},
	{"quarz_3", "3"},
	{"quarz_4", "4"},
	{"quarz_5", "5"},
	{"quarz_6", "6"}
} -- Ende verschachtelte Tabelle

for _, row in ipairs(definition) do -- Schleife zum Auslesen der Tabelle »definition«, _ (Unterstrich): übliches formales Vorgehen, wenn ein Rückgabewert nicht benötigt wird, aber abgefangen werden muss

	local name = row[1]			-- ersten Eintrag aus der inneren Tabelle auslesen und der lokalen Variable »name« zuweisen (der Variablenname könnte auch anders lauten)
	local description = row[2]	-- zweiten Eintrag aus der inneren Tabelle auslesen und der lokalen Variable »description« zuweisen (der Variablenname könnte auch anders lauten)

	minetest.register_node("quarz:" .. name, {		-- zusammengesetzten Node-Namen generieren
		description = "Quarz " .. description,	-- zusammengesetzte Beschreibung generieren
		tiles = {
			name .. ".png"	-- zusammengesetzten Textur-Namen generieren
		},
		groups = {
			cracky = 3,
            stone = 1
		}
	})


    -- Zugriff auf den Mod »moreblocks« (genauer auf »stairsplus« - siehe dort »API.md«) - in der »mod.conf« muss »optional_depends = moreblocks« stehen
	if minetest.get_modpath("moreblocks") then
	    stairsplus:register_all("quarz", name, "quarz:" .. name, {	-- zusammengesetzte Namen generieren
            description = "Quarz " .. description,	-- zusammengesetzte Beschreibung generieren
			tiles = {
				name .. ".png"	-- zusammengesetzten Textur-Namen generieren
			},
			paramtype = "light",	-- verhindert u. a. fehlerhafte Lichtberechnung bei Quadern ohne Kantenlänge 1x1x1. Nachteil: Block wird insgesamt lichtdurchlässing
			paramtype2 = "facedir",	-- macht Objekt mit Schraubendreher rotierbar und richtet -Z-Seite beim Ablegen immer in Richtung des Ablegenden
		    groups = {
			    cracky = 3,
                stone = 1,
                not_in_creative_inventory = 1   -- verhindert, dass alle Formen, die die Kreissäge produzieren kann, im Kreativ-Modus das Inventar überfluten
		    },
	    })
	end -- Ende der if-Abfrage zu minetest.get_modpath() - Start in Zeile 32

end     -- Ende for-Schleife (Start in Zeile 14)