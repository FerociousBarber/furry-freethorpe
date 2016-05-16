using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TeamManager.DAL;
using TeamManager.Models;

namespace TeamManager.Controllers
{
    public class MatchTeamsController : Controller
    {
        private TeamManagerContext db = new TeamManagerContext();

        // GET: MatchTeams
        public ActionResult Index()
        {
            var matchTeam = db.MatchTeam.Include(m => m.Match).Include(m => m.Player);
            return View(matchTeam.ToList());
        }

        // GET: MatchTeams/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MatchTeam matchTeam = db.MatchTeam.Find(id);
            if (matchTeam == null)
            {
                return HttpNotFound();
            }
            return View(matchTeam);
        }

        // GET: MatchTeams/Create
        public ActionResult Create()
        {
            ViewBag.MatchID = new SelectList(db.Match, "MatchID", "OppositionName");
            ViewBag.PlayerID = new SelectList(db.Player, "PlayerID", "FirstNames");
            return View();
        }

        // POST: MatchTeams/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MatchTeamID,MatchID,PlayerID,RoleID,PlayerRating")] MatchTeam matchTeam)
        {
            if (ModelState.IsValid)
            {
                db.MatchTeam.Add(matchTeam);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MatchID = new SelectList(db.Match, "MatchID", "OppositionName", matchTeam.MatchID);
            ViewBag.PlayerID = new SelectList(db.Player, "PlayerID", "FirstNames", matchTeam.PlayerID);
            return View(matchTeam);
        }

        // GET: MatchTeams/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MatchTeam matchTeam = db.MatchTeam.Find(id);
            if (matchTeam == null)
            {
                return HttpNotFound();
            }
            ViewBag.MatchID = new SelectList(db.Match, "MatchID", "OppositionName", matchTeam.MatchID);
            ViewBag.PlayerID = new SelectList(db.Player, "PlayerID", "FirstNames", matchTeam.PlayerID);
            return View(matchTeam);
        }

        // POST: MatchTeams/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MatchTeamID,MatchID,PlayerID,RoleID,PlayerRating")] MatchTeam matchTeam)
        {
            if (ModelState.IsValid)
            {
                db.Entry(matchTeam).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MatchID = new SelectList(db.Match, "MatchID", "OppositionName", matchTeam.MatchID);
            ViewBag.PlayerID = new SelectList(db.Player, "PlayerID", "FirstNames", matchTeam.PlayerID);
            return View(matchTeam);
        }

        // GET: MatchTeams/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MatchTeam matchTeam = db.MatchTeam.Find(id);
            if (matchTeam == null)
            {
                return HttpNotFound();
            }
            return View(matchTeam);
        }

        // POST: MatchTeams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MatchTeam matchTeam = db.MatchTeam.Find(id);
            db.MatchTeam.Remove(matchTeam);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
