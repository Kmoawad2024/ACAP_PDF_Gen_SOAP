<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java"
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
						
						<fo:block font-family="Arial" font-size="20pt">
							<fo:table table-layout="fixed" width="100%">
								<fo:table-column column-width="50%" />
								<fo:table-column column-width="50%" />
								<fo:table-body>
									<fo:table-row>
										<fo:table-cell padding-left="3pt" text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
											<fo:block font-family="Arial" font-size="20pt">GAL In Adoption Claim</fo:block>
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

						<fo:table table-layout="fixed" width="100%">
							<fo:table-column column-width="50%" />
							<fo:table-column column-width="50%" />
							<fo:table-body>

								<xsl:choose>
									<xsl:when test="ACAP_ClaimNumber">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Claim ID
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="ACAP_ClaimNumber" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>




								<xsl:choose>
									<xsl:when test="ACAP_CourtCounty">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">County
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="ACAP_CourtCounty" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>

								<xsl:choose>
									<xsl:when test="ACAP_Court">
										<fo:table-row>
											<fo:table-cell border="solid .1mm black" 
												text-align="left" padding-before="2pt" padding-after="2pt" padding-left="3pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">Court</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"  
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="after">
												<fo:block  font-family="Arial"
													font-size="8pt">
													<xsl:value-of select="ACAP_Court" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>
								
								<xsl:choose>
									<xsl:when test="ACAP_Complex">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Complex
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:if test="ACAP_Complex ='' or ACAP_Complex ='No'">
														No
													</xsl:if>
													<xsl:if test="ACAP_Complex ='Yes'">
														Yes
													</xsl:if>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>

								<xsl:choose>
									<xsl:when test=" ACAP_Sealed">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Sealed
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:if test="ACAP_Sealed ='' or ACAP_Sealed ='No'">
														No
													</xsl:if>
													<xsl:if test="ACAP_Sealed ='Yes'">
														Sealed
													</xsl:if>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>
							</fo:table-body>
						</fo:table>
					</fo:block>



					<fo:block margin-top="5mm">
						<fo:table>
							<fo:table-column column-width="50%" />
							<fo:table-column column-width="50%" />
							<fo:table-body>
								<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
										text-align="center" display-align="before">
										<fo:block font-family="Arial" font-weight="bold"
											font-size="8pt" >Children Name(s)
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="before">
										<fo:block  font-family="Arial" font-weight="bold"
											font-size="8pt">
											Case/Docket No.(s)
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<xsl:choose>
								<xsl:when test="//attorneyfeeclaim//Children!=''">
									<xsl:for-each select="//attorneyfeeclaim//Children//Child">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black">
												<fo:block font-family="Arial" font-size="8pt" text-align="left">
													<xsl:if test="relation = 'Child'">
														<xsl:value-of select="Name" />
													</xsl:if>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell padding-left="3pt" border="solid .1mm black">
												<fo:block font-family="Arial" font-size="8pt" margin-left="80pt" text-align="left">
													<xsl:value-of select="Case_Number" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
								<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black" 
									text-align="left"
									display-align="before">
										<fo:block font-family="Arial"
										font-size="8pt">&#160;
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black" 
									text-align="left"
									display-align="before">
										<fo:block font-family="Arial"
										font-size="8pt">&#160;
										
										</fo:block>
									</fo:table-cell>  
								</fo:table-row>
								</xsl:otherwise>
								</xsl:choose>
							</fo:table-body>
						</fo:table>
					</fo:block>
					<fo:block margin-top="5mm">
						<fo:table table-layout="fixed" width="100%">
							<fo:table-column column-width="50%" />
							<fo:table-column column-width="50%" />
							<fo:table-body>

								<fo:table-row>
									<fo:table-cell padding-left="3pt" border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Representation
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_GARepresent"></xsl:value-of>
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Name of
											Petitioner
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:if test="//attorneyfeeclaim//Children!=''">
												<xsl:for-each select="//attorneyfeeclaim//Children//Child">
													<xsl:if test="relation != 'Child'">
														<xsl:value-of select="Name" />&#x2028;
													</xsl:if>
												</xsl:for-each>
											</xsl:if>

										</fo:block>
									</fo:table-cell>

								</fo:table-row>

								<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">Type of Case
										</fo:block>
									</fo:table-cell>

									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">
											<xsl:value-of select="ACAP_CaseType" />
										</fo:block>
									</fo:table-cell>

								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>


					<fo:block margin-top="5mm">
						<fo:table>
							
							<fo:table-column column-width="14%" />
							<fo:table-column column-width="8%" />
							<fo:table-column column-width="14%" />
							<fo:table-column column-width="8%" />
							<fo:table-column column-width="14%" />
							<fo:table-column column-width="14%" />
							<fo:table-column column-width="14%" />
							<fo:table-column column-width="14%" />
							
							<fo:table-body>
								<fo:table-row>

									
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block font-family="Arial" font-weight="bold" font-size="8pt">In-Court Hours (Tenths)</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block font-family="Arial" font-weight="bold" font-size="8pt">In-Court Amount</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block  font-family="Arial"
											font-size="8pt" font-weight="bold">
											Out-Of-Court Hours (Tenths)</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" font-weight="bold" display-align="center">
										<fo:block  font-family="Arial"
											font-size="8pt">Out-Of-Court Amount</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block font-family="Arial" font-weight="bold" font-size="8pt">Expenses</fo:block>
									</fo:table-cell>
									<!-- Added for defect number 338 -->
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block font-weight="bold" font-family="Arial"
											font-size="8pt">Hours Adjustment</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="center">
										<fo:block font-family="Arial" font-weight="bold" font-size="8pt">Reimbursement Total</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black" 
									text-align="center"
									display-align="center">
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
														test="//attorneyfeeclaim//itemizedExpense//lineItem//Incourt = 'Incourt'">
														<xsl:value-of
															select="format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedQuantity[@expenseType='Incourt']),'##.00' )" />
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
														test="//attorneyfeeclaim//itemizedExpense//lineItem//Incourt = 'Incourt'">
														<xsl:value-of
															select="format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='Incourt']),'##.00' )" />
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
														test="//attorneyfeeclaim//itemizedExpense//lineItem//OutCourt = 'OutCourt'">
														<xsl:value-of
															select="format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedQuantity[@expenseType='OutCourt']),'##.00' )" />
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
														test="//attorneyfeeclaim//itemizedExpense//lineItem//OutCourt = 'OutCourt'">
														<xsl:value-of
															select="format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='OutCourt']),'##.00' )" />
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
														test="//attorneyfeeclaim//itemizedExpense//lineItem//NecessaryExpenses = 'NecessaryExpenses'">
														<xsl:value-of
															select="format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='NecessaryExpenses']),'##.00' )" />
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
														select='format-number(sum(//attorneyfeeclaim//itemizedExpense//Incourt//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//OutCourt//AuditApprovedTotalCost | //attorneyfeeclaim//itemizedExpense//NecessaryExpenses//AuditApprovedTotalCost),"##.00" )' />-->
													<xsl:value-of select="format-number(//attorneyfeeclaim//itemizedExpense//HoursAdjustment,'##.00')" />	
												</xsl:if>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black"
										text-align="center" display-align="after">
										<fo:block font-family="Arial" font-size="8pt">
											<fo:inline>
												
												<xsl:if
													test="//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='Incourt'] != '0.00' or //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='OutCourt'] != '0.00' or //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='NecessaryExpenses'] != '0.00'">
													<xsl:value-of
														select="format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='Incourt'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='OutCourt'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='NecessaryExpenses']),'##.00' )" />
												</xsl:if>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid .1mm black" 
									text-align="center"
									display-align="after">
										<fo:block  font-family="Arial"
										font-size="8pt">
											<fo:inline>
												<xsl:if test ="//attorneyfeeclaim//ACAP_ClaimStatus = 'Awaiting Judge Signature' or //attorneyfeeclaim//SubmitforAOCReview or //attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready To Batch' or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready to Batch' or //attorneyfeeclaim//Paid">
													<xsl:value-of
														select='format-number(sum(//attorneyfeeclaim//itemizedExpense//JudgeApprovedTotalCost | //attorneyfeeclaim//JudgeHoursAdjust),"##.00" )'/>
												</xsl:if>
											</fo:inline>
										</fo:block>
									</fo:table-cell>

								</fo:table-row>

							</fo:table-body>

						</fo:table>

					</fo:block>
					
					<fo:block margin-top="5mm">
						<fo:table table-layout="fixed" width="100%">

							<fo:table-column column-width="50%" />
							<fo:table-column column-width="50%" />


							<fo:table-body>


								<fo:table-row>
								
								<fo:table-cell border="solid .1mm black"
										text-align="left" padding-before="2pt" padding-after="2pt"
										display-align="before">
										<fo:block font-family="Arial" font-size="8pt">

										</fo:block>
									</fo:table-cell>
								
								
									<fo:table-cell border="solid .1mm black"
										margin-left="80pt" text-align="left" padding-before="2pt" padding-after="2pt" font-weight="bold"
										display-align="before" font-style="italic">
										<fo:block font-family="Arial"
											font-size="8pt">I certify that the foregoing represents an
											accurate, complete statement of time and expenses in
											connection with the above action or proceedings.
										</fo:block>
									</fo:table-cell>

									

								</fo:table-row>
								
								<xsl:choose>
									<xsl:when
										test="//attorneyfeeclaim//itemizedExpense//AuditApprovedTotalCost">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">AOC Payment Amount
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
												<xsl:if test="//attorneyfeeclaim//ACAP_ClaimStatus = 'Awaiting Judge Signature' or //attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready To Batch' or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready to Batch' or //attorneyfeeclaim//Paid">
														<xsl:value-of
														select="format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='Incourt'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='OutCourt'] | //attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost[@expenseType='NecessaryExpenses'] | //attorneyfeeclaim//itemizedExpense//HoursAdjustment),'##.00' )" />
												</xsl:if>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>


								<xsl:choose>
									<xsl:when test="ACAP_First">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Attorney
													Signature
												</fo:block>
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
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>

								<!-- Electronic Signature Epic -->
								<xsl:choose>
								<xsl:when test="//attorneyfeeclaim//ACAP_Online ='Yes'">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Judge
													Signature
												</fo:block>
											</fo:table-cell>

													<fo:table-cell border="solid .1mm black"
														margin-left="80pt" padding-before="2pt" padding-after="2pt"
														display-align="before">
														<fo:block font-family="Arial" font-size="8pt">
															<xsl:if test="(//attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready To Batch' or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready to Batch' or //attorneyfeeclaim//Paid)">
																<xsl:choose>
																	<xsl:when test="//attorneyfeeclaim//ACAP_ProcessStatus ='AOC Staff Created'">
																		<xsl:choose>
																			<xsl:when test="//attorneyfeeclaim//ACAP_AssignedJudge !='' and //attorneyfeeclaim//ACAP_JudgeSignDate !=''">
																				<fo:inline>
																					Approved electronically by
																					<xsl:value-of select="concat(ACAP_AssignedJudge,'&#10;', ACAP_JudgeSignDate)" />
																					&#160;
																				</fo:inline>
																			</xsl:when>
																			<xsl:otherwise>
																				<fo:inline>
																					Signature not required.
																				</fo:inline>
																			</xsl:otherwise>
																		</xsl:choose>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:choose>
																			<xsl:when test="//attorneyfeeclaim//ACAP_AssignedJudge !='' and //attorneyfeeclaim//ACAP_JudgeSignDate !=''">
																				<xsl:choose>
																					<xsl:when test="//attorneyfeeclaim//ACAP_JudgeSignDate =' '">
																						<xsl:choose>
																							<xsl:when test="(sum(//attorneyfeeclaim//itemizedExpense//JudgeApprovedTotalCost | //attorneyfeeclaim//JudgeHoursAdjust) >= '200.00')">
																								<fo:inline>
																									Approved electronically by
																									<xsl:value-of select="concat(ACAP_AssignedJudge,'&#10;', ACAP_JudgeSignDate)" />
																									&#160;
																								</fo:inline>
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:choose>
																									<xsl:when test="//attorneyfeeclaim//ACAP_OperationalStatus ='Judge Approved'">
																										<fo:inline>
																											Approved electronically by
																											<xsl:value-of select="concat(ACAP_AssignedJudge,'&#10;', ACAP_JudgeSignDate)" />
																											&#160;
																										</fo:inline>
																									</xsl:when>
																									<xsl:otherwise>
																										<fo:inline>
																											Signature not required.
																										</fo:inline>
																									</xsl:otherwise>
																								</xsl:choose>
																							</xsl:otherwise>
																						</xsl:choose>
																					</xsl:when>
																					<xsl:otherwise>
																						<fo:inline>
																							Approved electronically by
																							<xsl:value-of select="concat(ACAP_AssignedJudge,'&#10;', ACAP_JudgeSignDate)" />
																							&#160;
																						</fo:inline>
																					</xsl:otherwise>
																				</xsl:choose>
																			</xsl:when>
																			<xsl:otherwise>
																				<fo:inline>
																					Signature not required.
																				</fo:inline>
																			</xsl:otherwise>
																		</xsl:choose>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:if>
														</fo:block>
													</fo:table-cell>
										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>
											<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Judge
													Signature
												</fo:block>
											</fo:table-cell>

											<xsl:choose>
												<xsl:when test="(sum(//attorneyfeeclaim//itemizedExpense//JudgeApprovedTotalCost | //attorneyfeeclaim//JudgeHoursAdjust) >= '200.00')">
													<fo:table-cell border="solid .1mm black"
														margin-left="80pt" padding-before="2pt" padding-after="2pt"
														display-align="before">
														<fo:block font-family="Arial" font-size="8pt">
														<xsl:choose>
															<xsl:when test="(//attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready To Batch' or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready to Batch' or //attorneyfeeclaim//Paid)">
																<xsl:choose>
																	<xsl:when test="//attorneyfeeclaim//ACAP_ProcessStatus ='AOC Staff Created'">
																		<xsl:choose>
																			<xsl:when test="//attorneyfeeclaim//IsPDFExist ='Yes' and //attorneyfeeclaim//ACAP_AssignedJudge !='' and //attorneyfeeclaim//ACAP_OperationalStatus !=''">
																				<fo:inline>
																					Offline Judge – signed claim follows.
																				</fo:inline>
																			</xsl:when>
																			<xsl:otherwise>
																				<fo:inline>
																					Signature not required.
																				</fo:inline>
																			</xsl:otherwise>
																		</xsl:choose>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:if test="//attorneyfeeclaim//IsPDFExist ='Yes' and //attorneyfeeclaim//ACAP_AssignedJudge !=''">
																			<fo:inline>
																				Offline Judge – signed claim follows.
																			</fo:inline>
																		</xsl:if>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:when>
															<xsl:otherwise>
																<xsl:if test="(//attorneyfeeclaim//ACAP_ClaimStatus = 'Awaiting Judge Signature')">
																<fo:inline>
																	
																</fo:inline>
															</xsl:if>
															</xsl:otherwise>
														</xsl:choose>
														</fo:block>
													</fo:table-cell>
												</xsl:when>
												<xsl:otherwise>
													<fo:table-cell border="solid .1mm black"
														margin-left="80pt" padding-before="2pt" padding-after="2pt"
														display-align="before">
														<fo:block font-family="Arial" font-size="8pt">
															<xsl:if test="(//attorneyfeeclaim//ACAP_ClaimStatus = 'Awaiting Judge Signature' or //attorneyfeeclaim//SubmitforFinalApproval or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready To Batch' or //attorneyfeeclaim//ACAP_ClaimStatus = 'Ready to Batch' or //attorneyfeeclaim//Paid)">
																<fo:inline>
																	Signature not required.
																</fo:inline>
															</xsl:if>
														</fo:block>
													</fo:table-cell>
												</xsl:otherwise>
											</xsl:choose>

										</fo:table-row>
									</xsl:otherwise>
								</xsl:choose>
								
								<!-- Electronic Signature Epic -->
								
								<xsl:choose>
									<xsl:when test="ACAP_AuditorLogin">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
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
														<!-- approved electronically by &#160; -->
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
									</xsl:when>
									<xsl:otherwise>
											<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
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
													<fo:inline></fo:inline>
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:otherwise>
								</xsl:choose>
								
								<xsl:choose>
									<xsl:when
										test="//attorneyfeeclaim//ACAP_FirmName !='' or //attorneyfeeclaim//ACAP_First !=''">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
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
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_FirmStreet">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Address
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of
														select="concat(ACAP_FirmStreet,'&#10;',ACAP_FirmAddress2)" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_FirmCity">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">City
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmCity" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_FirmState">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
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
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_FirmZipcode">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Zip
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_FirmZipcode" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_PhoneNumber">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Phone
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_PhoneNumber" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>

								<xsl:choose>
									<xsl:when test="//attorneyfeeclaim//ACAP_EdisonID">
										<fo:table-row>
											<fo:table-cell padding-left="3pt" border="solid .1mm black"
												text-align="left" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">Edison No
												</fo:block>
											</fo:table-cell>

											<fo:table-cell border="solid .1mm black"
												margin-left="80pt" padding-before="2pt" padding-after="2pt"
												display-align="before">
												<fo:block font-family="Arial" font-size="8pt">
													<xsl:value-of select="//attorneyfeeclaim//ACAP_EdisonID" />
												</fo:block>
											</fo:table-cell>

										</fo:table-row>
									</xsl:when>
									<xsl:otherwise>

									</xsl:otherwise>
								</xsl:choose>
								
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
							</fo:table-body>
						</fo:table>
					</fo:block>



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
									<fo:block font-family="Arial" font-weight="bold" font-size="8pt">Line Item Service Date

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
									<fo:block font-family="Arial" font-weight="bold" font-size="8pt">Line Item Description
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black"
									text-align="center">
									<fo:block font-family="Arial" font-weight="bold" font-size="8pt">Line Item QTY</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid .1mm black"
									text-align="center">
									<fo:block font-family="Arial" font-weight="bold" font-size="8pt">Dollar&#x2028;
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
								<!--<xsl:if test="//attorneyfeeclaim//itemizedExpense//Incourt">

									<xsl:for-each select="//attorneyfeeclaim//itemizedExpense//Incourt">
										<xsl:if test="ExpenseType!=''">
											<fo:table-row>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="concat(substring(ServiceDate, 6, 2),  '/',  substring(ServiceDate, 9, 2),  '/', substring(ServiceDate, 1, 4))" />
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


								<xsl:if test="//attorneyfeeclaim//itemizedExpense//OutCourt">

									<xsl:for-each select="//attorneyfeeclaim//itemizedExpense//OutCourt">
										<xsl:if test="ExpenseType!=''">
											<fo:table-row>
												<fo:table-cell border="solid .1mm black">
													<fo:block font-family="Arial" font-size="8pt">
														&#x00A0;
														<xsl:value-of select="concat(substring(ServiceDate, 6, 2),  '/',  substring(ServiceDate, 9, 2),  '/', substring(ServiceDate, 1, 4))" />
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
														<xsl:value-of select="concat(substring(ServiceDate, 6, 2),  '/',  substring(ServiceDate, 9, 2),  '/', substring(ServiceDate, 1, 4))" />
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
								
								<fo:table-cell number-columns-spanned="3" text-align="right">
													<fo:block  font-family="Arial"
												font-size="8pt"><fo:inline>Total:</fo:inline>
													</fo:block>
												</fo:table-cell>
								<fo:table-cell border="solid .1mm black" 
									text-align="left" margin-left="3pt"
									display-align="after">
										<fo:block  font-family="Arial"
										font-size="8pt">
											<fo:inline>											
													<xsl:if test="//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedQuantity != '0.00'">
													<xsl:value-of select='format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedQuantity) ,"##.00" )'/>
													</xsl:if>																									
											</fo:inline>
										</fo:block>
									</fo:table-cell>																								
								<fo:table-cell border="solid .1mm black" 
									text-align="left" margin-left="3pt"
									display-align="after">
										<fo:block  font-family="Arial"
										font-size="8pt">
											<fo:inline>
												<xsl:if test="//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost != '0.00' ">
													<xsl:value-of select='format-number(sum(//attorneyfeeclaim//itemizedExpense//lineItem//AuditApprovedTotalCost),"##.00" )'/>
												</xsl:if>
											</fo:inline>
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