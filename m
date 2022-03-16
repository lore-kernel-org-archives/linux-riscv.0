Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2191C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 18:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJHJce+OfFlCVQjg80Hl9ibQSMiNRBfZ634YDXK9zWo=; b=kzVb28VBmcL/LB
	hYin3Jr+CaCzqeGI9+zQhkrZPp3JutuVzzVKfgx210gJCq9B3frromqfQEs+06i/7WVRNmv2PSNRf
	DQuRDZKiBfx7XUs+39TRkU8GKzLD4r119uROwENaY3BSu8l+AHcZ8YJFw+jINOjNzJAe4uMxQKdrV
	RdWOlb6PNT970vxx8bNyZDc9QogYziO0pP+jJSI0YRYh6+A3MocAwtkAs0qv8SkgnRjha5MntoPtC
	w2HHHP40FRpFjb6pU+sWv+Dy84VnzU8ljYivQKbfuXJFZumv93+QOOHvuUcS4CWduYOdF5UtcmFXA
	Na9Ls+eQ80oECOIrVzJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUYes-00E7Bu-TJ; Wed, 16 Mar 2022 18:46:06 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUYee-00E78U-Ci; Wed, 16 Mar 2022 18:45:54 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id AFA5D92009C; Wed, 16 Mar 2022 19:45:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id AC40D92009B;
 Wed, 16 Mar 2022 18:45:45 +0000 (GMT)
Date: Wed, 16 Mar 2022 18:45:45 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, 
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] parport_pc: Also enable driver for PCI systems
In-Reply-To: <CADVatmP4sPwyqi6vKPm3QOFD=47w1LwXtsUynhecY4wMYGhXmw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2203161837130.24248@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2202141955550.34636@angie.orcam.me.uk>
 <CADVatmP4sPwyqi6vKPm3QOFD=47w1LwXtsUynhecY4wMYGhXmw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_114552_608167_29D40233 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

On Wed, 2 Mar 2022, Sudip Mukherjee wrote:

> > Make the PARPORT_PC option selectable also for PCI systems then, except
> > for the s390 arch, however limit the availability of PARPORT_PC_SUPERIO
> > to platforms that enable ARCH_MIGHT_HAVE_PC_PARPORT.  Update platforms
> > accordingly for the required <asm/parport.h> header.
> >
> > Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> 
> Acked-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> 
> Usually parport patches goes via Greg's tree. Adding Greg.

 Thank you.  I have since been able to move my parport card to my RISC-V 
machine, and the result is as follows:

parport_pc 0000:07:00.0: enabling device (0000 -> 0001)
PCI parallel port detected: 1415:c118, I/O at 0x8(0x4), IRQ 38
parport0: PC-style at 0x8 (0x4), irq 38, using FIFO [PCSPP,TRISTATE,COMPAT,EPP,ECP]
lp0: using parport0 (interrupt-driven).

with the patch from:

<https://lore.kernel.org/lkml/alpine.DEB.2.21.2202260044180.25061@angie.orcam.me.uk/>

also applied so as to prevent I/O port 0 from being assigned by PCI code 
that wouldn't actually work (so allocation for the two BARs is at 0x4 and 
0x8 instead).

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
