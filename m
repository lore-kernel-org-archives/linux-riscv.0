Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119C3C3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 19:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y99/2CMOcTMrAcILB6ls3tIY8bta/lqQX6/9neX4LhI=; b=OUkSFxb2MiIMMi
	w2ZdfPbROwHABJzur/YiCA4TZqHczjL+Ne3XiD6tNvHb/eBX7iSTs7hG1s1jKDn5OZfE+Hv3715vH
	oG2flhRrujmQk1T82M+H23IKTBKOGS/z9XMjchE67PilrOPez2lYRGzmoPWwoDHsI+USCzom0W39k
	QwMOQ6nN3s0hJRmGe9neCX0vM4l6PcGhK0+3dvPvoQJGGliVNzqam3UIIaj61zbY60mNBUY613d6F
	nJS5KD492AY6n7aGyfGyVZTaCpi7AGIGswzTL3UM1a3RoDJaYYccvJfu9TZKBiRFnRoolkBTM4PBz
	AvTx/OCtO10JCUTcO3vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYQ5-0000000ATi3-2TBg;
	Mon, 12 May 2025 19:02:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYII-0000000ASnG-46tt
	for linux-riscv@bombadil.infradead.org;
	Mon, 12 May 2025 18:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VltVeIv5GGxIG9RGHvKQLO3xUlUvGDSdlR7aKaJ6JdA=; b=gCeZlsAj/DfeIiM1JpOXJAlgSA
	vX3eSGes/KAEDV/r0uVXWi+JHORO88uABUDTflwmwKVYOtEmsEcZmEtaVPpqwL8jdSvwT89YI0ivi
	NouRJzmW8zmTZMG9lnjXirU0IH6CYL9QrtQt5HurZ8fCzzQWf8pDliJIfd/xXTP5QakgFgh+VufiL
	I2msw3YIN7jP8i7UgjiL0fvrBar00ScOOZRY1RwHqki/bLZUAIOzZ+waTbEVgS1efbT4pWCZ6fnMP
	/7AziV6gz54ylT/EvSD6/48CEx8ctC/6bG+4TGjsDub9XHEAe+yIVZmqfh7Fn5n6j+D0La07C6DOY
	G50CFh6Q==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEYIG-0000000GoFZ-0qjh
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 18:54:29 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747076064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VltVeIv5GGxIG9RGHvKQLO3xUlUvGDSdlR7aKaJ6JdA=;
	b=btrch/cEqr86dJRGQsEtfull/9m8ry+o3G9q0NtUrv/YMAUIYJqpFJM5bBQP0+LNvRD5a+
	C9zptRY6IItC5UFhaUFOT8s3ez+IzUYAHs6ZQgWSt02DI1kgYbwhOczAqmaL0uGoDoQm6w
	7uBm9/WgU/cORCvBkcKacZB0kAhj1W1rvxjrKOYnaspl2NXhz+47KRwoo0UwakyB3kMCJk
	VMpY/uqL9C2fHGdlIsppX0Gm9XbQv6mQttIz2p7j05TRTFiB45EZ1TDa/kfZb+B5bbadQI
	MvuExGR8ytiDNUIOtPG1yTw4pym7BROvJCMponID1E70wZhYEvKJ7ySRa8rqzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747076064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VltVeIv5GGxIG9RGHvKQLO3xUlUvGDSdlR7aKaJ6JdA=;
	b=iVBNKaOLSUGLqgjfwTl9NiIJgJE83w1jasJXi/sW1/C9czlM5w3qvg6WUTwUmY9RAZOR33
	6i5DbdKJNlgBBmDA==
To: Anup Patel <apatel@ventanamicro.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: Re: [PATCH v3 07/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
In-Reply-To: <20250511133939.801777-8-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-8-apatel@ventanamicro.com>
Date: Mon, 12 May 2025 20:54:23 +0200
Message-ID: <8734d9lkww.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_195428_367373_C95966A8 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, May 11 2025 at 19:09, Anup Patel wrote:
> +
> +static irqreturn_t mpxy_mbox_irq_event(int irq, void *dev_id)
> +{
> +	/* We only have MSI for notification so just wakeup IRQ thread */
> +	return IRQ_WAKE_THREAD;

I was idly reading through this because I looked at the irq chip.

This function is competely pointless.

> +}
> +
> +static irqreturn_t mpxy_mbox_irq_thread(int irq, void *dev_id)
> +{
> +	mpxy_mbox_peek_data(dev_id);
> +	return IRQ_HANDLED;
> +}
> +
> +static int mpxy_mbox_setup_msi(struct mbox_chan *chan,
> +			       struct mpxy_mbox_channel *mchan)
> +{
> +	struct device *dev = mchan->mbox->dev;
> +	int rc;
> +
> +	/* Do nothing if MSI not supported */
> +	if (mchan->msi_irq == U32_MAX)
> +		return 0;
> +
> +	/* Fail if MSI already enabled */
> +	if (mchan->attrs.msi_control)
> +		return -EALREADY;
> +
> +	/* Request channel MSI handler */
> +	rc = request_threaded_irq(mchan->msi_irq,
> +				  mpxy_mbox_irq_event,
> +				  mpxy_mbox_irq_thread,
> +				  0, dev_name(dev), chan);

Just do:

	rc = request_threaded_irq(mchan->msi_irq, NULL, mpxy_mbox_irq_thread,
				  0, dev_name(dev), chan);

and be done with it. The core code will happily wake up your thread.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
