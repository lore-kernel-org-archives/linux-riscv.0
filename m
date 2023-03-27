Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F87C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 15:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTW5Bd+vJnp5RnnyV/WdmvuIhgwzaSyUZKqOuQdQEDU=; b=MAlhV30/Yw/ZOC
	G2HM/gghg6KmInrnxTpADXDo8jBva4JVkPfmbUiMnczO6uSAHrj8C0FBKDcMyjtLv6ywRiwk233IM
	Nrwnoh0ppkGskc8l6yuz6+n8qSmSppC7A5Ws/+GAgkPUMmZmT8NC3mjewuosBxLhZwN7/jt35bxzC
	/6zvqm0IJ5nApB/EV6NwwmssqdCRf8Uze6+3gKr5V2zequUO9Wg73uDnrEwg/18fTVkG4t/iEZ8zt
	d0JZpdzNz58lqLKlvYCvxCQ34C1VQgCDvkjR5hbUPLvlOTDE8xtiifmRSadxAYVfiIt6SlHY6u3Io
	rh3t3ijc3slHE2UoRA7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgonl-00BWgn-0E;
	Mon, 27 Mar 2023 15:30:29 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgong-00BWf1-2K;
	Mon, 27 Mar 2023 15:30:26 +0000
Received: by mail-ot1-f54.google.com with SMTP id a30-20020a9d3e1e000000b006a13f728172so1568992otd.3;
        Mon, 27 Mar 2023 08:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679931022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyK2fUsSPD/ZhKF2aRPOTaEqWirYfYdqwsIGEX2UYRY=;
        b=apHXdL4+KSC2lD12N6ru5nySc20wlMb5CjlCWVD5DlW2CgbOqrFyF8FZdrnY6EVTmY
         2bZLd1iXZCkoCl3s1fJ1MSkLfvJddoZz/i+M6WhycEqLmufeun17MkuMNVueGql2jEuh
         J4qmt7RboOY73chW+zZE5E1xmEpKgSli0b0RlbeD8SC7kjC+lBmEDVo1/1hEPPrfln0f
         yUwzDWPjocxyLQgA48s/rN7eLLkjN6PDbkNMc65vDk6g9YZ00j0VnP9yKj56CWtleQoP
         x9FdhJBvMhZVJCiu8zs0bRJB6dqmQ7miHyScbR1zBDmFOHlm1AkUt3mzFtySNcXjfBYz
         YnEg==
X-Gm-Message-State: AO0yUKXE4vLsaWfS7J9ZxCAIB32x18G7gWjQEx4OFCd7wWo4Lz8NYdTw
	J5lGet5k+EcXdwxZcKGXag==
X-Google-Smtp-Source: AK7set/gGvswDR9Qi8QEAjTtwuOiAplRhNhucwkwiCcY/K2JNpIB9iD2QrPd5kmkGr8CtufM0mCkUA==
X-Received: by 2002:a9d:6642:0:b0:690:a6b3:a2f6 with SMTP id q2-20020a9d6642000000b00690a6b3a2f6mr6294603otm.0.1679931022551;
        Mon, 27 Mar 2023 08:30:22 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j15-20020a9d7f0f000000b0069fb32837a9sm4748248otq.42.2023.03.27.08.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 08:30:22 -0700 (PDT)
Received: (nullmailer pid 3908955 invoked by uid 1000);
	Mon, 27 Mar 2023 15:30:21 -0000
Date: Mon, 27 Mar 2023 10:30:21 -0500
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-sunxi@lists.linux.dev, Conor Dooley <conor@kernel.org>, linux-rockchip@lists.infradead.org, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, kernel@collabora.com, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 01/10] dt-bindings: serial: snps-dw-apb-uart: Switch
 dma-names order
Message-ID: <167993102075.3908904.11641161105077047331.robh@kernel.org>
References: <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
 <20230321215624.78383-2-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230321215624.78383-2-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_083024_756301_29693784 
X-CRM114-Status: GOOD (  16.16  )
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


On Tue, 21 Mar 2023 23:56:15 +0200, Cristian Ciocaltea wrote:
> Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
> dma-names properties") documented dma-names property to handle Allwinner
> D1 dtbs_check warnings, but relies on the rx->tx ordering, which is the
> reverse of what a different board expects:
> 
>   rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expected
> 
> A quick and incomplete check shows the inconsistency is present in many
> other DTS files:
> 
> $ git grep -A10 snps,dw-apb-uart | grep dma-names | sort -u
> arch/arm64/boot/dts/rockchip/px30.dtsi-         dma-names = "tx", "rx";
> arch/arm64/boot/dts/rockchip/rk3328.dtsi-       dma-names = "tx", "rx";
> arch/arm64/boot/dts/rockchip/rk3588s.dtsi-      dma-names = "tx", "rx";
> arch/arm/boot/dts/rk3066a.dtsi-                 dma-names = "tx", "rx";
> arch/arm/boot/dts/rk3128.dtsi-                  dma-names = "tx", "rx";
> arch/arm/boot/dts/rk3288.dtsi-                  dma-names = "tx", "rx";
> arch/arm/boot/dts/rv1126.dtsi-                  dma-names = "tx", "rx";
> arch/arm/boot/dts/socfpga.dtsi-                 dma-names = "tx", "rx";
> arch/arm/boot/dts/sun6i-a31.dtsi-               dma-names = "rx", "tx";
> arch/arm/boot/dts/sun8i-a23-a33.dtsi-           dma-names = "rx", "tx";
> arch/arm/boot/dts/sun8i-v3s.dtsi-               dma-names = "rx", "tx";
> arch/arm/boot/dts/sunxi-h3-h5.dtsi-             dma-names = "rx", "tx";
> arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi-  dma-names = "rx", "tx";
> 
> The initial proposed solution was to allow a flexible dma-names order in
> the binding, due to potential ABI breakage concerns after fixing the DTS
> files. But luckily the Allwinner boards are not really affected, since
> all of them are using a shared DMA channel for rx and tx:
> 
> $ git grep -A10 snps,dw-apb-uart | grep 'sun.*dmas' | sort -u
> arch/arm/boot/dts/sun6i-a31.dtsi-       dmas = <&dma 10>, <&dma 10>;
> arch/arm/boot/dts/sun6i-a31.dtsi-       dmas = <&dma 22>, <&dma 22>;
> arch/arm/boot/dts/sun6i-a31.dtsi-       dmas = <&dma 6>, <&dma 6>;
> arch/arm/boot/dts/sun6i-a31.dtsi-       dmas = <&dma 7>, <&dma 7>;
> arch/arm/boot/dts/sun6i-a31.dtsi-       dmas = <&dma 8>, <&dma 8>;
> arch/arm/boot/dts/sun6i-a31.dtsi-       dmas = <&dma 9>, <&dma 9>;
> arch/arm/boot/dts/sun8i-a23-a33.dtsi-   dmas = <&dma 10>, <&dma 10>;
> arch/arm/boot/dts/sun8i-a23-a33.dtsi-   dmas = <&dma 6>, <&dma 6>;
> arch/arm/boot/dts/sun8i-a23-a33.dtsi-   dmas = <&dma 7>, <&dma 7>;
> arch/arm/boot/dts/sun8i-a23-a33.dtsi-   dmas = <&dma 8>, <&dma 8>;
> arch/arm/boot/dts/sun8i-a23-a33.dtsi-   dmas = <&dma 9>, <&dma 9>;
> arch/arm/boot/dts/sun8i-v3s.dtsi-       dmas = <&dma 6>, <&dma 6>;
> arch/arm/boot/dts/sun8i-v3s.dtsi-       dmas = <&dma 7>, <&dma 7>;
> arch/arm/boot/dts/sun8i-v3s.dtsi-       dmas = <&dma 8>, <&dma 8>;
> arch/arm/boot/dts/sunxi-h3-h5.dtsi-     dmas = <&dma 6>, <&dma 6>;
> arch/arm/boot/dts/sunxi-h3-h5.dtsi-     dmas = <&dma 7>, <&dma 7>;
> arch/arm/boot/dts/sunxi-h3-h5.dtsi-     dmas = <&dma 8>, <&dma 8>;
> arch/arm/boot/dts/sunxi-h3-h5.dtsi-     dmas = <&dma 9>, <&dma 9>;
> arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi-  dmas = <&dma 14>, <&dma 14>;
> arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi-  dmas = <&dma 15>, <&dma 15>;
> arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi-  dmas = <&dma 16>, <&dma 16>;
> arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi-  dmas = <&dma 17>, <&dma 17>;
> arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi-  dmas = <&dma 18>, <&dma 18>;
> arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi-  dmas = <&dma 19>, <&dma 19>;
> 
> Switch dma-names order to tx->rx as the first step in fixing the
> inconsistency. The remaining DTS fixes will be handled by separate
> patches.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
