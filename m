Return-Path: <SRS0=sGlk=O2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8423DC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 18:27:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 541A12086C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 18:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kFOFCKnK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 541A12086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQuTucTyR/U4XXdO0d4+5Cflo2X2r/O8K7lFaglhSI0=; b=kFOFCKnKZrbzKw
	EYNqjpBUUp3aLH+As+XybAEZ2eLpw1ONS3gIeLiDddk5qpqSjHKDdumZdx0gYSyDDgis/SoNJapD6
	0S3wQC3grf+vk553lmF6/gUsxugxvJlkXacS2MZTs3jn/VSS1a5jfGQZB78HDAzMsudkTASitXXEo
	Tj9+yta7iz+N9diStWsvErZTMlXC0aVmy+HfWNdTYrQq+eMspwuV/GwwqqantI0azJNS5eiazHkBd
	jCA/FVD+Xtyz5e/011VK7JkM2Ue0x9koEf8rOM+lw6e0UfrpBHQy/DEHAbL91qZN8Tk/ZWK8D0B9X
	Ed8Roc2DF1+iYJZlNB6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYxbt-0003qm-Ho; Mon, 17 Dec 2018 18:27:21 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gYxbr-0003qR-UO; Mon, 17 Dec 2018 18:27:19 +0000
Date: Mon, 17 Dec 2018 10:27:19 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v3 3/6] irqchip: sifive-plic: More flexible
 plic_irq_toggle()
Message-ID: <20181217182719.GC7086@infradead.org>
References: <20181130080207.20505-1-anup@brainfault.org>
 <20181130080207.20505-4-anup@brainfault.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181130080207.20505-4-anup@brainfault.org>
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

> -static inline void plic_toggle(struct plic_handler *handler,
> -				int hwirq, int enable)
> +static void plic_toggle(struct plic_handler *handler, int hwirq, int enable)
>  {
>  	u32 __iomem *reg = handler->enable_base + (hwirq / 32) * sizeof(u32);
>  	u32 hwirq_mask = 1 << (hwirq % 32);
> @@ -92,27 +91,27 @@ static inline void plic_toggle(struct plic_handler *handler,
>  	raw_spin_unlock(&handler->enable_lock);
>  }
>  
> -static inline void plic_irq_toggle(struct irq_data *d, int enable)
> +static void plic_irq_toggle(const struct cpumask *mask, int hwirq, int enable)

It also removes inline statements which seems rather unrelated to
the patch description.

Also the actual addintion of the single cpumask argument is simple
enough that it should probably go into the patch that makes use of it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
