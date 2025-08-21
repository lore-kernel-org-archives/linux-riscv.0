Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99780CA0EE6
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7yup+fpa8QgK/3oX3I+TvvpmaGkvAMiqspwixnHuiQ=; b=ONe7fLvu9MFcJO
	Oi719jFMlOarLzbLEMXLCCwOaS9yGoSi1MI4sajCCdBm60k5NmHrTnAcYGeys7BOM7GR/+ASvGBXE
	UxDxHtRWga4DhWtfv0WRlVzlRPJ6/IQ8GyXRTTVYVXcXfTChBhHjW0glqmw0BSNvwQtxD47oHEhwo
	zC9TNVgsaKSUOgZk64SLXlSY6BT1pIjRdb9L5UwoFBDZHTHbwbaGzF/qLpGgogGBHQPbu3r3dPmr/
	d/iQ4jO5Kw3x/T191CdNxWtBCXNW/dELoKsWBoyTuQCp4BTB+vtXenzhfaqDNuczP3cIrA687+Mbn
	YD/670GVydR8woUTjRzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow8S-0000000Ff5D-0b9j;
	Thu, 21 Aug 2025 03:38:44 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uovFn-0000000FYxL-0hiP
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 02:42:20 +0000
X-QQ-mid: esmtpgz12t1755744015tdf80e59d
X-QQ-Originating-IP: O6wBfJ/mxbSxcRE/MwEPz7eaNjXY68MXi0HQGF45vL4=
Received: from [192.168.125.98] ( [113.104.140.179])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 21 Aug 2025 10:40:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2970625901000882426
Message-ID: <257702B5AE6EE65A+20bf1aab-7fa4-45ba-a8ae-d3aeb5f6e9d9@linux.starfivetech.com>
Date: Thu, 21 Aug 2025 10:40:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] riscv: dts: starfive: add Milk-V Mars CM Lite
 system-on-module
To: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250724094912.253723-1-e@freeshell.de>
 <20250724094912.253723-5-e@freeshell.de>
Content-Language: en-US
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <20250724094912.253723-5-e@freeshell.de>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.starfivetech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: Mbusj0+sBV8LM60Z+wPgUWsCYmQJ/XK3LOJ7LkwmO8VBfMrP/fyRpEKg
	siG6pSjz8OQXczo70OFwFV2Yk3D9wC/GPcCYqr5sDJxc4jOV4jrnr3d3zNF3S6TIF0quBH5
	eaFrUj4DFwWLYpLmdiD3TnQo5RvFVo/uw8xcr/TB1Vf9kQEeFnASTSQAdwuHkyKTKYbwCo8
	kYUJ/WarIBn1C5NQSROOPx2CSkYXDDcHMF003WDIWCqpttpDbUQ+n5u3oy0hN9gggiC/bl3
	MwF3ED78kWWmbl/XZvSW4KBe0U7nc0o+dZEUN28kaqHP4PVns611GTcsBHmb+4M++N7Rku/
	3WofdpPaH0FFY1UVpVn5fcxUiYNlkchOAhTIlFYvwrnJS2A8QTrCBoBqHcLv/Z+KQobvIu9
	JITFbCxvRCSE4J1uW2ixIeX1QV6dUXEl5ePI8x+Qt6/IQDvQIU0NSGPrjJu8dD4BzOQj0bR
	NM6B6CGDQ9LASkKudhjVyixOD2fSsZHb3LwDXLchVTZHzyKiXTQNvm8Cens0321CIzlShQI
	c3r4OcX5BLIgTpfTQli4ReSgTbErLuekoyf4Vb8STk5CYUamkEb3XKYyhrn+lTNo2NZBCGj
	q5DOVrUTUrAff5LPfQ3kM+g8GO+mf3/8ZQjW56CxkBwtZH3qOB/ToxAbttu37zOIKYT/Fnf
	TlSVuNxB6OdDltugm/cQZwPK6+aiqbMyQfYyT+LbZ+xEombGidCwg4wT7DJgFzFM8gc69bI
	T1X93muhhh0Rc2/4jGwKPqja+7Hbi6J7YCCNcabNBRLUTH7Ogj6xZM3SwjoWFIg1VcMV9NX
	ishMbh6+le+ksFw2W3wjBtH1wFj1CQO1Op7Rnb6j3/7UvUdeDetgx1Jo+J9tKyHyoUDvVUF
	fBy0rG7vPAHXb23U9JAeAFomofb5KnJmLaHAyDohgeQAb0LRbLhivb71kYbFPmBJ1S5fZPc
	bWpHGLYSvF0JDOyns3l685bC75oea13HDw578dBybxlW235bkGgJmjwCosm4AdZj1xCB2aj
	+BXrUnnGDBaXGBwTVZ
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_194215_653359_D61EAA9D 
X-CRM114-Status: GOOD (  14.99  )
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

On 7/24/2025 5:48 PM, E Shattow wrote:
> Milk-V Mars CM Lite is a System-on-Module based on the Milk-V Mars CM
> without the onboard eMMC storage component populated and configured
> instead for SD3.0 Card Slot on that interface via 100-pin connector.
> 
> Link to Milk-V Mars CM Lite schematics: https://github.com/milkv-mars/mars-files/tree/main/Mars-CM_Hardware_Schematices
> Link to StarFive JH7110 Technical Reference Manual: https://doc-en.rvspace.org/JH7110/TRM/index.html
> Link to Raspberry Pi CM4IO datasheet: https://datasheets.raspberrypi.com/cm4io/cm4io-datasheet.pdf
> 
> Add the devicetree file to make use of StarFive JH7110 common supported
> features PMIC, EEPROM, UART, I2C, GPIO, PCIe, QSPI Flash, PWM, and
> Ethernet. Also configure the eMMC interface mmc0 for SD Card use and
> configure the common SD Card interface mmc1 for onboard SDIO BT+WiFi.
> 
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/Makefile         |   1 +
>  .../dts/starfive/jh7110-milkv-marscm-lite.dts | 176 ++++++++++++++++++
>  2 files changed, 177 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
> 
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index 79742617ddab..62b659f89ba7 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-deepcomputing-fml13v01.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-marscm-emmc.dtb
> +dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-marscm-lite.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
> new file mode 100644
> index 000000000000..e110146f0b76
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
> @@ -0,0 +1,176 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2025 E Shattow <e@freeshell.de>
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include "jh7110-common.dtsi"

You can just include "jh7110-milkv-marscm-emmc.dts" instead of "jh7110-common.dtsi".
And then adding mmc0 changes will be enough.

Best regards,
Hal

...

> +&mmc0 {
> +	bus-width = <4>;
> +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> +};
> +
> +&mmc0_pins {
> +	pwren-pins {
> +		pinmux = <GPIOMUX(22, GPOUT_HIGH,
> +				      GPOEN_ENABLE,
> +				      GPI_NONE)>;
> +	};
> +};
> +
...


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
