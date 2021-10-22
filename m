Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE69FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 12:32:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BA4360F57
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 12:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BA4360F57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3IYL5b02nVYMcBgJ8OwpwxM9sKljKBDaBAtEJAAibc=; b=tEz8hkqRuIGikR
	mSK1bpZ+C2gC2XPogYR/E5ytetejXx7vxkEi06SOfgaiYLWAnZqrB9riKjGtqYh4qu54NDKIsWO4s
	6AsO4+1kF6vPn0rvoZQwPY7J/G6wLfjBPQdYGH7B46OBhBw4t2R2cjzcvGC1DFhfpuU1mXuf9x190
	ylhfJFqcr3Lu0Hr39x+l4xxb3ecGFc1FEbNaxJ7ZhqfWpweamCCK0sEYwxUh+VOEriESpoit6IBHT
	PWRvxSZHVSXs1slP0JvT6fsPTly+IfgBLYgf9UTljY++w8yec+cua2Mxl5SD3aPLI92uJCO3ogv63
	I2nAcNh7g7wHNqlmFOfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtiT-00AsMv-L7; Fri, 22 Oct 2021 12:32:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtiS-00AsMW-4v
 for linux-riscv@bombadil.infradead.org; Fri, 22 Oct 2021 12:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+iqfxl1bOnUqQBYQwxlUeaPnvsk9jRCJKtP69+WVQmw=; b=FaAS0eZKYrwXkNRSph0rdnR8sp
 bVG0WLZEfA0LSIUeBcySJUff3gzVVTTxhIfH2fLLEKTjaH0Q9hm+Dh4mRpVo4RMPDXJp+IGH4JOEg
 o41/AyGAW7u/Kn89THveZCo9FyHs5RCpX++HIy19BqU9vbWfoYtqFJ6ufYKSthFABy33u9FB1cuUp
 GCks1N2qn2OS+OiEApHJNXU76IFnjAl+7WDW8lTSDaQ/NynIG0Sgf7Fs/ZDWWXR9u84N+23ztmbp2
 ezhMOMzh7vjymWyloyJkmFgUCYk1q4G3jNkY+RkK7NIyz6bd88mBBU8ctCchAlvGBcV6VO+I2HQTp
 B/8/oDIA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdthN-00Dtq7-V5; Fri, 22 Oct 2021 12:31:16 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id D67509812EB; Fri, 22 Oct 2021 14:31:00 +0200 (CEST)
Date: Fri, 22 Oct 2021 14:31:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>,
 Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH] locking: Generic ticket lock
Message-ID: <20211022123100.GZ174703@worktop.programming.kicks-ass.net>
References: <YXFli3mzMishRpEq@hirez.programming.kicks-ass.net>
 <YXKC9qh+evVmUuLI@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXKC9qh+evVmUuLI@FVFF77S0Q05N>
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

On Fri, Oct 22, 2021 at 10:23:02AM +0100, Mark Rutland wrote:
> Hi Peter,
> 
> On Thu, Oct 21, 2021 at 03:05:15PM +0200, Peter Zijlstra wrote:
> > +static __always_inline void ticket_lock(arch_spinlock_t *lock)
> > +{
> > +	u32 val = atomic_fetch_add_acquire(ONE_TICKET, lock);
> 
> I wonder, should these atomics be arch_atomic_*(), in case an arch_ or raw_
> lock is used in noinstr code? The plain atomic_*() forms can have explicit
> inline instrumentation.
> 
> I haven't seen any issues with qspinlock so far, and that also uses the
> (instrumented) atomics, so maybe that's not actually a problem, but I'm not
> sure what we intend here w.r.t.  instrumentability.

So far it's not been a problem, and as you say, if we want to change
this, we need a larger audit/cleanup.

IIRC there's a potential problem in the arm idle code (noinstr'ing the
idle code is still on the TODO list somewhre, hampered by the need to
create more tooling).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
