Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43302C7EE33
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Ov2pkMbkf4ELs7n4WJAHsFFKZDoSgoJBXKgmEiDG2w=; b=Es0nLoCfrZgEwq
	Au3IbgN33cBj540GB/stTeDDSlEb5Bm1RewpNjCi4h7x/YKk8V8Dj8kT4kiUFzrU0Y9qHim+BQ6Dw
	VmkMik0wz6j54V+zGRfAPpedcHttB0x390UyMBg0uOxv8ddFdk0MuhntDUduo3Xo1nmphSEuJKeBi
	Kr/S6MmPpaGRtuYis7k98MDAE4TGVLSg5TwCr00pYevuWuYp1noZMouHgTthRXNlwdRtAwXKJtQK1
	9t7MhsUtJ+YrgSK3cd8vbo1gdS3nnDfhDYvw02kRabOvqDY2PjzWrB2r1K7PrikTddEbhcRF+s5Uo
	VdIsNqnrdDgDmFi7iwFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU64U-00000006D8x-3h6x;
	Tue, 24 Jun 2025 16:00:30 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4N5-00000005qTS-1feP
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 14:11:36 +0000
Date: Tue, 24 Jun 2025 16:11:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750774292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PjUSNJBMO+NBHGXbrFO7m3NMv5jpn0HjiAjQvupbPQE=;
	b=TLtUKRDzrCWby1lUcFpFQCjEm+oAuqTumSYmUcjarD9QPhfU6cpZlel815owYMrOLbcjTU
	ZW7mJTC74r56TNCKjDtPWjGbGqXWIeSw3cuIdJErYfrgLnMNCkdAE5UwdeXTGhmJVJ3P5Y
	q3BUcz49yxjiTD++uNCb84Ym6sEH1VpoCcpeA9R4BobiWXiFX1t5dyw7WncjD6wwkd94j6
	IzJ16E8rIrCw1gviZCMNPth5lPARpHoeK8qmXSNsZri1QRNJ7dirQBRrj45LwVK5e5PcIs
	SzXnKGYGlD1dDeFwSlagjeroMs2YNHZe9p4B4OqJyfFuEN5amC3/eUOOUtrQZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750774292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PjUSNJBMO+NBHGXbrFO7m3NMv5jpn0HjiAjQvupbPQE=;
	b=YeP5Il+wFMDFn8GvKnUnxIjrb3n+p8xYBQHKxAzStmmgPVJA+axdAcaEsEA72G9j6HnyWr
	1ti+iOY15gkGfJAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Nam Cao <namcao@linutronix.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	Alexandre Ghiti <alex@ghiti.fr>, clrkwllms@kernel.org,
	rostedt@goodmis.org, linux-rt-devel@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Enable interrupt during exception handling
Message-ID: <20250624141130.gZVv4WnP@linutronix.de>
References: <mhng-60581B88-6FC7-4349-96B6-730D908ABF4A@palmerdabbelt-mac>
 <alpine.DEB.2.21.2506240303170.61655@angie.orcam.me.uk>
 <19cf2371-7293-4e71-a17d-669db4c8270a@rivosinc.com>
 <20250624131730.XqPd1HUR@linutronix.de>
 <d135d6cc-5117-4b3a-9abe-2e5fd9e3e490@rivosinc.com>
 <20250624140815.GU1613200@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250624140815.GU1613200@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_071135_574940_696CA263 
X-CRM114-Status: GOOD (  12.06  )
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

On 2025-06-24 16:08:15 [+0200], Peter Zijlstra wrote:
> > >>
> > >> I also had a series which was doing so for misaligned accesses handling,
> > >> but after discussion, it was not ok to do so.:
> > >>
> > >> https://lore.kernel.org/linux-riscv/20250422094419.GC14170@noisy.programming.kicks-ass.net/
> > > 
> > > If I understand that right, exceptions from kernel should be treated as
> > > NMI, so that lockdep can tell us if exception handlers touch locks.
> > > 
> > > But (conditionally) enabling interrupts does not lose us that benefit. It
> > > is still considered NMI by lockdep.
> > > 
> > > Unless I miss something, the patch is fine as is.
> 
> I'm confused, you're wanting to conditionally enable interrupts from a
> kernel exception while its NMI like? *WHY* ?!

What we want is to enable interrupt handling if it was enabled before
the exception occured. So we can send a proper signal on PREEMPT_RT
without chocking on spinlock_t/ sighand.

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
