From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 22 Feb 2018 19:27:17 +0100
Subject: [RFC PATCH] riscv/locking: Strengthen spin_lock() and
 spin_unlock()
In-Reply-To: <20180222181317.GI2855@linux.vnet.ibm.com>
References: <1519301990-11766-1-git-send-email-parri.andrea@gmail.com>
 <20180222134004.GN25181@hirez.programming.kicks-ass.net>
 <20180222141249.GA14033@andrea>
 <82beae6a-2589-6136-b563-3946d7c4fc60@nvidia.com>
 <20180222181317.GI2855@linux.vnet.ibm.com>
Message-ID: <20180222182717.GS25181@hirez.programming.kicks-ass.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Feb 22, 2018 at 10:13:17AM -0800, Paul E. McKenney wrote:
> So we have something that is not all that rare in the Linux kernel
> community, namely two conflicting more-or-less concurrent changes.
> This clearly needs to be resolved, either by us not strengthening the
> Linux-kernel memory model in the way we were planning to or by you
> strengthening RISC-V to be no weaker than PowerPC for these sorts of
> externally viewed release-acquire situations.
> 
> Other thoughts?

Like said in the other email, I would _much_ prefer to not go weaker
than PPC, I find that PPC is already painfully weak at times.
