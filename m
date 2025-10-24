Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F322CCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 00:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GeyRYlD/8FjtzycEqqh7kQ3KOpI0oHVgK52X0Tr8XiM=; b=hXxlJFXEowcSu/
	XkcQF0LVc8MZPJFmv5831PFWvbQ1goBCIu2KaBqGJVPUc3e8lfMzxWMbc5ffTf/+6FDDMljlyDU15
	pLjNghwbbZ/Kom9bnh7cY76IMytrAthj2eKIeUk0LzYdQEpIFJDQIyRybtshsWU69H03CFUUhBScM
	oiqgRBGjOewWchvFWY0zw+hOE8BavRGabfSQfdnwzUKVeTLMXfyEZesvUbJ/CSR9U3arvVjNJWaa6
	E3iD5uC3V/2538VFaun/aweaudfLCcfwPLhH/07AkcZcvFP3kjxC8YylkyUCGwuz684pMdhXp6GpO
	ST53yLiNe4GqLj6AfOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5IA-00000007sB5-3Dd6;
	Fri, 24 Oct 2025 00:04:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5I9-00000007s9K-2coS
	for linux-riscv@bombadil.infradead.org;
	Fri, 24 Oct 2025 00:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=P+K9cJwbaPRk/hXgfMNgGGaWCdBEf3vNiXBdImnfxaI=; b=Sh1RqC3OR0tyABc7Ggxn8D8yDr
	rKEHP7UngEyC9JBbckvJOwnElZkLwv7CLJd0p1lj15pPxXeuJ0ydgJH3p5Rokpra9ycXZWAreDt3B
	ZTPl4IsABIYaTeNP6qhHH7Qh6YXnxMjsxwfdxZU1H6vfmjr4LtDn+o2D2xyiqB8PQBksmjulpQrH7
	4VNd3vrBvSmZ2mt9Q932w5YS8s0ryMjyYvg3yg0yoKPKBWw545I7MPVgbh20/dCtIhlFHpHKpLmse
	2Yq1Wfp3lxLLSERni0o3rNByq5n9EFRDqUyt8Xb2e1nQCfzJ+pYjLs8ocWadIdjRb1rhxYtl1XLhx
	mFSjXQSw==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC4QR-00000001ruU-2bCs
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 23:08:57 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-32ec291a325so1119948a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 17:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761264260; x=1761869060; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+K9cJwbaPRk/hXgfMNgGGaWCdBEf3vNiXBdImnfxaI=;
        b=Tbp+u+NpfZ5hvd+uDuWB3kt0iL1+4PttNJDx8ZLFcwAF+QG7lxnk8Py0mkF21YK1+c
         hkoW//sd9S1LXJYReNExlHts9+Jgq883vgSpj6WDSvsodbU0JwC/lqNimJY5bR1Cm8n6
         D8lr/u+pl03hiG4QKuzXqG9XGFzqiGolq+MHzskZmSkG26R2jOAgyD2MgyDRhKq/b7Vu
         96OXWjUtwLVA6tZj/AAc7wl03BFfPy+hE4Iygvg1qM3yn/CnttcGjh0LBYYVnx1u99my
         IjZLnoI/TUaPzhg66Xdoumnjmtp90LYXW5sRYXeNptMqV8ANQMX6uK+AxO2Tr2bfBbMp
         zU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264260; x=1761869060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P+K9cJwbaPRk/hXgfMNgGGaWCdBEf3vNiXBdImnfxaI=;
        b=R5Xmh4UvvTHpkwXaxRjp4bEoVnY7T0gfU9NRgB1SwSQxhkQBDniL4fHi0TRsnNvMpc
         ZeLn/CaiilM5hqw/xJdj56anxmKCBmjmYLGjs1P/w15uWcwVVdfQvnizwVxZcr23rzs4
         qDST2sVEfcKg1VWd2eSMIfhXRTFgoZM3ytwlGq1cNSeto7+8T0a1MEwJloSD5CFmGqWW
         7wOvUrW67/6W0dS4DBM6STq0T/CANZ55s8uc1gY/FOaHRvXycDNqlbxYeqoWb27EldZS
         54EIEcMxpR7F7IMKzh75MIJEmuNrNhj0yAo6KhbO6/whXEflUaCixGtq387qRKg0JCGQ
         7Pfg==
X-Forwarded-Encrypted: i=1; AJvYcCXLzc8XSPkN/M3pnb3A/6qoTxum2Eew3g7bg6z7xeQ/KcZLz2P0v9grXewet7jlBwSAzKlUnzfxBFAfgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8iAR0Ry3OokwMLY4iBqxR5dM1s4EkfmSOFj4voa8WFwvDOP8J
	5KrhbNt6hJKnmSsT9Jex5s/x4j6qpsvHjwjbmHTPGusyMiL407a7Gl0qDTsyOJXoOmc=
X-Gm-Gg: ASbGncvgltJ5PolANfTmz3CUnuHgM5G1VIPfRatdpaqKJwtQoxvzUdUkNLtiE5dDIjJ
	8eXd/zy5awMu8EF5270I1m5MWhdSp2MiZkwcNQfgQ/FNMTaxLXrzmYjVm2d8hggKbPbztY211em
	eHVJhWPjbOZjpWHJrbkE4Hh6sCZIw4t8f1jLu4h79cokQGEwoLA/SNj37kJomlK/bgX7CPSxKAK
	eGh7paK4fUWw4vQ2ADQknlm5K3/Ion4MhyZRk8k8WW7jqm0TMuAo4Y1iodydh7f2vq5Qmss4zpC
	q+kEsX3Ys6VIW8+OjkMSlzGkRHtHi8NLMiXHFgaa1G4h8+gcL0NTBr9Mf64mIANWjnpvXeWU313
	Ux698f4Z1lp/myYM7epateipPiFBS3H89U83bdkdY/dmpypcMT4rgkj7iNbGTeEriGQLE2qPXuP
	GJkB0Bq9w1CXMXf58XGb84TlU1QW4=
X-Google-Smtp-Source: AGHT+IE6HvbwvsCvQ5Cwmi6yqRRJUHyh9wrThsLz6Rz6ydecgfWWPWXRIw3RN/OVaQzDTAtqVvVBTg==
X-Received: by 2002:a17:90b:2247:b0:32d:e780:e9d5 with SMTP id 98e67ed59e1d1-33bcf8e5f10mr34441928a91.22.1761264259653;
        Thu, 23 Oct 2025 17:04:19 -0700 (PDT)
Received: from [10.211.55.5] ([208.115.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff373easm3702460a91.5.2025.10.23.17.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 17:04:19 -0700 (PDT)
Message-ID: <f1a77da8-edf9-4e14-a7f9-01680f60fce6@riscstar.com>
Date: Thu, 23 Oct 2025 19:04:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] spi: fsl-qspi: support the SpacemiT K1 SoC
To: "han.xu" <han.xu@nxp.com>
Cc: broonie@kernel.org, dlan@gentoo.org, Frank.li@nxp.com,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-8-elder@riscstar.com>
 <20251023195615.ke4rjhlgrxiavv6r@cozumel>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251023195615.ke4rjhlgrxiavv6r@cozumel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_000855_864725_B522582A 
X-CRM114-Status: GOOD (  18.06  )
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

On 10/23/25 2:56 PM, han.xu wrote:
> On 25/10/23 12:59PM, Alex Elder wrote:
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
> 
> Do you need to set the new sfa_size here for multiples of 1KB requirement?

Wow, yes.  I'm very sorry, I shouldn't have sent this series
out so soon.  I'm not at home and am not using my normal
development machine.  But importantly I admit to not testing
this on the target hardware before sending.

I won't do that again.

					-Alex

> 
>> +	.invalid_mstrid = QUADSPI_BUFXCR_INVALID_MSTRID,
>> +	.quirks = QUADSPI_QUIRK_TKT253890 | QUADSPI_QUIRK_SKIP_CLK_DISABLE,
>> +	.little_endian = true,
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
