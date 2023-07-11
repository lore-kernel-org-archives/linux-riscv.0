Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336BDEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 18:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7z3pPvFRDBTbLFEqc/ubEvrdZxgRRLYPiOZG5p8y+Q=; b=ilgdQPLvzt+Kk+
	XSsOTduln7vjUveVDoyl9M0XRiV3vBPMNV7gv6rR+ahunxn6PgrRMVKXeYduxtQUgNtSBE7nn6qWy
	Agz+vyJAGrONRtI8h1pPJJV9TLPot9KqdyysIS77vlBBVNL1YkzIiP8G8IVJOlycSfxMYFFuS5KoO
	Plod4KtGb5LsEF811Axb6R+aHDTFxgquhaXuW3Plo8w+hVeWtAiU7OKVF+wTWchzxek6iPUxLNo77
	VYOS+Z4+pyXKfLCwqKBdKfKT/hXdwULgozxHglXckZd9kcSrRCfSvHTslqLIiM8cRFPKgGNJ6Uk0A
	Mg85lPUjeYuxtgkKM5xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHxg-00Fdp2-0J;
	Tue, 11 Jul 2023 18:19:44 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHxc-00FdnP-0X;
	Tue, 11 Jul 2023 18:19:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3144bf65ce9so6224332f8f.3;
        Tue, 11 Jul 2023 11:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689099576; x=1691691576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YGaaVLLljfwhL7I7pdePBXr9vIdDz36pjGnvHMvilI=;
        b=KHmTo/LYJBFDq+TnlOYbcz8G9El6xZsDW/OK2P08tqLF1t9npn0XrfSGSkiT26OKnQ
         hYDJFvqUYTQo8q1VAnAARl7qnhbBUwNmY8aIvRwK+U5zQTxmpjGjHg7q9a4dPZ5O5yMn
         gs9N72SFz6/mkstnvETHv564XOq569alNflXGlIVw/el5N1Tj2aOKimeNPkZ28rORzcp
         Xv0Q43+iLlcXqaC5nWvxzZbHnB3637AjPIdI9r54HsefCiYtM6TD43gbBofdZaMwKI6g
         lE1vDF/IWeb2dus7FP0RDgIa5BRsUvCOR9c5z1fPTNqByISN4gt5XCBn+DNUM5YszAck
         jvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689099576; x=1691691576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YGaaVLLljfwhL7I7pdePBXr9vIdDz36pjGnvHMvilI=;
        b=Ez/SP3GW+p8Ws/vAuoblNhSydmqFBigU7M4YKCyQiozTrpWKRythOnzLyegV72wHLD
         g1z340R41I+2PRFvlvRYUjDl4tuSLMCb7pHj0vNlyvoHZhAJPcJNXpNihuoSKaVfW32X
         woXw4++8khxdTi4j+MtYK/9ErXoYlx9SLRaaoa7TslhXrYwVI/Oq84DbDsJEMGN6+AoN
         qlPgNoAdJPbU2Eo7KD8NDjZK89cUjVDgVaLOEYM/pBDcepvaBFn4tLBFGIAeGpMx3N8V
         WLDcTIGkP9jcgWEup+pVOaffyowuFmVjkU4fmY7aygAwWGV/0dLN2L2JPXvfeVOWhuDU
         VE1A==
X-Gm-Message-State: ABy/qLZZxWSI5pyS/nBDMIJCDkyZqhBhTEomRoPB6qAEj2Cant0q/C02
	ImdQDKmCc98d87hEoHZv2ZA=
X-Google-Smtp-Source: APBJJlEWOC+0TIySzdwSSr1Jk0NFX4B0/RuaPAFShvurW/BJZQn5yPYcNHjdV2dkkJY3Wv6DIPIxQA==
X-Received: by 2002:a5d:6b4c:0:b0:313:f7bd:f0 with SMTP id x12-20020a5d6b4c000000b00313f7bd00f0mr16484738wrw.49.1689099576238;
        Tue, 11 Jul 2023 11:19:36 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id k2-20020a5d5182000000b003143aa0ca8asm2914790wrv.13.2023.07.11.11.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 11:19:35 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-iio@vger.kernel.org, Maksim Kiselev <bigunclemax@gmail.com>
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ramona Bolboaca <ramona.bolboaca@analog.com>,
 Leonard =?ISO-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>, ChiaEn Wu <chiaen_wu@richtek.com>,
 William Breathitt Gray <william.gray@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Mike Looijmans <mike.looijmans@topic.nl>,
 Maxime Ripard <mripard@kernel.org>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 4/4] riscv: dts: allwinner: d1: Add GPADC node
Date: Tue, 11 Jul 2023 20:19:32 +0200
Message-ID: <3238166.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20230619154252.3951913-5-bigunclemax@gmail.com>
References: <20230619154252.3951913-1-bigunclemax@gmail.com>
 <20230619154252.3951913-5-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_111940_204896_742B25D7 
X-CRM114-Status: GOOD (  13.03  )
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

Dne ponedeljek, 19. junij 2023 ob 17:42:27 CEST je Maksim Kiselev napisal(a):
> This patch adds declaration of the general purpose ADC for D1
> and T113s SoCs.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi index
> 922e8e0e2c09..cb353d5805cb 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -138,6 +138,16 @@ ccu: clock-controller@2001000 {
>  			#reset-cells = <1>;
>  		};
> 
> +		gpadc: adc@2009000 {
> +			compatible = "allwinner,sun20i-d1-gpadc";
> +			reg = <0x2009000 0x400>;
> +			clocks = <&ccu CLK_BUS_GPADC>;
> +			resets = <&ccu RST_BUS_GPADC>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(57) 
IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +			#io-channel-cells = <1>;
> +		};
> +
>  		dmic: dmic@2031000 {
>  			compatible = "allwinner,sun20i-d1-dmic",
>  				     "allwinner,sun50i-h6-dmic";





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
