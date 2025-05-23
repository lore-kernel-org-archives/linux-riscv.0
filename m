Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE77C3DA6D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 05:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKcs8w7DJihSgIYWVts6HfQVQz69aw4293h9d4dgiuo=; b=cb3ykqOu+MYz1i
	spBhErllQTL687s4pJynwll/MPeKeczaI8tlLhzmdICsAg0A5+k6vBMkR9eQdVJAvbHdscpq0O/7I
	kFemS4NJq34rtlojXmc7EPtmqRfPeSEMljODgLjl8KJhLY5InBVrt2ku5byGS19b5UCfA2GKW9Xim
	cywfSyuCAb/YpsBw0ujEKGzKx/4fBFFHTNPD6yqjCeAX/RSQZshUKBimS+iKNLmmfHDhP/n7T3xMy
	oErIf+ITwzFTGXG66KBYUejucYZ1Gein/DFc9Zlpu4MX1FRhrXLEkZIatQAvIK/1J2rPNTbNkAepw
	yQGgzf977yUi2IzcNKeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKpj-00000002z1G-10XE;
	Fri, 23 May 2025 05:20:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKph-00000002z14-066w
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 05:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UHj/1B2qrE4XAy5Qp0M4DBa9t1YMp5Gwm4zi+DP2Rfs=; b=GN5rs+ocFdLyfZ+njrWUovefwf
	bruGiLIZVGsoGvbqLkSo2zThk/bJy++KLy8jrM//5r6aIv7clDZSWEneKIS/oh+YNh9XQEbO+A/pr
	z9gDnpQo7NNWj1r5fpywfpoGIQMAUkdI4Paqqc8m6QGtrnXlDkIoXZoQ+agr/bOEGimvn9P504fLQ
	ptkWme+n3Ldx4C19t65lYRwBgy4X6KNPIcb62ZoxHDwh1Kqi/8aucQXqK6Zsjviht4krtgJso7v3K
	hTfMZsNDxYAaQZvEGM7v0CPSiwoy5em99rKGpDaVBGyzuheGLKvTFl6byIuZz9wvdbcsylwf7KJwu
	bBCacPlw==;
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIKpb-000000018J5-2VsM
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:20:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1747977610; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fOE5uyU2V/jZxzefVCjXKHOUHJCfQgnt0W0OO1meL7UBd8Re66uahxFvUtMxmnABG04rUOrMqcUaVZSD+VrUcGzHX7U67ejhxbZZzVtAe+pNrqEK92nJFvohdoZedJSwseRecZrdE+DdU/AU9uHYhh7nJytjWFUwtVnrrb9Z00k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747977610; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UHj/1B2qrE4XAy5Qp0M4DBa9t1YMp5Gwm4zi+DP2Rfs=; 
	b=LaeToclatgWRmuMFTk7N/W1Ge6PuoBaxI2R7IaU0IdGl0LKSP29FYK0xe6LOJMFhY8n7STOer6elRBZME82i4Ls4QrHv1BdCrFwY0z+8RhuZyga0Q9lQPG13a9LLKWDTz0rXC3GqDDh4xLZOBOKBZ4w2npelp6t6fcsBqQu9I8E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747977610;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UHj/1B2qrE4XAy5Qp0M4DBa9t1YMp5Gwm4zi+DP2Rfs=;
	b=K2DAXGHX0Fn7/A/6EFwDCQCHQ1V/HMoiQm+xsvD2UOi1acN28Lk16y6ewNDF8aeT
	9okkm5f6TdlU3s6qQRKV02lKeR4d/9HVR44dpBE2KwgbW0hf4o15PN7iVzbiZ/FTCON
	+wBB0gigPyGSJBu1SzIC9Wg5TMLnRrqkIhZqKVW0=
Received: by mx.zohomail.com with SMTPS id 1747977608258134.90960394346882;
	Thu, 22 May 2025 22:20:08 -0700 (PDT)
Message-ID: <4750f2c6-221f-4b2e-ab9c-31d707404a4e@pigmoral.tech>
Date: Fri, 23 May 2025 13:20:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] riscv: dts: sophgo: add reset generator for Sophgo
 CV1800 series SoC
To: Inochi Amaoto <inochiama@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jisheng Zhang <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-4-inochiama@gmail.com>
From: Junhui Liu <junhui.liu@pigmoral.tech>
In-Reply-To: <20250209122936.2338821-4-inochiama@gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_062032_831255_418A52C0 
X-CRM114-Status: GOOD (  14.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Inochi,

Thanks for your patch. While testing remoteproc with it, I noticed some
issues that need correction:

On 2025/2/9 20:29, Inochi Amaoto wrote:
> Add reset generator node for all CV18XX series SoC.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++
>   arch/riscv/boot/dts/sophgo/cv18xx.dtsi    |  7 ++
>   2 files changed, 105 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
>
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-reset.h b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> new file mode 100644
> index 000000000000..3d9aa9ec7e90
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#ifndef _SOPHGO_CV18XX_RESET
> +#define _SOPHGO_CV18XX_RESET
> +
> +#define RST_DDR				2
> +#define RST_H264C			3
> +#define RST_JPEG			4
> +#define RST_H265C			5
> +#define RST_VIPSYS			6
> +#define RST_TDMA			7
> +#define RST_TPU				8
> +#define RST_TPUSYS			9
> +#define RST_USB				11
> +#define RST_ETH0			12
> +#define RST_ETH1			13
> +#define RST_NAND			14
> +#define RST_EMMC			15
> +#define RST_SD0				16
> +#define RST_SDMA			18
> +#define RST_I2S0			19
> +#define RST_I2S1			20
> +#define RST_I2S2			21
> +#define RST_I2S3			22
> +#define RST_UART0			23
> +#define RST_UART1			24
> +#define RST_UART2			25
> +#define RST_UART3			26
> +#define RST_I2C0			27
> +#define RST_I2C1			28
> +#define RST_I2C2			29
> +#define RST_I2C3			30
> +#define RST_I2C4			31
> +#define RST_PWM0			32
> +#define RST_PWM1			33
> +#define RST_PWM2			34
> +#define RST_PWM3			35
> +#define RST_SPI0			40
> +#define RST_SPI1			41
> +#define RST_SPI2			42
> +#define RST_SPI3			43
> +#define RST_GPIO0			44
> +#define RST_GPIO1			45
> +#define RST_GPIO2			46
> +#define RST_EFUSE			47
> +#define RST_WDT				48
> +#define RST_AHB_ROM			49
> +#define RST_SPIC			50
> +#define RST_TEMPSEN			51
> +#define RST_SARADC			52
> +#define RST_COMBO_PHY0			58
> +#define RST_SPI_NAND			61
> +#define RST_SE				62
> +#define RST_UART4			74
> +#define RST_GPIO3			75
> +#define RST_SYSTEM			76
> +#define RST_TIMER			77
> +#define RST_TIMER0			78
> +#define RST_TIMER1			79
> +#define RST_TIMER2			80
> +#define RST_TIMER3			81
> +#define RST_TIMER4			82
> +#define RST_TIMER5			83
> +#define RST_TIMER6			84
> +#define RST_TIMER7			85
> +#define RST_WGN0			86
> +#define RST_WGN1			87
> +#define RST_WGN2			88
> +#define RST_KEYSCAN			89
> +#define RST_AUDDAC			91
> +#define RST_AUDDAC_APB			92
> +#define RST_AUDADC			93
> +#define RST_VCSYS			95
> +#define RST_ETHPHY			96
> +#define RST_ETHPHY_APB			97
> +#define RST_AUDSRC			98
> +#define RST_VIP_CAM0			99
> +#define RST_WDT1			100
> +#define RST_WDT2			101
> +#define RST_AUTOCLEAR_CPUCORE0		128


I think here should start from 256.

> +#define RST_AUTOCLEAR_CPUCORE1		129
> +#define RST_AUTOCLEAR_CPUCORE2		130
> +#define RST_AUTOCLEAR_CPUCORE3		131
> +#define RST_AUTOCLEAR_CPUSYS0		132
> +#define RST_AUTOCLEAR_CPUSYS1		133
> +#define RST_AUTOCLEAR_CPUSYS2		134
> +#define RST_CPUCORE0			160

And here should start from 288.

> +#define RST_CPUCORE1			161
> +#define RST_CPUCORE2			162
> +#define RST_CPUCORE3			163
> +#define RST_CPUSYS0			164
> +#define RST_CPUSYS1			165
> +#define RST_CPUSYS2			166
> +
> +#endif /* _SOPHGO_CV18XX_RESET */
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index c18822ec849f..9aa28ade73a4 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -7,6 +7,7 @@
>   #include <dt-bindings/clock/sophgo,cv1800.h>
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
> +#include "cv18xx-reset.h"
>   
>   / {
>   	#address-cells = <1>;
> @@ -61,6 +62,12 @@ clk: clock-controller@3002000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		rst: reset-controller@3003000 {
> +			compatible = "sophgo,cv1800b-reset";
> +			reg = <0x3003000 0x1000>;
> +			#reset-cells = <1>;
> +		};
> +
>   		gpio0: gpio@3020000 {
>   			compatible = "snps,dw-apb-gpio";
>   			reg = <0x3020000 0x1000>;


-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
