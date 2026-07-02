Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A059FC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 09:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=foUd0hHA4BjO6kLBKDHHCmrkE150ggROaKYhbMkXDFA=; b=pKkfsnEc6DrVov
	e9CoRmOdRiu8HsnV2zRHmDtu76oFzp+SMbjRBirSgjZWQOCuV2fPF9/lqC8KH7X3fiWoffnC+4XrJ
	ONT8qZGXGFJ4ZRteNw9bvwpzJEvB6dP2TyMCaTB34TxOHpT7dEGUV+urZEwE2bAORcdmhBznQQV+G
	Shfe1HN8anAAnL7mm8dGvg7ASMRrPmJuI0a69k1dJGOkWrOEvx4XVP2W55he0YgIPs0F4eIr5rFp1
	OatjPBRn/ouHeScLQnFsKCVPT7u/P9JNHrxabN9+cDDviMZfEGwt7ZGr1/woXJpgF0nqh7slzkQYO
	LIfk7cIWXS6HJP1ZdOOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfE5S-0000000463I-35YY;
	Thu, 02 Jul 2026 09:52:02 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfE5P-0000000462u-3IA1
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 09:52:01 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-847a483e344so417201b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782985919; x=1783590719; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YDRpB2DKaayDiWw9YLXhH5c/W2DOhBpZscwPdMD2aSs=;
        b=Bqjf6altIAIubUu3b6HOCFdKVq4008n7kmXUP2NW/TSXx6kFsmDx4PH+HICaK34DNK
         VO2mVrB6w9RM/udZmZ4H2JYab/TsJXEQUViVZDlc2dE7QeyakjW+15xNBsUmdiw/nxnI
         dcUWXvVc8QC5LHcZjd7uGBlY4Nga4M/hmpI0LW7QVYSZR9U0FLF7rccEgVePNcSiRkyw
         qRD508yxFBEcL4+x8xC7m7FOX12Vytr7wjwTyo9cQI4Qad+p1bSuy6FfVwZBET0Gbylm
         ANWqhZwpQW7b+CBHNvVzOHelHTVbEB6NGrLmVbFsteL4WCq3No45kf7Pvigts9okO/5s
         oMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985919; x=1783590719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDRpB2DKaayDiWw9YLXhH5c/W2DOhBpZscwPdMD2aSs=;
        b=jupexUKFZg+0vCyXADazOD60jUTldSTMIATQNMfi+wLo+Nzcm5/VLafkBwVKyKyFp5
         JwPrJlsPxtP3Z6GYvtmx3U8creiEgevAsin50NSKUjDO5v/anIksLQqpgjIslMbfyC6T
         /3aB6nAVQfhKQf6YeKaM+iR3NvIMqADHuKq4y9XCdDjmG87j3jPnkVrnZ414qz7PYhxb
         kf7iksZh+XQEzOEfTzIUJvnkO1dV3p+QXUtWdPK7WN4b03AfBCUGpnCEE0ONr4edfGU6
         ayzVoBvNpOInZyKapwJ8evnyc8h3EHYPS5Z8XVdZLODU/FQD3WiUk1dQEDOu24yi1m9I
         gxag==
X-Forwarded-Encrypted: i=1; AFNElJ9KUWKvangCPFdeXMEWF2lEozIAn2fcWnx17vSp8UTUGS44xmHbpKFyXLC0MHM+47Vvslyskgy69JtA5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHiFa4Sz9VfaEPExS0m3Q+pH2kLrL3LF8tmO9mgdAz7m5cPPZX
	Dbk5U5FIQmT1otR9LUWhKv9ZlS75VIuZ+tgddTHMHLtxF792phmTZSWO
X-Gm-Gg: AfdE7cmzRmLDBVcuIVJm61cHrcXN4WzU1Um72QxL1mq6N84X3JScxjF9jheNfiYyP+X
	0cbhi6xgPS8QbXjC0p0m0WFmwj91WWEaKSBUN/ksDjrwVZCVrL0dySuVkmDxXSyikWx5If3fRZH
	R196EoWhHXeVuKeIj10aRq/HfiJSV3owm5JJULwcjJAqzYwq5gYu2FOwuW8M3FiGjBb6PfZ2Hbl
	2M5omz+7ZF5M+t3I55rbu282ATwPssa2uHSJLMWMkTfXMF619nlGrU9KJEHBhmP86I3u8Zvjqfn
	rFXHbyoyVTE/peEKHhaqDJM5f1tQB3p5NvM/SbV28mfYMVshePDxmzT3FQ5g2FUVQMWY/NjJCP3
	15BGuUNYBSti55PLsQgIbgeJkrkqHjrJHkS4vAG915IyslS6CkbGJ4T+19/3hPgH6
X-Received: by 2002:a05:6a00:13a1:b0:847:8bd0:1b96 with SMTP id d2e1a72fcca58-847bf9d4b0amr4742033b3a.23.1782985918713;
        Thu, 02 Jul 2026 02:51:58 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb7933e1sm1069821b3a.26.2026.07.02.02.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:51:58 -0700 (PDT)
Date: Thu, 2 Jul 2026 17:51:28 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, unicorn_wang@outlook.com, 
	inochiama@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Han Gao <rabenda.cn@gmail.com>, 
	Nutty Liu <liujingqi@lanxincomputing.com>, Longbin Li <looong.bin@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: Add Milk-V Duo 256M board
 support
Message-ID: <akY0kY8yWAU_J3Eu@inochi.infowork>
References: <20260610121026.1517621-1-chenyou910331@gmail.com>
 <20260610121026.1517621-2-chenyou910331@gmail.com>
 <akXbk7l9bZ_W0GLR@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <akXbk7l9bZ_W0GLR@inochi.infowork>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_025200_142417_DE068827 
X-CRM114-Status: GOOD (  30.11  )
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

On Thu, Jul 02, 2026 at 11:38:09AM +0800, Inochi Amaoto wrote:
> On Wed, Jun 10, 2026 at 08:10:10PM +0800, Chen-Yu Yeh wrote:
> > The Milk-V Duo 256M is a small form factor development board based on
> > the Sophgo SG2002 SoC.
> > 
> > This patch adds basic device tree support for the board, including:
> > - UART console
> > - SD/MMC controller
> > - USB host
> > - Onboard blue status LED (connected to PWR_GPIO[2] / porte 2)
> > 
> 
> > Tested on actual Milk-V Duo 256M hardware, verified boot to shell and
> > heartbeat LED functionality.
> > 
> 
> IIRC the led is not controlled by the small core, so the node should
> be described in the dts.
> 
> I see the Sashiko does provide some good question, please check.
> 
> > Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> > ---
> > Changes since v1:
> > - Removed the leds node because &porte is not yet supported in cv180x.dtsi,
> >   which would cause a dtc compilation error.
> > - Retained the &usb node because it is already defined in cv180x.dtsi.
> > - Cleaned up the trailing blank line in the Makefile.
> > 


So why not adding the porte?

Regards,
Inochi

> >  arch/riscv/boot/dts/sophgo/Makefile           |   3 +-
> >  .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 108 ++++++++++++++++++
> >  2 files changed, 110 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> > index 6f65526d4193..f9415c30a2c5 100644
> > --- a/arch/riscv/boot/dts/sophgo/Makefile
> > +++ b/arch/riscv/boot/dts/sophgo/Makefile
> > @@ -2,7 +2,8 @@
> >  dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
> >  dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
> >  dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
> > +dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
> >  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
> >  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
> >  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
> > -dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
> > +dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
> > \ No newline at end of file
> 
> 
> Why you change this? Please do not touch unrelated things.
> 
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > new file mode 100644
> > index 000000000000..4cf441ab3790
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > @@ -0,0 +1,108 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> 
> I guess a right copyright is needed for your code.
> 
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sg2002.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +	model = "Milk-V Duo 256M";
> > +	compatible = "milkv,duo256m", "sophgo,sg2002";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +		serial1 = &uart1;
> > +		serial2 = &uart2;
> > +		serial3 = &uart3;
> > +		serial4 = &uart4;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +
> > +	reserved-memory {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges;
> > +
> > +		coprocessor_rtos: region@83f40000 {
> > +			reg = <0x83f40000 0xc0000>;
> > +			no-map;
> > +		};
> > +	};
> > +};
> > +
> > +&osc {
> > +	clock-frequency = <25000000>;
> > +};
> > +
> > +&pinctrl {
> > +	uart0_cfg: uart0-cfg {
> > +		uart0-pins {
> > +			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> > +				 <PINMUX(PIN_UART0_RX, 0)>;
> > +			bias-pull-up;
> > +			drive-strength-microamp = <10800>;
> > +			power-source = <3300>;
> > +		};
> > +	};
> > +
> > +	sdhci0_cfg: sdhci0-cfg {
> > +		sdhci0-clk-pins {
> > +			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
> > +			bias-pull-up;
> > +			drive-strength-microamp = <16100>;
> > +			power-source = <3300>;
> > +		};
> > +
> > +		sdhci0-cmd-pins {
> > +			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
> > +			bias-pull-up;
> > +			drive-strength-microamp = <10800>;
> > +			power-source = <3300>;
> > +		};
> > +
> > +		sdhci0-data-pins {
> > +			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
> > +				 <PINMUX(PIN_SD0_D1, 0)>,
> > +				 <PINMUX(PIN_SD0_D2, 0)>,
> > +				 <PINMUX(PIN_SD0_D3, 0)>;
> > +			bias-pull-up;
> > +			drive-strength-microamp = <10800>;
> > +			power-source = <3300>;
> > +		};
> > +
> > +		sdhci0-cd-pins {
> > +			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
> > +			bias-pull-up;
> > +			drive-strength-microamp = <10800>;
> > +			power-source = <3300>;
> > +		};
> > +	};
> > +};
> > +
> > +&sdhci0 {
> > +	pinctrl-0 = <&sdhci0_cfg>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +	bus-width = <4>;
> > +	no-1-8-v;
> > +	no-mmc;
> > +	no-sdio;
> > +	disable-wp;
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-0 = <&uart0_cfg>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +};
> > +
> > +&usb {
> > +	dr_mode = "host";
> > +	status = "okay";
> > +};
> > -- 
> > 2.43.0
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
