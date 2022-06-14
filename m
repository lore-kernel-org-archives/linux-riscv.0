Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EA7C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 12:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffLjRtUtZrbWRJCAwvBLIGrE/zJmeMfFtnucfrfHbzY=; b=4+udetsT5jzfqe
	kLZXEwohd25/2CSNq4kgcO9eSX1HIoQeipWBhT0GwE61N2RVvSPRnBjjd94Y1Ng25eKkH7c5ND1Qn
	OEmkHMJznfPv6qAc06a/f9A7/xyArqGu3JIpVEM/FpKZPWBEa/LMrIN3EQ24CQSMOIy+CFWRSSxdN
	G8vBMiLy/+EfMLJ1PrMaXkkvUYiutHoXTiWmesNYh24fGWvj4tONSDqhDmKKVN+EGFQcNQ7+pEcx0
	/Rjk9nICOL09eQCOYhVKixGixIME3S8gGECujf51jv0tksjxIPYFJVRPun6gpznlFCoT9P3G28YVY
	XPadxJ43l9wuqGglTRHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o15l9-009ZYS-OY; Tue, 14 Jun 2022 12:35:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o15kr-009ZRi-VB; Tue, 14 Jun 2022 12:34:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5367D615D3;
	Tue, 14 Jun 2022 12:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9871EC3411E;
	Tue, 14 Jun 2022 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655210085;
	bh=S7mRYBt8dKQ302Phsd6Akm5kJqqFOUkmEA1v3KsTPWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RnGKuF+/Y/3maKreiqaBVGd5HuZNeDQoPMRXQEpiMn/f8SIJpRly6PX6lIVouvSRe
	 xRFy4EGBk0z6QKt+Lz8vk6SzVZNTytJsNMc59tX/IUD7KSvHaKZebzDN6GiCttUHep
	 wXb4Tjb7kuj6K751aGII97hYZlNWKbGQyTiy30ylzeLfPk8aM7eYe2aDaylZCNoeQR
	 ATclZjOy43jDWkMIsNXUmPF4JLxmfzu7IwS+MDaUS4slOfQg5l4B5Bz1S20GP1bc6b
	 sBMsCSdmiWO4qBNgMSuBqkfY0qDHqU9XbdztWs0lH8KCt5CzSbvS7jQB/nQOXFnOd8
	 zwJhPQWCFHDxw==
Date: Tue, 14 Jun 2022 15:32:38 +0300
From: "jarkko@kernel.org" <jarkko@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "hch@lst.de" <hch@lst.de>,
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
Message-ID: <Yqh/5nn0AhdwaCm8@iki.fi>
References: <20220608000014.3054333-1-jarkko@profian.com>
 <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
 <YqAy0qjI4Lktk/uJ@iki.fi>
 <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
 <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
 <CAPhsuW6BzUtqnjvaGJScXRpghs0_V_phpdyd4_oAKhvmkX-GFw@mail.gmail.com>
 <YqEF6+YKqCHsWZJW@bombadil.infradead.org>
 <20220609034852.GA30873@lst.de>
 <YqH0iEgsi6+bwS3x@bombadil.infradead.org>
 <e7dedb9086193ca7682edc10fabc4195894e5146.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7dedb9086193ca7682edc10fabc4195894e5146.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_053446_091371_36B92FAD 
X-CRM114-Status: GOOD (  38.55  )
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

On Thu, Jun 09, 2022 at 06:41:36PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2022-06-09 at 06:24 -0700, Luis Chamberlain wrote:
> > On Thu, Jun 09, 2022 at 05:48:52AM +0200, Christoph Hellwig wrote:
> > > On Wed, Jun 08, 2022 at 01:26:19PM -0700, Luis Chamberlain wrote:
> > > > No, that was removed because it has only one user.
> > > 
> > > That is only part of the story.  The other part is that the overall
> > > kernel simply does not have any business allocating exutable
> > > memory.
> > > Executable memory is a very special concept for modules or module-
> > > like
> > > code like kprobes, and should not be exposed as a general concept.
> > 
> > It is not just modules and kprobes, it is also ftrace and bpf too
> > now.
> > So while it should not be used everywhere calling it module_alloc()
> > is just confusing at this point. Likewise, module_alloc_huge() is
> > being proposed too and I'd rather we deal with this properly in
> > aligment
> > of taking care of the rename as well.
> > 
> > If the concern is to restrict access we can use the module namespace
> > stuff
> > so to ensure only intended users get access to it.
> 
> BPF even has multiple uses for text allocation. It has its own
> trampoline feature that puts different type of text in the allocation,
> with its own allocation routine. I looks like there are even more
> little allocators in there.
> 
> So yea, there seems to be a lot of the kernel in the business of
> dynamically generated text, for better or worse. I agree that it needs
> to be done carefully. However, these usages always seem to have the
> same problems (W^X, arch eccentricities, etc). So I don't think we
> should hide away the pieces. Instead we should have something with
> guard rails on it, so they can't get the allocation part wrong.
> 
> But I guess the question here is: what should we do in the meantime? It
> is kind of similar to the questions that came up around the bpf prog
> pack allocator. Should we hold up allocator related work until
> underlying problems are resolved and there is some mature core
> solution?
> 
> Personally I had thought we would need to do some clean switch to a
> much different interface. I still think someday it will be required,
> but it seems to be evolving naturally for the time being.
> 
> Like say for a next step we moved prog pack out of bpf into core code,
> gave it it's own copy of module_alloc(), and then made kprobes use it.
> Then we would have something with improved W^X guard rails, and kprobes
> would not depend on modules anymore. I think maybe it's a step in the
> right direction, even if it's not perfect.

So you're saying that I should (as a first step) basically clone
module_alloc() implementation for kprobes, and future for BPF 
use, in order to get a clean starting point?

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
