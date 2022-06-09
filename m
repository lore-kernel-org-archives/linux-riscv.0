Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C21C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 05:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VG3H1oN4sfhoEkjoWxs2nVQ+GM+zyL+RHP3EYhM3v/I=; b=u6YzTgnHYZg/iV
	h5tHyguSkKorjznvmhSzKYbM2MJxN7bF+RupuKUZRzlsy2LlX8n5NRFN47mwSW6SUNlMA/NgYNPXU
	l2SOPDKhM+C9/euRHmu/qIgIGtkVo+D4wt6ClaAvpA302tBb/QgmW1kNvxb29YW9oxISzC4IKmeJE
	oE7L6eFhIOAX8SRdYfMKhqiNHp9+Fo+HSxW6+p/P7eBdGUTae/rEiPqY7m4Teuh0RYJCx5YoW6fLk
	nDfONkdN6vIZNZSTvw1nV9TMpCQksX/m7/fV8SUw8L8gDhhm3fV1QuvqyyUI42XHPfTFzIsZmNZoq
	VVJSPaj2w7NC65gZKUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzAtj-00Gr1G-Jw; Thu, 09 Jun 2022 05:39:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzAtf-00Gqzg-Pv; Thu, 09 Jun 2022 05:39:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 86B8BB82C1F;
	Thu,  9 Jun 2022 05:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C191AC34114;
	Thu,  9 Jun 2022 05:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654753192;
	bh=ZBzW7c26dslHeRr0ieKbrHN+05ZdER8p0imFsIG2U6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2o+ddHoBAh/ztSTEKLJZaE98wUIiQxUNoAdW7BKWVIFeAQYKxd9oL3vnlesLyKiT
	 VPKotdlsvpJZKg7TX7GrDwbwHGgxs3Qf8sMkZdCE0hRTpjzlMCugH24kzF76BmzYme
	 FUzeMivArYzPXUNpXIYaEwcOX33YkdGM40VXdm0o37FlvFRqULsbkJoYQ5wnf0eIx0
	 TsgucyhkqJSUb8zaXjI6z38KzJrwe/5gEy/qHB66zJJ+NN0dJalvYXl+h/dTuz52xO
	 KDwJeNKP7bAq38rvYsyIpD7YkTJTxX5WVGn8fBd514jOuj6Fut8wOy/CTcFyzoQstK
	 voCzneXRcBiJw==
Date: Thu, 9 Jun 2022 08:37:54 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Jarkko Sakkinen <jarkko@profian.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
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
	Christophe Leroy <christophe.leroy@csgroup.eu>,
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
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-ID: <YqGHMs4ha7JMvODf@iki.fi>
References: <20220608000014.3054333-1-jarkko@profian.com>
 <CAMj1kXFsdEq6XZ6eOuf8Ks-F4qgneVxFeLYNN_S4JaPy8koEyw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXFsdEq6XZ6eOuf8Ks-F4qgneVxFeLYNN_S4JaPy8koEyw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_223956_189527_966AFE95 
X-CRM114-Status: GOOD (  32.26  )
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

On Wed, Jun 08, 2022 at 06:27:51PM +0200, Ard Biesheuvel wrote:
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

OK, I apologize for my ignorance. It's been a while.

> Kprobes uses alloc_insn_page() to allocate executable memory, but the
> requirements for this memory are radically different compared to
> loadable modules, which need to be within an arch-specific distance of
> the core kernel, need KASAN backing etc etc.
> 
> This is why arm64, for instance, does not implement alloc_insn_page()
> in terms of module_alloc() [and likely does not belong in this patch
> for that reason]
> 
> Is there any reason kprobes cannot simply use vmalloc()?

All arch's, except nios2 use vmalloc() in the end for module_alloc().
nios2 uses kmalloc() for the reasons that I'm not aware of, but it does
not support kprobes in the first place.

Based on this, I think that could work out just fine.

I could cope with that.

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
