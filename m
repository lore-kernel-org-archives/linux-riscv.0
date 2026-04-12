Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF4CE937E5
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Apr 2026 14:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JH3TgO8/YwIk2Kibrt+7XiEdDTANv4yZqbp9jHq2qP0=; b=exIF67DVS6wukK
	2DHbxPoMJHsKHt9kcZqxOi2GXP4cw4F1L7PO97K5q3L1+9VJKBFUbzj/b8vzXXBKhEYXubI+8gPym
	cFsBYTosbTh6FeVC9oskgbi0tkY3SKfkQwBoTlTGWzFYsrw0R9uQp/FxYW3Cm84zHMFOym0f+4LFK
	cjpTPQjQWwNTTjAXr75o9vr4QoZFX4EZb73Ppxb/EWz/RRDmWQvTcFVtjZBEPtoe+5O5Fi6KmVSOq
	NZkmAuAHmyrOcYGxEWxHwX9o719l5iYhaZ2+pLxlPGVzByqRhImIPR8woPbIP2SfpHULiDYDUjTRG
	ASg6dpDpsSXzqSfcUg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBviR-0000000ENMr-20wD;
	Sun, 12 Apr 2026 14:23:11 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBviL-0000000ENI9-3StO
	for linux-riscv@lists.infradead.org;
	Sun, 12 Apr 2026 14:23:07 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8d68bcf50fdso398943985a.2
        for <linux-riscv@lists.infradead.org>; Sun, 12 Apr 2026 07:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1776003784; x=1776608584; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fCwYE0TqPeRH6qXObZKYZ/Hps0Zq2xbI26bnfS8VYZ4=;
        b=aGCVHNKaPUJLNWZhjdx0CPQndZQ/K+81v+mCPQJm1cCtdAMM9b5e8gAKz35rb/k4SF
         esnuF5xGrK3qGacBrdEq3D71XPaWMexz7CXYU7honRCyf5jYhRG1IdyRyvEVlJ/3Wm00
         qXcIvriEYMnhmSIsj6kAIRBAyfsoaHppD/Js+K+dSFwHIiZkbcV9PCyNrgYbB3LMyfcM
         nvZ81TJWBCC69jG12pnYRi1wRNp4L56DJ6nabbDiQdrSSKRw/FP+ngDFD+zxVsDdVP6X
         KRM8b37CaT9J/oI8n4mbwPZosFR8do4z4dEIhR5H3c2p1vmg9oKOGUkk3qEy5gzrLK0X
         yHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776003784; x=1776608584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCwYE0TqPeRH6qXObZKYZ/Hps0Zq2xbI26bnfS8VYZ4=;
        b=J9leh9fLaLayAbSleLJ9Z39eoDhCNC0CP43AmlEarMLUtBB1WQEzXI+ri2W/T/pgMt
         tetzZWGQ11BBf482UkagUI3BFQ7G3YNi6YjALL4n5NfHs24yHqbjsWnPG0WLyzZ8DE+z
         uEADrFwfrhKkB0iUgUOaxnHkdRtd1KVToberpUUu7H4upa3LYRxRg0LhlTD8m7s/hfy7
         KHwkB+kyrgg17PIUqHuSNBeTP4LHuW5aalhq75MpKvB+j+UsbJnJ/jfZstZkbR3XlqSa
         b80VLwYaRko7hHYmSSxoMtIEmNqYPqlVYbDvvBQCzFCY7Osz+ol045KC2lxjKFQZaJbh
         goFw==
X-Forwarded-Encrypted: i=1; AJvYcCV9PQp8oZOvbSy5U/px1plpgMWRPVrGcbU1eK2WF64ttit4ErDWXpS0mD2N8243kYEsVKJ6wgU345Ks2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+HgNNzesXApKjd5hxNfaDIXa14FJsHyc8DiwoTe7hEwGFnmaX
	oGou6vGsFtjHbxOUYa1y6QzL15wiFNT/KdF6utQz25IBFEEkS05bJAgocKcK7cXQ9AA=
X-Gm-Gg: AeBDietgMfRNK12tXamz5s1JEf8iszO+XTDq6iE0JHO/Tlul3ucfnQJc+7oiwWvtWxf
	k7HQDJ40/9rrJAYGwfEMRs/ilkudSiSlrtS//P3vV9TWLFSokChPkK4zwxp9vvSEdRhhNJXH0l2
	RtgHVjXFE3yx55q3pAn6NokZu5V9kw9AoSOCChHc+TeMnWnNLJ4iNJs3MNQjoalOQsudBxiF3ky
	NZXfrWSKgHzeky9T+fl896mcVoIjqyD45eVHK36PTCWSZuT9tgG+Lt/JUs+Q/cyj2zaUSTPjfvM
	xnplHCN3behRcOeTQ7hN/s7WPD1fceIqLXh3bcA8DAHvOgs+MD0EQlbtFwA+Gujy0CDHEH86s9+
	8l4l1f7b9nofRUXa1CVxvicLCtcmk3GCavTOkn5dp9NEFZv0x1hW6K3R/M4dY2qH4ilsPpG9g4j
	A9Gl/rzJoEH12EvSv2BNQv9G1ZR0L3lH00gYMUgjcNBk+sIPVZ8RydF7+gktk35cqtxVcW9na9H
	kfs
X-Received: by 2002:a05:620a:4721:b0:8cf:c30c:ced5 with SMTP id af79cd13be357-8ddcd8ea3cbmr1458489585a.14.1776003784339;
        Sun, 12 Apr 2026 07:23:04 -0700 (PDT)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb9830344sm785313885a.41.2026.04.12.07.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 07:23:03 -0700 (PDT)
Message-ID: <517ed025-40d7-4c3f-9ca3-6c3367c97815@riscstar.com>
Date: Sun, 12 Apr 2026 09:23:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
To: Mark Brown <broonie@kernel.org>, Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Alex Elder <elder@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260410-spi-spacemit-k1-v8-0-53ebb48a4146@riscstar.com>
 <20260410-spi-spacemit-k1-v8-2-53ebb48a4146@riscstar.com>
 <adkhJhEQIZHgIQpH@sirena.co.uk>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <adkhJhEQIZHgIQpH@sirena.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_072306_162919_FE657E4C 
X-CRM114-Status: GOOD (  25.60  )
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

On 4/10/26 11:11 AM, Mark Brown wrote:
> On Fri, Apr 10, 2026 at 11:04:21PM -0400, Guodong Xu wrote:
>>
>> This patch introduces the driver for the SPI controller found in the
>> SpacemiT K1 SoC.  Currently the driver supports master mode only.
>> The SPI hardware implements RX and TX FIFOs, 32 entries each, and
>> supports both PIO and DMA mode transfers.

Caveat:  I haven't really looked closely at this code for
a few months, but I thought all issues had been addressed.
I was wrong...  Guodong will be addressing your comments but
I wanted to weigh in.

>> +static struct dma_async_tx_descriptor *
>> +k1_spi_dma_prep(struct k1_spi_driver_data *drv_data,
>> +		struct spi_transfer *transfer, bool tx)
>> +{
>> +	phys_addr_t addr = drv_data->base_addr + SSP_DATAR;
>> +	u32 burst_size = K1_SPI_THRESH * drv_data->bytes;
>> +	struct dma_slave_config cfg = { };
>> +	enum dma_transfer_direction dir;
>> +	enum dma_slave_buswidth width;
>> +	struct dma_chan *chan;
>> +	struct sg_table *sgt;
>> +
>> +	width = drv_data->bytes == 1 ? DMA_SLAVE_BUSWIDTH_1_BYTE :
>> +		drv_data->bytes == 2 ? DMA_SLAVE_BUSWIDTH_2_BYTES :
>> +		/* bytes == 4 */       DMA_SLAVE_BUSWIDTH_4_BYTES;
> 
> Please use normal conditional statements (in this case a case statement)
> to keep the code legible.
> 
>> +static irqreturn_t k1_spi_ssp_isr(int irq, void *dev_id)
>> +{
>> +	struct k1_spi_driver_data *drv_data = dev_id;
>> +	u32 val;
> 
>> +	/* Return immediately if we're not expecting any interrupts */
>> +	if (!drv_data->transfer)
>> +		return IRQ_NONE;
> 
> That does't mean the hardware agrees!

You're right.  We need to clear whatever caused the
interrupt it or we'll keep getting interrupted.  This
obviously didn't happen during testing but thanks for
mentioning this.

>> +	/* Get status and clear pending interrupts; all are handled below */
>> +	val = readl(drv_data->base + SSP_STATUS);
>> +	writel(val, drv_data->base + SSP_STATUS);
> 
> Nothing after here can report IRQ_NONE, even if SSP_STATUS didn't flag
> anything.  I'd just move the checks for transfer to when we're handling
> FIFOs and have the IRQ_NONE report be based on there being something set
> in the ISR.

Sounds good.

>> +	/*
>> +	 * For SPI, bytes are transferred in both directions equally, and
>> +	 * RX always follows TX.  Start by writing if there is anything to
>> +	 * write, then read.  Once there's no more to read, we're done.
>> +	 */
>> +	if (drv_data->tx_resid && (val & SSP_STATUS_TNF)) {
>> +		/* If we finish writing, disable TX interrupts */
>> +		if (k1_spi_write(drv_data, val)) {
>> +			val = SSP_INT_EN_RX | SSP_INT_EN_ERROR;
>> +			writel(val, drv_data->base + SSP_INT_EN);
>> +		}
>> +	}
> 
> This overwrites val...

That's no good.  We need to assign the interrupt status to a
different variable if things are going to be handled this way.

> 
>> +
>> +	/* We're not done unless we've read all that was requested */
>> +	if (drv_data->rx_resid) {
>> +		/* Read more if there FIFO is not empty */
>> +		if (val & SSP_STATUS_RNE)
>> +			if (k1_spi_read(drv_data, val))
>> +				goto done;
> 
> ...so the read won't see that there's data to read and we'll need
> another interrupt.  I would suggest using a more meaingful name for the
> actual interrupt status.

Yes.  I actually think you commented on this before, and I thought
I had addressed it but it's clear I did not.

Thanks for your review.  Sorry for not fixing everything.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
