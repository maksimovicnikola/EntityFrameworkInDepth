using System.Data.Entity.ModelConfiguration;

namespace CodeFirstWorkflowExam
{
    internal class GenreConfiguration : EntityTypeConfiguration<Genre>
    {
        public GenreConfiguration()
        {
            //-- 1. Table override
            //-- 2. Primary key override
            //-- 3. Property configurations => Sort Alphabetically
            //-- 4. Relationships configurations => Sort Alphabetically

            //-- Name can't be null and max length should be 255
            Property(v => v.Name)
                .IsRequired()
                .HasMaxLength(255);
        }
    }
}