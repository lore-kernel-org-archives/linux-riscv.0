Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B40C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 18:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GHkDNfdjTBJqoN6NphL/SNliZs7GcGu4akeARNQNCxk=; b=WPa8NnmBA8I8sX
	RtjvGuMqnDS+CCqrsAZksgRRBvAv9JcUhCXZGQkYPZO7TTNWayViA10dL/DwF8gpsBg01nWOlV9QG
	ZHJo8kgxQ8PC/DiXd2gz4kVkfbKCPHB+/SBE3rZ7FhqLlA9IghDtD9bYTSZSFaTg4LKOa73c7dop3
	KpiRPIMNUuBqelp88WpC8nkOHwvUJaoCgoQnU+qf2JqrP6Ez8v4S6RNVWTwHdC2lIm2A+ZktsLMPE
	g+Su2q4AN0XuGusDw6SJmi6N9bmiTW5yBX4EtGyQ0aXTB8YhD0eng3UZ0f2TAlZMmMb1uVupwVymh
	JeU0KFakYUYjPcRaYPJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz0HW-00Ef7K-5D; Wed, 08 Jun 2022 18:19:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz0HR-00Ef6b-Oe; Wed, 08 Jun 2022 18:19:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5E637B829B6;
	Wed,  8 Jun 2022 18:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB7FC341D2;
	Wed,  8 Jun 2022 18:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654712382;
	bh=BrMt+22N41uzooUnzPUoRXnpI1kF+bmp+ST9j+9wk1U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ivA4OAsW++8ZjxCbAwaoJ4Ocmy2TO84fUgcc0eOwQ9vYXwb7n8+Jq0xRwRWkWNi7m
	 2mQKJfAbLxccKBQFu8niWLiJU96zAPpyqwrQxX9EcN88eoNKLPGJeANYb1Znd4y9hz
	 bAf7wgePUqsrEBUO6emkpmOnfpaMfDJdTM5qtmuk5Ijn5mgQ8ilrPW8fSRwcgqMc6y
	 YGs6H6mPqrzoKjoZXIrcahMFQeQFREusERs4S+7IqrWPqwoTFrn4eRORAAXTG1vJRa
	 qkxvMJUm1Ox+d4+km9NwSPsMtD1wJ8Mh/S1tL34v9XjYShxa+CAnhoFREDXQ91d4Vm
	 JCAM7//qgFtDg==
Received: by mail-yb1-f175.google.com with SMTP id y188so8411356ybe.11;
        Wed, 08 Jun 2022 11:19:42 -0700 (PDT)
X-Gm-Message-State: AOAM532hgB3c9dsZombOp+yf3aZCNzWG/h9TPhMt2VRxo8BG8VnNmWUE
	N1PsFraIF3Es/rWPwhzmqH0NiAzTI96vz+VHjg4=
X-Google-Smtp-Source: ABdhPJzriHyGLGwDai2rVcky87dr5my3t8HULhAS0zE1LEI+/L1Wv0eduSFTK2BSoTXq6GOLOf6KiMiv8mt8c35aPAU=
X-Received: by 2002:a81:4a82:0:b0:2ff:94b4:b4d1 with SMTP id
 x124-20020a814a82000000b002ff94b4b4d1mr38668766ywa.130.1654712370883; Wed, 08
 Jun 2022 11:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220608000014.3054333-1-jarkko@profian.com> <CAMj1kXFsdEq6XZ6eOuf8Ks-F4qgneVxFeLYNN_S4JaPy8koEyw@mail.gmail.com>
In-Reply-To: <CAMj1kXFsdEq6XZ6eOuf8Ks-F4qgneVxFeLYNN_S4JaPy8koEyw@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Wed, 8 Jun 2022 11:19:19 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7NZXepczZGyV2Ti4hNSupLBoKgA64K=zJN4uVBTxN37g@mail.gmail.com>
Message-ID: <CAPhsuW7NZXepczZGyV2Ti4hNSupLBoKgA64K=zJN4uVBTxN37g@mail.gmail.com>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Jarkko Sakkinen <jarkko@profian.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nathaniel McCallum <nathaniel@profian.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Kees Cook <keescook@chromium.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	Marco Elver <elver@google.com>, Dan Li <ashimida@linux.alibaba.com>, 
	Sami Tolvanen <samitolvanen@google.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Chen Zhongjin <chenzhongjin@huawei.com>, 
	Nicolas Pitre <nico@fluxnic.net>, Mark Brown <broonie@kernel.org>, 
	Luis Machado <luis.machado@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Joey Gouly <joey.gouly@arm.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, 
	Guenter Roeck <linux@roeck-us.net>, Dave Anglin <dave.anglin@bell.net>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Alexei Starovoitov <ast@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>, 
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>, 
	Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Changbin Du <changbin.du@intel.com>, 
	Heiko Stuebner <heiko@sntech.de>, Liao Chang <liaochang1@huawei.com>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Wu Caize <zepan@sipeed.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Alexander Egorenkov <egorenar@linux.ibm.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Tobias Huschle <huschle@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Daniel Bristot de Oliveira <bristot@redhat.com>, Michael Roth <michael.roth@amd.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Miroslav Benes <mbenes@suse.cz>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Aaron Tomlin <atomlin@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-modules@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_111946_113291_332CF5A1 
X-CRM114-Status: GOOD (  31.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 8, 2022 at 9:28 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Hello Jarkko,
>
> On Wed, 8 Jun 2022 at 02:02, Jarkko Sakkinen <jarkko@profian.com> wrote:
> >
> > Tracing with kprobes while running a monolithic kernel is currently
> > impossible because CONFIG_KPROBES is dependent of CONFIG_MODULES.  This
> > dependency is a result of kprobes code using the module allocator for the
> > trampoline code.
> >
> > Detaching kprobes from modules helps to squeeze down the user space,
> > e.g. when developing new core kernel features, while still having all
> > the nice tracing capabilities.
> >
> > For kernel/ and arch/*, move module_alloc() and module_memfree() to
> > module_alloc.c, and compile as part of vmlinux when either CONFIG_MODULES
> > or CONFIG_KPROBES is enabled.  In addition, flag kernel module specific
> > code with CONFIG_MODULES.
> >
> > As the result, kprobes can be used with a monolithic kernel.
>
> I think I may have mentioned this the previous time as well, but I
> don't think this is the right approach.
>
> Kprobes uses alloc_insn_page() to allocate executable memory, but the
> requirements for this memory are radically different compared to
> loadable modules, which need to be within an arch-specific distance of
> the core kernel, need KASAN backing etc etc.

I think the distance of core kernel requirement is the same for kprobe
alloc_insn_page and modules, no?

Thanks,
Song

>
> This is why arm64, for instance, does not implement alloc_insn_page()
> in terms of module_alloc() [and likely does not belong in this patch
> for that reason]



>
> Is there any reason kprobes cannot simply use vmalloc()?
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
