Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F88C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 11:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rOJp8QTKsK4mluyRcS7v33pagGBFYL3b2XUPZKhT0sw=; b=U3u/lHAvz/eWtS
	2PJCsX+B3cCl4ImwZ45x4w2QO9K+n7S6wVd0tDfis0A+M1a6MmuxkMAXs50hcvs2VXhOxWZSOMhj4
	HcR51qZ3l0ojhESU3YnzHrdxQtLQpjFzj6IyI9d2lpIvJ4inPCpfE0L5v9ADYXVK+H3XPfEpsXLY5
	UabSOVpOpnCGYacIy79IUc2FbzNUc61cJqRPPMmTNn4K0atXd1sMcfLzI1cd4q72cMWx/xWwRImd9
	15NlZt/cP284YWFKrSfyxksskNvVxw0IjA3CZFqJUcw5DzolxeHK8WpS/+nQowmx0xg2u75LD8BbW
	deJnhSYk/+Yz11FqrPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmwDU-002vIG-2K; Fri, 06 May 2022 11:33:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmwDI-002vDy-6j; Fri, 06 May 2022 11:33:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 52C1061EF9;
 Fri,  6 May 2022 11:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70C1C385A8;
 Fri,  6 May 2022 11:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651836810;
 bh=mPb8Q8Ok2oNk7WAjedaRk8DoRYKS47EIw5ypxOHVuLY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WWSZiZ6Av+Csqa/4o5LVEuZFS3DJz7bi5gem/5b+fSqMF/bztOWB7Uv0UN6PKf1iR
 bIkeemtz1+eEPJSsxwshNfqV0neFGBEsrkdriS1XVQTfHCon4dlnzVssO79rvne83V
 WEsdFGEqAfFTTia1860HjAAZDFTA2MG5xtW85SdHUVN4/302qVZ7mV7/1f5rOoeLF7
 3Ib23+tQfIklwvq/B0nmy0PEdT9DYV74TS5IrYAW2P7K9UHk4o/CsMa0XoA2T/Z/sM
 FFRO2q3aPyOcC9hEPgHvpgVc8ahqS97LC9PLDio9DDKV6tmaNDNbmA/BFYZm1jQ8cK
 dteb9336iWplA==
Received: by mail-ot1-f44.google.com with SMTP id
 g11-20020a9d648b000000b00605e4278793so4727176otl.7; 
 Fri, 06 May 2022 04:33:30 -0700 (PDT)
X-Gm-Message-State: AOAM531nrYkgTMMXwipGpEnqDvr24UBA9Pfw8ZCiTC2xCemsqkyOT3kN
 +jjok0xkFfvKglCu3xPVsvwQfnTYBBojidjrOOY=
X-Google-Smtp-Source: ABdhPJy5Vv8YTgA/+Yk25Xv8xMKQhcEw8LiqaQy/3bb0wg6KVBd/5y4hLeqVF7Zu5FslZtdBqz1tOtNTiterOIoDfDE=
X-Received: by 2002:a25:d3c2:0:b0:645:74df:f43d with SMTP id
 e185-20020a25d3c2000000b0064574dff43dmr1886331ybf.394.1651836798896; Fri, 06
 May 2022 04:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 6 May 2022 13:33:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
Message-ID: <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220506_043336_355949_E31FDC1A 
X-CRM114-Status: GOOD (  23.02  )
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

On Fri, May 6, 2022 at 12:20 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> On Thu, 5 May 2022, Arnd Bergmann wrote:
>  I think I'm missing something here.  IIUC we're talking about a PCI/PCIe
> bus used with s390 hardware, right?
>
>  (It has to be PCI/PCIe, because other than x86/IA-64 host buses there are
> only PCI/PCIe and EISA/ISA buses out there that define I/O access cycles
> and EISA/ISA have long been obsoleted except perhaps from some niche use.)
>
>  If this is PCI/PCIe indeed, then an I/O access is just a different bit
> pattern put on the bus/in the TLP in the address phase.  So what is there
> inherent to the s390 architecture that prevents that different bit pattern
> from being used?

The hardware design for PCI on s390 is very different from any other
architecture, and more abstract. Rather than implementing MMIO register
access as pointer dereference, this is a separate CPU instruction that
takes a device/bar plus offset as arguments rather than a pointer, and
Linux encodes this back into a fake __iomem token.

>  If anything, I could imagine the same limitation as with current POWER9
> implementations, that is whatever glue is used to wire PCI/PCIe to the
> rest of the system does not implement a way to use said bit pattern (which
> has nothing to do with the POWER9 processor instruction set).
>
>  But that has nothing to do with the presence or absence of any specific
> processor instructions.  It's just a limitation of bus glue.  So I guess
> it's just that all PCI/PCIe glue logic implementations for s390 have such
> a limitation, right?

There are separate instructions for PCI memory and config space, but
no instructions for I/O space, or for non-PCI MMIO that it could be mapped
into.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
