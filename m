From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 15 Oct 2018 01:40:13 -0700
Subject: [PATCH] RISC-V: Add FP register ptrace support for gdb.
In-Reply-To: <20181013005649.14379-1-jimw@sifive.com>
References: <20181013005649.14379-1-jimw@sifive.com>
Message-ID: <20181015084013.GB11826@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> I think there is room for improvement here, but not sure if that is required
> before this can be accepted.  I'm abusing the ELF_NGREG macro because we don't
> have one for FP registers, and the elf_greg_t type again because there isn't
> one for FP registers.

So why don't we have a proper macro / type for the FP registers?

> In the riscv_fpr_get function, I'm using a single call
> to user_regset_copyout which means effectively the entire fstate struct is
> being copied from kernel space to user space.  That may include some padding
> at the end of the structure.  I don't know if that is safe or not.

In general we should avoid copying padding to userspace as it might be
uninitialized.  If you can't avoid that the structures always need to be
zeroed explicitly first, which might to lead to security issues later
on.

> This could
> be fixed by using two user_regset_copyout calls with a little bit of extra
> complexity.  Similarly with riscv_fpr_set and user_regset_copyin.  This
> probably only works for targets that have the D extension.  Not sure if
> this matters; I don't have a system with only F support, or no FP support,
> to test against.

The kernel currently assumes the D extension is presend if the F
extension is present.

I don't really know enough about the ptrace code to have useful
comments, but the code should depend on CONFIG_FPU, otherwise builds
without support for the F and D extensions will fail.
