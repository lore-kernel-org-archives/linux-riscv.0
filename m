Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BB4C02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 13:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQE5e+CVx1Qm1HhVUKQBUMfxgAUiNKXeblynFf0wlNA=; b=HRZI9j8AHI5iX9
	shxizRd0CrLOnsL1Fq8VueKfqzj0O+wEMeN5pMGynwcZMIOTGy3ft1GOSOInVIZcdk9nlk7Hf3cAy
	goFYys67E+vuKEA+1UyszPJBm4dJQa+XutBSqxjGse4X2C0mz9Ik1Tm+hpk/dBQl2gX5KzUYauS3i
	sDajVeSfORg0XdfpIm5n3xY7QhukkosSxNuY3udqzcg9Xf1emySIrCpoZAnpsUtsbzetTBFn65azE
	nsDXtmIfyz5FY4vK45xutJv6IMFt9Ao4MbrdbadLg1RL9DNKA23HclcyEg6Ejci+5K5Xee+QjTDAV
	j9p+YruFGDfy9a75IjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tewqO-0000000FZ4p-3W9V;
	Mon, 03 Feb 2025 13:50:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tewqL-0000000FZ2u-1eXv
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 13:50:31 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738590625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b6Of9Maol3sWb4Qd1PmgWM14UjgECcDGsYYP5rsqQCs=;
	b=U5jaqNcMlFG5jGUh4vFVWUw9In4xCjDxNDywuREBOqlz4BERqG45SK/+Y2a2rK2Z5ARoWY
	XSevM0A8IV42ag6PM/OWDnstR9LqjG73l5sP/9IeMClScaCIoivLkQUQQg5pGcNKBsLkGD
	OhXut0RPsEsICc6kSiffCjOuxcsFujatSi3NqHBj1mR6Ly0QdOCXSsnKwK7Zhx9mEdeVf6
	8kxBK2XpMmF0djWkmbyz8BQiNvX9ZrkuACg/3LPvR40baOM5N3M/hAOy2RWW4eUtY0dEDa
	u/Yzcd5EWUWPOQMwyY81h8P9l7kImUpWEgDwwXIuC0qs7lBHVQuWZc+bwoqyOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738590625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b6Of9Maol3sWb4Qd1PmgWM14UjgECcDGsYYP5rsqQCs=;
	b=AsX4h4lhbtuQKC3s5kDd+iyWyhy/gKuPT6L8gRJFgrXKN/DlC/9vqgl33WtQVjIQCGeIzm
	Am1dUDJTihGrF+BQ==
To: Anup Patel <apatel@ventanamicro.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: Re: [RFC PATCH v2 11/17] irqchip: Add driver for the RISC-V RPMI
 system MSI service group
In-Reply-To: <20250203084906.681418-12-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-12-apatel@ventanamicro.com>
Date: Mon, 03 Feb 2025 14:50:25 +0100
Message-ID: <871pwfp272.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_055029_576091_468CDF9A 
X-CRM114-Status: GOOD (  10.93  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 03 2025 at 14:19, Anup Patel wrote:
> +
> +struct rpmi_sysmsi_priv {
> +	struct device *dev;
> +	struct mbox_client client;
> +	struct mbox_chan *chan;
> +	u32 nr_irqs;
> +	u32 gsi_base;
> +};

AS requested before please use tabular layout for structs:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers
 
> +static int rpmi_sysmsi_set_msi_state(struct rpmi_sysmsi_priv *priv,
> +				     u32 sys_msi_index, u32 sys_msi_state)
> +{
> +	struct rpmi_sysmsi_set_msi_state_tx tx;
> +	struct rpmi_sysmsi_set_msi_state_rx rx;
> +	struct rpmi_mbox_message msg;
> +	int ret;
> +
> +	tx.sys_msi_index = sys_msi_index;
> +	tx.sys_msi_state = sys_msi_state;
> +	rpmi_mbox_init_send_with_response(&msg, RPMI_SYSMSI_SRV_SET_MSI_STATE,
> +					  &tx, sizeof(tx), &rx, sizeof(rx));
> +	ret = rpmi_mbox_send_message(priv->chan, &msg);
> +	if (ret)
> +		return ret;
> +	if (rx.status)
> +		return rpmi_to_linux_error(rx.status);
> +
> +	return 0;
> +}
> +
> +#define rpmi_sysmsi_mask(__priv, __msi_index)		\
> +	rpmi_sysmsi_set_msi_state(__priv, __msi_index, 0)
> +#define rpmi_sysmsi_unmask(__priv, __msi_index)		\
> +	rpmi_sysmsi_set_msi_state(__priv, __msi_index, RPMI_SYSMSI_MSI_STATE_ENABLE)

These macros are not really providing any value.

> +static void rpmi_sysmsi_irq_mask(struct irq_data *d)
> +{
> +	struct rpmi_sysmsi_priv *priv = irq_data_get_irq_chip_data(d);
> +	int ret;
> +
> +	ret = rpmi_sysmsi_mask(priv, d->hwirq);
> +	if (ret)
> +		dev_warn(priv->dev, "Failed to mask hwirq %d (error %d)\n",
> +			 (u32)d->hwirq, ret);

        if (ret) {
        	....
        }

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#bracket-rules

> +	irq_chip_mask_parent(d);
> +}

Other than those nits, this looks reasonable.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
