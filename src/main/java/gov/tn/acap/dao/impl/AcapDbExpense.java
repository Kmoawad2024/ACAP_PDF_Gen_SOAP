package gov.tn.acap.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AcapDbExpense {
	private Date serviceDate;
	private List<LineItemDetails> clLineDetails = new ArrayList<LineItemDetails>();
	private String parentTagName ;
	
	public String getParentTagName() {
		return parentTagName;
	}

	public void setParentTagName(String parentTagName) {
		this.parentTagName = parentTagName;
	}

	public Date getServiceDate() {
		return serviceDate;
	}

	public void setServiceDate(Date serviceDate) {
		this.serviceDate = serviceDate;
	}

	public List<LineItemDetails> getClLineDetails() {
		return clLineDetails;
	}


	public void addlineItemDetails(String colName, String colValue){
		LineItemDetails lnItem = new LineItemDetails();
		lnItem.setColName(colName);
		lnItem.setColValue(colValue);
		this.clLineDetails.add(lnItem);
	}

	public void updateXML(){
		
	}
	
	//Just want to avoid using map
	public class LineItemDetails {
		private String colName;
		public String getColName() {
			return colName;
		}
		public void setColName(String colName) {
			this.colName = colName;
		}
		public String getColValue() {
			return colValue;
		}
		public void setColValue(String colValue) {
			this.colValue = colValue;
		}
		private String colValue;
	}
}
