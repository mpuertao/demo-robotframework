*** Settings ***
Documentation    estees un archivo para guardar los elementos web de home page bgeneral

*** Variables ***
${MORTGAGELOAN_HOMEPAGE_BUTTON}     xpath=//a[@data-order-default='Calcula tu préstamo hipotecario']
${TYPEPROPERTY_HOMEPAGE_SELECT}     id=type_property
${PROPERTYVALUE_HOMEPAGE_INPUT}     id=property-value
${YEARSPAYMENT_HOMEPAGE_BAR}        name=years-payment
${CALCULATE_HOMEPAGE_BUTTON}        xpath=//input[@type='submit' and @value='Calcula aquí']
${AMOUNTTOFINANCE_HOMEPAGE_LABEL}   id=amount-finance
${RECALCULATE_HOMEPAGE_BUTTON}      xpath=//input[@type='submit' and @value='Recalcular']