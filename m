Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9D1C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 09:22:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 179A46124B
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 09:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 179A46124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CRhMsJmr9Q78dOaju00G1HYvaA+46jxlhaSIBv7OOXo=; b=l1UNLqp8Gb7RASD2zT8aMLles
	TOa4DbqmNLoWSjUcL4nYh0ywmvn9Tt4N5oVGwBASJGBpsCcEjpIB7QLCiCtisejc5Ye56rPHEjwWa
	d9v2ugu58E0A4mvRUNZnxky4DKoP209t0lhZsfM94Cw7OR2EYkieVLEbCM8VD0wzXcvIEu6MaKUPw
	q37QhJvMyKfvqAvuVM2AhQibt0Ayzb2z1lSz+lY+BhMYXNE3+S0FhI5tTItVlPZ6+q0oo5y7TGwjA
	JiATQ2FWnYq3KvEHgzanWjTUnsJyjHS+0VpIspNZGZ6cQiwokIxFCi9tKeWH++AlujRec2sP5UxiV
	DHwYaQiuQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyCe-00FVNJ-Qi; Thu, 15 Apr 2021 09:22:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyCc-00FVMg-CW
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 09:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mvKpGCuxINY6R4Ca2f4yL1dOqrutKRoS5k3gPdrSqqQ=; b=EjDDP02A+Qv9MBm2Kf2EWSkC5/
 HQE8mwKBODQ0CfUhpqZJooH2d4RH7jdIOJ62UEoRuGiXHqgvGm5/VeFqsX9tvn6gYeKTHu38gJY/R
 1+zYkJ06WVLe7f8RpzKXcSypyiwPfsxnoa+/UZr5PMIIhRw4aQCtk6MkPuPE9kihSfPQHYq9/9o/j
 lG3PaizsKo2Ik0vMhO6gMHncAL1RfkTsaQ/zky8W445hGfwrnsPgyOxg00uvKpcFq1AFCSBW/hd8X
 EW38W0ZXNUJ95DYE9e40tm2oYZ2YdvKoxvY6XIcXQRUiHG//CICvoQuJFi+E+ygzV4TdxdIXFIiZc
 Nr4tGL7g==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyCZ-008Q53-Lc
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 09:22:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 402A061222;
 Thu, 15 Apr 2021 09:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618478538;
 bh=dmI2KicrdiUzO7RCef4YkJ92842nyWjSe+ktGhQTC7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PJdo4PtG0HvaOXOUynzZ07ekfPgGjk/j4YwBH6lGnEpk0I8G2yOE/89ZOBDS1nHmV
 QjVeCcFbgL4w43Ry3lsPhwX2Su/Pxw9bsd01yaZmnIWVa3hoQD93eelEd2seReN+Ac
 LcbSuJAnRInJkOxqNZbZbQRjkWbANWvczxLSB9l413mf89UhsrJeSpYoS8Vtwtu7e0
 Vz/s+YXO7W/DEC2RgrHi9n75eevQ9JrWIh3FQwDDl1pEEgvQWya51z02J0+WSZkmyV
 UV6rYhBq/QJu43mXUy9spO/3D8Om29tXHEDQcVZPpOoRsf7nZAVLwXSZximT3YTHOk
 FCPoTl5IM/SCA==
Date: Thu, 15 Apr 2021 10:22:12 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Stafford Horne <shorne@gmail.com>, Guo Ren <guoren@kernel.org>,
 Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC][PATCH] locking: Generic ticket-lock
Message-ID: <20210415092212.GA26151@willie-the-truck>
References: <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <YHVTgfCpxpINc8sM@hirez.programming.kicks-ass.net>
 <CAJF2gTQaF8wBCp-L6vgJPcu6EnFRWmh_qZMX2PiEfj0Z70-Ykg@mail.gmail.com>
 <YHaU4uxr6emrivuu@hirez.programming.kicks-ass.net>
 <YHawVOIHmDPbTmoB@hirez.programming.kicks-ass.net>
 <YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net>
 <20210414204734.GJ3288043@lianli.shorne-pla.net>
 <YHf00hgpB5C20tH3@hirez.programming.kicks-ass.net>
 <20210415090215.GA1015@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415090215.GA1015@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_022219_772539_C25C6CAC 
X-CRM114-Status: GOOD (  30.59  )
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

On Thu, Apr 15, 2021 at 10:02:18AM +0100, Catalin Marinas wrote:
> (fixed Will's email address)
> 
> On Thu, Apr 15, 2021 at 10:09:54AM +0200, Peter Zijlstra wrote:
> > On Thu, Apr 15, 2021 at 05:47:34AM +0900, Stafford Horne wrote:
> > > > How's this then? Compile tested only on openrisc/simple_smp_defconfig.
> > > 
> > > I did my testing with this FPGA build SoC:
> > > 
> > >  https://github.com/stffrdhrn/de0_nano-multicore
> > > 
> > > Note, the CPU timer sync logic uses mb() and is a bit flaky.  So missing mb()
> > > might be a reason.  I thought we had defined mb() and l.msync, but it seems to
> > > have gotten lost.
> > > 
> > > With that said I could test out this ticket-lock implementation.  How would I
> > > tell if its better than qspinlock?
> > 
> > Mostly if it isn't worse, it's better for being *much* simpler. As you
> > can see, the guts of ticket is like 16 lines of C (lock+unlock) and you
> > only need the behaviour of atomic_fetch_add() to reason about behaviour
> > of the whole thing. qspinlock OTOH is mind bending painful to reason
> > about.
> > 
> > There are some spinlock tests in locktorture; but back when I had a
> > userspace copy of the lot and would measure min,avg,max acquire times
> > under various contention loads (making sure to only run a single task
> > per CPU etc.. to avoid lock holder preemption and other such 'fun'
> > things).
> > 
> > It took us a fair amount of work to get qspinlock to compete with ticket
> > for low contention cases (by far the most common in the kernel), and it
> > took a fairly large amount of CPUs for qspinlock to really win from
> > ticket on the contended case. Your hardware may vary. In particular the
> > access to the external cacheline (for queueing, see the queue: label in
> > queued_spin_lock_slowpath) is a pain-point and the relative cost of
> > cacheline misses for your arch determines where (and if) low contention
> > behaviour is competitive.
> > 
> > Also, less variance (the reason for the min/max measure) is better.
> > Large variance is typically a sign of fwd progress trouble.
> 
> IIRC, one issue we had with ticket spinlocks on arm64 was on big.LITTLE
> systems where the little CPUs were always last to get a ticket when
> racing with the big cores. That was with load/store exclusives (LR/SC
> style) and would have probably got better with atomics but we moved to
> qspinlocks eventually (the Juno board didn't have atomics).
> 
> (leaving the rest of the text below for Will's convenience)

Yes, I think it was this thread:

https://lore.kernel.org/lkml/alpine.DEB.2.20.1707261548560.2186@nanos

but I don't think you can really fix such hardware by changing the locking
algorithm (although my proposed cpu_relax() hack was worryingly effective).

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
