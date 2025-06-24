Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FCFC77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 19:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZtMxQ/wdZ9DCNCX3X/JbpBxCCpM3e82a74pw8hfX7U=; b=xXscAGUTnxXXk9
	61KnQF5f7vU5KWfzKMv+8GspPmhjBLDQz/ph/p8mpwsXGvEbMup4mWyV827HEEfMchdTxakKuTe1H
	glufzCq5F1xMZTFJqcuL8p+0HfupjPGhCbTXnhGd4SJKqxXQ1CkARF3dQDleKvgpkoxdyGzmyWqXl
	oeq6Bs+d+BqezY9S6Uk0zOJaw4hDMdRGBbMcYZZ7IkMcNeGQMGmqv0V1u7KzI3nfh6YKkCTUA6Ciq
	KLnZuk3V5TpvX8f+QIcef5LM50N5ACmiruQY66WPuwZzdScaoz4sijQ6hipE+jyrimXtUAsUgt9yN
	oLGxKghKERzRUuOZK9Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9iy-00000006fAU-21Vo;
	Tue, 24 Jun 2025 19:54:32 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5eA-0000000689B-3DZK
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 15:33:20 +0000
Date: Tue, 24 Jun 2025 17:33:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750779195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PBrzg5DCuHrE1OY+QwXkYAH3DJNsPYdSW7dnUZCTfyk=;
	b=gxSriVND0Umc1rzkQrowmw7fLnGOU0KC7P7VlIYi3MHtfr1jmWIR3tWpp0OsN0CW7tPSc7
	SlPxftUHUyx0rW9Av6YeE9wBkPRBwij2J9O32AjYjfh9DDn/wHnY2igOlJGBerF9p2DHC9
	nItHplqYTT1zIq0hybApyVIsvalJhnmW+BqcqEyXix+bQb5W8aC6fBh0Ulpv+C1mEYmo2a
	qQZhm7lgfmD6DDyYkBvePQt6CFfs+LLDktcczrRf6NAumtIw4imroSSFjzwK509FGqMYq/
	iRo64jZl/ZXYKWHi4SinwzyzU3508zqE0hsaMSzgxX+CKWgW5H0xAR1BM9QGAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750779195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PBrzg5DCuHrE1OY+QwXkYAH3DJNsPYdSW7dnUZCTfyk=;
	b=S5Og8P0vHyE3rai9+oFP5AquPdi3KPrrqARx0pEPwNeBj/xJU/A/R29GcX0CAt5veRBwA6
	+NUrjc8Ux0vAlBDA==
From: Nam Cao <namcao@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	Alexandre Ghiti <alex@ghiti.fr>, clrkwllms@kernel.org,
	rostedt@goodmis.org, linux-rt-devel@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Enable interrupt during exception handling
Message-ID: <20250624153314.2Mwvvjmy@linutronix.de>
References: <mhng-60581B88-6FC7-4349-96B6-730D908ABF4A@palmerdabbelt-mac>
 <alpine.DEB.2.21.2506240303170.61655@angie.orcam.me.uk>
 <19cf2371-7293-4e71-a17d-669db4c8270a@rivosinc.com>
 <20250624131730.XqPd1HUR@linutronix.de>
 <d135d6cc-5117-4b3a-9abe-2e5fd9e3e490@rivosinc.com>
 <20250624140815.GU1613200@noisy.programming.kicks-ass.net>
 <20250624141130.gZVv4WnP@linutronix.de>
 <20250624141801.GV1613200@noisy.programming.kicks-ass.net>
 <20250624142350.xZ_DdClH@linutronix.de>
 <20250624143458.GW1613200@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250624143458.GW1613200@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_083318_946473_37B25497 
X-CRM114-Status: GOOD (  12.11  )
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

On Tue, Jun 24, 2025 at 04:34:58PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 24, 2025 at 04:23:50PM +0200, Sebastian Andrzej Siewior wrote:
> > On 2025-06-24 16:18:01 [+0200], Peter Zijlstra wrote:
> > > I'm confused, sending signals is for exception from userspace. That has
> > > nothing to do with exceptions from kernelspace being NMI like.
> > 
> > Yes. See the original submission
> > 	https://lore.kernel.org/linux-riscv/20250620114346.1740512-1-namcao@linutronix.de/
> 
> I'm still confused, that code is trying to enable IRQs in the
> from-kernel part. That's insane.
> 
> Can some Risc-V person explain why a from-kernel exception would ever
> result in a signal?!?!

Exceptions from kernel do not raise signals. Enabling irqs there is not
necessary, I can remove that part.

But for my curiousity, do you mind elaborating why it is insane to enable
irqs in from-kernel exception handling?

For "NMI-like" exceptions, (I think) I get it, the context would be messed
up. But what about the others, e.g. kernel page faults?

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
