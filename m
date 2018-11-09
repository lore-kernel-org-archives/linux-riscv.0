From: ldv@altlinux.org (Dmitry V. Levin)
Date: Sat, 10 Nov 2018 01:28:39 +0300
Subject: [PATCH 12/13] riscv: define syscall_get_arch()
In-Reply-To: <CAEn-LTpbzdpeWv8wqo_ptBw2t3Ypzzp0JcB+TGMG4NZbEGBnkw@mail.gmail.com>
References: <20181109031303.GA20906@altlinux.org>
 <20181109031712.GL21511@altlinux.org>
 <CAEn-LTpbzdpeWv8wqo_ptBw2t3Ypzzp0JcB+TGMG4NZbEGBnkw@mail.gmail.com>
Message-ID: <20181109222839.GB2054@altlinux.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Nov 09, 2018 at 07:59:13AM +0100, David Abdurachmanov wrote:
> On Fri, Nov 9, 2018 at 4:17 AM Dmitry V. Levin <ldv@altlinux.org> wrote:
> >
> > syscall_get_arch() is required to be implemented on all architectures
> > that use tracehook_report_syscall_entry() in order to extend
> > the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.
> 
> I have posted audit support patch for RISC-V in October. Pending review.
> It defines both AUDIT_ARCH_RISCV32 and AUDIT_ARCH_RISCV64.
> 
> See thread: http://lists.infradead.org/pipermail/linux-riscv/2018-October/001933.html

I'll take your version of RISC-V related change of include/uapi/linux/audit.h
to this series, thanks!

P.S. It would be great if you replied to me as well.


-- 
ldv
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 801 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20181110/54c932da/attachment.sig>
