From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Fri, 9 Nov 2018 07:59:13 +0100
Subject: [PATCH 12/13] riscv: define syscall_get_arch()
In-Reply-To: <20181109031712.GL21511@altlinux.org>
References: <20181109031303.GA20906@altlinux.org>
 <20181109031712.GL21511@altlinux.org>
Message-ID: <CAEn-LTpbzdpeWv8wqo_ptBw2t3Ypzzp0JcB+TGMG4NZbEGBnkw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Nov 9, 2018 at 4:17 AM Dmitry V. Levin <ldv@altlinux.org> wrote:
>
> syscall_get_arch() is required to be implemented on all architectures
> that use tracehook_report_syscall_entry() in order to extend
> the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.
>

I have posted audit support patch for RISC-V in October. Pending review.
It defines both AUDIT_ARCH_RISCV32 and AUDIT_ARCH_RISCV64.

See thread: http://lists.infradead.org/pipermail/linux-riscv/2018-October/001933.html

david
