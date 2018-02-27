From: boqun.feng@gmail.com (Boqun Feng)
Date: Tue, 27 Feb 2018 18:16:05 +0800
Subject: [RFC PATCH] riscv/locking: Strengthen spin_lock() and
 spin_unlock()
In-Reply-To: <20180227050635.es5v5yogz3x4qrtz@tardis>
References: <20180222134004.GN25181@hirez.programming.kicks-ass.net>
 <20180222141249.GA14033@andrea>
 <82beae6a-2589-6136-b563-3946d7c4fc60@nvidia.com>
 <20180222181317.GI2855@linux.vnet.ibm.com>
 <20180222182717.GS25181@hirez.programming.kicks-ass.net>
 <563431d0-4fb5-9efd-c393-83cc5197e934@nvidia.com>
 <20180226142107.uid5vtv5r7zbso33@yquem.inria.fr>
 <CA+55aFwu5jat5vV-d6RVaUFo=Bjeyv-7eXWUJySg6xFUTnfbWQ@mail.gmail.com>
 <20180226162426.GB17158@arm.com>
 <20180227050635.es5v5yogz3x4qrtz@tardis>
Message-ID: <20180227101605.tlo37kjhc673pzqj@tardis>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Feb 27, 2018 at 01:06:35PM +0800, Boqun Feng wrote:
> On Mon, Feb 26, 2018 at 04:24:27PM +0000, Will Deacon wrote:
> > On Mon, Feb 26, 2018 at 08:06:59AM -0800, Linus Torvalds wrote:
> > > On Mon, Feb 26, 2018 at 6:21 AM, Luc Maranget <luc.maranget@inria.fr> wrote:
> > > >
> > > > That is, locks are not implemented from more basic primitive but are specified.
> > > > The specification can be described as behaving that way:
> > > >   - A lock behaves as a read-modify-write. the read behaving as a read-acquire
> > > 
> > > This is wrong, or perhaps just misleading.
> > > 
> > > The *whole* r-m-w acts as an acquire. Not just the read part. The
> > > write is very much part of it.
> > > 
> > > Maybe that's what you meant, but it read to me as "just the read part
> > > of the rmw behaves as a read-acquire".
> > > 
> > > Because it is very important that the _write_ part of the rmw is also
> > > ordered wrt everything that is inside the spinlock.
> > > 
> > > So doing a spinlock as
> > > 
> > >  (a) read-locked-acquire
> > >    modify
> > >  (c) write-conditional
> > > 
> > > would be wrong, because the accesses inside the spinlock are ordered
> > > not just wrt the read-acquire, they have to be ordered wrt the write
> > > too.
> > > 
> > > So it is closer to say that it's the _write_ of the r-m-w sequence
> > > that has the acquire semantics, not the read.
> > 
> > Strictly speaking, that's not what we've got implemented on arm64: only
> > the read part of the RmW has Acquire semantics, but there is a total
> > order on the lock/unlock operations for the lock. For example, if one
> > CPU does:
> > 
> > spin_lock(&lock);
> > WRITE_ONCE(foo, 42);
> > 
> > then another CPU could do:
> > 
> > if (smp_load_acquire(&foo) == 42)
> > 	BUG_ON(!spin_is_locked(&lock));
> > 
> 
> Hmm.. this is new to me. So the write part of spin_lock() and the
> WRITE_ONCE() will not get reordered? Could you explain more about this
> or point where I should look in the document? I understand the write
> part of spin_lock() must be committed earlier than the WRITE_ONCE()
> committed due to the ll/sc, but I thought the ordering of their arrivals
> in memory system is undefined/arbitary.
> 
> Regards,
> Boqun
> 
> > and that could fire. Is that relied on somewhere?
> > 

My bad, I misunderstood your mail. So you were saying the BUG_ON() can
be triggered in currently implementations. Never mind my reply above.

Regards,
Boqun

> > Will


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180227/a1dfcf1b/attachment.sig>
