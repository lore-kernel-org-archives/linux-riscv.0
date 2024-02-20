Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3795C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 13:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LXhgQsoLqY/NYsEHGvMj+4kc127jEMXlxC4MJqfWD4=; b=eomJa2gvWMovol
	5Cp8JH7T+An4Jap8mvp4NTNREBSxydB1feTsO3nKYcsa3xDu8Z569nRV1I/dQTR9jxdzHR/4hODk/
	iYWsJ6FvKqzjXBiIwKTj5fnqYDyjbV/LF9PMCh3erHHwZGNqqLTAp2Oeqj9oSnWBF1LQY3A+NrHMW
	oqj91lzGTKNDnOUmFtcYGqYxAccLjHX+uykM+fRR59O/9Y/ZDS8xoSvyUkjgN+tX1qDt/LkHiY7lW
	OkAKMaalCDhTuqLyamg/nFUWNby+VXzP04vogY7RulsIbk/6+iYoOL8wxdAClLqC0Z3Iyh7BXXLOs
	AWWZAqNlHz+KpLr/vnhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcQHe-0000000EvWY-3Ms1;
	Tue, 20 Feb 2024 13:35:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcQHa-0000000EvU5-1q3h;
	Tue, 20 Feb 2024 13:35:41 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708436137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LxDrWUoqTF4UCOljm+/CQR8VV7wFryZe0gkav5P0KMk=;
	b=aVVHgztb0p2AuL7Y//VQvDZYfGZpXQN5XWAcU8UBDLmGuuETChzmXxLmq5h5ScgwFHze7S
	Qrbsh+puub63PQj4UbpCR45FNa6xbU4Htl+DfH8tEgeaP7w7kXFOMM+RfLgQ6e4+PNFGaB
	Q3KaF1ce77yqiwkNitCdX/QZSHpUOhWKeeGFnpV/K1p+kEB2Jz+P8N0ni980o9883Wp7bm
	qWzLleftZ7h+m920QAYEEuWBD3wTd2m8qpRTNrrVe7whar0/kLfTzf68DS+lRE7j0+hf3o
	uTpC+D08M49/FMfib/WWMXMz73OUCnDvjoQQlyJnygpS7/Pehj0sYTqxx7Rrew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708436137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LxDrWUoqTF4UCOljm+/CQR8VV7wFryZe0gkav5P0KMk=;
	b=5gi5BJKHwq+Hpu0n4anP6RYba/28i4acUk2Iqiwo1Rx6puv3PfE5WN6+88/uq/aFjix3jx
	geSB/GUV9HTRSGAQ==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v13 08/13] irqchip/riscv-imsic: Add device MSI domain
 support for PCI devices
In-Reply-To: <20240220060718.823229-9-apatel@ventanamicro.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-9-apatel@ventanamicro.com>
Date: Tue, 20 Feb 2024 14:35:36 +0100
Message-ID: <8734tni7h3.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_053538_649097_3F9C591D 
X-CRM114-Status: UNSURE (   6.81  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 20 2024 at 11:37, Anup Patel wrote:
>  static bool imsic_init_dev_msi_info(struct device *dev,
>  				    struct irq_domain *domain,
>  				    struct irq_domain *real_parent,
> @@ -218,6 +241,7 @@ static bool imsic_init_dev_msi_info(struct device *dev,
>  
>  	/* MSI parent domain specific settings */
>  	switch (real_parent->bus_token) {
> +	case DOMAIN_BUS_PCI_MSI:

	case DOMAIN_BUS_PCI_DEVICE_MSIX:

?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
