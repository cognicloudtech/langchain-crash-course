try {
  # Send the request and receive the response
  $response = Invoke-WebRequest `
    -Uri 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro-latest:generateContent?key=AIzaSyA9NIC8uoENoRIRke9QxcPP9QPnyPuKWaM' `
    -Method 'POST' `
    -Headers @{'Content-Type' = 'application/json'} `
    -Body '{"contents":[{"parts":[{"text":"You are a coding assistant. Your task is to generate a code snippet that accomplishes a specific goal. The code snippet must be concise, efficient, and well-commented for clarity. Consider any constraints or requirements provided for the task. If the task does not specify a programming language, default to Python. Demonstrate an extremely complex example. "}]}]}'

  # Convert the response content from JSON string to a PowerShell object
  $responseObject = $response.Content | ConvertFrom-Json

  # Check if the responseObject and the required properties exist
  if ($responseObject -and $responseObject.candidates -and $responseObject.candidates.Count -gt 0 -and $responseObject.candidates[0].content.parts.Count -gt 0) {
      # Extract the generated text
      $generatedText = $responseObject.candidates[0].content.parts[0].text

      # Display the text
      Write-Host "Gemini's response: $generatedText"
  } else {
      Write-Host "No generated text found in the response."
  }
} catch {
  Write-Host "Error making request or parsing response: $_"
}

