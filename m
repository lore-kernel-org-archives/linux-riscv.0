Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57CBC3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 01:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ldHzF+Oo4J1x9nPa0d1+DjM10vMCZZPCQTrfXGxC14=; b=w5LKIzTMxfgRjN
	v6d64ILACTzp038PIkYwXHKnipknECM/12WSIs/b7KFXf6JwuR2bECMM/QF73Nh4QC+Yv8vTvzRpW
	FxvyM8/UrwYqU9Z19sYOncNgPy+iTK5U0SjOrbqWPEK6FKYp5nKPFNQBlQMlJTKq2J7an1Td9NwAZ
	pzECUw5zbJLS4u87YKzBQk4ASqx5Bm+AkR2/feUmu3pn9x/T2pZPZiDAjR8CSmZMOhy9sux8F7vjj
	8Vgl0XgKt0SDZ+Z7fVkMo6qGeCLGUJZFzYQ4fxsGR94Wv6MeBdymIYID7xVwLXq3m602T7NCFmaiC
	HD42wXD0bxyRPRQ/911A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUcX0-00000001Ef0-1OuI;
	Fri, 19 Jul 2024 01:35:34 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUcWw-00000001Ee0-2Ile
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 01:35:32 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-8036ce66164so48434439f.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 18:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721352929; x=1721957729; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kCKSxmpGpgIaFLiWGefaq2tuapYPzU27sKjs+BRgK0I=;
        b=D6mpnJv2AKzniKxC/3jzyd+8kUgt0HaI3FBPTKk5MrYpQwM+jm8mrA6pkv0rDd7Do2
         dYHTOpeyxjans5z2oPJXLFEg3kl3qkXaSkeZzDUgu3POqVZlcm8aYT1gzx3Ank9XTsHg
         kQgZZKzIN8le5FQ6GPJXtJuinn72hyFqW0tToNCZQXaudwnf7Ge9I9kDo4NaA8rig9fX
         4GoJucbyGkQD7dcy+X61dnEAlT+BKzQuxA4tYkVMlUZ4gevF8asHxydIivPJVWj0yrsF
         O9hDm1wEBTJARla2cxpBzFxlCNfDPVc0VaD5NnoOmwGiagGxdjaSI6Q+h77LuBfIc/Vd
         nmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721352929; x=1721957729;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kCKSxmpGpgIaFLiWGefaq2tuapYPzU27sKjs+BRgK0I=;
        b=G8BAfVYmSIq34BNA8NeXdRpZl8tqnH/0hcg7GRh8hnTThTk7F4JpqWSSDwEnNrnDPJ
         fC3jmoSS9Y+jGZilzw+vKbnXjRIbA8S+jUECVt5PbhU1Bgp5CIS707oPan5kP45i4rVS
         J4FFjXLW+Cnv4P+9Bt3TFt0DBJFyNvgD24LWrzRWzgkf8dEy4DdM01o3G4Tms0oXHoLl
         jz5CrwP13d2jufjau68q3p+13DOhB63e4WRjQl8XrKCnirLYneg9PNPg60NWWbzpf1Ij
         wj9jUo1q6CzxdQvzob+dh2XbKv57TIT7q8Twfalf/fEiV6HZIb8TmApHNU8/kuyhEMvn
         ufaw==
X-Forwarded-Encrypted: i=1; AJvYcCWEgVNHTEeD5Va0i9LbmBSZF8jXQmKqJfpKZACuMTgVqAp55oqWwDFTgccRpMTFB7MU9ay+LHdX13oJGXQI0xv6klsSYYmIWFIdnmOEfHv0
X-Gm-Message-State: AOJu0Yy2LIQCvRId3+1nXUwl7W0RMFmhL/Ps+qx17n5M7MMOpvaDxfMo
	S7Ex4foD4OYPDFO/fr5PcB8kckyunJB9rVVz1yqzEr6my3o3DANPW3uD2RkG5aM=
X-Google-Smtp-Source: AGHT+IETQFuHKrO4/S58tyD5OTrRmmOWT93LlD/6BpqMiB9K7t92N18nv7O5GBBuy0MITzv7YIG4RA==
X-Received: by 2002:a05:6602:14c8:b0:806:560:92b5 with SMTP id ca18e2360f4ac-81710bd4048mr846335739f.11.1721352929336;
        Thu, 18 Jul 2024 18:35:29 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-819adeeec61sm15485539f.47.2024.07.18.18.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 18:35:28 -0700 (PDT)
Message-ID: <dca205a1-46cc-4712-bdb1-15517e63e824@sifive.com>
Date: Thu, 18 Jul 2024 20:35:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mailbox: sophgo: add mailbox driver for cv18x SoCs
To: Yuntao Dai <d1581209858@live.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, jassisinghbrar@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com,
 inochiama@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
References: <SYBP282MB223825D5903777B937A8A377C4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
 <SYBP282MB2238F93565D20F0A5F3EEB6BC4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <SYBP282MB2238F93565D20F0A5F3EEB6BC4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_183530_661406_C49B6D1E 
X-CRM114-Status: GOOD (  33.59  )
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

On 2024-07-14 11:36 AM, Yuntao Dai wrote:
> Add mailbox controller driver for cv18x SoCs, tested on mailbox-test
> client.
> 
> Signed-off-by: Yuntao Dai <d1581209858@live.com>
> ---
>  drivers/mailbox/Kconfig          |  11 ++
>  drivers/mailbox/Makefile         |   2 +
>  drivers/mailbox/cv1800-mailbox.c | 203 +++++++++++++++++++++++++++++++
>  3 files changed, 216 insertions(+)
>  create mode 100644 drivers/mailbox/cv1800-mailbox.c
> 
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 3b8842c4a..db856ec7e 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -286,4 +286,15 @@ config QCOM_IPCC
>  	  acts as an interrupt controller for receiving interrupts from clients.
>  	  Say Y here if you want to build this driver.
>  
> +config CV1800_MBOX
> +	tristate "cv1800 mailbox"
> +	depends on OF

This dependency is not necessary once the probe function is fixed (see below).

> +	depends on ARCH_SOPHGO || COMPILE_TEST
> +	help
> +	  Mailbox driver implementation for Sophgo cv180x SoCs. This driver
> +	  can be used to send message between different processors in SoC. Any
> +	  processer can write data in a channel, and set co-responding register
> +	  to raise interrupt to notice another processor, and it is allowed to
> +	  send data to itself.
> +
>  endif
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index 5cf2f54de..2c6db8c5c 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -62,3 +62,5 @@ obj-$(CONFIG_SUN6I_MSGBOX)	+= sun6i-msgbox.o
>  obj-$(CONFIG_SPRD_MBOX)		+= sprd-mailbox.o
>  
>  obj-$(CONFIG_QCOM_IPCC)		+= qcom-ipcc.o
> +
> +obj-$(CONFIG_CV1800_MBOX)	+= cv1800-mailbox.o
> \ No newline at end of file

Please add the missing newline.

> diff --git a/drivers/mailbox/cv1800-mailbox.c b/drivers/mailbox/cv1800-mailbox.c
> new file mode 100644
> index 000000000..a3b214b4d
> --- /dev/null
> +++ b/drivers/mailbox/cv1800-mailbox.c
> @@ -0,0 +1,203 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kfifo.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#define RECV_CPU 2
> +
> +#define MAILBOX_MAX_CHAN 0x0008
> +#define MAILBOX_DONE_OFFSET 0x0002
> +#define MAILBOX_CONTEXT_SIZE 0x0040
> +#define MAILBOX_CONTEXT_OFFSET 0x0400
> +
> +#define MBOX_EN_REG(cpu) (cpu << 2)
> +#define MBOX_DONE_REG(cpu) ((cpu << 2) + MAILBOX_DONE_OFFSET)
> +
> +#define MBOX_SET_CLR_REG(cpu) (0x10 + (cpu << 4))
> +#define MBOX_SET_INT_REG(cpu) (0x18 + (cpu << 4))
> +
> +#define MBOX_SET_REG 0x60
> +
> +/**
> + * cv1800 mailbox channel private data
> + * @idx: index of channel
> + * @cpu: send to which processor
> + */
> +struct cv1800_mbox_chan_priv {
> +	int idx;
> +	int cpu;
> +};
> +
> +struct cv1800_mbox {
> +	struct mbox_controller mbox;
> +	struct cv1800_mbox_chan_priv priv[MAILBOX_MAX_CHAN];
> +	struct mbox_chan chans[MAILBOX_MAX_CHAN];
> +	u64 __iomem *content[MAILBOX_MAX_CHAN];
> +	void __iomem *mbox_base;
> +	int recvid;
> +};
> +
> +static irqreturn_t cv1800_mbox_isr(int irq, void *dev_id)
> +{
> +	struct cv1800_mbox *mbox = (struct cv1800_mbox *)dev_id;
> +	size_t i;
> +
> +	for (i = 0; i < MAILBOX_MAX_CHAN; i++) {
> +		if (mbox->content[i] && mbox->chans[i].cl) {
> +			mbox_chan_received_data(&mbox->chans[i],
> +						mbox->content[i]);
> +			mbox->content[i] = NULL;
> +			return IRQ_HANDLED;

Are you sure you only want to handle one channel per interrupt? Should this be
"ret = IRQ_HANDLED;" or similar instead of early return? The same applies to
cv1800_mbox_irq().

> +		}
> +	}
> +	return IRQ_NONE;
> +}
> +
> +static irqreturn_t cv1800_mbox_irq(int irq, void *dev_id)
> +{
> +	struct cv1800_mbox *mbox = (struct cv1800_mbox *)dev_id;
> +	u64 __iomem *addr;
> +	u8 set, valid;
> +	size_t i;
> +
> +	set = readb(mbox->mbox_base + MBOX_SET_INT_REG(RECV_CPU));
> +
> +	if (!set)
> +		return IRQ_NONE;
> +
> +	for (i = 0; i < MAILBOX_MAX_CHAN; i++) {
> +		valid = set & (1 << i);
> +		addr = (u64 *)(mbox->mbox_base + MAILBOX_CONTEXT_OFFSET) + i;
> +		if (valid) {
> +			mbox->content[i] = addr;
> +			writeb(valid,
> +			       mbox->mbox_base + MBOX_SET_CLR_REG(RECV_CPU));
> +			writeb(~valid, mbox->mbox_base + MBOX_EN_REG(RECV_CPU));
> +			return IRQ_WAKE_THREAD;
> +		}
> +	}
> +
> +	return IRQ_NONE;
> +}
> +
> +static int cv1800_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +	struct cv1800_mbox_chan_priv *priv =
> +		(struct cv1800_mbox_chan_priv *)chan->con_priv;
> +	struct cv1800_mbox *mbox = dev_get_drvdata(chan->mbox->dev);
> +	u64 __iomem *addr;
> +	u8 en, valid;
> +
> +	int idx = priv->idx;
> +	int cpu = priv->cpu;
> +
> +	addr = (u64 *)(mbox->mbox_base + MAILBOX_CONTEXT_OFFSET) + idx;
> +	memcpy_toio(addr, data, 8);
> +
> +	valid = 1 << idx;
> +	writeb(valid, mbox->mbox_base + MBOX_SET_CLR_REG(cpu));
> +	en = readb(mbox->mbox_base + MBOX_EN_REG(cpu));
> +	writeb(en | valid, mbox->mbox_base + MBOX_EN_REG(cpu));
> +	writeb(valid, mbox->mbox_base + MBOX_SET_REG);
> +
> +	return 0;
> +}
> +
> +static bool cv1800_last_tx_done(struct mbox_chan *chan)
> +{
> +	return true;

Shouldn't this check MBOX_EN_REG(priv->cpu) or similar to check that the
receiver has read the message?

> +}
> +
> +static const struct mbox_chan_ops cv1800_mbox_chan_ops = {
> +	.send_data = cv1800_mbox_send_data,
> +	.last_tx_done = cv1800_last_tx_done,
> +};
> +
> +static struct mbox_chan *cv1800_mbox_xlate(struct mbox_controller *mbox,
> +					   const struct of_phandle_args *spec)
> +{
> +	struct cv1800_mbox_chan_priv *priv;
> +
> +	int idx = spec->args[0];
> +	int cpu = spec->args[1];
> +
> +	if (idx >= mbox->num_chans)
> +		return ERR_PTR(-EINVAL);
> +
> +	priv = mbox->chans[idx].con_priv;
> +	priv->cpu = cpu;
> +
> +	return &mbox->chans[idx];
> +}
> +
> +static const struct of_device_id cv1800_mbox_of_match[] = {
> +	{ .compatible = "sophgo,cv1800-mailbox", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, cv1800_mbox_of_match);
> +
> +static int cv1800_mbox_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct cv1800_mbox *mb;
> +	int irq, idx, err;
> +
> +	if (!dev->of_node)
> +		return -ENODEV;

No need for this check.

> +
> +	mb = devm_kzalloc(dev, sizeof(*mb), GFP_KERNEL);
> +	if (!mb)
> +		return -ENOMEM;
> +
> +	mb->mbox_base = devm_of_iomap(dev, dev->of_node, 0, NULL);

Please use devm_platform_ioremap_resource() here, which abstracts away the OF node.

> +	if (IS_ERR(mb->mbox_base))
> +		return dev_err_probe(dev, PTR_ERR(mb->mbox_base),
> +				     "Failed to map resource\n");
> +
> +	mb->mbox.dev = dev;
> +	mb->mbox.chans = mb->chans;
> +	mb->mbox.txdone_poll = true;
> +	mb->mbox.ops = &cv1800_mbox_chan_ops;
> +	mb->mbox.num_chans = MAILBOX_MAX_CHAN;
> +	mb->mbox.of_xlate = cv1800_mbox_xlate;
> +
> +	irq = platform_get_irq_byname(pdev, "mailbox");
> +	err = devm_request_threaded_irq(dev, irq, cv1800_mbox_irq,
> +					cv1800_mbox_isr, IRQF_ONESHOT,
> +					dev_name(&pdev->dev), mb);
> +	if (err < 0)
> +		return dev_err_probe(dev, err, "Failed to register irq\n");
> +
> +	for (idx = 0; idx < MAILBOX_MAX_CHAN; idx++) {
> +		mb->priv[idx].idx = idx;
> +		mb->mbox.chans[idx].con_priv = &mb->priv[idx];
> +	}
> +
> +	err = devm_mbox_controller_register(dev, &mb->mbox);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to register mailbox\n");
> +
> +	platform_set_drvdata(pdev, mb);

cv1800_mbox_send_data() could be called even inside
devm_mbox_controller_register(), so this needs to be moved up.

> +	return 0;
> +}
> +
> +static struct platform_driver cv1800_mbox_driver = {
> +	.driver = {
> +		.name = "cv1800-mbox",
> +		.of_match_table = cv1800_mbox_of_match,
> +	},
> +	.probe	= cv1800_mbox_probe,
> +};
> +
> +module_platform_driver(cv1800_mbox_driver);
> +
> +MODULE_DESCRIPTION("cv1800 mailbox driver");
> +MODULE_LICENSE("GPL");


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
