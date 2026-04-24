//
//  Created by Evan K. Ungles for the Arrays Assignment
//

class Garage
{
    static var parkingSpaces: [String?] = [nil]
    
    //Resets parkingSpaces to a list of nil strings with a length of numSpaces
    static func initializeGarage(numSpaces: Int)
    {
        parkingSpaces = [String?](repeating: nil, count: numSpaces)
    }
    
    
    
    //Prints out the each space number and if that space is occupied
    //The space number is shifted by +1 so it starts at 1 instead of 0 (space number = index + 1)
    static func displayGarage()
    {
        for i in 0...parkingSpaces.count-1
        {
            var status = checkSpace(i)!
            
            //If the space is occupied, adds on the license plate of the car in that space
            if (status == "Occupied")
            {
                status += " (\(parkingSpaces[i]!))"
            }
            
            print("\(i+1): \(status)")
        }
    }
    
    
    
    //Returns "Open" or "Occupied" if the index is within the array, otherwise it returns nil
    static func checkSpace(_ index: Int) -> String?
    {
        //Checks if the index is within the array before continuing
        if (index < 0 || index >= parkingSpaces.count)
        {
            print("\(index+1) was not an option, please choose a parking space between 1 and \(parkingSpaces.count)")
            return nil
        }
        
        //Returns the status of the space
        if (parkingSpaces[index] == nil) { return "Open" }
        else { return "Occupied" }
    }
    
    
    
    //Tries to park a car at the given index, and returns whether it was successful
    static func parkCar(_ index: Int, _ plate: String) -> Bool
    {
        //Verifies that the index is within the array (primary check should be in the caller using checkSpace())
        if (checkSpace(index) == nil) { return false }
        
        
        //Checks if the space is available
        if (parkingSpaces[index] == nil)
        {
            //Update the parking space
            parkingSpaces[index] = plate
            return true
        }
        else
        {
            print("Space number \(index+1) is taken, please choose a different parking space")
            return false
        }
    }
    
    
    
    //Tries to remove the car at the given index, and returns whether it was successful
    static func removeCar(_ index: Int) -> Bool
    {
        //Verifies that the index is within the array (primary check is in the caller using checkSpace())
        if (checkSpace(index) == nil) { return false }
        
        
        //Checks if there is a car in that space
        if (parkingSpaces[index] != nil)
        {
            parkingSpaces[index] = nil
            return true
        }
        else
        {
            print("Space number \(index+1) is already empty")
            return false
        }
    }
    
    
    
    //Returns the number of empty spaces
    static func numOpenSpaces() -> Int
    {
        var numOpen = 0
        for space in parkingSpaces
        {
            if (space == nil) { numOpen += 1 }
        }
        
        return numOpen
    }
}
