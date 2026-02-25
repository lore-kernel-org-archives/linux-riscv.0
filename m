Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E250FD45F6
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 22:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SsSuTdWjmJuCEaM1LrrlOl/YdR4sQVBXrmPffNcFWq0=; b=0Tujvfi4XE4qS1
	VwKIr/46fPgtlICOxKfk6lJ1afbRcky15bzlFMQg3Qpqj6PeIWxQ2T2FpvvSgMYheeMbUxDskCw75
	HewyQlRGRW93xqvTHToYaSbI4ReDFf1A/GtoCsUSCz1aqLdkHooxd2ZEX6k1hrrj5DXFgKuZKP5KY
	2TrGggDun92qpmMVkG2NlU1ngyK7yJH9wAtwIEQ/QDh8jeLOpl+1Hkt7Ur0eaYvcMho2F5FWVn2gC
	anSHPIeN5hvYC/2tywlthyC69tEZjn3LeJnqUneH08abalwxbfA5IzzruVuwVzIc6N9ZT5l/wxaA9
	a2tkTV655B+CXKrCU5Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNF9-00000004zCg-37tj;
	Wed, 25 Feb 2026 22:20:31 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNF5-00000004zBG-3omN
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 22:20:30 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82728e5680cso123406b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 14:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772058027; x=1772662827; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F50crxFeK9XeDJJq/qBM5+VtsXIjYPfgaWG7L+GSg6s=;
        b=LtnHZK5ujHpbvNxAUinW3WHt7Ggae6Of3jbhBI9OgE4tJP7pEWLIvU93wdc0r15R1P
         pOTMYoQW7fiY1V/BFkLEOncBQnw+EFqTRQybVw2rAVN+tkQjqZmJqMxEdqJeuTkN9Lay
         hPhle33RXUqGL53PoD6gPCVToQ+EHkY13WKJgOqcI8Yw2mptCxBFtstPMNmJkjuZnmFY
         tT8eCt12D7lM8zsGDUmT6Z8m81OsEB9Q5Zetmzbz+o3BZowV3/9QM/WaM2CZwiEjRvib
         dXA13Y2Y+4PYCC0B3DpQcKMEbDgHtaGI4M3qiLXx3H9jfM9KmEJY/tiKgD3Hb92D5sR4
         Ztxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058027; x=1772662827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F50crxFeK9XeDJJq/qBM5+VtsXIjYPfgaWG7L+GSg6s=;
        b=m50iO8mewKdR28AkEcKgvxPGO+xc8WGgLhrZ16qxVwwGyXL4qNIOnj/MG/4G9IyXvG
         HmsW47swC2JUDuocSzMP+U/xBOqJFYe1FiK8m/qsKN3AZ0s7B6VsaGMq4YUr9YkyGy53
         itsh2zDRd2P0uABTbIQmH0eEh5M6LhbgqQxuvrzYEX2r/Dt+0uawTJdrFcjsJFkIMsxL
         N4p/65Zaeg+t2IevU5IsS3MFEZsHkNNgEt7yrYLDUnmQqabYsGywahmsVnKVWK+03LI2
         CY2fcdQtlIeDYa4RKLoyxZ/yC76YFS1DBYDZSRrpa+oBHoiimbstBicVij+AzzbtWjDh
         tkVA==
X-Forwarded-Encrypted: i=1; AJvYcCWOl6aEuyOQo/FBY4Y1z28AOeinLltYnucdDUe3vpKaoMAUer3D9qTBCoCM2zmhRWh3fOfrNskiy48d+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMwTI3TYhFwpCGyl+sPUURGoJiIF+MxLfjAU5+xUvRPHAmnTVg
	dSfIxv/mR1v2Y9bGX3+X3fwHNAOfS3LIwEN1A0cuXUbLyOckZKDCtymt2Y7ULeeq
X-Gm-Gg: ATEYQzzHVfUMUn/kuipxqGv8/VCw60EdVBbszvZoNVH+LVfJXLxv+1t4mkyiV1DdLqu
	f6rduOIfYy4qdcbM7CzeyLaq+OWAxR/SlJ36P+KxbaBj8m/7xmj5yxTjLcbykHUvnTSV9e5Cq0i
	CiTnFsiF+oF1i/P2NOvV/VCgefDl0KG3EpxJ4PW32oujRqbJPVNGL5U9J11gO+4wypCIInLNu6c
	ZrwJGCSw/S/8TNdJXynTIG8DKwrQNDb9Q3qrWr0dwnmggrfYe+iu3JodaF/VQJ/ZovX2IG2QI5R
	QV/fZKNsnI1b2UKsBr0qduBIs2TZEeMwO9Z+uQ8xZ47iNucJz903YNYp1Itq8h3+pEfGfBVaFOm
	nf/UAbz8Z8zTN7TKuYKKE1CdEBtT883Eu/0cgNZKMPFfQD9A5+L2RKBncWGOnhuFcQGtDHds2PZ
	8gl7Z0xGVrfSuq0TA4np1HEA==
X-Received: by 2002:a05:6a20:6a05:b0:394:8455:d1aa with SMTP id adf61e73a8af0-39545ed55eamr16074081637.25.1772058026470;
        Wed, 25 Feb 2026 14:20:26 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359037afe31sm3693376a91.16.2026.02.25.14.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:20:26 -0800 (PST)
Date: Thu, 26 Feb 2026 06:20:03 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 6/6] riscv: dts: sophgo: dts nodes for i2s tdm modules
Message-ID: <aZ91NjoJLr--BEmZ@inochi.infowork>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_142028_748658_767D8343 
X-CRM114-Status: GOOD (  19.00  )
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

On Tue, Jan 20, 2026 at 11:06:08PM +0400, Anton D. Stavinskii wrote:
> Introduced I2S nodes and internal dac and adc nodes as well
> The new header file provided in order to make DMA channel names
> more readable.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv180x-dmamux.h | 57 ++++++++++++++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi     | 55 ++++++++++++++++++++++++++++
>  2 files changed, 112 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h b/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h
> new file mode 100644
> index 000000000000..6314bf6e9dc8
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
> + */
> +
> +#ifndef _SOPHGO_CV18XX_DMAMUX
> +#define _SOPHGO_CV18XX_DMAMUX
> +
> +#define DMA_I2S0_RX		0
> +#define DMA_I2S0_TX		1
> +#define DMA_I2S1_RX		2
> +#define DMA_I2S1_TX		3
> +#define DMA_I2S2_RX		4
> +#define DMA_I2S2_TX		5
> +#define DMA_I2S3_RX		6
> +#define DMA_I2S3_TX		7
> +#define DMA_UART0_RX	8
> +#define DMA_UART0_TX	9
> +#define DMA_UART1_RX	10
> +#define DMA_UART1_TX	11
> +#define DMA_UART2_RX	12
> +#define DMA_UART2_TX	13
> +#define DMA_UART3_RX	14
> +#define DMA_UART3_TX	15
> +#define DMA_SPI0_RX		16
> +#define DMA_SPI0_TX		17
> +#define DMA_SPI1_RX		18
> +#define DMA_SPI1_TX		19
> +#define DMA_SPI2_RX		20
> +#define DMA_SPI2_TX		21
> +#define DMA_SPI3_RX		22
> +#define DMA_SPI3_TX		23
> +#define DMA_I2C0_RX		24
> +#define DMA_I2C0_TX		25
> +#define DMA_I2C1_RX		26
> +#define DMA_I2C1_TX		27
> +#define DMA_I2C2_RX		28
> +#define DMA_I2C2_TX		29
> +#define DMA_I2C3_RX		30
> +#define DMA_I2C3_TX		31
> +#define DMA_I2C4_RX		32
> +#define DMA_I2C4_TX		33
> +#define DMA_TDM0_RX		34
> +#define DMA_TDM0_TX		35
> +#define DMA_TDM1_RX		36
> +#define DMA_AUDSRC		37
> +#define DMA_SPI_NAND	38
> +#define DMA_SPI_NOR		39
> +#define DMA_UART4_RX	40
> +#define DMA_UART4_TX	41
> +#define DMA_SPI_NOR1	42
> +
> +#define DMA_CPU_A53		0
> +#define DMA_CPU_C906_0	1
> +#define DMA_CPU_C906_1	2
> +
> +#endif // _SOPHGO_CV18XX_DMAMUX
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index 06b0ce5a2db7..ebe5e8113939 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include "cv18xx-reset.h"
> +#include "cv180x-dmamux.h"
>  
>  / {
>  	#address-cells = <1>;
> @@ -448,6 +449,60 @@ usb: usb@4340000 {
>  			status = "disabled";
>  		};
>  
> +		i2s0: i2s@4100000 {
> +			compatible = "sophgo,cv1800b-i2s";
> +			reg = <0x04100000 0x1000>;
> +			clocks = <&clk CLK_APB_I2S0>, <&clk CLK_SDMA_AUD0>;
> +			clock-names = "i2s", "mclk";
> +			dmas = <&dmamux DMA_I2S0_RX 1>, <&dmamux DMA_I2S0_TX 1>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
> +		i2s1: i2s@4110000 {
> +			compatible = "sophgo,cv1800b-i2s";
> +			reg = <0x04110000 0x1000>;
> +			clocks = <&clk CLK_APB_I2S1>, <&clk CLK_SDMA_AUD1>;
> +			clock-names = "i2s", "mclk";
> +			dmas = <&dmamux DMA_I2S1_RX 1>, <&dmamux DMA_I2S1_TX 1>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
> +		i2s2: i2s@4120000 {
> +			compatible = "sophgo,cv1800b-i2s";
> +			reg = <0x04120000 0x1000>;
> +			clocks = <&clk CLK_APB_I2S2>, <&clk CLK_SDMA_AUD2>;
> +			clock-names = "i2s", "mclk";
> +			dmas = <&dmamux DMA_I2S2_RX 1>, <&dmamux DMA_I2S2_TX 1>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
> +		i2s3: i2s@4130000 {
> +			compatible = "sophgo,cv1800b-i2s";
> +			reg = <0x04130000 0x1000>;
> +			clocks = <&clk CLK_APB_I2S3>, <&clk CLK_SDMA_AUD3>;
> +			clock-names = "i2s", "mclk";
> +			dmas = <&dmamux DMA_I2S3_RX 1>, <&dmamux DMA_I2S3_TX 1>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +

> +		int_adc: codec@300a100 {
> +			compatible = "sophgo,cv1800b-sound-adc";
> +			#sound-dai-cells = <0>;
> +			reg = <0x300a100 0x100>;
> +			status = "disabled";
> +		};
> +
> +		int_dac: codec@300a000 {
> +			compatible = "sophgo,cv1800b-sound-dac";
> +			#sound-dai-cells = <0>;
> +			reg = <0x300a000 0x100>;
> +			status = "disabled";
> +		};
> +

Hi, Anton,

Can you send a new version with the all device nodes sorted by address?
So I can take them, Thanks.

Regards,
Inochi

>  		rtc@5025000 {
>  			compatible = "sophgo,cv1800b-rtc", "syscon";
>  			reg = <0x5025000 0x2000>;
> 
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
