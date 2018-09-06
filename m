From: paulmck@linux.vnet.ibm.com (Paul E. McKenney)
Date: Thu, 6 Sep 2018 10:50:08 -0700
Subject: Unable to handle kernel paging request at virtual address
 0000001bf8068693
In-Reply-To: <mvm1sa7f58a.fsf@suse.de>
References: <mvmh8j4f4yb.fsf@suse.de>
 <ade8cef4-aad0-3320-8bce-700cd3e106c9@wdc.com>
 <20180905190648.GC1420@infradead.org> <mvm1sa7f58a.fsf@suse.de>
Message-ID: <20180906175008.GY4225@linux.vnet.ibm.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 06, 2018 at 09:35:33AM +0200, Andreas Schwab wrote:
> On Sep 05 2018, Christoph Hellwig <hch@infradead.org> wrote:
> 
> > The mainline commit is:
> >
> > commit fcc63543650150629c8a873cbef3578770acecd9
> > Author: Boqun Feng <boqun.feng@gmail.com>
> > Date:   Fri Jun 15 12:06:31 2018 -0700
> >
> >     rcu: Make expedited GPs handle CPU 0 being offline
> 
> Thanks, this got me further.

Very good!  This was against 4.18-stable, correct?  If so, please let
me know and I will send the request to -stable.  Or you guys can send
the request, your choice.

							Thanx, Paul
