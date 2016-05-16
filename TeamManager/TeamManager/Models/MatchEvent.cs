using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamManager.Models
{
    public class MatchEvent
    {
        public enum MatchEventType
        {
            Goal, Conceeded, Substition, YellowCard, RedCard
        }

        public int MatchEventID { get; set; }
        public int PlayerID { get; set; }
        public int MatchID { get; set; }

    }
}