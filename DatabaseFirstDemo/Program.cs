using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseFirstDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            var context = new DbEntities();

            // Add Post to a db
            var newPost = new Post()
            {
                Body = "Post Body",
                DatePublished = DateTime.Now,
                Title = "Post Title"
            };

            context.Posts.Add(newPost);
            context.SaveChanges();

            Console.WriteLine("A post has been successfully added!");
            Console.Read();
        }
    }
}
