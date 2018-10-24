From: keescook@chromium.org (Kees Cook)
Date: Wed, 24 Oct 2018 15:34:45 -0700
Subject: [PATCH 2/2] RISC-V: Add support for SECCOMP
In-Reply-To: <CAGXu5jJ7gmVXZE+iksW99c6bHEV2rSOG+boQDRGmMSDa9HOh_A@mail.gmail.com>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-3-palmer@sifive.com>
 <CAGXu5jJ7gmVXZE+iksW99c6bHEV2rSOG+boQDRGmMSDa9HOh_A@mail.gmail.com>
Message-ID: <CAGXu5j+N5Du=c-dfGd-_rLjE3NEeN+MXTsKjt2APA1U1xwwSag@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Oct 24, 2018 at 2:42 PM, Kees Cook <keescook@chromium.org> wrote:
> config HAVE_ARCH_SECCOMP_FILTER
>         bool
>         help
>           An arch should select this symbol if it provides all of these things:
>           - syscall_get_arch()
>           - syscall_get_arguments()
>           - syscall_rollback()
>           - syscall_set_return_value()
>           - SIGSYS siginfo_t support
>           - secure_computing is called from a ptrace_event()-safe context
>           - secure_computing return value is checked and a return value of -1
>             results in the system call being skipped immediately.
>           - seccomp syscall wired up

Oh, and I should add to this list, "passes
tools/testing/selftests/seccomp/seccomp_bpf test". :)

-- 
Kees Cook
