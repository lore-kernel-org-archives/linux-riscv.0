From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 10 Aug 2018 11:27:37 -0700 (PDT)
Subject: [PATCH v3 1/2] RISC-V: Define sys_riscv_flush_icache when SMP=n
In-Reply-To: <20180810083804.GA20415@infradead.org>
Message-ID: <mhng-341b5b76-2cd6-41e3-859a-6b1d926ba770@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, 10 Aug 2018 01:38:04 PDT (-0700), Christoph Hellwig wrote:
> On Thu, Aug 09, 2018 at 03:19:51PM -0700, Palmer Dabbelt wrote:
>> This would be necessary to make non-SMP builds work, but there is
>> another error in the implementation of our syscall linkage that actually
>> just causes sys_riscv_flush_icache to never build.  I've build tested
>> this on allnoconfig and allnoconfig+SMP=y, as well as defconfig like
>> normal.
>
> Would't it make sense to use COND_SYSCALL to stub out the syscall
> for !SMP builds?

I'm not sure.  We can implement the syscall fine in !SMP, it's just that the 
vDSO is expected to always eat these calls because in non-SMP mode you can do a 
global fence.i by just doing a local fence.i (there's only one hart).

The original rationale behind not having the syscall in non-SMP mode was to 
limit the user ABI, but on looking again that seems like it's just a bit of 
extra complexity that doesn't help anything.  It's already been demonstrated 
that nothing is checking the error because it's been silently slipping past 
userspace for six months, so the extra complexity seems like it'll just cause 
someone else to have to chase the bug in the future.

But I'm really OK either way.  Is there a precedent for what to do here?
