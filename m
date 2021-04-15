Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A3DC433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 08:10:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9356A60FEA
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 08:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9356A60FEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y9XUwg+uqPPNRhFNaMwAja50wKfcDJ9gByhGO+LwK9o=; b=Jz6YRBu32zVKCwPccuG90ZI/t
	7vA0B2Gc0zk8t8OOP362dHHwVeSjFAxk9HiV6jL8rySkdcL5ecH3xWaRo7JsCzQOc1ITSNwivG0MP
	Sq+jeMBTTgkB9b2jJDrnUcU/mgZIBfeGotSyY9sMTk/yr8W3IYDTKGMc/FxKWCeL7cYaU68d6jII9
	926G6w8F+Aq8ziD933SnGpOqAfsmjw25WntTmRKoAMwNuE4Ha+kNQF3hIVywvx5HjrBTrsH8I3qdt
	Hc9Mvt0WG8Of4ZcPMY56ObvAWNGYvhDYTI5simVq+heJ2H2dYH+FpqqqA2BbjefACwP6uBDSIVbO5
	uIgEx2EWg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWx4z-00FJb0-6v; Thu, 15 Apr 2021 08:10:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWx4w-00FJam-A7
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 08:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pNl50OnfrsTMw9KJLwf0kvnMVVjH09VJYTN9ZXHDw+M=; b=DCZRjJtg5q6QH3lkg0Ou4stg0O
 BbAQXLss0hhVEXlHG/YgG9f+mZJcp6HvmXJPNMs6/Z5DijH2isBJkudZ9lRksWBEQSD4ZoLSbDsm7
 zjtJ6b5I0pduCbWrSNLyIXJUvJMRxz8ajH+E2++KXIKnmt89PHrdDqg24L3iYPov0rHVOaVnY9vgt
 Q6W5c+4GAHo0SzjqiBcIMqKpEWwGs0hIIlTeZqiQXDjFgPcVPw+zoilG95xnoesbICYo3ncXTHMJH
 48cGFpMO26asbEcRiC3pEVv8ibVbe3MkxpHm/5hS/nDfaXjaz6tQ62ANszqtTNDdprgz7NFiSrkcY
 f6Jzh1Ug==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lWx4W-008Gu6-Ec; Thu, 15 Apr 2021 08:09:58 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 268BB30021C;
 Thu, 15 Apr 2021 10:09:55 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id E504820BF5EDB; Thu, 15 Apr 2021 10:09:54 +0200 (CEST)
Date: Thu, 15 Apr 2021 10:09:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Stafford Horne <shorne@gmail.com>
Cc: Guo Ren <guoren@kernel.org>,
 Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC][PATCH] locking: Generic ticket-lock
Message-ID: <YHf00hgpB5C20tH3@hirez.programming.kicks-ass.net>
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <YHVTgfCpxpINc8sM@hirez.programming.kicks-ass.net>
 <CAJF2gTQaF8wBCp-L6vgJPcu6EnFRWmh_qZMX2PiEfj0Z70-Ykg@mail.gmail.com>
 <YHaU4uxr6emrivuu@hirez.programming.kicks-ass.net>
 <YHawVOIHmDPbTmoB@hirez.programming.kicks-ass.net>
 <YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net>
 <20210414204734.GJ3288043@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414204734.GJ3288043@lianli.shorne-pla.net>
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

On Thu, Apr 15, 2021 at 05:47:34AM +0900, Stafford Horne wrote:

> > How's this then? Compile tested only on openrisc/simple_smp_defconfig.
> 
> I did my testing with this FPGA build SoC:
> 
>  https://github.com/stffrdhrn/de0_nano-multicore
> 
> Note, the CPU timer sync logic uses mb() and is a bit flaky.  So missing mb()
> might be a reason.  I thought we had defined mb() and l.msync, but it seems to
> have gotten lost.
> 
> With that said I could test out this ticket-lock implementation.  How would I
> tell if its better than qspinlock?

Mostly if it isn't worse, it's better for being *much* simpler. As you
can see, the guts of ticket is like 16 lines of C (lock+unlock) and you
only need the behaviour of atomic_fetch_add() to reason about behaviour
of the whole thing. qspinlock OTOH is mind bending painful to reason
about.

There are some spinlock tests in locktorture; but back when I had a
userspace copy of the lot and would measure min,avg,max acquire times
under various contention loads (making sure to only run a single task
per CPU etc.. to avoid lock holder preemption and other such 'fun'
things).

It took us a fair amount of work to get qspinlock to compete with ticket
for low contention cases (by far the most common in the kernel), and it
took a fairly large amount of CPUs for qspinlock to really win from
ticket on the contended case. Your hardware may vary. In particular the
access to the external cacheline (for queueing, see the queue: label in
queued_spin_lock_slowpath) is a pain-point and the relative cost of
cacheline misses for your arch determines where (and if) low contention
behaviour is competitive.

Also, less variance (the reason for the min/max measure) is better.
Large variance is typically a sign of fwd progress trouble.

That's not saying that qspinlock isn't awesome, but I'm arguing that you
should get there by first trying all the simpler things. By gradually
increasing complexity you can also find the problem spots (for your
architecture) and you have something to fall back to in case of trouble.

Now, the obvious selling point of qspinlock is that due to the MCS style
nature of the thing it doesn't bounce the lock around, but that comes at
a cost of having to use that extra cacheline (due to the kernel liking
sizeof(spinlock_t) == sizeof(u32)). But things like ARM64's WFE (see
smp_cond_load_acquire()) can shift the balance quite a bit on that front
as well (ARM has a similar thing but less useful, see it's spinlock.h
and look for wfe() and dsb_sev()).

Once your arch hits NUMA, qspinlock is probably a win. However, low
contention performance is still king for most workloads. Better high
contention behaviour is nice.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
