From: paulmck@linux.vnet.ibm.com (Paul E. McKenney)
Date: Thu, 6 Sep 2018 20:45:55 -0700
Subject: Unable to handle kernel paging request at virtual address
 0000001bf8068693
In-Reply-To: <76b92dc0-80d6-a062-924c-1a7d2c2810cd@wdc.com>
References: <mvmh8j4f4yb.fsf@suse.de>
 <ade8cef4-aad0-3320-8bce-700cd3e106c9@wdc.com>
 <20180905190648.GC1420@infradead.org>
 <20180905210708.GC4225@linux.vnet.ibm.com>
 <ef12ee11-5752-1596-4701-60722984b863@wdc.com>
 <20180906042009.GJ4225@linux.vnet.ibm.com>
 <76b92dc0-80d6-a062-924c-1a7d2c2810cd@wdc.com>
Message-ID: <20180907034555.GM4225@linux.vnet.ibm.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 06, 2018 at 05:24:43PM -0700, Atish Patra wrote:
> On 9/5/18 9:20 PM, Paul E. McKenney wrote:
> >On Wed, Sep 05, 2018 at 09:10:14PM -0700, Atish Patra wrote:
> >>On 9/5/18 2:07 PM, Paul E. McKenney wrote:
> >>>On Wed, Sep 05, 2018 at 12:06:48PM -0700, Christoph Hellwig wrote:
> >>>>On Wed, Sep 05, 2018 at 10:17:08AM -0700, Atish Patra wrote:
> >>>>>This issue is fixed in 4.19-rc1.
> >>>>>
> >>>>>If you don't want to pull the latest, here is the change you need to
> >>>>>cherry-pick to your branch.
> >>>>>
> >>>>>https://lore.kernel.org/lkml/20180626192746.GJ3593 at linux.vnet.ibm.com/
> >>>>
> >>>>Paul, I think we need this in 4.18-stable.
> >>>>
> >>>>Also Palmer, I think we should pick it up in riscv-linux-4.18.
> >>>>
> >>>>The mainline commit is:
> >>>>
> >>>>commit fcc63543650150629c8a873cbef3578770acecd9
> >>>>Author: Boqun Feng <boqun.feng@gmail.com>
> >>>>Date:   Fri Jun 15 12:06:31 2018 -0700
> >>>>
> >>>>     rcu: Make expedited GPs handle CPU 0 being offline
> >>>
> >>>OK, it backports cleanly and passes a short rcutorture test.  You guys
> >>>have tested it, correct?  If so, I am happy to pass it on to -stable.
> >>>
> >>>							Thanx, Paul
> >>>
> >>>
> >>Hi Paul,
> >>I had it tested on top of 4.18-rc8 with RISC-V board (HighFive Unleashed).
> >>
> >>I can try again on 4.18-stable if required.
> >
> >Hello, Atish,
> >
> >Please do test it on 4.18-stable.  The -stable maintainers get
> >understandably annoyed when given non-working backports.  ;-)
> >
> >							Thanx, Paul
> >
> >
> 
> Done. I have verified on 4.18-stable with HighFive Unleashed board.
> 
> FWIW,
> Tested-by: Atish Patra <atish.patra@wdc.com>

And I sent the -stable request, CCing you all.  Here is hoping!

							Thanx, Paul
