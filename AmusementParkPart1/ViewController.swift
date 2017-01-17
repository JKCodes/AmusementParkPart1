//
//  ViewController.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/6/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // Note that there is no UI for this project.  In order to test, uncomment the function call.
    // Feel free to further comment out the test as needed within the function as well
    // Only the first test is uncommented by default
    
    
    // Passes and Swiper
    let passes = AmusementPass()
    var cardSwiper = CardSwiper()
    var timer = Timer()
    
    // Below are the plug data. I know I can filter/map these values, 
    // BUT that's covered in Unit 5, so I decided to just do the below for the Unit 4's project
    
    let data = ["firstName": "Morgan",
                "lastName": "Shearer",
                "streetAddress": "123 Abc Street",
                "city": "Abington",
                "state": "AB",
                "zipCode": "12345",
                "ssn": "123456789",
                "dob": "12-23-1999",
                "managementTier": ManagerTier.generalMgr.rawValue]
    let missingFirstNameData = ["lastName": "Shearer",
                            "streetAddress": "123 Abc Street",
                            "city": "Abington",
                            "state": "AB",
                            "zipCode": "12345",
                            "ssn": "123456789",
                            "dob": "12-23-1999",
                            "managementTier": ManagerTier.generalMgr.rawValue]
    let missingLastNameData = ["firstName": "Morgan",
                                "streetAddress": "123 Abc Street",
                                "city": "Abington",
                                "state": "AB",
                                "zipCode": "12345",
                                "ssn": "123456789",
                                "dob": "12-23-1999",
                                "managementTier": ManagerTier.generalMgr.rawValue]
    let missingStreetAddressData = ["firstName": "Morgan",
                                "lastName": "Shearer",
                                "city": "Abington",
                                "state": "AB",
                                "zipCode": "12345",
                                "ssn": "123456789",
                                "dob": "12-23-1999",
                                "managementTier": ManagerTier.generalMgr.rawValue]
    let missingCityData = ["firstName": "Morgan",
                                "lastName": "Shearer",
                                "streetAddress": "123 Abc Street",
                                "state": "AB",
                                "zipCode": "12345",
                                "ssn": "123456789",
                                "dob": "12-23-1999",
                                "managementTier": ManagerTier.generalMgr.rawValue]
    let missingStateData = ["firstName": "Morgan",
                                "lastName": "Shearer",
                                "streetAddress": "123 Abc Street",
                                "city": "Abington",
                                "zipCode": "12345",
                                "ssn": "123456789",
                                "dob": "12-23-1999",
                                "managementTier": ManagerTier.generalMgr.rawValue]
    let missingZipCodeData = ["firstName": "Morgan",
                                "lastName": "Shearer",
                                "streetAddress": "123 Abc Street",
                                "city": "Abington",
                                "state": "AB",
                                "ssn": "123456789",
                                "dob": "12-23-1999",
                                "managementTier": ManagerTier.generalMgr.rawValue]
    let missingSSNData = ["firstName": "Morgan",
                                "lastName": "Shearer",
                                "streetAddress": "123 Abc Street",
                                "city": "Abington",
                                "state": "AB",
                                "zipCode": "12345",
                                "dob": "12-23-1999",
                                "managementTier": ManagerTier.generalMgr.rawValue]
    let missingDOBData = ["firstName": "Morgan",
                                "lastName": "Shearer",
                                "streetAddress": "123 Abc Street",
                                "city": "Abington",
                                "state": "AB",
                                "zipCode": "12345",
                                "ssn": "123456789",
                                "managementTier": ManagerTier.generalMgr.rawValue]
    let missingManagementTierData = ["firstName": "Morgan",
                                "lastName": "Shearer",
                                "streetAddress": "123 Abc Street",
                                "city": "Abington",
                                "state": "AB",
                                "zipCode": "12345",
                                "ssn": "123456789",
                                "dob": "12-23-1999"]
    
    // MARK: ViewDidLoad - I understand how this can be hard to find
    override func viewDidLoad() {
        super.viewDidLoad()
        testMain()
    }
    
    
    // MARK: The main test area - disable function calls here
    func testMain() {
        
        
        classicGuestTest()
        //vipGuestTest()
        
        //doubleSwipeTest()
        
        
        // MARK: Stubs for testing GuestTypes
        
        // MARK: Test Classic Guest  (comment out individual swipe tests to hear sounds for one test)
        
        //     let classicGuest = passGenerator.createPass(forEntrant: GuestType.classic)
        //     print(cardReader.discountAccess(forPass: classicGuest)) // prints list of available discounts
        //     print(cardReader.areaAccess(forPass: classicGuest)) // prints all areas accessible to pass
        //     print(classicGuest.contactDetails) // how to access contact details (classic guest won't have any)
        // test swipe feature
        //     print(cardReader.swipeAccess(classicGuest, discountFor: .food(classicGuest.foodDiscount)))
        //     print(cardReader.swipeAccess(classicGuest, discountFor: .merchandise(classicGuest.merchandiseDiscount)))
        //     print(cardReader.swipeAccess(classicGuest, hasAccessTo: .amusement))  // does have access
        //     print(cardReader.swipeAccess(classicGuest, hasAccessTo: .maintenance)) // doesn't have access
        //     print(cardReader.swipeAccess(classicGuest, hasRideAccess: .allRides(classicGuest.allRideAccess)))
        //     print(cardReader.swipeAccess(classicGuest, hasRideAccess: .skipsQueues(classicGuest.skipsQueues)))
        
        // MARK: Test VIP Guest
        
        //     let vipGuest = passGenerator.createPass(forEntrant: GuestType.VIP)
        //     print(cardReader.discountAccess(forPass: vipGuest)) // prints list of available discounts
        //     print(cardReader.areaAccess(forPass: vipGuest)) // prints all areas accessible to pass
        //     print(vipGuest.contactDetails) // how to access contact details (classic guest won't have any)
        //     // test swipe feature
        //     print(cardReader.swipeAccess(vipGuest, discountFor: .food(vipGuest.foodDiscount)))
        //     print(cardReader.swipeAccess(vipGuest, discountFor: .merchandise(vipGuest.merchandiseDiscount)))
        //     print(cardReader.swipeAccess(vipGuest, hasAccessTo: .amusement))  // does have access
        //     print(cardReader.swipeAccess(vipGuest, hasAccessTo: .maintenance)) // doesn't have access
        //     print(cardReader.swipeAccess(vipGuest, hasRideAccess: .allRides(vipGuest.allRideAccess)))
        //     print(cardReader.swipeAccess(vipGuest, hasRideAccess: .skipsQueues(vipGuest.skipsQueues)))
        
        // MARK: Test Validating BirthDates
        
        //    let badDateFormat = "12-25-2014"
        //    let tooOld = "2009-10-07"
        //    let badDatePass = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: badDateFormat)) // should throw error for invalid date format  *********(for now defaults to classic pass, will convert to allow for re-entering info when UI implemented to handle incorrect format (An error message is still printed)
        //    let tooOldPass = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: tooOld)) // should throw fails age requirement error (message printed to console) pass will default to classic pass
        //    print("Pass converted to: \(tooOldPass.type)")
        
        // MARK: Test Free Child Pass -- will trigger Happy Birthday
        //     let birthDate = "2014-11-07" // Make sure date is current month, day to test Birthday message
        //     let childGuest = passGenerator.createPass(forEntrant: GuestType.freeChild(birthdate: birthDate))
        //     print(cardReader.discountAccess(forPass: childGuest)) // prints list of available discounts
        //     print(cardReader.areaAccess(forPass: childGuest)) // prints all areas accessible to pass
        //     print(childGuest.contactDetails) // how to access contact details (classic guest won't have any)
        //      // test swipe feature
        //     print(cardReader.swipeAccess(childGuest, discountFor: .food(childGuest.foodDiscount)))
        //     print(cardReader.swipeAccess(childGuest, discountFor: .merchandise(childGuest.merchandiseDiscount)))
        //     print(cardReader.swipeAccess(childGuest, hasAccessTo: .amusement))  // does have access
        //     print(cardReader.swipeAccess(childGuest, hasAccessTo: .maintenance)) // doesn't have access
        //     print(cardReader.swipeAccess(childGuest, hasRideAccess: .allRides(childGuest.allRideAccess)))
        //     print(cardReader.swipeAccess(childGuest, hasRideAccess: .skipsQueues(childGuest.skipsQueues)))
        
        // MARK: Info for testing employee and manager contact information
        
        //    let correctInfo = ["firstName": "John", "lastName": "Doe", "streetAddress": "123 Wonder Road",
        //                "city": "Somewhere Out there", "state": "FL", "zipCode": "90210"]
        //    let contactInfo = ContactInformation(withDictionary: correctInfo)! // force unwrapping since I know it contains correct values
        //
        //    let incorrectInfo = ["firstName": "Kathy", "lastName": "Ebel"]
        //    let failingInfo = ContactInformation(withDictionary: incorrectInfo) // cannot create contact info if dictionary doesn't have correct values
        //    if let goodInfo = failingInfo {
        //      let failingPass = passGenerator.createPass(forEntrant: HourlyEmployeeType.rideServices(goodInfo))
        //      print(failingPass.contactDetails)
        //    } else {
        //        print("Info was bad, so pass not created")
        //
        //    }

    }
    
    func initialTestSetup() {
        timer.invalidate()
        passes.deleteAll()
        cardSwiper.reset()
    }
    
    
    // MARK: Disable the below swipes as necessary to test
    func accessTest(for currentPass: Pass) {
    
        
        // Tests Area Access - all five locations
        print(cardSwiper.swipe(currentPass, for: .amusement))
        print(cardSwiper.swipe(currentPass, for: .kitchen))
        print(cardSwiper.swipe(currentPass, for: .rideControl))
        print(cardSwiper.swipe(currentPass, for: .maintenance))
        print(cardSwiper.swipe(currentPass, for: .office))
        
        // Tests Ride Access - Access to all rides (this should always pass) and skip lines
        print(cardSwiper.swipe(currentPass, for: .allRides(currentPass.allRides)))
        print(cardSwiper.swipe(currentPass, for: .skipLine(currentPass.skipAllowed)))
        
        // Tests Discount Access - Both food and merchandise discount test
        print(cardSwiper.swipe(currentPass, for: .food(currentPass.foodDiscount)))
        print(cardSwiper.swipe(currentPass, for: .merchandise(currentPass.merchandiseDiscount)))
    }
    
    func requiredInfoTest(for currentPass: Pass) {

    }
    
    // MARK: Classic Guest Test
    func classicGuestTest() {
        initialTestSetup()
        
        // Grabs the first pass - for this test, this is the ONLY pass
        let testPass = passes.getPass(atIndex: 0)

        // Creates a classic guest with no personal data
        // Omitted
        passes.create(for: Guest.classic)
        
        accessTest(for: testPass)
        requiredInfoTest(for: testPass)
    }
    
    // MARK: VIP Guest Test
    func vipGuestTest() {
        initialTestSetup()

        // Grabs the first pass - for this test, this is the ONLY pass
        let testPass = passes.getPass(atIndex: 0)
        
        // Creates a VIP guest with no personal data
        // This will not raise any errors for this entrant type
        passes.create(for: Guest.vip)
        
        accessTest(for: testPass)
        requiredInfoTest(for: testPass)
    }
    
    // MARK: Free Child Guest Test
    func childGuestTest() {
        initialTestSetup()
        
        // Grabs the first pass - for this test, this is the ONLY pass
        let testPass = passes.getPass(atIndex: 0)
        
        // Creates a classic guest with no personal data
        // This will not raise any errors for this entrant type
        passes.create(for: Guest.child(birthday: <#T##SimpleDate#>))
        
        accessTest(for: testPass)
        requiredInfoTest(for: testPass)
    }
    
    
    // MARK: Double Swipe Test
    func doubleSwipeTest() {
        initialTestSetup()
        passes.create(for: Guest.classic, data: data)
        print(cardSwiper.swipe(passes.getPass(atIndex: 0), for: .allRides(passes.getPass(atIndex: 0).allRides)))
        
        // Feel free to change the timer to any number. Under current setting, anything under 5 seconds will fail.
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in // timer just to test the timeStamp feature... card reader tracks timeStamps
            print(self.cardSwiper.swipe(self.passes.getPass(atIndex: 0), for: .allRides(self.passes.getPass(atIndex: 0).allRides)))
        }
        
        // While the above timer is running, a series of adding two more Passes and then running four additonal swipes that will not trigger the double swipe is run
        passes.create(for: Guest.child(birthday: SimpleDate(year: 1999, month: 11, day: 13)), data: data)
        passes.create(for: Manager.manager, data: data)
        print(cardSwiper.swipe(passes.getPass(atIndex: 0), for: .food(passes.getPass(atIndex: 0).foodDiscount)))
        print(cardSwiper.swipe(passes.getPass(atIndex: 2), for: .office))
        print(cardSwiper.swipe(passes.getPass(atIndex: 2), for: .office))
        print(cardSwiper.swipe(passes.getPass(atIndex: 1), for: .office))
        
        
    }
}

