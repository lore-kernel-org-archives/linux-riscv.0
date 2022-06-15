Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4D9C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 06:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6km3PFZ/bmORP6AscgXhExNgwjFF573w9RgD1laLr4Y=; b=nW4uJJa2qgQwwz
	4LbLkv0L9MSB8Th8nYEsKapLsL9eUucNQJAnVH6A8dRrZMd8GXvOhQpSCexE/jvhv7LjIBx9C48Nf
	F0ttmQOOdYXDsOen+IVCMVwGOOtWtMC7x5sM0GH9CBJtNi6FDxLni3hLqm+mF3zeBTwVjuoQM344X
	VBX+bWpYCrh5c3XrBVFr9P1AlvrDte7ppIaAlIo0qoUi91/RimEAIyh827VAqnnQR9qDWqyDCYEnQ
	AcU2SqZ8Q4dhkpaAABoh1FOTFdWhrLEjicz57UX4Tkfl2HUL5kcyqgTUstctnPYHSeZ+V4cwECLGO
	pVYRUEHKR5uMx+qlKxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1MeV-00Csgn-54; Wed, 15 Jun 2022 06:37:19 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1MeR-00Csfe-MM; Wed, 15 Jun 2022 06:37:17 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id D469067373; Wed, 15 Jun 2022 08:37:07 +0200 (CEST)
Date: Wed, 15 Jun 2022 08:37:07 +0200
From: "hch@lst.de" <hch@lst.de>
To: "jarkko@kernel.org" <jarkko@kernel.org>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"hch@lst.de" <hch@lst.de>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"mcgrof@kernel.org" <mcgrof@kernel.org>,
	"svens@linux.ibm.com" <svens@linux.ibm.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>,
	"paulus@samba.org" <paulus@samba.org>,
	"zepan@sipeed.com" <zepan@sipeed.com>,
	"iii@linux.ibm.com" <iii@linux.ibm.com>,
	"deller@gmx.de" <deller@gmx.de>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"anemo@mba.ocn.ne.jp" <anemo@mba.ocn.ne.jp>,
	"egorenar@linux.ibm.com" <egorenar@linux.ibm.com>,
	"ast@kernel.org" <ast@kernel.org>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"npiggin@gmail.com" <npiggin@gmail.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"x86@kernel.org" <x86@kernel.org>,
	"luis.machado@linaro.org" <luis.machado@linaro.org>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"mbenes@suse.cz" <mbenes@suse.cz>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"jniethe5@gmail.com" <jniethe5@gmail.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"andreyknvl@gmail.com" <andreyknvl@gmail.com>,
	"dja@axtens.net" <dja@axtens.net>,
	"liaochang1@huawei.com" <liaochang1@huawei.com>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	"huschle@linux.ibm.com" <huschle@linux.ibm.com>,
	"will@kernel.org" <will@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>,
	"song@kernel.org" <song@kernel.org>,
	"guoren@kernel.org" <guoren@kernel.org>,
	"nathan@kernel.org" <nathan@kernel.org>,
	"dave.anglin@bell.net" <dave.anglin@bell.net>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"atomlin@redhat.com" <atomlin@redhat.com>,
	"bristot@redhat.com" <bristot@redhat.com>,
	"naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"javierm@redhat.com" <javierm@redhat.com>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"philipp.tomsich@vrull.eu" <philipp.tomsich@vrull.eu>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"ndesaulniers@google.com" <ndesaulniers@google.com>,
	"samitolvanen@google.com" <samitolvanen@google.com>,
	"yangtiezhu@loongson.cn" <yangtiezhu@loongson.cn>,
	"aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"heiko@sntech.de" <heiko@sntech.de>,
	"nathaniel@profian.com" <nathaniel@profian.com>,
	"michael.roth@amd.com" <michael.roth@amd.com>,
	"rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
	"Sakkinen, Jarkko" <jarkko@profian.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
	"tmricht@linux.ibm.com" <tmricht@linux.ibm.com>,
	"hca@linux.ibm.com" <hca@linux.ibm.com>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"gor@linux.ibm.com" <gor@linux.ibm.com>,
	"atishp@atishpatra.org" <atishp@atishpatra.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"nico@fluxnic.net" <nico@fluxnic.net>,
	"masahiroy@kernel.org" <masahiroy@kernel.org>,
	"agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
	"kernel@esmil.dk" <kernel@esmil.dk>,
	"ashimida@linux.alibaba.com" <ashimida@linux.alibaba.com>,
	"elver@google.com" <elver@google.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>,
	"Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"chenzhongjin@huawei.com" <chenzhongjin@huawei.com>,
	"andrealmeid@igalia.com" <andrealmeid@igalia.com>,
	"changbin.du@intel.com" <changbin.du@intel.com>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-ID: <20220615063707.GA22930@lst.de>
References: <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com> <YqAy0qjI4Lktk/uJ@iki.fi> <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org> <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com> <CAPhsuW6BzUtqnjvaGJScXRpghs0_V_phpdyd4_oAKhvmkX-GFw@mail.gmail.com> <YqEF6+YKqCHsWZJW@bombadil.infradead.org> <20220609034852.GA30873@lst.de> <YqH0iEgsi6+bwS3x@bombadil.infradead.org> <e7dedb9086193ca7682edc10fabc4195894e5146.camel@intel.com> <Yqh/5nn0AhdwaCm8@iki.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yqh/5nn0AhdwaCm8@iki.fi>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_233716_067118_FFA769BD 
X-CRM114-Status: GOOD (  16.47  )
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

On Tue, Jun 14, 2022 at 03:32:38PM +0300, jarkko@kernel.org wrote:
> > Like say for a next step we moved prog pack out of bpf into core code,
> > gave it it's own copy of module_alloc(), and then made kprobes use it.
> > Then we would have something with improved W^X guard rails, and kprobes
> > would not depend on modules anymore. I think maybe it's a step in the
> > right direction, even if it's not perfect.
> 
> So you're saying that I should (as a first step) basically clone
> module_alloc() implementation for kprobes, and future for BPF 
> use, in order to get a clean starting point?

I don't think cloning the code helps anyone.  The fact that except
for the eBPF mess everyone uses module_alloc and the related
infrastructure is a feature and not a bug.  The interface should
become better than what we have right now, but there is few enough
users that this can be done in one go.

So assuming we really care deeply enough about fancy tracing without
modules (and I'm not sure we do, even if you don't use modules it
doesn't hurt to just build the modules code, I do that all the time
for my test machines), the general approach in your series is the
right one.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
