Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99167C77B6C
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Apr 2023 12:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/fDs5hcQJJO74ai6mDm/JYefXO6g+oHmrx5abME7xI=; b=Sq5iO9N2mIVPSx
	iZT/KMnXAj9aNJUVqWlCIbR3y40ogtzJAiagE0GrQ9FI/2k2+v+2nfuUftzxRmkRYppDIre/REib4
	baT8XLL2DP8Gtgw+kICzMl18+wR6zAWcFynKxuExP+C1loFNMPumNrrSbFbnxGbfMfAyj4SY0HEmL
	12bVlzRSZQWmTWPDYsiKfv/l07+SNJVM/Mw/ge/2sZ7sHdwch2Ax3PX06PG8s3Bu70esLoOO3rtDK
	jtOkKFz5xyfHkc85oHOzcVXVXtOLuHZjSuEIA7YMokqgVoZmDLlqhINOjt+/7wEVqcx3fj2e71e/v
	Z37pR+84VVhM57UMAi+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pl7RJ-00CGrk-29;
	Sat, 08 Apr 2023 12:13:05 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pl7RF-00CGpT-1V;
	Sat, 08 Apr 2023 12:13:02 +0000
Received: by mail-ej1-x629.google.com with SMTP id qb20so1995433ejc.6;
        Sat, 08 Apr 2023 05:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680955979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fh1w6MZVvyVEsvytmtNdPF4PmTaTKXUM9E0VL+nzXOQ=;
        b=JU4P2piMvKh/GIkpuzP/xIQOOpn2ZnltJSPsX6ToqWYejNfSEHUMEQKkk2vxWQGqxu
         tkgCRmUgCOeXfcH4BM5JwHRqumBt3d0pmiOf2KtqOMYDBR9yE2jaAPWaetwNmD99cx22
         EX0jtsIAWeRKOnyFG4RMK7FsKSAq93I3V3U6vOrMoB/RDutlkjHOn6c4pL6tsUON8Nbj
         ier5+/rfjnH6s0UR7/G3T8RDb+Zrp0Ok1/bPgFik9dBl/OPTg8KVfrj1DXP4oE6TJrrH
         IzlKLM0oix3dFcesvzN8ljeA/JYXYEluRi9cIfdVcvZJN2yz7HpQiUu7wqtTQDozctY7
         soDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680955979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fh1w6MZVvyVEsvytmtNdPF4PmTaTKXUM9E0VL+nzXOQ=;
        b=Q0RYc8YEN3BG8llT21qUvUtasYmt1Q5UGZrY+DCQ8nuaOrdVNTfMW9LjJv8ARUXnsg
         2djkuqwXZmKzvzGrBopQpsWDtttzjMf/BjIddTKcDGrEjak/psSntVTVGJm6t04cOgYK
         /dFKi0GtrtKzZXgV8McvH+r12+aVPOYDhaEJfvB1aAlFPn0eZSXlK+5pJUAK7Lz4rtF7
         bW8qk7KbLweO0Qaal1y32ma86hKO5gVXU74nyv0MK9uyb0k1T2yumqKmkVYiK/vkONlF
         IeDEZ2t25qMlI6FwNLulXTTLev9Q6x9uYeJ4cCDjquzVY1Ele5aT4J+pJ0iGdMXb9Zo6
         nKIQ==
X-Gm-Message-State: AAQBX9cID1YbQMam1vB62J2WbUN3gaXpkVNIYcZcxr3904ClG1RHWURb
	o5QkjnqmSv2w9KwzKpwGLtk=
X-Google-Smtp-Source: AKy350aE3T02AUVNWDyuHg0EPy6lYfeZjBOoMhh6F5J6LzBKmjJy7eJPSVbbRfKO/iq7X1XGLm39Tg==
X-Received: by 2002:a17:906:9484:b0:884:3174:119d with SMTP id t4-20020a170906948400b008843174119dmr2429409ejx.14.1680955979016;
        Sat, 08 Apr 2023 05:12:59 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id qk6-20020a1709077f8600b00948fd62a53asm3078363ejc.71.2023.04.08.05.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 05:12:58 -0700 (PDT)
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
Subject:  Re: [PATCH v2 04/10] ARM: dts: sun8i: v3s: Switch dma-names order for
 snps,dw-apb-uart nodes
Date: Sat, 08 Apr 2023 14:12:57 +0200
Message-ID: <3155463.5fSG56mABF@jernej-laptop>
In-Reply-To: <20230321215624.78383-5-cristian.ciocaltea@collabora.com>
References:  <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
 <20230321215624.78383-5-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230408_051301_507638_874C4A11 
X-CRM114-Status: GOOD (  19.05  )
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

Dne torek, 21. marec 2023 ob 22:56:18 CEST je Cristian Ciocaltea napisal(a):
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

>  arch/arm/boot/dts/sun8i-v3s.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi
> b/arch/arm/boot/dts/sun8i-v3s.dtsi index db194c606fdc..b001251644f7 100644
> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> @@ -479,7 +479,7 @@ uart0: serial@1c28000 {
>  			reg-io-width = <4>;
>  			clocks = <&ccu CLK_BUS_UART0>;
>  			dmas = <&dma 6>, <&dma 6>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			resets = <&ccu RST_BUS_UART0>;
>  			status = "disabled";
>  		};
> @@ -492,7 +492,7 @@ uart1: serial@1c28400 {
>  			reg-io-width = <4>;
>  			clocks = <&ccu CLK_BUS_UART1>;
>  			dmas = <&dma 7>, <&dma 7>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			resets = <&ccu RST_BUS_UART1>;
>  			status = "disabled";
>  		};
> @@ -505,7 +505,7 @@ uart2: serial@1c28800 {
>  			reg-io-width = <4>;
>  			clocks = <&ccu CLK_BUS_UART2>;
>  			dmas = <&dma 8>, <&dma 8>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			resets = <&ccu RST_BUS_UART2>;
>  			pinctrl-0 = <&uart2_pins>;
>  			pinctrl-names = "default";





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
