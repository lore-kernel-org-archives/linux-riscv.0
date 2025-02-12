Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7ECC021A1
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 13:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CVt82O4CcpoiTJMYpwjLjkSW+lJ0A1E5hfA2tnaU6KU=; b=4dy55g1W27M4Eg
	tfBI8Hypi7bu2CQxl4GmkDW042tuQ2Sd+ENs6wAJW3FieMsO1sDnTT23YQl39yb3vFqI2Ob9+jaZ/
	FcvKZgW+fh2cooJ4xjzBpVwNqzlV2trW4W5T+ThZRe7maimO+0lyYc7cJKHD4bvqwFj8ORYmQQ6P+
	Aku1ucTIw7gmgSAKsRohrSqhCyZmoOkskDyT5Lt+6MIfTikJmKjsmLwsr8VKnwU0rCEM1e6us9mLA
	SagwffjMaqduLLI87DEtDITwuys2zSRa4fUBARaWYdPFFL5jivMm4javO3qTSf4t8ANRz6yko0K0s
	fbZ6lrWHPrVE0mh1cypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiDEw-00000007Zaf-2Kxi;
	Wed, 12 Feb 2025 13:57:22 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiD88-00000007Y1M-1nAP
	for linux-riscv@lists.infradead.org;
	Wed, 12 Feb 2025 13:50:22 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3d150512bd5so13350795ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Feb 2025 05:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1739368219; x=1739973019; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L++QIvyizjU09jC6Ra79XUphzeMezUQZEHB1o4PFgv4=;
        b=vXPyrV67Q7rPB5L7rvj4gj6E7SdVPvGADT4mDjPtcy512WXISlbFrTs8090RjjX9xL
         lAUdct1hFSBJYodWz1yzHT2VJoY8HfiB7SQEDqZg96OoP5InyIYFyRfcCtf9/29PXK9b
         1H5tXOMvZQAUfgdRrQnIflkScP36y3bM9E+GJnjceuZwOvmvNBdesqtIW+DsNBCoANDU
         qElB5/sZtyfx2vsWsEj/RWDo1y1+VtvxdiEZvkxnMkQfQjm1UEuu98oWEmpfG8aCdBVU
         /QnQPnyfiis1ucYO6sb8S8JS7uYA/WhJzFvPLLsJal1vTtcJEXxg05YA0l6i8lsN10KS
         +7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739368219; x=1739973019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L++QIvyizjU09jC6Ra79XUphzeMezUQZEHB1o4PFgv4=;
        b=B1cnIJslQgKwi8nb9nT/VJN8EARGfFMSOYIdaYUpbNNi7Ng2SluIEdm3B9RkHx/CfW
         mBxLBiw4uDtznydFIn88AYdSJMyZe/7OsfqNYWR/JL9N1GOgyMBJc2ddCyp723uUVU33
         2L1ThJ4ClKgO3SDYyI4p/y+anhEYOkhRzrm6BSc8DsZrFDGDU1EVxA/hMnGmA5NOKq/9
         UCg8u7JMLUBiSI8r7uGJqaOK08MElYj3gJgr0MQ24G2oguyIUDj8YqwAOEMy9K3yWbDq
         JuUp21X1ObUTH6BiyWtQSROmOCdHG97duN2BfajzjUn+9s5QzE1NWD1aFmmvZd/tErhV
         qZjg==
X-Forwarded-Encrypted: i=1; AJvYcCUpVvr67ax5CQOW9NBjqsh3dPeBYrJBhovaqjRTE1F1FsUux/4RU815EtDdP5+1KXXNDb1bzKytH8aipQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUzT8R4EDg259q6fS+poGPrNcrL5oKtWk6BSGJUzXsS8KqP9Po
	c0v7LoDX2zDtOPW4ovGFZP+XvUzLlMAoeTG+Blv0bfRnBcAsF30G2B/Ep30tzko=
X-Gm-Gg: ASbGncvn33Dp9fdlr8mg1e5nVaV+/hDVvwPCL36AHuilo/60jciyMJkrijqDExEiO/Y
	Pj5OdB8LLvz5IbiCuTh4zgGn1ldDGaUA7dmL/Z0f456p+HOdeqqIm1h3xMbPVshowy8B6g8dGCz
	2H8gCjZVPJOunSgiBX+3IhZjom9TZpI88a7xuEXKIpmq3nxFUNUxv7EzFkl1KKHPCRtZJrmvHC8
	UIMXSnxtIW5InEtNI96zcgEkz/wNLruC4F8GklUWzI+VJlNcvmXbv0f3BIZs6MH+xqkQtcz+486
	g2BXdA6BlaKdrpMuzvQkeDwP7nOkTnJ7X7W+xESGnV2ENFIqoBH8JNc=
X-Google-Smtp-Source: AGHT+IGZhne98LVx62ktvxV2QQrzKBPSzDo+6zahs2aSXaoHvmnrhXadwbf8Kww9ZmRSX7qfmJgLgQ==
X-Received: by 2002:a92:c56d:0:b0:3d0:4700:db18 with SMTP id e9e14a558f8ab-3d17c1090damr31382265ab.20.1739368219019;
        Wed, 12 Feb 2025 05:50:19 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d05e96f2cdsm32337095ab.50.2025.02.12.05.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 05:50:18 -0800 (PST)
Message-ID: <b67abe31-5647-4450-b025-2bbacee5fa72@riscstar.com>
Date: Wed, 12 Feb 2025 07:50:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
References: <20250212-k1-pinctrl-option-v2-1-bde7da0bc0d9@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250212-k1-pinctrl-option-v2-1-bde7da0bc0d9@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_055020_687376_BA82BA1D 
X-CRM114-Status: GOOD (  21.55  )
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

On 2/12/25 2:27 AM, Yixun Lan wrote:
> Pinctrl is an essential driver for SpacemiT's SoC,
> so let's enable it by default for this SoC.
> 
> The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> 'make defconfig' to select kernel configuration options.
> This result in a broken uart driver where fail at probe()
> stage due to no pins found.
> 
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Reported-by: Alex Elder <elder@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

I just tested this version of the patch.  By default
PINCTRL_SPACEMIT_K1 is "y".  But since it's tristate,
perhaps it should be default=m so it's not built in
for everyone.  Yixun I assume the K1 pinctrl driver
actually *works* as a kernel module.

Anyway, I suggest this change to be a module; Conor
should weigh in.  Either way is good for me, and I
have tested both.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
> when using make defconfig, thus fail to initilize uart driver which requst
> pins during probe stage.
> ---
> Changes in v2:
> - set default as y
> - Link to v1: https://lore.kernel.org/r/20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org
> ---
>   arch/riscv/Kconfig.socs          | 1 +
>   drivers/pinctrl/spacemit/Kconfig | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 1916cf7ba450ec9958265de2ca41dc504d4d2f7c..17606940bb5239d0fdfc6b5aefb50eeb982d14aa 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -26,6 +26,7 @@ config ARCH_SOPHGO
>   
>   config ARCH_SPACEMIT
>   	bool "SpacemiT SoCs"
> +	select PINCTRL
>   	help
>   	  This enables support for SpacemiT SoC platform hardware.
>   
> diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
> index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..c18d879274e72df251e0bc82a308603ce23738bd 100644
> --- a/drivers/pinctrl/spacemit/Kconfig
> +++ b/drivers/pinctrl/spacemit/Kconfig
> @@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
>   	tristate "SpacemiT K1 SoC Pinctrl driver"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>   	depends on OF
> +	default y
>   	select GENERIC_PINCTRL_GROUPS
>   	select GENERIC_PINMUX_FUNCTIONS
>   	select GENERIC_PINCONF
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250207-k1-pinctrl-option-de5bdfd6b42e
> 
> Best regards,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
