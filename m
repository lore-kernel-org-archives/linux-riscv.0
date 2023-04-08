Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDADCC77B6C
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Apr 2023 12:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gq1DN3RhVL+xSbANhO+wZUC/aJwQ8pIFIGni7u4fwXw=; b=tkQY4PZvQ198dY
	w7bRAlV74m2HIh1wiSmEhOOMqrPgfJsIfaIzqEmNXvtbNBts6pKZ5heTUDUj1MtpgGavGn0n+qiqj
	lfqenUyC2czeOz0U3M3xk19J/rAxaTTHPfYlLsFRTohIYgVjXVv7tP9z1Mfz429w0ZojkJah1Hpmw
	eREu//eTJs9hMeXJX87EgnkjhzWW7g4WnIejC09XGZjFLiPnUgZGVblh6NkCxA31ewIMOcYl7bc75
	rGPQX+uMewPOMem9fxElSwmEKv7BbtWoVepRY14uJwQYKGUrIoi7HFhwFQ0xWeakBYcvFTL1zQUs3
	ps4PrCbnt6S7l9YeQ5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pl7R1-00CGlG-1n;
	Sat, 08 Apr 2023 12:12:47 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pl7Qw-00CGjl-2q;
	Sat, 08 Apr 2023 12:12:44 +0000
Received: by mail-ej1-x630.google.com with SMTP id qa44so2128159ejc.4;
        Sat, 08 Apr 2023 05:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680955961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEjyigADndOdizLeD+7XPzcSBZVRCHIxciRjEv6kJxg=;
        b=dXHNue3tfQS7WytEgGHmZW8HJVXaXr6PVc3hV7N4G2roojWs2Ke8ZuvMD/67J/K1ML
         uaQzEWaSid873PrggNGX2FavoHdL3gTdvvK53X5uu3y+m7LI5HApCIgkSsiPiSwMfrra
         1gK7OX0I44vpnwiuj8La02MBIAc7nLBhWrwlldRxzUiZ3+S+9wmsXwoG8IYSpWnmufQq
         huu1TMjvTfi3cgC2apzUJDX0ONbAPH+XUqHbR2GxDy8k0n9zi/RLk/GD4mlY0vdz1SGG
         7kZv5SYLJXx86MenvfFTwWs99lKqiPmSPab0Xv/X64SddUKViG12OolSE8u7WgyXzZVm
         1MOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680955961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEjyigADndOdizLeD+7XPzcSBZVRCHIxciRjEv6kJxg=;
        b=KWv6noN5hGtO3OljNCT47Uw4Ww/lhOPJtjmGiKX6PWc1WCQE6o3TvZbLpzeWmaH9tB
         EXigdmBR+fQX20TCUE03cOdUcVJGS2W3ZWqSLqLQsixFnIdE8JOdYgQNRa81molb2nLQ
         lDw4h7od6Uh6JYQ+C3NFyHTxYyh3PPvOqTer++bPfhSJ3ji/MRqPXvzkUpW2KQhamfxT
         9/FKPIE7GLyVk2urR7luMh0AdueQbY4olBpyJl54YOfkG82edlik/xz+5QewRxlsCpUp
         62b3QDdJ6s4jXZL7XISWvIuNIbEqNKjYYBhtwRvJXuGkMK7A/9S/cMopYWCkGgaZ3gVk
         gllg==
X-Gm-Message-State: AAQBX9c4HGY+9kp3XIHkMKej/fb4kosULPG64kTPtT5ZYZdaaC/vAiN4
	urNpOOG6IlTXHZjzZxbx4lo=
X-Google-Smtp-Source: AKy350ZKm612bONyntbJNhUcSmJqS/wij8yX9R0YK3mv05gal13Hkgd68SwJxMfJJzhR6AYahsrYbg==
X-Received: by 2002:a17:906:71c9:b0:930:123:8cc8 with SMTP id i9-20020a17090671c900b0093001238cc8mr2399797ejk.21.1680955960788;
        Sat, 08 Apr 2023 05:12:40 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id qb19-20020a1709077e9300b00948da767832sm3072503ejc.152.2023.04.08.05.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 05:12:40 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
Subject:  Re: [PATCH v2 03/10] ARM: dts: sun8i: a23/a33: Switch dma-names order for
 snps,dw-apb-uart nodes
Date: Sat, 08 Apr 2023 14:12:38 +0200
Message-ID: <3489160.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20230321215624.78383-4-cristian.ciocaltea@collabora.com>
References:  <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
 <20230321215624.78383-4-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230408_051242_924372_7D3BD786 
X-CRM114-Status: GOOD (  18.59  )
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

Dne torek, 21. marec 2023 ob 22:56:17 CEST je Cristian Ciocaltea napisal(a):
> Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
> dma-names properties") documented dma-names property to handle Allwinner
> D1 dtbs_check warnings, but relies on the rx->tx ordering, which is the
> reverse of what a bunch of different boards expect.
> 
> The initial proposed solution was to allow a flexible dma-names order in
> the binding, due to potential ABI breakage concerns after fixing the DTS
> files. But luckily the Allwinner boards are not affected, since they are
> using a shared DMA channel for rx and tx.
> 
> Hence, the first step in fixing the inconsistency was to change
> dma-names order in the binding to tx->rx.
> 
> Do the same for the snps,dw-apb-uart nodes in the DTS file.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  arch/arm/boot/dts/sun8i-a23-a33.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> b/arch/arm/boot/dts/sun8i-a23-a33.dtsi index f630ab55bb6a..4aa9d88c9ea3
> 100644
> --- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> @@ -490,7 +490,7 @@ uart0: serial@1c28000 {
>  			clocks = <&ccu CLK_BUS_UART0>;
>  			resets = <&ccu RST_BUS_UART0>;
>  			dmas = <&dma 6>, <&dma 6>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -503,7 +503,7 @@ uart1: serial@1c28400 {
>  			clocks = <&ccu CLK_BUS_UART1>;
>  			resets = <&ccu RST_BUS_UART1>;
>  			dmas = <&dma 7>, <&dma 7>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -516,7 +516,7 @@ uart2: serial@1c28800 {
>  			clocks = <&ccu CLK_BUS_UART2>;
>  			resets = <&ccu RST_BUS_UART2>;
>  			dmas = <&dma 8>, <&dma 8>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -529,7 +529,7 @@ uart3: serial@1c28c00 {
>  			clocks = <&ccu CLK_BUS_UART3>;
>  			resets = <&ccu RST_BUS_UART3>;
>  			dmas = <&dma 9>, <&dma 9>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -542,7 +542,7 @@ uart4: serial@1c29000 {
>  			clocks = <&ccu CLK_BUS_UART4>;
>  			resets = <&ccu RST_BUS_UART4>;
>  			dmas = <&dma 10>, <&dma 10>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
