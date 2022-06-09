Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413F7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 13:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWzqD14ba1iwPX7Je7FC3Hi1cd9Ebofx7tnTjwffj0k=; b=xC7TbvOlvswps8
	hdDvl//zkI3IB1/4F08HEBNmwrnYopdf7psaMnOylI9vWc0S/6L6WPGX0Kf4/PZfoA7c6wjThz4he
	CCscG32b250NJevnsPwfboIisPisgN9tmtiSUVcLAROft01c/g9N92oHbYd9eRzudUBadloMkO6ot
	iWN4LHsJOBPpWn+Ppst99PaiOS/Mr2byb4W3Q/Kmt4IiQX951XULBAa1wbM287kUXV+mrdkDqynuW
	GNkJwldC5mVI/Exsgy46L4KGZzGU0Kyh200LD/ZjaSuM5ajA235DnDFPKj9WmVJdxx6gzHEiBoHT9
	rUzpiFfIP56xfbT8Ls0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzI9K-00284J-Al; Thu, 09 Jun 2022 13:24:34 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzI9A-0027yT-Ln; Thu, 09 Jun 2022 13:24:24 +0000
Date: Thu, 9 Jun 2022 06:24:24 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@lst.de>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Song Liu <song@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Jarkko Sakkinen <jarkko@kernel.org>, Guo Ren <guoren@kernel.org>,
	Jarkko Sakkinen <jarkko@profian.com>,
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
	Dave Hansen <dave.hansen@linux.intel.com>,
	the arch/x86 maintainers <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Kees Cook <keescook@chromium.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Marco Elver <elver@google.com>, Dan Li <ashimida@linux.alibaba.com>,
	Sami Tolvanen <samitolvanen@google.com>,
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
	Jordan Niethe <jniethe5@gmail.com>,
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
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-s390 <linux-s390@vger.kernel.org>,
	sparclinux <sparclinux@vger.kernel.org>,
	linux-modules@vger.kernel.org
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-ID: <YqH0iEgsi6+bwS3x@bombadil.infradead.org>
References: <20220608000014.3054333-1-jarkko@profian.com>
 <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
 <YqAy0qjI4Lktk/uJ@iki.fi>
 <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
 <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
 <CAPhsuW6BzUtqnjvaGJScXRpghs0_V_phpdyd4_oAKhvmkX-GFw@mail.gmail.com>
 <YqEF6+YKqCHsWZJW@bombadil.infradead.org>
 <20220609034852.GA30873@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220609034852.GA30873@lst.de>
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

On Thu, Jun 09, 2022 at 05:48:52AM +0200, Christoph Hellwig wrote:
> On Wed, Jun 08, 2022 at 01:26:19PM -0700, Luis Chamberlain wrote:
> > No, that was removed because it has only one user.
> 
> That is only part of the story.  The other part is that the overall
> kernel simply does not have any business allocating exutable memory.
> Executable memory is a very special concept for modules or module-like
> code like kprobes, and should not be exposed as a general concept.

It is not just modules and kprobes, it is also ftrace and bpf too now.
So while it should not be used everywhere calling it module_alloc()
is just confusing at this point. Likewise, module_alloc_huge() is
being proposed too and I'd rather we deal with this properly in aligment
of taking care of the rename as well.

If the concern is to restrict access we can use the module namespace stuff
so to ensure only intended users get access to it.

> Especially as executable memory really should not also be writable
> for security reasons.  In other words, we should actually never
> allocate executable memory, every.  We might seal memory and then
> mark it executable after having written to it, which is how modules
> and kprobes are implemented on all modern Linux ports anyway.

The respective free *should* do the executable bits, and there
is no generic way to do this for all archs and so it is open coded
today. In fact some architectures need further work / help and so
split up the module data and exect already on v5.19+ with the new
ARCH_WANTS_MODULES_DATA_IN_VMALLOC. See this thread for details:

https://lkml.kernel.org/r/Yo1XTN441qbNTLGR@bombadil.infradead.org

Doing this work is not easy, but if we're going to do it, it must
be done right.

  Luis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
