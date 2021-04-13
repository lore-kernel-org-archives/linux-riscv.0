Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8504C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 08:17:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D408761369
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 08:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D408761369
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y+3tCfy/xgji3Nohj+AJVxwvpZlBxwZvZ8FFW/TqlYU=; b=ZJDfAIto6e6lAp6lnAuFMg3Jx
	FX2LVNytf3mg2mYOaPokcfNSVBb1SU4t63PyWEtuEcQTyXQC2QXBNeiIVBhcqsDgmSAmv8fEC/Lss
	CMjP2bG3Js21UuuN39flRAD0PaJ6/oUzL2AL6+qzDnJegBiEX5xbijU1/DK1oSLOBl1ZWCPgK4LKi
	4PH4jJjGcIjkjzeFUAlyX5ugD01x/0Sy8qnb5Xss4RAg89oPoCu/mmFtwsLlRSaDT4kDuPRBZAGdl
	In0M1DnMgSRLrawBOf65aX9tX02I2F0pW4YYTzcuyy2eOh+lOXDk8YS3ydpaSrviRIDWJ+AHP8vt2
	2fifDcx6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWEET-008ZRs-0H; Tue, 13 Apr 2021 08:17:13 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lWEEM-008ZRN-DN; Tue, 13 Apr 2021 08:17:09 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D990D3001F6;
 Tue, 13 Apr 2021 10:17:05 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6667E20224209; Tue, 13 Apr 2021 10:17:05 +0200 (CEST)
Date: Tue, 13 Apr 2021 10:17:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, catalin.marinas@arm.com,
 will.deacon@arm.com, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
Message-ID: <YHVTgfCpxpINc8sM@hirez.programming.kicks-ass.net>
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
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

On Tue, Apr 13, 2021 at 10:03:01AM +0200, Peter Zijlstra wrote:

> For ticket locks you really only needs atomic_fetch_add() and
> smp_store_release() and an architectural guarantees that the
> atomic_fetch_add() has fwd progress under contention and that a sub-word
> store (through smp_store_release()) will fail the SC.
> 
> Then you can do something like:
> 
> void lock(atomic_t *lock)
> {
> 	u32 val = atomic_fetch_add(1<<16, lock); /* SC, gives us RCsc */
> 	u16 ticket = val >> 16;
> 
> 	for (;;) {
> 		if (ticket == (u16)val)
> 			break;
> 		cpu_relax();
> 		val = atomic_read_acquire(lock);
> 	}

A possibly better might be:

	if (ticket == (u16)val)
		return;

	atomic_cond_read_acquire(lock, ticket == (u16)VAL);

Since that allows architectures to use WFE like constructs.

> }
> 
> void unlock(atomic_t *lock)
> {
> 	u16 *ptr = (u16 *)lock + (!!__BIG_ENDIAN__);
> 	u32 val = atomic_read(lock);
> 
> 	smp_store_release(ptr, (u16)val + 1);
> }
> 
> That's _almost_ as simple as a test-and-set :-) It isn't quite optimal
> on x86 for not being allowed to use a memop on unlock, since its being
> forced into a load-store because of all the volatile, but whatever.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
