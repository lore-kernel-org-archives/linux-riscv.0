Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD82C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSxWFT5JWXD3NPg4J9vYVY2cjW7DxaUwlohy442jiTY=; b=pecvm+34tOfdA5
	UPylpwrpKm2bQcmv44cI/s6RxWOIZE0hoTfnRvioymcSl0CV5BUwVqymfvMPhnvpP5wbeUE1CVqzg
	qzSkaO4YtiJjKmj5zGQwOpK+L607Znx1kxcUM4X3gobY6rTz7S2jE5n7KJ/slAKCdhFH6dF8PJ3a6
	jxUphQnX7a7clmDb+qVof2VJooC8fKXBGdvJej3shFrlIbKKTqrKJGffb0WxbN5P8k2LMXRTsa7xs
	JaJJQh1T4o+SBOe95YW4sG06Z3ePkGGKFe9Hklek9x3iXTZWAhSVQx0rs4hdibtuodfqRXBF1nK6x
	iMUCMK+vOOoNr+L7cSXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx9vQ-00EjAo-Pu; Tue, 14 Dec 2021 15:41:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx9vO-00Ej9q-3Y
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 15:41:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2747B81B07;
 Tue, 14 Dec 2021 15:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230C9C34604;
 Tue, 14 Dec 2021 15:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639496463;
 bh=i8FKSIqV2eS4/ooZi6RLJpb4SBS7G50iXyqn/X4rmJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XYcMg4PyGtpbadSWa/qigudm/9GoS7I0mBQYuYwo41UHhowzQgi1ASsKvCUHGDy2Y
 8pmW7iAznCKiuGXKXSvYhLF75OMuyZivPxnra1Fn5McTzyaP2zmbzpNW+AnhV/KdnZ
 XD0K0BVDRz2u5+hBueF7QjCahrYoBLPhz1EdtylFiAXp9FSZR4HvonxgmeQ4xVeQyd
 krXOVIcn/kO+MnsLdE6yFp96sD+9zLeiwkGjv81O6DZFYwclHAuA4MFjBs+wxDYt5p
 yc4xPu7GwmkLokjyC3/J/8CTxypeP0YhU4yLvvRg49/cwTQYaSo854/Yayb0unQjvW
 a55fXoSP9NX/g==
Date: Tue, 14 Dec 2021 15:40:57 +0000
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Waiman Long <longman@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>,
 Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH] locking: Generic ticket lock
Message-ID: <20211214154057.GB15416@willie-the-truck>
References: <YXFli3mzMishRpEq@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXFli3mzMishRpEq@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_074106_317879_6334863E 
X-CRM114-Status: GOOD (  18.45  )
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

On Thu, Oct 21, 2021 at 03:05:15PM +0200, Peter Zijlstra wrote:
> 
> There's currently a number of architectures that want/have graduated
> from test-and-set locks and are looking at qspinlock.
> 
> *HOWEVER* qspinlock is very complicated and requires a lot of an
> architecture to actually work correctly. Specifically it requires
> forward progress between a fair number of atomic primitives, including
> an xchg16 operation, which I've seen a fair number of fundamentally
> broken implementations of in the tree (specifically for qspinlock no
> less).
> 
> The benefit of qspinlock over ticket lock is also non-obvious, esp.
> at low contention (the vast majority of cases in the kernel), and it
> takes a fairly large number of CPUs (typically also NUMA) to make
> qspinlock beat ticket locks.
> 
> Esp. things like ARM64's WFE can move the balance a lot in favour of
> simpler locks by reducing the cacheline pressure due to waiters (see
> their smp_cond_load_acquire() implementation for details).
> 
> Unless you've audited qspinlock for your architecture and found it
> sound *and* can show actual benefit, simpler is better.
> 
> Therefore provide ticket locks, which depend on a single atomic
> operation (fetch_add) while still providing fairness.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  include/asm-generic/qspinlock.h         |   30 +++++++++
>  include/asm-generic/ticket_lock_types.h |   11 +++
>  include/asm-generic/ticket_lock.h       |   97 ++++++++++++++++++++++++++++++++
>  3 files changed, 138 insertions(+)

Huh. I looked quite closely at this a while back but seems like I forgot to
actually reply here. So, given that it doesn't seem to be in linux-next yet:

Acked-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
