package gov.tn.acap.filenet;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.security.auth.Subject;
import javax.xml.transform.Result;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.commons.codec.binary.Base64;
import org.apache.fop.apps.FOPException;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.apache.log4j.Logger;
import org.apache.pdfbox.multipdf.PDFMergerUtility;
import org.springframework.stereotype.Component;

import com.filenet.api.collection.ContentElementList;
import com.filenet.api.collection.DocumentSet;
import com.filenet.api.collection.FolderSet;
import com.filenet.api.collection.ReferentialContainmentRelationshipSet;
import com.filenet.api.collection.RepositoryRowSet;
import com.filenet.api.constants.AutoClassify;
import com.filenet.api.constants.AutoUniqueName;
import com.filenet.api.constants.CheckinType;
import com.filenet.api.constants.ClassNames;
import com.filenet.api.constants.DefineSecurityParentage;
import com.filenet.api.constants.RefreshMode;
import com.filenet.api.constants.ReservationType;
import com.filenet.api.constants.SystemAddOnId;
import com.filenet.api.core.Connection;
import com.filenet.api.core.ContentTransfer;
import com.filenet.api.core.Document;
import com.filenet.api.core.Domain;
import com.filenet.api.core.Factory;
import com.filenet.api.core.Folder;
import com.filenet.api.core.ObjectStore;
import com.filenet.api.core.ReferentialContainmentRelationship;
import com.filenet.api.property.FilterElement;
import com.filenet.api.property.Properties;
import com.filenet.api.property.PropertyFilter;
import com.filenet.api.query.RepositoryRow;
import com.filenet.api.query.SearchSQL;
import com.filenet.api.query.SearchScope;
import com.filenet.api.util.Id;
import com.filenet.api.util.UserContext;

import gov.tn.acap.constants.AcapFNOperationsConstants;
import gov.tn.acap.dao.AcapFileNetDAO;
import gov.tn.acap.exception.AcapDataAccessException;
import gov.tn.acap.exception.AcapPDFGenException;

/**
 * The Class AcapFNOperations
 */
@Component
public class AcapFNOperations implements AcapFNOperationsConstants{


	/** The logger. */
	private static Logger logger = Logger.getLogger(AcapFNOperations.class);

	/** The case docs. */
	//private  List<InputStream> caseDocs=null;

	private  String sclaimType=null;

	/** The ce server URL. */
	private String ceServerURL;

	/** The ldap system user. */
	private String ldapSystemUser;

	/** The ldap system pwd. */
	private String ldapSystemPwd;

	/** The ce object store. */
	private String ceObjectStore;

	/** The jaas login module. */
	private String jaasLoginModule;


	/** The file net DAO impl. */
	private AcapFileNetDAO fileNetDAOImpl;

	/** The connection. */
	private Connection connection=null;

	/** The domain. */
	private Domain domain=null;

	/** The object store. */
	private ObjectStore objectStore=null;

	/** The xslt file. */
	private File xsltFile;

	/** The opt stream. */
	private ByteArrayOutputStream optStream=null;

	/** The final xml. */
	String finalXml;

	/**
	 * Gets the ce server URL.
	 *
	 * @return the ceServerURL
	 */
	public String getCeServerURL() {
		return ceServerURL;
	}

	/**
	 * Sets the ce server URL.
	 * @param ceServerURL the ceServerURL to set
	 */
	public void setCeServerURL(String ceServerURL) {
		this.ceServerURL = ceServerURL;
	}

	/**
	 * Gets the ldap system user.
	 *
	 * @return the ldapSystemUser
	 */
	public String getLdapSystemUser() {
		return ldapSystemUser;
	}

	/**
	 * Sets the ldap system user.
	 *
	 * @param ldapSystemUser the ldapSystemUser to set
	 */
	public void setLdapSystemUser(String ldapSystemUser) {
		this.ldapSystemUser = ldapSystemUser;
	}

	/**
	 * Gets the ce object store.
	 *
	 * @return the ceObjectStore
	 */
	public String getCeObjectStore() {
		return ceObjectStore;
	}

	/**
	 * Sets the ce object store.
	 *
	 * @param ceObjectStore the ceObjectStore to set
	 */
	public void setCeObjectStore(String ceObjectStore) {
		this.ceObjectStore = ceObjectStore;
	}



	/**
	 * Gets the jaas login module.
	 *
	 * @return the jaas login module
	 */
	public String getJaasLoginModule() {
		return jaasLoginModule;
	}

	/**
	 * Sets the jaas login module.
	 *
	 * @param jaasLoginModule the new jaas login module
	 */
	public void setJaasLoginModule(String jaasLoginModule) {
		this.jaasLoginModule = jaasLoginModule;
	}

	/**
	 * Gets the file net DAO impl.
	 *
	 * @return the fileNetDAOImpl
	 */
	public AcapFileNetDAO getFileNetDAOImpl() {
		return fileNetDAOImpl;
	}

	/**
	 * Sets the file net DAO impl.
	 *
	 * @param fileNetDAOImpl the fileNetDAOImpl to set
	 */
	public void setFileNetDAOImpl(AcapFileNetDAO fileNetDAOImpl) {
		this.fileNetDAOImpl = fileNetDAOImpl;
	}

	/**
	 * Gets the ldap system pwd.
	 *
	 * @return the ldap system pwd
	 */
	public String getLdapSystemPwd() {
		return ldapSystemPwd;
	}

	/**
	 * Sets the ldap system pwd.
	 *
	 * @param ldapSystemPwd the new ldap system pwd
	 */
	public void setLdapSystemPwd(String ldapSystemPwd) {
		Base64 encoder = new Base64();
		this.ldapSystemPwd = new String(encoder.decode(ldapSystemPwd.getBytes()));
	}

	/**
	 * Gets the CE object store.
	 *
	 * @return the CE object store
	 * @throws Exception the exception
	 */
	public ObjectStore getCEObjectStore() throws Exception {
		if (logger.isInfoEnabled()) {
			logger.info("FNOperationsl#getCEObjectStore#start");
		}


		if (logger.isInfoEnabled()) {
			logger.info("Here is the url info " + this.getCeServerURL());
		}

		connection = Factory.Connection.getConnection(this.getCeServerURL());
		Subject subject = UserContext.createSubject(connection, this.getLdapSystemUser(), this.getLdapSystemPwd(),
				this.getJaasLoginModule());
		UserContext uc = UserContext.get();
		uc.pushSubject(subject);
		domain = Factory.Domain.fetchInstance(connection, null, null);
		ObjectStore os = Factory.ObjectStore.fetchInstance(domain, this.getCeObjectStore(), null);
		if (logger.isInfoEnabled()) {
			logger.info("FNOperationsl#getCEObjectStore#end");
		}
		return os;
	}	

	/**
	 * Gets the PDF bytes.
	 *
	 * @param claimNumber the claim number
	 * @param claimStatus the claim status
	 * @param folderId the folder id
	 * @param claimType the claim type
	 * @return the PDF bytes
	 * @throws AcapPDFGenException the acap PDF gen exception
	 */
	public byte[] getPDFBytes(String claimNumber,String claimStatus,String folderId,String claimType) throws AcapPDFGenException{
		String pdfBytesAsString = uploadForm(claimNumber, claimStatus, folderId, claimType,false,false);
		return pdfBytesAsString.getBytes();
	}

	/**
	 * Upload form.
	 *
	 * @param claimNumber the claim number
	 * @param claimStatus the claim status
	 * @param folderId the folder id
	 * @param claimType the claim type
	 * @param isMergeNeeded the is merge needed
	 * @param isFilingNeeded the is filing needed
	 * @return the string
	 * @throws AcapPDFGenException the acap PDF gen exception
	 */
	public synchronized String uploadForm(String claimNumber,String claimStatus,String folderId,String claimType,boolean isMergeNeeded,boolean isFilingNeeded) throws AcapPDFGenException {
		String docID = EMPTY;
		if (logger.isInfoEnabled()) {
			logger.info("FNOperationsl#uploadForm#start");
		}

		try{
			List<InputStream> caseDocs=null;
			ObjectStore os  = getCEObjectStore();
			
			finalXml = fileNetDAOImpl.getFileNetData(claimNumber,claimStatus, folderId, claimType, os);
			System.out.println("Claim Status when pdf is generated....."+claimStatus);
			
			System.out.println("Final XML....."+finalXml);
			
			String judgeStatus = getJudgeStatus(claimNumber, os);
			System.out.println("Judge status call:"+judgeStatus);
			
//			if(finalXml != null && finalXml.trim().startsWith("Legacy")){
//				docID = finalXml.replace("Legacy", "");
//			//if offline get accesscontetnstream
////				return docID;
//			}
			
			// code for removing (un-filing) pdf from Home folder for electronic signature epic
			if(claimStatus.equalsIgnoreCase("Returned by AOC Remove PDF") || claimStatus.equalsIgnoreCase("Denied Remove PDF")) {
				System.out.println("Calling unfile document: "+claimNumber+ " folderId: "+folderId);
				String unfiledDocId = getDocumentandunFile(os, claimNumber, folderId);
				return unfiledDocId;
			}
			
			Pattern pattern = Pattern.compile(JUDGE_PATTERN);
			float judgeApprovedTotalCost = getAmount(pattern,finalXml);
			
			pattern = Pattern.compile(CLAIM_PATTERN);
			float reimbursementTotal = getAmount(pattern,finalXml);
			
			Document caseForm = null;
			
			if(isFilingNeeded) {
				caseForm = getClaimDocument(os, claimNumber);
				Properties propsCollection = caseForm.getProperties();
				
				caseDocs = new ArrayList<InputStream>();
				
				propsCollection.putValue(DOCUMENT_TITLE, claimNumber);
				propsCollection.putValue(CLAIM_NUMBER, claimNumber);
				
				Properties claimsProps = fileNetDAOImpl.getClaimDocProperties();
				propsCollection = updateClaimDocProps(propsCollection, claimsProps, judgeApprovedTotalCost, reimbursementTotal);
			}
			ByteArrayOutputStream optSteam = createPDF(finalXml, claimType);
			ContentElementList contElementList = Factory.ContentElement.createList();			
			ContentTransfer contTrans = Factory.ContentTransfer.createInstance();
			ByteArrayOutputStream contentOfflineStream = null;
			
			if(isMergeNeeded && caseDocs != null){
				
				if(finalXml != null && judgeStatus.equals("No") && claimStatus.trim().equalsIgnoreCase("Submit for Final Approval")){
					String docId = isOfflineAndLegacy(claimNumber, os);
				
					//if offline get access content stream
					System.out.println("For offline--Print Doc ID: "+docId);
					
					if(docId != "" && null != docId) {
						contentOfflineStream = getDocumentContentStream(os, docId);
					}				

				}
				
				ByteArrayOutputStream mergedPdf = mergePDFStreams(folderId, os, optSteam, caseDocs, contentOfflineStream);
				contTrans.setCaptureSource(new ByteArrayInputStream(mergedPdf.toByteArray()));
			}
			else{
				contTrans.setCaptureSource(new ByteArrayInputStream(optSteam.toByteArray()));
			}



			if(isFilingNeeded && null!=caseForm){
				setDocumentMetaDataInfo(caseForm, contElementList, contTrans,claimNumber);
				docID = fileTheDocument(folderId, os, caseForm,claimNumber);
			}else{
				docID = optSteam.toString();
			}

			if(logger.isDebugEnabled()){
				logger.debug("printing xmldata" +finalXml);
				logger.debug("Document added to filenet with ID " + docID);
			}
			endSession(caseDocs);


		}
		catch(Exception ex){
			if(logger.isErrorEnabled()){
				logger.error("AcapFNOperations#uploadForm#exception"+ex.getMessage(),ex);
			}
			throw new AcapPDFGenException(ex);
		}

		if (logger.isInfoEnabled()) {
			logger.info("FNOperationsl#uploadForm#end");
		}

		return docID;
	}
	
	/**
	 * Method used to unfile the document for Claim Number from Claim folder.
	 * @param os
	 * @param claimNumber
	 */
	private String getDocumentandunFile(ObjectStore os, String claimNumber, String folderId) {

		String docId="";
		
		com.filenet.api.core.Document caseForm=null;
		
		String CLAIM_DOC_SEARCH = "select Id from ACAP_Claim where ACAP_ClaimNumber='";
		
		String query = CLAIM_DOC_SEARCH + claimNumber + "'";
		System.out.println("String query--"+query);
		try {
			SearchScope searchScope = new SearchScope(os);
			SearchSQL searchSQL = new SearchSQL(query);
			PropertyFilter pf = new PropertyFilter();
			
			pf.addIncludeProperty(new FilterElement(null, null, true, "Id", null));
			RepositoryRowSet repRowSet = (RepositoryRowSet) searchScope.fetchRows(searchSQL, null, pf, null);
			Iterator iterator = repRowSet.iterator();
			RepositoryRow repRow = null;
			
			System.out.println("Iterator has Next: "+iterator.hasNext());
			while(iterator.hasNext()){
				repRow = (RepositoryRow) iterator.next();
				caseForm = Factory.Document.fetchInstance(os, repRow.getProperties().get("Id").getIdValue().toString(), null);
				
				Id id = caseForm.get_Id();
				System.out.println("Calling unfile the document:"+id);
				
				caseForm.delete();
				caseForm.save(RefreshMode.REFRESH);
				
				//unfileTheDocument(folderId, os, id, claimNumber, caseForm);
				
			}

		}catch (Exception ex) {
			if (logger.isErrorEnabled()) {
				logger.error("AcapFNOperations#getClaimDocument#exception" + ex.getMessage(), ex);
			}		

		}
		return docId;
	}
	
	/**
	 *  Files the document in filenet.
	 *
	 * @param folderId the folder id
	 * @param os the os
	 * @param caseForm the case form
	 * @param claimNumber the claim number
	 * @return the string
	 */
	private static String unfileTheDocument(String folderId, ObjectStore os, Id docId,String claimNumber, Document caseForm) {
		String docID;
		System.out.println("unfileTheDocument called, "+folderId);
		
		PropertyFilter pf = new PropertyFilter(); 

		pf.addIncludeProperty(new FilterElement(null, null, null, "Containers", null));
		// Get document to be unfiled.
		Document doc = Factory.Document.fetchInstance(os, docId, pf);

		// Iterate all folders that contain the document, until the desired folder is found.
		ReferentialContainmentRelationshipSet rcrs = doc.get_Containers();
		Iterator iter = rcrs.iterator();
		while (iter.hasNext() )
		{
		   ReferentialContainmentRelationship rcr = (ReferentialContainmentRelationship) iter.next();
		   
		   rcr.delete();
		   //Folder folder = (Folder) rcr.get_Tail();

	      //folder.unfile(caseForm);
	      rcr.save(RefreshMode.REFRESH);
		}

		return "";
	}
	/**
	 * Get Judge Status
	 * @param claimNumber
	 * @param os
	 * @return
	 */
	private String getJudgeStatus(String claimNumber, ObjectStore os) {
		String status = "";
		String query = "SELECT ACAP_Online FROM ACAP_Claims WHERE ACAP_ClaimNumber = '" + claimNumber + "'";
		
		try {
			SearchScope searchScope = new SearchScope(os);
			SearchSQL searchSQL = new SearchSQL(query);

			PropertyFilter pf = new PropertyFilter();
			pf.addIncludeProperty(new FilterElement(null, null, true, "ACAP_Online", null));
			RepositoryRowSet repRowSet = (RepositoryRowSet) searchScope.fetchRows(searchSQL, null, pf, null);
			Iterator iterator = repRowSet.iterator();
			RepositoryRow repRow = null;

			while (iterator.hasNext()) {
				repRow = (RepositoryRow) iterator.next();
				Properties cmProperties = repRow.getProperties();
				System.out.println("cmProperties:"+cmProperties);
				Boolean bStatus = cmProperties.getBooleanValue("ACAP_Online");
				
				System.out.println("Judge status:"+bStatus);
				
				if(null != bStatus) {
					boolean bVal = bStatus.booleanValue();
					
					if(bVal) {
						status = "Yes";
					}
					else {
						status = "No";
					}
				}

			}

		} catch (Exception ex) {
			if (logger.isErrorEnabled()) {
				logger.error("AcapFileNetDAOImpl#getClaimProperties#exception" + ex.getMessage(), ex);
			}

		}
		if (logger.isInfoEnabled()) {
			logger.info("AcapFileNetDAOImpl#getClaimProperties#ExitPoint");
		}
		
		return status;
		
	}
	
	/**
	 * 
	 * @param claimNumber
	 * @param os
	 * @return
	 */
	private String isOfflineAndLegacy(String claimNumber, ObjectStore os){

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

	/**
	 * Upload form.
	 *
	 * @param claimNumber the claim number
	 * @param claimStatus the claim status
	 * @param folderId the folder id
	 * @param claimType the claim type
	 * @param isMergeNeeded the is merge needed
	 * @param isFilingNeeded the is filing needed
	 * @return the string
	 * @throws AcapPDFGenException the acap PDF gen exception
	 */
	public synchronized String updloadPrintClaim(String claimNumber, String claimStatus, String folderId, String claimType, boolean isMergeNeeded, boolean isFilingNeeded) throws AcapPDFGenException{
		String docID = EMPTY;
		if (logger.isInfoEnabled()) {
			logger.info("FNOperationsl#uploadForm#start");
		}
		try{
			List<InputStream> caseDocs=null;
			ObjectStore os  = getCEObjectStore();
			Document caseForm = null;
			ByteArrayOutputStream optSteam = null;
			
			if(isFilingNeeded) {
				
				Map hashmap = getPrintClaimDocument(os,claimNumber);
				
				caseForm = (Document) hashmap.get("caseForm");
				optSteam = toByteArray((InputStream)hashmap.get("inputDocStream"));
				caseDocs = new ArrayList<InputStream>();
			}

			ContentElementList contElementList = Factory.ContentElement.createList();			
			ContentTransfer contTrans = Factory.ContentTransfer.createInstance();

			if(isMergeNeeded && caseDocs !=null){
				ByteArrayOutputStream mergedPdf = mergePDFStreams(folderId, os, optSteam, caseDocs);
				contTrans.setCaptureSource(new ByteArrayInputStream(mergedPdf.toByteArray()));
			}else{
				contTrans.setCaptureSource(new ByteArrayInputStream(optSteam.toByteArray()));
			}

			if(isFilingNeeded && null!=caseForm){
				setDocumentMetaDataInfo(caseForm, contElementList, contTrans,claimNumber);
				docID = fileTheDocument(folderId, os, caseForm,claimNumber);
			}else{
				docID = optSteam.toString();
			}

			if(logger.isDebugEnabled()){
				logger.debug("Document added to filenet with ID " + docID);
			}
			endSession(caseDocs);


		}
		catch(Exception ex){
			if(logger.isErrorEnabled()){
				logger.error("AcapFNOperations#uploadForm#exception"+ex.getMessage(),ex);
			}
			throw new AcapPDFGenException(ex);
		}

		if (logger.isInfoEnabled()) {
			logger.info("FNOperationsl#uploadForm#end");
		}

		return docID;
	}



	/**
	 * Sets the document meta data info.
	 *
	 * @param caseForm the case form
	 * @param contElementList the cont element list
	 * @param contTrans the cont trans
	 * @param claimNumber the claim number
	 */
	private void setDocumentMetaDataInfo(Document caseForm, ContentElementList contElementList,	ContentTransfer contTrans,String claimNumber) {
		contTrans.set_RetrievalName(claimNumber);
		contTrans.set_ContentType(APPLICATION_PDF);
		contElementList.add(contTrans);
		caseForm.set_ContentElements(contElementList);
		caseForm.set_MimeType(APPLICATION_PDF);
		caseForm.checkin(AutoClassify.DO_NOT_AUTO_CLASSIFY, CheckinType.MAJOR_VERSION);
		caseForm.save(RefreshMode.REFRESH);
	}

	/**
	 *  Files the document in filenet.
	 *
	 * @param folderId the folder id
	 * @param os the os
	 * @param caseForm the case form
	 * @param claimNumber the claim number
	 * @return the string
	 */
	private String fileTheDocument(String folderId, ObjectStore os, Document caseForm,String claimNumber) {
		String docID;
		// File the document.
		Folder folder = Factory.Folder.getInstance(os, ClassNames.FOLDER,new Id(folderId) );
		ReferentialContainmentRelationship rcr = folder.file(caseForm,
				AutoUniqueName.AUTO_UNIQUE,claimNumber,
				DefineSecurityParentage.DO_NOT_DEFINE_SECURITY_PARENTAGE);
		rcr.save(RefreshMode.REFRESH);
		//os.refresh();
		docID = caseForm.get_Id().toString();
		return docID;
	}

	/**
	 *  Get Merged PDF's Stream.
	 *
	 * @param folderId the folder id
	 * @param os the os
	 * @param optSteam the opt steam
	 * @return the byte array output stream
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws AcapPDFGenException 
	 */
	private ByteArrayOutputStream mergePDFStreams(String folderId, ObjectStore os, ByteArrayOutputStream optSteam,List<InputStream> caseDocs) throws IOException, AcapPDFGenException {
		InputStream pdfForm = new ByteArrayInputStream(optSteam.toByteArray()); 
		if(caseDocs!=null){
			logger.info("************* caseDocs xml :: "+caseDocs);
			caseDocs.add(pdfForm);
		}else{
			logger.error("case docs folder is null in mergePdfStream Method");
			throw new AcapPDFGenException("case docs folder is null in mergePdfStream Method");
		}

		getFolderElements(folderId,os,caseDocs);
		PDFMergerUtility PDFmerger = new PDFMergerUtility();
		ByteArrayOutputStream mergedPdf = new ByteArrayOutputStream();
		//Adding all InputStreams to PDFMerger as Source files which needs to be merged.
		PDFmerger.addSources(caseDocs);
		//Setting Destination Output Stream
		PDFmerger.setDestinationStream(mergedPdf);
		//Merging the two documents
		PDFmerger.mergeDocuments();
		return mergedPdf;
	}
	
	/**
	 *  Get Merged PDF's Stream.
	 *
	 * @param folderId the folder id
	 * @param os the os
	 * @param optSteam the opt steam
	 * @return the byte array output stream
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws AcapPDFGenException 
	 */
	private ByteArrayOutputStream mergePDFStreams(String folderId, ObjectStore os, ByteArrayOutputStream optSteam, List<InputStream> caseDocs, ByteArrayOutputStream offContentStream)
			throws IOException, AcapPDFGenException {
		InputStream pdfForm = new ByteArrayInputStream(optSteam.toByteArray()); 
		
		InputStream offlineinputStream = null;
		
		if(null != offContentStream) {
			offlineinputStream = new ByteArrayInputStream(offContentStream.toByteArray()); 
		}

		
		if(caseDocs != null){
			logger.info("************* caseDocs xml :: "+caseDocs);
			caseDocs.add(pdfForm);
			
			if(null != offlineinputStream) 
			{
				caseDocs.add(offlineinputStream);
			}

			
		}else{
			logger.error("case docs folder is null in mergePdfStream Method");
			throw new AcapPDFGenException("case docs folder is null in mergePdfStream Method");
		}

		getFolderElements(folderId, os, caseDocs);
		
		PDFMergerUtility PDFmerger = new PDFMergerUtility();
		ByteArrayOutputStream mergedPdf = new ByteArrayOutputStream();
		
		//Adding all InputStreams to PDFMerger as Source files which needs to be merged.
		PDFmerger.addSources(caseDocs);
		//Setting Destination Output Stream
		PDFmerger.setDestinationStream(mergedPdf);
		//Merging the two documents
		PDFmerger.mergeDocuments();
		
		return mergedPdf;
	}

	/**
	 * Gets the amount.
	 *
	 * @param pattern the pattern
	 * @param xml the xml
	 * @return the amount
	 */
	private float getAmount(Pattern pattern,String xml) {
		float amount=0.00f;
		Matcher matcher = pattern.matcher(xml);
		matcher.find();

		if(matcher.groupCount()==1 && matcher.group(1).trim().length()!=0){
			amount=Float.parseFloat(matcher.group(1).trim());
		}
		return amount;
	}
	
	/**
	 * Get document content stream
	 * @param os
	 * @param docId
	 */
	private ByteArrayOutputStream getDocumentContentStream(ObjectStore os, String docId) {
		ByteArrayOutputStream contentStream = null;
		
		try {
			Document res=Factory.Document.fetchInstance(os, docId, null);
	
	
//			if(res.get_IsCurrentVersion().booleanValue()== false)
//			{
//				res = (Document)res.get_CurrentVersion();
//			}
//			if (res.get_IsReserved().booleanValue() == true)
//			{
//				Document reservationdoc= (Document)res.cancelCheckout();
//				reservationdoc.save(RefreshMode.REFRESH);
//			}
		//	res = Factory.Document.fetchInstance(os, docId, null);
			//logger.info("got the access stream "+res.accessContentStream(0));


			contentStream = toByteArray((InputStream)res.accessContentStream(0));
		
			//res.checkout(ReservationType.EXCLUSIVE, null, null, null);
			//res.save(RefreshMode.REFRESH);
			
		} catch (IOException ex) {
			if (logger.isErrorEnabled()) {
				logger.error("AcapFNOperations#getDocumentContentStream#exception" + ex.getMessage(), ex);
			}
		}
		return contentStream;
		
	}

	/**
	 * Gets the claim document.
	 *
	 * @param os the os
	 * @param claimNo the claim no
	 * @return the claim document
	 */
	private Document getClaimDocument(ObjectStore os,String claimNo) {

		Document caseForm=null;
		String query = CLAIM_DOC_SEARCH + claimNo + "'";
		try {
			SearchScope searchScope = new SearchScope(os);
			SearchSQL searchSQL = new SearchSQL(query);
			PropertyFilter pf = new PropertyFilter();
			pf.addIncludeProperty(new FilterElement(null, null, true, "Id", null));
			RepositoryRowSet repRowSet = (RepositoryRowSet) searchScope.fetchRows(searchSQL, null, pf, null);
			
			Iterator iterator = repRowSet.iterator();
			RepositoryRow repRow = null;
			
			if(!iterator.hasNext()) {
				logger.info("inside creating new docuemnt content");
				caseForm = Factory.Document.createInstance(os, CLAIM_DOCUMENT);
			}
			else {
				while (iterator.hasNext()) {
					logger.info("inside existing new docuemnt content");
					repRow = (RepositoryRow) iterator.next();
					Document res=Factory.Document.fetchInstance(os, repRow.getProperties().get(ID).getIdValue().toString(), null);


					if(res.get_IsCurrentVersion().booleanValue() == false)
					{
						res=(Document)res.get_CurrentVersion();
					}
					if (res.get_IsReserved().booleanValue() == true)
					{
						Document reservationdoc= (Document)res.cancelCheckout();
						reservationdoc.save(RefreshMode.REFRESH);
					}
					
					res=Factory.Document.fetchInstance(os, repRow.getProperties().get(ID).getIdValue().toString(), null);
					logger.info("got the access stream "+res.accessContentStream(0));
					
					res.checkout(ReservationType.EXCLUSIVE, null, null, null);
					res.save(RefreshMode.REFRESH);
					caseForm = (Document)res.get_Reservation();


				}
			}

		}catch (Exception ex) {
			if (logger.isErrorEnabled()) {
				logger.error("AcapFNOperations#getClaimDocument#exception" + ex.getMessage(), ex);
			}

		}
		return caseForm;
	}


	/**
	 * Gets the claim document.
	 *
	 * @param os the os
	 * @param claimNo the claim no
	 * @return the claim document
	 */
	private Map getPrintClaimDocument(ObjectStore os, String claimNo) {

		Document caseForm = null;
		Map caseMap = new HashMap();
		String query = CLAIM_DOC_SEARCH + claimNo + "'";
		
		try {
			SearchScope searchScope = new SearchScope(os);
			SearchSQL searchSQL = new SearchSQL(query);
			PropertyFilter pf = new PropertyFilter();
			pf.addIncludeProperty(new FilterElement(null, null, true, "Id", null));
			RepositoryRowSet repRowSet = (RepositoryRowSet) searchScope.fetchRows(searchSQL, null, pf, null);
			Iterator iterator = repRowSet.iterator();
			RepositoryRow repRow = null;
			
			if(!iterator.hasNext()){
				logger.info("inside creating new docuemnt content");
				caseForm = Factory.Document.createInstance(os, CLAIM_DOCUMENT);
			}
			else{
				while (iterator.hasNext()) {
					logger.info("inside existing new docuemnt content");
					repRow = (RepositoryRow) iterator.next();
					Document res = Factory.Document.fetchInstance(os, repRow.getProperties().get(ID).getIdValue().toString(), null);


					if(res.get_IsCurrentVersion().booleanValue()== false)
					{
						res=(Document)res.get_CurrentVersion();
					}
					if (res.get_IsReserved().booleanValue()== true)
					{
						Document reservationdoc= (Document)res.cancelCheckout();
						reservationdoc.save(RefreshMode.REFRESH);
					}
					res=Factory.Document.fetchInstance(os, repRow.getProperties().get(ID).getIdValue().toString(), null);
					//logger.info("got the access stream "+res.accessContentStream(0));
					caseMap.put("inputDocStream", res.accessContentStream(0));
					res.checkout(ReservationType.EXCLUSIVE, null, null, null);
					res.save(RefreshMode.REFRESH);
					caseForm = (Document) res.get_Reservation();
					caseMap.put("caseForm", caseForm);

				}
			}

		}catch (Exception ex) {
			if (logger.isErrorEnabled()) {
				logger.error("AcapFNOperations#getClaimDocument#exception" + ex.getMessage(), ex);
			}

		}
		return caseMap;
	}
	/**
	 * Update claim doc props.
	 *
	 * @param propsCollection the props collection
	 * @param claimsProps the claims props
	 * @param judgeApprovedTotalCost the judge approved total cost
	 * @param reimbursementTotal the reimbursement total
	 * @return the properties
	 */
	private Properties updateClaimDocProps(Properties propsCollection, Properties claimsProps, float judgeApprovedTotalCost, float reimbursementTotal) {

		if(claimsProps!=null){
			/*if(claimsProps.isPropertyPresent(ACAP_ASSIGNEDJUDGE))
				propsCollection.putValue(ACAP_ASSIGNEDJUDGE,claimsProps.get(ACAP_ASSIGNEDJUDGE).getStringValue());*/

			if(claimsProps.isPropertyPresent(ACAP_LAST))
				propsCollection.putValue(ACAP_LAST,claimsProps.get(ACAP_LAST).getStringValue());

			if(claimsProps.isPropertyPresent(ACAP_OFFENSETYPE))
				propsCollection.putValue(ACAP_OFFENSETYPE ,claimsProps.get(ACAP_OFFENSETYPE).getStringValue());

			if(claimsProps.isPropertyPresent(ACAP_DEFENDANTID))
				propsCollection.putValue(ACAP_DEFENDANTID,claimsProps.get(ACAP_CLAIMANTLOGIN).getStringValue());

			if(claimsProps.isPropertyPresent(ACAP_DATEOFDISPOSITION))
				propsCollection.putValue(ACAP_DATEOFDISPOSITION,claimsProps.get(ACAP_DATEOFDISPOSITION).getDateTimeValue());

			if(claimsProps.isPropertyPresent(ACAP_CLAIMAMT))
				propsCollection.putValue(ACAP_CLAIMAMT,judgeApprovedTotalCost);

			if(claimsProps.isPropertyPresent(ACAP_EXPENSEAMT))
				propsCollection.putValue(ACAP_EXPENSEAMT,reimbursementTotal);
		}

		return propsCollection;
	}

	/**
	 * Creates the PDF.
	 *
	 * @param xmlData the xml data
	 * @param claimType the claim type
	 * @return the byte array output stream
	 * @throws FOPException the FOP exception
	 * @throws TransformerException the transformer exception
	 * @throws AcapDataAccessException the acap data access exception
	 */
	private ByteArrayOutputStream createPDF(String xmlData,String claimType) throws FOPException, TransformerException, AcapDataAccessException {
		if (logger.isInfoEnabled()) {
			logger.info("FNOperationsl#createPDF#start");
		}
		xsltFile = null;
		optStream = new ByteArrayOutputStream();
		StringReader reader = new StringReader(xmlData);
		// Get xslt file from resources folder according to it's claim type
		ClassLoader currentCL = getClass().getClassLoader();
		this.sclaimType=claimType;
		switch(claimType){
		case ATTORNEY_FEE_CLAIM_CAPITAL:  xsltFile = new File(currentCL.getResource(ATTORNEY_FEE_CLAIM_CAPITAL_XSL).getFile());
		break;
		case INTERPRETER_CLAIM: xsltFile = new File(currentCL.getResource(INTERPRETER_CLAIM_XSL).getFile());
		break;
		case JUDICIAL_HOSPITALIZATION_CLAIM: xsltFile = new File(currentCL.getResource(JUDICIAL_HOSPITALIZATION_CLAIM_XSL).getFile());
		break;
		case ATTORNEY_FEE_CLAIM_NON_CAPITAL: xsltFile = new File(currentCL.getResource(ATTORNEY_FEE_CLAIM_NON_CAPITAL_XSL).getFile());
		break;
		case DEPENDENCY_AND_NEGLECT_CLAIM: xsltFile = new File(currentCL.getResource(DEPENDENCY_AND_NEGLECT_CLAIM_XSL).getFile());
		break;
		case PAROLE_REVOCATION_CLAIM: xsltFile = new File(currentCL.getResource(PAROLE_REVOCATION_CLAIM_XSL).getFile());
		break;
		case JH_CLERK: xsltFile = new File(currentCL.getResource(JH_CLERK_XSL).getFile());
		break;
		case EXPERT_OR_WITNESS_CLAIM: xsltFile = new File(currentCL.getResource(EXPERT_OR_WITNESS_CLAIM_XSL).getFile());
		break;
		case CHILD_SUPPORT_FLAT_FEE_CLAIM: xsltFile = new File(currentCL.getResource(CHILD_SUPPORT_CLAIM_XSL).getFile());
		break;
		case INTERPRETER_TIME_LOG_CLAIM: xsltFile = new File(currentCL.getResource(INTERPRETER_TIME_LOG_CLAIM_XSL).getFile());
		break;
		case JH_DOCKET_BILLING_CLAIM: xsltFile = new File(currentCL.getResource(JH_DOCKET_BILLING_CLAIM_XSL).getFile());
		break;
		case JUDICIAL_CLERK_FEES: xsltFile = new File(currentCL.getResource(JUDICIAL_CLERK_FEES_XSL).getFile());
		break;
		case GAL_IN_ADOPTION: xsltFile = new File(currentCL.getResource(GAL_IN_ADOPTION_XSL).getFile());
		break;
		}

		// the XML file which provides the input
		StreamSource xmlSource = new StreamSource(reader);
		// create an instance of fop factory
		FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
		// a user agent is needed for transformation
		FOUserAgent foUserAgent = fopFactory.newFOUserAgent();

		// Construct fop with desired output format
		Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, optStream);

		// Setup XSLT
		TransformerFactory factory = TransformerFactory.newInstance();

		if(xsltFile!=null){
			StreamSource s=new StreamSource(xsltFile);
			Transformer transformer = factory.newTransformer(s);
			// transformer.setParameter("co-counsel", "X");
			Result res = new SAXResult(fop.getDefaultHandler());

			// Start XSLT transformation and FOP processing
			// That's where the XML is first transformed to XSL-FO and then
			// PDF is created
			transformer.transform(xmlSource, res);
		}else{
			throw new AcapDataAccessException("Invalid Claim Type Recieved.");
		}

		if (logger.isInfoEnabled()) {
			logger.info("FNOperationsl#createPDF#end");
		}
		return optStream;
	}

	/**
	 * Gets the folder docs.
	 *
	 * @param folder the folder
	 * @return the folder docs
	 */
	private void getFolderDocs(Folder folder,List<InputStream> caseDocs) {
		DocumentSet documents =  folder.get_ContainedDocuments();
		Iterator it = documents.iterator();
		while(it.hasNext())
		{
			//Retrieving documents
			com.filenet.api.core.Document  retrieveDoc= ( com.filenet.api.core.Document)it.next();
			logger.info("class name document :: "+retrieveDoc.get_ClassDescription().get_SymbolicName());
			logger.info("claimType::"+this.sclaimType);
			if(retrieveDoc.get_MimeType().equalsIgnoreCase(APPLICATION_PDF)){
				/*if(!EXPERT_OR_WITNESS_CLAIM.equalsIgnoreCase(this.sclaimType)){
					caseDocs.add((InputStream)retrieveDoc.accessContentStream(0)); 
				}else{*/
							
				//if(!ACAP_PREAPPROVALORDERS.equalsIgnoreCase(retrieveDoc.get_ClassDescription().get_SymbolicName())){
				// Added New By Khaled to Excluse all PreApproval & Orders Documents from PDF
				//	if(!ACAP_PREAPPROVALORDERS.equalsIgnoreCase(retrieveDoc.get_ClassDescription().get_SymbolicName()) || !ACAP_Orders.equalsIgnoreCase(retrieveDoc.get_ClassDescription().get_SymbolicName())){	
				if (ACAP_Receipts.equalsIgnoreCase(retrieveDoc.get_ClassDescription().get_SymbolicName())){
				caseDocs.add((InputStream)retrieveDoc.accessContentStream(0)); 
				}
				//}

			}
			logger.debug("Document Name :: "+ retrieveDoc.get_Name());
		}
	}

	/**
	 * Gets the folder elements.
	 *
	 * @param folderId the folder id
	 * @param os the os
	 * @return the folder elements
	 */
	private void getFolderElements(String folderId, ObjectStore os,List<InputStream> caseDocs) {
		Folder folder =Factory.Folder.fetchInstance(os,new Id(folderId),null);
		/*getFolderDocs(folder);*/ //will uncomment if needed
		FolderSet folders=folder.get_SubFolders();
		retrieveSubFolders(folders,caseDocs);
	}

	/**
	 * Retrieve sub folders.
	 *
	 * @param folders the folders
	 */
	private void retrieveSubFolders(FolderSet folders,List<InputStream> caseDocs) {
		if(!folders.isEmpty()){
			Iterator it = folders.iterator();
			while(it.hasNext())
			{
				Folder subFolder=(Folder)it.next();
				getFolderDocs(subFolder, caseDocs);
				FolderSet subFolders=subFolder.get_SubFolders();
				logger.debug("FOlder Name :: "+ subFolder.get_Name());
				retrieveSubFolders(subFolders,caseDocs);
			}
		}
	}

	/**
	 * Clears the active session.
	 *
	 * @throws Exception the exception
	 */
	public void endSession(List<InputStream> caseDocs) throws Exception {
		connection = null;
		domain = null;
		objectStore = null;
		if(null!=caseDocs){
			Iterator it=caseDocs.iterator();
			while(it.hasNext())
			{
				InputStream stream=(InputStream) it.next();

				stream.close();
			}
		}
		if(optStream!=null)
			optStream.close();
		caseDocs=null;

		logger.debug("Successfully Nullified conn,domain and ObjectStore Instances...");

	}

	public ByteArrayOutputStream toByteArray(InputStream in) throws IOException {

		ByteArrayOutputStream os = new ByteArrayOutputStream();

		byte[] buffer = new byte[1024];
		int len;

		// read bytes from the input stream and store them in buffer
		while ((len = in.read(buffer)) != -1) {
			// write bytes from the buffer into output stream
			os.write(buffer, 0, len);
		}

		return os;
	}
	

}
