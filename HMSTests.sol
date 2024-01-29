pragma solidity >=0.4.21 <0.8.3;
 

contract HMSTests {

    string public title;
    address public CreatedTestBy;
    uint public testCount = 0; 
    uint public lipidtestCount = 0; 
    uint public bloodtestCount = 0; 
    //mapping(address => LipidTest) public GetLipidTest_Adrs;
    //-------------Lipid Test
    mapping(uint => LipidTest) public GetLipidTestList; //by appointment Id;
    mapping(uint => LipidTest) public GetLipidTest_Id; //by appointment Id;
    mapping(string => mapping(uint => LipidTest)) public PatientLapidTestRecord;
    //-------------Blood Group Test
    mapping(uint => BloodGroupingRh) public GetBloodGroupingRhList; //by appointment Id;
    mapping(uint => BloodGroupingRh) public GetBloodGroupingRh_Id; //by appointment Id;
    mapping(string => mapping(uint => BloodGroupingRh)) public PatientBloodGroupingRhRecord;
    
    struct LipidTest{
       uint tst_li_id;
       uint prescription_id;
       string cholestrolHDL;
       string cholestrolLDL;
       string triglycerides;
       string totalCholestrolLDLHDLratio;
       uint appointment_id;
       uint date; 
    }
    

    struct BloodGroupingRh{
       uint tst_bloodG_id;
       uint prescription_id;
       string bloodGroup;
       string rhesusD; 
       uint appointment_id;
       uint date; 
    }

     event LipidTestCreated{
       uint tst_li_id,
       uint prescription_id,
       string cholestrolHDL,
       string cholestrolLDL,
       string triglycerides,
       string totalCholestrolLDLHDLratio,
       uint appointment_id,
       uint date
    }   
    event BloodGroupingRhCreated(
       uint tst_bloodG_id,
       uint prescription_id,
       string bloodGroup,
       string rhesusD,
       uint appointment_id,
       uint date
    );
    constructor() public{
        title = "This HMS is based on Blockchain";
        CreatedTestBy = msg.sender;
    }
    
   // function setPatient(address _address) setPatientId{
        
    //}
    
    function AddLipidTest(string memory _patientUserId, uint _prescription_id, string memory _cholestrolHDL, 
    string memory _cholestrolLDL, string memory _triglycerides, string memory _totalCholestrolLDLHDLratio, 
    uint _appointment_id) public{
        //address patientId = address(sha256(_patientUserName));
        lipidtestCount ++;
        GetLipidTestList[lipidtestCount] = LipidTest(lipidtestCount, _prescription_id, _cholestrolHDL, _cholestrolLDL, _triglycerides, _totalCholestrolLDLHDLratio, _appointment_id, now);
        GetLipidTest_Id[_appointment_id] = LipidTest(lipidtestCount, _prescription_id, _cholestrolHDL, _cholestrolLDL, _triglycerides, _totalCholestrolLDLHDLratio, _appointment_id, now);
        PatientLapidTestRecord[_patientUserId][_appointment_id] = LipidTest(lipidtestCount, _prescription_id, _cholestrolHDL, _cholestrolLDL, _triglycerides, _totalCholestrolLDLHDLratio, _appointment_id, now);
        //emit LipidTestCreated(lipidtestCount, _prescription_id, _cholestrolHDL, _cholestrolLDL, _triglycerides, _totalCholestrolLDLHDLratio, _appointment_id, now);
    }
    
    function AddBloodGroupingRh(string memory _patientUserId, uint _prescription_id, string memory _bloodGroup, 
    string memory _rhesusD, uint _appointment_id) public{ 
        bloodtestCount ++;
        GetBloodGroupingRhList[bloodtestCount] = BloodGroupingRh(bloodtestCount, _prescription_id, _bloodGroup, _rhesusD, _appointment_id, now);
        GetBloodGroupingRh_Id[_appointment_id] = BloodGroupingRh(bloodtestCount, _prescription_id, _bloodGroup, _rhesusD, _appointment_id, now);
        PatientBloodGroupingRhRecord[_patientUserId][_appointment_id] = BloodGroupingRh(bloodtestCount, _prescription_id, _bloodGroup, _rhesusD, _appointment_id, now);
        emit BloodGroupingRhCreated(testCount, _prescription_id, _bloodGroup, _rhesusD, _appointment_id, now);
    }
    
    
    
    
}