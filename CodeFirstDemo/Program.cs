using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeFirstDemo
{

    class Program
    {
        static void Main(string[] args)
        {
            var context = new BlogDbContext();
            // Add a post to the database
            var newPost = new Post()
            {
                Body = "Post Body",
                DatePublished = DateTime.Now,
                Title = "Post Title"
            };

            context.Posts.Add(newPost);
            context.SaveChanges();

            Console.WriteLine("A post has been successfully added to the database!");
            Console.Read();
        }
    }
}
