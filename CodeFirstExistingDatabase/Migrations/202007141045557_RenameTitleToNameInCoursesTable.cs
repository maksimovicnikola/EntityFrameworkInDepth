namespace CodeFirstExistingDatabase.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class RenameTitleToNameInCoursesTable : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Courses", "Name", c => c.String(nullable: false));
            //-- We changed Name to the Title, but also we want to keep old title values and set them to name
            Sql("Update Courses SET Name = Title");
            DropColumn("dbo.Courses", "Title");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Courses", "Title", c => c.String(nullable: false));
            //-- We changed Name to the Title, so we need to revert that change, but also keep the data
            Sql("Update Courses SET Title = Name");
            DropColumn("dbo.Courses", "Name");
        }
    }
}
