*** Settings ***
Resource  ../Resources/common_keywords.robot
Resource  MyAccountPage.robot

*** Variables ***
${email_address}  id:email_create
${btn_Submit_Create}  id:SubmitCreate
${input_FirstName}  id:customer_firstname
${input_LastName}  id:customer_lastname
${input_Password}  id:passwd
${rd_title_mr}  xpath=//label[contains(.,'Mr.')]
${rd_title_mrs}  xpath=//label[contains(.,'Mrs.')]
${dropdown_day}  xpath=//select[@id='days']
${dropdown_month}  xpath=//select[@id='months']
${dropdown_year}  xpath=//select[@id='years']
${input_address}  id:address1
${input_city}  id:city
${input_zip}  id:postcode
${input_mobile}  id:phone_mobile
${input_address_allias}  id:alias
${dropdown_state}  xpath=//select[@id='id_state']
${dropdown_country}  xpath=//select[@id='id_country']
${btn_register}  xpath=//span[.='Register']

*** Keywords ***
Enter email address to create an account
        [Arguments]  ${email_value}
        Wait and input text  ${email_address}  ${email_value}
        Wait and click element  ${btn_Submit_Create}

Select Title
        [Arguments]  ${sex}
        IF  '${sex}' == 'Male'
            Wait and click element  ${rd_title_mr}
        ELSE
            Wait and click element  ${rd_title_mrs}
        END


Input mandatory fields
        [Arguments]  ${firstName_value}  ${lastName_value}  ${pwd_value}  ${address_value}  ${city_value}  ${zipcode}   ${mobile_value}  ${allias_value}
        Wait and input text  ${input_FirstName}  ${firstName_value}
        Wait and input text  ${input_LastName}  ${lastName_value}
        Wait and input text  ${input_Password}  ${pwd_value}
        Wait and input text  ${input_address}  ${address_value}
        Wait and input text  ${input_city}  ${city_value}
        Wait and input text  ${input_zip}  ${zipcode}
        Wait and input text  ${input_mobile}  ${mobile_value}
        Wait and input text  ${input_address_allias}  ${allias_value}

Select Date of Birth
        [Arguments]  ${day}  ${month}  ${year}
        select from list by value  ${dropdown_day}  ${day}
        select from list by value  ${dropdown_month}  ${month}
        select from list by value  ${dropdown_year}  ${year}

Select Location
        [Arguments]  ${state}  ${country}
        select from list by label  ${dropdown_state}  ${state}
        select from list by label  ${dropdown_country}  ${country}


Load and Input Personal Data from Excel File
        [Arguments]  ${sheetname}
        ${row}=  Read number of rows  ${sheetname}
        FOR  ${i}  IN RANGE  2  ${row}+1
          ${email}=  Read Excel Data of cell  ${sheetname}  ${i}  1
          ${sex}=  Read Excel Data of cell  ${sheetname}  ${i}  2
          ${firstName}=  Read Excel Data of cell  ${sheetname}  ${i}  3
          ${lastName}=  Read Excel Data of cell  ${sheetname}  ${i}  4
          ${pwd}=  Read Excel Data of cell  ${sheetname}  ${i}  5
          ${day}=  Read Excel Data of cell  ${sheetname}  ${i}  6
          ${month}=  Read Excel Data of cell  ${sheetname}  ${i}  7
          ${year}=  Read Excel Data of cell  ${sheetname}  ${i}  8
          ${address}=  Read Excel Data of cell  ${sheetname}  ${i}  9
          ${city}=  Read Excel Data of cell  ${sheetname}  ${i}  10
          ${state}=  Read Excel Data of cell  ${sheetname}  ${i}  11
          ${zip}=  Read Excel Data of cell  ${sheetname}  ${i}  12
          ${country}=  Read Excel Data of cell  ${sheetname}  ${i}  13
          ${mobile}=  Read Excel Data of cell  ${sheetname}  ${i}  14
          ${address_allias}=  Read Excel Data of cell  ${sheetname}  ${i}  15

          Enter email address to create an account  ${email}
          Select Title  ${sex}
          Input mandatory fields  ${firstName}  ${lastName}   ${pwd}   ${address}  ${city}  ${zip}  ${mobile}  ${address_allias}
          Select Date of Birth  ${day}  ${month}  ${year}
          Select Location  ${state}  ${country}
          Wait and click element  ${btn_register}
          ${fullName}= Catenate    ${firstName}   ${lastName}
          Verify the account name after logged in   ${fullName}
          Log out the user account

        END