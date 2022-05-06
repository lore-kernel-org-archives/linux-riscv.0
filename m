Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC835C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 12:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWAzGX7KR0RKXdAzDuKtOnEjIrMXHGWQRAuYkLL7xbQ=; b=45IqcnpDExlDM5
	JyFwgbMa0L6O8eUHaylNj/3hboUTqQU3d6RCM5IWfVU8C94SOXqggyzTkRqeIqC7uvZKxqIM8be1Z
	6126AkbC9euqOJYnG6jr/Gzh64FYQaoxHrA9HedgQwKbQnb/8+QR46eyUAooQ5avci3JT1AMf7SQf
	voardnN52pieLJJAiYvemCTglF6JGpQWkN+iUJlUMVIGHF/jYfKKDWDi1CMeHcXmAxyjmCOeiIp6w
	qVcnUFyTln+I3fAShxjVsfn/dxOmgpI/xalvRva/ydKe3P0EA2aQz8+CxomsT7x1neBd0kwb9ctwT
	Sy5Jpd1mF6qDySjk349A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmxTf-003Jae-LH; Fri, 06 May 2022 12:54:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmxTR-003JWD-Fz; Fri, 06 May 2022 12:54:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 16295B835B9;
 Fri,  6 May 2022 12:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCAFC385B5;
 Fri,  6 May 2022 12:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651841658;
 bh=YEsptMS5NZ5sU5R8sBoFFmT8HhhJmSMOqqqMD1wS+1Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=maE6/GoVFXRZNf7dfZPTVoMAWc6wGTVVX44qiwcwuwtsWpQr1FqM/jmMrvvkc1w0m
 /fdrsFTDKxwRvNHNK/1DjgM5J06h70STrSIQAvZkM2OfQAHM0wNC1NP2CMvk75VZVN
 fLTHzZWHgk6Ekdl8uTqjvomjFVgaGddUTcd5lXXPSGhuZCW4nb8nI7JlnC3De74LHw
 WbtQuRK6IFfQaU8R1z+FNZAwJdGy2thD1f0VJD8T7C7xV2945L8kQS1Sga76wR3MHB
 DhKSaRYVUK6746o5RiRAERN5HNbHvcEPu7PKSGLVz3w/nrBuDtObHLXaQUIxo+NIPv
 Ke+TQ+7Lj2NdQ==
Received: by mail-ot1-f52.google.com with SMTP id
 m6-20020a05683023a600b0060612720715so4844634ots.10; 
 Fri, 06 May 2022 05:54:18 -0700 (PDT)
X-Gm-Message-State: AOAM5317QkjAXS1n25UI9hkwJOF7Hp4Fjd/UXKeD3VuwbQeTQ2UcuGYt
 jmnV+wEZipwUgJaGWbiBmxaF5fNjztV5pxLpQAA=
X-Google-Smtp-Source: ABdhPJxL4gNLQQDFM+BNVTidCF+FJnD2lH7XZl8gBNCvdOYlAoSJ9hsbhzdM2mtB2NzLIM7z6wH6YyxJ1/r4G1eT6xU=
X-Received: by 2002:a81:9213:0:b0:2f6:eaae:d22f with SMTP id
 j19-20020a819213000000b002f6eaaed22fmr2535695ywg.249.1651841647017; Fri, 06
 May 2022 05:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 6 May 2022 14:53:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0EMK0gHOmb-jvtfVLb1dun72kYUMKpb11T_GgXiuR9Mw@mail.gmail.com>
Message-ID: <CAK8P3a0EMK0gHOmb-jvtfVLb1dun72kYUMKpb11T_GgXiuR9Mw@mail.gmail.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>, 
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-pci <linux-pci@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_055421_902985_14ECCFF9 
X-CRM114-Status: GOOD (  23.95  )
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

On Fri, May 6, 2022 at 2:27 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Fri, 6 May 2022, Arnd Bergmann wrote:
>
> > >  If this is PCI/PCIe indeed, then an I/O access is just a different bit
> > > pattern put on the bus/in the TLP in the address phase.  So what is there
> > > inherent to the s390 architecture that prevents that different bit pattern
> > > from being used?
> >
> > The hardware design for PCI on s390 is very different from any other
> > architecture, and more abstract. Rather than implementing MMIO register
> > access as pointer dereference, this is a separate CPU instruction that
> > takes a device/bar plus offset as arguments rather than a pointer, and
> > Linux encodes this back into a fake __iomem token.
>
>  OK, that seems to me like a reasonable and quite a clean design (on the
> hardware side).
>
>  So what happens if the instruction is given an I/O rather than memory BAR
> as the relevant argument?  Is the address space indicator bit (bit #0)
> simply ignored or what?

Not sure. My best guess is that it would actually work as you'd expect,
but is deliberately left out of the architecture specification so they don't
have to to validate the correctness.  Note that only a small number of
PCIe cards are actually supported by IBM, and I think the firmware
only passes devices to the OS if they are whitelisted.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
