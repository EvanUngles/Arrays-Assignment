/*
 Created by Evan K. Ungles for the Arrays Assignment
 Allows the user to either park or remove a car from a parking garage.  Keeps track of the cars (by their license plate) and which parking space it's in
 
 Definition of an array:
 An array is a data structure for storing a list of values/objects of the same data type.  Each element in the array can be accessed with it's index, which is that item's position in the list (starting at 0)
 
 //Defines an array with elements that have a data type of dataType1
 var arrayName1: [dataType1]
 
 //Defines and initializes an array with the 1st element being value1 and the 2nd element being value2
 //There can be as many elements as necessary, but this example just uses 2
 var arrayName2 = [value1, value2]
 
 //Prints the first element in the array (in this case, it would be value1)
 print(arrayName2[0])
 
 //Sets the value of the 2nd element to value3
 arrayName2[1] = value3         //arrayName2 now holds the values [value1, value3]
 
*/



import Foundation

//Initializes the array of parking spaces
//The number of spaces is hard-coded, but can be changed by editing the line below (must be >0)
Garage.initializeGarage(numSpaces: 15)

while (true)
{
    print("Input the number for what you would like to do (or 0 to quit)")
    print("1: Park a car (\(Garage.numOpenSpaces()) open space(s))")
    print("2: Remove a car")
    
    let response = Int(readLine()!)
    
    if (response == nil)        //If the input isn't a number or has a decimal
    {
        print("Please input a (whole) number")
    }
    else if (response == 0)     //If quit is selected
    {
        print("Shutting down . . . \n")
        break
    }
    else if (response == 1) { parkCar() }
    else if (response == 2) { removeCar() }
    else
    {
        print("\(response!) was not an option, please try again")
    }
    
    print("\n\n\n")
}



//Function for when the user wants to park a car in the garage
func parkCar()
{
    while (true)
    {
        print("\n\(Garage.numOpenSpaces()) space(s) available")
        print("Select a space to park (or 0 to cancel)")
        Garage.displayGarage()
        
        let response = Int(readLine()!)
        
        if (response == nil)        //If the input isn't a number or has a decimal
        {
            print("Please input a (whole) number")
        }
        else if (response == 0)     //If cancel is selected
        {
            break
        }
        else if (Garage.checkSpace(response!-1) != nil)     //If the index is within the array
        {
            print("What is your license plate number?")
            let plate = readLine()!
            
            //Tries to park a car there, and returns to the menu if it's successful
            if (Garage.parkCar(response!-1, plate)) { break }
        }
    }
}



//Function for when the user wants to remove a car from the garage
func removeCar()
{
    while (true)
    {
        print("\nSelect where you parked (or 0 to cancel)")
        Garage.displayGarage()
        
        let response = Int(readLine()!)
        
        if (response == nil)        //If the input isn't a number or has a decimal
        {
            print("Please input a (whole) number")
        }
        else if (response == 0)     //If cancel is selected
        {
            break
        }
        else if (Garage.checkSpace(response!-1) != nil)     //If the index is within the array
        {
            //Tries to remove a car from that space, and returns to the menu if it's successful
            if (Garage.removeCar(response!-1)) { break }
        }
    }
}
