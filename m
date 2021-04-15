Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46013C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 09:02:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6C2B61222
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 09:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6C2B61222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lzeA4yq3toaTq7/KitfjzQTyXRjwU6BmIfz2JpwhGfY=; b=gjv96GIBigSsetJx02F9l0yoO
	/HCsWosUeWWi+jdreU/yT9+RC/UOaw/jyeKIXzWbeUPeojcPnbxViqoLhTFghCGqbnQSWvLCNdszI
	4ve02mUSDSI2+5Vr7Jmkq7u6P2aDNnDqufBKZLvxTcXzModOfchPG23S5VAFNEovbAWNmCuAx0dXi
	ifbGy8EWKdUU9jqttDeCSNc4B+sYr4+wX4VE7VlaLYXXXwnfYIjFJYe3oEJSPnmn2ZfCyR8l2vTYX
	arU4hMl00PgyRkJGR83emVV7RBg56Bw1SO1N/LzljyJYAXTl0naYDOxjFESRiGuDuVa1hVS7fWFkn
	JnEzfy3zQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWxtO-00FRhJ-9P; Thu, 15 Apr 2021 09:02:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWxtL-00FRfy-3G
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 09:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=evt1kWksji3l/SZ6+C7QInGvTjVXTZMMFTL2A+YHtlo=; b=ae8mH4WCy8ZbPq1VMRAl6jNopz
 ZjduzZEjNMQy2qz8xPs2qy2gAYYfe31VU0btQutN0LvgLyW2B0morIfGDFmwRaNGFQiZ7cUgixaFf
 4yBDqraaPTEIMdQ9ysRlUosdfd0WHpxT1if7CFllOP8CdyyxQUXuFdqglvPKcEwmCzPiOxeZHHaI/
 /Ugsn7WAeyLwXsLy4QA3bQwUKGZXw4uMZNSabh9c+I2HzimOKi6Z+IKz1Dw8HKg+RyvZnnonwGnW3
 BEXO0aOND4p241AxSC9WKEWNw6vAmNndDqNCT3TEH1F76isvNxKIcDoDpj6abSAn7Z2Fh7jKI6SGG
 FArX8rwg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWxtH-008PHO-T4
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 09:02:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE781611F1;
 Thu, 15 Apr 2021 09:02:20 +0000 (UTC)
Date: Thu, 15 Apr 2021 10:02:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stafford Horne <shorne@gmail.com>, Guo Ren <guoren@kernel.org>,
 Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC][PATCH] locking: Generic ticket-lock
Message-ID: <20210415090215.GA1015@arm.com>
References: <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <YHVTgfCpxpINc8sM@hirez.programming.kicks-ass.net>
 <CAJF2gTQaF8wBCp-L6vgJPcu6EnFRWmh_qZMX2PiEfj0Z70-Ykg@mail.gmail.com>
 <YHaU4uxr6emrivuu@hirez.programming.kicks-ass.net>
 <YHawVOIHmDPbTmoB@hirez.programming.kicks-ass.net>
 <YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net>
 <20210414204734.GJ3288043@lianli.shorne-pla.net>
 <YHf00hgpB5C20tH3@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHf00hgpB5C20tH3@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_020224_025507_A38D8983 
X-CRM114-Status: GOOD (  30.87  )
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

(fixed Will's email address)

On Thu, Apr 15, 2021 at 10:09:54AM +0200, Peter Zijlstra wrote:
> On Thu, Apr 15, 2021 at 05:47:34AM +0900, Stafford Horne wrote:
> > > How's this then? Compile tested only on openrisc/simple_smp_defconfig.
> > 
> > I did my testing with this FPGA build SoC:
> > 
> >  https://github.com/stffrdhrn/de0_nano-multicore
> > 
> > Note, the CPU timer sync logic uses mb() and is a bit flaky.  So missing mb()
> > might be a reason.  I thought we had defined mb() and l.msync, but it seems to
> > have gotten lost.
> > 
> > With that said I could test out this ticket-lock implementation.  How would I
> > tell if its better than qspinlock?
> 
> Mostly if it isn't worse, it's better for being *much* simpler. As you
> can see, the guts of ticket is like 16 lines of C (lock+unlock) and you
> only need the behaviour of atomic_fetch_add() to reason about behaviour
> of the whole thing. qspinlock OTOH is mind bending painful to reason
> about.
> 
> There are some spinlock tests in locktorture; but back when I had a
> userspace copy of the lot and would measure min,avg,max acquire times
> under various contention loads (making sure to only run a single task
> per CPU etc.. to avoid lock holder preemption and other such 'fun'
> things).
> 
> It took us a fair amount of work to get qspinlock to compete with ticket
> for low contention cases (by far the most common in the kernel), and it
> took a fairly large amount of CPUs for qspinlock to really win from
> ticket on the contended case. Your hardware may vary. In particular the
> access to the external cacheline (for queueing, see the queue: label in
> queued_spin_lock_slowpath) is a pain-point and the relative cost of
> cacheline misses for your arch determines where (and if) low contention
> behaviour is competitive.
> 
> Also, less variance (the reason for the min/max measure) is better.
> Large variance is typically a sign of fwd progress trouble.

IIRC, one issue we had with ticket spinlocks on arm64 was on big.LITTLE
systems where the little CPUs were always last to get a ticket when
racing with the big cores. That was with load/store exclusives (LR/SC
style) and would have probably got better with atomics but we moved to
qspinlocks eventually (the Juno board didn't have atomics).

(leaving the rest of the text below for Will's convenience)

> That's not saying that qspinlock isn't awesome, but I'm arguing that you
> should get there by first trying all the simpler things. By gradually
> increasing complexity you can also find the problem spots (for your
> architecture) and you have something to fall back to in case of trouble.
> 
> Now, the obvious selling point of qspinlock is that due to the MCS style
> nature of the thing it doesn't bounce the lock around, but that comes at
> a cost of having to use that extra cacheline (due to the kernel liking
> sizeof(spinlock_t) == sizeof(u32)). But things like ARM64's WFE (see
> smp_cond_load_acquire()) can shift the balance quite a bit on that front
> as well (ARM has a similar thing but less useful, see it's spinlock.h
> and look for wfe() and dsb_sev()).
> 
> Once your arch hits NUMA, qspinlock is probably a win. However, low
> contention performance is still king for most workloads. Better high
> contention behaviour is nice.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
