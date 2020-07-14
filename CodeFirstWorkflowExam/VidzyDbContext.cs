using System.Data.Entity;

namespace CodeFirstWorkflowExam
{
    public class VidzyDbContext : DbContext
    {
        public virtual DbSet<Video> Videos { get; set; }
        public virtual DbSet<Genre> Genres { get; set; }
    }
}
