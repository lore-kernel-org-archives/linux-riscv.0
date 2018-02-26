From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Mon, 26 Feb 2018 09:00:43 -0800
Subject: [RFC PATCH] riscv/locking: Strengthen spin_lock() and
 spin_unlock()
In-Reply-To: <20180226162426.GB17158@arm.com>
References: <1519301990-11766-1-git-send-email-parri.andrea@gmail.com>
 <20180222134004.GN25181@hirez.programming.kicks-ass.net>
 <20180222141249.GA14033@andrea>
 <82beae6a-2589-6136-b563-3946d7c4fc60@nvidia.com>
 <20180222181317.GI2855@linux.vnet.ibm.com>
 <20180222182717.GS25181@hirez.programming.kicks-ass.net>
 <563431d0-4fb5-9efd-c393-83cc5197e934@nvidia.com>
 <20180226142107.uid5vtv5r7zbso33@yquem.inria.fr>
 <CA+55aFwu5jat5vV-d6RVaUFo=Bjeyv-7eXWUJySg6xFUTnfbWQ@mail.gmail.com>
 <20180226162426.GB17158@arm.com>
Message-ID: <CA+55aFyT=+8m0mmpeegP8LOVtkCYv3O2vyO-ZcQdLAR=s309jg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Feb 26, 2018 at 8:24 AM, Will Deacon <will.deacon@arm.com> wrote:
>
> Strictly speaking, that's not what we've got implemented on arm64: only
> the read part of the RmW has Acquire semantics, but there is a total
> order on the lock/unlock operations for the lock.

Hmm.

I thought we had exactly that bug on some architecture with the queued
spinlocks, and people decided it was wrong.

But it's possible that I mis-remember, and that we decided it was ok after all.

> spin_lock(&lock);
> WRITE_ONCE(foo, 42);
>
> then another CPU could do:
>
> if (smp_load_acquire(&foo) == 42)
>         BUG_ON(!spin_is_locked(&lock));
>
> and that could fire. Is that relied on somewhere?

I have a distinct memory that we said the spinlock write is seen in
order, wrt the writes inside the spinlock, and the reason was
something very similar to the above, except that "spin_is_locked()"
was about our spin_unlock_wait().

Because we had something very much like the above in the exit path,
where we would look at some state and do "spin_unlock_wait()" and
expect to be guaranteed to be the last user after that.

But a few months ago we obviously got rid of spin_unlock_wait exactly
because people were worried about the semantics.

So maybe I just remember an older issue that simply became a non-issue
with that.

               Linus
