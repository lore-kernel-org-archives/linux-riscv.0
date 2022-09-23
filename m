Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D127C6FA82
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 11:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmHFMfyPwPE9gKJIZQCuuca0uwpWO928i/H7NPaX1PA=; b=VZnPtqzRoM3+yR
	IIpyvqr9t0yJKoN8VOh/wGeNVWTeQoUch2TMUijJ5vaKD7JYmqyCOR7cmIgK5cQ6Pw+NUPdsswHMj
	Gt5ctHzd44ea5n0osOaA5wGEKKMuHZ3zMbBQ1fiPRHdVQb/sPjb76ATvkNAaq0SbZrtxjcPMmhCVH
	VcieQaDwCJYfDOUahN3MtTjAoYSPTy6Wpd+eUN4UprGp5MGPGAKoxOCVCpYSZzfsYR2Wi1j3JEqmY
	RVbNL0WTg5Q6PdmqE+8UpU1Vb9PM824VpNRrsUNvuCVkIrkQOVk5uYcwCd00Ioie31zdgLcbMtFOw
	Xf6kAEE+GYoyY1usGoBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obh1M-003yqD-HW; Fri, 23 Sep 2022 11:39:04 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obh1I-003yoO-KG
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 11:39:02 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 31B9992009C; Fri, 23 Sep 2022 13:38:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2B7E692009B;
	Fri, 23 Sep 2022 12:38:57 +0100 (BST)
Date: Fri, 23 Sep 2022 12:38:57 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Arnd Bergmann <arnd@arndb.de>
cc: Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: Make port I/O string accessors actually work
In-Reply-To: <c4ee195a-cf1f-44f6-b3b6-241d04e01fb9@www.fastmail.com>
Message-ID: <alpine.DEB.2.21.2209231211350.29493@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2209220223080.29493@angie.orcam.me.uk> <c4ee195a-cf1f-44f6-b3b6-241d04e01fb9@www.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_043900_848632_34CE3A0F 
X-CRM114-Status: GOOD (  25.04  )
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

On Fri, 23 Sep 2022, Arnd Bergmann wrote:

> > Fix port I/O string accessors such as `insb', `outsb', etc. which use 
> > the physical PCI port I/O address rather than the corresponding memory 
> > mapping to get at the requested location, which in turn breaks at least 
> > accesses made by our parport driver to a PCIe parallel port such as:
> >
> > PCI parallel port detected: 1415:c118, I/O at 0x1000(0x1008), IRQ 20
> > parport0: PC-style at 0x1000 (0x1008), irq 20, using FIFO 
> > [PCSPP,TRISTATE,COMPAT,EPP,ECP]
> 
> The patch looks correct to me, but I'm curious: Are you actually
> using a parport device on your system, or just testing it to
> make it work?

 I do, e.g. I have a MIPS Malta development board that uses an otherwise 
standard Super I/O parallel port for firmware downloads and have had a 
need recently to use it in the course of addressing a firmware bug.  This 
is how I actually triggered this bug; the Oops is from a download attempt.

 For the time being I resorted to using the only other parallel port I 
have in my lab, which is in my 25 years old x86 box, but I'd rather rely 
on a fast modern machine that is subject to less risk to fail.  And I 
found my HiFive Unmatched board a perfect fit for this purpose.

 I have a pair of Grammar Engine ROM emulators too that have both a serial 
and a parallel port for the purpose of image downloads, either of which 
can be used, except that the parallel interface is lightning fast compared 
to the serial one (so possibly the best arrangement is to use the serial 
port for control and the parallel one for data).  I haven't used them for 
a while now, but there's another firmware bug I plan to get at sometime, 
with my Broadcom SWARM development board.

 So yes, I have an ongoing interest in working parallel ports.

> > +#define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), 
> > buffer, count)
> > +#define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), 
> > buffer, count)
> > +#define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), 
> > buffer, count)
> > 
> 
> I don't see anything actually risc-v specific in these definitions,
> and it would be great to make the asm-generic version do the
> right thing here. As far as I can tell, the only difference is
> the barriers in the risc-v version, and we should really have the
> same in the generic code anyway.

 Fine with me as the next step, but we need to fix the bug at hand first 
and get the fix backported with the RISC-V port.

 Thanks for your review!

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
