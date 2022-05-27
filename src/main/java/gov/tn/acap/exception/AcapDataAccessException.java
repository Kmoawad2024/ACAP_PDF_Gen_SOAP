package gov.tn.acap.exception;

public class AcapDataAccessException extends Exception{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * Default constructor
	 */
	public AcapDataAccessException(){
		super();
	}
	
	/**
	 * Constructor with root exception
	 * @param ex : root exception
	 */
	public AcapDataAccessException(Exception ex){
		super(ex);
	}
	/**
	 * Constructor with root exception message.
	 * @param message : root exception message
	 */
	public AcapDataAccessException(String message){
		super(message);
	}
}
