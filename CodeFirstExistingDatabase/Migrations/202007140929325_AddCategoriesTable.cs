namespace CodeFirstExistingDatabase.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddCategoriesTable : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Categories",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);

            //-- Withing SQL function we can run any sql expression
            Sql("INSERT INTO CATEGORIES (Name) VALUES ('Web Development')");
            Sql("INSERT INTO CATEGORIES (Name) VALUES ('Programming Languages')");
        }
        
        public override void Down()
        {
            DropTable("dbo.Categories");
        }
    }
}
