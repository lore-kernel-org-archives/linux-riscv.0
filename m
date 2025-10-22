Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99003CCD1AB
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 04:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQoJCJgAFLpU8F4gqaOkCaIo0NWNNDTekD/Fhpe8zm4=; b=rumMVuH1Qt7tid
	lPOcYxDxPP59L4agJ8ofcDw2EywkGgn3Lk5xTsfdWUH9x766xW2pZZi/N9ZoQLUyMSaj2VQKLBIoK
	iWD2tDNNM7znkdcwmYq7F3YPun4CF2pKaFk0U2Pxn2DqNhGQ0HRqp5jsL7qGFU0gYlKM2MyP4LP3w
	Y2hah4nunb+wIK9BBaLeybIvsFqrxbDCEGsFJrs4ywVP1PiDY7r0hsKdzJZsQM7no5+irwgvThTDm
	5RN3ppM0q/bmgtp61TbBKwWV/Bd3JzjeRd0BE3+AdrJ7ueFKUg4b4ovTwicrYWse5c0IylWAj55Sl
	3RiF0/iYTYgzkGiaZ4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQYT-00000001RFW-1r6b;
	Wed, 22 Oct 2025 04:34:33 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQYQ-00000001RCg-2Rxf
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 04:34:31 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b5515eaefceso5223382a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 21:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761107670; x=1761712470; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FDiGuotIxX46vya9PSPOnNWB7duItx5Jd361PWPn4+w=;
        b=hZ/SdW+hG8J0Yj3PRMJvDzU7YMZDfN7ih/R0HEvsEOQw0/9eK+LNRt/lBsFFImKenR
         3xxi8XfBp2kJ04VB7Es1dGzTTUyAbDb1aXYbRpru/9B2aG4WX0tTkE7I16fdHd3FVBx+
         ZLmbBaKKqWIvQhgGFfXRt/eaecWA4q2QTByOLzhhfPGmGmRTF7rzcNMU4pReuIABWccj
         VhM+obVw7or0HbkPWvG0a/0Flw1bZVT+QzaP0ERBWhIJNbcFtKjqnNlgl86TKzOTB7Mv
         8ivHFoFqsJuatoVhCCdE9BJV2z/NGEGCBazty2Sb1sSN5bh4Z1OWhSnwkMvcTfFV0UKD
         hZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761107670; x=1761712470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDiGuotIxX46vya9PSPOnNWB7duItx5Jd361PWPn4+w=;
        b=rTfQVVQLYg4NrG1e0H5WbunZ9gveHk2QywWtUEAPZitb544dBi2XyRvbRLT7nNYdeu
         0kzm6aWYxmozbpIQKHSeLcfzm3zCeBbOUsnkVtodcsRYNHSBSUB8qCNkvZOpLEQTnFgy
         jECsbQZ3ELua48ihuwZSBS/ywmrXuDbHKTa3lHMlN0oR/WDojo6Ph02Epc89ffpQHOcl
         XZd/o1m5NkpMskTXxlR3++UTE8bQq5a9U8vlw91xbAKATsolTO5AKZC1k1i4ETxnNHQf
         2wgR0JrrTTMbt3GCR/wa6FGi5WQTFFABrvYtEdBTrZ5VrTQyn1tI4iDQZdUS2RQd/x+q
         VOkw==
X-Forwarded-Encrypted: i=1; AJvYcCVhsBPiWiGfRxiTFXn7uuJhmAeSbn9maPRbZqehHg4y+amx7DwZWzxqGy11rZjTQ33dLFfRZlHESAp+ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdbyhHpTxr/u3FYwpigUmTkEonGgslccuxwJ0mnpc2Bsn313tc
	4rtw5SibF0Rcd8HB2T2x6uSQuWpwwwNVU35KLOzlo9lC4ypb1GRx50vwSYP47FO6gY0=
X-Gm-Gg: ASbGnctPHXN6uzi3WeKQ6wzzNGT/QlkDkD+Nt5wsQEzZ0LKq9pujLPXwrWv9EdelLpq
	x9nCLs9biuvbHqM6mhvhqwoudiMpr+q64ukIKloJ6Ruy+u3QwCQsBHIUlkvGiTsJSnzQJ1c33It
	Gx6v/L0XDTYg9OX/KCLGHjaEGsMoMUs3UE43GvPj6y+f+ldSCNHf9rjOYGbko72ZD7cvv9rlSfS
	PrfiUJd1KWC7dxtBl405FaJb1Qz9by6Gx5HeyqqSKW7an4V+tJ1SRq0/rWecPPPvKjnb0gqN8Dr
	1iMseiTyuLCgXFuK4YFkDUnrv7QF85zTCTGLn4500H7LrWIdUp2HiMOnhA0kBFvXdLpNSNFeDwS
	MqizdFBvjucl0EpxUExOl5BRzleTnXFT90BQF7le7bq0jdVhwfQEPd+4VD77t/zMK8Deuowx7af
	qJb/VehYe4TbaRVHHwnp5eGJN5de1ahBqaVg==
X-Google-Smtp-Source: AGHT+IFAmBZDikILCClmp+7vVKcnj+i3LKl9ZiDVNdmnt9krXWJ4kKo97aK6dBcsuheQDKRB7IIDbw==
X-Received: by 2002:a17:902:e784:b0:292:39b4:e785 with SMTP id d9443c01a7336-29239b4e9cemr216223575ad.26.1761107669783;
        Tue, 21 Oct 2025 21:34:29 -0700 (PDT)
Received: from [10.211.55.5] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fe4cdsm126257025ad.97.2025.10.21.21.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 21:34:29 -0700 (PDT)
Message-ID: <91bd83c0-c721-41aa-9716-a750b73c7e41@riscstar.com>
Date: Tue, 21 Oct 2025 23:34:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] spi: fsl-qspi: support the SpacemiT K1 SoC
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-7-elder@riscstar.com>
 <aPaML32I0Ao1xhpX@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPaML32I0Ao1xhpX@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_213430_645784_79C33C86 
X-CRM114-Status: GOOD (  17.24  )
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

On 10/20/25 2:23 PM, Frank Li wrote:
> On Mon, Oct 20, 2025 at 11:51:49AM -0500, Alex Elder wrote:
>> Allow the SPI_FSL_QUADSPI Kconfig option to be selected if
>> ARCH_SPACEMIT enabled.
>>
>> Add support for the SpacemiT K1 SoC in the Freescale QSPI driver
>> by defining the device type data for its QSPI implementation.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/spi/Kconfig        |  3 ++-
>>   drivers/spi/spi-fsl-qspi.c | 10 ++++++++++
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
>> index 4d8f00c850c14..2e3d8bd06ceb2 100644
>> --- a/drivers/spi/Kconfig
>> +++ b/drivers/spi/Kconfig
>> @@ -435,7 +435,8 @@ config SPI_FSL_LPSPI
>>
>>   config SPI_FSL_QUADSPI
>>   	tristate "Freescale QSPI controller"
>> -	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
>> +	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || \
>> +			ARCH_SPACEMIT || COMPILE_TEST
> 		   ^
> 		   align to here

OK.  I was mimicking what I saw on the only other instances of
a continued line in the file, SPI_BCM_QSPI.

					-Alex

> 
> Frank
> 
>>   	depends on HAS_IOMEM
>>   	help
>>   	  This enables support for the Quad SPI controller in master mode.
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index 9ecb756b33dba..f4f9cf127d3fe 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -267,6 +267,15 @@ static const struct fsl_qspi_devtype_data ls2080a_data = {
>>   	.little_endian = true,
>>   };
>>
>> +static const struct fsl_qspi_devtype_data spacemit_k1_data = {
>> +	.rxfifo = SZ_128,
>> +	.txfifo = SZ_256,
>> +	.ahb_buf_size = SZ_512,
>> +	.invalid_mstrid = QUADSPI_BUFXCR_INVALID_MSTRID,
>> +	.quirks = QUADSPI_QUIRK_TKT253890 | QUADSPI_QUIRK_NO_CLK_DISABLE,
>> +	.little_endian = true,
>> +};
>> +
>>   struct fsl_qspi {
>>   	void __iomem *iobase;
>>   	void __iomem *ahb_addr;
>> @@ -998,6 +1007,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
>>   	{ .compatible = "fsl,imx6ul-qspi", .data = &imx6ul_data, },
>>   	{ .compatible = "fsl,ls1021a-qspi", .data = &ls1021a_data, },
>>   	{ .compatible = "fsl,ls2080a-qspi", .data = &ls2080a_data, },
>> +	{ .compatible = "spacemit,k1-qspi", .data = &spacemit_k1_data, },
>>   	{ /* sentinel */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
>> --
>> 2.48.1
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
