Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543D5C7619A
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Apr 2023 12:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvVBPak5Xpz+Oas92xh0A55QLKnlzXXHSJEElfIJUkY=; b=dP/70OfSF5WB8v
	yJW+n5zNN8SoP5sOLKFJBpBoPws1b51iW4F8N/4ddedzdgVX+YwY2iIVaLrSI5v6exq20e/uP+bHq
	6UrCmmaTjcOj1vGa8EFthU7bI1mdk158IUUYSl2NyELFaTH7tRAuIevhySsuYYnZ2GDfj2pUtpjDp
	qvuAVGsYpb4C6DDRopS6hBCAJY7vmsIs6Z8oFvyYzxJLTCycP09xt4VzZlxn6KxkbOrcMGir0Z62k
	s585RC6vmBcQkcHAIVtUCmUY4Y7u0Hv6qk5Q6ZjFRVSt8I/S6IAIRH3tCVNyy73tnnCxiKeSAugjF
	7l9H6nsNDisXojvQ57tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pl7Qb-00CGh6-0F;
	Sat, 08 Apr 2023 12:12:21 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pl7QX-00CGgL-08;
	Sat, 08 Apr 2023 12:12:18 +0000
Received: by mail-ej1-x634.google.com with SMTP id ud9so2226551ejc.7;
        Sat, 08 Apr 2023 05:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680955934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsp6bAaqdkC+3l7L0QU9gWWFuWF86YUu16J9MyhyV3E=;
        b=Vzms7iQnafiqUkeMs1GMmPsw583bn+6RhHpsqKO6zfkfU10NzcwiOfy+EMZesNx5vb
         W+YGKbjYybKIxFFaYXDNotsBdrMm6NKOWtzAu6Yvjv3USDondpL9Ns2QsTGtrVTgd0Wg
         stS2FNX2Z3XSzrNDITuRIme9HfeIEahuuNLWvC06exD1Qjg1lv9/wjHLnb+arT4M2mtH
         g8w9lhCldDRNFrIV5VY1w98FYZKIwEDJqt0SUy2epVSqNrUkcsKdQfGAsgRMuDcVrFBi
         dhkdgQDTnRXFVF3EEBUsF5hphK0cX6AdpsOQoyHLUCyAiZ4sEQgNlvshf4rmgrD1cXEI
         ReZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680955934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsp6bAaqdkC+3l7L0QU9gWWFuWF86YUu16J9MyhyV3E=;
        b=BSw5xn1sWWAyXU7QUv2g7d0is5fLzTm+VYud7rsVFOLLAAWqG++YuQOWu3yNCvirjD
         pAlGTLjAoBkR4fDXgyRH8za8TDxkS4xC1MF+modExffFMnYRnUtqYMsyJkXbIE37s7EC
         8OdhV9cvz2YnWzIAptBzD1kRBAqeLThNoBYELQgtYKltU5qmH1bj4CqGMdpmZBt86+1W
         XsYq93lWyz3sM/IXZIwcmfOZ8iXPZNpcZPRR31OIpRL1Tiie0pyfS4YKJobjAzvNtUF3
         ErPrUykI0HsxodjNJvMZwsNZFZrTRXEBJ5vR9BtoFGvFTEpOvZp51B2JJCMN9mLbWIOP
         d2Fw==
X-Gm-Message-State: AAQBX9fhrK3sv4jU+X13wSh44F7zVuxT+mdzyHG2uj5OlskHhr7J1dQl
	NvZLW9PoZALc7jDCI1Rl/bs=
X-Google-Smtp-Source: AKy350ZoljWQmJaFYZYXyiATILTnWWThGxROLCrvBR/uFCN9linJDLlNU8p8TFP9b2zvbHhV1DPxfg==
X-Received: by 2002:a17:907:e91:b0:920:254c:1e2d with SMTP id ho17-20020a1709070e9100b00920254c1e2dmr2670313ejc.39.1680955934385;
        Sat, 08 Apr 2023 05:12:14 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id m2-20020a1709062ac200b008b176df2899sm3072135eje.160.2023.04.08.05.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 05:12:13 -0700 (PDT)
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
Subject:  Re: [PATCH v2 02/10] ARM: dts: sun6i: a31: Switch dma-names order for
 snps,dw-apb-uart nodes
Date: Sat, 08 Apr 2023 14:12:12 +0200
Message-ID: <7505967.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <20230321215624.78383-3-cristian.ciocaltea@collabora.com>
References:  <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
 <20230321215624.78383-3-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230408_051217_122648_A8D3AD71 
X-CRM114-Status: GOOD (  19.02  )
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

Dne torek, 21. marec 2023 ob 22:56:16 CEST je Cristian Ciocaltea napisal(a):
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
>  arch/arm/boot/dts/sun6i-a31.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi
> b/arch/arm/boot/dts/sun6i-a31.dtsi index 6cdadba6a3ac..5cce4918f84c 100644
> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> @@ -822,7 +822,7 @@ uart0: serial@1c28000 {
>  			clocks = <&ccu CLK_APB2_UART0>;
>  			resets = <&ccu RST_APB2_UART0>;
>  			dmas = <&dma 6>, <&dma 6>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -835,7 +835,7 @@ uart1: serial@1c28400 {
>  			clocks = <&ccu CLK_APB2_UART1>;
>  			resets = <&ccu RST_APB2_UART1>;
>  			dmas = <&dma 7>, <&dma 7>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -848,7 +848,7 @@ uart2: serial@1c28800 {
>  			clocks = <&ccu CLK_APB2_UART2>;
>  			resets = <&ccu RST_APB2_UART2>;
>  			dmas = <&dma 8>, <&dma 8>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -861,7 +861,7 @@ uart3: serial@1c28c00 {
>  			clocks = <&ccu CLK_APB2_UART3>;
>  			resets = <&ccu RST_APB2_UART3>;
>  			dmas = <&dma 9>, <&dma 9>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -874,7 +874,7 @@ uart4: serial@1c29000 {
>  			clocks = <&ccu CLK_APB2_UART4>;
>  			resets = <&ccu RST_APB2_UART4>;
>  			dmas = <&dma 10>, <&dma 10>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -887,7 +887,7 @@ uart5: serial@1c29400 {
>  			clocks = <&ccu CLK_APB2_UART5>;
>  			resets = <&ccu RST_APB2_UART5>;
>  			dmas = <&dma 22>, <&dma 22>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
