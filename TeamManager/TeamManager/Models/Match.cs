using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamManager.Models
{
    public class Match
    {
        public enum MatchType
        {
            League, Cup, Friendly
        }

        public int MatchID { get; set; }
        public DateTime MatchDatetime { get; set; }
        public int LocationID { get; set; }
        public string OppositionName { get; set; }
        public int Duration { get; set; }
        public int Formation { get; set; }
        public string MatchNotes { get; set; }
        public string SelectedMatchType { get; set; }

        public virtual ICollection<MatchEvent> MatchEvents { get; set; }
        public virtual ICollection<MatchTeam> MatchTeam { get; set; }

        public virtual Location Location { get; set; }
    }
}