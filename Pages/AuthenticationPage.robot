*** Settings ***
Resource  ../Resources/common_keywords.robot


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
        [Arguments]  ${firstName_value}  ${lastName_value}  ${pwd_value}
        Wait and input text  ${input_FirstName}  ${firstName_value}
        Wait and input text  ${input_LastName}  ${lastName_value}
        Wait and input text  ${input_Password}  ${pwd_value}


Select Date of Birth
        [Arguments]  ${day}  ${month}  ${year}
        select from list by value  ${dropdown_day}  ${day}

        select from list by value  ${dropdown_month}  ${month}

        select from list by value  ${dropdown_year}  ${year}



