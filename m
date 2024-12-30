Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA1DE77188
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Dec 2024 10:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ehrG/0gVSRNY2EUA88olEgo6CRjyRMifWMyDJYE+EU=; b=NHWzooI2nqnx3e
	1abawh/GIcLJiOwBpdNbMfz1jyRUalsIy0nI7ZJz+t67rQwv2CqhpppSrQ2pIZXbukgXSWs71GWja
	nZ6wBZ2Az2eJykdNSWu/Ty2jilBgn2CDE1JL5mqmBd8whYJX5f0xbyBKvU8qMjHYd+v4IBC6FBlUP
	Mwxvh8+iNTQGZbCjbOeMBvwIkF++gzrD+2Rc2AU2TzgotyknlfBchC+WY4FLP1EtngzFfLek+UcbX
	JrKpoFrXiPiA/RWIkj8Wbcdlq/vM+/AqUYuOdkCx9KEDQIQz3fNspvAakbUWGcxmH7V5Veg64hrH6
	cOh4Ll5E4xJb2amk/lUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCny-000000050tv-2vYd;
	Mon, 30 Dec 2024 10:15:22 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCnw-000000050ta-31US
	for linux-riscv@lists.infradead.org;
	Mon, 30 Dec 2024 10:15:21 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2164b662090so102047395ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Dec 2024 02:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735553720; x=1736158520; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rVInIqxLrBrAuugfOgJNvwfeXB6eQ8A/wRn1cNxsX+M=;
        b=a66wKs+EOAJhVGcRn2OvUo6HChoFR/RHKNxJNjrpCIXt92hFscN4svEFC7cuMe6LPZ
         l2J7iqSDKoNLMgfR1+UlAH4lz2lC3sEn5Rcth2bKXIjDNRWB9wM2JUy3FnbBtKKvhLQV
         O5NjZq+tPyk77j+pqmWVbc/QSytgWa87NW0WQQ4IHJI7OjDlC925L3ZGHnyZL3/pSWJ2
         iG+I7xtwEpstjGMHIsZl7PJMPaQaeacNRj93LWaNHSEdyBG1jomK3QQtFm2LwXNcVVzA
         Wo91NJJ6MaoppE+YpZGguajeUh7W6d9EKms8uzdjID7p5UHTXKhFLT5tWvfL3Erzl9nA
         nodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735553720; x=1736158520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rVInIqxLrBrAuugfOgJNvwfeXB6eQ8A/wRn1cNxsX+M=;
        b=Yz/JGmklJrzbYHQ1jCMti4tLn1f2FM6vxHkdZzL1ZHOIw4APgmJLWN3kGa8Tm1R6Z3
         YchLo976jvbg06Fidk9Jb3wvehH4HD4bNUojNsQc60zXrKz3gwWIUBGgabRRmVtC7XwC
         mAL7d/Q8Rxs8nOdZFCLaA2yoEQog0SWe9E/BfThBrzlJUq/GveW9oXuVqm6wtxkWySOK
         4j52tCWWwEfPh+4cn0g0hrhXsgjenaNoGaCKX3mu7mNzgpG00gMloxGeNilZXmEr8kvi
         qIH9Q9COhk8yOeGetD3+icIDk/jARfvxvM1qMfttbsgekSvWwOtv0Vh7VjFritlxeCLB
         hn3A==
X-Forwarded-Encrypted: i=1; AJvYcCVgszkg+DtgzmZIOiLNw/gBIII4duBHwmunk2iDyPNgN82dj++T9krtjCPUOnnqusJWpmTH/qrhNwwHkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzlqhZu0kJ7kfUenbO/qPqjd6lgyIKUXSV83zb9tlkMySgv+fV
	7NnYie6vqtKSjz46TEPa2nGA0Bw7J+mhd4arisLh6wVdu+Ywkxalb82nU1dKTA0Xhw==
X-Gm-Gg: ASbGncsHS/KKVpEkcPoIzqu+BNcv73ltTz38om7pjlx+q9O1+xkuuveyBybQ2LiECKI
	g5Mog/ifHvhTwL0PvvQUZGR7Q6BBaPBvuUedxvydyrW0iQbvhP/yCpk0j3ptTpQl5TcG8LVH/Zl
	C9CFNW9q3c7/usqz91CgHg1T+PS8mSAR4VmjH3f2RFSgW5rN7kU8G4FaCBC4Vks0NIxQS0u8IBS
	Kb1A4ZYfvscm4jN67vIEUPrtnUshWIe0GKLt5Rq
X-Google-Smtp-Source: AGHT+IEmHTaD9Tr2Y3HlJEmDcZxsL1OdsknlRynt/KU7MYC0MksDO07aK93FpqJAkDEuP++flRmEUw==
X-Received: by 2002:a05:6a21:3994:b0:1e1:afa9:d39b with SMTP id adf61e73a8af0-1e5e044fcbfmr52519792637.7.1735553719894;
        Mon, 30 Dec 2024 02:15:19 -0800 (PST)
Received: from [127.0.0.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e32f6aa2sm17186103a12.75.2024.12.30.02.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 02:15:19 -0800 (PST)
Message-ID: <adcbe3b6-fd19-4bd3-941d-f17fff62720c@gmail.com>
Date: Mon, 30 Dec 2024 18:15:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mfd: add new driver for P1 PMIC from SpacemiT
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20241230-k1-p1-v1-0-aa4e02b9f993@gmail.com>
 <20241230-k1-p1-v1-2-aa4e02b9f993@gmail.com>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <20241230-k1-p1-v1-2-aa4e02b9f993@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_021520_799317_EDD72CDA 
X-CRM114-Status: GOOD (  25.01  )
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

On 2024/12/30 18:02, Troy Mitchell wrote:
> Add the core MFD driver for P1 PMIC. I define four sub-devices
> for which the drivers will be added in subsequent patches.
> 
> For this patch, It supports `reboot` and `shutdown`.
> 
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> ---
>  drivers/mfd/Kconfig                        |  14 +
>  drivers/mfd/Makefile                       |   1 +
>  drivers/mfd/spacemit-pmic.c                | 159 ++++++++++
>  include/linux/mfd/spacemit/spacemit-p1.h   | 491 +++++++++++++++++++++++++++++
>  include/linux/mfd/spacemit/spacemit-pmic.h |  39 +++
>  5 files changed, 704 insertions(+)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index ae23b317a64e49f0cb529ae6bd1becbb90b7c282..c062bf6b11fd23d420a6d5f6ee51b3ec97f9fcbb 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1173,6 +1173,20 @@ config MFD_QCOM_RPM
>  	  Say M here if you want to include support for the Qualcomm RPM as a
>  	  module. This will build a module called "qcom_rpm".
>  
> +config MFD_SPACEMIT_PMIC
> +	tristate "SpacemiT PMIC"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on I2C && OF
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	select REGMAP_IRQ
> +	help
> +	  If this option is turned on, the P1 chip produced by SpacemiT will
> +	  be supported.
> +
> +	  This driver can also be compiled as a module. If you choose to build
> +	  it as a module, the resulting kernel module will be named `spacemit-pmic`.
> +
>  config MFD_SPMI_PMIC
>  	tristate "Qualcomm SPMI PMICs"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e057d6d6faef5c1d639789e2560f336fa26cd872..284dbb8fe2ef83bdd994a598504fe315f2eabbdf 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -266,6 +266,7 @@ obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
>  obj-$(CONFIG_MFD_STM32_LPTIMER)	+= stm32-lptimer.o
>  obj-$(CONFIG_MFD_STM32_TIMERS) 	+= stm32-timers.o
>  obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
> +obj-$(CONFIG_MFD_SPACEMIT_PMIC)	+= spacemit-pmic.o
>  obj-$(CONFIG_MFD_SC27XX_PMIC)	+= sprd-sc27xx-spi.o
>  obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
>  obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
> diff --git a/drivers/mfd/spacemit-pmic.c b/drivers/mfd/spacemit-pmic.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..d9f6785cecbd405821dead13cdf8d1f9fd64e508
> --- /dev/null
> +++ b/drivers/mfd/spacemit-pmic.c
> @@ -0,0 +1,159 @@
> +static const struct of_device_id spacemit_pmic_of_match[] = {
> +	{ .compatible = "spacemit,p1", .data = &pmic_p1_match_data },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, spacemit_pmic_of_match);
> +
> +static struct i2c_driver spacemit_pmic_i2c_driver = {
> +	.driver = {
> +		.name = "spacemit-pmic",
> +		.of_match_table = spacemit_pmic_of_match,
> +	},
> +	.probe    = spacemit_pmic_probe,
> +};
> +
> +static int __init spacemit_pmic_init(void)
> +{
> +	return platform_driver_register(&spacemit_pmic_i2c_driver);
> +}
> +
> +static void __exit spacemit_pmic_exit(void)
> +{
> +	platform_driver_unregister(&spacemit_pmic_i2c_driver);
> +}
I should use i2c_add_driver/i2c_del_driver here.
I forgot to add my modified c file via stg :(
> +
> +module_init(spacemit_pmic_init);
> +module_exit(spacemit_pmic_exit);
> 

-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
