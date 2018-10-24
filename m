From: keescook@chromium.org (Kees Cook)
Date: Wed, 24 Oct 2018 14:42:03 -0700
Subject: [PATCH 2/2] RISC-V: Add support for SECCOMP
In-Reply-To: <20181024204036.8799-3-palmer@sifive.com>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-3-palmer@sifive.com>
Message-ID: <CAGXu5jJ7gmVXZE+iksW99c6bHEV2rSOG+boQDRGmMSDa9HOh_A@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Oct 24, 2018 at 1:40 PM, Palmer Dabbelt <palmer@sifive.com> wrote:
> From: "Wesley W. Terpstra" <wesley@sifive.com>
>
> This is a fairly straight-forward implementation of seccomp for RISC-V
> systems.
>
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  arch/riscv/Kconfig                   | 18 ++++++++++++++++++
>  arch/riscv/include/asm/seccomp.h     | 10 ++++++++++
>  arch/riscv/include/asm/syscall.h     |  6 ++++++
>  arch/riscv/include/asm/thread_info.h |  1 +
>  include/uapi/linux/audit.h           |  1 +
>  5 files changed, 36 insertions(+)
>  create mode 100644 arch/riscv/include/asm/seccomp.h
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a344980287a5..28abe47602a1 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -28,6 +28,7 @@ config RISCV
>         select GENERIC_STRNLEN_USER
>         select GENERIC_SMP_IDLE_THREAD
>         select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
> +       select HAVE_ARCH_SECCOMP_FILTER

I think this patch is missing most of the actual seccomp glue?

config HAVE_ARCH_SECCOMP_FILTER
        bool
        help
          An arch should select this symbol if it provides all of these things:
          - syscall_get_arch()
          - syscall_get_arguments()
          - syscall_rollback()
          - syscall_set_return_value()
          - SIGSYS siginfo_t support
          - secure_computing is called from a ptrace_event()-safe context
          - secure_computing return value is checked and a return value of -1
            results in the system call being skipped immediately.
          - seccomp syscall wired up

I only see syscall_get_arch(). Nothing is using TIF_SECCOMP (I'd
expect a masked check in entry.S -- it seems like tracepoints are
getting missed too? I see it handled in ptrace.c but not checked in
entry.S?) There's no checking for seccomp in ptrace.c, etc.

At the very least, I think the Kconfigs should not be included in this
patch. The other things are needed, but without everything else,
seccomp isn't actually available. :)

Reading the per-arch Kconfigs, I am reminded I still need to move
CONFIG_SECCOMP up into arch/Kconfig. :P

-Kees

-- 
Kees Cook
