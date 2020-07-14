using System.Data.Entity;

namespace CodeFirstWorkflow
{
    public class PlutoContext : DbContext
    {
        public DbSet<Course> Courses { get; set; }
        public DbSet<Author> Authors { get; set; }
        public DbSet<Tag> Tags { get; set; }

        //-- We need this specified because we didn't call a connection string with name of created context("PlutoContext"),
        //-- but with name="DefaultConnection", so we need to tell that to the Entity Framework
        public PlutoContext() : base("name=DefaultConnection")
        {
        }
    }
}
