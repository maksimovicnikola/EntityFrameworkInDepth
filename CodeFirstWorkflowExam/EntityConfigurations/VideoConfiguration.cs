using System.Data.Entity.ModelConfiguration;

namespace CodeFirstWorkflowExam
{
    internal class VideoConfiguration : EntityTypeConfiguration<Video>
    {
        public VideoConfiguration()
        {
            //-- 1. Table override
            //-- 2. Primary key override
            //-- 3. Property configurations => Sort Alphabetically
            //-- 4. Relationships configurations => Sort Alphabetically

            //-- Classification column should be a tinyint
            Property(v => v.Classification)
                .HasColumnType("tinyint");

            //-- Name can't be null and max length should be 255
            Property(v => v.Name)
                .IsRequired()
                .HasMaxLength(255);

            //-- Genre_Id column should be renamed to GenreId and it cannot be NULL
            HasRequired(v => v.Genre)
            .WithMany(g => g.Videos)
            .HasForeignKey(v => v.GenreId);

            //-- The intermediary table for the many-to-many relationship between videos and tags should be called VideoTags with Columns VideoId and TagId
            HasMany(v => v.Tags)
            .WithMany(t => t.Videos)
            .Map(m =>
            {
                m.ToTable("VideoTags");
                m.MapLeftKey("VideoId");
                m.MapRightKey("TagId");
            });
        }
    }
}