Return-Path: <SRS0=4Q7i=IW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742BCC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 11:10:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14FB7619E0
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 11:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14FB7619E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L8N1URze0HoGrOqgqP/maGBKHDD/ACXb/qSziMCw9SM=; b=ph/7NbRmlGtnjhqtWQ092PfKU
	1fXpzX8u0XqAO8xrVTnwWfEe6dC3zIMq2U6N0jJa41kwB5vq6VRvR92VOguURXrwuj3iW++VFiDa9
	d2DNWi42+rYOHb7sC9vXA0lVo00DkW1c9W/KagC1FN6B9uUrelN/9uv5FkKON9bF5vjU0f3J7S2aC
	y3Hpfk9Sx3JCtZAUVatvFVJahk9V48BioGlSRs8fwPZMyGSapLPwV/TpsA73+ZL/sdY5Cpu0BdrcM
	c0AhrM50OHrk5Kbj8RsKcqgsImKeUX8q890Mdm4S4hz7PQoeQbWzY+NoSFtbFgXhXwxotXS36zJLB
	Fb7O4gFcw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP1OT-00GyOX-8h; Wed, 24 Mar 2021 11:09:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP1OQ-00GyOS-RR
 for linux-riscv@desiato.infradead.org; Wed, 24 Mar 2021 11:09:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3T8iu/qdOkx2N3h+JT3OPgD2ctqodSwNmXaB7wutWzA=; b=lnQQHrIn6MADzhda+f8n/XYl6e
 ZR3Cyl1TtYeVGMyTw9gmG3b6Z4zz4MQI+pIdHuPq85cl/9zzqG6+Z0MGRDdEMagII+txSiRO7PeWA
 r0F/HEOkTcnToQ1quMwVezUsvRZyu0yO8FuWUwJKHo2IgZUGZ6wlW5mi9bP7X8f+yRwF9V5ITBY/K
 levcbfd3jRvy5iItCXZq87VNBi7jbIkbqBeg+h4f/ro1SrF5NQUuNhLGvn88cdNzMAYy0UeZ5zGpS
 Zeoa6fJ3RamzmkB09WJrJ5WJHK/8XutRPGgSZKfBdmC1VAde5w/v+6/ObAKO09+406yUAN6zyKVm5
 q8xCtr5A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lP1OH-00BGwS-AS; Wed, 24 Mar 2021 11:09:37 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8F6413010C8;
 Wed, 24 Mar 2021 12:09:32 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6C17A28B290D3; Wed, 24 Mar 2021 12:09:32 +0100 (CET)
Date: Wed, 24 Mar 2021 12:09:32 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
Message-ID: <YFsd7A6xzrWXi1l5@hirez.programming.kicks-ass.net>
References: <1616580892-80815-1-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616580892-80815-1-git-send-email-guoren@kernel.org>
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

On Wed, Mar 24, 2021 at 10:14:52AM +0000, guoren@kernel.org wrote:
> +static inline void arch_spin_lock(arch_spinlock_t *lock)
> +{
> +	arch_spinlock_t lockval;
> +	u32 tmp;
> +
> +	asm volatile (
> +		"1:	lr.w	%0, %2		\n"
> +		"	mv	%1, %0		\n"
> +		"	addw	%0, %0, %3	\n"
> +		"	sc.w	%0, %0, %2	\n"
> +		"	bnez	%0, 1b		\n"
> +		: "=&r" (tmp), "=&r" (lockval), "+A" (lock->lock)
> +		: "r" (1 << TICKET_NEXT)
> +		: "memory");
>  
> +	while (lockval.tickets.next != lockval.tickets.owner) {
> +		/*
> +		 * FIXME - we need wfi/wfe here to prevent:
> +		 *  - cache line bouncing
> +		 *  - saving cpu pipeline in multi-harts-per-core
> +		 *    processor
> +		 */
> +		lockval.tickets.owner = READ_ONCE(lock->tickets.owner);
> +	}
>  
> +	__atomic_acquire_fence();
>  }

> +static inline void arch_spin_unlock(arch_spinlock_t *lock)
>  {
> +	smp_store_release(&lock->tickets.owner, lock->tickets.owner + 1);
> +	/* FIXME - we need ipi/sev here to notify above */
>  }

Urgh, are you saying your WFE requires an explicit SEV like on ARM ? The
ARM64 model is far superious IMO, and then you can use
smp_cond_load_acquire() in arch_spin_lock() and call it a day.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
