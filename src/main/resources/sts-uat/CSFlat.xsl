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
					<!-- Start here for line item 1st block-->
					<fo:block>
		
						<fo:block font-family="Arial" font-size="20pt">
							<fo:table table-layout="fixed" width="100%">
								<fo:table-column column-width="50%" />
								<fo:table-column column-width="50%" />
								<fo:table-body>
									<fo:table-row>
										<fo:table-cell padding-left="3pt" text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
											<fo:block font-family="Arial" font-size="20pt">Flat Rate Billing
											</fo:block>
										</fo:table-cell>
										<xsl:choose>
											<xsl:when test="ACAP_ClaimDate">
												<fo:table-cell padding-left="3pt" border="solid .2mm black" text-align="left" padding-before="2pt" padding-after="2pt"
													display-align="before">
													<fo:block font-family="Arial" font-size="12pt">Submission Date:
														<xsl:value-of select="ACAP_ClaimDate" />
													</fo:block>
												</fo:table-cell>

											</xsl:when>
											<xsl:otherwise>

											</xsl:otherwise>
										</xsl:choose>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
						</fo:block>

						<fo:table table-layout="fixed" width="100%" border=".1mm solid black">
							<fo:table-column column-width="50%"/>
							<fo:table-column column-width="50%"/>
							<fo:table-body border="inherit">

										<fo:table-row border="inherit">
											<fo:table-cell border="inherit" 
												text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">Claim ID</fo:block>
											</fo:table-cell>

											<fo:table-cell border="inherit"   
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="ACAP_ClaimNumber" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
									
										<fo:table-row border="inherit">
											<fo:table-cell border="inherit" 
												text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">Date Received</fo:block>
											</fo:table-cell>

											<fo:table-cell border="inherit"   
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="DateCreated" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
										<fo:table-row>
											<fo:table-cell margin-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Attorney and Firm Name
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:if test="//attorneyfeeclaim//ACAP_First !=''">
														<xsl:value-of
															select="concat(ACAP_First,'&#10;', ACAP_Middle,'&#10;',ACAP_Last)" />
													</xsl:if>
													<xsl:if test="//attorneyfeeclaim//ACAP_FirmName != ''">
														of
														<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmName" />
													</xsl:if>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
										<fo:table-row border="inherit">
											<fo:table-cell border="inherit" 
												text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">BPR</fo:block>
											</fo:table-cell>

											<fo:table-cell border="inherit"   
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="ACAP_BPRNumber" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
										<fo:table-row border="inherit">
											<fo:table-cell border="inherit" 
												text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">Address</fo:block>
											</fo:table-cell>

											<fo:table-cell border="inherit"  
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="concat(ACAP_FirmStreet,'&#10;',ACAP_FirmAddress2)" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
										<fo:table-row border="inherit">
											<fo:table-cell border="inherit" 
												text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">City</fo:block>
											</fo:table-cell>

											<fo:table-cell border="inherit"  
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmCity" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
										<fo:table-row>
											<fo:table-cell margin-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">State
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmState" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>

										<fo:table-row border="inherit">
											<fo:table-cell border="inherit" 
												text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">Zip</fo:block>
											</fo:table-cell>

											<fo:table-cell border="inherit"  
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmZipcode" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>

										<fo:table-row border="inherit">
											<fo:table-cell border="inherit"
												text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">Email</fo:block>
											</fo:table-cell>

											<fo:table-cell border="inherit" 
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="ACAP_PrimaryEmailAddress" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>

										<fo:table-row border="inherit">
											<fo:table-cell border="inherit" 
												text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt" 
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">Phone</fo:block>
											</fo:table-cell>

											<fo:table-cell border="inherit"  
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_PhoneNumber" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>

								
										<fo:table-row border="inherit">
											<fo:table-cell border="inherit" 
												text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">County</fo:block>
											</fo:table-cell>

											<fo:table-cell border="inherit"  
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="ACAP_CourtCounty" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
								
										<fo:table-row border="inherit">
											<fo:table-cell border="solid .1mm black" 
												text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">Court</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="ACAP_Court" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
																			
										<fo:table-row border="inherit">
											<fo:table-cell border="solid .1mm black" 
												text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">Judge</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:if test = "//attorneyfeeclaim//ACAP_AssignedJudge !=''">
														<fo:inline>
														<xsl:value-of select="ACAP_AssignedJudge" /> 
												
														</fo:inline>
													</xsl:if>	


												</fo:block>
											</fo:table-cell>

										</fo:table-row> 
									
							</fo:table-body>
						</fo:table>
					</fo:block>
					<!-- End here for line item 1st block-->
					
					<!-- Start here for line item 2nd block-->
					<fo:block margin-top="5mm">
						<fo:table border=".1mm solid black">
							<!--<fo:table-column column-width="25%" />-->
							<fo:table-column column-width="50%" />
							<fo:table-column column-width="50%" />
							<!--<fo:table-column column-width="20%" />-->

							<fo:table-body border="inherit">
								<fo:table-row border="inherit">

								<!--<fo:table-cell border="inherit" 
									text-align="center" 
									display-align="center">
										<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">Judge

										</fo:block>
									</fo:table-cell>-->
									<fo:table-cell border="inherit" 
									text-align="center"
									display-align="center">
										<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">Client Name
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="inherit" 
									text-align="center"
									display-align="center">
										<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">Case/Docket Number(s)
										</fo:block>
									</fo:table-cell>
									<!--<fo:table-cell border="inherit" 
									text-align="center"
									display-align="center">
										<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">
										Amount
										</fo:block>
									</fo:table-cell>  -->



								</fo:table-row>
								<xsl:if test="//attorneyfeeclaim//Children!=''">
									<xsl:for-each select="//attorneyfeeclaim//Children//Child">
										<xsl:if test="Name!=''">
											<fo:table-row>
												<!--<fo:table-cell text-align="center" display-align="center" border="solid .1mm black">
													<fo:block  font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="Judge"/>
													</fo:block>
												</fo:table-cell>-->
												<fo:table-cell text-align="center" display-align="center" border="solid .1mm black">
													<fo:block  font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="Name"/>
													</fo:block>
												</fo:table-cell>
												<fo:table-cell text-align="center" display-align="center" border="solid .1mm black">
													<fo:block  font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="Case_Number"/>
													</fo:block>
												</fo:table-cell>
												<!--<fo:table-cell text-align="center" display-align="center" border="solid .1mm black">
													<fo:block  font-family="Arial"
												font-size="8pt">&#x00A0;<xsl:value-of select="format-number(//attorneyfeeclaim//itemizedExpense//CostForEachClient,'##.000')"/>
													</fo:block>
												</fo:table-cell>-->
											</fo:table-row>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<!-- Added for defect 338 CHANGES STARTS HERE  -->
								<!--<fo:table-row border="inherit">

									<fo:table-cell border="inherit" number-columns-spanned="3"
									text-align="right" 
									display-align="center">
										<fo:block  font-family="Arial" font-weight="bold"
										font-size="8pt">Hours Adjustment
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit" 
									text-align="center" 
									display-align="after">
										<fo:block  font-family="Arial"
										font-size="8pt">
											<xsl:value-of select="//attorneyfeeclaim//itemizedExpense//HoursAdjustment" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>

								
								<fo:table-row border="inherit">

									<fo:table-cell border="inherit" number-columns-spanned="3"
									text-align="right" 
									display-align="center">
										<fo:block  font-family="Arial" font-weight="bold"
										font-size="8pt">Reimbursement Total
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit" 
									text-align="center" 
									display-align="after">
										<fo:block  font-family="Arial"
										font-size="8pt">
											<xsl:value-of select='format-number(sum(//attorneyfeeclaim//itemizedExpense//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//HoursAdjustment),"##.000" )' />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>-->
							</fo:table-body>

						</fo:table>

					</fo:block>
					<!-- End here for line item 2nd block-->

					<!-- start here for 3rd block-->
					<fo:block margin-top="5mm">
						<fo:table>

							<fo:table-column column-width="17%" />
							<fo:table-column column-width="17%" />
							<fo:table-column column-width="16%" />
							<fo:table-column column-width="16%" />
							<fo:table-column column-width="17%" />
							<fo:table-column column-width="17%" />
							
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block font-weight="bold" font-family="Arial"
											font-size="8pt">Court Hours
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block font-weight="bold" font-family="Arial"
											font-size="8pt">Court Amount
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block font-weight="bold" font-family="Arial"
											font-size="8pt">Expenses
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block font-weight="bold" font-family="Arial"
											font-size="8pt">Hours Adjustment</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block font-weight="bold" font-family="Arial"
											font-size="8pt">Reimbursement Total</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block font-weight="bold" font-family="Arial"
											font-size="8pt">Judge Approved Amount</fo:block>
									</fo:table-cell>

								</fo:table-row>
								<fo:table-row>


									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>
												<xsl:choose>
													<xsl:when
														test="//attorneyfeeclaim//itemizedExpense//lineItem//CSS = 'CSS' or //attorneyfeeclaim//itemizedExpense//lineItem//CSSPAC = 'CSSPAC' or //attorneyfeeclaim//itemizedExpense//lineItem//CSSGT4 = 'CSSGT4'">
														<xsl:value-of
															select="format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedQuantity[@expenseType='CSS'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedQuantity[@expenseType='CSSPAC'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedQuantity[@expenseType='CSSGT4']),'##.00' )" />
													</xsl:when>
													<xsl:otherwise>
														<fo:inline />
													</xsl:otherwise>
												</xsl:choose>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>
												<xsl:choose>
													<xsl:when
														test="//attorneyfeeclaim//itemizedExpense//lineItem//CSS = 'CSS' or //attorneyfeeclaim//itemizedExpense//lineItem//CSSPAC = 'CSSPAC' or //attorneyfeeclaim//itemizedExpense//lineItem//CSSGT4 = 'CSSGT4'">
														<xsl:value-of
															select="format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='CSS'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='CSSPAC'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='CSSGT4']),'##.000' )" />
													</xsl:when>
													<xsl:otherwise>
														<fo:inline />
													</xsl:otherwise>
												</xsl:choose>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>
												<xsl:choose>
													<xsl:when
														test="//attorneyfeeclaim//itemizedExpense//lineItem//NecessaryExpenses= 'NecessaryExpenses'">
														<xsl:value-of
															select="format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='NecessaryExpenses']),'##.000' )" />
													</xsl:when>
													<xsl:otherwise>
														<fo:inline />
													</xsl:otherwise>
												</xsl:choose>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
									<!--  Added defect for 338-->
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>
												<xsl:if
													test="//attorneyfeeclaim//itemizedExpense//HoursAdjustment != '0.00' ">
													<!--<xsl:value-of
														select='format-number(sum(//attorneyfeeclaim//itemizedExpense//Incourt//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//OutCourt//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//NecessaryExpenses//AuditApprovedTotalCost),"##.000" )' />-->
													<xsl:value-of select="//attorneyfeeclaim//itemizedExpense//HoursAdjustment" />	
												</xsl:if>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>
												<xsl:if
													test="//attorneyfeeclaim//itemizedExpense//lineItem//CSS = 'CSS' or //attorneyfeeclaim//itemizedExpense//lineItem//CSSPAC = 'CSSPAC' or //attorneyfeeclaim//itemizedExpense//lineItem//CSSGT4 = 'CSSGT4'">
													<xsl:value-of
														select="format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='CSS'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='CSSPAC'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='CSSGT4'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='NecessaryExpenses']),'##.000' )" />
												</xsl:if>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>
											<!-- Electronic Signature Epic -->
												<xsl:if
													test="//attorneyfeeclaim//ACAP_ClaimStatus = 'Awaiting Judge Signature' or //attorneyfeeclaim//SubmitforAOCReview or //attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready To Batch' or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready to Batch' or //attorneyfeeclaim//Paid">
													<xsl:value-of
														select='format-number(sum(//attorneyfeeclaim//itemizedExpense//JudgeApprovedTotalCost | //attorneyfeeclaim//JudgeHoursAdjust),"##.000" )'/>
												</xsl:if>
											<!-- Electronic Signature Epic -->
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>

						</fo:table>

					</fo:block>
					<!-- End here for 3rd block-->

					<!-- Start here for 4th block-->
					<fo:block margin-top="5mm">
						<fo:table table-layout="fixed" width="100%" border=".1mm solid black">

							<fo:table-column column-width="50%" />
							<fo:table-column column-width="50%" />


							<fo:table-body border="inherit">



								<fo:table-row border="inherit">
									<fo:table-cell border="inherit" 
												text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
												display-align="before">
										<fo:block  font-family="Arial"
													font-size="8pt">Is this a Parent Advisory</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit"  
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
										<fo:block  font-family="Arial"
													font-size="8pt">
													<fo:inline>
														<xsl:if test ="//attorneyfeeclaim//itemizedExpense//isParentAdvisiory">
															<xsl:value-of select="//attorneyfeeclaim//itemizedExpense//isParentAdvisiory"/>
														</xsl:if>
													</fo:inline>

										</fo:block>
									</fo:table-cell>

								</fo:table-row>


								<fo:table-row border="inherit">
									<fo:table-cell border="inherit" 
												text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
												display-align="before">
										<fo:block  font-family="Arial"
													font-size="8pt">Was there More than 4 Hearings (Y/N)</fo:block>
									</fo:table-cell>

									<fo:table-cell border="inherit"  
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
										<fo:block  font-family="Arial"
													font-size="8pt">
													<fo:inline>
														<xsl:if test ="//attorneyfeeclaim//itemizedExpense//isHearingGreaterThan4">
															<xsl:value-of select="//attorneyfeeclaim//itemizedExpense//isHearingGreaterThan4"/>
														</xsl:if>
													</fo:inline>
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row border="inherit">
								
								<fo:table-cell border="inherit"  
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
										<fo:block  font-family="Arial"
													font-size="8pt">

										</fo:block>
									</fo:table-cell>
								
									<fo:table-cell border="solid .1mm black" 
												margin-left="80pt" text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
										<fo:block  font-family="Arial" font-weight="bold" font-style="italic"
													font-size="8pt">I certify that the foregoing represents an accurate, complete statement of time in connection with the above action or proceedings.</fo:block>
									</fo:table-cell>

									

								</fo:table-row>

										<fo:table-row>
											<fo:table-cell margin-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Attorney Signature</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
													margin-left="80pt" padding-before="2pt" padding-after="2pt"
													display-align="before">
													<fo:block font-family="Arial" font-size="8pt">
														<xsl:choose>
															<xsl:when test="//attorneyfeeclaim//ACAP_ProcessStatus ='AOC Staff Created'">
																<xsl:choose>
																	<xsl:when test="//attorneyfeeclaim//ACAP_ClaimantSignDate !=''">
																		<fo:inline>
																			<xsl:value-of
																			select="concat('Signed electronically by ',ACAP_First,'&#10;', ACAP_Middle,'&#10;',ACAP_Last)" />
																			on
																			<xsl:value-of select="ACAP_ClaimantSignDate" />
																		</fo:inline>
																	</xsl:when>
																	<xsl:otherwise>
																		<fo:inline>
																			Claim Entered on Behalf of Claimant
																		</fo:inline>
																	</xsl:otherwise>
																</xsl:choose>
																
															</xsl:when>
															<xsl:otherwise>
																<xsl:choose>
																	<xsl:when test="//attorneyfeeclaim//ACAP_ClaimantSignDate !=''">
																		<fo:inline>
																			<xsl:value-of
																			select="concat('Signed electronically by ',ACAP_First,'&#10;', ACAP_Middle,'&#10;',ACAP_Last)" />
																			on
																			<xsl:value-of select="ACAP_ClaimantSignDate" />
																		</fo:inline>
																	</xsl:when>
																	<xsl:otherwise>
																		<fo:inline>
																			<xsl:value-of
																				select="concat('Signed electronically by ',ACAP_First,'&#10;', ACAP_Middle,'&#10;',ACAP_Last)" />
																			</fo:inline>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:otherwise>
														</xsl:choose>
													</fo:block>
												</fo:table-cell>

										</fo:table-row>

										<fo:table-row border="inherit">
											<fo:table-cell border="inherit" 
												text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">Edison #</fo:block>
											</fo:table-cell>

											<fo:table-cell border="inherit"  
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block  font-family="Arial"
													font-size="8pt">

													<fo:inline>
														<xsl:value-of select="//attorneyfeeclaim//ACAP_EdisonID" />
													</fo:inline>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
										
										<xsl:choose>
											<xsl:when test="//attorneyfeeclaim//LatestServiceDate">
												<fo:table-row>
													<fo:table-cell padding-left="3pt" border="solid .1mm black"
														text-align="left" padding-before="2pt" padding-after="2pt"
														display-align="before">
														<fo:block font-family="Arial" font-size="8pt">Last Activity Date
														</fo:block>
													</fo:table-cell>
		
													<fo:table-cell border="solid .1mm black"
														margin-left="80pt" padding-before="2pt" padding-after="2pt"
														display-align="before">
														<fo:block font-family="Arial" font-size="8pt">
															<xsl:value-of select="concat(substring(//attorneyfeeclaim//LatestServiceDate, 6, 2),  '/',  substring(//attorneyfeeclaim//LatestServiceDate, 9, 2),  '/', substring(//attorneyfeeclaim//LatestServiceDate, 1, 4))" />
														</fo:block>
													</fo:table-cell>
		
												</fo:table-row>
											</xsl:when>
											<xsl:otherwise>
		
											</xsl:otherwise>
										</xsl:choose>
								
										<fo:table-row>
											<fo:table-cell margin-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Auditor
													Signature
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
												<xsl:if test="ACAP_AuditorLogin !='' and (//attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready To Batch' or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready to Batch' or //attorneyfeeclaim//Paid or //attorneyfeeclaim//ACAP_ProcessEscalationReason ='Escalate to Batch')">
													<xsl:choose>
														<xsl:when test="//attorneyfeeclaim//ACAP_AuditorSignDate !=''">
															<fo:inline>
															<xsl:value-of
																select="ACAP_AuditorLogin" />
																on
																<xsl:value-of select="ACAP_AuditorSignDate" />
															</fo:inline>
														</xsl:when>
														<xsl:otherwise>
															<fo:inline>
																<xsl:value-of
																	select="ACAP_AuditorLogin" />
																</fo:inline>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
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
													<!-- Electronic Signature Epic -->
													<xsl:if test="//attorneyfeeclaim//ACAP_ClaimStatus = 'Awaiting Judge Signature' or //attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready To Batch' or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready to Batch' or //attorneyfeeclaim//Paid">
													<xsl:value-of 													
													select="format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='CSS'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='CSSPAC'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='CSSGT4'] |//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='NecessaryExpenses'] | //attorneyfeeclaim//itemizedExpense//HoursAdjustment),'##.000' )" />
													</xsl:if>
													<!-- Electronic Signature Epic -->
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									
							</fo:table-body>
						</fo:table>
					</fo:block>
					<!-- End here for 4th block-->	
				
					<!-- Start here for line item 5th block-->
					<fo:block margin-top="20mm">
						<fo:table>
							<fo:table-column column-width="20%" />
							<fo:table-column column-width="20%" />
							<fo:table-column column-width="20%" />
							<fo:table-column column-width="20%" />
							<fo:table-column column-width="20%" />
							<fo:table-header>
								<fo:table-cell border="solid .1mm black"
									text-align="center">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">Line Item Service Date

									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black"
									text-align="center">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">Line Item TYPE
									</fo:block>

								</fo:table-cell>
								<fo:table-cell border="solid .1mm black"
									text-align="center">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">Line Item Description
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black"
									text-align="center">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">Line Item QTY
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black"
									text-align="center">
									<fo:block font-weight="bold" font-family="Arial"
										font-size="8pt">Dollar&#x2028;
										Amount
									</fo:block>
								</fo:table-cell>
							</fo:table-header>
							<fo:table-body>
								<!--Added for AR-613 -->
								<xsl:if test="//attorneyfeeclaim//itemizedExpense//lineItem">
									<xsl:for-each select="//attorneyfeeclaim//itemizedExpense//lineItem">
										<xsl:if test="ExpenseType!=''">
											<fo:table-row>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of
															select="concat(substring(ServiceDate, 6, 2),  '/',  substring(ServiceDate, 9, 2),  '/', substring(ServiceDate, 1, 4))" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="ExpenseType" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="ClaimExpenseDescription" />
													</fo:block>
												</fo:table-cell>

												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="AuditApprovedQuantity" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="AuditApprovedTotalCost" />

													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<!--End of added for AR-613 -->
								<!--<xsl:if test="//attorneyfeeclaim//itemizedExpense//CSS">

									<xsl:for-each select="//attorneyfeeclaim//itemizedExpense//CSS">
										<xsl:if test="ExpenseType!=''">
											<fo:table-row>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of
															select="concat(substring(ServiceDate, 6, 2),  '/',  substring(ServiceDate, 9, 2),  '/', substring(ServiceDate, 1, 4))" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="ExpenseType" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="ClaimExpenseDescription" />
													</fo:block>
												</fo:table-cell>

												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="AuditApprovedQuantity" />

													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="AuditApprovedTotalCost" />
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="//attorneyfeeclaim//itemizedExpense//CSSGT4">
									<xsl:for-each select="//attorneyfeeclaim//itemizedExpense//CSSGT4">
										<xsl:if test="ExpenseType!=''">
											<fo:table-row>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of
															select=" concat(substring(ServiceDate, 6, 2),  '/',  substring(ServiceDate, 9, 2),  '/', substring(ServiceDate, 1, 4))" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="ExpenseType" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="ClaimExpenseDescription" />
													</fo:block>
												</fo:table-cell>

												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="AuditApprovedQuantity" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="AuditApprovedTotalCost" />

													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="//attorneyfeeclaim//itemizedExpense//CSSPAC">
									<xsl:for-each select="//attorneyfeeclaim//itemizedExpense//CSSPAC">
										<xsl:if test="ExpenseType!=''">
											<fo:table-row>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of
															select=" concat(substring(ServiceDate, 6, 2),  '/',  substring(ServiceDate, 9, 2),  '/', substring(ServiceDate, 1, 4))" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="ExpenseType" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="ClaimExpenseDescription" />
													</fo:block>
												</fo:table-cell>

												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="AuditApprovedQuantity" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="AuditApprovedTotalCost" />

													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="//attorneyfeeclaim//itemizedExpense//NecessaryExpenses">
									<xsl:for-each
										select="//attorneyfeeclaim//itemizedExpense//NecessaryExpenses">
										<xsl:if test="ExpenseType!=''">
											<fo:table-row>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of
															select=" concat(substring(ServiceDate, 6, 2),  '/',  substring(ServiceDate, 9, 2),  '/', substring(ServiceDate, 1, 4))" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="ExpenseType" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="ClaimExpenseDescription" />
													</fo:block>
												</fo:table-cell>
											
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="AuditApprovedQuantity" />

													</fo:block>
												</fo:table-cell>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="AuditApprovedTotalCost" />

													</fo:block>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>-->
								<fo:table-row>

									<fo:table-cell number-columns-spanned="3"
										text-align="right">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>Total:</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="left" margin-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>

												<xsl:if
													test="//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedQuantity != '0.00'">
													<xsl:value-of
														select='format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedQuantity) ,"##.00" )' />
												</xsl:if>


											</fo:inline>
										</fo:block>
									</fo:table-cell>



									<fo:table-cell border="solid .1mm black"
										text-align="left" margin-left="3pt" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>
												<xsl:if
													test="//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost != '0.00'">
													<xsl:value-of
														select='format-number(round ( 100 * sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost)) div 100,"##.00" )' />
												</xsl:if>
											</fo:inline>
										</fo:block>
									</fo:table-cell>



								</fo:table-row>

							</fo:table-body>
						</fo:table>
					</fo:block>
					<!-- End here for line item 5th block-->
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>