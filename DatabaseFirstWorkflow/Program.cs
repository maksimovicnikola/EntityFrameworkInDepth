using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseFirstWorkflow
{
    class Program
    {
        static void Main()
        {
            var context = new PlutoEntities();
            var course = new Course();
            course.Level = CourseLevels.Begineer;

            // Call procedure and print all titles
            var courses = context.GetCourses();
            foreach (var c in courses)
            {
                Console.WriteLine(c.Title);
            }

            context.GetAuthorCourses(1);

            Console.Read();
        }
    }
}
