/**
 * 
 */
package gov.tn.acap.constants;

/**
 * The Interface AcapFNOperationsConstants.
 *
 * @author ABalhara
 */
public interface AcapFNOperationsConstants {

	/**
	 * ATTORNEY_FEE_CLAIM_CAPITAL- The String constant hold Attorney Fee Claim
	 * - Capital value
	 */
	String ATTORNEY_FEE_CLAIM_CAPITAL = "Attorney Fee Claim - Capital";
	/**
	 * ATTORNEY_FEE_CLAIM_CAPITAL - The String constant hold Interpreter Claim
	 * value.
	 */
	String INTERPRETER_CLAIM = "Interpreter Claim";
	/**
	 * ATTORNEY_FEE_CLAIM_CAPITAL - The String constant hold Judicial
	 * Hospitalization Claim value.
	 */
	String JUDICIAL_HOSPITALIZATION_CLAIM = "Judicial Hospitalization Claim";
	/**
	 * EMPTY - The String constant hold empty value.
	 */
	String EMPTY = "";
	/**
	 * DOCUMENT - The String constant hold Document value.
	 */
	String DOCUMENT = "Document";

	/** The claim document. */
	String CLAIM_DOCUMENT = "ACAP_Claim";

	/** The id. */
	String ID = "Id";

	/**
	 * DOCUMENT_TITLE - The String constant hold DocumentTitle value.
	 */
	String DOCUMENT_TITLE = "DocumentTitle";
	/**
	 * AOC_FORM_DATA - The String constant hold AOC Form Data value.
	 */
	String AOC_FORM_DATA = "AOC Form Data";
	/**
	 * APPLICATION_PDF - The String constant hold MIME TYPE (e.g.
	 * application/pdf ) value.
	 */
	String APPLICATION_PDF = "application/pdf";
	/**
	 * NEW_DOCUMENT_VIA_JAVA_API - The String constant hold New Document via
	 * Java API value.
	 */
	String NEW_DOCUMENT_VIA_JAVA_API = "New Document via Java API";

	/** The attorney fee claim non capital xsl. */
	String ATTORNEY_FEE_CLAIM_NON_CAPITAL_XSL = "Attorney_Fee_Capital_Non_Claim.xsl";

	/** The dependency and neglect claim xsl. */
	String DEPENDENCY_AND_NEGLECT_CLAIM_XSL = "D_N_Form.xsl";

	/** The parole revocation claim xsl. */
	String PAROLE_REVOCATION_CLAIM_XSL = "Parole_Revocation_Form.xsl";

	/** The judicial hospitalization claim xsl. */
	String JUDICIAL_HOSPITALIZATION_CLAIM_XSL = "JH_Standard_Form.xsl";

	/** The interpreter claim xsl. */
	String INTERPRETER_CLAIM_XSL = "Interpreter.xsl";

	/** The attorney fee claim capital xsl. */
	String ATTORNEY_FEE_CLAIM_CAPITAL_XSL = "Attorney_Fee_Capital_Claim.xsl";

	/** The Expert or witness claim xsl. */
	String EXPERT_OR_WITNESS_CLAIM_XSL = "Expert_Or_Witness_Claim.xsl";

	/** The Child Support claim xsl. */
	String CHILD_SUPPORT_CLAIM_XSL = "CSFlat.xsl";

	/** The Expert or witness claim. */
	String EXPERT_OR_WITNESS_CLAIM = "Expert Witness/Investigator Claim";

	/** The Child Support Flat Rate claim. */
	String CHILD_SUPPORT_FLAT_FEE_CLAIM = "Flat Rate Billing";

	/** The attorney fee claim non capital. */
	String ATTORNEY_FEE_CLAIM_NON_CAPITAL = "Attorney Fee Claim - Non-Capital";

	/** The dependency and neglect claim. */
	String DEPENDENCY_AND_NEGLECT_CLAIM = "Dependency and Neglect Claim";

	/** The parole revocation claim. */
	String PAROLE_REVOCATION_CLAIM = "Parole Revocation Claim";

	/** The interpreter time log claim. */
	String INTERPRETER_TIME_LOG_CLAIM = "Time Log Billing";

	/** The jh docket billing claim. */
	String JH_DOCKET_BILLING_CLAIM = "Judicial Hospitalization Docket Billing";
	
	/** The judicial clerk fees. */
	String JUDICIAL_CLERK_FEES = "Judicial Clerk Fees";
	
	/** The judicial clerk fees xsl. */
	String JUDICIAL_CLERK_FEES_XSL = "J_H_Clerk.xsl";

	/** The jh docket billing claim xsl. */
	String JH_DOCKET_BILLING_CLAIM_XSL = "J_H_Docket_Rate.xsl";

	/** The interpreter time log claim xsl. */
	String INTERPRETER_TIME_LOG_CLAIM_XSL = "Interpreter_TimeLog_Billing.xsl";
	
	/** The GAL IN ADOPTION. */
	String GAL_IN_ADOPTION = "GAL in Adoption";

	/** The GAL IN ADOPTION. */
	String GAL_IN_ADOPTION_XSL = "GAL_In_Adoption.xsl";
	
	/** The filenetp8wsi. */
	String FILENETP8WSI = "FileNetP8WSI";

	/**
	 * CLAIM_DOC_PROPERTY_LIST - The String constant hold property list for
	 * ACAP_CLaim document class.
	 */
	String CLAIM_DOC_PROPERTY_LIST = "ACAP_AssignedJudge ACAP_DateofDisposition ACAP_Last ACAP_Offense ACAP_ClaimAmount ACAP_ClaimNumber ACAP_ClaimDate ACAP_DefendantID ACAP_ExpenseAmount";

	/** The comma. */
	String COMMA = ",";

	/** The jh clerk. */
	String JH_CLERK = "JH-Clerk";

	/** The jh clerk xsl. */
	String JH_CLERK_XSL = "JH_Clerk.xsl";

	/** The msg user blank. */
	String MSG_USER_BLANK = "Service account cannot be blank.";
	
	/** The msg user invalid. */
	String MSG_USER_INVALID = "Invalid service account was passed. Please contact administrator.";
	
	/** The claim number. */
	String CLAIM_NUMBER = "ACAP_ClaimNumber";
	
	/** The claim doc search. */
	String CLAIM_DOC_SEARCH = "select Id from ACAP_Claim where IsCurrentVersion = true AND ACAP_ClaimNumber='";
	
	/** The judge pattern. */
	String JUDGE_PATTERN = "<JudgeApprovedTotalCost>(.*?)</JudgeApprovedTotalCost>";

	/** The claim pattern. */
	String CLAIM_PATTERN = "<ReimbursementTotal>(.*?)</ReimbursementTotal>";

	/** The acap defendantid. */
	String ACAP_DEFENDANTID = "ACAP_DefendantID";
	
	/** The acap claimantlogin. */
	String ACAP_CLAIMANTLOGIN = "ACAP_ClaimantLogin";
	
	/** The acap offensetype. */
	String ACAP_OFFENSETYPE = "ACAP_OffenseType";
	
	/** The acap dateofdisposition. */
	String ACAP_DATEOFDISPOSITION = "ACAP_DateofDisposition";
	
	/** The acap expenseamt. */
	String ACAP_EXPENSEAMT = "ACAP_ExpenseAmount";
	
	/** The acap claimamt. */
	String ACAP_CLAIMAMT = "ACAP_ClaimAmount";

	/** The acap assignedjudge. */
	String ACAP_ASSIGNEDJUDGE = "ACAP_AssignedJudge";

	/** The acap last. */
	String ACAP_LAST = "ACAP_Last";
	
	/** The acap Pre_approcal and Orders Document Classes */
	String ACAP_PREAPPROVALORDERS="ACAP_PreApprovalOrders";
	String ACAP_Orders="ACAP_Orders";
	String ACAP_Receipts="ACAP_Receipts";

}
