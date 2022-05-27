package gov.tn.acap.service.security;

import java.util.Collection;

import org.apache.commons.codec.binary.Base64;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


public class AcapUserDetails  implements UserDetails{

	private static final long serialVersionUID = 1L;
//	@Value("${ldapSystemUser}")
	private String ldapSystemUser;
//	@Value("${ldapSystemPwd}")
	private String ldapSystemPwd;
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return null;
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.core.userdetails.UserDetails#getPassword()
	 */
	@Override
	public String getPassword() {
		return getLdapSystemPwd();
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.core.userdetails.UserDetails#getUsername()
	 */
	@Override
	public String getUsername() {
		return getLdapSystemUser();
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.core.userdetails.UserDetails#isAccountNonExpired()
	 */
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.core.userdetails.UserDetails#isAccountNonLocked()
	 */
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.core.userdetails.UserDetails#isCredentialsNonExpired()
	 */
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.core.userdetails.UserDetails#isEnabled()
	 */
	@Override
	public boolean isEnabled() {
		return true;
	}
	/**
	 * @return ldapSystemUser
	 */
	public String getLdapSystemUser() {
		return ldapSystemUser;
	}

	/**
	 * @param ldapSystemUser
	 */
	public void setLdapSystemUser(String ldapSystemUser) {
		this.ldapSystemUser = ldapSystemUser;
	}

	/**
	 * @return ldapSystemPwd
	 */
	public String getLdapSystemPwd() {
		return ldapSystemPwd;
	}

	/**
	 * @param ldapSystemPwd
	 */
	public void setLdapSystemPwd(String ldapSystemPwd) {
		Base64 encoder = new Base64();		
		this.ldapSystemPwd = new String(encoder.decode(ldapSystemPwd.getBytes()));
	}
}
