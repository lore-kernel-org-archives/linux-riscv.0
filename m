Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9A3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 21:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxjsPCTD2DJVArIoZXWlRBk8c3RInoJi/K+LhPxNr/k=; b=P4oKbZRZ+Qgy3t
	dJ3H+mXmodIRhEAvRK3DccMwvFA+/+k5/nJbd8Jt2Bc/dmH0cpeRUG7g/gAopVqgiP84d/orEV1IG
	cPaFT+0EBELs/Q4KruayMLOKDXXO5XvYp7gofS8TYUZDMuuCo1YB+7i+hz5kcLlVO8uMdVjssn4dE
	RIIpzg4yYKvvcrF710HRc1wKBv/k0azl+uyCvA0nonDm8vb5jxA0Mpm/+tEC5EU0YK/UigOEJ0xOJ
	p44S4YYzE6Krxch3D7rtii3gc8oEIEjPQyrvzNs7C3DS3sYSzORoR/cyP8H/+6gQIMpqYL2ldAnjU
	7TgN5KNt5G4MbF/2cIxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1aWr-00GRmT-Gi; Wed, 15 Jun 2022 21:26:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1aWm-00GRk6-Vl; Wed, 15 Jun 2022 21:26:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E13AEB8217C;
	Wed, 15 Jun 2022 21:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0651C3411A;
	Wed, 15 Jun 2022 21:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655328373;
	bh=C7SBMi7ghKBLQo7MHmIHsy7eWtSdXq8eTAqAwVvVPfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rcYBdB9v2iJolM6fd27OAYzgDAh4Cy36Z7LWBpda/a/SgPCwn9xHu/xsTl0o0PoAY
	 SDWwvGa6oWW820UDU6Jc02SuNLbRnkJFOQVwHgARir+e+zZY2YYmSygPZks1a6y3Ds
	 URcIAW8dSzvf2PvwOefgZcSyVjUseugdFY03G/WaZrjHpsue9BMdMgV/6QSVfrrb8T
	 HBYs8Z1/kOPfZU6aIUJtdFd1gH4nSJbil/mnEhsnjRnWKGFlJqJnnCZ5QjEvuHpB9f
	 WFwZw2bJeWIQ2/RB+5zvSIptEsCuVnGlMNxUSbksXDmUo/nUflwAwou4zwqCvuobWa
	 8/YxoqDiXQD1Q==
Date: Thu, 16 Jun 2022 00:24:04 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	Christoph Hellwig <hch@infradead.org>,
	Jarkko Sakkinen <jarkko@profian.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Nathaniel McCallum <nathaniel@profian.com>,
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
Message-ID: <YqpN9NAkAKhgiunQ@iki.fi>
References: <20220608000014.3054333-1-jarkko@profian.com>
 <YqGlmpbx8HTrWmpF@shell.armlinux.org.uk>
 <YqH5TfN9w35kHFLU@bombadil.infradead.org>
 <Yqh+k7Udth0IOBrd@iki.fi>
 <144b7e90-5d75-7e2c-4e54-8a73f914dfdf@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <144b7e90-5d75-7e2c-4e54-8a73f914dfdf@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_142617_362303_57829C3E 
X-CRM114-Status: GOOD (  31.41  )
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

On Tue, Jun 14, 2022 at 12:36:25PM +0000, Christophe Leroy wrote:
> =

> =

> Le 14/06/2022 =E0 14:26, Jarkko Sakkinen a =E9crit=A0:
> > On Thu, Jun 09, 2022 at 06:44:45AM -0700, Luis Chamberlain wrote:
> >> On Thu, Jun 09, 2022 at 08:47:38AM +0100, Russell King (Oracle) wrote:
> >>> On Wed, Jun 08, 2022 at 02:59:27AM +0300, Jarkko Sakkinen wrote:
> >>>> diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
> >>>> index 553866751e1a..d2bb954cd54f 100644
> >>>> --- a/arch/arm/kernel/Makefile
> >>>> +++ b/arch/arm/kernel/Makefile
> >>>> @@ -44,6 +44,11 @@ obj-$(CONFIG_CPU_IDLE)		+=3D cpuidle.o
> >>>>   obj-$(CONFIG_ISA_DMA_API)	+=3D dma.o
> >>>>   obj-$(CONFIG_FIQ)		+=3D fiq.o fiqasm.o
> >>>>   obj-$(CONFIG_MODULES)		+=3D armksyms.o module.o
> >>>> +ifeq ($(CONFIG_MODULES),y)
> >>>> +obj-y				+=3D module_alloc.o
> >>>> +else
> >>>> +obj-$(CONFIG_KPROBES)		+=3D module_alloc.o
> >>>> +endif
> >>>
> >>> Doesn't:
> >>>
> >>> obj-$(CONFIG_MODULES)		+=3D module_alloc.o
> >>> obj-$(CONFIG_KPROBES)		+=3D module_alloc.o
> >>
> >> That just begs for a new kconfig symbol for the object, and for
> >> the object then to be built with it.
> >>
> >> The archs which override the default can use ARCH_HAS_VM_ALLOC_EXEC.
> >> Please note that the respective free is important as well and its
> >> not clear if we need an another define for the free. Someone has
> >> to do that work. We want to ensure to noexec the code on free and
> >> this can vary on each arch.
> > =

> > Let me check if I understand this (not 100% sure).
> > =

> > So if arch define ARCH_HAS_VMALLOC_EXEC, then this would set
> > config flag CONFIG_VMALLOC_EXEC, which would be used to include
> > the compilation unit?
> > =

> =

> I guess you have two possible approaches.
> =

> Either architectures select CONFIG_ARCH_HAS_VMALLOC_EXEC at all time and =

> then you add a CONFIG_VMALLOC_EXEC which depends on =

> CONFIG_ARCH_HAS_VMALLOC_EXEC and CONFIG_MODULES or CONFIG_KPROBES,
> =

> Or architectures select CONFIG_ARCH_HAS_VMALLOC_EXEC only when either =

> CONFIG_MODULES or CONFIG_KPROBES is selected, in that case there is no =

> need for a CONFIG_VMALLOC_EXEC.

Right, got it now. Thanks for the elaboration.

> Christophe

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
