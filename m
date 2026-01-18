Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC333C9832F
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 12:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iBd2YpCI1Tfh59WI/yK79qtHnum7bn7fpd+T017nx+c=; b=lLoPkxdmXox1TG
	TA5N1PkHxAXFuii+CSvzofJ8E0HC3TiNAQN6iScK0r5uMpHsjcWu8UX81UxGQM7rRn6n+LiOVmFAx
	GIA2RSe+bWzs9FxoXQdd0B6qhrdbjk3gFVa3YoqdwPX6eFihCnh8OEXuslXzY4WZJ6V6LXm2RdOOS
	3DU9b93FsIM8IF0Ckpbom+3UQ0uGM4jL9qZlMQXXeHBaJukiKsEUOCWJDau58nF4waJvSd9EwQqCI
	hzt+pPdcjJwWaGnYZNkF/W+SKYMyLNMxSAwloix/gOOHl9go5jHQrIwtDpe+UCyuKsikw32sl4L9x
	PXg0uEbKT1NpvmIL5Icg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhS5d-000000000W0-3e28;
	Sun, 18 Jan 2026 12:41:09 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhS5b-000000000Uv-2gVI
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 12:41:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so2586592f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 18 Jan 2026 04:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768740066; x=1769344866; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8WYraWdl/meIzynkx/iFk+ZbBcfbnztLQ6j8m4tIWQ=;
        b=OhRYZ1i0MJlMgMOWeGNZG3E87eWS33LHh+ThbLovAaTF/fOhFmRHkz+c0Vwr5GEX6m
         VXTsKOhE1Y8vehpzGBCw/GpyifCfvW2y5tXt9Kqex5F81tX6jz20MFZZ8Gca8GxblvtA
         n6uS+8/Jom7hP4kIsN6fIZB4ZlYk71UTLhHmmzd5+XCq27XS6n2KEF2/FFRXJcEGbdfY
         Uf/c2UCZUeEkT5X+AmXy/Bf/Ap53Sekf38a0U1MmOTOs+6jGccANJSbSa7iWD3YIyKCX
         gGPqAsapFgManip/ht5yGSOR4yuolGdQVsECu1e8LFthaac62y9P0y/xFVRzPU55u/Xh
         MAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768740066; x=1769344866;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d8WYraWdl/meIzynkx/iFk+ZbBcfbnztLQ6j8m4tIWQ=;
        b=CvvMnGR4VXlXOUUHWuU7xfzInkcfRZu0tEWsL1ffeF4s0hr7+nY8HR908Fd63y4KUu
         OzoB8L6zIo3OoCymO4e9NKOvLHMCBVri90/Y7nVTaocwJEOJMj7XthB/huSMG+dL8BvO
         P73lKlw8iE4/D5gOn43RBHk0vFDBYFp4dBQMkdloCS1/UzxI2tJBV3vBGQrKUlsUbHul
         ItZ6DrVnpX0DHXJzhcsg5Cxpyv9PLVqRCbBZWMXcgdYqnuou3ttb/izAYlJIms26FO1s
         VGKcIluPYExGn1evSUVf6YQOwTV6Fevi8fRwMw3OtaU4LHFOFmmp27IGu5AXZQEqbA1E
         RMmw==
X-Forwarded-Encrypted: i=1; AJvYcCVL/xoXATPMWR/7DeSm8GMRP/Fb+pJ0dZ3H4tIlLSAY2fvjSPVxA8HwOO+FwXRUVDTz07CSR0qi3tbXhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFknujjR4iRJ3D0STBSRfFihwIpYcdXpNMY0n4kmbG5r1HiGNd
	HJ53dAU0gZRQVjFTHcxHQKKcfFhyz2TNGQBaNAwjNq/1HhEwYgpLNs0h
X-Gm-Gg: AY/fxX5kYhrEB4VPZ6jGBavBxtIf2TNEL5DRRBt7pNoPnEDsFRBvUs+FIuTjKMxZhBB
	Eqy139XAf5ifhjdqFlRvkidMmJrHYdKGGDg9mWCWZR6GAgI1+/TRLjqHtZSTPrDoN4ihQNJVoL9
	DSb/9keXiqk19M2/bIEhYd8Dr81SwcUmK8MiG8oXhR0AOhk3c0YA4orUoHIes/Qg/PVjL0xOjbg
	SCTUf5d/C8yfkvsm11Izkh8HS7Q2jM79ltV6by9FiSvN9qHfH5dgmKwi8/U+45NiQzFuj1mKojV
	e56oRVERglCw2d5nhiWir6qqichBfxnloo1OeCg5zaZPjQK9Lx8sOXarY9RQDMDAYhdmcVE2/cM
	KqLHG/7G8LQKt4xc83T4d3AYZXDdtXxsSGb+KUm86VA96/5sMfE+wEkUdlYyHL3vGKfsrDCizBG
	JpzzvLOOpHL3RPOzL9ooDaIclq+rmOvRcmb+A7+h0H37iwRKM2abl6sf2N6V4=
X-Received: by 2002:a05:6000:2003:b0:430:fcf5:495c with SMTP id ffacd0b85a97d-4356996f588mr9620388f8f.4.1768740065405;
        Sun, 18 Jan 2026 04:41:05 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm16712957f8f.9.2026.01.18.04.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:41:03 -0800 (PST)
Date: Sun, 18 Jan 2026 16:40:59 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 7/7] riscv: dts: sophgo: dts nodes for i2s tdm modules
Message-ID: <aWzUaf7t96FhtbNq@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-7-d10055f68368@gmail.com>
 <20260118-deer-of-therapeutic-science-0958d4@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118-deer-of-therapeutic-science-0958d4@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_044107_704469_4FBB4DA3 
X-CRM114-Status: GOOD (  20.53  )
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

On Sun, Jan 18, 2026 at 11:16:48AM +0400, Krzysztof Kozlowski wrote:
> On Sun, Jan 18, 2026 at 12:18:59AM +0400, Anton D. Stavinskii wrote:
> > Introduced I2S nodes and internal dac and adc nodes as well
> > The new header file provided in order to make DMA channel names
> > more readable.
> > 
> > Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv180x-dmamux.h | 57 +++++++++++++++++++++++++++
> >  arch/riscv/boot/dts/sophgo/cv180x.dtsi     | 63 ++++++++++++++++++++++++++++++
> >  2 files changed, 120 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h b/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h
> > new file mode 100644
> > index 000000000000..6314bf6e9dc8
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h
> > @@ -0,0 +1,57 @@
> > +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> > +/*
> > + * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
> > + */
> > +
> > +#ifndef _SOPHGO_CV18XX_DMAMUX
> > +#define _SOPHGO_CV18XX_DMAMUX
> > +
> > +#define DMA_I2S0_RX		0
> > +#define DMA_I2S0_TX		1
> > +#define DMA_I2S1_RX		2
> > +#define DMA_I2S1_TX		3
> > +#define DMA_I2S2_RX		4
> > +#define DMA_I2S2_TX		5
> > +#define DMA_I2S3_RX		6
> > +#define DMA_I2S3_TX		7
> > +#define DMA_UART0_RX	8
> > +#define DMA_UART0_TX	9
> > +#define DMA_UART1_RX	10
> > +#define DMA_UART1_TX	11
> > +#define DMA_UART2_RX	12
> > +#define DMA_UART2_TX	13
> > +#define DMA_UART3_RX	14
> > +#define DMA_UART3_TX	15
> > +#define DMA_SPI0_RX		16
> > +#define DMA_SPI0_TX		17
> > +#define DMA_SPI1_RX		18
> > +#define DMA_SPI1_TX		19
> > +#define DMA_SPI2_RX		20
> > +#define DMA_SPI2_TX		21
> > +#define DMA_SPI3_RX		22
> > +#define DMA_SPI3_TX		23
> > +#define DMA_I2C0_RX		24
> > +#define DMA_I2C0_TX		25
> > +#define DMA_I2C1_RX		26
> > +#define DMA_I2C1_TX		27
> > +#define DMA_I2C2_RX		28
> > +#define DMA_I2C2_TX		29
> > +#define DMA_I2C3_RX		30
> > +#define DMA_I2C3_TX		31
> > +#define DMA_I2C4_RX		32
> > +#define DMA_I2C4_TX		33
> > +#define DMA_TDM0_RX		34
> > +#define DMA_TDM0_TX		35
> > +#define DMA_TDM1_RX		36
> > +#define DMA_AUDSRC		37
> > +#define DMA_SPI_NAND	38
> > +#define DMA_SPI_NOR		39
> > +#define DMA_UART4_RX	40
> > +#define DMA_UART4_TX	41
> > +#define DMA_SPI_NOR1	42
> > +
> > +#define DMA_CPU_A53		0
> > +#define DMA_CPU_C906_0	1
> > +#define DMA_CPU_C906_1	2
> > +
> > +#endif // _SOPHGO_CV18XX_DMAMUX
> > diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > index 06b0ce5a2db7..5a56951f7e4c 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > @@ -8,6 +8,7 @@
> >  #include <dt-bindings/gpio/gpio.h>
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include "cv18xx-reset.h"
> > +#include "cv180x-dmamux.h"
> >  
> >  / {
> >  	#address-cells = <1>;
> > @@ -448,6 +449,68 @@ usb: usb@4340000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		i2s0: i2s@4100000 {
> > +			compatible = "sophgo,cv1800b-i2s";
> > +			reg = <0x04100000 0x1000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> 
> Really, why are you putting cells everywhere?
My bad. It was misunderstanding from my side. Will drop everywhere it needs to be dropped. Thanks for you
patience. 
> 
> > +			clocks = <&clk CLK_APB_I2S0>, <&clk CLK_SDMA_AUD0>;
> > +			clock-names = "i2s", "mclk";
> > +			dmas = <&dmamux DMA_I2S0_RX 1>, <&dmamux DMA_I2S0_TX 1>;
> > +			dma-names = "rx", "tx";
> > +			status = "disabled";
> > +		};
> > +
> > +		i2s1: i2s@4110000 {
> > +			compatible = "sophgo,cv1800b-i2s";
> > +			reg = <0x04110000 0x1000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> 
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
