package gov.tn.acap.service;

import gov.tn.acap.exception.AcapPDFGenException;
import gov.tn.acap.ws.AcapGetDataPDFGenRequest;
import gov.tn.acap.ws.AcapGetDataPDFGenResponse;
import gov.tn.acap.ws.AcapIntransitPDFGenRequest;
import gov.tn.acap.ws.AcapIntransitPDFGenResponse;
import gov.tn.acap.ws.AcapPDFGenPrintRequest;
import gov.tn.acap.ws.AcapPDFGenPrintResponse;
import gov.tn.acap.ws.AcapPDFGenRequest;
import gov.tn.acap.ws.AcapPDFGenResponse;

public interface AcapPDFGenerator {

	/**
	 * @param requestdata
	 * @return AcapPDFGenResponse
	 * @throws AcapPDFGenException
	 */
	public AcapPDFGenResponse generatePDFRequest(AcapPDFGenRequest requestdata) throws AcapPDFGenException;
	
	/**
	 * @param requestdata
	 * @return AcapPDFGenResponse
	 * @throws AcapPDFGenException
	 */
	public AcapPDFGenPrintResponse generatePrintPDFRequest(AcapPDFGenPrintRequest requestdata) throws AcapPDFGenException;
	
	
	/**
	 * @param requestdata
	 * @return AcapGetDataPDFGenResponse
	 * @throws AcapPDFGenException
	 */
	public AcapGetDataPDFGenResponse generateGetDataPDFRequest(AcapGetDataPDFGenRequest requestdata) throws AcapPDFGenException;
	
	/**
	 * @param requestdata
	 * @return AcapIntransitPDFGenResponse
	 * @throws AcapPDFGenException
	 */
	public AcapIntransitPDFGenResponse generateIntransitPDFRequest(AcapIntransitPDFGenRequest requestdata) throws AcapPDFGenException;
}
