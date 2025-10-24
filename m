Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEF5CCD193
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 00:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RaSTpXOx2tMBy5DPbQtwBA5NysCkHAD25QhMYr5C2Uc=; b=RY/4ATGvU5AX5k
	p0hXaacXW341fyjKnEYhUzNSZrRTdo9l+/LXGZxYo051zvq2TbpOwlRsgh9JWpAR1TPlwhv6pbU9b
	cB6AtzXzjKLWF/4YrS4CbUHUMVNz5E4SK7J02GH3BToOb5H43sEga4879XPBwCihmc9o3E7NZv1Je
	WPtNawJRfrs4fHKptt88EDkNF0PvaivUqPzDBvfspnWjixSy/aaot2GEu8PpVs+N31IX06BLIlWXi
	9DO0v2QJBGjizI5CUGOYBwslWMEX1DxWcV8gUiHPZ+v5nRe/8KgAIKsC3jofG3FzeQmZ5V5ZOxOpB
	DAiXr6zmQXaMTQe6g54Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Hy-00000007s2A-1Snj;
	Fri, 24 Oct 2025 00:04:14 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Hw-00000007s12-1Xn2
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 00:04:13 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-33b9dc8d517so1530904a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 17:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761264251; x=1761869051; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kG8oovmqRaNzTSGBD2RsxBVDQfNgYBWR0ofPiKC/9wo=;
        b=sy4cGiMbqB1uozjwYEOqh9raAHNYt6ugacuJjM8EsnQLGPPG7kWoImqO8ATgHU5z/l
         Q68IWIgVqDcbobmYfJrGPMKzdB9EG5/0DszHX4M72mWDqXyV/zyZaYGaQ5fyjbqEDNEL
         gZf5/NdaQmqfuwkf/Jd1IhaWb7BLgW2ibGho4q4MMPNUWyMZm4cQ3Hct+x0H9HA524w5
         F9ICbuBnKHswcKqPihURovBfcE7DmOscEJENSeMhPaHJ69uJhizS1d7rCiIfQ6nuy0wG
         AGxWSQlbPU36EspKxQ/p/oZCi+0lwmZQD0F3QPGRrQw2rSCSs1kIScosmnsJsvL9jlCK
         z0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264251; x=1761869051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kG8oovmqRaNzTSGBD2RsxBVDQfNgYBWR0ofPiKC/9wo=;
        b=t0ctzFo1DDU+ifzKbo6niuk00LSEw8mt0O1l+mPot1gKcDRpc9h7wMAOlRxdIiI3BN
         1ylxTaUkB/AyvsmjrW+sJa6vgn1g6uCrSZtFSQagPyXuwc0kgCQUY8zXi1JWlJonEdaw
         wyBASNagi76AgwqFhyw1tW16uA5s/YmxvZ0y9JxdPArM3iWampctaumn5DPGdl5eDgQ9
         jEPZ3iFAw9ZyqRZ2ne62E5LeoYVo7iuMQRippkdXz+DtEGlVcjVIEUDfs8WHsvQ5erFp
         mwLxAQjOWEl87LHMatg2D1mtHg7MuQBylY+GmNHI4b4ky/2sluUd96uA4EGVtS9XJVkC
         RVSg==
X-Forwarded-Encrypted: i=1; AJvYcCXM627NCKpOhpVDpSeWInN5anzHrHO5YAc5gqOQ//Frhnux4YHds6sNwuPDv23MsU2+TOPE9v4QEHFS9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCDXEwVYhjZJnKz1Ap7U9aYz4rJTEgeiujAL2M9GsErXVDnFjq
	V5YaTXSLh1jxy5AvuEXQkTX0+21exKP0NCFAeYxTe0LlJ3M4WXViYqq8bjMEiteVWjnRoNJtdNk
	RF06Q6a0=
X-Gm-Gg: ASbGnctBCqGBacTpmnRCN7r0qajMunqsZsB8WeOS8cXn5XbeLsLQfdXALB4xulRty4O
	19rYPAhFDK/pGEu4aAA5cuC2YjOPmBsm1oFQORnLUYVkN0zwXwJ8NX003Cy2lKKDv6j/BNM6aqa
	mB6PdIDNMVQ60DCXG4PNwZgUbiMQmsX2t4JBM64Aa+7Ax0izDSd46izJ933LpKwxQrIwwWbIwyC
	nuXbu1871e3atzLVJ3p9vUCH94SxXHaSPfnWxgZdEQ/j6xHfKqfAbFB+slrwHAAcQq2y0Mqm0q+
	vOnsXvYni4s4B8uhxx9a+G2quaQg6R94WmrQpXabx6EBMWNbLPMIJJRRio0ajO0lXGp7Sa69Kbu
	qAQK4lGudlWUAWR39vSUTIuh7bvuG+xdMjaFEIRVKRD5qyhS2JYvKofXAvEd6vIz8/c4WkGo5vM
	vixLb5w1vxwRbJiiHYBQaN6ZSnEuc00EsveIVHiw==
X-Google-Smtp-Source: AGHT+IHSGU24WurHFEd08HU+CrxqEKTFB2CNJlwi6t/j28NxxvFCPIXZXTfDae9QkSIwWA6BVf5SSA==
X-Received: by 2002:a17:90b:48c6:b0:32e:59ef:f403 with SMTP id 98e67ed59e1d1-33bcf8e95c3mr35479556a91.17.1761264251417;
        Thu, 23 Oct 2025 17:04:11 -0700 (PDT)
Received: from [10.211.55.5] ([208.115.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff373easm3702460a91.5.2025.10.23.17.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 17:04:11 -0700 (PDT)
Message-ID: <a43b6ddf-c552-4db8-89cc-49951015161d@riscstar.com>
Date: Thu, 23 Oct 2025 19:04:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] spi: fsl-qspi: add a clock disable quirk
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-6-elder@riscstar.com>
 <aPq75FBuYvFQrbQE@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPq75FBuYvFQrbQE@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_170412_416560_B8C9561A 
X-CRM114-Status: GOOD (  17.50  )
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

On 10/23/25 6:36 PM, Frank Li wrote:
> On Thu, Oct 23, 2025 at 12:59:17PM -0500, Alex Elder wrote:
>> The SpacemiT K1 SoC QSPI implementation needs to avoid shutting off the
>> clock when changing its rate.  Add a new quirk to indicate that disabling
>> and enabling the clock should be skipped when changing its rate for
>> operations.
> 
> remove "for operations."

OK.

>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - The quirk flag is now named QUADSPI_QUIRK_SKIP_CLK_DISABLE
>>      - The predicate now returns bool and is not inline
>>
>>   drivers/spi/spi-fsl-qspi.c | 21 +++++++++++++++++----
>>   1 file changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index 1944e63169d36..c21e3804cb032 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -197,6 +197,11 @@
>>    */
>>   #define QUADSPI_QUIRK_USE_TDH_SETTING	BIT(5)
>>
>> +/*
>> + * Do not disable the "qspi" clock when changing its rate.
>> + */
>> +#define QUADSPI_QUIRK_SKIP_CLK_DISABLE	BIT(6)
>> +
>>   struct fsl_qspi_devtype_data {
>>   	unsigned int rxfifo;
>>   	unsigned int txfifo;
>> @@ -306,6 +311,11 @@ static bool needs_tdh_setting(struct fsl_qspi *q)
>>   	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING);
>>   }
>>
>> +static inline bool needs_clk_disable(struct fsl_qspi *q)
> 
> needs_skip_clk_disable()

OK.  I was trying to avoid the double-negative:

     if (!needs_skip_clk_disasble())
	clk_disable...()

But I'll do as you suggest.

Thanks.

					-Alex
> 
> Frank
>> +{
>> +	return !(q->devtype_data->quirks & QUADSPI_QUIRK_SKIP_CLK_DISABLE);
>> +}
>> +
>>   /*
>>    * An IC bug makes it necessary to rearrange the 32-bit data.
>>    * Later chips, such as IMX6SLX, have fixed this bug.
>> @@ -536,15 +546,18 @@ static void fsl_qspi_select_mem(struct fsl_qspi *q, struct spi_device *spi,
>>   	if (needs_4x_clock(q))
>>   		rate *= 4;
>>
>> -	fsl_qspi_clk_disable_unprep(q);
>> +	if (needs_clk_disable(q))
>> +		fsl_qspi_clk_disable_unprep(q);
>>
>>   	ret = clk_set_rate(q->clk, rate);
>>   	if (ret)
>>   		return;
>>
>> -	ret = fsl_qspi_clk_prep_enable(q);
>> -	if (ret)
>> -		return;
>> +	if (needs_clk_disable(q)) {
>> +		ret = fsl_qspi_clk_prep_enable(q);
>> +		if (ret)
>> +			return;
>> +	}
>>
>>   	q->selected = spi_get_chipselect(spi, 0);
>>
>> --
>> 2.43.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
