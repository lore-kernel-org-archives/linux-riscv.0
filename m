Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4A8C3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 09:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZrZ7ENerWfe8vT4jkqLSCiXzaPOAl0Ho/aPyxd2aKs=; b=l2ROLcsJpc6pM4
	LB0MOmbgl1HdhR+4DvFM5E0Aa2VawUNv3EHUWJy/syMCjAFdyH4rCAcGsz8O1q5BPnHeq3h916b32
	qoqLIIiRF55njd2pGl+eA1QBezYO1EcVdqVj+kxA6EQHFM9TWQKsDBLH0goQNuiFPMNMLpKJ/wYpW
	Sgzy/Y3SwZ21vsUMB36dz2r5rf/YFZ4YoEVgoq7XtXoPfLT8C/zDh3w0EqkqT+3WiCwCr6/1Zd4Eu
	IN//ALAdOReekrSq4pHa4UuJ2X6s8PngaC58m1gt8VrsZtwHtfuCi0+K/7JeTEkuArPc6BD7R9iGr
	bpqXgbKP1Ufaf2FzpIFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDiz7-0070pd-Oe; Fri, 06 Jan 2023 09:25:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDivD-006y3b-8f
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 09:21:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id o15so642268wmr.4
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 01:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mIBwhXreyLm6L8pvnZwtbHNyGe5mj7GJLNgz4Wh6wQo=;
        b=rUSG4pEdZZLrEOMBnA8mTNPsn7JjkeFfcu9LagQ3wJ78obWtdOCbs/o/WuvChx67fD
         sQ4d/0Zy6qJ2bURTTu8YevguKYQF5FP2zjCxS8F0R2yFHERndGlPVLsrlesE/C4ZRF/2
         9zRpxtpep8sAJoSY5GLI0SDsZZVfNFH5TVsOmcON+O818kZGUzhJAKtLIl8cyb7V+aLl
         aE4VvJ7F/nbN0sr98J6iCdePjgv/lO1Z0lAipJeP0e3aeA9XgM2bY2Wdugybk53+1vSt
         9MvqNLM8Mgt117lsXOwrN/loBt0vm4XdjnIRIaTtxevLdzkdxR2kFtoXi6eNlyyQZe9F
         SPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mIBwhXreyLm6L8pvnZwtbHNyGe5mj7GJLNgz4Wh6wQo=;
        b=w1LZ70qBBqBaZCBIT43Nzy1vq2b1ioe7LxlBBFs+Eb3XlSP8LdPmXNr1jTQELRMVzt
         U6SEIgY23QxTaMVfiH+PJwS3sdQii+UCkbEmoSn4tCIbln4Ou/bq//hnp1Plc7aFG80M
         drf3MceJbYJl2Cwm/fg0Cs/zC0+tcXD1ibjpY0GDYZmJEcHeIvRZ2vagVJ6a6T9P9Fcg
         yhHvlCBk+byPu2mtW+l+q92FV0vGQbcnUfkfNm6DqJDt7O6ksIs9Cq8EYcghGRvKqKFE
         L0tEoe7M2QFteFkQfg9KYQfs8wtEvSwMyt4JF51lihL6I9MWNgItVAhQ+oN2fv0yJZHo
         pffg==
X-Gm-Message-State: AFqh2krRz7+B4SeH7CCF2iGqhFZoPBW081g1k5N+WBk6lzG4VP4y/huV
	fNRyLfVJYQQl/dvV5pyNPWqR/Q==
X-Google-Smtp-Source: AMrXdXt1czt6+jNPwMhku9nPQSZYF/LqrQNaJuRT/gQVAVTaHXddn9UrPgdw+EhBKkv5Muaf+tmGYQ==
X-Received: by 2002:a7b:cb89:0:b0:3d2:2101:1f54 with SMTP id m9-20020a7bcb89000000b003d221011f54mr38609714wmi.4.1672996911573;
        Fri, 06 Jan 2023 01:21:51 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id az20-20020a05600c601400b003d96bdddd3dsm1047604wmb.15.2023.01.06.01.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 01:21:51 -0800 (PST)
Message-ID: <93915db1-9089-9c58-62f3-6a424c57bfa5@linaro.org>
Date: Fri, 6 Jan 2023 10:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 4/4] ARM: dts: sunxi: add MangoPi MQ-R board
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230106010155.26868-1-andre.przywara@arm.com>
 <20230106010155.26868-5-andre.przywara@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106010155.26868-5-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_012155_436584_FE7C24B1 
X-CRM114-Status: GOOD (  17.73  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Fabien Poussin <fabien.poussin@gmail.com>, linux-kernel@vger.kernel.org, soc@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?QW5kcsOhcyBTemVtesO2?= <szemzo.andras@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 06/01/2023 02:01, Andre Przywara wrote:
> The MangoPi MQ-R is a small SBC with the Allwinner T113-s3 SoC.
> The SoC features two Arm Cortex-A7 cores and 128 MB of co-packaged DDR3
> DRAM. The board adds mostly connectors and the required regulators, plus
> a Realtek RTL8189FTV WiFi chip.
> Power comes in via a USB-C connector wired as a peripheral, and there is
> a second USB-C connector usable as a host port.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../arm/boot/dts/sun8i-t113s-mangopi-mq-r.dts | 160 ++++++++++++++++++
>  2 files changed, 161 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index d08a3c450ce72..39fd893682924 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1390,6 +1390,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-s3-elimo-initium.dtb \
>  	sun8i-s3-lichee-zero-plus.dtb \
>  	sun8i-s3-pinecube.dtb \
> +	sun8i-t113s-mangopi-mq-r.dtb \
>  	sun8i-t3-cqa3t-bv3.dtb \
>  	sun8i-v3-sl631-imx179.dtb \
>  	sun8i-v3s-licheepi-zero.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r.dts b/arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r.dts
> new file mode 100644
> index 0000000000000..ed4d5217d7b0d
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r.dts
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2022 Arm Ltd.
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/dts-v1/;
> +
> +#include "sun8i-t113s.dtsi"
> +
> +/ {
> +	model = "MangoPi MQ-R";
> +	compatible = "widora,mangopi-mq-r", "allwinner,sun8i-t113s";
> +
> +	aliases {
> +		ethernet0 = &rtl8189ftv;
> +		serial3 = &uart3;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial3:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&pio 3 22 GPIO_ACTIVE_LOW>; /* PD22 */
> +		};
> +	};
> +
> +	/* board wide 5V supply directly from the USB-C socket */
> +	reg_vcc5v: vcc5v {

Generic node names, so matching style of other - with regulator prefix.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc-5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	/* SY8008 DC/DC regulator on the board */
> +	reg_3v3: regulator-3v3 {


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
