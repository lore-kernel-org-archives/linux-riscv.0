Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF816CAC5A7
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 12:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=815yV3cXSv/cKxHjM+pQHiaQtD8AeGkLktzJvej3Stg=; b=y1ZQerTNiNyb/7
	lGbzhxFKrQY0nKN0Y7ONExTCgI8ZvlIiYKMFKNZgEwaSo+VjFMxPgFuY3Di6wFc86J2WqIM59a30t
	YvpH4ngPOP80A4TjyWGQdVrDWQ4eMW9LS+gAjaTVXJnOwLVMG/ynssc/vFlYX9XW/lHdV7D9ecqMb
	T8fjhS/FqB3x7juM+xceoFs+XNW5+3RZmR7xbEfIWFKMQam1DLv3ZdVCh5YsJ+BaYnVRqLBuHEItH
	Gj6HDJGAr2Fbneh+Oe7AZbWlgNnXQh+tEixuvAe7H+P16fDC9cSgfRsIz+7gcNX+iDIo4uPn4l+Od
	sAewUCqz9kPAUB0dUo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12SX-0000000DLNn-2Dmd;
	Tue, 23 Sep 2025 12:49:29 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12SU-0000000DLMb-1u24
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 12:49:27 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-4248c9a64f7so16570895ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Sep 2025 05:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758631765; x=1759236565; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ZU9aQ8bM7T2Ftc+EDUk8mZlFRUJvemFzpUBxk0Wb8I=;
        b=VNy2FC9TJXWNZr2W8Lf8od//tLLMB7/clg0Rvlj8RNXBeXHXA1K7HOd0xBJqdI8Dw1
         z+f+rIGTNP3brGDpDTDFelbnrd4ImkrH+LkBb+QAeW+VhbKtfh6EZ0FwP5Y+kKRHazyS
         3wQ+Z7XUazP8aW55OFNO1in8b0K5a9gmE7xFJZ2k7vInXqRPUgr/PW9MjWqe8lozxwgY
         Zkr7gNleq9SbzvKciZmzplOasQDXiOtWoQpNziQGP2INTb8uWsg3TXzsPxfY2lAzj8vW
         GAH+4SrAfu4hK+jikEG8sZ57AH6+23FIuahMSFPCrO7cM9Rkx7ZJgFmi0OuuKGWfLJKn
         C82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758631765; x=1759236565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZU9aQ8bM7T2Ftc+EDUk8mZlFRUJvemFzpUBxk0Wb8I=;
        b=qXnVahL4D1eqc/N+j+L9jIyzHn83jjLYj4AvjRYJgbJwCfdJBypqzEOkAhvKwykWlJ
         7WdHDtlGCPOCQnDxPCDd03kefaW6irNrGdZyMLMtZu6amUmQfzJQNYbjMiHBbDrRkgCj
         A4qcn5jfXygtsj+cUpEHdL0uzBTQkKJg9O/8BsBaoMUnqQJ2lylmtAUMzIVt+YB5wTWe
         qJhlb3ok4jiQ3S8+0DflEDeotiga8CIDmncJhTtNCWEXa9MTSo9nIpGVb3pOQC4K4qU8
         P0tXZ2Y0jVQGnXKPEh0YWDRXb8w/Lq81BS/Hbh3J7kA8kvkWPVnCI9UFhU6YPweq04Tb
         KMUw==
X-Forwarded-Encrypted: i=1; AJvYcCX/9bVyEXGZSO6VBN6nUOo0550H+RypY6nWGOIm9JMOf9y3Eiyhb8p1MYZxSZpAa+nwwGhkuJ4HiYnj5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzD/TCAmzUx49XZM9S/oLN+ioZOsA152JsD144BsbI3H/CqPNIN
	oJuteMGXP84uZw5G+XdFtDuyP4lpd6YNL0pOstRWd5fAdndh5mY+fRik4bkA8Lbt0nw=
X-Gm-Gg: ASbGncsK3hgf0cohc744r4u467Z8qMnksDpDsubc7/yKpd61fULgsgYtGxP5WjZAubr
	ERKWt3KqWuWgejBjdm2ESjK2+2IcGOPjXXwcL+D+HJoeQdGo+DdMWDDextokK0J5l2IcoDOQem3
	Fgq6rm7gcZYNjTSU7DKO2u4K+kh2ipb75kD3aZAMxvOzX3JSuhJh0kwhBW+9OrOoNjRHSXfKSp7
	ggOTIW3p3EJOSksjlmnHEg4EzIo8DZhgV6KCIHKFf3tsDgTnLO5eD4R9vyz0pWwJ6tUUZ95Bsrw
	kYhfhkfHtythoCdh2KSv+K/e9P9J7I5CXFmnfAXXFgrDPvvpOnUgRW/HHBybX7RylCG77G2+ut9
	b0OMtloq3eDNPhzKlnA87pAYrUA/TvIT/+DSvuVBlI6COjd+1ue7ZBY0fnr8VHQ==
X-Google-Smtp-Source: AGHT+IFj1XQAMzFpu45XELaWdmBGc77d+Kzj8EzJZoLjGXq7RU8vmmffnX+IA/9d84nt85uqzgtH9A==
X-Received: by 2002:a92:c24b:0:b0:424:2c9:26b5 with SMTP id e9e14a558f8ab-425823254efmr34685275ab.9.1758631764817;
        Tue, 23 Sep 2025 05:49:24 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-556f74174cfsm3556602173.57.2025.09.23.05.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 05:49:24 -0700 (PDT)
Message-ID: <786f4a5e-f62e-4cd0-a017-7b61408f34aa@riscstar.com>
Date: Tue, 23 Sep 2025 07:49:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250922161717.1590690-1-elder@riscstar.com>
 <20250922161717.1590690-3-elder@riscstar.com>
 <20250922230639-GYA1303776@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250922230639-GYA1303776@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_054926_767219_F22146AC 
X-CRM114-Status: GOOD (  26.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/22/25 6:06 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 11:17 Mon 22 Sep     , Alex Elder wrote:
>> This patch introduces the driver for the SPI controller found in the
>> SpacemiT K1 SoC.  Currently the driver supports master mode only.
>> The SPI hardware implements RX and TX FIFOs, 32 entries each, and
>> supports both PIO and DMA mode transfers.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v3: - Added imply_PDMA to the SPI_SPACEMIT_K1 Kconfig option
>>      - Fixed a bug pointed out by Vivian (and Troy) in word-sized reads
>>      - Added a comment stating we use 1, 2, or 4 bytes per word
>>      - Cleaned up DMA channels properly in case of failure setting up
>>      - No longer use devm_*() for allocating DMA channels or buffer
>>
>>   drivers/spi/Kconfig           |   9 +
>>   drivers/spi/Makefile          |   1 +
>>   drivers/spi/spi-spacemit-k1.c | 965 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 975 insertions(+)
>>   create mode 100644 drivers/spi/spi-spacemit-k1.c

. . .

>> diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
>> new file mode 100644
>> index 0000000000000..2b932d80cc510
>> --- /dev/null
>> +++ b/drivers/spi/spi-spacemit-k1.c
>> @@ -0,0 +1,965 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Support for SpacemiT K1 SPI controller
>> + *
>> + * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
>> + * Copyright (c) 2023, spacemit Corporation.
>> + */

. . .

>> +static irqreturn_t k1_spi_ssp_isr(int irq, void *dev_id)
>> +{
>> +	struct k1_spi_driver_data *drv_data = dev_id;
>> +	bool rx_done;
>> +	bool tx_done;
>> +	u32 val;
>> +
>> +	/* Get status and clear pending interrupts */
>> +	val = readl(drv_data->base + SSP_STATUS);
>> +	writel(val, drv_data->base + SSP_STATUS);
>> +
>> +	if (!drv_data->message)
>> +		return IRQ_NONE;
>> +
>> +	/* Check for a TX underrun or RX underrun first */
> s/RX underrun/RX overrun/

OK.

>> +	if (val & (SSP_STATUS_TUR | SSP_STATUS_ROR)) {
>> +		/* Disable all interrupts on error */
>> +		writel(0, drv_data->base + SSP_INT_EN);
> should clear status of SSP_STATUS instead of disabling ISR, see commet below

The status is cleared immediately after reading, above.  We hold
the status value so we can act on the current state of the FIFOs.

>> +
>> +		drv_data->message->status = -EIO;
>> +		complete(&drv_data->completion);
>> +
>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	/* Drain the RX FIFO first, then transmit what we can */
>> +	rx_done = k1_spi_read(drv_data);
>> +	tx_done = k1_spi_write(drv_data);
>> +
>> +	/* Disable interrupts if we're done transferring either direction */
>> +	if (rx_done || tx_done) {
>> +		/* If both are done, disable all interrupts */
>> +		if (rx_done && tx_done) {
>> +			val = 0;
>> +		} else {
>> +			val = readl(drv_data->base + SSP_INT_EN);
>> +			if (rx_done)
>> +				val &= ~(SSP_INT_EN_TINTE | SSP_INT_EN_RIE);
>> +			if (tx_done)
>> +				val &= ~SSP_INT_EN_TIE;
>> +		}
>> +		writel(val, drv_data->base + SSP_INT_EN);
>> +	}
> It occur to me, enabling/disabling interrupt in trasfer_start()/ISR is
> unnecessary, which bring extra overhead, why not enable them once
> and only handle status clear bit? I mean bits has "R/W1C" in SSP_STATUS

Disabling the TX interrupt when we are done sending means we
won't get a pointless "more room in the FIFO" interrupt.

Disabling the RX interrupt when we have received what we want
means we won't get interrupted again, even if (for some reason)
there is more in the FIFO to consume.

I think this is OK.

					-Alex

>> +
>> +	if (rx_done && tx_done)
>> +		complete(&drv_data->completion);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int k1_spi_probe(struct platform_device *pdev)
>> +{
>> +	struct k1_spi_driver_data *drv_data;
>> +	struct device *dev = &pdev->dev;
>> +	struct reset_control *reset;
>> +	struct spi_controller *host;
>> +	struct resource *iores;
>> +	struct clk *clk_bus;
>> +	int ret;
>> +
>> +	host = devm_spi_alloc_host(dev, sizeof(*drv_data));
>> +	if (!host)
>> +		return -ENOMEM;
>> +	drv_data = spi_controller_get_devdata(host);
>> +	drv_data->controller = host;
>> +	platform_set_drvdata(pdev, drv_data);
>> +	drv_data->dev = dev;
>> +	init_completion(&drv_data->completion);
>> +
>> +	drv_data->base = devm_platform_get_and_ioremap_resource(pdev, 0,
>> +								&iores);
>> +	if (IS_ERR(drv_data->base))
>> +		return dev_err_probe(dev, PTR_ERR(drv_data->base),
>> +				     "error mapping memory\n");
>> +	drv_data->base_addr = iores->start;
>> +
>> +	ret = devm_k1_spi_dma_setup(drv_data);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "error setting up DMA\n");
>> +
>> +	k1_spi_host_init(drv_data);
>> +
>> +	clk_bus = devm_clk_get_enabled(dev, "bus");
>> +	if (IS_ERR(clk_bus))
>> +		return dev_err_probe(dev, PTR_ERR(clk_bus),
>> +				     "error getting/enabling bus clock\n");
>> +	drv_data->bus_rate = clk_get_rate(clk_bus);
>> +
>> +	drv_data->clk = devm_clk_get_enabled(dev, "core");
>> +	if (IS_ERR(drv_data->clk))
>> +		return dev_err_probe(dev, PTR_ERR(drv_data->clk),
>> +				     "error getting/enabling core clock\n");
>> +
>> +	reset = devm_reset_control_get_exclusive_deasserted(dev, NULL);
>> +	if (IS_ERR(reset))
>> +		return dev_err_probe(dev, PTR_ERR(reset),
>> +				     "error getting/deasserting reset\n");
>> +
>> +	k1_spi_register_reset(drv_data, true);
>> +
>> +	drv_data->irq = platform_get_irq(pdev, 0);
>> +	if (drv_data->irq < 0)
>> +		return dev_err_probe(dev, drv_data->irq, "error getting IRQ\n");
>> +
>> +	ret = devm_request_irq(dev, drv_data->irq, k1_spi_ssp_isr,
>> +			       IRQF_SHARED, dev_name(dev), drv_data);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "error requesting IRQ\n");
>> +
>> +	ret = devm_spi_register_controller(dev, host);
>> +	if (ret)
>> +		dev_err(dev, "error registering controller\n");
>> +
>> +	return ret;
>> +}
>> +
>> +static void k1_spi_remove(struct platform_device *pdev)
>> +{
>> +	struct k1_spi_driver_data *drv_data = platform_get_drvdata(pdev);
>> +
>> +	k1_spi_register_reset(drv_data, false);
>> +}
>> +
>> +static struct platform_driver k1_spi_driver = {
>> +	.driver = {
>> +		.name		= "k1-spi",
>> +		.of_match_table	= k1_spi_dt_ids,
>> +	},
>> +	.probe			= k1_spi_probe,
>> +	.remove			= k1_spi_remove,
>> +};
>> +
>> +module_platform_driver(k1_spi_driver);
>> +
>> +MODULE_DESCRIPTION("SpacemiT K1 SPI controller driver");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.48.1
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
