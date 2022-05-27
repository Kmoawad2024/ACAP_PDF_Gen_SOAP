package gov.tn.acap.dao;

import com.filenet.api.core.ObjectStore;
import com.filenet.api.property.Properties;

import gov.tn.acap.exception.AcapDataAccessException;

public interface AcapFileNetDAO {
	public String getFileNetData(String claimNumber,String claimStatus,String folderId,String claimType,ObjectStore os)throws AcapDataAccessException;
	
	public Properties getClaimDocProperties();

}
