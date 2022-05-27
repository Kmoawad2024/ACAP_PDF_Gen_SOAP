package gov.tn.acap.service.security;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import gov.tn.acap.constants.AcapFNOperationsConstants;


public class AcapSecurityService implements UserDetailsService, AcapFNOperationsConstants {

	private AcapUserDetails acapUserDetails;

	/* (non-Javadoc)
	 * @see org.springframework.security.core.userdetails.UserDetailsService#loadUserByUsername(java.lang.String)
	 */
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {	
		
		if(username == null || username.trim().length() ==0){
			throw new UsernameNotFoundException(MSG_USER_BLANK);
		}else if(!username.trim().equalsIgnoreCase(this.getAcapUserDetails().getLdapSystemUser())){			
			throw new UsernameNotFoundException(MSG_USER_INVALID);
		}
		return this.getAcapUserDetails();
	}

	
	/**
	 * @return acapUserDetails
	 */
	public AcapUserDetails getAcapUserDetails() {
		return acapUserDetails;
	}
	
	/**
	 * @param acapUserDetails
	 */
	public void setAcapUserDetails(AcapUserDetails acapUserDetails) {
		this.acapUserDetails = acapUserDetails;
	}
}
