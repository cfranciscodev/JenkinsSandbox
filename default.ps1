properties {
  $testMessage = 'Executed Test!'
  $compileMessage = 'Executed Compile!'
  $cleanMessage = 'Executed Clean!'
  $gitPath = 'default'
}

task default -depends Checkout

task Test -depends Compile, Clean { 
  $testMessage
}

task Compile -depends Clean { 
  $compileMessage
}

task Clean { 
  $cleanMessage
}

task ? -Description "Helper to display task info" {
	Write-Documentation
}

task Checkout -Description "Task to checkout from the supplied gitPath parameter" {
	Remove-Item .\JenkinsSolutionToBuild -Recurse -Force
	exec { git clone $gitPath}
}