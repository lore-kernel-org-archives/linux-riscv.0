From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 10 Aug 2018 13:55:15 -0700 (PDT)
Subject: [PATCH v3 1/2] RISC-V: Define sys_riscv_flush_icache when SMP=n
In-Reply-To: <20180810184715.GA11259@roeck-us.net>
Message-ID: <mhng-f3c54437-a74c-4a33-b59e-84eaf3453c85@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, 10 Aug 2018 11:47:15 PDT (-0700), linux at roeck-us.net wrote:
> On Fri, Aug 10, 2018 at 11:27:37AM -0700, Palmer Dabbelt wrote:
>> On Fri, 10 Aug 2018 01:38:04 PDT (-0700), Christoph Hellwig wrote:
>> >On Thu, Aug 09, 2018 at 03:19:51PM -0700, Palmer Dabbelt wrote:
>> >>This would be necessary to make non-SMP builds work, but there is
>> >>another error in the implementation of our syscall linkage that actually
>> >>just causes sys_riscv_flush_icache to never build.  I've build tested
>> >>this on allnoconfig and allnoconfig+SMP=y, as well as defconfig like
>> >>normal.
>> >
>> >Would't it make sense to use COND_SYSCALL to stub out the syscall
>> >for !SMP builds?
>>
>> I'm not sure.  We can implement the syscall fine in !SMP, it's just that the
>> vDSO is expected to always eat these calls because in non-SMP mode you can
>> do a global fence.i by just doing a local fence.i (there's only one hart).
>>
>> The original rationale behind not having the syscall in non-SMP mode was to
>> limit the user ABI, but on looking again that seems like it's just a bit of
>> extra complexity that doesn't help anything.  It's already been demonstrated
>
> Doesn't this mean that some userspace code will only run if the kernel was
> compiled for SMP ? I always thought that was unacceptable.

Well, the officially sanctioned way to obtain this functionality is via a vDSO 
call.  On non-SMP systems it will never make the system call.  As a result we 
thought we'd keep it out of the ABI, but after looking again it seems yucky to 
do so.  Here's the vDSO entry, for reference:

    ENTRY(__vdso_flush_icache)
            .cfi_startproc
    #ifdef CONFIG_SMP
            li a7, __NR_riscv_flush_icache
            ecall
    #else
            fence.i
            li a0, 0
    #endif
            ret
            .cfi_endproc
    ENDPROC(__vdso_flush_icache)

Note that glibc has a fallback to make the system call if it can't find the 
vDSO entry, but then doesn't have a secondary fallback to emit a local fence.i 
if the system call doesn't exist.  It seems easier to fix the kernel to always 
provide the syscall and just call it a bug.
