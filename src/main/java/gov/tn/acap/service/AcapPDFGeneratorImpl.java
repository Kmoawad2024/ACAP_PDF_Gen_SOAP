package gov.tn.acap.service;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gov.tn.acap.exception.AcapPDFGenException;
import gov.tn.acap.filenet.AcapFNOperations;
import gov.tn.acap.ws.AcapGetDataPDFGenRequest;
import gov.tn.acap.ws.AcapGetDataPDFGenResponse;
import gov.tn.acap.ws.AcapIntransitPDFGenRequest;
import gov.tn.acap.ws.AcapIntransitPDFGenResponse;
import gov.tn.acap.ws.AcapPDFGenPrintRequest;
import gov.tn.acap.ws.AcapPDFGenPrintResponse;
import gov.tn.acap.ws.AcapPDFGenRequest;
import gov.tn.acap.ws.AcapPDFGenResponse;

@Service
public class AcapPDFGeneratorImpl implements AcapPDFGenerator {

	String docID = "";
	byte[] pdfBytes;
	private static Logger logger = LoggerFactory.getLogger(AcapPDFGeneratorImpl.class);
	@Autowired
	private AcapFNOperations fNOperation;

	/**
	 * @return fNOperation
	 */
	public AcapFNOperations getFNOperation() {
		return fNOperation;
	}

	/**
	 * @param fNOperation
	 */
	public void setFNOperation(AcapFNOperations fNOperation) {
		this.fNOperation = fNOperation;
	}

	public static void main(String[] dd) {

	}

	/* (non-Javadoc)
	 * @see gov.tn.acap.service.AcapPDFGenerator#generatePDFRequest(gov.tn.acap.ws.AcapPDFGenRequest)
	 */
	public AcapPDFGenResponse generatePDFRequest(AcapPDFGenRequest requestdata) throws AcapPDFGenException {
		if (logger.isInfoEnabled()) {
			logger.info("AcapPDFGeneratorImpl#generatePDFRequest#start");
		}
		AcapPDFGenResponse pdfMetaData = null;
		Date startTime = new Date();
		System.out.println("Start time: " + startTime.toString());
		try {
			
			if (requestdata.getClaimNumber().length() > 0 && requestdata.getCaseStatus().length() > 0
					&& requestdata.getFolderID().length() > 0 && requestdata.getClaimType().length() > 0) {
				//Call to upload Form only if we get each above mentioned value from webservice.
				docID = fNOperation.uploadForm(requestdata.getClaimNumber().trim(), requestdata.getCaseStatus().trim(),
						requestdata.getFolderID().trim(), requestdata.getClaimType().trim(),true,true);
			}
			pdfMetaData = new AcapPDFGenResponse();
			pdfMetaData.setDocID(docID);
		} catch (Exception ex) {
			// logging TBD ...
			if (logger.isErrorEnabled()) {
				logger.error("AcapPDFGeneratorImpl#generatePDFRequest#exception" + ex.getMessage(),ex);
			}

			throw new AcapPDFGenException(ex);
		}
		
		if (logger.isInfoEnabled()) {
			logger.info("AcapPDFGeneratorImpl#generatePDFRequest#end");
		}
		Date endTime = new Date();
		System.out.println("Process Completed: " + endTime);
		long timeTakenInSec = endTime.getTime() - startTime.getTime();
		System.out.println("Time taken: " + (timeTakenInSec / 1000) + " secs " + (timeTakenInSec % 1000) + " ms");

		return pdfMetaData;
	}


	/**
	 * 
	 */
	public AcapPDFGenPrintResponse generatePrintPDFRequest(AcapPDFGenPrintRequest requestdata) throws AcapPDFGenException {
		if (logger.isInfoEnabled()) {
			logger.info("AcapPDFGeneratorImpl#generatePrintPDFRequest#start");
		}
		AcapPDFGenPrintResponse pdfMetaData = null;
		Date startTime = new Date();
		System.out.println("Start time: " + startTime.toString());
		try {
			
			if (requestdata.getClaimNumber().length() > 0 && requestdata.getCaseStatus().length() > 0
					&& requestdata.getFolderID().length() > 0 && requestdata.getClaimType().length() > 0) {
				//Call to upload Form only if we get each above mentioned value from webservice.
				docID = fNOperation.updloadPrintClaim(requestdata.getClaimNumber().trim(), requestdata.getCaseStatus().trim(),
						requestdata.getFolderID().trim(), requestdata.getClaimType().trim(),true,true);
			}
			pdfMetaData = new AcapPDFGenPrintResponse();
			pdfMetaData.setDocID(docID);
		} catch (Exception ex) {
			// logging TBD ...
			if (logger.isErrorEnabled()) {
				logger.error("AcapPDFGeneratorImpl#generatePrintPDFRequest#exception" + ex.getMessage(),ex);
			}

			throw new AcapPDFGenException(ex);
		}
		
		if (logger.isInfoEnabled()) {
			logger.info("AcapPDFGeneratorImpl#generatePDFRequest#end");
		}
		Date endTime = new Date();
		System.out.println("Process Completed: " + endTime);
		long timeTakenInSec = endTime.getTime() - startTime.getTime();
		System.out.println("Time taken: " + (timeTakenInSec / 1000) + " secs " + (timeTakenInSec % 1000) + " ms");

		return pdfMetaData;
	}

	@Override
	public AcapGetDataPDFGenResponse generateGetDataPDFRequest(AcapGetDataPDFGenRequest requestdata) throws AcapPDFGenException {
		if (logger.isInfoEnabled()) {
			logger.info("AcapPDFGeneratorImpl#generateGetDataPDFRequest#start");
		}
		AcapGetDataPDFGenResponse pdfMetaData = null;
		Date startTime = new Date();
		System.out.println("Start time: " + startTime.toString());
		try {
			
			if (requestdata.getClaimNumber().length() > 0 && requestdata.getCaseStatus().length() > 0
					&& requestdata.getFolderID().length() > 0 && requestdata.getClaimType().length() > 0) {
				//Call to upload Form only if we get each above mentioned value from webservice.
				pdfBytes = fNOperation.getPDFBytes(requestdata.getClaimNumber().trim(), requestdata.getCaseStatus().trim(),
						requestdata.getFolderID().trim(), requestdata.getClaimType().trim());
			}
			pdfMetaData = new AcapGetDataPDFGenResponse();
			pdfMetaData.setPdfBytes(pdfBytes);
		} catch (Exception ex) {
			// logging TBD ...
			if (logger.isErrorEnabled()) {
				logger.error("AcapPDFGeneratorImpl#generateGetDataPDFRequest#exception" + ex.getMessage(),ex);
			}

			throw new AcapPDFGenException(ex);
		}
		
		if (logger.isInfoEnabled()) {
			logger.info("AcapPDFGeneratorImpl#generateGetDataPDFRequest#end");
		}
		Date endTime = new Date();
		System.out.println("Process Completed: " + endTime);
		long timeTakenInSec = endTime.getTime() - startTime.getTime();
		System.out.println("Time taken: " + (timeTakenInSec / 1000) + " secs " + (timeTakenInSec % 1000) + " ms");

		return pdfMetaData;
	}

	@Override
	public AcapIntransitPDFGenResponse generateIntransitPDFRequest(AcapIntransitPDFGenRequest requestdata) throws AcapPDFGenException {
		if (logger.isInfoEnabled()) {
			logger.info("AcapPDFGeneratorImpl#generatePDFRequest#start");
		}
		AcapIntransitPDFGenResponse pdfMetaData = null;
		Date startTime = new Date();
		System.out.println("Start time: " + startTime.toString());
		try {
			
			if (requestdata.getClaimNumber().length() > 0 && requestdata.getCaseStatus().length() > 0
					&& requestdata.getFolderID().length() > 0 && requestdata.getClaimType().length() > 0) {
				//Call to upload Form only if we get each above mentioned value from webservice.
				docID = fNOperation.uploadForm(requestdata.getClaimNumber().trim(), requestdata.getCaseStatus().trim(),
						requestdata.getFolderID().trim(), requestdata.getClaimType().trim(),false,true);
			}
			pdfMetaData = new AcapIntransitPDFGenResponse();
			pdfMetaData.setDocID(docID);
		} catch (Exception ex) {
			// logging TBD ...
			if (logger.isErrorEnabled()) {
				logger.error("AcapPDFGeneratorImpl#generatePDFRequest#exception" + ex.getMessage(),ex);
			}

			throw new AcapPDFGenException(ex);
		}
		
		if (logger.isInfoEnabled()) {
			logger.info("AcapPDFGeneratorImpl#generatePDFRequest#end");
		}
		Date endTime = new Date();
		System.out.println("Process Completed: " + endTime);
		long timeTakenInSec = endTime.getTime() - startTime.getTime();
		System.out.println("Time taken: " + (timeTakenInSec / 1000) + " secs " + (timeTakenInSec % 1000) + " ms");

		return pdfMetaData;
	}

}
