package gov.tn.acap.service.endpoints;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ws.context.MessageContext;
import org.springframework.ws.server.endpoint.annotation.Endpoint;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;
import org.springframework.ws.server.endpoint.annotation.RequestPayload;
import org.springframework.ws.server.endpoint.annotation.ResponsePayload;

import gov.tn.acap.exception.AcapPDFGenException;
import gov.tn.acap.service.AcapPDFGenerator;
import gov.tn.acap.ws.AcapGetDataPDFGenRequest;
import gov.tn.acap.ws.AcapGetDataPDFGenResponse;
import gov.tn.acap.ws.AcapIntransitPDFGenRequest;
import gov.tn.acap.ws.AcapIntransitPDFGenResponse;
import gov.tn.acap.ws.AcapPDFGenPrintRequest;
import gov.tn.acap.ws.AcapPDFGenPrintResponse;
import gov.tn.acap.ws.AcapPDFGenRequest;
import gov.tn.acap.ws.AcapPDFGenResponse;

@Endpoint
public class AcapPDFGenEndpoint {
	private static final String TARGET_NAMESPACE = "http://www.gov/tn/acap/ws";
	
	@Autowired
	protected AcapPDFGenerator acapPDFGenerator;
			
	@PayloadRoot(localPart = "AcapPDFGenRequest", namespace = TARGET_NAMESPACE)
	public @ResponsePayload AcapPDFGenResponse commitFormRequest(@RequestPayload AcapPDFGenRequest request) throws AcapPDFGenException
	{
		AcapPDFGenResponse response = acapPDFGenerator.generatePDFRequest(request);		
		return response;
	}
	
	@PayloadRoot(localPart = "AcapPDFGenPrintRequest", namespace = TARGET_NAMESPACE)
	public @ResponsePayload AcapPDFGenPrintResponse commitPrintClaimRequest(@RequestPayload AcapPDFGenPrintRequest request) throws AcapPDFGenException
	{
		AcapPDFGenPrintResponse response = acapPDFGenerator.generatePrintPDFRequest(request);		
		return response;
	}

	
	@PayloadRoot(localPart = "AcapIntransitPDFGenRequest", namespace = TARGET_NAMESPACE)
	public @ResponsePayload AcapIntransitPDFGenResponse generateIntransitPDFRequest(@RequestPayload AcapIntransitPDFGenRequest request) throws AcapPDFGenException
	{
		AcapIntransitPDFGenResponse response = acapPDFGenerator.generateIntransitPDFRequest(request);
		return response;
	}
	
	@PayloadRoot(localPart = "AcapGetDataPDFGenRequest", namespace = TARGET_NAMESPACE)
	public @ResponsePayload AcapGetDataPDFGenResponse generatePDFDataRequest(@RequestPayload AcapGetDataPDFGenRequest request, MessageContext context) throws AcapPDFGenException
	{	
		
		AcapGetDataPDFGenResponse response = acapPDFGenerator.generateGetDataPDFRequest(request);
		return response;
	}
    
	public void setAcapPDFGenerator(AcapPDFGenerator acapPDFGenerator)
	{
		this.acapPDFGenerator = acapPDFGenerator;
	}
}
