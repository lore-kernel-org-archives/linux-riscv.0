Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10842FD45FA
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 22:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VoZaAZ7pZDqZdmr2qOIoRcLkRHU7/QbEybBTYKbaM0=; b=KZz2CpZY48IZxl
	7KS+ve5sFPcxk1gozJor/BfT7Nb0HTSl27oCACjGfLmwFw7z0zyo51mf2vsLZEpLPpbOumheXUJuI
	JGbvGMlJR1l6mXXRH8Clfr6HYwgzYnsuWMjzTKyZkEHRaDyaztpxVPNla0z5FZgrTdLwEh3b+MYHV
	SNvrILf4yzQdUHCAGsiwFV/L6Ff5acP6yCUzOnUCJfF7JWGmsX8kTwuIWkZGlNtYfTfIlAJ11ODAG
	8jLmMz3rYE8rJAgMwPv1EyEyUR7lUMHjFr+zO502+BeAc1YQU1a2YHs8X7x6rKhj5xf7T6pK4W6Px
	LmvwF4WxQ7bt7qwnuN0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNR7-000000050lA-006Y;
	Wed, 25 Feb 2026 22:32:53 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNR4-000000050kp-249g
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 22:32:51 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-824a829f9bbso142394b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 14:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772058769; x=1772663569; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n4i2IRBgsk5p1jTMDi9j/dN7YnnN1etbWBu+Qol+1xk=;
        b=gZq0yrX/08cr99i6De5sMvxa8veYYIyhAlB36LEXF/lCKpU6AHTUzAIUjh7NtsbXxK
         HTMiZp8NHu/wxzSWGVQ1P9BUHw4+hfhuanfDNGpYVQoEyiJ7NCjIdwKCbdYssNFnEO9/
         5BPrSpbXqTsM6ufInRVpFmx2adZPUG7ajTIBbASQW+NF6atRkeqkX03yoCPa0vzfRGMH
         Sxl3/igHXj4vqJTyyHqXL1N+VUMYYuIj6ZvXkBYxqEgeMJQlBiR8qRwyl49YHFT6FJU7
         tzKGy1WvyvMeQkD0KdRA2lSji3BSe8W4erBQVbUqmVGrePIsHj05t6u+Y/xmnsH3zR7X
         LXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058769; x=1772663569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4i2IRBgsk5p1jTMDi9j/dN7YnnN1etbWBu+Qol+1xk=;
        b=uskgDQ79W7EgYZaYQ+DjWUzStyACPgL3T8IgTJqhfd+KgC5S+k72aTJji/eo+sbKhr
         M/RdkENY202NqZ65ws8Wv8Q/VtKNFRznxusTJCEQmtWD7SzKQHIAVP8q7OEf+WvYA5QZ
         E4zOV9pqhwrM+CL4I7CyjfHYibyQI3OVq3c8kvtUpmjxgwGISAwuVRK54sGjJoSgpLfE
         z6iMxWUhDWS5Xq8SzA+EEUdGvnxdx30qLv1l8ag/LRdwQiKAiQDW29+T0oZPKH7hDcB2
         JdzPO1aVpRKutz8rPjAxCrvorSJ/jaFi4XR5PShw2yeNp/+osGc1gZ6NxZK86Y8fCy+X
         3ZIg==
X-Forwarded-Encrypted: i=1; AJvYcCXEu6hUfsCGEDPCUChaHO45Chi+2YKM+cTEF3aEZxtEsdSBtGuWRyzNRc03lF/Xut/N8u5c8vfH455XUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgvTydiEQZY+TDPfcWSEHUVhOtpWh14mrt92zTfWY75q+/kQgd
	pKZi3/VOTf3TX0/4oP3XH/RrtEobcn7nw3+aX/5d901r+9lEtRYDwZAw
X-Gm-Gg: ATEYQzyu+ZQ6Xi3QNau3zFuQtfFcDDzh47IHlgM4DOpdm99oH19eIuR7TW1r7qwuZot
	3iGUzhFqhw/Y0Rw9gH3elEOSJFze6/kf+pPjRfQ1L2u2kfxEFuvz33mmINFl9Y7FibbWa5d2NEO
	3zGwkoUbKHws6byl8IwVpEmrsEj/PJPkHHpc+Qk6l1W5xYjBx297quJNy7rj9yqrnfncrMHVK6c
	HwabTJ4Ss36ODopsq9QcpRckhPsrdVrm0jL9VoPb3zi3LQ9Z9LV9vrAf1HvXqq77sII8XZ38qjD
	QCMqn6rgynpWLNYQ6iF3spxaWfxrc+RLWvjIWG/yKfpjbXxaZ43YY4m62LNBCgZCZz5r9brVTMD
	SkljnyT6/ss5OplSPcILPpCYt2R2JkNBcLduIyAU9s0eUPSB2yR0ibKUTQ1dhn8XCoTO4vXmG/X
	dceNYkZ0vw06ajS5/COLUGDw==
X-Received: by 2002:a05:6a00:6d5a:10b0:827:28db:7a78 with SMTP id d2e1a72fcca58-82728db7ea0mr2323867b3a.17.1772058769463;
        Wed, 25 Feb 2026 14:32:49 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01a9dasm289317b3a.49.2026.02.25.14.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:32:49 -0800 (PST)
Date: Thu, 26 Feb 2026 06:32:27 +0800
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
Message-ID: <aZ939evsOs6nCd5I@inochi.infowork>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_143250_538868_D55AD381 
X-CRM114-Status: GOOD (  19.40  )
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

This magic number 1 is bind to the RISC-V cores, I think we should add a
macro DMA_CPU_ID into CPU file to route the CPU id to real cores.
Or, just let the borad dts configure which dma is enabled.

Regards,
Inochi

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
