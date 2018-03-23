# PESTER!

### Introduction
Name, blog, agenda

### Setup the Presentation  
Show script that I have to setup our databases for the Demo's
Explain that this is automation
Run the script  
Now what?  We manually refresh the view.  This is NOT automation!  

### What is Pester?  
Power shell module for automated testing.  
It's free. Get it on github.  
It's community supported.  
Powershell compatibility  

### Demo  
Hello world  
Explain Describe and It blocks  
Calculator  
Explain Context blocks  

### Why Pester?  
**Readability**  
Reading code that someone else has written is HARD.  
**Consistency**  
The test I wrote for a registry entry, looks like the test you wrote for service accounts, which looks like the test we found on the internet for database compression.  
**Modularity**  
Pester tests can be broken into separate and specific groups.  
**Testing As Code**  
Automatable!
**Pretty Colors!**  
When you see your boss is headed to your desk, kick off 100 Pester tests. If you're addicted to SSIS green\red, like I am, Pester is very pleasing!  

### Demo of Infrastructure Testing
**SQL Server services**  
**Registry Entries**  

### Advanced Tips!
**It's still just powershell**  
Loops, logic, and other modules still apply
WARNING!  Pester will not stop you from changing things!  
Passing parameters  
Using global variables as parameters  

### Additional Pester Parameters  
Show  
OutputFile
PassThru  
**JAMES WHAT HAPPENS WHEN YOU USE SHOW AND PASSTHRU????** 

### Deployment Scenarios
**Running locally**  
Boring!  
**Running remotely**  
**Scheduling with XML\custom output**  
Run tests locally then collect them  
**Email the results**  


### Third Party Modules  
**DBATOOLS**  
Show a maxdop test without DBA tools  
Show a maxdop test with DBA tools  
**PoshSpec**  
show a service test without
show a service test with  
**PSRemotely**  
**DBAChecks**  

