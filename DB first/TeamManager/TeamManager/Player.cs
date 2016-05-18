//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TeamManager
{
    using System;
    using System.Collections.Generic;
    
    public partial class Player
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Player()
        {
            this.MatchEvents = new HashSet<MatchEvent>();
            this.MatchTeams = new HashSet<MatchTeam>();
        }
    
        public int PlayerID { get; set; }
        public int TeamID { get; set; }
        public string FirstNames { get; set; }
        public string Surname { get; set; }
        public System.DateTime DOB { get; set; }
        public Nullable<int> Goals { get; set; }
        public Nullable<int> Appearances { get; set; }
        public Nullable<int> MinutesPlayed { get; set; }
        public string PersonalNotes { get; set; }
        public string CoachingNotes { get; set; }
        public string ContactEmail { get; set; }
        public Nullable<int> YellowCards { get; set; }
        public Nullable<int> RedCards { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MatchEvent> MatchEvents { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MatchTeam> MatchTeams { get; set; }
    }
}
