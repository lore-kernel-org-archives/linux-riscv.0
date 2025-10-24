Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86550CCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 00:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCDREq2O472J/SqiczMRSUoVKckujO9ilHLWr/lltBY=; b=qF05R2mhC3Uejj
	0Jwjc3Y+lptQMG5/Sss6zuK04f5OhoeeNGaFN/sISHm3hxzlyzdd1nsgnN6KL9/3mFq3inResUJ5t
	+PEdAxoZMPo4JvNXci2bfykIAvFMj6vIZOpt2jrF/PBDZ7uzRyl7jyZWjCHRb/73N8RXESI+8Fx75
	VTV9oevH6e6toVDIZ2qQ5i2PE+BL09/g71+4VWtWctx+czl0egZ2RxHYAp2MWwAedgOwRXLkU6egY
	FnfQL3aFRpAnTaI0W3ImvRoEwLgIpxj7Bq7A4flhYLehg2KOxhF49ashFf1LssaGAfaFZ5/+o00Xk
	SxaGm7cdN0vYU+MqwNWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5IA-00000007sAa-1pOh;
	Fri, 24 Oct 2025 00:04:26 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5I7-00000007s7t-35V0
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 00:04:24 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b62e7221351so1227134a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 17:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761264263; x=1761869063; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qjw6GkWiRFtO3Gl0DgzCouuS1/pA0eKo+XSbrrk/AhI=;
        b=uew4W5KQfh1pX/UxFUANNv6c3GEXr2Xkpavq/BNhMmQiUUqa3V9WW2+Gnix+zKH54q
         WuwcnsXwqkBAJHw5g5V67vpcHbBQ7lGVOGks+8gQ71wuHePdqSBGSc3Y0P1oN7BZZZaF
         1oOZlz+AmgXifkCYLqJp21iSOKftfL62Nni6N2NEwEP7uzeJS+rkr3CsqXjIdhGjB139
         VyG2VhJet6Bt51mLYwhkhgjeomhvEZKZv3i99eeqGp6rY88F9+Zk/7bYt+dvdEGsesde
         M01Qt+G5e/QRQEDpEstOC4TTbslq2fSLqOJ31bxAMwLlrNQ+aqCwaAFtW7hF4FmqhfBR
         EEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264263; x=1761869063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qjw6GkWiRFtO3Gl0DgzCouuS1/pA0eKo+XSbrrk/AhI=;
        b=bLRHxHLreQ+eF46v9Rgub4U6Jg1amMvjktGlf7pKPQex9mwTx+r3+3uVlSwso0iwBh
         QpQ3fB9Xu1QLVfNFuYcjLQxnaDbWBA4/PBrFPyJeoKiua2SLRSWzfl/7/VwHkJmgl5xX
         P2F1Yi5s96rSAYmmDILV52kCRMws00Zruwpfg/eM0C6/8/8fFJFj+AFB2WwQBYeGRWi6
         jKwWBbC/3lRT54SU52/3DWDo4Q1OSXJ1UclvKMeQUtihzyyo61N9Q5YA+lPwu45keXg0
         DG2SZwVGvKfdo3eOlTE17VKUbKEREUuuCiZKkNH3/5FzlZUy+6RAhaAPwAHTesvvNksw
         Ew4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAvJmj6mB1q/XT4xtRkTfAAETMTHhX16YNoGrEEBqWlmwpms8EzLU1FOnpDh99ch0z/Na1q5JqgYnvgA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy89l8JGG81mqlGknWZ8apA/4vqF6K9nHOd9nJO6ITPNj/5UFDl
	PIPINJpnotiwiA7WF2a8gwC6/6IIz/CKGbN1HgemSjGYyCEG26CpVeMAohwX+K26wsk=
X-Gm-Gg: ASbGncvujCPQrLwTg1StYDInvjNDCcj2yj5fJcbQIDHAA1IAisD/OSh11ZeTPwm/l5T
	PYeoJYM9q7osZFNnAVIAp3gJ0PKzWz+hbCwxpxHoRPTKJLNZPp0hJZPqA3EfyiHFTJUdgbXgQFi
	zDYMeUmtvyzmi8e5u9pvkrV8XpShHWIxr+f1UiTFpjz5t2JgRuhndRGQIRsaKq1Ui/8pz4Xx+/9
	/71wVRoA8CjbbRi8XLG+Q6pItXPOV6MJ6oFXZaYF2vgKRSIc3d/QXgvSYk+qsruAleiLCjjBHJw
	GLbyKMf/azWerEZljvoCHwgd+1IrljsWjvgwW4ZNENU2us0f6cnZtr0SDzvEhM/X1VbKv1ENaVT
	7QBM82MRAh+hZnFWtucxzmQbIyjNA/kBJBKJRqrVpfUD47r8EkpQjWMQU0NEpQZx/04v9iVLoby
	fz3ddX3KX9c8snx0lX
X-Google-Smtp-Source: AGHT+IEVlzxGRMXWgrP8LOTMF8F9hRbegGiF7+NmjpjW9vsaNPPeuDl5n70FEErCCNUHIH/8Cpl0Uw==
X-Received: by 2002:a05:6a20:e212:b0:334:a4dd:cd09 with SMTP id adf61e73a8af0-334a85341bbmr37585340637.10.1761264262970;
        Thu, 23 Oct 2025 17:04:22 -0700 (PDT)
Received: from [10.211.55.5] ([208.115.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff373easm3702460a91.5.2025.10.23.17.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 17:04:22 -0700 (PDT)
Message-ID: <f1da325a-af36-4759-b3e6-6b0a4e9eb13c@riscstar.com>
Date: Thu, 23 Oct 2025 19:04:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] spi: fsl-qspi: support the SpacemiT K1 SoC
To: Frank Li <Frank.li@nxp.com>
Cc: broonie@kernel.org, han.xu@nxp.com, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-8-elder@riscstar.com>
 <aPq9LHwtALpsOIwz@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPq9LHwtALpsOIwz@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_170423_786045_ECC2CE25 
X-CRM114-Status: GOOD (  17.26  )
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

On 10/23/25 6:41 PM, Frank Li wrote:
> On Thu, Oct 23, 2025 at 12:59:19PM -0500, Alex Elder wrote:
>> Allow the SPI_FSL_QUADSPI Kconfig option to be selected if ARCH_SPACEMIT
>> enabled.
>>
>> Add support for the SpacemiT K1 SoC in the Freescale QSPI driver by
>> defining the device type data for its QSPI implementation.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - A continued line the Kconfig file is now aligned
>>
>>   drivers/spi/Kconfig        |  3 ++-
>>   drivers/spi/spi-fsl-qspi.c | 10 ++++++++++
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
>> index 4d8f00c850c14..592d46c9998bb 100644
>> --- a/drivers/spi/Kconfig
>> +++ b/drivers/spi/Kconfig
>> @@ -435,7 +435,8 @@ config SPI_FSL_LPSPI
>>
>>   config SPI_FSL_QUADSPI
>>   	tristate "Freescale QSPI controller"
>> -	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
>> +	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || \
>> +		   ARCH_SPACEMIT || COMPILE_TEST
>>   	depends on HAS_IOMEM
>>   	help
>>   	  This enables support for the Quad SPI controller in master mode.
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index a474d1b341b6a..d4b007e8172b2 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -268,6 +268,15 @@ static const struct fsl_qspi_devtype_data ls2080a_data = {
>>   	.little_endian = true,
>>   };
>>
>> +static const struct fsl_qspi_devtype_data spacemit_k1_data = {
>> +	.rxfifo = SZ_128,
>> +	.txfifo = SZ_256,
>> +	.ahb_buf_size = SZ_512,
>> +	.invalid_mstrid = QUADSPI_BUFXCR_INVALID_MSTRID,
>> +	.quirks = QUADSPI_QUIRK_TKT253890 | QUADSPI_QUIRK_SKIP_CLK_DISABLE,
>> +	.little_endian = true,
> 
> did you test your code? miss set sfa_size here.

I confessed earlier I did not, and I'm very sorry about that.
No future version will be sent until it's all tested.

					-Alex
> 
> Frank
> 
>> +};
>> +
>>   struct fsl_qspi {
>>   	void __iomem *iobase;
>>   	void __iomem *ahb_addr;
>> @@ -1003,6 +1012,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
>>   	{ .compatible = "fsl,imx6ul-qspi", .data = &imx6ul_data, },
>>   	{ .compatible = "fsl,ls1021a-qspi", .data = &ls1021a_data, },
>>   	{ .compatible = "fsl,ls2080a-qspi", .data = &ls2080a_data, },
>> +	{ .compatible = "spacemit,k1-qspi", .data = &spacemit_k1_data, },
>>   	{ /* sentinel */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
>> --
>> 2.43.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
