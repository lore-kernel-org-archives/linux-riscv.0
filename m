Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAFAC83F2C
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 11:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AoNtONrnkDCeNi3NyaqHukAXuZsmebIP8UJM0iSvcw=; b=E4nK6ok3iGWoms
	iDDGvgQEYAhvhdXUSDr6sUMd1FvfkfvXcCRkQQR3wNdYy+XI2melME5+MCP9eXuvQ+slgqjPFcncx
	DtP93x0yqz3c3g8m4rqM5kzkT6/maadJp23Zt+Y5Q4zIecBXcTyGSe+q8341hP/P2+FkPCy36oOw6
	I71w4yauX4oeRxgWzTtBY8J8G1CFXFyT1ikgGnxE31YxWGkvw4AkSDZxK097cKrW2xLpul4+r6A5h
	hIzG5QGmKCRKrEJdK05gIxO+PsIvjXHnX3XvnqyYUZkgZH2f8l9InGlZeFmJY79Dd9sHzy1ZrqawS
	RWQ0JKxJHHkPZ+XGPzeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdUBg-005tu5-2P;
	Tue, 05 Sep 2023 11:25:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdUBe-005ttP-2y;
	Tue, 05 Sep 2023 11:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Y+veJ7G7et4MOABC7+k7SGK7GisnFBtylzQKqH+19ng=; b=MrNi3pOkVFgnn/z5pOgCNWpywV
	VpUxARmJRIjDo/euZP3xmX1QXJD6ob4gOgMIeBnYSOtZDhDJqCW4YE/61HkyZGv64pBYUBMyG1LgY
	i8o1ZBRbQksOwFUtVH2TrFUXrKT+F6xk7qUkJ/rVKDtAuD8GGRvMWANRLl5Rv6ODkvJEJkBeL2Ke5
	T9BQVcS3Gaqvxs+KxJrr3iMOUj3dGjVNO5h/BTuLQ/o6TwHhyu3cOYUuv//LmtX6eD9xImbExHWz2
	4ROYy6TytD6UDOecWBIt/kF2EaeSLBNRVWDinNaK5j6W2vKsqR3cmNZSxDy0nAmhEj+ddoCAxA+jB
	4MVWVmoQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qdUBd-0097Ut-HR; Tue, 05 Sep 2023 11:25:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 34A4F300687; Tue,  5 Sep 2023 13:25:37 +0200 (CEST)
Date: Tue, 5 Sep 2023 13:25:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, viresh.kumar@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	conor.dooley@microchip.com, suagrfillet@gmail.com,
	ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH 1/4] sched: consolidate and cleanup access to CPU's max
 compute capacity
Message-ID: <20230905112537.GE28319@noisy.programming.kicks-ass.net>
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-2-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230901130312.247719-2-vincent.guittot@linaro.org>
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

On Fri, Sep 01, 2023 at 03:03:09PM +0200, Vincent Guittot wrote:
> Remove struct rq cpu_capacity_orig field and use arch_scale_cpu_capacity()
> instead.
> 
> Scheduler uses 3 methods to get access to the CPU's max compute capacity:
> - arch_scale_cpu_capacity(cpu) which is the default way to get CPU's capacity.
> - cpu_capacity_orig field which is periodically updated with
>   arch_scale_cpu_capacity().
> - capacity_orig_of(cpu) which encapsulates rq->cpu_capacity_orig
> 
> There is no real need to save the value returned by arch_scale_cpu_capacity()
> in struct rq. arch_scale_cpu_capacity() returns:
> - either a per_cpu variable.
> - or a const value for systems which have only one capacity.
> 
> Remove cpu_capacity_orig and use arch_scale_cpu_capacity() everywhere.
> 
> No functional changes.

I think the original thinking was that we wouldn't know how expensive
the function call would end up being, but yeah, given how things stand
this is a nice cleanup.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
