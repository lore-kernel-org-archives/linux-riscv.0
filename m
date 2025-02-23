Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2470AC021B2
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Feb 2025 12:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIF+saetIXCbgzMzZMcBAJf3usjmhlGDfaZbQHKO6CI=; b=wEFFnNiGGu7LQM
	BUxu4ZXmsbGQlRRJAnuKgO9eulJmO8/vcToLxFzPJHKSP58lUbNHUznSt5cJTPz0Dt1nxfxXV1HOw
	7cNKo6MBtJZ71LiUcJEiciBmnEbQCoGiZiRX9SjdtbmeMjvjnAMdCVVrnVWbTaKocUHmzjGW9UHHS
	P8ARxI0541Iua8gOnqiEimJiqThZL6d520BA5irtw1XX71U6f18l0apAHGiC7MlSxBhj5jPLhckkV
	IW5RYFCeTcOoxNoTWbhLOx8wvq50rQ2vyDXLnIqIhXvpJISnej9xe6lF+o/AYmAUHx0iEq6llowTW
	Ls1XOEQYEFnAl14ALRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAkx-0000000B3TA-3qpz;
	Sun, 23 Feb 2025 12:06:47 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAkv-0000000B3Sh-1RCR
	for linux-riscv@lists.infradead.org;
	Sun, 23 Feb 2025 12:06:46 +0000
Received: from localhost (unknown [180.172.118.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 987443431E1;
	Sun, 23 Feb 2025 12:06:43 +0000 (UTC)
Date: Sun, 23 Feb 2025 12:06:38 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
Message-ID: <20250223120638-GYA39613@gentoo>
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_040645_413773_F107F551 
X-CRM114-Status: GOOD (  25.21  )
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

Hi Linus Walleij:

On 08:31 Tue 18 Feb     , Yixun Lan wrote:
> Pinctrl is an essential driver for SpacemiT's SoC,
> The uart driver requires it, same as sd card driver,
> so let's enable it by default for this SoC.
> 
> The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> 'make defconfig' to select kernel configuration options.
> This result in a broken uart driver where fail at probe()
> stage due to no pins found.
> 

Can you take this patch via pinctrl fixes tree? if possible in this cycle

> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Reported-by: Alex Elder <elder@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
> when using make defconfig, thus fail to initilize uart driver which requst
> pins during probe stage.
> ---
> Changes in v3:
> - switch PINCTRL_SPACEMIT_K1 from tristate to bool
> - Link to v2: https://lore.kernel.org/r/20250212-k1-pinctrl-option-v2-1-bde7da0bc0d9@gentoo.org
> 
> Changes in v2:
> - set default as y
> - Link to v1: https://lore.kernel.org/r/20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org
> ---
>  arch/riscv/Kconfig.socs               | 1 +
>  drivers/pinctrl/spacemit/Kconfig      | 3 ++-
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 1916cf7ba450ec9958265de2ca41dc504d4d2f7c..17606940bb5239d0fdfc6b5aefb50eeb982d14aa 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -26,6 +26,7 @@ config ARCH_SOPHGO
>  
>  config ARCH_SPACEMIT
>  	bool "SpacemiT SoCs"
> +	select PINCTRL
>  	help
>  	  This enables support for SpacemiT SoC platform hardware.
>  
> diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
> index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..a2f98b3f8a75580d2d157008997cc48f42a89368 100644
> --- a/drivers/pinctrl/spacemit/Kconfig
> +++ b/drivers/pinctrl/spacemit/Kconfig
> @@ -4,9 +4,10 @@
>  #
>  
>  config PINCTRL_SPACEMIT_K1
> -	tristate "SpacemiT K1 SoC Pinctrl driver"
> +	bool "SpacemiT K1 SoC Pinctrl driver"
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
>  	depends on OF
> +	default y
>  	select GENERIC_PINCTRL_GROUPS
>  	select GENERIC_PINMUX_FUNCTIONS
>  	select GENERIC_PINCONF
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index a32579d736130c80bd12f0f9d8b3b2f69c428b3d..59fd555ff38d4453f446263a8fdb4a61faf63cfc 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> @@ -1044,7 +1044,7 @@ static struct platform_driver k1_pinctrl_driver = {
>  		.of_match_table		= k1_pinctrl_ids,
>  	},
>  };
> -module_platform_driver(k1_pinctrl_driver);
> +builtin_platform_driver(k1_pinctrl_driver);
>  
>  MODULE_AUTHOR("Yixun Lan <dlan@gentoo.org>");
>  MODULE_DESCRIPTION("Pinctrl driver for the SpacemiT K1 SoC");
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250207-k1-pinctrl-option-de5bdfd6b42e
> 
> Best regards,
> -- 
> Yixun Lan
> 
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
