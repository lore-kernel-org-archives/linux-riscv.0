From: peterz@infradead.org (Peter Zijlstra)
Date: Tue, 6 Mar 2018 14:00:59 +0100
Subject: [RFC PATCH] riscv/locking: Strengthen spin_lock() and
 spin_unlock()
In-Reply-To: <CA+55aFyT=+8m0mmpeegP8LOVtkCYv3O2vyO-ZcQdLAR=s309jg@mail.gmail.com>
References: <20180222134004.GN25181@hirez.programming.kicks-ass.net>
 <20180222141249.GA14033@andrea>
 <82beae6a-2589-6136-b563-3946d7c4fc60@nvidia.com>
 <20180222181317.GI2855@linux.vnet.ibm.com>
 <20180222182717.GS25181@hirez.programming.kicks-ass.net>
 <563431d0-4fb5-9efd-c393-83cc5197e934@nvidia.com>
 <20180226142107.uid5vtv5r7zbso33@yquem.inria.fr>
 <CA+55aFwu5jat5vV-d6RVaUFo=Bjeyv-7eXWUJySg6xFUTnfbWQ@mail.gmail.com>
 <20180226162426.GB17158@arm.com>
 <CA+55aFyT=+8m0mmpeegP8LOVtkCYv3O2vyO-ZcQdLAR=s309jg@mail.gmail.com>
Message-ID: <20180306130059.GE25201@hirez.programming.kicks-ass.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Feb 26, 2018 at 09:00:43AM -0800, Linus Torvalds wrote:
> On Mon, Feb 26, 2018 at 8:24 AM, Will Deacon <will.deacon@arm.com> wrote:
> >
> > Strictly speaking, that's not what we've got implemented on arm64: only
> > the read part of the RmW has Acquire semantics, but there is a total
> > order on the lock/unlock operations for the lock.
> 
> Hmm.
> 
> I thought we had exactly that bug on some architecture with the queued
> spinlocks, and people decided it was wrong.

So ARM64 and Power have the acquire-on-load only thing, but qspinlock
has it per construction on anything that allowes reordering stores.

Given that unlock/lock are ordered, which covers about 99% of the users
out there, and fixing the issue would make things significantly slower
on the weak architectures we let it be.

But yes, its a pesky detail.
