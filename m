From: hch@infradead.org (Christoph Hellwig)
Date: Fri, 10 Aug 2018 01:38:04 -0700
Subject: [PATCH v3 1/2] RISC-V: Define sys_riscv_flush_icache when SMP=n
In-Reply-To: <20180809221952.24260-2-palmer@sifive.com>
References: <20180809221952.24260-1-palmer@sifive.com>
 <20180809221952.24260-2-palmer@sifive.com>
Message-ID: <20180810083804.GA20415@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 09, 2018 at 03:19:51PM -0700, Palmer Dabbelt wrote:
> This would be necessary to make non-SMP builds work, but there is
> another error in the implementation of our syscall linkage that actually
> just causes sys_riscv_flush_icache to never build.  I've build tested
> this on allnoconfig and allnoconfig+SMP=y, as well as defconfig like
> normal.

Would't it make sense to use COND_SYSCALL to stub out the syscall
for !SMP builds?
