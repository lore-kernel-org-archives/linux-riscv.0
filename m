Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38801C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  7 May 2022 00:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAD1Hmgd33H/BBMJS9RIJm6tY9zWCfOKUjfBrIRgMec=; b=IzvOqLd8zRjWqU
	wpn1fFjlk34b45UPioZUqcBw7jLiS+vL8oq0z+CfRnEP//IrnDGyRz4dlAc70Ufa9c3X6IcB9+A+c
	SQPh5fjtaKqUOYQ3ZsxEJkloGXRD4RbZSbXNVnuvlauAJYDFN2/G6giCGHkx315EAnxRCwhnKcc/h
	mywgjdtqOsNTczB9PdmsFsxDV1h9WUcHge3bahO+jPo9SwNzXqhsUa1Chm6jwT48L6JTqZa5Kwxoc
	8nIVc4pEPM1EWHAkb90yn8gTmYCzQtOSqOquXsiHBXpYH2sYEi2N+y1cDg7bJAHrYSuHyvM0IazO/
	AWA6TOnVY0c8xDB9ogLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn7te-005SIo-Df; Sat, 07 May 2022 00:02:06 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn7tS-005SH5-5C; Sat, 07 May 2022 00:01:56 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 08A20581367;
 Fri,  6 May 2022 20:01:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 06 May 2022 20:01:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651881709; x=
 1651888909; bh=hJxEFAuP3W0ocRuq9vLXjN5OlZEUnHk8AMHl1pdwrIw=; b=C
 xRLkEfhUbEyE90JzCIIfMF0OZav1zcZBYtpgecP8ApnTN4fdlBb3TWucKtiiLVnd
 phR+z33NIKiN5vvoQl4oIZhk8c/stiSlc7YKhqnLniKgN7mh6i4gdLlpwMgXN8Jx
 e7Ktbm6oij1Rve4npuV/JXnd7tlkfyM/0Bz3txW/0SUizxpE/JN1o4B4fiIigl5B
 ODk4g+2AMO40GC7n/7n0pEgUnXqDIMz17cgAN6FmIv1e9zegzqwaJ0I+kStibxBe
 g4XBZSsTbqspbyCFDBCsvGdO+loAMO92OKfZTh/4kTG2uqmiuWrZjJm45yvGLmba
 KNmSVM+dKifWafpBnnHDw==
X-ME-Sender: <xms:4rZ1Ytzfx8dyKZqHQrV2iYrMdgRUVRPJ5uUwNS7astnHeUoPA5JP-Q>
 <xme:4rZ1YtQUABIDxMMBtegJM8AXkRrr-tzXbMdH0cN7W3yw1nTwwmuUilavkeuJbaLH-
 jiXIcpKb_V12BfL3wo>
X-ME-Received: <xmr:4rZ1YnWuj7-Y-n3U8_P9SrVRCen9EuBDcbjR5eG7oX-EXFUmoFKaghxcC96Gl5aI4_7s5rHGeJqG5FVCSZIPe5G--o2Z8oFtO20>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeggddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepfeeiheejvdetgfeitddutefhkeeilefhveehgfdvtdekkedvkeehffdtkeev
 vdeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehk
 rdhorhhg
X-ME-Proxy: <xmx:4rZ1YvjRqTV1kqzGfEZqExc-y3C87C0PjwUsUwS-om8USnmpQPRsXQ>
 <xmx:4rZ1YvD61kgrS-YFzaAD5iTYUCb5iH6iosfkwZGmHVIza5eNfoZf5Q>
 <xmx:4rZ1YoIUIx-XKteSS56qWnxoAmafmX5tikXV710a88-2E5zTPDOJsg>
 <xmx:7bZ1Yh30nOThnpoXJeJtrRg9vb4kwFxuUl_bN4rVDjV8z-IxFV2paA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 May 2022 20:01:37 -0400 (EDT)
Date: Sat, 7 May 2022 10:01:39 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
cc: Bjorn Helgaas <helgaas@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
In-Reply-To: <105ccec439f709846e82b69cb854ac825d7a6a49.camel@linux.ibm.com>
Message-ID: <7dfa7578-039-e132-c573-ad89bd3215@linux-m68k.org>
References: <20220505195342.GA509942@bhelgaas>
 <22bec167-241f-2cbe-829f-a3f65e40e71@linux-m68k.org>
 <105ccec439f709846e82b69cb854ac825d7a6a49.camel@linux.ibm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_170154_541934_33AA2788 
X-CRM114-Status: GOOD (  33.85  )
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


On Fri, 6 May 2022, Niklas Schnelle wrote:

> On Fri, 2022-05-06 at 19:12 +1000, Finn Thain wrote:
> > 
> > On Thu, 5 May 2022, Bjorn Helgaas wrote:
> > 
> > > On Thu, May 05, 2022 at 07:39:42PM +0200, Arnd Bergmann wrote:
> > > > On Thu, May 5, 2022 at 6:10 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > > On Wed, May 04, 2022 at 11:31:28PM +0200, Arnd Bergmann wrote:
> > > > > > The main goal is to avoid c), which is what happens on s390, 
> > > > > > but can also happen elsewhere. Catching b) would be nice as 
> > > > > > well, but is much harder to do from generic code as you'd need 
> > > > > > an architecture specific inline asm statement to insert a 
> > > > > > ex_table fixup, or a runtime conditional on each access.
> > > > > 
> > > > > Or s390 could implement its own inb().
> > > > > 
> > > > > I'm hearing that generic powerpc kernels have to run both on 
> > > > > machines that have I/O port space and those that don't.  That 
> > > > > makes me think s390 could do something similar.
> > > > 
> > > > No, this is actually the current situation, and it makes 
> > > > absolutely no sense. s390 has no way of implementing inb()/outb() 
> > > > because there are no instructions for it and it cannot tunnel them 
> > > > through a virtual address mapping like on most of the other 
> > > > architectures. (it has special instructions for accessing memory 
> > > > space, which is not the same as a pointer dereference here).
> > > > 
> > > > The existing implementation gets flagged as a NULL pointer 
> > > > dereference by a compiler warning because it effectively is.
> > > 
> > > I think s390 currently uses the inb() in asm-generic/io.h, i.e., 
> > > "__raw_readb(PCI_IOBASE + addr)".  I understand that's a NULL 
> > > pointer dereference because the default PCI_IOBASE is 0.
> > > 
> > > I mooted a s390 inb() implementation like "return ~0" because that's 
> > > what happens on most arches when there's no device to respond to the 
> > > inb().
> > > 
> > > The HAS_IOPORT dependencies are fairly ugly IMHO, and they clutter 
> > > drivers that use I/O ports in some cases but not others.  But maybe 
> > > it's the most practical way.
> > > 
> > 
> > Do you mean, "the most practical way to avoid a compiler warning on 
> > s390"? What about "#pragma GCC diagnostic ignored"?
> 
> This actually happens with clang.

That suggests a clang bug to me. If you believe GCC should behave like 
clang, then I guess the pragma above really is the one you want. If you 
somehow feel that the kernel should cater to gcc and clang even where they 
disagree then you would have to use "#pragma clang diagnostic ignored".

> Apart from that, I think this would also fall under the same argument as 
> the original patch Linus unpulled. We would just paint over someting 
> that we know at compile time won't work:
> 
> https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
> 

I wasn't advocating adding any warnings.

If you know at compile time that a driver won't work, the usual solution 
is scripts/config -d CONFIG_SOME_UNDESIRED_DRIVER. Why is that no 
longer appropriate for drivers that use IO ports?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
