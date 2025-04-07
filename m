Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A02EC36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 06:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95uR33R1ShVQ7LHLAFSqgteKsfNQ8pDASe/hlMTW6LI=; b=WNrumrGrVLcJLJ
	1ZmL8RYGCCaROc7Z55/I3SQOlJ8cGjy/2lXe3dMla+gtci0mNX6zwDLySnTTCmYZIEv8SVssz6BAc
	HG3MkLl1fNTnFkai3eYzyV1m6+oQfZ4dwpRWqDnuMML2X/IinGn/r1g85eh7Zsa0hS2EHPy3ArCRo
	YanKrIMC4qlo1e+mX5jYbl6qsRn2mXTmfLeK4FASKgLZRu7rGzFUs/Wq7WfQTAgrFRBxf5lhPcODd
	jDbzUCVYkhE1qr3qIvi8SPeTvyvTkgkPMHM3ghzk7nju4T8TAwbMAytE6uyrdG2TJCTr3Q7rzYsNx
	oOrBhzov1lat2jCzQ1WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1fwJ-0000000GZ5t-2gKk;
	Mon, 07 Apr 2025 06:26:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1fvz-0000000GZ1I-1xkJ
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 06:26:16 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744007171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NDhQJ/t15EySqNMSJwo0T9+q87wLcRofE5O8cA2eoM=;
	b=zqOC2w5qTPayNONDyYUx1a0HVCAXMdoUEY6JEROy9Xi9nW7cCpnTBfeBqcKFqOzwq2I++f
	6sJdziw3cWVPRPu2vSWNw2aatT0h2q/ifnpbXFNHciPbq/t81WKIQEYvn7EXqXd0hdZnBL
	JoT8D5h2T8PgqwEZtD2978aj9UH6QlyckRHvUrZOm2CqFj84mTUIGyrDZ1tGhxfgpH+a/2
	rmlmQKrpIR+YXxZeIFhcNfCfspydmAjGhVwzXkfOGQdR5KFlDQt3xfsMXCCg7eCAZ3YETI
	1S1YFZk8YC3TggPaEmj09FJp8mj5Jt4j9PXZGEM1RpY/lihple151wIWYhXw0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744007171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NDhQJ/t15EySqNMSJwo0T9+q87wLcRofE5O8cA2eoM=;
	b=/Wcif2q8sa6pdJkzn2mox+ebiSKFMMt8xQnb4BYkXDvDYTOdILKESpSD5LNJfOqrFZu6b2
	mmAOyP6pyrS/wICQ==
To: Maxim Kochetkov <fido_max@inbox.ru>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, peterz@infradead.org, elver@google.com,
 namcao@linutronix.de, samuel.holland@sifive.com,
 daniel.lezcano@linaro.org, apatel@ventanamicro.com
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Subject: Re: [PATCH 1/1] time/sched_clock: move sched_clock_register() out
 of .init section
In-Reply-To: <20250404050540.13507-1-fido_max@inbox.ru>
References: <20250404050540.13507-1-fido_max@inbox.ru>
Date: Mon, 07 Apr 2025 08:26:11 +0200
Message-ID: <8734ekwkqk.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_232615_651758_48A35E02 
X-CRM114-Status: GOOD (  10.53  )
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

On Fri, Apr 04 2025 at 08:05, Maxim Kochetkov wrote:
> The sched_clock_register() is widely used by clocksource timer
> drivers. The __init prefix forces them to be initialized using
> macro TIMER_OF_DECLARE with __init prefixed function.

No, it does not. It requires that they are built in, not more.

> Clocksource devices can be consumers of some external irq, clocks,
> resets, e.t.c. Such devices can't be correctly probed if this
> dependencies are provided by platform drivers. Because of regular
> platform devices are not probed at this moment.
>
> We can convert clocksource drivers to platform device drivers to
> fix this issue, but __init prefix in sched_clock_register()
> prevents it.

Again. It does not. What the __init prefix prevents is that the driver
can be built as a module and loaded late.

> So lets drop __init prefix to allow platform device drivers to use
> sched_clock_register().

s/So let's//

"So let's" means nothing.

Also this has nothing to do with platform device drivers. It's all about
modules and nothing else.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
