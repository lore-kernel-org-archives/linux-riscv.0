Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD7DC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 09:23:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CACD61183
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 09:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CACD61183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lds7pG6wVvD8qwg7RYj6qXXDMdnots9w4rOfIVYB4Lk=; b=fZqS9NjkuNUO4M
	W3vb7LFUNNgimlZRipeF3OtwnSLRh/HC/sQtncVSWZbwKOPSIUkF+AI8lD9eDk+LoXy5UJ3schWTR
	XhqLD2o0ZScD0m1BDF+aKT+thmlnyXOZKQHPqqXxfRMVh3arbYaUhZxijnTlrh/seRVm6r8242WN6
	8oD3+92Q5FRyfIDYKj+GwzWO3lkRipQsm8M+CaqEyuWRjmNNVa5xNVSz04uU5BHktAYOr2PdS45TZ
	Kf6TnOFr9sPrwZ6gn8LT6hmlMb80DFfccqmUg5Aj6lTRxOPeUf9RoyRdxf2q5vdR2yGeXYKyG3T2n
	9hSnel3Es+kyXzwAEVpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdqla-00AMSD-QZ; Fri, 22 Oct 2021 09:23:10 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdqlY-00AMRG-Jv
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 09:23:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46697ED1;
 Fri, 22 Oct 2021 02:23:07 -0700 (PDT)
Received: from FVFF77S0Q05N (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 20CC63F70D; Fri, 22 Oct 2021 02:23:05 -0700 (PDT)
Date: Fri, 22 Oct 2021 10:23:02 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Christoph =?utf-8?Q?M=C3=BCllner?= <christophm30@gmail.com>,
 Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH] locking: Generic ticket lock
Message-ID: <YXKC9qh+evVmUuLI@FVFF77S0Q05N>
References: <YXFli3mzMishRpEq@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXFli3mzMishRpEq@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_022308_719654_BE6515A6 
X-CRM114-Status: UNSURE (   9.44  )
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

Hi Peter,

On Thu, Oct 21, 2021 at 03:05:15PM +0200, Peter Zijlstra wrote:
> +static __always_inline void ticket_lock(arch_spinlock_t *lock)
> +{
> +	u32 val = atomic_fetch_add_acquire(ONE_TICKET, lock);

I wonder, should these atomics be arch_atomic_*(), in case an arch_ or raw_
lock is used in noinstr code? The plain atomic_*() forms can have explicit
inline instrumentation.

I haven't seen any issues with qspinlock so far, and that also uses the
(instrumented) atomics, so maybe that's not actually a problem, but I'm not
sure what we intend here w.r.t.  instrumentability.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
