Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2267EC0219B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 01:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKJ91VMiDcep6XmKd8bAKjplm1c1RNeh2Bpy8MZGxbw=; b=eVJ1VHSLzTSv/A
	NYhAXaytN+j5XzWXgu+hNpicJf+DDNQ14zXsCd2lWOCFtLZiDsyb5nv2DFZLQJ8rpwaxntLw+BRdf
	mhBS214EIXmPkLHGGdTKN3jlqUde9uY+4XHbbOL5ROOKFiyC2s39iJtk/jRjPqVKhTPdafx4ZkLNW
	NVRJN0atpqRx+WOPjkVCksCsbVhZd2//82BYisFV72n2QOncZnRWPTkNKTYkkFAWRjJyyfuZoIbOu
	XuOavnHfacmYoezhQ20tQ+iuokXJoISJLqGIiTv+qCjWmbmkltoBhT1CZE4s6nb0T8CmDEi81QyNu
	Q0c4G63KmsHgps0SPpuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thITn-0000000FuzN-0BDP;
	Mon, 10 Feb 2025 01:20:55 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thITj-0000000Fuz2-3viX
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 01:20:53 +0000
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 51582343115;
	Mon, 10 Feb 2025 01:20:50 +0000 (UTC)
Date: Mon, 10 Feb 2025 01:20:45 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 3/4] riscv: dts: sophgo: add reset generator for Sophgo
 CV1800 series SoC
Message-ID: <20250210012045-GYA12775@gentoo>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-4-inochiama@gmail.com>
 <BMXPR01MB24406BB0EA039CEBDEEBBDC8FEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BMXPR01MB24406BB0EA039CEBDEEBBDC8FEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_172051_999645_3CFEF46F 
X-CRM114-Status: GOOD (  17.70  )
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

Hi Chen:

On 08:55 Mon 10 Feb     , Chen Wang wrote:
> 
> On 2025/2/9 20:29, Inochi Amaoto wrote:
> > Add reset generator node for all CV18XX series SoC.
> >
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++
> 
> Why it's not include/dt-bindings/reset/sophgo,cv18xx-reset.h?
> 
then first need to answer if it's really a binding, there are some disucssions
I personally favor Inochi's way here

https://lore.kernel.org/linux-devicetree/c7e243e3-3f61-4d63-8727-3837838bdfcc@linaro.org
https://lore.kernel.org/linux-devicetree/c088e01c-0714-82be-8347-6140daf56640@linaro.org/

> Regards,
> 
> Chen
> 
> >   arch/riscv/boot/dts/sophgo/cv18xx.dtsi    |  7 ++
> >   2 files changed, 105 insertions(+)
> >   create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-reset.h b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> > new file mode 100644
> > index 000000000000..3d9aa9ec7e90
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> > @@ -0,0 +1,98 @@
> > +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> > +/*
> > + * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
> > + */
> > +
> > +#ifndef _SOPHGO_CV18XX_RESET
> > +#define _SOPHGO_CV18XX_RESET
> > +
> > +#define RST_DDR				2
> > +#define RST_H264C			3
> > +#define RST_JPEG			4
> > +#define RST_H265C			5
> > +#define RST_VIPSYS			6
> > +#define RST_TDMA			7
> > +#define RST_TPU				8
> > +#define RST_TPUSYS			9
> > +#define RST_USB				11
> > +#define RST_ETH0			12
> > +#define RST_ETH1			13
> > +#define RST_NAND			14
> > +#define RST_EMMC			15
> > +#define RST_SD0				16
> > +#define RST_SDMA			18
> > +#define RST_I2S0			19
> > +#define RST_I2S1			20
> > +#define RST_I2S2			21
> > +#define RST_I2S3			22
> > +#define RST_UART0			23
> > +#define RST_UART1			24
> > +#define RST_UART2			25
> > +#define RST_UART3			26
> > +#define RST_I2C0			27
> > +#define RST_I2C1			28
> > +#define RST_I2C2			29
> > +#define RST_I2C3			30
> > +#define RST_I2C4			31
> > +#define RST_PWM0			32
> > +#define RST_PWM1			33
> > +#define RST_PWM2			34
> > +#define RST_PWM3			35
> > +#define RST_SPI0			40
> > +#define RST_SPI1			41
> > +#define RST_SPI2			42
> > +#define RST_SPI3			43
> > +#define RST_GPIO0			44
> > +#define RST_GPIO1			45
> > +#define RST_GPIO2			46
> > +#define RST_EFUSE			47
> > +#define RST_WDT				48
> > +#define RST_AHB_ROM			49
> > +#define RST_SPIC			50
> > +#define RST_TEMPSEN			51
> > +#define RST_SARADC			52
> > +#define RST_COMBO_PHY0			58
> > +#define RST_SPI_NAND			61
> > +#define RST_SE				62
> > +#define RST_UART4			74
> > +#define RST_GPIO3			75
> > +#define RST_SYSTEM			76
> > +#define RST_TIMER			77
> > +#define RST_TIMER0			78
> > +#define RST_TIMER1			79
> > +#define RST_TIMER2			80
> > +#define RST_TIMER3			81
> > +#define RST_TIMER4			82
> > +#define RST_TIMER5			83
> > +#define RST_TIMER6			84
> > +#define RST_TIMER7			85
> > +#define RST_WGN0			86
> > +#define RST_WGN1			87
> > +#define RST_WGN2			88
> > +#define RST_KEYSCAN			89
> > +#define RST_AUDDAC			91
> > +#define RST_AUDDAC_APB			92
> > +#define RST_AUDADC			93
> > +#define RST_VCSYS			95
> > +#define RST_ETHPHY			96
> > +#define RST_ETHPHY_APB			97
> > +#define RST_AUDSRC			98
> > +#define RST_VIP_CAM0			99
> > +#define RST_WDT1			100
> > +#define RST_WDT2			101
> > +#define RST_AUTOCLEAR_CPUCORE0		128
> > +#define RST_AUTOCLEAR_CPUCORE1		129
> > +#define RST_AUTOCLEAR_CPUCORE2		130
> > +#define RST_AUTOCLEAR_CPUCORE3		131
> > +#define RST_AUTOCLEAR_CPUSYS0		132
> > +#define RST_AUTOCLEAR_CPUSYS1		133
> > +#define RST_AUTOCLEAR_CPUSYS2		134
> > +#define RST_CPUCORE0			160
> > +#define RST_CPUCORE1			161
> > +#define RST_CPUCORE2			162
> > +#define RST_CPUCORE3			163
> > +#define RST_CPUSYS0			164
> > +#define RST_CPUSYS1			165
> > +#define RST_CPUSYS2			166
> > +
> > +#endif /* _SOPHGO_CV18XX_RESET */
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > index c18822ec849f..9aa28ade73a4 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > @@ -7,6 +7,7 @@
> >   #include <dt-bindings/clock/sophgo,cv1800.h>
> >   #include <dt-bindings/gpio/gpio.h>
> >   #include <dt-bindings/interrupt-controller/irq.h>
> > +#include "cv18xx-reset.h"
> >   
> >   / {
> >   	#address-cells = <1>;
> > @@ -61,6 +62,12 @@ clk: clock-controller@3002000 {
> >   			#clock-cells = <1>;
> >   		};
> >   
> > +		rst: reset-controller@3003000 {
> > +			compatible = "sophgo,cv1800b-reset";
> > +			reg = <0x3003000 0x1000>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> >   		gpio0: gpio@3020000 {
> >   			compatible = "snps,dw-apb-gpio";
> >   			reg = <0x3020000 0x1000>;

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
