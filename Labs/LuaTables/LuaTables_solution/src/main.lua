local sched = require 'sched'

local function main ()

	-- Step.1
	-- Create an array with some random numbers
	-- Remove the second value of the array using table.remove() function
	-- Insert a value in the array using table.insert()
	local array1 = {45, 145, 42, 24, 1337}
	table.remove (array1,2)
	-- insert the value 159
	table.insert (array1,159)
	
	-- Step.2
	-- Complete the following function that print the content of an array given in parameter using a for loop
	-- Call the function to test your code
	local printtable2 = function (array)
		print ("table:")
	
		-- loop on each value of the array
		for i=1,#array do
			print (i.."->"..array[i])
		end
	end
	-- display the table
	printtable2(array1)
	
	-- Step.3
	-- Create an address book, an address book is a table where the key is the name of the 
	-- person and the value a string representing the phone number.
	-- Put some entries in the addressbook
	-- Complete the following function to print the addressbook content
	
	-- The two following notation are equivalent.
	local addressbook3 = {Smith="06318789", ["White"]="0618756187"}
	
	-- A function to print an table
	local printaddressbook3 = function (addressbook)
		print ("addressbook:")
		
		-- Loop on each pair of the table 
		for name,number in pairs(addressbook) do
			print (name..": "..number)
		end
	end
	-- display the table
	printaddressbook3(addressbook3)
	
	-- Step.4
	-- Improve the addressbook by allowing to set more than one phone number by person
	-- (The value of the table should be an array)
	-- Print the new table content to test your code
	local addressbook4 = {Smith={"063839875","078576521"}, White={"0654656498"}}
	-- A function to print the address book
	local printaddressbook4 = function (addressbook)
		print ("addressbook:")
		for name,numbers in pairs(addressbook) do
			print (name..": ")
			-- numbers is now a array of number, we have to iterate on it
			for i=1, #numbers do
				print ("    "..numbers[i])
			end
		end
	end
	-- display the table
	printaddressbook4(addressbook4)
	
	-- Step.5
	-- Improve the addressbook by allowing to set lastname, firstname and company name for a person.
	-- The company can be set or nil
	-- (Use a table as a key of the the addressbook table)
	-- Print the addressbook content to test your code
	local addressbook5 = {[{lastname="Smith", firstname="Jean", company="SierraWireless"}]={"063839875","078576521"},
						  [{lastname="Mc", firstname="Donalds"}]={"0654656498"}}
	-- A function to print the address book
	local printaddressbook5 = function (addressbook)
		print ("addressbook:")
		for info,numbers in pairs(addressbook) do
		
			-- print people inforamtion, the two notation are equals
			local linetoprint = info.lastname.." "..info["firstname"]
			
			-- if the company is not set (equal to 'nil', we will display "no company" string
			linetoprint = linetoprint .. " (".. (info.company or "no company")..")"
			print (linetoprint)
			
			for i=1, #numbers do
				print ("    "..numbers[i])
			end
		end
	end
	-- display the table
	printaddressbook5(addressbook5)
	
	-- Step.6 
	-- Complete the following function to add an entry at an existing addressbook
	-- Complete the following function to remove an entry at an existing addressbook from a given lastname
	-- Call the functions to add/remove entries and print the addressbook
	
	-- Add an entry
	local add = function (addressbook, lastname, firstname, company, numbers)
	
		-- create the info table
		local info = {}
		info.lastname = lastname
		info.firstname = firstname
		info.company = company
		
		-- add it to the addressbook with numbers
		addressbook[info] = numbers 
	end
	
	-- Remove an entry to addressbook
	local remove = function (addressbook, lastname)
		for info,numbers in pairs(addressbook) do
		
			-- Check if current entry have the same lastname 
			if (info.lastname == lastname) then
			
				-- setting the entry value to nil, will remove the whole entry
				addressbook[info] = nil;
			end
		end
	end
	
	-- add a new people
	add(addressbook5, "Marco", "Polo", nil, {"0654984321", "085462149"})
	printaddressbook5(addressbook5)
	
	-- remove a people
	remove(addressbook5,"Smith")
	printaddressbook5(addressbook5)
	
	-- Step.7
	-- Complete the following function to find the first phone number of a given lastname
	-- Call the function and be sure to handle the case where no phone number was found for the given lastname
	local find = function (addressbook, lastname)
		for info,numbers in pairs(addressbook) do
			if (info.lastname == lastname) then
				return numbers[1]
			end
		end
		-- No person found, return an error message
		return nil, "Nobody found for the name:".. lastname
	end
	
	-- find Marco, and handle the case the find function return an error message
	local marconumber, errormessage = find (addressbook5, "Marco")
	-- check if marconumber is nil equals to "marconumber != nil"
	if (marconumber) then
		print("Marco's number:".. marconumber)
	else 
		print (errormessage)
	end
	
	os.exit()
end

sched.run(main)
sched.loop()
