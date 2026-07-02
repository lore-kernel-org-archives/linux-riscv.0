Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3FDC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 03:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XG59vkrvfi9zNTSzBJ+OnOunN8tUUO4pjHLtUzjqSN4=; b=sDTCyEYE2YFjTN
	OnmVFwE/7EP3OOYGTTyHpA8wRFXDvYcq9SFLrDf8N6Go0tU8or1BGFP5i9BuU4sFKxEUpSNHYA4Cs
	TaaLBY8aA2fBuHuExLXX+BHXQ0q02aiZCsf1bGX6vvLAg+7aZsfk5gREtw/fbmB+ZWqhNE42ssqGR
	FPI4mLDgQpWQ43a+724gyKuqvtY3xKkzYqUHCGFz6G1WRLNj1BqpwNw22hCPwhpJYrApEBCQL2qb5
	8qalvPEit6FTdCIuwIad+okBec8h3gGCZyim3i3YdBefGkfbHK/EXkOlqpG1cudTMxhqER7jUM1Wx
	Od2Sm9M1YG0HoSvy7UmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf8GB-00000003W0S-1Jzx;
	Thu, 02 Jul 2026 03:38:43 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf8G8-00000003W07-3bGX
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 03:38:42 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-37fb434c547so1206222a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 20:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782963519; x=1783568319; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=avurPdrjTdWxBa40lvn4lDnsj5ihohdyVToiWVzOQRs=;
        b=FH1CAcuJIqxoPezNSDpbsJFhrywQXzcQZDWxm2xaD/PqGRqb9ucEGbADvkkZK19yG4
         MYX1MxmKArPP8p5+OJvSzVv1BDw69+NJiUPHjpfMZHu/oQMdyZrPF3sKuvXUxbr+S6aP
         9KW/PkXv1efiTrunUl0VQqbrQyGC2t7Z6PN55eHHoMJPL0xpe+e/s61PeAq7OrxG8Q40
         ZOU8GM+SO1+qjY00pgsUCdZChDteRyfOiXs7zKwKDrm2ToQ9U/ZsBx3TMHBXBVSiU/pe
         Mf+utg4tSoKd0jUSvepanKERFdAnYB9/0ez8C+iuPSvkZoLYhCmqG/4jCyhnZpfGdWSv
         hWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782963519; x=1783568319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avurPdrjTdWxBa40lvn4lDnsj5ihohdyVToiWVzOQRs=;
        b=Q6fRjThVwieSqxwTSHS3Wl1v7RAkO5G+7HNuhHUI99AKM+g6jUs1krElftQ1fKFtYd
         aFE+PWxbPpi9wuk9JQyYygmT2bcvTk+s5I5u92zwqDok1jDHlKzoJaYO9iVo9IErnb6s
         sKbDsU0S0BXcm0fC6cf9gK76Fega7hlliwqqkEfsj6RZuNM2J4t84EjuaCSWZOJ3QoO9
         RKz3Y8vltqZOsl/ZWO957wjLjuUCyZrRtxSU0PbIatEFxLBhbZjktDLmQu3hh1e++2iR
         vHaD65HHAZF5ZJijDr7+aeutJisbO1M772SH4oDWldzT9sLbzZyIYGZV0nHPHKVp6ueo
         o9fA==
X-Forwarded-Encrypted: i=1; AHgh+RrXpc89SZMAa/sMiNHRJST/EGOqiLr3jw6jJfIKz3n54oN8RuGiqIEDp+ej4cS5JWNJvQkkyQYOZ1zT4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YytWPIbt0Ln1h2OaScKCv5jythF1Dkvb/qO1AADQUO5VpzUDR7D
	FnTAhBvZv4e5tJZKETBk5G6/q1Zyk41DObA0hPmCJq0uGX40Ye+09RwI
X-Gm-Gg: AfdE7ckCihITFxhPkRulTLM8ie+rDRpWPD893tCXtUcrzyf4K23JKapqvR1hKemfxAk
	F8OlT2D/ivJakE9ZY1s+fS823ev/+gSCEtfIRFvQam63Y9F+n0K62SkrQjOEdIrTS+z5xCAo8ey
	leE4AQt4LX4w4yq4K4IzzvPMMOPxaVPH9EHLQN43xTo+SdMsAyuy/i1mb8FCW7jcxc+DqS6tmYS
	J0eiOda88WxsVjNNmANngpoLE2Jzof5ulZPng1O3Nl2+tnC2KmbpqrkfmzsxctiaVYsghcyjo8T
	mCVtWlwg3aEFekUiUWBT835Ms+oAbAQap6vCPQVEhfGAgJT2duwiQwlIvwnropBzrQW0ynMKha4
	doLwJQS187BbCvk8/MKfQMrMAfbSBem7VosQdF0H/Oz1JE+D7LyTVA7sXcHb8wVUv
X-Received: by 2002:a17:90b:314d:b0:37f:9ce2:348b with SMTP id 98e67ed59e1d1-380aa207d9amr4283004a91.28.1782963519037;
        Wed, 01 Jul 2026 20:38:39 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e15e7032sm256154a91.7.2026.07.01.20.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 20:38:38 -0700 (PDT)
Date: Thu, 2 Jul 2026 11:38:09 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, unicorn_wang@outlook.com, 
	inochiama@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Han Gao <rabenda.cn@gmail.com>, 
	Nutty Liu <liujingqi@lanxincomputing.com>, Longbin Li <looong.bin@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: Add Milk-V Duo 256M board
 support
Message-ID: <akXbk7l9bZ_W0GLR@inochi.infowork>
References: <20260610121026.1517621-1-chenyou910331@gmail.com>
 <20260610121026.1517621-2-chenyou910331@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260610121026.1517621-2-chenyou910331@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_203840_907398_43B6A39D 
X-CRM114-Status: GOOD (  25.24  )
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

On Wed, Jun 10, 2026 at 08:10:10PM +0800, Chen-Yu Yeh wrote:
> The Milk-V Duo 256M is a small form factor development board based on
> the Sophgo SG2002 SoC.
> 
> This patch adds basic device tree support for the board, including:
> - UART console
> - SD/MMC controller
> - USB host
> - Onboard blue status LED (connected to PWR_GPIO[2] / porte 2)
> 

> Tested on actual Milk-V Duo 256M hardware, verified boot to shell and
> heartbeat LED functionality.
> 

IIRC the led is not controlled by the small core, so the node should
be described in the dts.

I see the Sashiko does provide some good question, please check.

> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
> Changes since v1:
> - Removed the leds node because &porte is not yet supported in cv180x.dtsi,
>   which would cause a dtc compilation error.
> - Retained the &usb node because it is already defined in cv180x.dtsi.
> - Cleaned up the trailing blank line in the Makefile.
> 
>  arch/riscv/boot/dts/sophgo/Makefile           |   3 +-
>  .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 108 ++++++++++++++++++
>  2 files changed, 110 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> 
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 6f65526d4193..f9415c30a2c5 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -2,7 +2,8 @@
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
> -dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
> \ No newline at end of file


Why you change this? Please do not touch unrelated things.

> diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> new file mode 100644
> index 000000000000..4cf441ab3790
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>

I guess a right copyright is needed for your code.

> + */
> +
> +/dts-v1/;
> +
> +#include "sg2002.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Milk-V Duo 256M";
> +	compatible = "milkv,duo256m", "sophgo,sg2002";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		coprocessor_rtos: region@83f40000 {
> +			reg = <0x83f40000 0xc0000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&pinctrl {
> +	uart0_cfg: uart0-cfg {
> +		uart0-pins {
> +			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +				 <PINMUX(PIN_UART0_RX, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +
> +	sdhci0_cfg: sdhci0-cfg {
> +		sdhci0-clk-pins {
> +			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <16100>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cmd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-data-pins {
> +			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
> +				 <PINMUX(PIN_SD0_D1, 0)>,
> +				 <PINMUX(PIN_SD0_D2, 0)>,
> +				 <PINMUX(PIN_SD0_D3, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +};
> +
> +&sdhci0 {
> +	pinctrl-0 = <&sdhci0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +	bus-width = <4>;
> +	no-1-8-v;
> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +};
> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&usb {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
