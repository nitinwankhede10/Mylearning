trigger Test_1 on Candidate__c (After Insert) 
{
 for(Candidate__c rec : Trigger.New)
 {
  Job_Application__c j = new Job_Application__c();
  j.Candidate__c = rec.id;
  j.Status__c = 'New';
  Position__c p = [select id from Position__c where Name = 'ios'];
  j.Position__c =p.id;
  insert j;  
   
   
   
  }
}