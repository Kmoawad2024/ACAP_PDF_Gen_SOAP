/**
 * 
 */
package gov.tn.acap.dao.impl;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * @author ABalhara
 *
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class AcapOffenseClass {
	
	@JsonProperty
	private String TCA_Master_ID;
	@JsonProperty
	private String TCA_Code;
	@JsonProperty
	private String Offense_Type;
	@JsonProperty
	private String Offense_Class;
	@JsonProperty
	private String Description;
	@JsonProperty
	private String Start_Date;
	@JsonProperty
	private String End_date;
	@JsonProperty
	private String Repository_Status;

	/**
	 * @return the tCA_Master_ID
	 */
	public String getTCA_Master_ID() {
		return TCA_Master_ID;
	}

	/**
	 * @param tCA_Master_ID the tCA_Master_ID to set
	 */
	public void setTCA_Master_ID(String tCA_Master_ID) {
		TCA_Master_ID = tCA_Master_ID;
	}

	/**
	 * @return the tCA_Code
	 */
	public String getTCA_Code() {
		return TCA_Code;
	}

	/**
	 * @param tCA_Code the tCA_Code to set
	 */
	public void setTCA_Code(String tCA_Code) {
		TCA_Code = tCA_Code;
	}

	/**
	 * @return the offense_Type
	 */
	public String getOffense_Type() {
		return Offense_Type;
	}

	/**
	 * @param offense_Type the offense_Type to set
	 */
	public void setOffense_Type(String offense_Type) {
		Offense_Type = offense_Type;
	}

	/**
	 * @return the offense_Class
	 */
	public String getOffense_Class() {
		return Offense_Class;
	}

	/**
	 * @param offense_Class the offense_Class to set
	 */
	public void setOffense_Class(String offense_Class) {
		Offense_Class = offense_Class;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return Description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		Description = description;
	}

	/**
	 * @return the start_Date
	 */
	public String getStart_Date() {
		return Start_Date;
	}

	/**
	 * @param start_Date the start_Date to set
	 */
	public void setStart_Date(String start_Date) {
		Start_Date = start_Date;
	}

	/**
	 * @return the end_date
	 */
	public String getEnd_date() {
		return End_date;
	}

	/**
	 * @param end_date the end_date to set
	 */
	public void setEnd_date(String end_date) {
		End_date = end_date;
	}

	/**
	 * @return the repository_Status
	 */
	public String getRepository_Status() {
		return Repository_Status;
	}

	/**
	 * @param repository_Status the repository_Status to set
	 */
	public void setRepository_Status(String repository_Status) {
		Repository_Status = repository_Status;
	}
}
