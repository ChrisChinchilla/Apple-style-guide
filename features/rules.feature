Feature: Apple Style Guide Rules

  Scenario: Spelling
    When I test "Spelling"
    Then the output should contain exactly:
      """
      test.md:3:1:apple.Spelling:Use 'email' instead of 'e-mail'.
      test.md:5:1:apple.Spelling:Use 'Wi-Fi' instead of 'WiFi'.
      test.md:7:1:apple.Spelling:Use 'online' instead of 'on line'.
      """

  Scenario: Capitalization
    When I test "Capitalization"
    Then the output should contain exactly:
      """
      test.md:1:1:apple.Capitalization:Incorrect capitalization of 'Iphone'.
      test.md:3:1:apple.Capitalization:Incorrect capitalization of 'IPAD'.
      """

  Scenario: Serial Comma
    When I test "SerialComma"
    Then the output should contain exactly:
      """
      test.md:3:1:apple.SerialComma:Serial comma missing - Apple Style Guide requires serial commas.
      """

  Scenario: Terminology
    When I test "Terminology"
    Then the output should contain exactly:
      """
      test.md:3:1:apple.Terminology:Use 'email' instead of 'e-mail'.
      test.md:5:1:apple.Terminology:Use 'deny list' instead of 'blacklist'.
      test.md:7:1:apple.Terminology:Use 'sign in' instead of 'login'.
      """

  Scenario: Passive Voice
    When I test "PassiveVoice"
    Then the output should contain exactly:
      """
      test.md:3:11:apple.PassiveVoice:Consider using active voice instead of 'was defeated'.
      """

  Scenario: Inclusive Language
    When I test "InclusiveLanguage"
    Then the output should contain exactly:
      """
      test.md:3:1:apple.InclusiveLanguage:Avoid 'blacklist' - consider inclusive alternatives.
      test.md:5:1:apple.InclusiveLanguage:Avoid 'whitelist' - consider inclusive alternatives.
      test.md:7:1:apple.InclusiveLanguage:Avoid 'handicapped' - consider inclusive alternatives.
      """

  Scenario: Contractions
    When I test "Contractions"
    Then the output should contain exactly:
      """
      test.md:3:1:apple.Contractions:Consider using the contraction 'are not' for a more conversational tone.
      test.md:5:1:apple.Contractions:Consider using the contraction 'do not' for a more conversational tone.
      """

  Scenario: Abbreviations
    When I test "Abbreviations"
    Then the output should contain exactly:
      """
      test.md:3:1:apple.Abbreviations:'API' - spell out on first use with abbreviation in parentheses.
      test.md:5:1:apple.Abbreviations:'USB' - spell out on first use with abbreviation in parentheses.
      """

  Scenario: Product Names
    When I test "ProductNames"
    Then the output should contain exactly:
      """
      test.md:3:1:apple.ProductNames:Incorrect product name 'iphone' - check Apple Style Guide for correct format.
      test.md:5:1:apple.ProductNames:Incorrect product name 'macbook' - check Apple Style Guide for correct format.
      test.md:7:1:apple.ProductNames:Incorrect product name 'air pods' - check Apple Style Guide for correct format.
      """

  Scenario: Clarity
    When I test "Clarity"
    Then the output should contain exactly:
      """
      test.md:3:1:apple.Clarity:Consider rewriting - 'dialog box' may be unclear or overly technical.
      test.md:5:1:apple.Clarity:Consider rewriting - 'click the mouse' may be unclear or overly technical.
      """

  Scenario: Verbs
    When I test "Verbs"
    Then the output should contain exactly:
      """
      test.md:3:1:apple.Verbs:Use 'click' instead of 'click on'.
      test.md:5:1:apple.Verbs:Use 'drag' instead of 'click and drag'.
      """

  Scenario: Wordy Phrases
    When I test "WordyPhrases"
    Then the output should contain exactly:
      """
      test.md:3:1:apple.WordyPhrases:Use 'to' instead of 'in order to' for clarity.
      test.md:5:1:apple.WordyPhrases:Use 'because' instead of 'due to the fact that' for clarity.
      """
