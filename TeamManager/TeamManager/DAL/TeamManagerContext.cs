using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TeamManager.Models;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace TeamManager.DAL
{
    public class TeamManagerContext : DbContext
    {
        public TeamManagerContext() : base("TeamManagerContext")
        {
        }

        public DbSet<Location> Location { get; set; }
        public DbSet<Match> Match { get; set; }
        public DbSet<MatchEvent> MatchEvent { get; set; }
        public DbSet<MatchTeam> MatchTeam { get; set; }
        public DbSet<Player> Player { get; set; }
        public DbSet<PlayerRole> PlayerRole { get; set; }
        public DbSet<Team> Team { get; set; }
        public DbSet<Training> Training { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
    }
}