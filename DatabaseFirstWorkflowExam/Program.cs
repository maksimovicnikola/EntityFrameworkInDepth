using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseFirstWorkflowExam
{
    class Program
    {
        static void Main()
        {
            var context = new VidzyEntities();
            if (!context.Videos.Any())
            {
                // Call a procedure AddVideo to add couple of movies
                context.AddVideo("The Sandman", new DateTime(2020, 7, 15), (byte?)VideoGenres.Horror, (byte?)ClassificationTypes.Silver);
                context.AddVideo("Radioactive", new DateTime(2020, 7, 24), (byte?)VideoGenres.Thriller, (byte?)ClassificationTypes.Platinum);
                context.AddVideo("Made in Italy", new DateTime(2020, 7, 31), (byte?)VideoGenres.Comedy, (byte?)ClassificationTypes.Platinum);
                context.AddVideo("Peninsula", new DateTime(2020, 7, 15), (byte?)VideoGenres.Action, (byte?)ClassificationTypes.Gold);

                Console.WriteLine("Movies has been added");
                Console.WriteLine();
            }

            // Join genre name and classification name on video
            var movies = from v in context.Videos
                         join g in context.Genres on v.GenreId equals g.Id
                         join c in context.Classifications on v.ClassificationId equals c.Id
                         select new
                         {
                             v.Name,
                             v.ReleaseDate,
                             GenreName = v.Genre.Name,
                             ClassificationName = v.Classification.Name
                         };

            foreach (var m in movies)
            {
                Console.WriteLine(String.Format("{0} is released on {1}, and it is a {2} and it is {3} classified.", m.Name, m.ReleaseDate.ToString("dd/MM/yyyy"), m.GenreName, m.ClassificationName));
            }

            Console.Read();
        }
    }
}
