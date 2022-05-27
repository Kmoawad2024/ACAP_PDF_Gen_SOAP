package gov.tn.acap.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.dom4j.Element;
import org.springframework.beans.factory.annotation.Autowired;

import gov.tn.acap.constants.AcapDbDAOConstants;
import gov.tn.acap.dao.AcapDbDAO;
import gov.tn.acap.dao.impl.AcapDbExpense.LineItemDetails;
import gov.tn.acap.exception.AcapDataAccessException;

import com.google.common.collect.Ordering;
import org.joda.time.DateTimeComparator;

public class AcapDbDAOImpl implements AcapDbDAO, AcapDbDAOConstants {

	private static Logger logger = Logger.getLogger(AcapDbDAOImpl.class);

	@Autowired
	private DataSource dataSource;
	private String dbSqlOnlIncourtQry;
	private String dbSqlOnlOutcourtQry;
	private String dbSqlOnlInterNcsryExpsQry;
	private String dbSqlOnlNcsryExpscourtQry;
	private String dbSqlsumJATCandAATCQry;
	private String dbSqlCategoryQry;
	private String dbSqlOnlHoursQry;
	private String dbSqlOnlInterWordsExpsQry;
	private String dbSqlTimeLogTotQry;
	private String dbSqlTravelTimeChildSupporttQry;
	private String dbSqlContinuedQry;
	private String dbSqlTimeLogUnitCost;
	private String dbSqlChildSupporttQry;
	private String dbSqlJHDBQry;
	private String dbSqlGALMaxServiceDt;
	
	public String getdbSqlGALMaxServiceDt() {
		return dbSqlGALMaxServiceDt;
	}

	public void setdbSqlGALMaxServiceDt(String dbSqlGALMaxServiceDt) {
		this.dbSqlGALMaxServiceDt = dbSqlGALMaxServiceDt;
	}
	
	public String getDbSqlJHDBQry() {
		return dbSqlJHDBQry;
	}

	public void setDbSqlJHDBQry(String dbSqlJHDBQry) {
		this.dbSqlJHDBQry = dbSqlJHDBQry;
	}

	public String getDbSqlOnlOutcourtQry() {
		return dbSqlOnlOutcourtQry;
	}

	public String getDbSqlChildSupporttQry() {
		return dbSqlChildSupporttQry;
	}

	public void setDbSqlChildSupporttQry(String dbSqlChildSupporttQry) {
		this.dbSqlChildSupporttQry = dbSqlChildSupporttQry;
	}

	public void setDbSqlOnlOutcourtQry(String dbSqlOnlOutcourtQry) {
		this.dbSqlOnlOutcourtQry = dbSqlOnlOutcourtQry;
	}


	public String getDbSqlTravelTimeChildSupporttQry() {
		return dbSqlTravelTimeChildSupporttQry;
	}

	public void setDbSqlTravelTimeChildSupporttQry(String dbSqlTravelTimeChildSupporttQry) {
		this.dbSqlTravelTimeChildSupporttQry = dbSqlTravelTimeChildSupporttQry;
	}

	public String getDbSqlContinuedQry() {
		return dbSqlContinuedQry;
	}

	public void setDbSqlContinuedQry(String dbSqlContinuedQry) {
		this.dbSqlContinuedQry = dbSqlContinuedQry;
	}

	private static float reimbursementTotal=0.000f;

	/**
	 * @return the dbSqlOnlHoursQry
	 */
	public String getDbSqlOnlHoursQry() {
		return dbSqlOnlHoursQry;
	}

	/**
	 * @param dbSqlOnlHoursQry the dbSqlOnlHoursQry to set
	 */
	public void setDbSqlOnlHoursQry(String dbSqlOnlHoursQry) {
		this.dbSqlOnlHoursQry = dbSqlOnlHoursQry;
	}

	/**
	 * Gets the db sql onl inter words exps qry.
	 *
	 * @return the db sql onl inter words exps qry
	 */
	public String getDbSqlOnlInterWordsExpsQry() {
		return dbSqlOnlInterWordsExpsQry;
	}

	public void setDbSqlOnlInterWordsExpsQry(String dbSqlOnlInterWordsExpsQry) {
		this.dbSqlOnlInterWordsExpsQry = dbSqlOnlInterWordsExpsQry;
	}

	/**
	 * @return the dataSource
	 */
	public DataSource getDataSource() {
		return dataSource;
	}

	/**
	 * @param dataSource the dataSource to set
	 */
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public String getDbSqlTimeLogTotQry() {
		return dbSqlTimeLogTotQry;
	}

	public void setDbSqlTimeLogTotQry(String dbSqlTimeLogTotQry) {
		this.dbSqlTimeLogTotQry = dbSqlTimeLogTotQry;
	}

	/**
	 * @return the dbSqlOnlInterNcsryExpsQry
	 */
	public String getDbSqlOnlInterNcsryExpsQry() {
		return dbSqlOnlInterNcsryExpsQry;
	}

	/**
	 * @param dbSqlOnlInterNcsryExpsQry the dbSqlOnlInterNcsryExpsQry to set
	 */
	public void setDbSqlOnlInterNcsryExpsQry(String dbSqlOnlInterNcsryExpsQry) {
		this.dbSqlOnlInterNcsryExpsQry = dbSqlOnlInterNcsryExpsQry;
	}

	/**
	 * @return the dbSqlOnlIncourtQry
	 */
	public String getDbSqlOnlIncourtQry() {
		return dbSqlOnlIncourtQry;
	}

	/**
	 * @param dbSqlOnlIncourtQry the dbSqlOnlIncourtQry to set
	 */
	public void setDbSqlOnlIncourtQry(String dbSqlOnlIncourtQry) {
		this.dbSqlOnlIncourtQry = dbSqlOnlIncourtQry;
	}

	/**
	 * @return the dbSqlOnlNcsryExpscourtQry
	 */
	public String getDbSqlOnlNcsryExpscourtQry() {
		return dbSqlOnlNcsryExpscourtQry;
	}

	/**
	 * @param dbSqlOnlNcsryExpscourtQry the dbSqlOnlNcsryExpscourtQry to set
	 */
	public void setDbSqlOnlNcsryExpscourtQry(String dbSqlOnlNcsryExpscourtQry) {
		this.dbSqlOnlNcsryExpscourtQry = dbSqlOnlNcsryExpscourtQry;
	}



	/**
	 * @return the dbSqlsumJATCandAATCQry
	 */
	public String getDbSqlsumJATCandAATCQry() {
		return dbSqlsumJATCandAATCQry;
	}

	/**
	 * @param dbSqlsumJATCandAATCQry the dbSqlsumJATCandAATCQry to set
	 */
	public void setDbSqlsumJATCandAATCQry(String dbSqlsumJATCandAATCQry) {
		this.dbSqlsumJATCandAATCQry = dbSqlsumJATCandAATCQry;
	}





	public String getDbSqlCategoryQry() {
		return dbSqlCategoryQry;
	}

	public String getDbSqlTimeLogUnitCost() {
		return dbSqlTimeLogUnitCost;
	}

	public void setDbSqlTimeLogUnitCost(String dbSqlTimeLogUnitCost) {
		this.dbSqlTimeLogUnitCost = dbSqlTimeLogUnitCost;
	}

	public void setDbSqlCategoryQry(String dbSqlCategoryQry) {
		this.dbSqlCategoryQry = dbSqlCategoryQry;
	}

	/**Get getDbData
	 *
	 * @param rootName
	 * @param isWaitingForApproval
	 * @param claimNumber
	 * @param claimStatus
	 * @param folderId
	 * @param claimType
	 * @param claimentLogin
	 * @return statement
	 * @throws AcapDataAccessException
	 */
	@Override
	public String getDbData(Element rootName, String isWaitingForApproval, String claimNumber, float noOfClients,
			String folderId, String claimType, String claimentLogin,String caseTypeId,float unpaidExpanses) throws AcapDataAccessException {

		if (logger.isInfoEnabled()) {
			logger.info("AcapDbDAOImpl#getDb#start");
		}

		Connection connection = null;
		PreparedStatement statement = null;
		PreparedStatement statement1 = null;
		PreparedStatement statement2 = null;

		ResultSet resultSet = null;
		ResultSet resultSet1 = null;
		ResultSet resultSet2 = null;

		String inCourtQuery=EMPTY, outCourtQuery=EMPTY, neccessaryExpensesCourtQuery=EMPTY,wordsQuery=EMPTY,interpreterNecessaryExpenses=EMPTY,interHrsQuery=EMPTY;
		String sumJATCandAATCQuery = dbSqlsumJATCandAATCQry;
		String categoryQuery = EMPTY,timeLogUnitCost=EMPTY,timeLogQry=EMPTY,timeLogTotQry=EMPTY,travelTimeChildSupporttQry=EMPTY,dbSqlContinuedQry=EMPTY,dbSqlChildSupporttQry=EMPTY,dbSqlJHDBQry=EMPTY;
		String dbSqlGALMaxServiceDtQry = EMPTY;
		//pick SQL queries from properties file based on online and offline Judge.
		inCourtQuery = this.getDbSqlOnlIncourtQry();
		outCourtQuery = this.getDbSqlOnlOutcourtQry();
		travelTimeChildSupporttQry = this.getDbSqlTravelTimeChildSupporttQry();
		dbSqlChildSupporttQry = this.getDbSqlChildSupporttQry();
		dbSqlContinuedQry = this.getDbSqlContinuedQry();
		dbSqlJHDBQry=this.getDbSqlJHDBQry();
		neccessaryExpensesCourtQuery = this.getDbSqlOnlNcsryExpscourtQry();
		wordsQuery = this.getDbSqlOnlInterWordsExpsQry();
		interHrsQuery=this.getDbSqlOnlHoursQry();
		interpreterNecessaryExpenses=this.getDbSqlOnlInterNcsryExpsQry();
		categoryQuery = this.getDbSqlCategoryQry();
		timeLogQry=this.getDbSqlCategoryQry();
		timeLogTotQry=this.getDbSqlTimeLogTotQry();
		timeLogUnitCost=this.getDbSqlTimeLogUnitCost();
		
		dbSqlGALMaxServiceDtQry = this.getdbSqlGALMaxServiceDt();

		//Adding itemizedItem tag as the root element in xml for database data.
		Element results = rootName.addElement(XML_ITEMIZED_ITEM_TAG);
		ResultSetMetaData rsmd;
		int colCount;
		List<AcapDbExpense> claimDBExpenseList  = new ArrayList<AcapDbExpense>();
		try {
			//getting connection with data source.
			connection = this.getDataSource().getConnection();
			if(!claimType.equalsIgnoreCase(JUDICIAL_CLERK_FEES) && !claimType.equalsIgnoreCase(JH_DOCKET_BILLING_CLAIM) && !claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM)&&!claimType.equalsIgnoreCase(INTERPRETER_CLAIM)&&(!claimType.equalsIgnoreCase(EXPERT_OR_WITNESS_CLAIM)&&(!claimType.equalsIgnoreCase(CHILD_SUPPORT_FLAT_FEE_CLAIM)))){
				//Preparing Incourt Query.
				statement = prepareQuery(claimNumber, claimentLogin, connection, inCourtQuery);
				for(int idx = 0; idx < PARAM_IN_COURT.length;idx++) {
					statement.setString(idx+3, PARAM_IN_COURT[idx]);
				}
				//Executing Incourt Query and getting resultset for it.
				resultSet = statement.executeQuery();
				//iterateResultSet(resultSet, results,XML_INCOURT_TAG);
				iterateResultSet2(resultSet, results,XML_INCOURT_TAG,claimDBExpenseList);
				//Preparing Outcourt Query.
				statement = statement = prepareQuery(claimNumber, claimentLogin, connection, outCourtQuery);
				for(int idx = 0; idx < PARAM_OUT_COURT.length; idx++) {
					statement.setString(idx+3, PARAM_OUT_COURT[idx]);
					}
				//Executing Outcourt Query and getting resultset for it.
				resultSet = statement.executeQuery();
				//iterateResultSet(resultSet, results,XML_OUTCOURT_TAG);
				iterateResultSet2(resultSet, results,XML_OUTCOURT_TAG,claimDBExpenseList);
				statement = prepareQuery(claimNumber, claimentLogin, connection,neccessaryExpensesCourtQuery);
				for(int idx = 0; idx < PARAM_IN_OUT_COURT.length; idx++) {
					statement.setString(idx+3, PARAM_IN_OUT_COURT[idx]);
				}

				//Executing Necessary Expense Query and getting resultset for it.
				resultSet = statement.executeQuery();
				//iterateResultSet(resultSet, results,XML_NECESSARY_EXPENSES_TAG);
				iterateResultSet2(resultSet, results,XML_NECESSARY_EXPENSES_TAG,claimDBExpenseList);
				orderLineItems(claimDBExpenseList,results, "lineItem");
			}else if(claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM)){
				//Preparing category Query.
				statement = prepareQuery(claimNumber, claimentLogin, connection,timeLogQry);
				statement.setString(3, EXPENSES);
				//Executing Necessary Expense Query and getting resultset for it.
				resultSet = statement.executeQuery();
				//iterateResultSet(resultSet, results,XML_NECESSARY_EXPENSES_TAG);
				iterateResultSet2(resultSet, results,XML_NECESSARY_EXPENSES_TAG,claimDBExpenseList);
				//Preparing category Query.
				statement = prepareQuery(claimNumber, claimentLogin, connection,timeLogQry);
				statement.setString(3, HOURS);
				//Executing Necessary Expense Query and getting resultset for it.
				resultSet = statement.executeQuery();
				//iterateResultSet(resultSet, results,XML_NECESSARY_EXPENSES_TAG);
				iterateResultSet2(resultSet, results,XML_NECESSARY_EXPENSES_TAG,claimDBExpenseList);
				statement = prepareQuery(claimNumber, claimentLogin, connection, travelTimeChildSupporttQry);
				statement.setString(3, PARAM_TRAVEL_TIME);
				//Executing travel time expenses for this claim
				resultSet = statement.executeQuery();
				//iterateResultSet(resultSet, results,XML_TRAVEL_TIME_TAG);
				iterateResultSet2(resultSet, results,XML_TRAVEL_TIME_TAG,claimDBExpenseList);
				orderLineItems(claimDBExpenseList,results, "lineItem");
			}else if(claimType.equalsIgnoreCase(JUDICIAL_CLERK_FEES)){



			}else if (claimType.equalsIgnoreCase(EXPERT_OR_WITNESS_CLAIM)) {
				//Preparing category Query.
				statement = prepareQuery(claimNumber, claimentLogin, connection,categoryQuery);
				statement.setString(3, EXPENSES);
				//Executing Necessary Expense Query and getting resultset for it.
				resultSet = statement.executeQuery();
				//iterateResultSet(resultSet, results,EXPENSES);
				iterateResultSet2(resultSet, results,EXPENSES,claimDBExpenseList);
				statement = prepareQuery(claimNumber, claimentLogin, connection,categoryQuery);
				statement.setString(3, HOURS);
				//Executing Necessary Expense Query and getting resultset for it.
				resultSet = statement.executeQuery();
				//iterateResultSet(resultSet, results,HOURS);
				iterateResultSet2(resultSet, results,HOURS,claimDBExpenseList);
				orderLineItems(claimDBExpenseList,results, "lineItem");
			}else if (claimType.equalsIgnoreCase(CHILD_SUPPORT_FLAT_FEE_CLAIM)) {
				
				//Preparing Court Query.
				statement = prepareQuery(claimNumber, claimentLogin, connection, dbSqlChildSupporttQry);
				statement.setString(3, PARAM_CHILD_SUPPORT_PAC);
System.out.println("Child Support Query is " + "'" + claimNumber + "' '" + claimentLogin + "' '" + PARAM_CHILD_SUPPORT_PAC + "'");
				//Executing court Query and getting resultset for it.
				resultSet = statement.executeQuery();
				if(!resultSet.isBeforeFirst()){
					results.addElement(IS_PARENT_ADVISIORY).addText(NO);
				}else{
					results.addElement(IS_PARENT_ADVISIORY).addText(YES);
				}
				//iterateResultSet(resultSet, results, CSSPAC);
				iterateResultSet2(resultSet, results,CSSPAC,claimDBExpenseList);				
				//Preparing court Query.
				statement1 = prepareQuery(claimNumber, claimentLogin, connection, dbSqlChildSupporttQry);
				statement1.setString(3, PARAM_CHILD_SUPPORT_GREATER_THAN_4);
System.out.println("Child Support Query is " + "'" + claimNumber + "' '" + claimentLogin + "' '" + PARAM_CHILD_SUPPORT_GREATER_THAN_4 + "'");
				//Executing court Query and getting resultset1 for it.
				resultSet1 = statement1.executeQuery();

				if(!resultSet1.isBeforeFirst()){
					results.addElement(IS_HEARING_GREATER_THAN_4).addText(NO);
				}else{
					results.addElement(IS_HEARING_GREATER_THAN_4).addText(YES);
				}
				//iterateResultSet(resultSet1, results, CSSGT4);
				iterateResultSet2(resultSet1, results,CSSGT4,claimDBExpenseList);				
				//Preparing court Query.
				statement2 = prepareQuery(claimNumber, claimentLogin, connection, dbSqlChildSupporttQry);
				statement2.setString(3, PARAM_CHILD_SUPPORT_CONTEMPT);

				//Executing court Query and getting resultset2 for it.
				resultSet2 = statement2.executeQuery();
				//iterateResultSet(resultSet2, results, CSS);
				iterateResultSet2(resultSet2, results,CSS,claimDBExpenseList);				
				orderLineItems(claimDBExpenseList,results, "lineItem");
			}else if(claimType.equalsIgnoreCase(JH_DOCKET_BILLING_CLAIM)){
				
			    System.out.println("JH Billing called.");
			    //Preparing category Query.
			    statement = prepareQuery(claimNumber, claimentLogin, connection,categoryQuery);
			    statement.setString(3, HOURS);
			    //Executing Necessary Expense Query and getting resultset for it.
			    resultSet = statement.executeQuery();
			    //iterateResultSet(resultSet, results,HOURS);
				iterateResultSet2(resultSet, results,HOURS,claimDBExpenseList);	

				
			    statement1 = prepareQuery(claimNumber, claimentLogin, connection, dbSqlContinuedQry);
			    statement1.setString(3, PARAM_IS_CONTINUED);
			    //Executing Incourt Query and getting resultset for it.
			    resultSet1 = statement1.executeQuery();

			    if(!resultSet1.isBeforeFirst()){
			     results.addElement(IS_CONTINUANCE_XML_TAG).addText("0");
			    }
			    else{
			    	double sumOfAuditQaunt = 0.0;
			    	int count = 0;
			    	while(resultSet1.next()) {
			    		++count;
						double auditQuant = resultSet1.getDouble("TotalQuantity");
						sumOfAuditQaunt = auditQuant++;
			    	}
			    	DecimalFormat df = new DecimalFormat("0");
			    	String formatVal = df.format(sumOfAuditQaunt);
					results.addElement(IS_CONTINUANCE_XML_TAG).addText(formatVal);
			    }
			    
			    statement2 = prepareQuery(claimNumber, claimentLogin, connection, dbSqlJHDBQry);
			    statement2.setString(3, "JH Docket Billing");
			    //Executing Incourt Query and getting resultset for it.
			    resultSet2 = statement2.executeQuery();

			    if(!resultSet2.isBeforeFirst()){
			     results.addElement("CostForEachClient").addText("0.0");
			    }
			    else{
			    	double auditCost = 0.0;
			    	while(resultSet2.next()) {
						auditCost = resultSet2.getDouble("TotalCost");
			    	}
			    	DecimalFormat df2 = new DecimalFormat("0.000");
			    	String formatVal = df2.format(auditCost);
					logger.info("auditCost in docket for continued..."+formatVal);
					results.addElement("CostForEachClient").addText(formatVal);
			    } 
					orderLineItems(claimDBExpenseList,results, "lineItem");				
			}else{
				//Preparing Interpreter Words Query.
				statement = prepareQuery(claimNumber, claimentLogin, connection,wordsQuery);
				statement.setString(3, EXPENSES);
				statement.setString(4, PARAM_WORDS);
				//Executing Necessary Expense Query and getting resultset for it.
				resultSet = statement.executeQuery();
				//iterateResultSet(resultSet, results,WORDS);
				iterateResultSet2(resultSet, results,WORDS,claimDBExpenseList);
				
				//Preparing Interpreter Necessary Expenses Query.
				statement = prepareQuery(claimNumber, claimentLogin, connection,interpreterNecessaryExpenses);
				statement.setString(3, EXPENSES);
				statement.setString(4, PARAM_WORDS);
				//Executing Necessary Expense Query and getting resultset for it.
				resultSet = statement.executeQuery();
				//iterateResultSet(resultSet, results,XML_NECESSARY_EXPENSES_TAG);
				iterateResultSet2(resultSet, results,XML_NECESSARY_EXPENSES_TAG,claimDBExpenseList);
				
				//Preparing Interpreter Hrs Query.
				statement = prepareQuery(claimNumber, claimentLogin, connection,interHrsQuery);
				statement.setString(3, PARAM_HOURS);
				//Executing Necessary Expense Query and getting resultset for it.
				resultSet = statement.executeQuery();
				//iterateResultSet(resultSet, results,HOURS);
				iterateResultSet2(resultSet, results,HOURS,claimDBExpenseList);	
				orderLineItems(claimDBExpenseList,results, "lineItem");				
			}

			//code to get TotalQuantity and ExpenseTotalCost
			if(claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM)){
				statement = connection.prepareStatement(timeLogTotQry);
				statement.setString(1, claimNumber);
				statement.setString(2, claimentLogin);
				statement.setString(3, HOURS);
				resultSet = statement.executeQuery();
				rsmd = resultSet.getMetaData();
				colCount = rsmd.getColumnCount();
				// If resultset is Empty (i.e. no rows present) than adding only empty tags to xml (Column Name as the tag name)
				if(!resultSet.isBeforeFirst()){
					for (int i = 1; i <= colCount; i++) {
						results.addElement(rsmd.getColumnName(i)).addText(EMPTY);
					}
				}else{
					while (resultSet.next()) {
						for (int i = 1; i <= colCount; i++) {
							String columnName = rsmd.getColumnName(i);
							Object value = resultSet.getObject(i);
							// if resultset is having any data than adding it to xml. (Column name as tag name & Row data as Value)
							if(value!=null)
							results.addElement(columnName).addText(value.toString());
							else
								results.addElement(columnName).addText("0.000");

						}

					}
				}
			}
						
			statement = connection.prepareStatement(timeLogUnitCost);
			statement.setString(1, caseTypeId);
			//statement.setString(2, claimentLogin);
			resultSet = statement.executeQuery();
			rsmd = resultSet.getMetaData();
			colCount = rsmd.getColumnCount();
			if(!resultSet.isBeforeFirst()){
				for (int i = 1; i <= colCount; i++) {
					results.addElement(rsmd.getColumnName(i)).addText(EMPTY);
				}
			}else{
				while (resultSet.next()) {
					for (int i = 1; i <= colCount; i++) {
						String columnName = rsmd.getColumnName(i);
						Object value = resultSet.getObject(i);
						// if resultset is having any data than adding it to xml. (Column name as tag name & Row data as Value)
						if(value!=null){
						results.addElement(columnName).addText(value.toString());
						}
						else{
							results.addElement(columnName).addText(ZERO);
						}
						
					}
	
				}
			}
		
			//if(claimType.equalsIgnoreCase(GAL_IN_ADOPTION_CLAIM)) {
				
			statement = prepareQuery(claimNumber, claimentLogin, connection, dbSqlGALMaxServiceDtQry);

		    //Executing Incourt Query and getting resultset for it.
		    resultSet = statement.executeQuery();
		    
			    while (resultSet.next()) {
			    	String serviceDt = resultSet.getObject("LatestDate").toString();
			    	results.addElement("LatestServiceDate").addText(serviceDt);
			    }	    	

			//}

			// code for getting AOC Approved Totalcost and Judge Approved total cost
			statement = connection.prepareStatement(sumJATCandAATCQuery);
			statement.setString(1, claimNumber);
			resultSet = statement.executeQuery();
			rsmd = resultSet.getMetaData();
			colCount = rsmd.getColumnCount();

			// If resultset is Empty (i.e. no rows present) than adding only empty tags to xml (Column Name as the tag name)
			if(!resultSet.isBeforeFirst()){
				for (int i = 1; i <= colCount; i++) {
					results.addElement(rsmd.getColumnName(i)).addText(EMPTY);
				}
			}else{
				while (resultSet.next()) {
					for (int i = 1; i <= colCount; i++) {
						String columnName = rsmd.getColumnName(i);
						
						Object value = resultSet.getObject(i);
						// if resultset is having any data than adding it to xml. (Column name as tag name & Row data as Value)
						if(null!=value){
						results.addElement(columnName).addText(value.toString());
						}else{
							results.addElement(columnName).addText(EMPTY);
						}
						if ((claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM) ||claimType.equalsIgnoreCase(JH_DOCKET_BILLING_CLAIM) ) && columnName.equalsIgnoreCase(AUDIT_APPROVED_TOTAL_COST)) {
							if(null!=value && null!=value.toString() && value.toString()!=EMPTY){
								float costForEachClient=Float.parseFloat(value.toString())/noOfClients;
								results.addElement("CostForEachClient").addText(Float.toString(costForEachClient));
							}
						}
					}

				}
			}
			//Adding reimbursementTotal tag to the xml.
		//	reimbursementTotal=reimbursementTotal-unpaidExpanses;
		//	results.addElement("ReimbursementTotal").addText(Float.toString(reimbursementTotal));
			results.addElement("ReimbursementTotal").addText(Float.toString(Math.round(reimbursementTotal*100)/100)); // Adderd By Khaled
			
			results.addElement("HoursAdjustment").addText(Float.toString((unpaidExpanses)));
			

			
			statement.close();
			resultSet.close();				

		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error("AcapDbDAOImpl#getDBData#exception" + e.getMessage());
			}
			throw new AcapDataAccessException(e);

		} finally {
			reimbursementTotal=0.000f;
			try {
				resultSet.close();
				if(null != resultSet1 || null != resultSet2) {
					resultSet1.close();
					resultSet2.close();
					//resultSet3.close();
				}
			} catch (SQLException e) {

				if (logger.isErrorEnabled()) {
					logger.error("AcapDbDAOImpl#getDBData#resultset#sqlexception" + e.getMessage());
				}
			}
			try {
				statement.close();
				if(null != statement1 || null != statement2) {
					statement1.close();
					statement2.close();
					//statement3.close();
				}
			} catch (SQLException e) {

				if (logger.isErrorEnabled()) {
					logger.error("AcapDbDAOImpl#getDBData#statement#sqlexception" + e.getMessage());
				}
			}
			try {
					connection.close();

			} catch (SQLException e) {

				if (logger.isErrorEnabled()) {
					logger.error("AcapDbDAOImpl#getDBData#connection#sqlexception" + e.getMessage());
				}
			}
		}
		if (logger.isInfoEnabled()) {
			logger.info("AcapDbDAOImpl#getDb#end");
		}

		//Returning XML as string.
		return rootName.asXML();

	}

	/**Get prepareQuery
	 *
	 * @param claimNumber
	 * @param claimType
	 * @param claimentLogin
	 * @param connection
	 * @param query
	 * @return statement
	 * @throws SQLException
	 */
	private PreparedStatement prepareQuery(String claimNumber, String claimentLogin,
			Connection connection, String query) throws SQLException {
		System.out.println("In prepareQuery.."+claimNumber+" claimentLogin.."+claimentLogin + " connection.."+connection+" query.."+query);
		PreparedStatement statement= null;
		try {
			statement = connection.prepareStatement(query);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		//Adding parameters to the query.
		statement.setString(1, claimNumber);
		statement.setString(2, claimentLogin);

		return statement;
	}

	/**
	 * Iterating Result set.
	 *
	 * @param resultSet
	 * @param results
	 * @param parentTagName
	 * @throws SQLException
	 */
	/*private void iterateResultSet(ResultSet resultSet, Element results,String parentTagName) throws SQLException {
		ResultSetMetaData rsmd;
		int colCount;
		rsmd = resultSet.getMetaData();
		colCount = rsmd.getColumnCount();
		
		// If resultset is Empty (i.e. no rows present) than adding only empty tags to xml (Column Name as the tag name)
		if(!resultSet.isBeforeFirst()) {
			Element childTag = results.addElement(parentTagName);
			for (int i = 1; i <= colCount; i++) {
				if(rsmd.getColumnName(i).equalsIgnoreCase(AUDIT_APPROVED_TOTAL_COST)){
					childTag.addElement(rsmd.getColumnName(i)).addText(ZERO);
				}else if(rsmd.getColumnName(i).equalsIgnoreCase("AuditApprovedQuantity")){
					childTag.addElement(rsmd.getColumnName(i)).addText(ZERO);
				}else{
					childTag.addElement(rsmd.getColumnName(i)).addText(EMPTY);
				}
			}
		}
		else {	
			while (resultSet.next()) {
				Element childTag = results.addElement(parentTagName);
				for (int i = 1; i <= colCount; i++) {
					String columnName = rsmd.getColumnName(i);
					Object value = resultSet.getObject(i);
					// if result set is having any data than adding it to xml. (Column name as tag name & Row data as Value) 
					if(columnName.equalsIgnoreCase(AUDIT_APPROVED_TOTAL_COST) && (value.toString().trim()==EMPTY)){
						childTag.addElement(columnName).addText(ZERO);
					}else if(columnName.equalsIgnoreCase("AuditApprovedQuantity") && (value.toString().trim()==EMPTY)){
						childTag.addElement(columnName).addText(ZERO);
					}else{
						childTag.addElement(columnName).addText(value.toString());
					}
					//Calculating reimbursementTotal.
					if(columnName.equalsIgnoreCase(AUDIT_APPROVED_TOTAL_COST)){
						if(value.toString().trim()!=""){
							reimbursementTotal=reimbursementTotal+Float.parseFloat(value.toString().trim());
						}else{
							reimbursementTotal=reimbursementTotal+0.000f;
						}

					}
				}
			}
		}
		
	}*/
	
		//Added for AR-613 for sorting the claim line items based upon dates.
	private void iterateResultSet2(ResultSet resultSet, Element results,String parentTagName,List<AcapDbExpense> claimDBExpenseList ) throws SQLException, ParseException {
		ResultSetMetaData rsmd;
		int colCount;
		rsmd = resultSet.getMetaData();
		colCount = rsmd.getColumnCount();
		System.out.println("Result set column count is >>>> " + colCount);
		AcapDbExpense claimDblineItem = null;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		// If resultset is Empty (i.e. no rows present) than adding only empty tags to xml (Column Name as the tag name)
		if(!resultSet.isBeforeFirst()) {
//			Element childTag = results.addElement(parentTagName);
			System.out.println("Result set is empty >>>>>");
			claimDblineItem = new AcapDbExpense();
			for (int i = 1; i <= colCount; i++) {
				if(rsmd.getColumnName(i).equalsIgnoreCase(AUDIT_APPROVED_TOTAL_COST)){
					claimDblineItem.addlineItemDetails(AUDIT_APPROVED_TOTAL_COST,ZERO);
				}else if(rsmd.getColumnName(i).equalsIgnoreCase("AuditApprovedQuantity")){
					claimDblineItem.addlineItemDetails("AuditApprovedQuantity",ZERO);
				}else{
					claimDblineItem.addlineItemDetails(rsmd.getColumnName(i),EMPTY);
				}
			}
			System.out.println("Adding empty ClaimDBLineItem");
			//claimDBExpenseList.add(claimDblineItem);
		}
		else {	
			while (resultSet.next()) {
				claimDblineItem = new AcapDbExpense();
				System.out.println("Resulset Next is called >>>>  created instance of ACAPDBExpense");
				for (int i = 1; i <= colCount; i++) {
					String columnName = rsmd.getColumnName(i);
					Object value = resultSet.getObject(i);
					System.out.println("ColumnName  value and i " + columnName + "  " +  value.toString() + "  " + i);
					// if result set is having any data than adding it to xml. (Column name as tag name & Row data as Value) 
					if(columnName.equalsIgnoreCase(AUDIT_APPROVED_TOTAL_COST) && (value.toString().trim()==EMPTY)){
						claimDblineItem.addlineItemDetails(AUDIT_APPROVED_TOTAL_COST,ZERO);
					}else if(columnName.equalsIgnoreCase("AuditApprovedQuantity") && (value.toString().trim()==EMPTY)){
						claimDblineItem.addlineItemDetails("AuditApprovedQuantity",ZERO);
					}else if(columnName.equalsIgnoreCase("serviceDate") && (value.toString().trim()!=EMPTY)){
						System.out.println("Original service Date >>> " + value.toString());
						System.out.println("Added service Date >>> " + formatter.parse(value.toString()));
						claimDblineItem.setServiceDate(formatter.parse(value.toString()));
					}else{
						System.out.println("Added ColumnName  value >>> " + columnName + "  " +  value.toString() );
						claimDblineItem.addlineItemDetails(columnName,value.toString());
					}
					//Calculating reimbursementTotal.
					if(columnName.equalsIgnoreCase(AUDIT_APPROVED_TOTAL_COST)){
						if(value.toString().trim()!=""){
							reimbursementTotal=reimbursementTotal+Float.parseFloat(value.toString().trim());
						}else{
							reimbursementTotal=reimbursementTotal+0.000f;
						}

					}
				}
				System.out.println("Added line item details to the list.");
				claimDblineItem.setParentTagName(parentTagName);
				claimDBExpenseList.add(claimDblineItem);
			}//while
		}
		
	}
	
	private void orderLineItems(List<AcapDbExpense> claimDBExpenseList,Element results,String parentTagName){
		if(claimDBExpenseList.size() ==0){
			return;
		}
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("orderLineItems CAlled >>>>>>>>>>");
		com.google.common.collect.Ordering<AcapDbExpense> ordering = new Ordering<AcapDbExpense>() {
		    @Override
		    public int compare(AcapDbExpense prev, AcapDbExpense curr) {
		    	if(prev.getServiceDate() == null ) {
		    		return -1;
		    	}else if(curr.getServiceDate() == null) {
		    		return 1;
		    	}else {
		    		return  DateTimeComparator.getDateOnlyInstance().compare(prev.getServiceDate(), curr.getServiceDate());
		    	}
		    	
		    }
		};		
		//ordering = ordering.reverse();
		Collections.sort(claimDBExpenseList,ordering);
		System.out.println("orderLineItems CAlled >>>>>>>>>> Sorting is done ");
		for(AcapDbExpense dbExpense : claimDBExpenseList){
			System.out.println("About to add Service Date tag parentTagName >>>>>>>>>>" + parentTagName);
			Element childTag = results.addElement(parentTagName);
			childTag.addElement(dbExpense.getParentTagName()).addText(dbExpense.getParentTagName());
			childTag.addElement("ServiceDate").addText(formatter.format(dbExpense.getServiceDate()).toString());		
			System.out.println("Adding service Date " + formatter.format(dbExpense.getServiceDate()).toString());
			for(AcapDbExpense.LineItemDetails lineItemDetail : dbExpense.getClLineDetails()){
				Element colElement = childTag.addElement(lineItemDetail.getColName()).addText(lineItemDetail.getColValue());
				if(lineItemDetail.getColName().equalsIgnoreCase("AuditApprovedQuantity") || lineItemDetail.getColName().equalsIgnoreCase("AuditApprovedTotalCost")){
					colElement.addAttribute("expenseType", dbExpense.getParentTagName());
				}
				System.out.println("Adding column Column " + lineItemDetail.getColName() + " with Value " + lineItemDetail.getColValue() );
			}
		}
		
		System.out.println("orderLineItems Exiting >>>>>>>>>>");
	}
	
}
