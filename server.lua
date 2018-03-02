--[[
            SecurityVans - spawn multiple vans and rob them.
              Copyright (C) 2018 FiveM-Scripts

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with SecurityVans in the file "LICENSE". If not, see <http://www.gnu.org/licenses/>.
]]

AddEventHandler('onResourceStart', function()
	local version = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)

	PerformHttpRequest("https://updates.fivem-scripts.org/verify/" .. GetCurrentResourceName(), function(err, rData, headers)
		print("\nStarting SecurityVans ".. version .."\n----------------------------------------------------")
		if err == 404 then
			print("\nUPDATE ERROR: your version could not be verified.\n")
			print("Verify that the folder in your resources directory is named SecurityVans.")
			print("\n----------------------------------------------------")	
		else
			local vData = json.decode(rData)
			if vData.version ~= version then
				print("You are running an outdated version of " .. GetCurrentResourceName() ..".")
				print("Please get the latest version from our GitHub page.")
				print("----------------------------------------------------")
			else
				print("You are running the latest version of ".. GetCurrentResourceName() ..".\n----------------------------------------------------")							
			end
		end

		end, "GET", "", {["Content-Type"] = 'application/json'})
	
	end)