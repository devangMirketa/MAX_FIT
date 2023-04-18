trigger DuplicateTrigger on Account (before insert) {
    Set<String> accountNames=new Set<String>();
    for(Account acc : Trigger.new){
        accountNames.add(acc.Name);
    }
    list<Account> listOfDuplicateAccount=[select id,name from Account where name in :accountNames];
    for(Account account:Trigger.new){
        if(listOfDuplicateAccount.size()!=0){
            account.addError('Account Already exist with this Name');
        }
    }
}