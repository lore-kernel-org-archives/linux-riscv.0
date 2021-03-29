Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0F7C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 17:01:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3AF06191F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 17:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3AF06191F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xIrkU9cOD4mvHdCSJk5gmNr9Rpz9VJ+1Ukhya6tIh6k=; b=bAvsrMfZvGhVY2bOXnqueYuju
	P5AdjiNpKO30kCM7vAHd8AXijQjS9dsytjAUjUDjQ8B29OwYzIwpZ1nTS9CrzLlKinzUbLTn1jq7h
	x+XQxnNdpJXBLoHxjCgGoaMF5toKMqy0EZ3EZiUQ8UKep2vMUypXNQMMgwbkwBPTs2VBo5jUTT4uz
	Ui65aI6wOj10NTXJXNuib1vgMBdtlSO+gnxuJdDt1pT0v+B9Jev0LSfMVCskGmWGuIB9RjrlxRaKH
	G9SrIcKmmcmP7TPSUO4gnNM1OlbUDTZRwq5bBUFaVOyTWLhilknhw7bXU/5cT6pS1o7ZzvuVwf2uQ
	G5RnNOXqw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQvFr-000or8-FW; Mon, 29 Mar 2021 17:00:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQokF-000Yzj-A1
 for linux-riscv@desiato.infradead.org; Mon, 29 Mar 2021 10:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RmtQjdY4jd7gdJlUZ3DW9jMcByENp8YMhL3jjISCf78=; b=nnsLTgcvgCRg3B8Fc0hgEyHVPa
 C3nz4ZoUQzUhylNi2HcH7gsoEOw0NP02VuD30ri51IFNz7TdHeT8fI856Z12noRCm6mDLZxDe54GG
 FcuZUNJLbDaeFENhAjbP8BsnJcQxz0D3Ue2kBv545ZemDljZy0HQZtA+o4hJkFkYyfG0vnwykvY0h
 UxSf6d+v1U+TfhvAocF63PQOzKYT4rXagudr+KYPJZSJCheIDn2HB6KLENrteYmJE5xFcHxximPDJ
 7YXs4t4aupq1wyuYM18uogTbiu005muh7DV+DWqh4GYKLgujOwVzYt4diS5ecQ/MkhQ7EDTR8mdUF
 6CmPI6cQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lQmew-001CUv-Cc; Mon, 29 Mar 2021 07:50:06 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 836C5305CC3;
 Mon, 29 Mar 2021 09:50:01 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 62B48207189A5; Mon, 29 Mar 2021 09:50:01 +0200 (CEST)
Date: Mon, 29 Mar 2021 09:50:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616868399-82848-4-git-send-email-guoren@kernel.org>
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

On Sat, Mar 27, 2021 at 06:06:38PM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Some architectures don't have sub-word swap atomic instruction,
> they only have the full word's one.
> 
> The sub-word swap only improve the performance when:
> NR_CPUS < 16K
>  *  0- 7: locked byte
>  *     8: pending
>  *  9-15: not used
>  * 16-17: tail index
>  * 18-31: tail cpu (+1)
> 
> The 9-15 bits are wasted to use xchg16 in xchg_tail.
> 
> Please let architecture select xchg16/xchg32 to implement
> xchg_tail.

So I really don't like this, this pushes complexity into the generic
code for something that's really not needed.

Lots of RISC already implement sub-word atomics using word ll/sc.
Obviously they're not sharing code like they should be :/ See for
example arch/mips/kernel/cmpxchg.c.

Also, I really do think doing ticket locks first is a far more sensible
step.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
