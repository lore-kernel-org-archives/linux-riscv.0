Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492D5C05027
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 20:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PpWPX/zBdNeOcrAz9Q1ApBwgZNH33PDBmQW+jd6RrI=; b=BzwHOxusnq4lNS
	FT4/sm3Y/eWTPG2oN97ysrRjcb8BjTS6ncOIZBYdaKix7Tjy7OCbIR4VMmipL0gXT6tTwV6+e19fq
	2klnueIiWEPcoBcN7e1naZ7aF0TSaAU/kbnhzmgF2/+qtux9KXZQgKV8e3v4Ie3QQcwlYDGunWb13
	9faXP7ndyEekg4hQeUYBlvgtBCzAKAk1vgTIYPzJQKVmoR0UkSR+As3KwVBP9t2T5fr6tgvEjSDkC
	g0JUhJsxwCIjXWXhwhPLqT5BlA5xjLNylqS5I4w75v85vcpVIeT/96KeNV86aB2g07sdS7i3w+/A8
	IFSXJzC5xnEEaKMbAq+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcBVn-00BW44-0t;
	Tue, 14 Mar 2023 20:44:47 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcBVj-00BW3D-0x;
	Tue, 14 Mar 2023 20:44:45 +0000
Received: by mail-ed1-x534.google.com with SMTP id y4so37826130edo.2;
        Tue, 14 Mar 2023 13:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678826682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0F87m94ibj5BbWan5aojgmhq+wBUFnl+QKEcaFZCdV0=;
        b=gxf/72SsrSMbLFOqatSqFflVgNt1bbnS4+ok3reZFnlxYwbj3yInQ75d4sHWLgRoWO
         L/FfRqKco5fsXDQjSMbbxxZKu1NVdu5FxKJ/D3FuRkXWQJTc5OdaHJN6lM11LgLONoG2
         wO5RmrthdftggE/vw43pKxRU8IuRtB+sNjHSvjaVWdISM+t9nQdHMJcK7ANDHGFsvQ8t
         GmsVlmCSgLyBmfRbsIxbbNr6hfol60zqqjnzg4SZyZ+8h7So4R7iNuIUi/yJoROGwDh9
         /nM8YXT8NFV1DWNN+q69s6y69XmZJR2127XJ3nsNOJtp43M+CbfGzLcKccU3StkX5q32
         16ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678826682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0F87m94ibj5BbWan5aojgmhq+wBUFnl+QKEcaFZCdV0=;
        b=1yEkS0tHB7w9YmPTfnHqYsvEBYCLy7t/xzYxxwVvitgu6DTYQ14Kh+Zaz4YDM+jOjW
         BqPTNtdPbXx0j5Po46e+ZmyRycqp/BX8RyyLZss0WYkROUMLIJFAE+mpJyu3qYXHcvyp
         XML5Rqgk2bbmVJYRbhTzA7QMC4h0mf1xFO7lVrkXp5pZQSmrgqqvXUv4e/NXp7zgqGl7
         tIPOEBKGUga6GxgYYtuEpz8jOIRT6NIMhUZGsSm/skoKLswcy5TxscgxWn3DwYNgCBMl
         OD1OGICoryIoSSyYGpG7QOoMgT3nNm6vt2stRlzwvUmI7ZDqwqMPk9RoGVrmIaFs97On
         KHXA==
X-Gm-Message-State: AO0yUKWz58IOOahIyRAqjCaus6vxomfTvTUGePCRJu+fr9o79t22Zwnc
	AQRlMOUaXKF6cpj+LWuBpY8=
X-Google-Smtp-Source: AK7set+FjvdA2a7hcaGhydj/SDHPqvn+qyMA9hZ9eH7e5PKlEoMwB4q6/wpeL8xinWadVWDhw9g0lw==
X-Received: by 2002:aa7:cc92:0:b0:4fc:7352:1131 with SMTP id p18-20020aa7cc92000000b004fc73521131mr318382edt.41.1678826681783;
        Tue, 14 Mar 2023 13:44:41 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id hd31-20020a170907969f00b0092d58e24e11sm1081680ejc.137.2023.03.14.13.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 13:44:41 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Trevor Woerner <twoerner@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/2] riscv: dts: nezha-d1: add gpio-line-names
Date: Tue, 14 Mar 2023 21:44:40 +0100
Message-ID: <2337214.NG923GbCHz@jernej-laptop>
In-Reply-To: <20230210025132.36605-2-twoerner@gmail.com>
References:  <20230210025132.36605-1-twoerner@gmail.com>
 <20230210025132.36605-2-twoerner@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_134443_355909_0F70120C 
X-CRM114-Status: GOOD (  24.54  )
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

Dne petek, 10. februar 2023 ob 03:51:32 CET je Trevor Woerner napisal(a):
> Add descriptive names so users can associate specific lines with their
> respective pins on the 40-pin header according to the schematics.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> Link:
> http://dl.linux-sunxi.org/D1/D1_Nezha_development_board_schematic_diagram_2
> 0210224.pdf

Applied, but next time please make sure e-mails are not linked together, as 
Conor said.

Best regards,
Jernej

> ---
> changes since v2:
> - (no changes, skip to a v3 to align with the other patch in this group)
> 
> changes since v1:
> - this patch needs to be placed in order, and come second, after a patch to
>   update the schema for the nxp,pcf8575, put this patch in a group where it
>   wasn't previously
> - use a Link: to point to the schematic
> - add a comment section describing the rational behind the naming that was
>   used
> - make the spacing of each line name uniform, don't try to "line them up"
>   vertically
> ---
>  .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts index
> a0769185be97..4ed33c1e7c9c 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> @@ -1,6 +1,25 @@
>  // SPDX-License-Identifier: (GPL-2.0+ or MIT)
>  // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
> 
> +/*
> + * gpio line names
> + *
> + * The Nezha-D1 has a 40-pin IO header. Some of these pins are routed
> + * directly to pads on the SoC, others come from an 8-bit pcf857x IO
> + * expander. Therefore, these line names are specified in two places:
> + * one set for the pcf857x, and one set for the pio controller.
> + *
> + * Lines which are routed to the 40-pin header are named as follows:
> + *	<pin#> [<pin name>]
> + * where:
> + *	<pin#>		is the actual pin number of the 40-pin 
header
> + *	<pin name>	is the name of the pin by function/gpio#
> + *
> + * For details regarding pin numbers and names see the schematics (under
> + * "IO EXPAND"):
> + *
> http://dl.linux-sunxi.org/D1/D1_Nezha_development_board_schematic_diagram_2
> 0210224.pdf + */
> +
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> 
> @@ -90,6 +109,15 @@ pcf8574a: gpio@38 {
>  		gpio-controller;
>  		#gpio-cells = <2>;
>  		#interrupt-cells = <2>;
> +		gpio-line-names =
> +			"pin13 [gpio8]",
> +			"pin16 [gpio10]",
> +			"pin18 [gpio11]",
> +			"pin26 [gpio17]",
> +			"pin22 [gpio14]",
> +			"pin28 [gpio19]",
> +			"pin37 [gpio23]",
> +			"pin11 [gpio6]";
>  	};
>  };
> 
> @@ -164,3 +192,47 @@ &usbphy {
>  	usb1_vbus-supply = <&reg_vcc>;
>  	status = "okay";
>  };
> +
> +&pio {
> +	gpio-line-names =
> +		/* Port A */
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* Port B */
> +		"pin5 [gpio2/twi2-sck]",
> +		"pin3 [gpio1/twi2-sda]",
> +		"",
> +		"pin38 [gpio24/i2s2-din]",
> +		"pin40 [gpio25/i2s2-dout]",
> +		"pin12 [gpio7/i2s-clk]",
> +		"pin35 [gpio22/i2s2-lrck]",
> +		"",
> +		"pin8 [gpio4/uart0-txd]",
> +		"pin10 [gpio5/uart0-rxd]",
> +		"",
> +		"",
> +		"pin15 [gpio9]",
> +		"", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* Port C */
> +		"",
> +		"pin31 [gpio21]",
> +		"", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		/* Port D */
> +		"", "", "", "", "", "", "", "",
> +		"", "",
> +		"pin24 [gpio16/spi1-ce0]",
> +		"pin23 [gpio15/spi1-clk]",
> +		"pin19 [gpio12/spi1-mosi]",
> +		"pin21 [gpio13/spi1-miso]",
> +		"pin27 [gpio18/spi1-hold]",
> +		"pin29 [gpio20/spi1-wp]",
> +		"", "", "", "", "", "",
> +		"pin7 [gpio3/pwm]";
> +};





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
