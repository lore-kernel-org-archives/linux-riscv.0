Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B529BC02196
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 19:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4E+0lxx+pj3KoyQuS0IJyES9r2RELvJglQopR/34ibI=; b=3z75yLyH997M56
	HDCZiEFg/ZBxmUTTEtTRxjkIpAX7416AaLr3L5IvhAmbTCoxoBWhG6Q34O3w5eccn9hYFnFzBpIkP
	41Rmwwh7uu2aIzZ37IyjwglYYCPpc9sHI4WFQV5s+EEwm+laqUE4YejpQssFJ6N9aCAqtXj53VoT7
	EQXq3EnzlnbNjBtzYPsue3liDV9PLi6q98vLa9Ff3syNbo7rgiptwmWOwg3gJ2AmZSJ9QEHPQz8rw
	+T77LugEgBMCaO39yDpkUbScTSyqF1mRIL9wcn5oE7fKN7QA+c8Vxa0wcJRiLiJXnNlSoBWLss2yZ
	4XG8sRV5byAqvbxThgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTbW-0000000ApR0-42FP;
	Fri, 07 Feb 2025 19:01:30 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSeS-0000000AbGD-1nkD
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 18:00:29 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3cfeff44d94so6351095ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 10:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1738951227; x=1739556027; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xMNhNJkx3fFqX0U1Zs6VO58/T6R6XQxl18p8Q1ICoic=;
        b=YIiV+VfPC1grMKLK/YkbhVJTKoaBBhAWQ37YvBzTFEepxhA1vPsWon2robC1mtXmvx
         1/Xs9zStCMkafANLiZXAbkmMGRPetG4ydP38ZpgGpBdJeoOKa3jBSbHOLajHq4IaXKs5
         ruMrZHadPUbQpztySEIXmiy7m6IcREb2C0L4HcaV8uqCK/hHW6q0vA28/b+mChk5Ao5d
         HiGFB2T2xhA1MIZ9bftFlIWPI7CP9TdwR8DBEVLSwJVXJXe8QN2Qua+ZbnPGbaAxPcIA
         uNIqvaIcEZrPDnT9gGHUbYtJk/67KKhuCnY0yJuE5Ym0xh8FfqD9dnLTQ4CZ9nn/OvKJ
         EVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738951227; x=1739556027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMNhNJkx3fFqX0U1Zs6VO58/T6R6XQxl18p8Q1ICoic=;
        b=lzOmo8RN7IrGo26nTPByfccJgHZaYKY7xPnF4VZNAbrbX4fKWdam81/YRN9W/Q+31M
         wf84PzmFIdpL742PVA203Rn+cIEy9TrqDV/Iw0Cf+fuHQJO2DOzZRYYsHQUzRZ1LZZB+
         LfDknjINiBNureWDVn076mPMB1E+Aquw4VYk5jf9m2IYvj1iEexYOeSXFEGl6sJ2M7Ro
         mtDErxfcCRX2EnatjNfP5ounT8Gq7d2oVisIw4yeSk2Rx128KasEI4hfQZh00a2GkUoL
         Ixl/1Evtf/HgNXEtEETH7yFNzIf1Fm9Fc8zkWBLqZ+UP2nyLLf5Up84MC13XiBB+eLmY
         nP2A==
X-Forwarded-Encrypted: i=1; AJvYcCXUlaLpnrj3C6aTC84IY7DmlkhEKQtVJrSeJD9/y6u3re3VnjY73sElvwIuuFPEwP0otoEgd4XNINz5EQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbRkS+uDUSDefsoXk0fEhe+X5ZrWXzypDVsVSbcpOpM+e8kgZT
	zU9EO3i16gDLmQS3Pdd8sKnfQgSUDdCLDl6ZcOvZos1kYkEF8cByLzTzWBzIBx8=
X-Gm-Gg: ASbGncs26ytNPGWRW7EnrupADbs5n7iOtTgZu2A95S49EYQ3gZiS/SGIzT3YcOTUp7s
	UfTZ2t8PS3gYLCjDpkOhRVMOQVzuzBb1H2obt/3KwaZta3o6xS+p5OdUANMkMwgdzK+n5Bxjirr
	SM1fqREIrj8spHjGSZqi56edK7Y95fvCVjHpd6w8zNTMPQMzQf6WZeTnLP56m1EldIVmG9v9Vf+
	fzfS6j4Nb7YIeyl4yVVW88auLmmEKy+GGpoN0wm/ePYVzVJwAas12rKtFbuS2WMBaui5fHShMHB
	wGCTuYhI10cv31vh+nzeTRZRBR5KjwADrRzBO3Nqyv89un5mE9msH8E=
X-Google-Smtp-Source: AGHT+IGt1SBRGKsD6WpAiEsXocNvoOHnb4Bn+U0x/Qz/EiAOgMhIEF8/efAO7K9USdddQwvdoBY1EA==
X-Received: by 2002:a05:6e02:20c9:b0:3ce:4b12:fa17 with SMTP id e9e14a558f8ab-3d13df1d891mr32114905ab.19.1738951226514;
        Fri, 07 Feb 2025 10:00:26 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d05e9a0e52sm8627095ab.61.2025.02.07.10.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 10:00:26 -0800 (PST)
Message-ID: <8c43a1ac-ae57-4e90-a791-3f1eb61b6c70@riscstar.com>
Date: Fri, 7 Feb 2025 12:00:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_100028_665494_B94C25ED 
X-CRM114-Status: GOOD (  17.21  )
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

On 2/7/25 6:11 AM, Yixun Lan wrote:
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
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
> when using make defconfig, thus fail to initilize uart driver which requst
> pins during probe stage.

Thanks Yixun.

Tested-by: Alex Elder <elder@riscstar.com>

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
> index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..aa3dea535def87ed75d86bc555b2b90643adbdea 100644
> --- a/drivers/pinctrl/spacemit/Kconfig
> +++ b/drivers/pinctrl/spacemit/Kconfig
> @@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
>   	tristate "SpacemiT K1 SoC Pinctrl driver"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>   	depends on OF
> +	default ARCH_SPACEMIT
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
