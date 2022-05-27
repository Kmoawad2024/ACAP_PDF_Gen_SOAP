package gov.tn.acap.dao;

import org.dom4j.Element;

import gov.tn.acap.exception.AcapDataAccessException;

public interface AcapDbDAO {
	public String getDbData(Element root, String isWaitingForApproval,String claimNumber,float noOfClients,String folderId,String claimType,String claimentLogin,String caseTypeId,float unpaidExpanses)throws AcapDataAccessException;
}
