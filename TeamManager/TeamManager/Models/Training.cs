using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamManager.Models
{
    public class Training
    {
        public int TrainingID { get; set; }
        public DateTime TrainingDatetime { get; set; }
        public string TrainingNotes { get; set; }

        public virtual ICollection<MatchTeam> TrainingTeam { get; set; }
    }
}