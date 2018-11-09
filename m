Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2715C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 08:43:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3D8020840
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 08:43:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZG+YSP29"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3D8020840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oBwi12tfTVMFihKIAuABuV+qircSO0vTkYO/F4oeaWM=; b=ZG+YSP29WpWYsW
	nEe6bvq7Pks4w2vB1BkBtAb8jCm1UO4X/0GYyIemqKDSORaz4naKHXZCoGY8w4jWZpu8FB6YD1VaZ
	t4xOM2x0RGY6St6luexsLScDCP/Q8OARWUOEy35V6JQQ/hEdHUdbFSwACMtf9aGwv+w2H7tykWnoz
	Dcow7RfWdrAz0kj/XuuIAWO+HxOrEkx3JvT2qRGkBdHyYarftiQYt8v+Obj2jFkq5JvicKGNoPa1h
	AmKMTO6Q6DyyAGn3eF4cwEnZqQkNvTrZ4i93YOMEERcRZsQazqGhVBXt2ajM6vwEAKd9SrG9p2ngl
	b1wd1GT1pmJpT5HdxRKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gL2OD-00050L-2L; Fri, 09 Nov 2018 08:43:41 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gL2OA-0004zv-Sx; Fri, 09 Nov 2018 08:43:38 +0000
Date: Fri, 9 Nov 2018 00:43:38 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 2/4] irqchip: sifive-plic: More flexible plic_irq_toggle()
Message-ID: <20181109084338.GB6508@infradead.org>
References: <20181022114517.22748-1-anup@brainfault.org>
 <20181022114517.22748-3-anup@brainfault.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181022114517.22748-3-anup@brainfault.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109084338.UYIXbyD-OAL24u-mDqGHtsPgYN9woFyy4zghZLLy79A@z>

> -
>  struct plic_handler {
>  	bool			present;
> -	int			ctxid;
>  	void __iomem		*hart_base;
>  	raw_spinlock_t		enable_lock;
>  	void __iomem		*enable_base;
>  };
> -static DEFINE_PER_CPU(struct plic_handler, plic_handlers);

This does not match the changelog at all.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
