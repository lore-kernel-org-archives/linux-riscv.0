From: arnd@arndb.de (Arnd Bergmann)
Date: Wed, 7 Nov 2018 22:09:39 +0100
Subject: [PATCH] riscv: add asm/unistd.h UAPI header
In-Reply-To: <CAEn-LTpQ5uTte2bBrEs3uLKtsckkKPUOP+jHw5k-DFAwGCS3WA@mail.gmail.com>
References: <CAK8P3a3JcztCSYBuu5ZJXaV83VNLv_1v3v-EKMR+tC1oOsQesw@mail.gmail.com>
 <mhng-3c26b2fb-0c11-42f2-9026-1113b200a7b2@palmer-si-x1c4>
 <CAEn-LTpQ5uTte2bBrEs3uLKtsckkKPUOP+jHw5k-DFAwGCS3WA@mail.gmail.com>
Message-ID: <CAK8P3a30Dmq3vp-+=jvVu8VMe+GKc9dU=+ZF0rzhFiUq2NuJ_w@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Nov 7, 2018 at 7:30 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
> On Wed, Nov 7, 2018 at 1:08 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> > On Mon, 05 Nov 2018 12:56:15 PST (-0800), Arnd Bergmann wrote:

> > The target is still the next glibc release (Feb 1st) for a stable RV32I ABI.
> > That's progressing well, with one last blocking issue related to some of our
> > floating-point emulation routines before we can submit the port.  This should
> > give us ample time to line up the ABIs correctly so everything works.
> >
> > So I think the correct answer here is to drop __ARCH_WANT_STAT64 from RISC-V.
> >
>
> Then if you agree I could do and send v2:
>
> +#ifdef __LP64__
> +#define __ARCH_WANT_NEW_STAT
> +#endif /* __LP64__ */

Looks good to me.

> Cannot use CONFIG_64BIT as in user space nothing defines it.
> Alternatively I could
> check for __riscv_xlen == 64.
>
> I found _LP64 and __LP64__ being used in kernel, incl. include/uapi/linux/rseq.h

I think older gcc versions were less consistent about those macros, which
is why I introduced __BITS_PER_LONG a long time ago. We now support
gcc-4.6 as the minimum, so using __LP64__ is reliable, and on RISC-V
we obviously have a much newer compiler anyway.

        Arnd
