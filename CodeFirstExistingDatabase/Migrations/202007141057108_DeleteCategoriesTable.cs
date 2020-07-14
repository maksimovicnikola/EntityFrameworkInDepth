namespace CodeFirstExistingDatabase.Migrations
{
    using System;
    using System.Data.Entity.Migrations;

    public partial class DeleteCategoriesTable : DbMigration
    {
        public override void Up()
        {
            //-- If we want  to keep categories table data for historical reason, we can do it on this way
            CreateTable(
                "dbo._Categories",
                    c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                    })
                    .PrimaryKey(t => t.Id);
            //-- Copy data from Categories to _Categories
            Sql("INSERT INTO _Categories (Name) SELECT Name FROM Categories");

            DropTable("dbo.Categories");
        }

        public override void Down()
        {
            CreateTable(
                "dbo.Categories",
                c => new
                {
                    Id = c.Int(nullable: false, identity: true),
                    Name = c.String(),
                })
                .PrimaryKey(t => t.Id);

            //-- Copy data from Categories to _Categories
            Sql("INSERT INTO Categories (Name) SELECT Name FROM _Categories");

            DropTable("dbo._Categories");
        }
    }
}
