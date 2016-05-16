using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamManager.Models
{
    public class Player
    {
        public int PlayerID { get; set; }
        public int TeamID { get; set; }
        public string FirstNames { get; set; }
        public string Surname { get; set; }
        public DateTime DOB { get; set; }
        public int Goals { get; set; }
        public int Appearances { get; set; }
        public int MinutesPlayed { get; set; }
        public string PersonalNotes { get; set; }
        public string CoachingNotes { get; set; }
        public string ContactEmail { get; set; }
        public int YellowCards { get; set; }
        public int RedCards { get; set; }

        public virtual ICollection<MatchTeam> Matches { get; set; }
        public virtual ICollection<MatchEvent> MatchEvents { get; set; }
        public virtual ICollection<Training> Training { get; set; }
        public virtual ICollection<Team> Team { get; set; }    

    }
}