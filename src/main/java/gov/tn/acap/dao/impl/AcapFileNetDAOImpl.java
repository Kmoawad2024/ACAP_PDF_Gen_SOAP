package gov.tn.acap.dao.impl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.filenet.api.collection.PropertyDescriptionList;
import com.filenet.api.collection.RepositoryRowSet;
import com.filenet.api.constants.Cardinality;
import com.filenet.api.constants.RefreshMode;
import com.filenet.api.constants.ReservationType;
import com.filenet.api.constants.TypeID;
import com.filenet.api.core.Factory;
import com.filenet.api.core.ObjectStore;
import com.filenet.api.meta.PropertyDescription;
import com.filenet.api.property.FilterElement;
import com.filenet.api.property.Properties;
import com.filenet.api.property.Property;
import com.filenet.api.property.PropertyFilter;
import com.filenet.api.query.RepositoryRow;
import com.filenet.api.query.SearchSQL;
import com.filenet.api.query.SearchScope;


import gov.tn.acap.constants.AcapFilenetDAOConstants;
import gov.tn.acap.dao.AcapDbDAO;
import gov.tn.acap.dao.AcapFileNetDAO;
import gov.tn.acap.exception.AcapDataAccessException;

public class AcapFileNetDAOImpl implements AcapFileNetDAO, AcapFilenetDAOConstants {

	private String flntSqlPrntQry;
	private String flntSqlCldQry;
	private String rootelement;
	String prntQry;
	String cldQry;
	String rootName;
	String finalXml;
	String flntSqlNameQry;
	String firstCaseDocNo="";
	String lastCaseDocNo="";

	private String restURL;
	private String claimantLogin;
	private String claimTypeId;
	private String isWaitingForApproval;
	private AcapDbDAO dbDAO;
	private Properties claimProps=null;
	
	private static Logger logger = Logger.getLogger(AcapFileNetDAOImpl.class);

	HashMap<String, String> dataMapForQ1 = new HashMap<String, String>();
	HashMap<String, String> dataMapForQ2 = new HashMap<String, String>();

	/**
	 * @return the claimProps
	 */
	public Properties getClaimProps() {
		return claimProps;
	}

	/**
	 * @param claimProps the claimProps to set
	 */
	public void setClaimProps(Properties claimProps) {
		this.claimProps = claimProps;
	}

	/**
	 * @return the restURL
	 */
	public String getRestURL() {
		return restURL;
	}

	/**
	 * @param restURL the restURL to set
	 */
	public void setRestURL(String restURL) {
		this.restURL = restURL;
	}

	/**
	 * @return the flntSqlPrntQry
	 */
	public String getFlntSqlPrntQry() {
		return flntSqlPrntQry;
	}

	/**
	 * @param flntSqlPrntQry the flntSqlPrntQry to set
	 */
	public void setFlntSqlPrntQry(String flntSqlPrntQry) {
		this.flntSqlPrntQry = flntSqlPrntQry;
	}

	/**
	 * @return the flntSqlCldQry
	 */
	public String getFlntSqlCldQry() {
		return flntSqlCldQry;
	}

	/**
	 * @param flntSqlCldQry the flntSqlCldQry to set
	 */
	public void setFlntSqlCldQry(String flntSqlCldQry) {
		this.flntSqlCldQry = flntSqlCldQry;
	}

	/**
	 * @return the rootelement
	 */
	public String getRootelement() {
		return rootelement;
	}

	/**
	 * @param rootelement the rootelement to set
	 */
	public void setRootelement(String rootelement) {
		this.rootelement = rootelement;
	}

	/**
	 * @return the claimantLogin
	 */
	public String getClaimantLogin() {
		return claimantLogin;
	}

	/**
	 * @param claimantLogin the claimantLogin to set
	 */
	public void setClaimantLogin(String claimantLogin) {
		this.claimantLogin = claimantLogin;
	}

	/**
	 * @return the dbDAO
	 */
	public AcapDbDAO getDbDAO() {
		return dbDAO;
	}

	/**
	 * @param dbDAO the dbDAO to set
	 */
	public void setDbDAO(AcapDbDAO dbDAO) {
		this.dbDAO = dbDAO;
	}

	/**
	 * @return the isWaitingForApproval
	 */
	public String getIsWaitingForApproval() {
		return isWaitingForApproval;
	}

	/**
	 * @param isWaitingForApproval the isWaitingForApproval to set
	 */
	public void setIsWaitingForApproval(String isWaitingForApproval) {
		this.isWaitingForApproval = isWaitingForApproval;
	}



	/**
	 * @return the flntSqlNameQry
	 */
	public String getFlntSqlNameQry() {
		return flntSqlNameQry;
	}

	/**
	 * @param flntSqlNameQry the flntSqlNameQry to set
	 */
	public void setFlntSqlNameQry(String flntSqlNameQry) {
		this.flntSqlNameQry = flntSqlNameQry;
	}

	/**
	 * Gets the data from filenet.
	 *
	 * @param claimNumber
	 * @param claimStatus
	 * @param folderId
	 * @param claimType
	 * @param os
	 * @return finalXml
	 * @throws AcapDataAccessException the exception
	 */
	@Override
	public String getFileNetData(String claimNumber, String claimStatus, String folderId, String claimType,
			ObjectStore os) throws AcapDataAccessException {
		if (logger.isInfoEnabled()) {
			logger.info("AcapFileNetDAOImpl#getFileNetData#EntryPoint");
		}

		try {
			//Filenet Query to get AssignedJudge, ClaimantType, ClaimantLogin etc...
			prntQry = this.getFlntSqlPrntQry() +SPACE+ACAP_CLAIM_NUMBER+EQUAL_SYMBOL+SINGLE_QUOTE + claimNumber + SINGLE_QUOTE;
			String propList = PARENT_QUEY_PROPERTY_LIST;
			String claimantPropList = CLAIMANT_PROP_LIST;
			//System.out.println("prntQry  "+prntQry);
			dataMapForQ1 = getClaimProperties(prntQry, os, propList, ACAP_CLAIMS);
			//System.out.println("test 2");
			//System.out.println("ACAP_TotalUnpaidMonies :: "+dataMapForQ1.get("ACAP_TotalUnpaidMonies"));
			//System.out.println("ACAP_TotalUnpaidMonies :: "+String.valueOf(dataMapForQ1.get("ACAP_TotalUnpaidMonies")));




			//Merging data get from above 2 filenet queries into single dataMap.
			HashMap<String, String> mergedDataMap = new HashMap<String, String>();
			Map<String,String> judgeNames=new HashMap<String,String>();
			if(null!=dataMapForQ1 && !dataMapForQ1.isEmpty()){
				claimantLogin = dataMapForQ1.get(ACAP_CLAIMANT_LOGIN);
				mergedDataMap.putAll(dataMapForQ1);
				String status=mergedDataMap.get(ACAP_CLAIM_STATUS);
				String auditorLogin=mergedDataMap.get(ACAP_AUDITORLOGIN);
				claimTypeId = mergedDataMap.get(ACAP_CASE_TYPE_ID);
				String processStatus=String.valueOf(mergedDataMap.get(ACAP_PROCESSESCALATIONREASON));
				Double totalAmount=Double.valueOf(mergedDataMap.get(ACAP_TOTALAMOUNT));
				String procStatus = String.valueOf(mergedDataMap.get(ACAP_PROCESSSTATUS));
				String escalationStatus = String.valueOf(mergedDataMap.get(ACAP_ESCALATIONSTATUS));
				String auditorSignDate = String.valueOf(mergedDataMap.get(ACAP_AUDITORSIGNDATE));
				
				String sOnline = dataMapForQ1.get(ACAP_ONLINE);
				
				System.out.println("sOnline: "+sOnline+ " status: "+status);
				//Added for checking if an offline claim has a pdf or not.
				if(sOnline.trim().equalsIgnoreCase("No") && status.trim().equalsIgnoreCase(SUBMIT_FOR_FINAL_APPROVAL)) {
					System.out.println("Offline judge and Submit for Final Approval");
					String docID = isOfflineAndLegacy(claimNumber,os);
					System.out.println("Offline judge and Submit for Final Approval, doc id:"+docID);
					if(docID.trim().length() > 0){
						mergedDataMap.put("IsPDFExist", "Yes");
						System.out.println("Offline judge and Submit for Final Approval, mergedDataMap:"+mergedDataMap);
						//return "Legacy"+docID;
					}
				}
				//End of Added for checking if an offline claim has a pdf or not.
				System.out.println("procStatus--"+procStatus);
				System.out.println("status--"+status);
				System.out.println("escalationStatus--"+escalationStatus);
				System.out.println("auditorSignDate--"+auditorSignDate);
				if ("Escalate to Batch".equalsIgnoreCase(processStatus) && totalAmount <= 100 && !procStatus.equalsIgnoreCase("AOC Staff Created") && !status.equalsIgnoreCase("Return to Audit")
						&& !escalationStatus.equalsIgnoreCase("Overclaim") && !escalationStatus.equalsIgnoreCase("Late Claim") && !escalationStatus.equalsIgnoreCase("Potential Duplicate") && 
						(auditorSignDate.equals("") || auditorSignDate == null) ) {
					mergedDataMap.put(ACAP_AUDITORLOGIN, "Approved by Finance Admin");
				}else {
					if(auditorLogin!=null && !"".equalsIgnoreCase(auditorLogin)) {
						auditorLogin="Approved electronically by "+auditorLogin;
					mergedDataMap.put(ACAP_AUDITORLOGIN,auditorLogin);
					}
				}

				//Checking the current workflow stage of claim and accordingly adding a tag to xml.
				switch(status){
				case NEW: mergedDataMap.put(NEW, mergedDataMap.get(ACAP_CLAIM_STATUS));
				break;
				case AWAITING_JUDGE_SIGNATURE: mergedDataMap.put(AWAITING_JUDGE_SIGNATURE_TAG, mergedDataMap.get(ACAP_CLAIM_STATUS));
				break;
				case APPROVED_BY_JUDGE: mergedDataMap.put(APPROVED_BY_JUDGE_TAG, mergedDataMap.get(ACAP_CLAIM_STATUS));
				break;
				case SUBMIT_FOR_AOC_REVIEW: mergedDataMap.put(SUBMIT_FOR_AOC_REVIEW_TAG, mergedDataMap.get(ACAP_CLAIM_STATUS));
				break;
				case SUBMIT_FOR_FINAL_APPROVAL: mergedDataMap.put(SUBMIT_FOR_FINAL_APPROVAL_TAG, mergedDataMap.get(ACAP_CLAIM_STATUS));
				break;
				case PAID: mergedDataMap.put(PAID, mergedDataMap.get(ACAP_CLAIM_STATUS));
				break;
				}

				cldQry = this.getFlntSqlCldQry() +SPACE+ACAP_CLAIMANT_TYPE+EQUAL_SYMBOL+SINGLE_QUOTE+ dataMapForQ1.get(ACAP_CLAIMANT_TYPE)
				+ SINGLE_QUOTE+SPACE+LOGICAL_AND+SPACE+ACAP_CLAIMANT_LOGIN+EQUAL_SYMBOL+SINGLE_QUOTE+ dataMapForQ1.get(ACAP_CLAIMANT_LOGIN) + SINGLE_QUOTE;
				propList = CHILD_QUEY_PROPERTY_LIST;
				dataMapForQ2 = getClaimProperties(cldQry, os, propList, ACAP_CLAIMANTREGISTRATION);

				if(claimType.equalsIgnoreCase(EXPERT_WITNESS_CLAIM)){
					mergedDataMap.put(ACAP_VENDOR_NAME, dataMapForQ1.get(ACAP_FIRST)+SPACE+dataMapForQ1.get(ACAP_MIDDLE)+SPACE+dataMapForQ1.get(ACAP_LAST));
				}
				if(null!=dataMapForQ1.get(ACAP_ATTORNEYLOGIN) && dataMapForQ1.get(ACAP_ATTORNEYLOGIN)!=EMPTY){
					String nameQuery=this.getFlntSqlNameQry()+SINGLE_QUOTE+ dataMapForQ1.get(ACAP_ATTORNEYLOGIN) + SINGLE_QUOTE;
					mergedDataMap.putAll(getClaimProperties(nameQuery, os, claimantPropList, ACAP_CLAIMANTREGISTRATION));
				}
				if(claimType.equals(CHILD_SUPPORT_FLAT_FEE_CLAIM) || claimType.equals(INTERPRETER_TIME_LOG_CLAIM)){
					String judgeIds=dataMapForQ1.get(ACAP_INTERPRETER_JUDGES);
					if(judgeIds.trim().contains(COMMA)){
						for (String judgeId :judgeIds.split(COMMA)) {
							String nameQuery=this.getFlntSqlNameQry()+SINGLE_QUOTE+judgeId+ SINGLE_QUOTE;
							judgeNames.putAll(getClaimProperties(nameQuery, os, claimantPropList, ACAP_CLAIMANTREGISTRATION));
							judgeNames.put(judgeId, judgeNames.get(ACAP_FIRST)+SPACE+judgeNames.get(ACAP_MIDDLE)+SPACE+judgeNames.get(ACAP_LAST));
							judgeNames.remove(ACAP_FIRST);
							judgeNames.remove(ACAP_MIDDLE);
							judgeNames.remove(ACAP_LAST);
						}
					}else{
						String nameQuery=this.getFlntSqlNameQry()+SINGLE_QUOTE+judgeIds+ SINGLE_QUOTE;
						judgeNames.putAll(getClaimProperties(nameQuery, os, claimantPropList, ACAP_CLAIMANTREGISTRATION));
						judgeNames.put(judgeIds, judgeNames.get(ACAP_FIRST)+SPACE+judgeNames.get(ACAP_MIDDLE)+SPACE+judgeNames.get(ACAP_LAST));
						judgeNames.remove(ACAP_FIRST);
						judgeNames.remove(ACAP_MIDDLE);
						judgeNames.remove(ACAP_LAST);
					}
				}
				if((claimType.equals(INTERPRETER_TIME_LOG_CLAIM) || claimType.equals(INTERPRETER_CLAIM)) && dataMapForQ1.containsKey(ACAP_CLAIMANT_LOGIN) && (null!=dataMapForQ1.get(ACAP_CLAIMANT_LOGIN) || dataMapForQ1.get(ACAP_CLAIMANT_LOGIN)!=EMPTY)){
					Map<String,String> interpreterName=new HashMap<String,String>();
					String nameQuery=this.getFlntSqlNameQry()+SINGLE_QUOTE+dataMapForQ1.get(ACAP_CLAIMANT_LOGIN)+ SINGLE_QUOTE;
					interpreterName.putAll(getClaimProperties(nameQuery, os, claimantPropList, ACAP_CLAIMANTREGISTRATION));
					mergedDataMap.put(INTERPRETER_NAME, interpreterName.get(ACAP_FIRST)+SPACE+interpreterName.get(ACAP_MIDDLE)+SPACE+interpreterName.get(ACAP_LAST));
				}
			}else{
				throw new AcapDataAccessException("No data found to generate pdf for Claimnumber: "+claimNumber);
			}

			if(null != dataMapForQ2){
				if(dataMapForQ1.get(ACAP_ONLINE)!=null && dataMapForQ1.get(ACAP_ONLINE)!=EMPTY){
					setIsWaitingForApproval(dataMapForQ1.get(ACAP_ONLINE).trim());
					logger.info(dataMapForQ1.get(ACAP_ONLINE).trim());
				}else{
					setIsWaitingForApproval(NO);
				}
				mergedDataMap.putAll(dataMapForQ2);
			}

			//REST Service call to get Offense Class. There is no need to make a call to TCA Service for CS Flat Rate claim.
			if(!claimType.equalsIgnoreCase(JUDICIAL_CLERK_FEES) && !claimType.equalsIgnoreCase(CHILD_SUPPORT_FLAT_FEE_CLAIM) && !claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM) && !claimType.equalsIgnoreCase(JH_DOCKET_BILLING_CLAIM)){
				List<String> masterIds=new ArrayList<String>();
				RestTemplate restTemplate=new RestTemplate();
				if(mergedDataMap.get(ACAP_OFFENSE).trim().contains(COMMA)){
					for (String masterId : mergedDataMap.get(ACAP_OFFENSE).trim().split(COMMA)) {
						masterIds.add(masterId);
					}
				}else{
					masterIds.add(mergedDataMap.get(ACAP_OFFENSE).trim());
				}
				Map<String,String> tcaCodeDescriptionMap=new HashMap<String,String>();
				String offenseClasses=EMPTY;
				String tcaSection=EMPTY;

				for (int i =0;i<masterIds.size();i++) {
					ResponseEntity<AcapOffenseClass[]> responseEntity  = restTemplate.getForEntity(restURL+masterIds.get(i), AcapOffenseClass[].class);
					AcapOffenseClass[] entityObjects=responseEntity.getBody();

					if(null!=entityObjects && entityObjects.length>0 && null!=entityObjects[0].getOffense_Class()){
						if(i==0){
							if(null!=entityObjects[0].getOffense_Class() && entityObjects[0].getOffense_Class().trim()!=EMPTY){
								offenseClasses=entityObjects[0].getOffense_Class();
							}
							if((null!=entityObjects[0].getTCA_Code() && entityObjects[0].getTCA_Code().trim()!=EMPTY) && (null!=entityObjects[0].getDescription() && entityObjects[0].getDescription().trim()!=EMPTY)){
								tcaSection=entityObjects[0].getTCA_Code()+" - "+entityObjects[0].getDescription();
								tcaCodeDescriptionMap.put(masterIds.get(0), tcaSection);
							}
						}else{
							if(null!=entityObjects[0].getOffense_Class() && entityObjects[0].getOffense_Class().trim()!=EMPTY){
								offenseClasses=offenseClasses+COMMA+SPACE+entityObjects[0].getOffense_Class();
							}
							if((null!=entityObjects[0].getTCA_Code() && entityObjects[0].getTCA_Code().trim()!=EMPTY) && (null!=entityObjects[0].getDescription() && entityObjects[0].getDescription().trim()!=EMPTY)){
								tcaSection=tcaSection+COMMA+SPACE+entityObjects[0].getTCA_Code()+" - "+entityObjects[0].getDescription();
								tcaCodeDescriptionMap.put(masterIds.get(i), entityObjects[0].getTCA_Code()+" - "+entityObjects[0].getDescription());
							}

						}
					}else{

						if(i==0){
							offenseClasses=EMPTY;
							tcaSection=EMPTY;
						}else{
							offenseClasses=offenseClasses+SPACE+EMPTY;
							tcaSection=tcaSection+SPACE+EMPTY;
						}
					}
				}

				mergedDataMap.put(OFFENSE_CLASS_XML_TAG, offenseClasses);
				mergedDataMap.put(TCA_SECTION_XML_TAG, tcaSection);
				if(mergedDataMap.containsKey("ACAP_PrimaryOffense")){
					for (String masterId : masterIds) {
						if((null!=tcaCodeDescriptionMap.get(masterId) && null!=mergedDataMap.get("ACAP_PrimaryOffense")) && tcaCodeDescriptionMap.get(masterId).contains(mergedDataMap.get("ACAP_PrimaryOffense"))){
							mergedDataMap.put(PRIMARY_OFFENSE_DESC, tcaCodeDescriptionMap.get(masterId).trim());
						}
					}
				}
			}
			//System.out.println("test 11");
			//System.out.println( "total unpaid monies 1 : "+String.valueOf(mergedDataMap.get("ACAP_TotalUnpaidMonies")));
			String unpaidMonies=mergedDataMap.get("ACAP_TotalUnpaidMonies");
		
			Float unpaidExpanses=0f;
			if(unpaidMonies!=null && !unpaidMonies.equals("")){
				unpaidExpanses=Float.parseFloat(unpaidMonies);
				if(unpaidExpanses!=0.0){
					unpaidExpanses=-unpaidExpanses;
				}
				
				
			}
			
			//System.out.println(unpaidMonies +"Unpaid expenses"+unpaidExpanses);
			//Calling createXMLs
			finalXml = createXmls(this.getRootelement(), mergedDataMap, claimNumber, judgeNames, folderId, claimType,unpaidExpanses);
			logger.info(" final XML " + finalXml);
			if (logger.isDebugEnabled()) {
				logger.debug(" final XML " + finalXml);

			}
		} catch (Exception ex) {
			if (logger.isErrorEnabled()) {
				logger.error("FileNetDAOImp"+ "l#getFileNetData#exception" + ex.getMessage());
			}

			throw new AcapDataAccessException(ex);

		}
		if (logger.isInfoEnabled()) {
			logger.info("AcapFileNetDAOImpl#getFileNetData#ExitPoint");
		}
		logger.info("finalxml"+finalXml);
		return finalXml;
	}

	/**
	 * Gets the claim properties.
	 *
	 * @param query
	 * @param os
	 * @param propList
	 * @param className
	 * @return map
	 * @throws Exception
	 *             the exception
	 */
	public HashMap<String, String> getClaimProperties(String query, ObjectStore os, String propList,String className) throws Exception {
		if (logger.isInfoEnabled()) {
			logger.info("AcapFileNetDAOImpl#getClaimProperties#EntryPoint");
		}

		HashMap<String, String> map = new HashMap<String, String>();

		try {
			SearchScope searchScope = new SearchScope(os);
			SearchSQL searchSQL = new SearchSQL(query);

			PropertyFilter pf = new PropertyFilter();
			pf.addIncludeProperty(new FilterElement(null, null, true, propList, null));
			RepositoryRowSet repRowSet = (RepositoryRowSet) searchScope.fetchRows(searchSQL, null, pf, null);
			Iterator iterator = repRowSet.iterator();
			RepositoryRow repRow = null;

			String subStr = query.substring(6);
			if(subStr.indexOf(FROM.toLowerCase()) > 0){
				subStr = subStr.substring(1, subStr.indexOf(FROM.toLowerCase()));
			}else{
				subStr = subStr.substring(1, subStr.indexOf(FROM.toUpperCase()));
			}
			String[] columns = subStr.split(COMMA);

			while (iterator.hasNext()) {
				repRow = (RepositoryRow) iterator.next();
				Properties cmProperties = repRow.getProperties();
				map = formXML(cmProperties, columns,className, os);
				if(className.equals(ACAP_CLAIMS))
					setClaimProps(cmProperties);
			}

		} catch (Exception ex) {
			if (logger.isErrorEnabled()) {
				logger.error("AcapFileNetDAOImpl#getClaimProperties#exception" + ex.getMessage(), ex);
			}

		}
		if (logger.isInfoEnabled()) {
			logger.info("AcapFileNetDAOImpl#getClaimProperties#ExitPoint");
		}
		return map;
	}

	/**
	 * Gets formXml.
	 *
	 * @param cmProperties
	 * @param columns
	 * @param className
	 * @param os
	 * @return map
	 * @throws Exception
	 *             the exception
	 */
	public HashMap<String, String> formXML(Properties cmProperties, String[] columns, String className, ObjectStore os)
			throws Exception {
		if (logger.isInfoEnabled()) {
			logger.info("AcapFileNetDAOImpl#formXML#EntryPoint");
		}
		HashMap<String, String> map = new HashMap<String, String>();
		String key;
		String value;

		PropertyFilter pf = new PropertyFilter();
		String propList = FORM_XML_PROPERTY_LIST;
		pf.addIncludeProperty(new FilterElement(null, null, true, propList, null));

		// Fetch selected class description from the server
		com.filenet.api.meta.ClassDescription objClassDesc = Factory.ClassDescription.fetchInstance(os, className, pf);

		// Get PropertyDescriptions property from the property cache
		PropertyDescriptionList objPropDescs = objClassDesc.get_PropertyDescriptions();

		for (int i = 0; i < columns.length; i++) {
			System.out.println("column name "+ columns[i] );
			Property prop = cmProperties.get(columns[i].trim());
			key = columns[i].trim();
			// calling getPropertyValueMethod
			value = getPropertyValue(prop, objPropDescs);
			System.out.println(key +"  "+value);
			if (null != key) {
				if (value != null) {
					map.put(key, value);
				} else {
					map.put(key, EMPTY);
				}
			}
		}
		if (logger.isInfoEnabled()) {
			logger.info("AcapFileNetDAOImpl#formXML#ExitPoint");
		}
		return map;

	}

	/**
	 * Gets the property value.
	 *
	 * @param prop
	 *            the prop
	 * @param className
	 *            the class name
	 * @return the property value
	 * @throws Exception
	 *             the exception
	 */
	private String getPropertyValue(Property prop, PropertyDescriptionList objPropDescs) throws Exception {
		if (logger.isInfoEnabled()) {
			logger.info("AcapFileNetDAOImpl#getPropertyValue#EntryPoint");
		}

		String propValue = "";
		String propBoolValue = "";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		Iterator iter = objPropDescs.iterator();
		PropertyDescription objPropDesc = null;

		// Loop until property description found
		boolean isFound = false;
		while (iter.hasNext() && !isFound) {
			objPropDesc = (PropertyDescription) iter.next();

			if (prop.getPropertyName().equals(objPropDesc.get_SymbolicName())) {
				isFound = true;

				TypeID dataType = objPropDesc.get_DataType();
				Cardinality cardinality = objPropDesc.get_Cardinality();

				if (cardinality.equals(Cardinality.SINGLE)) {

					if (dataType.equals(TypeID.STRING)) {
						propValue = prop.getStringValue();
					} else if (dataType.equals(TypeID.LONG)) {
						if (prop.getInteger32Value() != null)
							propValue = prop.getInteger32Value().toString();
					} else if (dataType.equals(TypeID.DATE)) {
						if (prop.getDateTimeValue() != null) {
							Date dateVal = prop.getDateTimeValue();
							propValue = sdf.format(dateVal);
						}
					}
					else if (dataType.equals(TypeID.DOUBLE)) {
						if (prop.getFloat64Value() != null) {
							propValue = String.valueOf(prop.getFloat64Value());
							//propValue = sdf.format(dateVal);
						}
					}
					else if (dataType.equals(TypeID.BOOLEAN)) {
						if (prop.getBooleanValue()!=null) {
							if(prop.getBooleanValue().equals(Boolean.TRUE))
								propValue = YES;
							else if(prop.getBooleanValue().equals(Boolean.FALSE))
								propValue = NO;
						}
					}

				} else if (cardinality.equals(Cardinality.LIST)) {

					if (dataType.equals(TypeID.STRING)) {
						String formatNumber = EMPTY;
						if(prop.getPropertyName().equals(ACAP_PHONE_NUMBER)){
							for (int i = 0; i < prop.getStringListValue().size(); i++)
							{
								propValue = prop.getStringListValue().get(i).toString();
								if(i<prop.getStringListValue().size()-1){
									if(isValid(propValue)){
										//formatNumber = formatNumber+String.format("%s-%s-%s",propValue.substring(0, 3), propValue.substring(3, 6), 
										//	propValue.substring(6, 10)) + COMMA;
										formatNumber=formatNumber+propValue+COMMA;
									}
								}
								else{
									if(isValid(propValue)){
										//formatNumber = formatNumber+String.format("%s-%s-%s",propValue.substring(0, 3), propValue.substring(3, 6), 
										//		propValue.substring(6, 10));
										formatNumber = formatNumber+propValue;
									}
								}
							}
							propValue =formatNumber;
						}else{
							for (int i = 0; i < prop.getStringListValue().size(); i++)
								if(i<prop.getStringListValue().size()-1)
									propValue = propValue + prop.getStringListValue().get(i) + COMMA;
								else 
									propValue = propValue + prop.getStringListValue().get(i);

						}
						//checking if claim number and taking first and last number for JH Clerk form
						if(prop.getPropertyName().equals(ACAP_CASE_NUMBERS) ){
							if(prop.getStringListValue().size()>0){
								firstCaseDocNo=(String) prop.getStringListValue().get(0);
								lastCaseDocNo= (String) prop.getStringListValue().get((prop.getStringListValue().size())-1);
							}
						}

					} else if (dataType.equals(TypeID.LONG)) {
						for (int i = 0; i < prop.getInteger32ListValue().size(); i++){
							if(i<prop.getInteger32ListValue().size()-1)
								propValue = propValue + prop.getInteger32ListValue().get(i).toString() + COMMA;
							else 
								propValue = propValue + prop.getInteger32ListValue().get(i).toString();
						}

					} else if (dataType.equals(TypeID.DATE)) {
						for (int i = 0; i < prop.getDateTimeListValue().size(); i++) {
							Date dateVal = (Date) prop.getDateTimeListValue().get(i);
							if(i<prop.getDateTimeListValue().size()-1)
								propValue = propValue + sdf.format(dateVal)+ COMMA;
							else 
								propValue = propValue + sdf.format(dateVal);

						}
					}else if (dataType.equals(TypeID.DOUBLE)) {
						for (int i = 0; i < prop.getFloat64ListValue().size(); i++){
							if(i<prop.getFloat64ListValue().size()-1)
								propValue = propValue + prop.getFloat64ListValue().get(i).toString() + COMMA;
							else 
								propValue = propValue + prop.getFloat64ListValue().get(i).toString();
						}

					}else if (dataType.equals(TypeID.BOOLEAN)) {
						for (int i = 0; i < prop.getBooleanListValue().size(); i++){
							if (prop.getBooleanListValue().get(i)!=null) {
								if(prop.getBooleanListValue().get(i).equals(Boolean.TRUE))
									propBoolValue = YES;
								else if(prop.getBooleanListValue().get(i).equals(Boolean.FALSE))
									propBoolValue = NO;
							}
							if(i<prop.getBooleanListValue().size()-1)
								propValue = propValue + propBoolValue + COMMA;
							else 
								propValue = propValue + propBoolValue;
						}

					}

				}
				return propValue;

			}

		}
		if (logger.isInfoEnabled()) {
			logger.info("AcapFileNetDAOImpl#getPropertyValue#ExitPoint");
		}
		return propValue;

	}

	/**
	 * Creat Xml.
	 *
	 * @param rootelement
	 * @param dataMap
	 * @param claimNumber
	 * @param claimStatus
	 * @param folderId
	 * @param claimType
	 * @return xml as string
	 * @throws IOException
	 *             the exception
	 */
	public String createXmls(String rootelement, HashMap<String, String> dataMap, String claimNumber,
			Map<String,String> judgeNames, String folderId, String claimType,Float unpaidExpanses) throws IOException {
		if (logger.isInfoEnabled()) {
			logger.info("AcapFileNetDAOImpl#createXmls#EntryPoint");
		}

		//Below LinkedHashMap are used to maintain the order of insertion order 
		//so that we can match first, middle, last and their corresponding DOB and Case Numbers.
		LinkedHashMap<String, String> caseNumbersMap=new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> dobMap=new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> firstMap=new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> middleMap=new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> relationMap=new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> lastMap=new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> judgeMap=new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> indigentMap=new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> activitiesMap=new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> hoursMap=new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> tcaMap=new LinkedHashMap<String, String>();
		LinkedHashMap<String, String> childrenMap=new LinkedHashMap<String, String>();
		List<Child> children = new ArrayList<Child>();
		float noOfClients=1.0f;

		boolean isMergeNeeded = true;
		//Creating XML for filenet data
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement(rootelement);
		
		String sjudgeHoursAdjustment=dataMap.get("ACAP_JudgeHoursAdjust");
		Float fjudgeHoursAdjustment=0f;
		if(sjudgeHoursAdjustment!=null && !sjudgeHoursAdjustment.equals("") ){
			fjudgeHoursAdjustment=Float.parseFloat(sjudgeHoursAdjustment);
			if(fjudgeHoursAdjustment!=0.0){
				fjudgeHoursAdjustment=-fjudgeHoursAdjustment;
			}
		}
		root.addElement("JudgeHoursAdjust").addText(Float.toString(fjudgeHoursAdjustment));
		
		//Iterating over the dataMap to form XML and Child Map.
		for (Map.Entry<String, String> entry : dataMap.entrySet()) {
			if(claimType.equalsIgnoreCase(D_N_CLAIM) || claimType.equalsIgnoreCase(GAL_IN_ADOPTION_CLAIM) || claimType.equalsIgnoreCase(CHILD_SUPPORT_FLAT_FEE_CLAIM) || claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM) || claimType.equalsIgnoreCase(JH_DOCKET_BILLING_CLAIM)){
				//If key is ACAP_CaseNumbers then put it's all values in the map with key as "case0, case1, case2..... so on"
				if(!claimType.equalsIgnoreCase(JH_DOCKET_BILLING_CLAIM) && entry.getKey().equalsIgnoreCase(ACAP_CASE_NUMBERS)){
					int index=0;
					if(entry.getValue().trim().contains(COMMA)){
						for (String item : entry.getValue().trim().split(COMMA)) {
							caseNumbersMap.put(CASE+index, item);
							index++;
						}
					}else{
						caseNumbersMap.put(CASE+index,entry.getValue().trim());
					}

					//If key is ACAP_DatesofBirth then put it's all values in the map with key as "dob0, dob1, dob2..... so on"
				}else if((claimType.equalsIgnoreCase(D_N_CLAIM) || claimType.equalsIgnoreCase(GAL_IN_ADOPTION_CLAIM)) && entry.getKey().equalsIgnoreCase(ACAP_DOB)){
					int index=0;
					if(entry.getValue().trim().contains(COMMA)){
						for (String item : entry.getValue().split(COMMA)) {
							dobMap.put(DOB+index, item);
							index++;
						}
					}else{
						dobMap.put(DOB+index,entry.getValue().trim());
					}
					//If key is ACAP_ClientFirst then put it's all values in the map with key as "first0, first1, first2..... so on"
				}else if(entry.getKey().equalsIgnoreCase(ACAP_CLIENT_FIRST)){
					int index=0;
					if(entry.getValue().trim().contains(COMMA)){
						for (String item : entry.getValue().split(COMMA)) {
							firstMap.put(FIRST+index, item);
							index++;
						}
					}else{
						firstMap.put(FIRST+index,entry.getValue().trim());
					}
					//If key is ACAP_ClientMiddle then put it's all values in the map with key as "middle0, middle1, middle2..... so on"
				}else if(entry.getKey().equalsIgnoreCase(ACAP_CLIENT_MIDDLE)){
					int index=0;
					if(entry.getValue().trim().contains(COMMA)){
						for (String item : entry.getValue().split(COMMA)) {
							middleMap.put(MIDDLE+index, item);
							index++;
						}
					}else{
						middleMap.put(MIDDLE+index,entry.getValue().trim());
					}
					//If key is ACAP_ClientLast then put it's all values in the map with key as "last0, last1, last2..... so on"
				}else if(entry.getKey().equalsIgnoreCase(ACAP_CLIENT_LAST)){
					int index=0;
					if(entry.getValue().trim().contains(COMMA)){
						for (String item : entry.getValue().split(COMMA)) {
							lastMap.put(LAST+index, item);
							index++;
						}
					}else{
						lastMap.put(LAST+index,entry.getValue().trim());
					}
					//If key is ACAP_InterpreterJudges then put it's all values in the map with key as "judgeId0, judgeId1, judgeId2..... so on"
				}else if(claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM)  && entry.getKey().equalsIgnoreCase(ACAP_INTERPRETER_JUDGES)){
					int index=0;
					if(entry.getValue().trim().contains(COMMA)){
						for (String item : entry.getValue().split(COMMA)) {
							judgeMap.put(JUDGE_ID+index, item);
							index++;
						}
					}else{
						judgeMap.put(JUDGE_ID+index,entry.getValue().trim());
					}
					//If key is ACAP_DNRelationship then put it's all values in the map with key as "relation0, relation1, relation2..... so on"
				}else if(entry.getKey().equalsIgnoreCase(ACAP_DN_RELATIONSHIP)){
					int index=0;
					if(entry.getValue().trim().contains(COMMA)){
						for (String item : entry.getValue().split(COMMA)) {
							relationMap.put(RELATION+index, item);
							index++;
						}
					}else{
						relationMap.put(RELATION+index,entry.getValue().trim());
					}
					//If key is ACAP_ClientLast then put it's all values in the map with key as "last0, last1, last2..... so on"
				}
				else if(claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM) && entry.getKey().equalsIgnoreCase(ACAP_INTERPRETER_INDIGENT)){
					int index=0;
					System.out.println("Indigent: "+entry.getValue());
					if(entry.getValue().trim().contains(COMMA)){
						for (String item : entry.getValue().split(COMMA)) {
							indigentMap.put(INDIGENT+index, item);
							index++;
						}
					}else{
						indigentMap.put(INDIGENT+index,entry.getValue().trim());
					}
				}else if(claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM) && entry.getKey().equalsIgnoreCase(ACAP_INTERPRETER_ACTIVITIES)){
					int index=0;
					if(entry.getValue().trim().contains(COMMA)){
						for (String item : entry.getValue().split(COMMA)) {
							activitiesMap.put(ACTIVITY+index, item);
							index++;
						}
					}else{
						activitiesMap.put(ACTIVITY+index,entry.getValue().trim());
					}
				}else if(claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM) && entry.getKey().equalsIgnoreCase(ACAP_INTERPRETER_HOURS)){
					int index=0;
					System.out.println("Hours Value: "+entry.getValue());
					if(entry.getValue().trim().contains(COMMA)){
						for (String item : entry.getValue().split(COMMA)) {
							hoursMap.put(HOURS+index, item);
							index++;
						}
					}else{
						hoursMap.put(HOURS+index,entry.getValue().trim());
					}
				}else if(claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM) && entry.getKey().equalsIgnoreCase(ACAP_OFFENSE)){
					int index=0;
					if(entry.getValue().trim().contains(COMMA)){
						for (String item : entry.getValue().split(COMMA)) {
							tcaMap.put(TCA+index, item);
							index++;
						}
					}else{
						tcaMap.put(TCA+index,entry.getValue().trim());
					}
				}else if((claimType.equalsIgnoreCase(JH_DOCKET_BILLING_CLAIM) || claimType.equalsIgnoreCase(CHILD_SUPPORT_FLAT_FEE_CLAIM) || claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM)) && entry.getKey().equalsIgnoreCase(ACAP_NUMBER_OF_CLIENTS)){
					if(entry.getValue()!=EMPTY && entry.getValue()!=null){
						noOfClients=Float.parseFloat(entry.getValue().trim());
						root.addElement(entry.getKey()).addText(entry.getValue());
					}					
				}else{
					//If keys are different from the one which mentioned above then directly create their xml having key as tag and value as text.
					root.addElement(entry.getKey()).addText(entry.getValue());
				}
			}else{
				//If its not D_N_CLAIM then directly create their xml having key as tag and value as text.
				root.addElement(entry.getKey()).addText(entry.getValue());
			}



		}
		if(claimType.equalsIgnoreCase(JUDICIAL_CLERK_FEES)){

			root.addElement(FIRST_DOCKET_NO).addText(firstCaseDocNo);
			root.addElement(LAST_DOCKET_NO).addText(lastCaseDocNo);
		}
		if(claimType.equalsIgnoreCase(D_N_CLAIM) || claimType.equalsIgnoreCase(GAL_IN_ADOPTION_CLAIM) || claimType.equalsIgnoreCase(CHILD_SUPPORT_FLAT_FEE_CLAIM) || claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM)){
			childrenMap.putAll(caseNumbersMap);
			if(claimType.equalsIgnoreCase(D_N_CLAIM) || claimType.equalsIgnoreCase(GAL_IN_ADOPTION_CLAIM) ){
				childrenMap.putAll(dobMap);
				childrenMap.putAll(relationMap);
			}
			if(!claimType.equalsIgnoreCase(D_N_CLAIM) || !claimType.equalsIgnoreCase(GAL_IN_ADOPTION_CLAIM) ){
				childrenMap.putAll(judgeMap);
			}

			childrenMap.putAll(firstMap);
			childrenMap.putAll(middleMap);
			childrenMap.putAll(lastMap);
			if(claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM)){
				childrenMap.putAll(hoursMap);
				childrenMap.putAll(indigentMap);
				childrenMap.putAll(activitiesMap);
				childrenMap.putAll(tcaMap);
			}

			if(firstMap.size()>0){
				for(int i=0;i<firstMap.size();i++){
					Child child =new Child();
					//Finally updating correct values from map to new child object and adding them to list.
					if(!claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM) && childrenMap.containsKey(MIDDLE+i) && childrenMap.get(MIDDLE+i).trim()!=EMPTY){
						child.setChildName(childrenMap.get(FIRST+i)+SPACE+childrenMap.get(MIDDLE+i)+SPACE+childrenMap.get(LAST+i));
						System.out.println(childrenMap.get(FIRST+i)+SPACE+childrenMap.get(MIDDLE+i)+SPACE+childrenMap.get(LAST+i));
					}else if(!claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM)){
						child.setChildName(childrenMap.get(FIRST+i)+SPACE+childrenMap.get(LAST+i));
						System.out.println(childrenMap.get(FIRST+i)+SPACE+childrenMap.get(LAST+i));
					}
					if(claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM)){
						child.setClientFirst(childrenMap.get(FIRST+i));
						child.setClientMiddle(childrenMap.get(MIDDLE+i));
						child.setClientLast(childrenMap.get(LAST+i));
						child.setActivity(childrenMap.get(ACTIVITY+i));
						child.setHours(childrenMap.get(HOURS+i));
						child.setIsIndigent(childrenMap.get(INDIGENT+i));
						Map<String,String> tcaInfoMap=callTCASerivce(childrenMap.get(TCA+i));
						child.setTcaCodeDescription(tcaInfoMap.get(GET_TCA_CODE_DESC));
					}
					if( (claimType.equalsIgnoreCase(D_N_CLAIM) || claimType.equalsIgnoreCase(GAL_IN_ADOPTION_CLAIM) ) && (dobMap.size()>0 && dobMap.size()<=firstMap.size() && childrenMap.containsKey(DOB+i))){
						child.setChildDob(childrenMap.get(DOB+i));
						System.out.println(childrenMap.get(DOB+i));
					}
					if( (claimType.equalsIgnoreCase(D_N_CLAIM) || claimType.equalsIgnoreCase(GAL_IN_ADOPTION_CLAIM) ) && (relationMap.size()>0 && relationMap.containsKey(RELATION+i))){
						child.setRelation(childrenMap.get(RELATION+i));
						System.out.println(childrenMap.get(RELATION+i));
					}
					if( (!claimType.equalsIgnoreCase(D_N_CLAIM) || !claimType.equalsIgnoreCase(GAL_IN_ADOPTION_CLAIM) ) && (judgeMap.size()>0 && childrenMap.containsKey(JUDGE_ID+i))){
						child.setJudgeId(childrenMap.get(JUDGE_ID+i));
						System.out.println(childrenMap.get(JUDGE_ID+i));
					}
					if(caseNumbersMap.size()>0 && childrenMap.containsKey(CASE+i)){
						child.setCaseNumber(childrenMap.get(CASE+i));
						System.out.println(childrenMap.get(CASE+i));
					}
					//Adding each updated child object to children list.
					children.add(child);
				}
			}

			Element childrenTag =null;
			if(claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM)){
				childrenTag=root.addElement(INTERPRETER_JUDGES_XML_TAG);
			}else{
				childrenTag=root.addElement(CHILDREN_XML_TAG);
			}
			Element judgeTag=null;
			Map<String,String> tempJudgeNamesMap=new HashMap<String,String>();
			for (Child child : children) {

				if(claimType.equalsIgnoreCase(INTERPRETER_TIME_LOG_CLAIM)){
					if(!tempJudgeNamesMap.containsKey(child.getJudgeId())){
						judgeTag=childrenTag.addElement(JUDGE_XML_TAG);
						if(judgeNames.get(child.getJudgeId())!=null){
							judgeTag.addElement(JUDGE_NAME_XML_TAG).addText(judgeNames.get(child.getJudgeId()));
						}else{
							judgeTag.addElement(JUDGE_NAME_XML_TAG).addText(EMPTY);
						}
						tempJudgeNamesMap.put(child.getJudgeId(), judgeNames.get(child.getJudgeId()));
					}
					Element caseInfo=judgeTag.addElement(CASE);
					if(null!=child.getJudgeId() && judgeNames.get(child.getJudgeId())!=null){
						caseInfo.addElement(JUDGE_NAME_XML_TAG).addText(judgeNames.get(child.getJudgeId()));
					}else{
						caseInfo.addElement(JUDGE_NAME_XML_TAG).addText(EMPTY);
					}

					if(null!=child.getCaseNumber()){
						caseInfo.addElement(CASE_NUMBER_XML_TAG).addText(child.getCaseNumber());
					}else{
						caseInfo.addElement(CASE_NUMBER_XML_TAG).addText(EMPTY);
					}

					if(null!=child.getClientFirst()){
						caseInfo.addElement(CLIENT_FIRST_XML_TAG).addText(child.getClientFirst());
					}else{
						caseInfo.addElement(CLIENT_FIRST_XML_TAG).addText(EMPTY);
					}

					if(null!=child.getClientMiddle()){
						caseInfo.addElement(CLIENT_MIDDLE_XML_TAG).addText(child.getClientMiddle());
					}else{
						caseInfo.addElement(CLIENT_MIDDLE_XML_TAG).addText(EMPTY);
					}
					if(null!=child.getClientLast()){
						caseInfo.addElement(CLIENT_LAST_XML_TAG).addText(child.getClientLast());
					}else{
						caseInfo.addElement(CLIENT_LAST_XML_TAG).addText(EMPTY);
					}

					if(null!=child.getIsIndigent()){
						caseInfo.addElement(INDIGENT).addText(child.getIsIndigent());
					}else{
						caseInfo.addElement(INDIGENT).addText(EMPTY);
					}

					if(null!=child.getActivity()){
						caseInfo.addElement(ACTIVITY).addText(child.getActivity());
						if(null!=child.getHours() && child.getActivity().equalsIgnoreCase(WAIT_TIME)){
							caseInfo.addElement(WAIT_HOURS).addText(child.getHours());
						}else{
							caseInfo.addElement(WAIT_HOURS).addText(EMPTY);
						}
					}else{
						caseInfo.addElement(ACTIVITY).addText(EMPTY);
					}

					if(null!=child.getHours()){
						caseInfo.addElement(HOURS).addText(child.getHours());
					}else{
						caseInfo.addElement(HOURS).addText(EMPTY);
					}

					if(null!=child.getTcaCodeDescription()){
						caseInfo.addElement(TCA).addText(child.getTcaCodeDescription());
					}else{
						caseInfo.addElement(TCA).addText(EMPTY);
					}

				}else{
					Element childTag=childrenTag.addElement(CHILD_XML_TAG);
					//Adding Child Name if its not null else Empty
					if(child.getChildName()!=null){
						childTag.addElement(NAME_XML_TAG).addText(child.getChildName());
					}else{
						childTag.addElement(NAME_XML_TAG).addText(EMPTY);
					}

					//Adding Child's Date of Birth if its not null else Empty
					if(claimType.equalsIgnoreCase(D_N_CLAIM) || claimType.equalsIgnoreCase(GAL_IN_ADOPTION_CLAIM)){
						if(child.getChildDob()!=null){
							childTag.addElement(DOB_XML_TAG).addText(child.getChildDob());
						}else{
							childTag.addElement(DOB_XML_TAG).addText(EMPTY);
						}
					}

					//Adding Relation if its not null else Empty
					if(claimType.equalsIgnoreCase(D_N_CLAIM) || claimType.equalsIgnoreCase(GAL_IN_ADOPTION_CLAIM)){
						if(child.getRelation()!=null){
							childTag.addElement(RELATION).addText(child.getRelation());
						}else{
							childTag.addElement(RELATION).addText(EMPTY);
						}
					}

//					//Adding Judge's Name if its not null else Empty
//					if(claimType.equalsIgnoreCase(CHILD_SUPPORT_FLAT_FEE_CLAIM)){
//						if(child.getJudgeId()!=null && judgeNames.get(child.getJudgeId())!=null){
//							childTag.addElement(JUDGE_XML_TAG).addText(judgeNames.get(child.getJudgeId()));
//						}else{
//							childTag.addElement(JUDGE_XML_TAG).addText(EMPTY);
//						}
//					}

					//Adding Case Number if its not null else Empty
					if(child.getCaseNumber()!=null){
						childTag.addElement(CASE_NUMBER_XML_TAG).addText(child.getCaseNumber());
					}else{
						childTag.addElement(CASE_NUMBER_XML_TAG).addText(EMPTY);
					}
				}	
			}
		}

		if (isMergeNeeded) {
			try {
				// calling AcapDbDAOImpl to merge filenet xml with DbData xml by passing the root node of filenet xml.
				String finalXml = getDbDAO().getDbData(root, this.getIsWaitingForApproval(), claimNumber, noOfClients,
						folderId, claimType, getClaimantLogin(),getClaimTypeId(),unpaidExpanses);
			} catch (AcapDataAccessException e) {
				if (logger.isInfoEnabled()) {
					logger.error("AcapFileNetDAOImpl#createXmls#exception" + e.getMessage(), e);
				}

			}
		}
		if (logger.isInfoEnabled()) {
			logger.info("AcapFileNetDAOImpl#createXmls#ExitPoint");
		}

		//returing final xml as a string to AcapFNOperations.
		return root.asXML();
	}

	public String getClaimTypeId() {
		return claimTypeId;
	}

	public void setClaimTypeId(String claimTypeId) {
		this.claimTypeId = claimTypeId;
	}

	//Return TCA Code and Description based on Master Id.
	private Map<String,String> callTCASerivce(String masterId) {
		RestTemplate restTemplate=new RestTemplate();
		String tcaCodeDescription=EMPTY;
		Map<String,String> tcaInfoMap=new HashMap<String,String>();
		ResponseEntity<AcapOffenseClass[]> responseEntity  = restTemplate.getForEntity(restURL+masterId, AcapOffenseClass[].class);
		AcapOffenseClass[] entityObjects=responseEntity.getBody();
		if(null!=entityObjects && entityObjects.length>0 && null!=entityObjects[0].getOffense_Class()){
			if((null!=entityObjects[0].getTCA_Code() && entityObjects[0].getTCA_Code().trim()!=EMPTY) && (null!=entityObjects[0].getDescription() && entityObjects[0].getDescription().trim()!=EMPTY)){
				tcaCodeDescription=entityObjects[0].getTCA_Code()+" - "+entityObjects[0].getDescription();
				tcaInfoMap.put(GET_TCA_CODE_DESC, tcaCodeDescription);
			}
		}
		return tcaInfoMap;
	}

	@Override
	public Properties getClaimDocProperties() {

		return getClaimProps();
	}

	private String isOfflineAndLegacy(String claimNumber,ObjectStore os){

		String docId="";
		com.filenet.api.core.Document caseForm=null;
		String CLAIM_DOC_SEARCH = "select Id from ACAP_Claim where IsCurrentVersion=true AND ACAP_ClaimNumber='";
		String CLAIM_DOCUMENT = "ACAP_Claim";
		String query=CLAIM_DOC_SEARCH+claimNumber+"'";
		try {
			SearchScope searchScope = new SearchScope(os);
			SearchSQL searchSQL = new SearchSQL(query);
			PropertyFilter pf = new PropertyFilter();
			pf.addIncludeProperty(new FilterElement(null, null, true, "Id", null));
			RepositoryRowSet repRowSet = (RepositoryRowSet) searchScope.fetchRows(searchSQL, null, pf, null);
			Iterator iterator = repRowSet.iterator();
			RepositoryRow repRow = null;
			if(iterator.hasNext()){
				repRow = (RepositoryRow) iterator.next();
				caseForm=Factory.Document.fetchInstance(os, repRow.getProperties().get("Id").getIdValue().toString(), null);
				docId = caseForm.get_Id().toString();
			}

		}catch (Exception ex) {
			if (logger.isErrorEnabled()) {
				logger.error("AcapFNOperations#getClaimDocument#exception" + ex.getMessage(), ex);
			}		

		}
		return docId;
	}
	public static boolean isValid(String str)
	{
		return str.matches("[\\d\\.\\-\\,\\s+\\/()]+");  
	}

}
