using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamManager.Models
{
    public class Player
    {
        public int ID { get; set; }
        public string firstNames { get; set; }
        public string surname { get; set; }
        public DateTime DOB { get; set; }
        public int goals { get; set; }
        public int appearances { get; set; }
        public int minutesPlayed { get; set; }
        public string personalNotes { get; set; }
        public string coachingNotes { get; set; }
        public string contactEmail { get; set; }

        public virtual ICollection<Match> Matches { get; set; }
    }
}