From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Tue, 30 Oct 2018 08:23:21 +0100
Subject: [PATCH] riscv: fix trace_sys_exit hook
In-Reply-To: <20181029121516.29574-1-david.abdurachmanov@gmail.com>
References: <20181029121516.29574-1-david.abdurachmanov@gmail.com>
Message-ID: <CAEn-LTpaTxPmb0De=834S5G6fA_Oe+mTN0bYk+iR4Amb4Sk1wA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Oct 29, 2018 at 1:15 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
>
> Depends on:
> http://lists.infradead.org/pipermail/linux-riscv/2018-October/001931.html
>
> Why we don't have HAVE_SYSCALL_TRACEPOINTS in arch/riscv/Kconfig?
>

I looked this morning into Documentation/trace/ftrace-design.rst again.

Of all the things the document describes we are only missing
HAVE_SYSCALL_TRACEPOINTS in Kconfig, yet we already have it
implemented in ptrace.c (+ this minor fix). Reading document, I think,
we check all the boxes needed for HAVE_SYSCALL_TRACEPOINTS.

I assume it was just missed (?) and will do v2 later on.

david
