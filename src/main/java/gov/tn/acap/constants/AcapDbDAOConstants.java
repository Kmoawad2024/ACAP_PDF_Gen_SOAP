/**
 * 
 */
package gov.tn.acap.constants;

/**
 * @author ABalhara
 *
 */
public interface AcapDbDAOConstants {
	
	/**
	 * XML_OUTCOURT_TAG - The String constant for OutCourt Xml Tag
	 */
	String XML_OUTCOURT_TAG="OutCourt";
	/**
	 * XML_INCOURT_TAG - The String constant for Incourt Xml Tag.
	 */
	String XML_INCOURT_TAG="Incourt";
	
	/**
	 * XML_NECESSARY_EXPENSES_TAG - The String constant for NecessaryExpenses Xml Tag.
	 */
	String XML_NECESSARY_EXPENSES_TAG="NecessaryExpenses";
	/**
	 * XML_ITEMIZED_ITEM_TAG - The String constant for itemizedExpense Tag.
	 */
	String XML_ITEMIZED_ITEM_TAG="itemizedExpense";
	/**
	 * EMPTY - The String constant hold empty value.
	 */
	String EMPTY="";
	/**
	 * CLAIM_EXPENSE_TOTAL_COST - The String constant hold name of column ClaimExpenseTotalCost.
	 */
	String CLAIM_EXPENSE_TOTAL_COST="ClaimExpenseTotalCost";
	/**
	 * AUDIT_APPROVED_TOTAL_COST - The String constant hold name of column AuditApprovedTotalCost.
	 */
	String AUDIT_APPROVED_TOTAL_COST="AuditApprovedTotalCost";
	
	String AUDIT_APPROVED_QUANTITY="AuditApprovedQuantity";
	
	/**
	 * ZERO - The String constant hold 0.00 as default cost value.
	 */
	String ZERO="0.00";
	/**
	 * ATTORNEY_FEE_CLAIM_CAPITAL - The String constant hold Interpreter Claim value.
	 */
	String INTERPRETER_CLAIM="Interpreter Claim";
	/**
	 * PARAM_IN_COURT - The String constant hold value of sql query parameter.
	 */
	String[] PARAM_IN_COURT = {"Attorney In Court","Expert Witness Hours","Wait Time","Interpret In Court","Interpreter Court"};
	/**
	 * PARAM_OUT_COURT - The String constant hold value of sql query parameter.
	 */
	String[] PARAM_OUT_COURT = {"Attorney Out of Court","Interpret Out of Court","Balanced Monies","Other","Travel Time"};
	
	/**
	 * PARAM_IN_OUT_COURT - The String constant hold value of sql query parameter.
	 */
	String[] PARAM_IN_OUT_COURT = {"Attorney In Court","Expert Witness Hours","Wait Time","Interpret In Court","Interpreter Court","Attorney Out of Court","Interpret Out of Court","Balanced Monies","Other","Travel Time"};
	
		/**
	 * PARAM_WORDS - The String constant hold value of sql query parameter.
	 */
	String PARAM_WORDS = "%Words%";
	/**
	 * WORDS - The String constant hold Words value.
	 */
	String WORDS="Words";
	/**
	 * HOURS - The String constant hold Hours value .
	 */
	String HOURS="Hours";
	
	String YES="Yes";
	
	String NO="No";
	
	String EXPENSES="Expenses";
	
	String PARAM_TRAVEL_TIME="Travel Time";
	
	String XML_TRAVEL_TIME_TAG="TravelTimeExpenses";
	/**
	 * CHILD_SUPPORT_CONTEMPT - The String constant hold value of sql query parameter.
	 */
	String CHILD_SUPPORT_CONTEMPT = "Child Support Contempt";
	
	/** The Expert or witness claim. */
	String EXPERT_OR_WITNESS_CLAIM = "Expert Witness/Investigator Claim";
	
	/** The Child Support Flat Rate claim. */
	String CHILD_SUPPORT_FLAT_FEE_CLAIM = "Flat Rate Billing";
	
	String PARAM_HOURS="%Hours%";
	
	/**
	 * PARAM_CHILD_SUPPORT_CONTEMPT - The String constant hold value of sql query parameter.
	 */
	String PARAM_CHILD_SUPPORT_CONTEMPT = "Child Support Contempt";
	/**
	 * PARAM_CHILD_SUPPORT_GREATER_THAN_4 - The String constant hold value of sql query parameter.
	 */
	String PARAM_CHILD_SUPPORT_GREATER_THAN_4 = "Child Support Contempt (>4)";
	/**
	 * PARAM_CHILD_SUPPORT_PAC - The String constant hold value of sql query parameter.
	 */
	String PARAM_CHILD_SUPPORT_PAC = "Child Support Contempt (PAC)";
	
	String IS_PARENT_ADVISIORY="isParentAdvisiory";
	
	String IS_HEARING_GREATER_THAN_4="isHearingGreaterThan4";
	
	String INTERPRETER_TIME_LOG_CLAIM="Time Log Billing";
	
	String JUDICIAL_CLERK_FEES = "Judicial Clerk Fees";
	
	String JH_DOCKET_BILLING_CLAIM="Judicial Hospitalization Docket Billing";
	
	/** The GAL In Adoption claim.*/
	String GAL_IN_ADOPTION_CLAIM="GAL in Adoption";
	
	 /**
	  * PARAM_IS_CONTINUED - The String constant hold value of sql query parameter.
	  */
	String PARAM_IS_CONTINUED = "%Continued%";
	 
	String IS_CONTINUANCE_XML_TAG="isContinuance";
	 
	/**
	 * CHILD_SUPPORT_CONTEMPT - Abbreviation.
	 */
	String CSS = "CSS";
	String CSSGT4 = "CSSGT4";
	String CSSPAC = "CSSPAC";
}
