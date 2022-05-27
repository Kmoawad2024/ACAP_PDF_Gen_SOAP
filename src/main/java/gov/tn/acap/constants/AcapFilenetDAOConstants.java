/**
 * 
 */
package gov.tn.acap.constants;

// TODO: Auto-generated Javadoc
/**
 * The Interface AcapFilenetDAOConstants.
 *
 * @author ABalhara
 */
public interface AcapFilenetDAOConstants {
	
	/**
	 * EQUAL_SYMBOL- The String constant for =
	 */
	String EQUAL_SYMBOL="=";
	/**
	 * SPACE - The String constant " " (space).
	 */
	String SPACE=" ";
	/**
	 * SINGLE_QUOTE - The String constant for (') .
	 */
	String SINGLE_QUOTE="'";
	/**
	 * LOGICAL_AND - The String constant for Logical AND Operation.
	 */
	String LOGICAL_AND="AND";
	/**
	 * JUDGE_TYPE - The String constant "JudgeType".
	 */
	String JUDGE_TYPE="JudgeType";
	/**
	 * ONLINE - The String constant "Online".
	 */
	String ONLINE="Online";
	/**
	 * FROM - The String constant "from" for SQL Queries.
	 */
	String FROM="from";
	/**
	 * COMMA - The String constant ",".
	 */
	String COMMA=",";
	/**
	 * ACAP_CLAIMS - The String constant "ACAP_Claims" Class Name.
	 */
	String ACAP_CLAIMS="ACAP_Claims";
	/**
	 * YES - The String constant "Yes".
	 */
	String YES="Yes";
	/**
	 * NO - The String constant "No".
	 */
	String NO="No";
	/**
	 * EMPTY - The String constant hold empty value.
	 */
	String EMPTY="";
	
	/** The claimant prop list. */
	String CLAIMANT_PROP_LIST = "ACAP_First ACAP_Middle ACAP_Last";
	
	/** The xslt break. */
	String XSLT_BREAK="&#x2028;";
	/**
	 * PARENT_QUEY_PROPERTY_LIST - The String constant hold property list for parent query.
	 */
	String PARENT_QUEY_PROPERTY_LIST="ACAP_AuditorLogin ACAP_AssignedJudge ACAP_ClaimantLogin ACAP_Court ACAP_CourtCounty ACAP_CourtDistrict ACAP_DateofDisposition ACAP_DateofWithdrawl ACAP_Disposition ACAP_EdisonID ACAP_First,ACAP_Last ACAP_Middle "
			+ "DateCreated ACAP_Offense ACAP_OffenseType ACAP_Outcome ACAP_PrimaryOffense ACAP_Disposition ACAP_CoCounsel ACAP_Complex ACAP_Sealed ACAP_Indigent ACAP_InterpreterLanguages ACAP_InterpreterCertification ACAP_PrimaryEmailAddress "
			+ "ACAP_ProceedingType ACAP_GuardianAdLitem ACAP_CaseNumbers ACAP_ClientFirst ACAP_ClientLast ACAP_ClientMiddle ACAP_AttorneyLogin ACAP_PreApprovalNumber ACAP_ClaimNumber ACAP_NumberofClients ACAP_InterpreterJudges ACAP_ClaimDate ACAP_BPRNumber "
			+ "ACAP_InterpreterIndigent ACAP_InterpreterActivities ACAP_InterpreterHours ACAP_ConvictionOffense ACAP_DateofLastActivity ACAP_DNRelationship ACAP_GARepresent ACAP_AttorneyType ACAP_Online ACAP_JudgeSignDate ACAP_ProcessStatus "
			+ "ACAP_OperationalStatus ACAP_ClaimantSignDate ACAP_VendorSignDate ACAP_AuditorSignDate ACAP_EscalationStatus";
	/**
	 * CHILD_QUEY_PROPERTY_LIST - The String constant hold property list for child query.
	 */
	String CHILD_QUEY_PROPERTY_LIST="ACAP_FirmName ACAP_FirmAddress2 ACAP_FirmStreet ACAP_FirmCity ACAP_FirmState ACAP_FirmZipcode ACAP_PhoneNumber ACAP_ClaimantLogin ACAP_Role";
	/**
	 * FORM_XML_PROPERTY_LIST - The String constant hold property list for form xml.
	 */
	String FORM_XML_PROPERTY_LIST="ACAP_TotalUnpaidMonies ACAP_AssignedJudge ACAP_ClaimantLogin ACAP_Court ACAP_CourtCounty ACAP_CourtDistrict ACAP_DateofDisposition ACAP_DateofWithdrawl ACAP_Disposition ACAP_EdisonID ACAP_First,ACAP_Last ACAP_Middle DateCreated ACAP_Offense ACAP_OffenseType ACAP_Outcome ACAP_PrimaryOffense ACAP_Disposition ACAP_FirmName ACAP_FirmAddress2 ACAP_FirmStreet ACAP_FirmCity ACAP_FirmState ACAP_FirmZipcode ACAP_PhoneNumber ACAP_ClaimantLogin ACAP_Role PropertyDescriptions SymbolicName Cardinality DataType";
	/**
	 * ACAP_CLAIM_NUMBER - The String constant hold name of column ACAP_ClaimNumber.
	 */
	String ACAP_CLAIM_NUMBER="ACAP_ClaimNumber";
	
	/** The acap claimantregistration. */
	String ACAP_CLAIMANTREGISTRATION="ACAP_ClaimantRegistration";
	
	String INTERPRETER_TIME_LOG_CLAIM="Time Log Billing";
	/**
	 * ATTORNEY_FEE_CLAIM_CAPITAL - The String constant hold Interpreter Claim value.
	 */
	String INTERPRETER_CLAIM = "Interpreter Claim";
	/**
	 * ACAP_CLAIMANT_LOGIN - The String constant hold name of column ACAP_ClaimantLogin.
	 */
	String ACAP_CLAIMANT_LOGIN="ACAP_ClaimantLogin";
	
	String ACAP_CASE_TYPE_ID = "ACAP_CaseTypeID";
	
    String ACAP_PROCESSESCALATIONREASON="ACAP_ProcessEscalationReason";
    
    String ACAP_TOTALAMOUNT="ACAP_TotalAmount";
    
    String ACAP_AUDITORLOGIN="ACAP_AuditorLogin";
    
    /*1.1.5*/
    
    String ACAP_AUDITORSIGNDATE="ACAP_AuditorSignDate";
    
    String ACAP_PROCESSSTATUS="ACAP_ProcessStatus";
    String ACAP_ESCALATIONSTATUS="ACAP_EscalationStatus";
    /*1.1.5*/
    
	/**
	 * ACAP_CLAIMANT_TYPE - The String constant hold name of column ACAP_ClaimantType.
	 */
	String ACAP_CLAIMANT_TYPE="ACAP_ClaimantType";
	/**
	 * ACAP_FIRST - The String constant hold name of column ACAP_First.
	 */
	String ACAP_FIRST="ACAP_First";
	/**
	 * ACAP_LAST - The String constant hold name of column ACAP_Last.
	 */
	String ACAP_LAST="ACAP_Last";
	/**
	 * ACAP_MIDDLE - The String constant hold name of column ACAP_Middle.
	 */
	String ACAP_MIDDLE="ACAP_Middle";
	
	/** The acap vendor name. */
	String ACAP_VENDOR_NAME="ACAP_Vendor_Name";
	
	/** The interpreter name. */
	String INTERPRETER_NAME="Interpreter_Name";
	
	/** The acap attorneylogin. */
	String ACAP_ATTORNEYLOGIN="ACAP_AttorneyLogin";
	
	/** The d n claim. */
	String D_N_CLAIM="Dependency and Neglect Claim";
	
	/** The GAL In Adoption claim. */
	String GAL_IN_ADOPTION_CLAIM="GAL in Adoption";
	
	/** The expert witness claim. */
	String EXPERT_WITNESS_CLAIM="Expert Witness/Investigator Claim";
	/**
	 * CLAIM_DOC_PROPERTY_LIST - The String constant hold property list for ACAP_CLaim document class.
	 */	
	String CLAIM_DOC_PROPERTY_LIST="ACAP_AssignedJudge ACAP_DateofDisposition ACAP_Last ACAP_Offense ACAP_ClaimAmount ACAP_ClaimNumber ACAP_ClaimDate ACAP_DefendantID ACAP_ExpenseAmount";
	/**
	 * OFFENSE_CLASS_XML_TAG - The String constant "ACAP_OffenseClass".
	 */
	String OFFENSE_CLASS_XML_TAG="ACAP_OffenseClass";
	
	/** The tca section xml tag. */
	String TCA_SECTION_XML_TAG="TCA_Section";
	
	/** The primary offense desc. */
	String PRIMARY_OFFENSE_DESC="Primary_Offense_Desc";
	/**
	 * ACAP_OFFENSE - The String constant hold name of column ACAP_Offense.
	 */
	String ACAP_OFFENSE="ACAP_Offense";
	
	/** The date format. */
	String DATE_FORMAT="MM/dd/yyyy";
	
	/** The acap case numbers. */
	String ACAP_CASE_NUMBERS="ACAP_CaseNumbers";
	
	/** The case. */
	String CASE="case";
	
	/** The acap dob. */
	String ACAP_DOB="ACAP_DatesofBirth";
	
	/** The acap interpreter judges. */
	String ACAP_INTERPRETER_JUDGES="ACAP_InterpreterJudges";
	
	/** The acap interpreter indigent. */
	String ACAP_INTERPRETER_INDIGENT="ACAP_InterpreterIndigent";
	
	/** The acap interpreter activities. */
	String ACAP_INTERPRETER_ACTIVITIES="ACAP_InterpreterActivities";
	
	/** The acap interpreter hours. */
	String ACAP_INTERPRETER_HOURS="ACAP_InterpreterHours";
	
	/** The acap number of clients. */
	String ACAP_NUMBER_OF_CLIENTS="ACAP_NumberofClients";
	
	/** The judgeId. */
	String JUDGE_ID="judgeId";
	
	/** The indigent. */
	String INDIGENT="indigent";
	
	/** The activity. */
	String ACTIVITY="activity";
	
	/** The hours. */
	String HOURS="hours";
	
	/** The Wait hours. */
	String WAIT_HOURS="WaitingHours";
	
	/** The Wait time. */
	String WAIT_TIME="Wait Time";
	
	/** The tca. */
	String TCA="tca";
	
	/** The getTCACodeDescription. */
	String GET_TCA_CODE_DESC="getTCACodeDescription";
	
	/** The dob. */
	String DOB="dob";
	
	/** The acap client first. */
	String ACAP_CLIENT_FIRST="ACAP_ClientFirst";
	
	/** The first. */
	String FIRST="first";
	
	/** The last. */
	String LAST="last";
	
	/** The middle. */
	String MIDDLE="middle";
	
	/** The relation. */
	String RELATION="relation";
	
	/** The acap client middle. */
	String ACAP_CLIENT_MIDDLE="ACAP_ClientMiddle";
	
	/** The acap client last. */
	String ACAP_CLIENT_LAST="ACAP_ClientLast";
	
	/** The acap DN Relationship. */
	String ACAP_DN_RELATIONSHIP="ACAP_DNRelationship";
	
	
	/** The children xml tag. */
	String CHILDREN_XML_TAG="Children";
	
	/** The interpreter judges xml tag. */
	String INTERPRETER_JUDGES_XML_TAG="InterpreterJudges";
	
	/** The name xml tag. */
	String NAME_XML_TAG="Name";
	
	/** The dob xml tag. */
	String DOB_XML_TAG="DOB";
	
	/** The judge id tag. */
	String JUDGE_XML_TAG="Judge";
	
	/** The case number xml tag. */
	String CASE_NUMBER_XML_TAG="Case_Number";
	
	/** The client first xml tag. */
	String CLIENT_FIRST_XML_TAG="ClientFirst";
	
	/** The client middle xml tag. */
	String CLIENT_MIDDLE_XML_TAG="ClientMiddle";
	
	/** The client last xml tag. */
	String CLIENT_LAST_XML_TAG="ClientLast";
	
	/** The child xml tag. */
	String CHILD_XML_TAG="Child";
	
	/** The judge Name xml tag. */
	String JUDGE_NAME_XML_TAG="JudgeName";
	
	/** The new. */
	String NEW="New";
	
	/** The acap claim status. */
	String ACAP_CLAIM_STATUS="ACAP_ClaimStatus";
	
	/** The approved by judge. */
	String APPROVED_BY_JUDGE="Approved by Judge";
	
	/** The approved by judge tag. */
	String APPROVED_BY_JUDGE_TAG="ApprovedByJudge";
	
	/** The awaiting judge signature. */
	String AWAITING_JUDGE_SIGNATURE="Awaitng Judge Signature";
	
	/** The awaiting judge signature tag. */
	String AWAITING_JUDGE_SIGNATURE_TAG="AwaitngJudgeSignature";
	
	/** The submit for aoc review. */
	String SUBMIT_FOR_AOC_REVIEW="Submit for AOC Review";
	
	/** The submit for final approval. */
	String SUBMIT_FOR_FINAL_APPROVAL="Submit for Final Approval";
	
	/** The Paid. */
	String PAID="Paid";
	
    /** The submit for aoc review tag. */
    String SUBMIT_FOR_AOC_REVIEW_TAG="SubmitforAOCReview";
	
	/** The submit for final approval tag. */
	String SUBMIT_FOR_FINAL_APPROVAL_TAG="SubmitforFinalApproval";
	
	/** The acap online. */
	String ACAP_ONLINE="ACAP_Online";
	
	/** The acap phone number. */
	String ACAP_PHONE_NUMBER = "ACAP_PhoneNumber";
	
	/** The Child Support Flat Rate claim. */
	String CHILD_SUPPORT_FLAT_FEE_CLAIM = "Flat Rate Billing";
	
	String JH_DOCKET_BILLING_CLAIM="Judicial Hospitalization Docket Billing";
	
	/** The judicial clerk fees. */
	String JUDICIAL_CLERK_FEES = "Judicial Clerk Fees";
	
	String FIRST_DOCKET_NO="FirstDocketNo";
	String LAST_DOCKET_NO="LastDocketNo";
}
