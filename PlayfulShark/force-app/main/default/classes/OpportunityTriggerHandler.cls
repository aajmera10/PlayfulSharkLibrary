public class OpportunityTriggerHandler {
    public static void oppTriggerInsert(list<Opportunity> opplist){
        Set<String> idSet = new Set<String>();
        Map<Id,Id> oppMaptrue = new Map<Id,Id>();
        Map<Id,Id> oppMapfalse = new Map<Id,Id>();
        List<Account> accountsUpdate = new List<Account>();
        if(opplist.size()>0){
            for(Opportunity opp:opplist){
                if(opp.Amount>20000){
                    oppMaptrue.put(opp.AccountId,opp.id);
                    System.debug('Chech '+oppMaptrue);
                    idSet.add(opp.AccountId);    
                }else{
                    oppMapfalse.put(opp.AccountId,opp.id);
                    System.debug('Chech '+oppMapfalse);
                    idSet.add(opp.AccountId);    
                }
            }
        }
        if(idSet.size()>0){
            List<Account> accList = [SELECT Id,is_Gold__c,Name FROM Account WHERE Id IN:idSet];
            if(accList.size()>0){
                for(Account acc:accList){
                    System.debug('Chech '+oppMaptrue);
                    System.debug('Chechs '+acc.id);
                    if(oppMaptrue.containsKey(acc.id)){
                        System.debug('hello '+acc.id);
                        acc.is_Gold__c = true;
                        accountsUpdate.add(acc); 
                    }if(oppMapfalse.containsKey(acc.id)){
                        acc.is_Gold__c = false;
                        accountsUpdate.add(acc);                         
                    }
                }
                update accountsUpdate;
            }  
        }
    }
}    
/*public static void testCheck(list<Opportunity> opplist){
map maptop = new map();
set oppid = new set();
map maptopfalse = new map();//faslecase map
set oppIdInFalseCase = new set();//falsecase set
map deletecase = new map();
set delcaseid = new set();//deletecase set
list opplist = new list(); // query list
list listtoupdate = new list(); //for update

for(Top_X_Designation__c top : trigger.isdelete? trigger.old :trigger.new)

{

if(trigger.isInsert || trigger.isUpdate)

{

if(top.Document_Attached__c == true &&

((top.Type__c==’Contract Flow Down’) || (top.Type__c==’Handoff’)))

{

maptop.put(top.Opp_top_x_designation__c, top.Id);

oppid.add(top.Opp_top_x_designation__c);

system.debug(‘here ‘+ top.Opp_top_x_designation__c);

}

else

maptopfalse.put(top.Opp_top_x_designation__c,top.id);

oppid.add(top.Opp_top_x_designation__c);

system.debug(‘here in else part ‘+ top.Opp_top_x_designation__c);

}

if(trigger.isDelete){

deletecase.put(top.Opp_top_x_designation__c,top.Id);

delcaseid.add(top.Opp_top_x_designation__c);

oppid.add(top.Opp_top_x_designation__c);

}

}

opplist = [select Id,Handoff_Attached__c from opportunity where id in:oppid];

for( opportunity opp : opplist){

if(maptop.containsKey(opp.id))

{

opp.Handoff_Attached__c =’yes’;

//listtoupdate.add(opp);

}

if(maptopfalse.containsKey(opp.id)){

opp.Handoff_Attached__c =’no’;

// listtoupdate.add(opp);

}

if(delcaseid.contains(opp.Id)){

opp.Handoff_Attached__c =”;

}

listtoupdate.add(opp) ;

}

if( listtoupdate.size()>0){

update listtoupdate;

system.debug(‘testL’+listtoupdate);}

}
}



Opportunity opps = opplist.get(0);
if(opps.Amount>=20000){
acc.is_Gold__c = true;
accountsUpdate.add(acc);
}else{
acc.is_Gold__c = false;
accountsUpdate.add(acc);
}


List<Account> accList = [SELECT Id,is_Gold__c,Name FROM Account WHERE Id IN:idSet];
if(accList.size()>0){
for(Account acc:accList){
acc.is_Gold__c = true;
accountsUpdate.add(acc);
}
upsert accountsUpdate;
}
List <Opportunity> oppLists = [SELECT Id,AccountId,Amount,Account.is_Gold__c From Opportunity WHERE  AccountId IN:idSet];
if(oppLists.size()>0){
for()
}*/