﻿// <auto-generated />
namespace CodeFirstWorkflowExam.Migrations
{
    using System.CodeDom.Compiler;
    using System.Data.Entity.Migrations;
    using System.Data.Entity.Migrations.Infrastructure;
    using System.Resources;
    
    [GeneratedCode("EntityFramework.Migrations", "6.4.4")]
    public sealed partial class AddedTagsToVideosWithManyToManyRelation : IMigrationMetadata
    {
        private readonly ResourceManager Resources = new ResourceManager(typeof(AddedTagsToVideosWithManyToManyRelation));
        
        string IMigrationMetadata.Id
        {
            get { return "202007151254599_AddedTagsToVideosWithManyToManyRelation"; }
        }
        
        string IMigrationMetadata.Source
        {
            get { return null; }
        }
        
        string IMigrationMetadata.Target
        {
            get { return Resources.GetString("Target"); }
        }
    }
}
