Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F15C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 13:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5y+NRfLbl65zviEofuHoF6sRse1DC+2VdMI4lVTJusU=; b=AVzGk5Z0lsC99+
	swK7YfjM2JFGfnBQ+L0swAt2nZX3toZl4vDnaQeIQ/KAj7i5w5b3Bb3m4RgfbXL44HBbcnmMt2SoH
	ZrBCqYgPiZT+tcnn//VjHlZJTEZoFqRwAL5ZGoqFTbYNZVL8oN7SDu9gR58CfLtYd0tATTsugtJXv
	pNqQNRDTV49SZ4GaQ6FOrHm0BU1s7V1cW7GrDcSdm2pU2PxY+Pc74nljYydh9VkLKzHuskXdZGA32
	mI8kyyg7foBtlP0dOrg5oJ7pipgdQlk5PWeMUGbGTQr4Bd5LmMKT7cbX2blYBxDOXqcjL3PpCCDTX
	Z9I778zlfuHNKVZdIEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHla-001x4c-BS; Thu, 09 Jun 2022 13:00:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHlU-001x1L-I6; Thu, 09 Jun 2022 13:00:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A0C4EB82DD0;
	Thu,  9 Jun 2022 12:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C621CC34114;
	Thu,  9 Jun 2022 12:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654779593;
	bh=nzEK1QIv+0tFYoCD6R99p0Aqj3afNfZxkCG+vFs8wK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KzJVoheObhl6qshf52rKP9EHpn2Xt7sVGKj5ICkgKtc2fWpcVodL9tDErwEZayDAF
	 AHBQMsEYGtNiPxJCVwfJsPUjn+IL9pv+m+aCwWG/rP+idyO9NrFNW8L4dMgdrn8FnF
	 FTF7O1RFgjYrub3HRargNLGDTrOctdXZ7ewu7xfNOKfXfTOFB1VIUC3gKQpoH76efW
	 459YKdsw+5yFEBmz/09TgWBTfrvNOhhpDdS4Wz3eKHCGRZY8mHVcGzY1CzABjbEZ0w
	 IH2Xs75xUZGg4nSQVa5DyvR9sYYD0h66HRwBGLEgqAFR5DtrIXi0u2k74u1lU0v7JO
	 bZAL+nK5nrfhw==
Date: Thu, 9 Jun 2022 15:57:54 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jarkko Sakkinen <jarkko@profian.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Nathaniel McCallum <nathaniel@profian.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Kees Cook <keescook@chromium.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Marco Elver <elver@google.com>, Dan Li <ashimida@linux.alibaba.com>,
	Sami Tolvanen <samitolvanen@google.com>, Song Liu <song@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chen Zhongjin <chenzhongjin@huawei.com>,
	Nicolas Pitre <nico@fluxnic.net>, Mark Brown <broonie@kernel.org>,
	Luis Machado <luis.machado@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
	Guenter Roeck <linux@roeck-us.net>,
	Dave Anglin <dave.anglin@bell.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Jordan Niethe <jniethe5@gmail.com>, Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Changbin Du <changbin.du@intel.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Liao Chang <liaochang1@huawei.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Wu Caize <zepan@sipeed.com>, Emil Renner Berthing <kernel@esmil.dk>,
	Alexander Egorenkov <egorenar@linux.ibm.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	Tobias Huschle <huschle@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Miroslav Benes <mbenes@suse.cz>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Aaron Tomlin <atomlin@redhat.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-ID: <YqHuUsevcvaaunVq@iki.fi>
References: <20220608000014.3054333-1-jarkko@profian.com>
 <f2030fb4-4978-068b-6250-5bd5b2746675@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f2030fb4-4978-068b-6250-5bd5b2746675@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_055956_949357_E5A23B0C 
X-CRM114-Status: GOOD (  50.44  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 09, 2022 at 08:30:12AM +0000, Christophe Leroy wrote:
> =

> =

> Le 08/06/2022 =E0 01:59, Jarkko Sakkinen a =E9crit=A0:
> > [You don't often get email from jarkko@profian.com. Learn why this is i=
mportant at https://aka.ms/LearnAboutSenderIdentification ]
> > =

> > Tracing with kprobes while running a monolithic kernel is currently
> > impossible because CONFIG_KPROBES is dependent of CONFIG_MODULES.  This
> > dependency is a result of kprobes code using the module allocator for t=
he
> > trampoline code.
> > =

> > Detaching kprobes from modules helps to squeeze down the user space,
> > e.g. when developing new core kernel features, while still having all
> > the nice tracing capabilities.
> =

> Nice idea, could also be nice to have BPF without MODULES.

Yeah, for sure. You have to start from somewhere :-) I'd guess this
a step forward also for BPF.

> > =

> > For kernel/ and arch/*, move module_alloc() and module_memfree() to
> > module_alloc.c, and compile as part of vmlinux when either CONFIG_MODUL=
ES
> > or CONFIG_KPROBES is enabled.  In addition, flag kernel module specific
> > code with CONFIG_MODULES.
> =

> Nice, but that's not enough. You have to audit every peace of code that =

> depends on CONFIG_MODULES and see if it needs to be activated for your =

> case as well. For instance some powerpc configurations don't honor exec =

> page faults on kernel pages when CONFIG_MODULES is not selected.

Thanks for pointing this out. With "every peace of code" you probably
are referring to the 13 arch-folders, which support kprobes in the first
place (just checking)?

> > As the result, kprobes can be used with a monolithic kernel.
> > =

> > Signed-off-by: Jarkko Sakkinen <jarkko@profian.com>
> =

> I think this patch should be split in a several patches, one (or even =

> one per architectures ?) to make modules_alloc() independant of =

> CONFIG_MODULES, then a patch to make CONFIG_KPROBES independant on =

> CONFIG_MOUDLES.

Agreed. And also because of your previous remark, i.e. each arch needs
it own conclusions of the changes. I purposely did this first as a one
patch in order to get a better picture of the situation.

> > ---
> > Tested with the help of BuildRoot and QEMU:
> > - arm (function tracer)
> > - arm64 (function tracer)
> > - mips (function tracer)
> > - powerpc (function tracer)
> > - riscv (function tracer)
> > - s390 (function tracer)
> > - sparc (function tracer)
> > - x86 (function tracer)
> > - sh (function tracer, for the "pure" kernel/modules_alloc.c path)
> > ---
> >   arch/Kconfig                       |  1 -
> >   arch/arm/kernel/Makefile           |  5 +++
> >   arch/arm/kernel/module.c           | 32 ----------------
> >   arch/arm/kernel/module_alloc.c     | 42 ++++++++++++++++++++
> >   arch/arm64/kernel/Makefile         |  5 +++
> >   arch/arm64/kernel/module.c         | 47 -----------------------
> >   arch/arm64/kernel/module_alloc.c   | 57 ++++++++++++++++++++++++++++
> >   arch/mips/kernel/Makefile          |  5 +++
> >   arch/mips/kernel/module.c          |  9 -----
> >   arch/mips/kernel/module_alloc.c    | 18 +++++++++
> >   arch/parisc/kernel/Makefile        |  5 +++
> >   arch/parisc/kernel/module.c        | 11 ------
> >   arch/parisc/kernel/module_alloc.c  | 23 +++++++++++
> >   arch/powerpc/kernel/Makefile       |  5 +++
> >   arch/powerpc/kernel/module.c       | 37 ------------------
> >   arch/powerpc/kernel/module_alloc.c | 47 +++++++++++++++++++++++
> =

> You are missing necessary changes for powerpc.
> =

> On powerpc 8xx or powerpc 603, software TLB handlers don't honor =

> instruction TLB miss when CONFIG_MODULES are not set, look into =

> head_8xx.S and head_book3s_32.S
> =

> On powerpc book3s/32, all kernel space is set to NX except the module =

> segment. When CONFIG_MODULES is all space is set NX. See =

> mmu_mark_initmem_nx() and is_module_segment().

Thank you! I'll go this through and also try to build an environment
with BuildRoot where I can test-run this configuration.

> >   arch/riscv/kernel/Makefile         |  5 +++
> >   arch/riscv/kernel/module.c         | 10 -----
> >   arch/riscv/kernel/module_alloc.c   | 19 ++++++++++
> >   arch/s390/kernel/Makefile          |  5 +++
> >   arch/s390/kernel/module.c          | 17 ---------
> >   arch/s390/kernel/module_alloc.c    | 33 ++++++++++++++++
> >   arch/sparc/kernel/Makefile         |  5 +++
> >   arch/sparc/kernel/module.c         | 30 ---------------
> >   arch/sparc/kernel/module_alloc.c   | 39 +++++++++++++++++++
> >   arch/x86/kernel/Makefile           |  5 +++
> >   arch/x86/kernel/module.c           | 50 ------------------------
> >   arch/x86/kernel/module_alloc.c     | 61 ++++++++++++++++++++++++++++++
> >   kernel/Makefile                    |  5 +++
> >   kernel/kprobes.c                   | 10 +++++
> >   kernel/module/main.c               | 17 ---------
> >   kernel/module_alloc.c              | 26 +++++++++++++
> >   kernel/trace/trace_kprobe.c        | 10 ++++-
> >   33 files changed, 434 insertions(+), 262 deletions(-)
> >   create mode 100644 arch/arm/kernel/module_alloc.c
> >   create mode 100644 arch/arm64/kernel/module_alloc.c
> >   create mode 100644 arch/mips/kernel/module_alloc.c
> >   create mode 100644 arch/parisc/kernel/module_alloc.c
> >   create mode 100644 arch/powerpc/kernel/module_alloc.c
> >   create mode 100644 arch/riscv/kernel/module_alloc.c
> >   create mode 100644 arch/s390/kernel/module_alloc.c
> >   create mode 100644 arch/sparc/kernel/module_alloc.c
> >   create mode 100644 arch/x86/kernel/module_alloc.c
> >   create mode 100644 kernel/module_alloc.c
> > =

> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index fcf9a41a4ef5..e8e3e7998a2e 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -39,7 +39,6 @@ config GENERIC_ENTRY
> > =

> >   config KPROBES
> >          bool "Kprobes"
> > -       depends on MODULES
> >          depends on HAVE_KPROBES
> >          select KALLSYMS
> >          select TASKS_RCU if PREEMPTION
> =

> > diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> > index 2e2a2a9bcf43..5a811cdf230b 100644
> > --- a/arch/powerpc/kernel/Makefile
> > +++ b/arch/powerpc/kernel/Makefile
> > @@ -103,6 +103,11 @@ obj-$(CONFIG_HIBERNATION)  +=3D swsusp_$(BITS).o
> >   endif
> >   obj64-$(CONFIG_HIBERNATION)    +=3D swsusp_asm64.o
> >   obj-$(CONFIG_MODULES)          +=3D module.o module_$(BITS).o
> > +ifeq ($(CONFIG_MODULES),y)
> > +obj-y                          +=3D module_alloc.o
> > +else
> > +obj-$(CONFIG_KPROBES)          +=3D module_alloc.o
> > +endif
> =

> Why not just do:
> =

> obj-$(CONFIG_MODULES)          +=3D module_alloc.o
> obj-$(CONFIG_KPROBES)          +=3D module_alloc.o
> =

> However, a new hidden config item (eg: CONFIG_DYNAMIC_TEXT) selected by =

> both CONFIG_MODULES and CONFIG_KPROBES would make like easier when =

> you'll come to do the changes required.

I'll do this. Russell King also pointed out the same thing.

> >   obj-$(CONFIG_44x)              +=3D cpu_setup_44x.o
> >   obj-$(CONFIG_PPC_FSL_BOOK3E)   +=3D cpu_setup_fsl_booke.o
> >   obj-$(CONFIG_PPC_DOORBELL)     +=3D dbell.o
> > diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
> > index f6d6ae0a1692..b30e00964a60 100644
> > --- a/arch/powerpc/kernel/module.c
> > +++ b/arch/powerpc/kernel/module.c
> > @@ -88,40 +88,3 @@ int module_finalize(const Elf_Ehdr *hdr,
> > =

> >          return 0;
> >   }
> > -
> > -static __always_inline void *
> > -__module_alloc(unsigned long size, unsigned long start, unsigned long =
end, bool nowarn)
> > -{
> > -       pgprot_t prot =3D strict_module_rwx_enabled() ? PAGE_KERNEL : P=
AGE_KERNEL_EXEC;
> > -       gfp_t gfp =3D GFP_KERNEL | (nowarn ? __GFP_NOWARN : 0);
> > -
> > -       /*
> > -        * Don't do huge page allocations for modules yet until more te=
sting
> > -        * is done. STRICT_MODULE_RWX may require extra work to support=
 this
> > -        * too.
> > -        */
> > -       return __vmalloc_node_range(size, 1, start, end, gfp, prot,
> > -                                   VM_FLUSH_RESET_PERMS,
> > -                                   NUMA_NO_NODE, __builtin_return_addr=
ess(0));
> > -}
> > -
> > -void *module_alloc(unsigned long size)
> > -{
> > -#ifdef MODULES_VADDR
> > -       unsigned long limit =3D (unsigned long)_etext - SZ_32M;
> > -       void *ptr =3D NULL;
> > -
> > -       BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
> > -
> > -       /* First try within 32M limit from _etext to avoid branch tramp=
olines */
> > -       if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
> > -               ptr =3D __module_alloc(size, limit, MODULES_END, true);
> > -
> > -       if (!ptr)
> > -               ptr =3D __module_alloc(size, MODULES_VADDR, MODULES_END=
, false);
> > -
> > -       return ptr;
> > -#else
> > -       return __module_alloc(size, VMALLOC_START, VMALLOC_END, false);
> > -#endif
> > -}
> > diff --git a/arch/powerpc/kernel/module_alloc.c b/arch/powerpc/kernel/m=
odule_alloc.c
> > new file mode 100644
> > index 000000000000..48541c27ce46
> > --- /dev/null
> > +++ b/arch/powerpc/kernel/module_alloc.c
> > @@ -0,0 +1,47 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *  Kernel module help for powerpc.
> > + *  Copyright (C) 2001, 2003 Rusty Russell IBM Corporation.
> > + *  Copyright (C) 2008 Freescale Semiconductor, Inc.
> > + */
> > +
> > +#include <linux/mm.h>
> > +#include <linux/moduleloader.h>
> > +#include <linux/vmalloc.h>
> > +
> > +static __always_inline void *
> > +__module_alloc(unsigned long size, unsigned long start, unsigned long =
end, bool nowarn)
> > +{
> > +       pgprot_t prot =3D strict_module_rwx_enabled() ? PAGE_KERNEL : P=
AGE_KERNEL_EXEC;
> > +       gfp_t gfp =3D GFP_KERNEL | (nowarn ? __GFP_NOWARN : 0);
> > +
> > +       /*
> > +        * Don't do huge page allocations for modules yet until more te=
sting
> > +        * is done. STRICT_MODULE_RWX may require extra work to support=
 this
> > +        * too.
> > +        */
> > +       return __vmalloc_node_range(size, 1, start, end, gfp, prot,
> > +                                   VM_FLUSH_RESET_PERMS,
> > +                                   NUMA_NO_NODE, __builtin_return_addr=
ess(0));
> > +}
> > +
> > +void *module_alloc(unsigned long size)
> > +{
> > +#ifdef MODULES_VADDR
> =

> Is MODULES_VADDR defined even when CONFIG_MODULES is not ?

Yes, by this in ppc's asm/pgtable.h:

#ifdef CONFIG_PPC_BOOK3S
#include <asm/book3s/pgtable.h>
#else
#include <asm/nohash/pgtable.h>
#endif /* !CONFIG_PPC_BOOK3S */

> > +       unsigned long limit =3D (unsigned long)_etext - SZ_32M;
> > +       void *ptr =3D NULL;
> > +
> > +       BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
> > +
> > +       /* First try within 32M limit from _etext to avoid branch tramp=
olines */
> > +       if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
> > +               ptr =3D __module_alloc(size, limit, MODULES_END, true);
> > +
> > +       if (!ptr)
> > +               ptr =3D __module_alloc(size, MODULES_VADDR, MODULES_END=
, false);
> > +
> > +       return ptr;
> > +#else
> > +       return __module_alloc(size, VMALLOC_START, VMALLOC_END, false);
> > +#endif
> > +}
> =

> > diff --git a/kernel/Makefile b/kernel/Makefile
> > index 318789c728d3..2981fe42060d 100644
> > --- a/kernel/Makefile
> > +++ b/kernel/Makefile
> > @@ -53,6 +53,11 @@ obj-y +=3D livepatch/
> >   obj-y +=3D dma/
> >   obj-y +=3D entry/
> >   obj-$(CONFIG_MODULES) +=3D module/
> > +ifeq ($(CONFIG_MODULES),y)
> > +obj-y +=3D module_alloc.o
> > +else
> > +obj-$(CONFIG_KPROBES) +=3D module_alloc.o
> > +endif
> =

> Same comment, could be:
> =

> obj-$(CONFIG_MODULES)          +=3D module_alloc.o
> obj-$(CONFIG_KPROBES)          +=3D module_alloc.o

Ditto.

> =

> > =

> >   obj-$(CONFIG_KCMP) +=3D kcmp.o
> >   obj-$(CONFIG_FREEZER) +=3D freezer.o
> > diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> > index f214f8c088ed..3f9876374cd3 100644
> > --- a/kernel/kprobes.c
> > +++ b/kernel/kprobes.c
> > @@ -1569,6 +1569,7 @@ static int check_kprobe_address_safe(struct kprob=
e *p,
> >                  goto out;
> >          }
> > =

> > +#ifdef CONFIG_MODULES
> >          /* Check if 'p' is probing a module. */
> >          *probed_mod =3D __module_text_address((unsigned long) p->addr);
> >          if (*probed_mod) {
> > @@ -1592,6 +1593,8 @@ static int check_kprobe_address_safe(struct kprob=
e *p,
> >                          ret =3D -ENOENT;
> >                  }
> >          }
> > +#endif
> > +
> >   out:
> >          preempt_enable();
> >          jump_label_unlock();
> > @@ -2475,6 +2478,7 @@ int kprobe_add_area_blacklist(unsigned long start=
, unsigned long end)
> >          return 0;
> >   }
> > =

> > +#ifdef CONFIG_MODULES
> >   /* Remove all symbols in given area from kprobe blacklist */
> >   static void kprobe_remove_area_blacklist(unsigned long start, unsigne=
d long end)
> >   {
> > @@ -2492,6 +2496,7 @@ static void kprobe_remove_ksym_blacklist(unsigned=
 long entry)
> >   {
> >          kprobe_remove_area_blacklist(entry, entry + 1);
> >   }
> > +#endif /* CONFIG_MODULES */
> > =

> >   int __weak arch_kprobe_get_kallsym(unsigned int *symnum, unsigned lon=
g *value,
> >                                     char *type, char *sym)
> > @@ -2557,6 +2562,7 @@ static int __init populate_kprobe_blacklist(unsig=
ned long *start,
> >          return ret ? : arch_populate_kprobe_blacklist();
> >   }
> > =

> > +#ifdef CONFIG_MODULES
> >   static void add_module_kprobe_blacklist(struct module *mod)
> >   {
> >          unsigned long start, end;
> > @@ -2658,6 +2664,7 @@ static struct notifier_block kprobe_module_nb =3D=
 {
> >          .notifier_call =3D kprobes_module_callback,
> >          .priority =3D 0
> >   };
> > +#endif /* CONFIG_MODULES */
> > =

> >   void kprobe_free_init_mem(void)
> >   {
> > @@ -2717,8 +2724,11 @@ static int __init init_kprobes(void)
> >          err =3D arch_init_kprobes();
> >          if (!err)
> >                  err =3D register_die_notifier(&kprobe_exceptions_nb);
> > +
> > +#ifdef CONFIG_MODULES
> >          if (!err)
> >                  err =3D register_module_notifier(&kprobe_module_nb);
> > +#endif
> > =

> >          kprobes_initialized =3D (err =3D=3D 0);
> >          kprobe_sysctls_init();
> > diff --git a/kernel/module/main.c b/kernel/module/main.c
> > index fed58d30725d..7fa182b78550 100644
> > --- a/kernel/module/main.c
> > +++ b/kernel/module/main.c
> > @@ -1121,16 +1121,6 @@ resolve_symbol_wait(struct module *mod,
> >          return ksym;
> >   }
> > =

> > -void __weak module_memfree(void *module_region)
> > -{
> > -       /*
> > -        * This memory may be RO, and freeing RO memory in an interrupt=
 is not
> > -        * supported by vmalloc.
> > -        */
> > -       WARN_ON(in_interrupt());
> > -       vfree(module_region);
> > -}
> > -
> >   void __weak module_arch_cleanup(struct module *mod)
> >   {
> >   }
> > @@ -1606,13 +1596,6 @@ static void dynamic_debug_remove(struct module *=
mod, struct _ddebug *debug)
> >                  ddebug_remove_module(mod->name);
> >   }
> > =

> > -void * __weak module_alloc(unsigned long size)
> > -{
> > -       return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
> > -                       GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PE=
RMS,
> > -                       NUMA_NO_NODE, __builtin_return_address(0));
> > -}
> > -
> >   bool __weak module_init_section(const char *name)
> >   {
> >          return strstarts(name, ".init");
> > diff --git a/kernel/module_alloc.c b/kernel/module_alloc.c
> > new file mode 100644
> > index 000000000000..26a4c60998ad
> > --- /dev/null
> > +++ b/kernel/module_alloc.c
> > @@ -0,0 +1,26 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (C) 2002 Richard Henderson
> > + * Copyright (C) 2001 Rusty Russell, 2002, 2010 Rusty Russell IBM.
> > + */
> > +
> > +#include <linux/mm.h>
> > +#include <linux/moduleloader.h>
> > +#include <linux/vmalloc.h>
> > +
> > +void * __weak module_alloc(unsigned long size)
> > +{
> > +       return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
> > +                       GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PE=
RMS,
> > +                       NUMA_NO_NODE, __builtin_return_address(0));
> > +}
> > +
> > +void __weak module_memfree(void *module_region)
> > +{
> > +       /*
> > +        * This memory may be RO, and freeing RO memory in an interrupt=
 is not
> > +        * supported by vmalloc.
> > +        */
> > +       WARN_ON(in_interrupt());
> > +       vfree(module_region);
> > +}
> > diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
> > index 93507330462c..050b2975332e 100644
> > --- a/kernel/trace/trace_kprobe.c
> > +++ b/kernel/trace/trace_kprobe.c
> > @@ -101,6 +101,7 @@ static nokprobe_inline bool trace_kprobe_has_gone(s=
truct trace_kprobe *tk)
> >          return kprobe_gone(&tk->rp.kp);
> >   }
> > =

> > +#ifdef CONFIG_MODULES
> >   static nokprobe_inline bool trace_kprobe_within_module(struct trace_k=
probe *tk,
> >                                                   struct module *mod)
> >   {
> > @@ -109,11 +110,13 @@ static nokprobe_inline bool trace_kprobe_within_m=
odule(struct trace_kprobe *tk,
> > =

> >          return strncmp(module_name(mod), name, len) =3D=3D 0 && name[l=
en] =3D=3D ':';
> >   }
> > +#endif /* CONFIG_MODULES */
> > =

> >   static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kp=
robe *tk)
> >   {
> > +       bool ret =3D false;
> > +#ifdef CONFIG_MODULES
> >          char *p;
> > -       bool ret;
> > =

> >          if (!tk->symbol)
> >                  return false;
> > @@ -125,6 +128,7 @@ static nokprobe_inline bool trace_kprobe_module_exi=
st(struct trace_kprobe *tk)
> >          ret =3D !!find_module(tk->symbol);
> >          rcu_read_unlock_sched();
> >          *p =3D ':';
> > +#endif /* CONFIG_MODULES */
> > =

> >          return ret;
> >   }
> > @@ -668,6 +672,7 @@ static int register_trace_kprobe(struct trace_kprob=
e *tk)
> >          return ret;
> >   }
> > =

> > +#ifdef CONFIG_MODULES
> >   /* Module notifier call back, checking event on the module */
> >   static int trace_kprobe_module_callback(struct notifier_block *nb,
> >                                         unsigned long val, void *data)
> > @@ -702,6 +707,7 @@ static struct notifier_block trace_kprobe_module_nb=
 =3D {
> >          .notifier_call =3D trace_kprobe_module_callback,
> >          .priority =3D 1   /* Invoked after kprobe module callback */
> >   };
> > +#endif /* CONFIG_MODULES */
> > =

> >   static int __trace_kprobe_create(int argc, const char *argv[])
> >   {
> > @@ -1896,8 +1902,10 @@ static __init int init_kprobe_trace_early(void)
> >          if (ret)
> >                  return ret;
> > =

> > +#ifdef CONFIG_MODULES
> >          if (register_module_notifier(&trace_kprobe_module_nb))
> >                  return -EINVAL;
> > +#endif /* CONFIG_MODULES */
> > =

> >          return 0;
> >   }
> > --
> > 2.36.1
> > =


Thanks for the well-considered remarks!

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
