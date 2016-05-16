using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamManager.Models
{
    public class MatchTeam
    {
        public int MatchTeamID { get; set; }
        public int MatchID { get; set; }
        public int PlayerID { get; set; }
        public int RoleID { get; set; }
        public int PlayerRating { get; set; }

        public virtual PlayerRole PlayerRole { get; set; }
        public virtual Match Match { get; set; }
        public virtual Player Player { get; set; }
    }
}