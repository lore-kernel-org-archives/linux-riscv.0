Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08D6CF856E
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 15:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s955i5OzXZ7QL2zZBSPpsUUMdgs9ZKbXeXDD9Af0tmI=; b=UbIABj685HUjS9
	iNHkeVEJkKhnNpyaD1XR9xUp75LvdTNxeRwHn51NIfIEbNchsdi3aRQZyHiilug1kailhMNgcWypE
	xfIbdUnO607z3HKiBqbk+YXrA8KlW7UxcO2RSEl9sCI6JyqhqNV38PQITDl3x7Nnt7z6tWRFmxz16
	hKRybh72lRE3+4rhEK8Rw3addEeJlaLn3arDwX9GIXupcEe0MBql7J7iM1hjWN3camQEpO1fpWSo2
	GTpm3EdlCYLuFpnNKfHDuqd+WK3HxabcdC2BbUnsgu++LeMNIyAXgiPqWjR/XTT3XqJSkZPNt1Ae0
	Gxkwuh+Hjk1ZAMUAkg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6w6-00000006wwy-0xpu;
	Thu, 20 Nov 2025 15:51:06 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM6w3-00000006wwT-2YBQ
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 15:51:04 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-43476cba770so4615685ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Nov 2025 07:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763653862; x=1764258662; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5jVULdmnGJZUzqfCeuMvq76ewKlBDnLfe0I6V5R7xpM=;
        b=qOYL1vf2dwDDMGo8c6zVa+O7Vs+6S/q8YRhmNaUw3uxPYcKUEnFdIaYJpRJ4qlSN2h
         V6jaJT5//au+AOG8swlBbrG+CPR5ua0am38vGt1lqPnxaEH/RQ+hR7IwCiHUpJjooCMj
         63lmwPXaSFar2uzlpGWH7SLuz5Arq7pC/QMVLt2HdzjzeRWQsRpCjNW2faMfp9ddVlBj
         rKaICRuxGefymQAzrk/30QSLSi2inXwihtOHYCPUKesIX1Tx0IHycY5hB9VcAfB1wjUe
         VZbesDiob+g6ZWBbcfgRqpr6C/MkfxN0arrJ+nk+4R7K/P9w57ImlX9rlhgiIATm8KtK
         H0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763653862; x=1764258662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5jVULdmnGJZUzqfCeuMvq76ewKlBDnLfe0I6V5R7xpM=;
        b=v8Ek/Xw6PreLDKPsD9xa5R4Nkw2gP3fldT/WDAX/CZiwQnVUcrkYDzMUH0a3X3JY0E
         1MoBJyGzwrrZis94wOmWqE4r1ZpqxV0D7Z6jSprb9aP64pX0Lu+BQS0iMVxfD2o1WNB/
         34zO4xxCnAOel8aF1tp8SBZEC261QcOYJh2a/+p9nsOoAiau83N3wMju0FJeXOt8E6wD
         Udj5g5S0GJDzWARl+8RBOPzSkc9VezG0K7OXtrYVcWRmgnQJfeqNeiieLc0Uek3zTt0G
         1z2XxFvIuG670Z+WmdxRgAdWa071mHy8Q7xtDKtr/p+EJwiPI96doiII+hVc3OpeyMHG
         i8bw==
X-Forwarded-Encrypted: i=1; AJvYcCW8JfdArjGOZ7z3iG5BMTEYffW7HTwwEWP2V0naD3mI3uBcofdnz5NguVMqWB7tQ4JDFqPqwLR8xoMGkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz48OTa4UgrcNGxsylkvx7BezgMyo9CUx26qJZHQbPo5OAQFD6
	zp+jwL+pg4pK2O79zLPskhoQQk/19+0w+rRfg2I2RUiajmRYE7AevXgF2pdKoui2N6M=
X-Gm-Gg: ASbGncti67S7NvNGYVHjMXCOssoLpbiOIaPM+Q4ZuhCLk90ql7FMgvdvEd5D2J+PEHU
	ukltySVvcrxQ80GiSKHGRmU0oODBf7JPoLXSTU1OxofqE0KgzEmv+UTFrvgI5AMKHZ+2mQ6HQRA
	88Bgzwjnd828e97mO01gJ89u4sClZL5YAAqI0+lKxMjgwQoTD0f+1AIYJieG25+pkO6Q5sMxRs9
	RjoVf8dLMVxFswF/7CLjWqunvR1jXvdnhUNxf9zImlT5qKrmXW2FmOYwCK7rZ08cIC8Q+mo91si
	/tMEluv4t+cNjT8iZL56dLtS5BKGOfZDa/jtEeKkFUVw1y26Hy69Gh5pJVKsqUNwD8NqscVKWHC
	lo/ctyz+VbbkbrGgHQasaNCpEkrxNSiXWCCMhgpT+/3nFFKQrvougZHqhPEeTBiLtJtoJwaQ/L3
	/0+5nPuMOhy1uQuMqnuSvF9WDjTD59IAR1SRcxxwEK7341swI0Ow==
X-Google-Smtp-Source: AGHT+IHY73/hmK2ihdGHJpO3Mip0NgdP4MWhJ3aese0GPaKfQ3SvazcDhmEwhbgkWjtEbqE30jfr9w==
X-Received: by 2002:a05:6e02:b46:b0:434:96ea:ff45 with SMTP id e9e14a558f8ab-435aa8ee764mr24969925ab.19.1763653862415;
        Thu, 20 Nov 2025 07:51:02 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949386c3666sm99186439f.17.2025.11.20.07.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 07:51:02 -0800 (PST)
Message-ID: <963990a3-d39c-4e72-8add-02d98f59770a@riscstar.com>
Date: Thu, 20 Nov 2025 09:51:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
To: Mark Brown <broonie@kernel.org>
Cc: dlan@gentoo.org, p.zabel@pengutronix.de, linux-spi@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251114185745.2838358-1-elder@riscstar.com>
 <20251114185745.2838358-3-elder@riscstar.com> <aRoVqVtYLJJAPCia@sirena.co.uk>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aRoVqVtYLJJAPCia@sirena.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_075103_801133_2A457C0E 
X-CRM114-Status: GOOD (  30.96  )
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

On 11/16/25 12:19 PM, Mark Brown wrote:
> On Fri, Nov 14, 2025 at 12:57:43PM -0600, Alex Elder wrote:
> 
>> This patch introduces the driver for the SPI controller found in the
>> SpacemiT K1 SoC.  Currently the driver supports master mode only.
>> The SPI hardware implements RX and TX FIFOs, 32 entries each, and
>> supports both PIO and DMA mode transfers.

Sorry for the delay responding to this.  You provided some really
great feedback and I appreciate it.

> This looks mostly good but there's a bit of open coding that looks like
> the driver could make more use of the core.
> 
>> @@ -0,0 +1,966 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * SpacemiT K1 SPI controller driver
>> + *
>> + * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
>> + * Copyright (c) 2023, spacemit Corporation.
>> + */
> 
> Please make the entire comment a C++ one so things look more
> intentional.

I do see in drivers/spi/ files that start just like above,
and others that start with all "//" comments (more of the
former than the latter).  I really don't prefer using "//"
for anything but the SPDX ID, but... since you requested
it I will make that change.

>> +static bool k1_spi_map_dma_buffer(struct k1_spi_io *io, size_t len, void *dummy)
>> +{
>> +	struct device *dmadev = io->chan->device->dev;
>> +	unsigned int nents = DIV_ROUND_UP(len, SZ_2K);
>> +	struct sg_table *sgt = &io->sgt;
>> +	void *bufp = io->buf ? : dummy;
>> +	struct scatterlist *sg;
>> +	unsigned int i;
> 
> The SPI core can do DMA mapping for you, the only thing this is doing
> that's unusual is that it's imposing a fixed 2K limit on block sizes.

OK.  I will use the DMA support provided by the core.

> If this limit comes from the DMA controller (which looks to be the case
> since we feed the entire table into the DMA controller at once?) the
> core will already DTRT here, assuming the DMA controller correctly
> advertises this restriction.

I will verify this.

>> +static bool k1_spi_map_dma_buffers(struct k1_spi_driver_data *drv_data)
>> +{
> 
> ...
> 
>> +	/* Don't bother with DMA if we can't do even a single burst */
>> +	if (drv_data->len < dma_burst_size)
>> +		return false;
>> +
>> +	/* We won't use DMA if the transfer is too big, either */
>> +	if (drv_data->len > K1_SPI_MAX_DMA_LEN)
>> +		return false;
> 
> The core has a can_dma() callback for this.
> 
>> +static int k1_spi_transfer_one_message(struct spi_controller *host,
>> +					   struct spi_message *message)
>> +{
> 
> ...
> 
>> +	/* Hold frame low to avoid losing transferred data */
>> +	val = readl(drv_data->base + SSP_TOP_CTRL);
>> +	val |= TOP_HOLD_FRAME_LOW;
>> +	writel(val, drv_data->base + SSP_TOP_CTRL);
> 
> This looks like it should be a set_cs() operation?

I'll implement that, along with using spi_transfer_one_message().

>> +	list_for_each_entry(transfer, &message->transfers, transfer_list) {
>> +		reinit_completion(completion);
>> +
>> +		/* Issue the next transfer */
>> +		if (!k1_spi_transfer_start(drv_data, transfer)) {
>> +			message->status = -EIO;
>> +			break;
>> +		}
>> +
>> +		k1_spi_transfer_wait(drv_data);
>> +
>> +		k1_spi_transfer_end(drv_data, transfer);
> 
> Why not just implement the transfer_one() callback?  This just looks
> like it's duplicating code.

I'm working on this now, and it's the reason for the delay.
Methodically switching things over to the generic interface
has been taking some time, but I think I'm close now.

>> +static irqreturn_t k1_spi_ssp_isr(int irq, void *dev_id)
>> +{
> 
>> +	/* Get status and clear pending interrupts */
>> +	val = readl(drv_data->base + SSP_STATUS);
>> +	writel(val, drv_data->base + SSP_STATUS);
> 
> This unconditionally acknowledges all interrupts even if we didn't
> handle anything...This is a good observation.

There are only 6 interrupt conditions that get cleared.  Three
are errors, and the other three are read/write FIFO "ready"
interrupts.  The code that follows handles all of those, so
doing this right away was a sort of shorthand.

That said, there was a chance for an early return (if the
message pointer was null), and that should be checked before
we clear the status register.

In any case, my work the last day or so has included a lot
of tweaks to the handler.  I'll try to make it clear what's
done makes sense.

Thank you very much for the review.  I wish I had looked
harder at just using spi_transfer_one_message() before.
But I *love* suggestions that will make the code become
smaller and simpler.

					-Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
