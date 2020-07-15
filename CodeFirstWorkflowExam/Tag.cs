using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace CodeFirstWorkflowExam
{
    public class Tag
    {
        public Tag()
        {
            Videos = new Collection<Video>();
        }

        public int Id { get; set; }
        public string Value { get; set; }
        public ICollection<Video> Videos { get; set; }
    }
}
