From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 26 Oct 2018 23:07:20 -0700 (PDT)
Subject: [PATCH 2/2] RISC-V: Add support for SECCOMP
In-Reply-To: <CALCETrUSvugnh1JiLgn49c4_dw6F8bXiO52jdqiAKEn-CgzoXA@mail.gmail.com>
Message-ID: <mhng-d334eb95-7c80-4070-a053-d04e9b564b74@palmer-mbp2014>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 25 Oct 2018 14:02:20 PDT (-0700), luto at amacapital.net wrote:
> On Wed, Oct 24, 2018 at 2:42 PM Kees Cook <keescook@chromium.org> wrote:
>>
>> On Wed, Oct 24, 2018 at 1:40 PM, Palmer Dabbelt <palmer@sifive.com> wrote:
>> > From: "Wesley W. Terpstra" <wesley@sifive.com>
>> >
>> > This is a fairly straight-forward implementation of seccomp for RISC-V
>> > systems.
>> >
>> > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
>> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> > ---
>> >  arch/riscv/Kconfig                   | 18 ++++++++++++++++++
>> >  arch/riscv/include/asm/seccomp.h     | 10 ++++++++++
>> >  arch/riscv/include/asm/syscall.h     |  6 ++++++
>> >  arch/riscv/include/asm/thread_info.h |  1 +
>> >  include/uapi/linux/audit.h           |  1 +
>> >  5 files changed, 36 insertions(+)
>> >  create mode 100644 arch/riscv/include/asm/seccomp.h
>> >
>> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > index a344980287a5..28abe47602a1 100644
>> > --- a/arch/riscv/Kconfig
>> > +++ b/arch/riscv/Kconfig
>> > @@ -28,6 +28,7 @@ config RISCV
>> >         select GENERIC_STRNLEN_USER
>> >         select GENERIC_SMP_IDLE_THREAD
>> >         select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
>> > +       select HAVE_ARCH_SECCOMP_FILTER
>>
>> I think this patch is missing most of the actual seccomp glue?
>>
>> config HAVE_ARCH_SECCOMP_FILTER
>>         bool
>>         help
>>           An arch should select this symbol if it provides all of these things:
>>           - syscall_get_arch()
>>           - syscall_get_arguments()
>>           - syscall_rollback()
>>           - syscall_set_return_value()
>>           - SIGSYS siginfo_t support
>>           - secure_computing is called from a ptrace_event()-safe context
>>           - secure_computing return value is checked and a return value of -1
>>             results in the system call being skipped immediately.
>>           - seccomp syscall wired up
>>
>> I only see syscall_get_arch(). Nothing is using TIF_SECCOMP (I'd
>> expect a masked check in entry.S -- it seems like tracepoints are
>> getting missed too? I see it handled in ptrace.c but not checked in
>> entry.S?) There's no checking for seccomp in ptrace.c, etc.
>
> Hi RISC-V people:
>
> I strongly, strongly suggest that you rewrite your asm to work the way
> that x86's does: have a function called prepare_exit_to_usermode() and
> make it work more or less like x86's.  Doing all the exit work in asm
> like you are is just setting you up for a world of pain.

OK, thanks for the suggestion.  Next time we have to change it I'll try to take 
a look and figure out something sane.
