From: zongbox@gmail.com (Zong Li)
Date: Mon, 12 Nov 2018 16:29:17 +0800
Subject: [PATCH 1/2] RISC-V: Request stat64 on RV32
In-Reply-To: <CAEn-LTpXnzSG-rVVvv_2cbxqY2vTchOKn6M0isRBovoq4jpZGw@mail.gmail.com>
References: <cover.1541995312.git.zongbox@gmail.com>
 <41e8cb18d321244ab7000f7dc0467b6ebc5cab8f.1541995312.git.zongbox@gmail.com>
 <CAEn-LTpXnzSG-rVVvv_2cbxqY2vTchOKn6M0isRBovoq4jpZGw@mail.gmail.com>
Message-ID: <CA+ZOyahQ-6biJazXCYr539-rCQHuJOz6QFuVB_Jv5EpfYuPrwg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

David Abdurachmanov <david.abdurachmanov@gmail.com> ? 2018?11?12? ?? ??2:19???
>
> On Mon, Nov 12, 2018 at 5:10 AM Zong Li <zongbox@gmail.com> wrote:
> >
> > The stat64 family that is used on 32-bit architectures to replace
> > newstat.
> >
> > Since commit 67314ec7b0250290cc85eaa7a2f88a8ddb9e8547 ("RISC-V: Request
> > newstat syscalls"), the RV32 build fail with undeclared 'sys_fstatat64'
> >
> > Signed-off-by: Zong Li <zong@andestech.com>
> > ---
> >  arch/riscv/include/asm/unistd.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
> > index eff7aa9..a4aade9 100644
> > --- a/arch/riscv/include/asm/unistd.h
> > +++ b/arch/riscv/include/asm/unistd.h
> > @@ -18,5 +18,6 @@
> >
> >  #define __ARCH_WANT_NEW_STAT
> >  #define __ARCH_WANT_SYS_CLONE
> > +#define __ARCH_WANT_STAT64
> >  #include <uapi/asm/unistd.h>
> >  #include <uapi/asm/syscalls.h>
> > --
>
> See: http://lists.infradead.org/pipermail/linux-riscv/2018-November/002087.html
>
> The plan is not to have old stat syscalls and support statx on
> riscv32, which is y2038 safe.
>
> The issue you see is a bug in include/uapi/asm-generic/unistd.h.
> Marcin (CC) already sent a patch to Arnd (CC) IIRC. Basically without
> __ARCH_WANT_NEW_STAT or __ARCH_WANT_STAT64 two macros are not defined:
> __NR3264_fstatat and __NR3264_fstat. Which is later used (without any
> guards):
>
> 763 #define __NR_newfstatat __NR3264_fstatat
> 764 #define __NR_fstat __NR3264_fstat

Nice. Thank you.
