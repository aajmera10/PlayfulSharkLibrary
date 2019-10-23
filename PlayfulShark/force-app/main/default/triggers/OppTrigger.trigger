trigger OppTrigger on Opportunity (before insert,before update,after insert,after update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            OpportunityTriggerHandler.oppTriggerInsert(Trigger.new);
        }
    }

}