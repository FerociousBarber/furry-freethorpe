﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeamManager.Models
{
    public enum TeamSize
    {
        Five = 5, Seven = 7, Nine = 9, Eleven = 11
    }

    public class Team
    {  
        public int TeamID { get; set; }
        public string TeamName { get; set; }
        public int SelectedTeamSize { get; set; }
    }
}