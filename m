Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1296C77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Z9BRXbROlZxCx8Xsc6jKhvy9k91KiVsx/dhilwJj/Q=; b=CFlV1xSD2ITsvp
	UWEuZFW0ug46R+22wsYSblqo6cjWwiYbdTI1lKP9Ibq+nO/vAt07aDBgpa4k7+e/L85p+0Wp7OXwk
	ni8tOX9G01tcW0ofph4kzoUC7N1O4LLwOoyQTNQl2+QX5wrq5oH1FPu34DcstDJ/bmR7wN9JkVtED
	oTXECh7x/z0pW8yZbU3gAHIdgNisr8nGhDCVUC3uF3dFB0J3saYTyjL+ykLJjL2Lt5pcNKco5/zwl
	x7gn2EGwwX0bZaLjGMAq0eLSkyFBcU/oo63sJJDBO6YvPshpfoquPaz+uZAh+SCSqQGVsIiqPMicR
	fI+Uu25quqQ/96l8e/Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIee-0000000Dend-4C1v;
	Thu, 19 Jun 2025 17:02:25 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFEn-0000000D9fO-0iH5
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 13:23:30 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-40791b696a2so192483b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 06:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750339408; x=1750944208; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/70FnD9tQ+fRiZyRY5r5SMsQadgm6QXv7BQ/o/RrZC4=;
        b=ts/1ogQc+9b9z0L05pBDuOBICUClkxQWWv/OBKqTWbNStofrzJZZzGIj5kFFLOziqO
         AGgEVqz12BaXck29Zys/c0T0GPZlIx5JUA2oik3FWeWCglMeqkA1zhO9lNDOqUwlcj76
         Bdwu3jjOCFlIzNbow6zGU03QXMMFKijYdDcvuzJ+4iSRXedHvuxINyixDtFKys7vu+bL
         fioDPTOAMO81K9qlNJeidxUXeXpfMmbZ/Zhv665lyHO4m1vEqt9lh893s/evn8BbsNED
         ii/vveAYC7t5tZutyadMzju5z7zvwQXEKxIz8p7CvzPqmt+OD+j+D93JA369aLreIKib
         CTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750339408; x=1750944208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/70FnD9tQ+fRiZyRY5r5SMsQadgm6QXv7BQ/o/RrZC4=;
        b=gm6ryClvlKj4AOKd8+42PETfkOxuLfPTldHqvvj0rjyhrBSD10LV4eh09exH3bec4w
         GG9+h6LCmluWepETWle9P4M9hjrKXAh4j1u6r8GPIHJ7VC/R53cngwUEa17dE4xKYGyU
         cQdK2kLKkxz8vxHhrnMNsA8/uZT9L5qxZELBbZFTj161R2ymU08pm0VO1+XLLenAtbu0
         KRDSGc3qVEAi9i3dm6ystjxgjnokoW18A2X0x27LRL0hjZFV4obyMtfDmmiwK23pdlCJ
         YW9b6hwlDMCxrG3+7vEDEOq19gCW2u6gQiPDk06/mLswfl6cvHaotm1amB1YnMM8H0Le
         Hj3A==
X-Forwarded-Encrypted: i=1; AJvYcCUHTBbLTYv+cg6rXqDjaQO1A3AMvgCzU7my2x9pJnsp9fdT2Y/TyaNmxhhxmF9OG9D5PFWL5wFJSXxdIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmFOmqVGPmP6oo1qvYlKczkP3XEWwY1cb9KKqPKSFRVRPOJbfT
	2iljnpmr65Ai7/0soSlC2WI57/HxWA0N2Kzy1SuVcUjer725g3AXdF6xiy86+z2PcPk=
X-Gm-Gg: ASbGncuIhFNk4AjwRZa+Y86euurUzEJROke9xWy7TWynzIqL89illKjMvNhngcu6d1u
	0Ga6RFlhUsOH2pHDSOq2XAsyqNdkht679nPXmGYd1o8o2BTy4IgZ2/W8JJ3JTbaeyWE5KgZQHMR
	G+eH3+2Rv9D8c2ayCpLRv3pYRxKK5CHAvo59Mis70E9QyfZABn38/ePCMX8cxiIdDIwvqbf+pcT
	A5wqIT+Bt1lXUYJ8Pi+mjc1Hszpwa7N58QI5NrIsi79q6hKyd5A9joDQprO7H164Qwbnj9ehcKQ
	Kw4eJ0cTBT7gTTErojdF0kCO8idT3I+Rjwkb1N3OZY61mC55ydT2UYrXHlTv0E+bpZESIyE6qqo
	W4ZUr/wUEsswgqokpvFEjw8DcFA==
X-Google-Smtp-Source: AGHT+IGVYUqAL7UYn2pwdI0pVBJFm39ZocyoGLl1F6P4Vm48on+LUD6YmdbeE2h0MWfBSEJb6OB1Ew==
X-Received: by 2002:a05:6808:152a:b0:3f9:8b5b:294c with SMTP id 5614622812f47-40a7c23cff7mr13295372b6e.31.1750339408304;
        Thu, 19 Jun 2025 06:23:28 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a741b8837sm2759463b6e.46.2025.06.19.06.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:23:27 -0700 (PDT)
Message-ID: <3d8b4025-4e82-4245-8923-b55954894137@riscstar.com>
Date: Thu, 19 Jun 2025 08:23:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
To: Vivian Wang <wangruikang@iscas.ac.cn>, lee@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-3-elder@riscstar.com>
 <4036e3c2-8324-4eeb-9aa8-df1fbe9c7943@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <4036e3c2-8324-4eeb-9aa8-df1fbe9c7943@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_062329_212566_15D1D842 
X-CRM114-Status: GOOD (  14.12  )
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

On 6/19/25 12:46 AM, Vivian Wang wrote:
> On 6/14/25 05:01, Alex Elder wrote:
>> <snip>
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index 6fb3768e3d71c..c59ae6cc2dd8d 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1182,6 +1182,17 @@ config MFD_QCOM_RPM
>>   	  Say M here if you want to include support for the Qualcomm RPM as a
>>   	  module. This will build a module called "qcom_rpm".
>>   
>> +config MFD_SPACEMIT_PMIC
>> +	tristate "SpacemiT PMIC"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on I2C && OF
>> +	select MFD_CORE
>> +	select REGMAP_I2C
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  This option enables support for SpacemiT I2C based PMICs.  At
>> +	  this time only the P1 PMIC (used with the K1 SoC) is supported.
>> +
> 
> Module name?
> 
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called spacemit-pmic.

I will add a comment like this to the help text.

> 
>>   config MFD_SPMI_PMIC
>>   	tristate "Qualcomm SPMI PMICs"
>>   	depends on ARCH_QCOM || COMPILE_TEST
>>
>> <snip>
>>
>> +static struct i2c_driver spacemit_pmic_i2c_driver = {
>> +	.driver = {
>> +		.name = "spacemit-pmic",
>> +		.of_match_table = spacemit_pmic_match,
>> +	},
>> +	.probe    = spacemit_pmic_probe,
>> +};
>> +
>> +static int __init spacemit_pmic_init(void)
>> +{
>> +	return i2c_add_driver(&spacemit_pmic_i2c_driver);
>> +}
>> +
>> +static void __exit spacemit_pmic_exit(void)
>> +{
>> +	i2c_del_driver(&spacemit_pmic_i2c_driver);
>> +}
>> +
>> +module_init(spacemit_pmic_init);
>> +module_exit(spacemit_pmic_exit);
>> +
> 
> module_i2c_driver

You're right.  Thanks for the review.  I also added
MODULE_ALIAS() for this driver, and defined MOD_NAME.

					-Alex
> 
> Regards,
> Vivian "dramforever" Wang
> 
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("SpacemiT multi-function PMIC driver");
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
