public class Acc12 {
    public Id AccountId{get;set;}
        public Acc12()
        {
            AccountId=[select id from account where name='GenePoint'].ID;
        }

}