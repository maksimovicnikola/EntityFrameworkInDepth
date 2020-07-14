namespace CodeFirstWorkflowExam.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class SeedDataToGenres : DbMigration
    {
        public override void Up()
        {
            //-- Withing SQL function we can run any sql expression
            Sql("INSERT INTO Genres (Name) VALUES ('Comedy')");
            Sql("INSERT INTO Genres (Name) VALUES ('Action')");
            Sql("INSERT INTO Genres (Name) VALUES ('Drama')");
            Sql("INSERT INTO Genres (Name) VALUES ('Thriller')");
            Sql("INSERT INTO Genres (Name) VALUES ('Sci-Fi')");
        }
        
        public override void Down()
        {
        }
    }
}
