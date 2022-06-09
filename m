Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E097BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 03:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwuP2PfyQlhtxmFyJ24icpBQ+8uTU9c1U4Qdxa01qmg=; b=hVaJ51UpG9MGVw
	VmkWktwzwfU7MTGWBfGQgeZ60gtx5ofc5u7/6rRf61X/aYoYzow1qZuqiCWdnxvgoB+qDGngEW3yo
	3dDsfU1ZDc+QxKwx/wyXqrGV++gZFoaki+v3Y2db98EOTbyZVxqdanRQ2ksIskTADB5M7kSy2tPlc
	t7k8ezhkUYJ8irPsZj0eVobZI+nloSF7M/J0sz50Mpg7BLk0JHF18XTNmYNy1ikpo7tt2+Avfm1XL
	v2L30HfHiqcu4EWpaTP7/u1JEXZqqcnl4tdlE9FTy0o1VymqNZeVoJH3glEEIQTnV+Yj40ckk0+B2
	ctswI7GT3xi4mlNrbjww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz9AP-00FxR3-G9; Thu, 09 Jun 2022 03:49:05 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz9AL-00FxPH-5D; Thu, 09 Jun 2022 03:49:03 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id EFD956732D; Thu,  9 Jun 2022 05:48:52 +0200 (CEST)
Date: Thu, 9 Jun 2022 05:48:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Song Liu <song@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
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
	Christophe Leroy <christophe.leroy@csgroup.eu>,
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
Message-ID: <20220609034852.GA30873@lst.de>
References: <20220608000014.3054333-1-jarkko@profian.com> <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com> <YqAy0qjI4Lktk/uJ@iki.fi> <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org> <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com> <CAPhsuW6BzUtqnjvaGJScXRpghs0_V_phpdyd4_oAKhvmkX-GFw@mail.gmail.com> <YqEF6+YKqCHsWZJW@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqEF6+YKqCHsWZJW@bombadil.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_204901_539362_8E4B3FDC 
X-CRM114-Status: GOOD (  17.34  )
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

On Wed, Jun 08, 2022 at 01:26:19PM -0700, Luis Chamberlain wrote:
> No, that was removed because it has only one user.

That is only part of the story.  The other part is that the overall
kernel simply does not have any business allocating exutable memory.
Executable memory is a very special concept for modules or module-like
code like kprobes, and should not be exposed as a general concept.

Especially as executable memory really should not also be writable
for security reasons.  In other words, we should actually never
allocate executable memory, every.  We might seal memory and then
mark it executable after having written to it, which is how modules
and kprobes are implemented on all modern Linux ports anyway.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
