//
//  ViewController.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/6/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // Note that there is no UI for this project.  In order to test, run the app and uncomment the function calls.
    // Feel free to further comment out the test as needed within the function as well
    // Only the first test is uncommented by default
    
    
    // Passes and Swiper
    let passes = AmusementPass()
    var cardSwiper = CardSwiper()
    
    // Timer for double swipe prevention
    var timer = Timer()
    
    // Today variable is used to test birthday.
    // The year is set to current year, but the year value is irrelevant for birthday message
    let today = SimpleDate(year: NSCalendar.current.component(.year, from: Date()),
                           month: NSCalendar.current.component(.month, from: Date()),
                           day: NSCalendar.current.component(.day, from: Date()))

    // Below are the requested hard-coded plug data
    let data = [PersonalData.firstName.rawValue: "Morgan",
                PersonalData.lastName.rawValue: "Shearer",
                PersonalData.streetAddress.rawValue: "123 Abc Street",
                PersonalData.city.rawValue: "Abington",
                PersonalData.state.rawValue: "AB",
                PersonalData.zipCode.rawValue: "12345",
                PersonalData.ssn.rawValue: "123456789",
                PersonalData.dob.rawValue: "12-23-1999",
                PersonalData.managementTier.rawValue: ManagerTier.generalMgr.rawValue]
    let badDateFormatdata = [PersonalData.firstName.rawValue: "Morgan",
                PersonalData.lastName.rawValue: "Shearer",
                PersonalData.streetAddress.rawValue: "123 Abc Street",
                PersonalData.city.rawValue: "Abington",
                PersonalData.state.rawValue: "AB",
                PersonalData.zipCode.rawValue: "12345",
                PersonalData.ssn.rawValue: "123456789",
                PersonalData.dob.rawValue: "1999-12-23",
                PersonalData.managementTier.rawValue: ManagerTier.shiftMgr.rawValue]
    let missingFirstNameData = [PersonalData.lastName.rawValue: "Shearer",
                            PersonalData.streetAddress.rawValue: "123 Abc Street",
                            PersonalData.city.rawValue: "Abington",
                            PersonalData.state.rawValue: "AB",
                            PersonalData.zipCode.rawValue: "12345",
                            PersonalData.ssn.rawValue: "123456789",
                            PersonalData.dob.rawValue: "12-23-1999",
                            PersonalData.managementTier.rawValue: ManagerTier.seniorMgr.rawValue]
    let missingLastNameData = [PersonalData.firstName.rawValue: "Morgan",
                                PersonalData.streetAddress.rawValue: "123 Abc Street",
                                PersonalData.city.rawValue: "Abington",
                                PersonalData.state.rawValue: "AB",
                                PersonalData.zipCode.rawValue: "12345",
                                PersonalData.ssn.rawValue: "123456789",
                                PersonalData.dob.rawValue: "12-23-1999",
                                PersonalData.managementTier.rawValue: ManagerTier.generalMgr.rawValue]
    let missingStreetAddressData = [PersonalData.firstName.rawValue: "Morgan",
                                PersonalData.lastName.rawValue: "Shearer",
                                PersonalData.city.rawValue: "Abington",
                                PersonalData.state.rawValue: "AB",
                                PersonalData.zipCode.rawValue: "12345",
                                PersonalData.ssn.rawValue: "123456789",
                                PersonalData.dob.rawValue: "12-23-1999",
                                PersonalData.managementTier.rawValue: ManagerTier.seniorMgr.rawValue]
    let missingCityData = [PersonalData.firstName.rawValue: "Morgan",
                                PersonalData.lastName.rawValue: "Shearer",
                                PersonalData.streetAddress.rawValue: "123 Abc Street",
                                PersonalData.state.rawValue: "AB",
                                PersonalData.zipCode.rawValue: "12345",
                                PersonalData.ssn.rawValue: "123456789",
                                PersonalData.dob.rawValue: "12-23-1999",
                                PersonalData.managementTier.rawValue: ManagerTier.shiftMgr.rawValue]
    let missingStateData = [PersonalData.firstName.rawValue: "Morgan",
                                PersonalData.lastName.rawValue: "Shearer",
                                PersonalData.streetAddress.rawValue: "123 Abc Street",
                                PersonalData.city.rawValue: "Abington",
                                PersonalData.zipCode.rawValue: "12345",
                                PersonalData.ssn.rawValue: "123456789",
                                PersonalData.dob.rawValue: "12-23-1999",
                                PersonalData.managementTier.rawValue: ManagerTier.generalMgr.rawValue]
    let missingZipCodeData = [PersonalData.firstName.rawValue: "Morgan",
                                PersonalData.lastName.rawValue: "Shearer",
                                PersonalData.streetAddress.rawValue: "123 Abc Street",
                                PersonalData.city.rawValue: "Abington",
                                PersonalData.state.rawValue: "AB",
                                PersonalData.ssn.rawValue: "123456789",
                                PersonalData.dob.rawValue: "12-23-1999",
                                PersonalData.managementTier.rawValue: ManagerTier.generalMgr.rawValue]
    let missingSSNData = [PersonalData.firstName.rawValue: "Morgan",
                                PersonalData.lastName.rawValue: "Shearer",
                                PersonalData.streetAddress.rawValue: "123 Abc Street",
                                PersonalData.city.rawValue: "Abington",
                                PersonalData.state.rawValue: "AB",
                                PersonalData.zipCode.rawValue: "12345",
                                PersonalData.dob.rawValue: "12-23-1999",
                                PersonalData.managementTier.rawValue: ManagerTier.seniorMgr.rawValue]
    let missingDOBData = [PersonalData.firstName.rawValue: "Morgan",
                                PersonalData.lastName.rawValue: "Shearer",
                                PersonalData.streetAddress.rawValue: "123 Abc Street",
                                PersonalData.city.rawValue: "Abington",
                                PersonalData.state.rawValue: "AB",
                                PersonalData.zipCode.rawValue: "12345",
                                PersonalData.ssn.rawValue: "123456789",
                                PersonalData.managementTier.rawValue: ManagerTier.shiftMgr.rawValue]
    let missingManagementTierData = [PersonalData.firstName.rawValue: "Morgan",
                                PersonalData.lastName.rawValue: "Shearer",
                                PersonalData.streetAddress.rawValue: "123 Abc Street",
                                PersonalData.city.rawValue: "Abington",
                                PersonalData.state.rawValue: "AB",
                                PersonalData.zipCode.rawValue: "12345",
                                PersonalData.ssn.rawValue: "123456789",
                                PersonalData.dob.rawValue: "12-23-1999"]
    
    // MARK: ViewDidLoad - I understand how this can be hard to find
    override func viewDidLoad() {
        super.viewDidLoad()
        testMain()  // If you comment this out, absolutely nothing will happen when the program is run
    }
    
    
    // MARK: The main test area - enable/disable function calls here
    func testMain() {
        
        //first test uncommented for your convenience; every other test will need to be uncommented manually
        dateFormatTest()
//        classicGuestTest()
//        vipGuestTest()
//        childGuestTest()
//        hourlyEmployeeFoodServicesTest()
//        hourlyEmployeeRideServicesTest()
//        hourlyEmployeeMaintenanceTest()
//        managerTest()
//        doubleSwipeTest()
        
        // index out of order test
//        let _ = passes.getPass(atIndex: 1000)
    }
    
    /// Runs before any test is run
    func initialTestSetup() {
        // Invalidates any running timers (for double swipe) and deletes all passes and resets the card swiper
        
        timer.invalidate()
        passes.deleteAll()
        cardSwiper.reset()
    }
    
    // MARK: Date Format test
    func dateFormatTest() {
        // Note: there are no sound effects - these are triggered during pass creation not during swipe
        
        
        // Resets and sets up test
        initialTestSetup()
        
        // Wrong Date Format Test
        var testData = data
        testData[PersonalData.dob.rawValue] = "1999-11-23"
        passes.create(for: Guest.classic, data: testData)
        
        // Completely Invalid Date
//        testData[PersonalData.dob.rawValue] = "dd234ijifejoa"
//        passes.create(for: Guest.classic, data: testData)
        
    }
    
    
    // MARK: Disable the below swipes as necessary to test
    func accessTest(for currentPass: Pass) {
    
        
        // Tests Area Access - all five locations
//        print(cardSwiper.swipe(currentPass, for: .amusement))
//        print(cardSwiper.swipe(currentPass, for: .kitchen))
//        print(cardSwiper.swipe(currentPass, for: .rideControl))
//        print(cardSwiper.swipe(currentPass, for: .maintenance))
//        print(cardSwiper.swipe(currentPass, for: .office))
        
        // Tests Ride Access - Access to all rides (this should always pass) and skip lines
        // testAccess makes sure that while checking for access, double swipe is not triggered
//        print(cardSwiper.swipe(currentPass, for: .allRides(currentPass.allRides), testAccess: true))
//        print(cardSwiper.swipe(currentPass, for: .skipLine(currentPass.skipAllowed), testAccess: true))
        
        // Tests Discount Access - Both food and merchandise discount test
//        print(cardSwiper.swipe(currentPass, for: .food(currentPass.foodDiscount)))
//        print(cardSwiper.swipe(currentPass, for: .merchandise(currentPass.merchandiseDiscount)))
    }
    
    // MARK: Age Test
    func ageTest(for currentPass: Pass) {
        
        // Note that onlly child guess paasses require age verification at the moment
 
        // The below three cases: 4 years old, exactly 5 years old and 6 years old
        // Rejects all riders up to 5 years old.  Yes, this means only one of the three below will pass (4 years old)
//        let fourYearsOld = SimpleDate(year: today.year - 4, month: today.month, day: today.day)
//        let fiveYearsOld = SimpleDate(year: today.year - 5, month: today.month, day: today.day)
//        let sixYearsOld = SimpleDate(year: today.year - 6, month: today.month, day: today.day)
        
        // Makes a copy of the full data defined well above
//        var tempData = data
        
        // Three pass creations that tests age check trigger for 4, 5, and 6 year olds
        // No swipe sounds - age checked during pass creation
//        tempData[PersonalData.dob.rawValue] = fourYearsOld.toString()
//        passes.create(for: Guest.child, data: tempData)
 
//        tempData[PersonalData.dob.rawValue] = fiveYearsOld.toString()
//        passes.create(for: Guest.child, data: tempData)
        
//        tempData[PersonalData.dob.rawValue] = sixYearsOld.toString()
//        passes.create(for: Guest.child, data: tempData)
        
    }
    
    // MARK: Required Info Test
    func requiredInfoTest(for entrant: Entrant) {
        // Creates the specified entrant passes with a specific missing field
        // testMode toggles whether age check calculation will be performed on pass creation
        // true = no age check => Useful when using hard plug data defined above
        
//        print("\nStart of required data processing")
//        passes.create(for: entrant, data: missingFirstNameData, testMode: true)
//        passes.create(for: entrant, data: missingLastNameData, testMode: true)
//        passes.create(for: entrant, data: missingStreetAddressData, testMode: true)
//        passes.create(for: entrant, data: missingCityData, testMode: true)
//        passes.create(for: entrant, data: missingStateData, testMode: true)
//        passes.create(for: entrant, data: missingZipCodeData, testMode: true)
//        passes.create(for: entrant, data: missingSSNData, testMode: true)
//        passes.create(for: entrant, data: missingDOBData, testMode: true)
//        passes.create(for: entrant, data: missingManagementTierData, testMode: true)
//        print("End of required data processing\n")
    }
    
    // MARK: Classic Guest Test
    func classicGuestTest() {
        
        // Sets up test and creates a pass with all fields populated
        // Note that the first pass CANNOT raise an errors due to incompleteness
//        initialTestSetup()
//        passes.create(for: Guest.classic, data: data)
        
        // Grabs the first pass
//        let testPass = passes.getPass(atIndex: 0)
        
        // For classic guests, no errors should be thrown
//        requiredInfoTest(for: Guest.classic)
        
        // Tests Access for various areas
//        accessTest(for: testPass)
        
        // Birthday Test - Modifies dob of testPass
        // Note: Birthday message is displayed when any of the swipe method is used
//        passes.updateEntrantInfo(testPass, key: PersonalData.dob.rawValue, with: today.toString())
//        print(cardSwiper.swipe(testPass, for: .amusement))
        
        // Birthday Test - Missing DOB
        // This tests how the birthday message behaves if the dob does not exist
//        passes.removeEntrantInfo(testPass, key: PersonalData.dob.rawValue)
//        print(cardSwiper.swipe(testPass, for: .kitchen))
    }
    
    // MARK: VIP Guest Test
    func vipGuestTest() {

        // Sets up test and creates a pass with all fields populated
        // Note that the first pass CANNOT raise an errors due to incompleteness
//        initialTestSetup()
//        passes.create(for: Guest.vip, data: data)
        
        // Grabs the first pass
//        let testPass = passes.getPass(atIndex: 0)
        
        // For vip guests, no errors should be thrown
//        requiredInfoTest(for: Guest.vip)
        
        // Tests Access for various areas
//        accessTest(for: testPass)

        // Birthday Test - Modifies dob of testPass
        // Testing showing of birthday message for kitchen access
//        passes.updateEntrantInfo(testPass, key: PersonalData.dob.rawValue, with: today.toString())
//        print(cardSwiper.swipe(testPass, for: .rideControl))
        
        // Birthday Test - Missing DOB
        // This tests how the birthday message behaves if the dob does not exist
//        passes.removeEntrantInfo(testPass, key: PersonalData.dob.rawValue)
//        print(cardSwiper.swipe(testPass, for: .maintenance))
    }
    

    // MARK: Free Child Guest Test
    func childGuestTest() {
        
        // Sets up test and creates a pass with all fields populated
        // Note that the first pass CANNOT raise an errors due to incompleteness
//        initialTestSetup()
//        passes.create(for: Guest.child, data: data, testMode: true)
        
        // Grabs the first pass
//        let testPass = passes.getPass(atIndex: 0)
        
        // For child guests, a dob field must be present
//        requiredInfoTest(for: Guest.child)
        
        // Tests Access for various area
//        accessTest(for: testPass)

        // Birthday Test - Modifies dob of testPass
//        passes.updateEntrantInfo(testPass, key: PersonalData.dob.rawValue, with: today.toString())
//        print(cardSwiper.swipe(testPass, for: .office))
        
        // Birthday Test - Missing DOB
        // This tests how the birthday message behaves if the dob does not exist
        // No Birthday message should be displayed
//        passes.removeEntrantInfo(testPass, key: PersonalData.dob.rawValue)
//        print(cardSwiper.swipe(testPass, for: .allRides(testPass.allRides), testAccess: true))
        
        // Age test is also necessary for child passes
//        ageTest(for: testPass)
    }
    
    // MARK: Hourly Food Test
    func hourlyEmployeeFoodServicesTest() {
        
        // Sets up test and creates a pass with all fields populated
        // Note that the first pass CANNOT raise an errors due to incompleteness
//        initialTestSetup()
//        passes.create(for: HourlyEmployee.foodServices, data: data)
        
        // Grabs the first pass
//        let testPass = passes.getPass(atIndex: 0)
        
        // For all hourly employees, all but management tier is required
//        requiredInfoTest(for: HourlyEmployee.foodServices)
        
        // Tests Access for various areas
//        accessTest(for: testPass)
        
        // Birthday Test - Modifies dob of testPass
        // Testing showing of birthday message for kitchen access
//        passes.updateEntrantInfo(testPass, key: PersonalData.dob.rawValue, with: today.toString())
//        print(cardSwiper.swipe(testPass, for: .food(testPass.foodDiscount)))
        
        // Birthday Test - Missing DOB
        // This tests how the birthday message behaves if the dob does not exist
//        passes.removeEntrantInfo(testPass, key: PersonalData.dob.rawValue)
//        print(cardSwiper.swipe(testPass, for: .skipLine(testPass.skipAllowed), testAccess: true))
    }
    
    // MARK: Hourly Ride Test
    func hourlyEmployeeRideServicesTest() {
        
        // Sets up test and creates a pass with all fields populated
        // Note that the first pass CANNOT raise an errors due to incompleteness
//        initialTestSetup()
//        passes.create(for: HourlyEmployee.rideServices, data: data)
        
        // Grabs the first pass
//        let testPass = passes.getPass(atIndex: 0)
        
        // For all hourly employees, all but management tier is required
//        requiredInfoTest(for: HourlyEmployee.rideServices)
        
        // Tests Access for various areas
//        accessTest(for: testPass)
        
        // Birthday Test - Modifies dob of testPass
        // Testing showing of birthday message for kitchen access
//        passes.updateEntrantInfo(testPass, key: PersonalData.dob.rawValue, with: today.toString())
//        print(cardSwiper.swipe(testPass, for: .merchandise(testPass.merchandiseDiscount)))
        
        // Birthday Test - Missing DOB
        // This tests how the birthday message behaves if the dob does not exist
//        passes.removeEntrantInfo(testPass, key: PersonalData.dob.rawValue)
//        print(cardSwiper.swipe(testPass, for: .amusement))
    }
    
    // MARK: Hourly Maintenance Test
    func hourlyEmployeeMaintenanceTest() {
        
        // Sets up test and creates a pass with all fields populated
        // Note that the first pass CANNOT raise an errors due to incompleteness
//        initialTestSetup()
//        passes.create(for: HourlyEmployee.maintenance, data: data)
        
        // Grabs the first pass
//        let testPass = passes.getPass(atIndex: 0)
        
        // For all hourly employees, all but management tier is required
//        requiredInfoTest(for: HourlyEmployee.maintenance)
        
        // Tests Access for various areas
//        accessTest(for: testPass)
        
        // Birthday test omitted. they are fully exhausted in above examples
    }
    
    // MARK: Manager Test
    func managerTest() {
        
        // Sets up test and creates a pass with all fields populated
        // Note that the first pass CANNOT raise an errors due to incompleteness
//        initialTestSetup()
//        passes.create(for: Manager.manager, data: data)
        
        // Grabs the first pass
//        let testPass = passes.getPass(atIndex: 0)
        
        // All Fields are required for a manager
//        requiredInfoTest(for: Manager.manager)
        
        // Tests Access for various areas
//        accessTest(for: testPass)
        
        // Birthday test omitted. they are fully exhausted in above examples
    }
    
    
    // MARK: Double Swipe Test
    func doubleSwipeTest() {
        // Sets up test and creates a pass with all fields populated
//        initialTestSetup()
//        passes.create(for: Guest.classic, data: data)
        
        // First swipe for rides
//        print(cardSwiper.swipe(passes.getPass(atIndex: 0), for: .allRides(passes.getPass(atIndex: 0).allRides)))
        
        // Feel free to change the timer to any number. 15 seconds is the cooldown timer for allowance
//        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
//            print(self.cardSwiper.swipe(self.passes.getPass(atIndex: 0), for: .allRides(self.passes.getPass(atIndex: 0).allRides)))
//        }
        
        // While the above timer is running, two more passes are added
//        passes.create(for: Guest.classic, data: data)       // Index is 1
//        passes.create(for: Manager.manager, data: data)     // Index is 2
        
        // None of the four below swipes will trigger the double swipe, AND they are run while the timer is counting down
//        print(cardSwiper.swipe(passes.getPass(atIndex: 0), for: .food(passes.getPass(atIndex: 0).foodDiscount)))
//        print(cardSwiper.swipe(passes.getPass(atIndex: 2), for: .office))
//        print(cardSwiper.swipe(passes.getPass(atIndex: 2), for: .office))
//        print(cardSwiper.swipe(passes.getPass(atIndex: 1), for: .office))
    }
}

