Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC709C77B61
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Apr 2023 12:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2gOjqCeK6HDjx/WY0wcPbgwgjaFvE9gT3LThLu0l3g=; b=mcemC1DCFdQK49
	W6FwbU93LcdOIlQrYTALdUthoZCeFue+O1FP43nlCkzORuGhCInX1dGrvhabjh0/wtr3pbvLRz39W
	CyGUMJ3CKUaOR+GX8pmdNowlQ1RlQLqa0pnbvYXY8UgLvCXwCxOMMJSca6eiJNfeuTsUMcx/YmQRd
	HTknsWZeDLH5rzZABJ7Xti/QSqjdJM1ETgiaajlN678KEk9mNni4x+gWy/XnZTqMRFUkiSGGavXJo
	ZGnTGGFv4wkWwRop5VD/+Rr/9WhhSVqOdW92lutXAX0Bjiny4Jg0SxIPtboNAb1DUOOt0X6idm4ZK
	YN29MlVEBdzHxZhR+WGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pl7Rb-00CGzg-10;
	Sat, 08 Apr 2023 12:13:23 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pl7RX-00CGwt-14;
	Sat, 08 Apr 2023 12:13:20 +0000
Received: by mail-ej1-x636.google.com with SMTP id gb34so2597049ejc.12;
        Sat, 08 Apr 2023 05:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680955997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJmx+f31axUvoi/dHkgurPuWKlYeJjKe0B/02y5c1hI=;
        b=a+IjEn62kIWwcZ1L/0L2xqhD74h6hRmUfo3qpuksXoLGNeOb3o0LNm5Rkuhy1ceoZj
         G2FqB3KjrcvLilfhlREqtlyPFpLTyIcWqGv3DbCi7nMiZzC0yAyQvD4eFDsMp2pGJCDd
         Iw3QZkste1SEC1xUqFgC+mySd6T8WPFhNtNzcqOKWigvWcWPFju0Rs+rnn1Ij3oP70v+
         UC5hlnB3eI+HSAYZYtkG2LFxQnrUbMox7Q4THkgLdbqrIVYTgbW7nzskqqQA0HQH7OOr
         fXmaenBIXmo4jZke7XPI9VH2iY63pKwDMnufg4g8yUbERhcUXDNbmnbzI8IApZ0NxGw6
         LYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680955997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJmx+f31axUvoi/dHkgurPuWKlYeJjKe0B/02y5c1hI=;
        b=imcNUBREJMdTWTtKz88CP/v8uOQMuULyxtr1rjGz2nOhPpxD4t7cryI0xCGmQ8820Y
         3+2RljAh2yFfIETRCKBh2EqWKoMF19o4D8UAAVkAC8ehi41LQZXfCNExo9Oe8gT/pBCI
         Z5pvyN1DxHJYZqjhO6MoST+LVkV74XIdi+M+Dh7YCyIiv7dXoxVzeUvwtLvRXNHwqX9m
         xWTh1dCll1HMQ8TFk9iGqGAVyyKMaVOpBdvYGdH30tYSOM7znVBzhS9ZHBocBHQmZe0n
         NUTkg1D1mH46Jw27OVsq0u3E9Mm4cRZpXjgMQ/sbrjADO2GjsIPlDGFSkuqbTyrxYxEM
         62/Q==
X-Gm-Message-State: AAQBX9eoJd4nV2Xquv9I6u819kdi1zdes+zC11LKQyWdo1gzzV6oL0Ug
	Sl161+UdFTV6HuV+cPFTd7Y=
X-Google-Smtp-Source: AKy350b94j/ZxQUi+lYQF+Fq1CVL4fCn0M+Vx7zcnJOgNusGmaSl0GNLXQqXyciV5Dpd1F/TZOyYoA==
X-Received: by 2002:a17:907:6d90:b0:8aa:c090:a9ef with SMTP id sb16-20020a1709076d9000b008aac090a9efmr2550022ejc.55.1680955996826;
        Sat, 08 Apr 2023 05:13:16 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090617c100b00930b13f6abdsm3108700eje.98.2023.04.08.05.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 05:13:16 -0700 (PDT)
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
Subject:  Re: [PATCH v2 05/10] ARM: dts: sunxi: h3/h5: Switch dma-names order for
 snps,dw-apb-uart nodes
Date: Sat, 08 Apr 2023 14:13:14 +0200
Message-ID: <1754521.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <20230321215624.78383-6-cristian.ciocaltea@collabora.com>
References:  <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
 <20230321215624.78383-6-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230408_051319_376969_5B4D05F8 
X-CRM114-Status: GOOD (  18.44  )
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

Dne torek, 21. marec 2023 ob 22:56:19 CEST je Cristian Ciocaltea napisal(a):
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> b/arch/arm/boot/dts/sunxi-h3-h5.dtsi index 686193bd6bd9..ade1cd50e445
> 100644
> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> @@ -710,7 +710,7 @@ uart0: serial@1c28000 {
>  			clocks = <&ccu CLK_BUS_UART0>;
>  			resets = <&ccu RST_BUS_UART0>;
>  			dmas = <&dma 6>, <&dma 6>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -723,7 +723,7 @@ uart1: serial@1c28400 {
>  			clocks = <&ccu CLK_BUS_UART1>;
>  			resets = <&ccu RST_BUS_UART1>;
>  			dmas = <&dma 7>, <&dma 7>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -736,7 +736,7 @@ uart2: serial@1c28800 {
>  			clocks = <&ccu CLK_BUS_UART2>;
>  			resets = <&ccu RST_BUS_UART2>;
>  			dmas = <&dma 8>, <&dma 8>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -749,7 +749,7 @@ uart3: serial@1c28c00 {
>  			clocks = <&ccu CLK_BUS_UART3>;
>  			resets = <&ccu RST_BUS_UART3>;
>  			dmas = <&dma 9>, <&dma 9>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
