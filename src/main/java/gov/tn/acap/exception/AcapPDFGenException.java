package gov.tn.acap.exception;

public class AcapPDFGenException extends Exception{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * Default constructor
	 */
	public AcapPDFGenException(){
		super();
	}
	
	/**
	 * Constructor with root exception
	 * @param ex : root exception
	 */
	public AcapPDFGenException(Exception ex){
		super(ex);
	}
	/**
	 * Constructor with root exception message.
	 * @param message : root exception message
	 */
	public AcapPDFGenException(String message){
		super(message);
	}
}
