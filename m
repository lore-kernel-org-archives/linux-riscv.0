Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD99CCAC5B5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 18:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/JQiyFA9HqAEhaPI5etqAZ7Pw4Xfxsn8fuZ0ON8pDk=; b=UyqitR/Pn6J0Ec
	dNHbe4VM+qDylDP8dzLt/AKccotuwDh99nHOcAT2ft3+uJgqULfaIwCG4TVIqvjbJmRIwbaJDBPIe
	gX5pvuHS4uHeAPpDl9P4e2kZ9u9kiHeAIBiATEokf+LAJGIvoayvdsMuJLLWCUE5njaTLDvj/LZsR
	jYtR+apbenLpR7pZ932Zu4bMcbdil8UioUQk07z85WvMqT7BXRnhZ1I4tn6T7is/MkPcBQUt/UMoT
	9SuOT2vy2UdyfEj8VAPcahngptt/qsBvnRJ4GWg9j/huVybzutr54RzrDztKieOXVA6qYpt+ZdLsH
	OQgD6joEPpahGI6o7VRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2w9z-0000000H9ap-3kUB;
	Sun, 28 Sep 2025 18:30:11 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2w9w-0000000H9ZQ-28GU
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 18:30:10 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-429a0630be3so9385545ab.1
        for <linux-riscv@lists.infradead.org>; Sun, 28 Sep 2025 11:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1759084207; x=1759689007; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OpapXATxcXIHML9Ao38TzaKDugnEtxPRqg0bV0GVyLQ=;
        b=iWuDf3asCXI2gQbzpLqjLOge0u+S/4Ze9tdumJC6+iMZfTxxbV7n51rm+YXMQp/1to
         5BLPUjK8CZ33ZJnaM701kqTj1Zk7C8EsMP5yWmRvuSHixRrimxa3FY02wI9jrym76dAo
         mvD3Vdwf2DdBTS6sJO+wRGZY/cgq1tMJLgA5rL/L1B3XqZuLtF00xtfKkrqOxP9utAlm
         qVeydOOigLIQLEF2WFvp1XfH8YofL1VwCswmP7MqWXMKg1z4wxrvQTuXELtauD60mRxg
         HJGbnopGrouGbLK9uexNAze2gm2sU4a+NTHG4cQZ2/Qju4btGL90HF6gOeyxqlMcn4Gz
         p+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759084207; x=1759689007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OpapXATxcXIHML9Ao38TzaKDugnEtxPRqg0bV0GVyLQ=;
        b=gMtkaWcd8bKqLVIRXHvD/ClV8ZU0pKgeONK5yz13o/7HywSssCuHe64SA6injjlnNZ
         ff78UJ8UcN/4xWXrgQjNJUJm1gUFztnllpm6HY0Ch2A8mQkUNxAJbfbq7yj/9UFzGR0E
         MPRSSiPWh4CaMXTeCHiQnAXSioLNMlm4kQpba3aU+7ceTDlyyhNzZcEWIt2ykZqMkj3c
         OY3DMUSEjrIuH/nZ2jTKI3J6mwFCCocAfNYs3K65QQ8JxsNYaeJzzHYHwWsXozRhfV17
         r6H23QBZWx5mtwOeeFuPYSRCyv8ZmMJyMV64LPyZIwoWdEnjI3h+qiAkYXxZcf2HtpAb
         3YhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKmhnBDTaEEHfaKqbT+Kp0y1G4ZoKYfQZnSU8VrM36WKF2H+Gih12sgzJb8rs2eiAKC8GPSPpvBs1I1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHkwuvKkqvgnQeRc5RiQLbqPz95rQAFSvSST6QukC6NTZU5ntg
	nisaRpkUehGe6z+6/Dg0urMXFej5Ta8T+pZ1MuvsDSbgRjYW5KOQ1Cvv343ArDo/XQE=
X-Gm-Gg: ASbGncuBS7cR819Ve+IbDk4Wg9kMKzm5D9YQv5goyvik/ml9lqWuS31agj1jLjJKPec
	r/hduQI4Z6ErRyhgGI2q/jCEStpEB1Uc9RRJO6mjS9G/RKk7kOyUByQk79Y+Jghkc4+ySJY0EU0
	G1mTu/Sb0iJiY8Wl5Xs2kApCyfH3Ci1ajW0lf76iiMNLW8+2v7BM100Ux9bHCvRYiIKFETVCAqe
	TqxFDKlDFWyEA1DUpmIdOzMMGiCNFjEfusWtfdrR0S4bAHQRloFpGA+UGr3Zsxna1V775CpbjYP
	Eln0QbusOMq/Q4X9D5rLhMAymKyAxSrG58pkOeop83QMe4QRWGXc72i4BGnqcTWHsA/aj3RTgT7
	IolwM8BU1b43cgqcqmUKHyyXfhC3gP471G69u7nI40hic9rHahcVUidSY2RjuntmIbGWej89Og7
	2NiwhnZXU=
X-Google-Smtp-Source: AGHT+IHI+KjtauowHD4Mkl39PSsrUmu2ZtoNYzP3z5aJ+BMT14naCxidriH/P9dmj7elKaDQ4sRm1g==
X-Received: by 2002:a05:6e02:1708:b0:429:a1b7:ee3d with SMTP id e9e14a558f8ab-429a1b7f05dmr57105705ab.2.1759084207162;
        Sun, 28 Sep 2025 11:30:07 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm238767173.2.2025.09.28.11.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 11:30:06 -0700 (PDT)
Message-ID: <127352a1-adc2-4bce-a8ad-ee3eaa111280@riscstar.com>
Date: Sun, 28 Sep 2025 13:30:05 -0500
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
 <786f4a5e-f62e-4cd0-a017-7b61408f34aa@riscstar.com>
 <20250928123622-GYA1347020@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250928123622-GYA1347020@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_113008_801762_1D6D5210 
X-CRM114-Status: GOOD (  25.08  )
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

On 9/28/25 7:36 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 07:49 Tue 23 Sep     , Alex Elder wrote:
>> On 9/22/25 6:06 PM, Yixun Lan wrote:
>>> Hi Alex,
>>>
>>> On 11:17 Mon 22 Sep     , Alex Elder wrote:
>>>> This patch introduces the driver for the SPI controller found in the
>>>> SpacemiT K1 SoC.  Currently the driver supports master mode only.
>>>> The SPI hardware implements RX and TX FIFOs, 32 entries each, and
>>>> supports both PIO and DMA mode transfers.
>>>>
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>> ---
> ..
>>
>>>> diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
>>>> new file mode 100644
>>>> index 0000000000000..2b932d80cc510
>>>> --- /dev/null
>>>> +++ b/drivers/spi/spi-spacemit-k1.c
>>>> @@ -0,0 +1,965 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Support for SpacemiT K1 SPI controller
>>>> + *
>>>> + * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
>>>> + * Copyright (c) 2023, spacemit Corporation.
>>>> + */
>>
>> . . .
>>
>>>> +static irqreturn_t k1_spi_ssp_isr(int irq, void *dev_id)
>>>> +{
>>>> +	struct k1_spi_driver_data *drv_data = dev_id;
>>>> +	bool rx_done;
>>>> +	bool tx_done;
>>>> +	u32 val;
>>>> +
>>>> +	/* Get status and clear pending interrupts */
>>>> +	val = readl(drv_data->base + SSP_STATUS);
>>>> +	writel(val, drv_data->base + SSP_STATUS);
>>>> +
>>>> +	if (!drv_data->message)
>>>> +		return IRQ_NONE;
>>>> +
>>>> +	/* Check for a TX underrun or RX underrun first */
>>> s/RX underrun/RX overrun/
>>
>> OK.
>>
>>>> +	if (val & (SSP_STATUS_TUR | SSP_STATUS_ROR)) {
>>>> +		/* Disable all interrupts on error */
>>>> +		writel(0, drv_data->base + SSP_INT_EN);
>>> should clear status of SSP_STATUS instead of disabling ISR, see commet below
>>
>> The status is cleared immediately after reading, above.  We hold
>> the status value so we can act on the current state of the FIFOs.
>>
> I'm surprised by this, do you mean the status will be cleared by reading?
> can you double checck and prove it? by reading twice and compare?
> 
> while according to the docs - 18.2.4.6 SSSR REGISTERS, the status bits has
> two types:
>    R - Read only
>    R/W1C - Read only, write 1 to clear
> 
> if you're right, then the docs should be fixed.

The code is earlier in that function.  I'll repeat it here.

static irqreturn_t k1_spi_ssp_isr(int irq, void *dev_id)
{
         struct k1_spi_driver_data *drv_data = dev_id;
         bool rx_done;
         bool tx_done;
         u32 val;

         /* Get status and clear pending interrupts */
         val = readl(drv_data->base + SSP_STATUS);

=== Line above reads the status register
=== Next line clears all status bits, acknowledging interrupts

         writel(val, drv_data->base + SSP_STATUS);

         if (!drv_data->message)
                 return IRQ_NONE;

         /* Check for a TX underrun or RX underrun first */
         if (val & (SSP_STATUS_TUR | SSP_STATUS_ROR)) {
                 /* Disable all interrupts on error */
                 writel(0, drv_data->base + SSP_INT_EN);

=== And then the above line disables all interrupts if one of the
     error conditions was shown in the status.

I hope I'm not missing something.  I think you might have
misunderstood what I was referring to by "above" when I said
"The status is cleared immediately after reading, above."

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
