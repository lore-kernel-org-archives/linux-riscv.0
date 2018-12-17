Return-Path: <SRS0=sGlk=O2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B44C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 18:24:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18C0020675
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 18:24:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z5uTJlwm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18C0020675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7sJVdgGEAJjcYrUnBq4kDAiqP3c79sm5sZHOWbUlw4=; b=Z5uTJlwmsorN0x
	elmmYGYSkgL4ibhb6FB2rnO3iA8jsMeb9gh/SbqGeNjLGwLkBmy/U8Uwrkh8utBaKHftTVXv38tHk
	EnXXheR7jcANKziShhX9/IiVuwC5sZ6ZQQ5cM7fTq0rq7AZR6Lmm1idyV09xAofMVHmdYHWHbUKMj
	mB3/B8u/1bvXNucV1wUSgucaAyRhsXM4YUd8DhPcnlkocMDpnd/0srKUXcoqTZlI5xAH+HSHDKRYA
	mvYqdBIb/hHoYsEUpoqHJj3zudoNHUNz0gbDvoFQiYRXCT9GGrI99trSd9Yv0jBzR6lng2KtIqK/h
	nOJ2IevsBMkJ4ljD/FKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYxYx-000275-KR; Mon, 17 Dec 2018 18:24:19 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gYxYt-00022m-Qp; Mon, 17 Dec 2018 18:24:15 +0000
Date: Mon, 17 Dec 2018 10:24:15 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v3 2/6] irqchip: sifive-plic: Add struct plic_hw for
 global PLIC HW details
Message-ID: <20181217182415.GA7086@infradead.org>
References: <20181130080207.20505-1-anup@brainfault.org>
 <20181130080207.20505-3-anup@brainfault.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181130080207.20505-3-anup@brainfault.org>
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

> +struct plic_hw {
> +	u32			nr_irqs;
> +	u32			nr_handlers;
> +	u32			nr_mapped;
> +	void __iomem		*regs;
> +	struct irq_domain	*irqdomain;
> +};
> +
> +static struct plic_hw plic;

Please use local variables instead of a single instance struct.
And only add these variables in the patches where you actually need
them.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
