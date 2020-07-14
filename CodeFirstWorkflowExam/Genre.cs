using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace CodeFirstWorkflowExam
{
    public class Genre
    {
        public Genre()
        {
            Videos = new Collection<Video>();
        }

        public byte Id { get; set; }
        public string Name { get; set; }
        public ICollection<Video> Videos { get; set; }
    }
}
