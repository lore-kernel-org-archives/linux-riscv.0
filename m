Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944DAC77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 21:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sy62NWlXQUCmPCeeMLKUpMMff6yRrJYvthIWjh4DOFk=; b=xVDeg2X0+MFXxp
	XX09akNAi/BDcSh9SY7yfT82WCa8BEDc2fV4Lhk/5iWT82EjxFGyBZjIro9wE7eeOz/AnR2y8/vhK
	0XSbZzqXVAjZxTNbQhIQRBF4WT3m13zN0p8ADXjkBpBB68Zrt3E80VEtEo2HdcLbFwgTjLtHpno9R
	u0mVvrZpTnQUBjAZTGVK1qm4rFgwqozz0grSdGY92Qt+PUltgQMYyVSGIYopbKC5FRO1GeUYGCXAC
	B2gxscdlm6s2hSFUK0/G3JxoCFSDg/Maw2YQXvPijc1U7Ny9hbUsYb0LWhiiaZhRBGsQNL7/aG9i3
	x8tlY/yrjfcZpBndEFVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAzS-00000006r5N-1N6h;
	Tue, 24 Jun 2025 21:15:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8kM-00000006YSG-2XA3
	for linux-riscv@bombadil.infradead.org;
	Tue, 24 Jun 2025 18:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6rko2rcwweZUsDslFiCZ/96atADm8L+QGmM0MZgbpk0=; b=Xcni6oT11a3lARymFBo/G++cGb
	61k68L4Qlky8CIACOtprdwVLtXynD7FbCq+TwqTninD54XTQqG+pPlqt7iG6IDc4nXU6stV/50zD+
	Z+eONVol6MtR+L1BsGHECXhwJ3xQ8vkiBbTgfWpaebGwipgTE/YKVSRad//gX/68rzOjKF1lAJt+k
	dpN89wUtLQmat9gfyGY4F43caiZQ/XhBJ5WnPjnrfBpusGB8WM7Ml5OvU5n+VvaIs+FL5C5n0vyTg
	H3lA3+AJHirBKXmMMjVVZuMaAzKEjIcE5wnxFEi30gqx6bB9xBl2bF/oVLpc6sGGwj2KydpTqVf6M
	vWR8x6NQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8kI-00000005Xad-0xel;
	Tue, 24 Jun 2025 18:51:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EBED930BB6E; Tue, 24 Jun 2025 20:51:48 +0200 (CEST)
Date: Tue, 24 Jun 2025 20:51:48 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Cl??ment L??ger <cleger@rivosinc.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	Alexandre Ghiti <alex@ghiti.fr>, clrkwllms@kernel.org,
	rostedt@goodmis.org, linux-rt-devel@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Enable interrupt during exception handling
Message-ID: <20250624185148.GA1490279@noisy.programming.kicks-ass.net>
References: <alpine.DEB.2.21.2506240303170.61655@angie.orcam.me.uk>
 <19cf2371-7293-4e71-a17d-669db4c8270a@rivosinc.com>
 <20250624131730.XqPd1HUR@linutronix.de>
 <d135d6cc-5117-4b3a-9abe-2e5fd9e3e490@rivosinc.com>
 <20250624140815.GU1613200@noisy.programming.kicks-ass.net>
 <20250624141130.gZVv4WnP@linutronix.de>
 <20250624141801.GV1613200@noisy.programming.kicks-ass.net>
 <20250624142350.xZ_DdClH@linutronix.de>
 <20250624143458.GW1613200@noisy.programming.kicks-ass.net>
 <20250624153314.2Mwvvjmy@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250624153314.2Mwvvjmy@linutronix.de>
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

On Tue, Jun 24, 2025 at 05:33:14PM +0200, Nam Cao wrote:
> On Tue, Jun 24, 2025 at 04:34:58PM +0200, Peter Zijlstra wrote:
> > On Tue, Jun 24, 2025 at 04:23:50PM +0200, Sebastian Andrzej Siewior wrote:
> > > On 2025-06-24 16:18:01 [+0200], Peter Zijlstra wrote:
> > > > I'm confused, sending signals is for exception from userspace. That has
> > > > nothing to do with exceptions from kernelspace being NMI like.
> > > 
> > > Yes. See the original submission
> > > 	https://lore.kernel.org/linux-riscv/20250620114346.1740512-1-namcao@linutronix.de/
> > 
> > I'm still confused, that code is trying to enable IRQs in the
> > from-kernel part. That's insane.
> > 
> > Can some Risc-V person explain why a from-kernel exception would ever
> > result in a signal?!?!
> 
> Exceptions from kernel do not raise signals. Enabling irqs there is not
> necessary, I can remove that part.
> 
> But for my curiousity, do you mind elaborating why it is insane to enable
> irqs in from-kernel exception handling?
> 
> For "NMI-like" exceptions, (I think) I get it, the context would be messed
> up. But what about the others, e.g. kernel page faults?

The non-NMI exceptions like page-fault are okay. In fact, we hard rely
on it when kernel space accesses user-space data in a preemptible
context, it is expected to handle the fault.

My concern was about the NMI like ones -- enabling IRQs for those is
quite mad.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
