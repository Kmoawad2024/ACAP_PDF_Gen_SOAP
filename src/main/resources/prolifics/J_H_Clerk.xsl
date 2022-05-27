<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java" 
    exclude-result-prefixes="java">
	<xsl:template match="attorneyfeeclaim">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="simpleA4"
					page-height="29.7cm" page-width="21cm" margin-top="2cm"
					margin-bottom="2cm" margin-left="2cm" margin-right="2cm">
					<fo:region-body />
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="simpleA4">
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						
						<fo:block  font-family="Arial" font-size="20pt">J-H Clerk</fo:block>
						<fo:table table-layout="fixed" width="100%">
							<fo:table-column column-width="50%"/>
							<fo:table-column column-width="50%"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell border="solid .1mm black" 
										text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
										display-align="after">
										<fo:block  font-family="Arial"
											font-size="8pt">Claim ID</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"   
										 padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block  font-family="Arial"
											font-size="8pt">
											<xsl:value-of select="ACAP_ClaimNumber" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>
						
								<fo:table-row>
									<fo:table-cell border="solid .1mm black" 
										text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
										display-align="after">
										<fo:block  font-family="Arial"
											font-size="8pt">Edison #</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"  
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="after">
										<fo:block  font-family="Arial"
											font-size="8pt">
											<xsl:value-of select="ACAP_EdisonID" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>
						
								<fo:table-row>
									<fo:table-cell border="solid .1mm black" 
										text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
										display-align="after">
										<fo:block  font-family="Arial"
											font-size="8pt">Date Received</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"   
										 padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block  font-family="Arial"
											font-size="8pt">
											<xsl:value-of select="ACAP_ClaimDate" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black" 
										text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
										display-align="after">
										<fo:block  font-family="Arial"
											font-size="8pt">Clerk Name</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"  
										 padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block  font-family="Arial"
											font-size="8pt">
											<xsl:value-of select="concat(ACAP_First,'&#10;', ACAP_Middle,'&#10;',ACAP_Last,attribution)" /> 
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black" 
										text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
										display-align="after">
										<fo:block  font-family="Arial"
											font-size="8pt">Court</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"  
										 padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block  font-family="Arial"
											font-size="8pt">
											<xsl:value-of select="ACAP_Court" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black" 
										text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
										display-align="after">
										<fo:block  font-family="Arial"
											font-size="8pt">County</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"  
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="after">
										<fo:block  font-family="Arial"
											font-size="8pt">
											<xsl:value-of select="ACAP_CourtCounty" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
									<fo:table-cell border="solid .1mm black" 
										text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
										display-align="after">
										<fo:block  font-family="Arial"
											font-size="8pt">First Case/Docket Number</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"  
										 padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block  font-family="Arial"
											font-size="8pt">
											<xsl:value-of select="FirstDocketNo" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>
									
								<fo:table-row>
									<fo:table-cell border="solid .1mm black" 
										text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
										display-align="after">
										<fo:block  font-family="Arial"
											font-size="8pt">Last Case/Docket Number</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"  
										 padding-before="2pt" padding-after="2pt" margin-left="80pt"
										display-align="after">
										<fo:block  font-family="Arial"
											font-size="8pt">
											<xsl:value-of select="LastDocketNo" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>
								
								<!-- Added for defect 338 -->

								<fo:table-row>
									<fo:table-cell padding-left="3pt" border="solid .1mm black" 
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block  font-family="Arial"
											font-size="8pt">Hours Adjustment Amount</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"  
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block  font-family="Arial"
											font-size="8pt">
											<xsl:value-of select="//attorneyfeeclaim//itemizedExpense//HoursAdjustment" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>


								<fo:table-row>
									<fo:table-cell padding-left="3pt" border="solid .1mm black" 
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block  font-family="Arial"
											font-size="8pt">Total Amount</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"  
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block  font-family="Arial"
											font-size="8pt">
											<xsl:value-of select="//attorneyfeeclaim//itemizedExpense//AuditApprovedTotalCost" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>
								
								<fo:table-row>
									<fo:table-cell padding-left="3pt" border="solid .1mm black" 
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block  font-family="Arial"
											font-size="8pt">AOC Payment Amount</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"  
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block  font-family="Arial"
											font-size="8pt">
											<xsl:if test="//attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//Paid">
												<xsl:value-of select='format-number(sum(//attorneyfeeclaim//itemizedExpense//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//HoursAdjustment),"##.00" )' />
											</xsl:if>
										</fo:block>
									</fo:table-cell>

								</fo:table-row>
								
								<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">Auditor Signature </fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black" 
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:if test="ACAP_AuditorLogin !='' and (//attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//Paid or //attorneyfeeclaim//ACAP_ProcessEscalationReason ='Escalate to Batch')">
														<!-- approved electronically by &#160; --><xsl:value-of select="ACAP_AuditorLogin" />
													</xsl:if>

												</fo:block>
											</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>