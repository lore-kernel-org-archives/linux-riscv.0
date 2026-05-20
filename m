Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CA0CD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 08:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+qFXGlrODnCY0Hx9tzAu++UCI+qgcuQ/GAnRdZ4MLmM=; b=QkoME/O/g+yebr
	3ox0djeNUYNoNKbDPW9sP3PHGpCZKbmyr60QMfHetu50WRyQ8hxFlK8Mj3+WEVJ8FObtPsAopNTkK
	EELiTk2jIz2sorClJgu3XW9PovkVLsQaOtU2POVtwP2Cp1WStBXxDCkFPuTZ/NfEgP5GFY9ZDMZZl
	eMYqpqwBBECi2Y8OfjpRZ1WhC1nOrmXmQZiDYmcXMzP5EmO//ACIO10GNuV5p7zrrjKh+KQ2sgjBZ
	wGk4Ru1SgtXqrZUPnIxZSIrPgtsTqtLHA/1NPPDQkxHT9e17F7gjS7Mc2GQ+mr7iB0C0PE6WY2pDA
	bgwMhm5CFz+GAgnJRfHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcTi-00000003z75-0fkH;
	Wed, 20 May 2026 08:40:34 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcTd-00000003z5h-32M2
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 08:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=MEvCnrMS2FHdXOn45fiP0INsUQjEFvQ+z
	ETMtLv4Bsc=; b=KCHYRv4zZl/h4oUggXkn+pFpePvTSqmjAGevJSCsAmw58SN7W
	asdo33f8OUJMGmEVfJIjlTFyp1F/cXVeHLtYgaD6eVXVWGiD8pK1HwntH5hdEH2j
	4EotQiO2gwUtOMnzlpMen7QKyuUD4n7pGKqIVlppTbUJRoJIX/LMeyKMMc=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkOacw1qCu8EAA--.6803S2;
	Wed, 20 May 2026 16:40:58 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH 7/9] riscv: dts: ultrarisc: add Rongda M0 board device
 tree
From: Jia Wang <wangjia@ultrarisc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20260515-frisbee-clench-4029b6dd8169@wendy>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-7-bf559589ea8a@ultrarisc.com>
 <20260515-frisbee-clench-4029b6dd8169@wendy>
Date: Wed, 20 May 2026 16:40:17 +0800
Message-Id: <177926641764.943957.18316342442301070235.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779266417; l=5372;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=0YfzwFM4TkbuwWH8IkXdR07nKm5GoPXCKV3UI9DD0Ic=;
 b=SwifmTQo72mWpg5nqGNCxAAX306CBjPWMhjw1/VBtWATJVLAUmB0C57ucVktGk6T7MHlGv/l5
 0Z4YlPJGTyuCAx8bjASS+zgu4V1HJymF4OV04WVGba3wreWPaAWz5E3
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwAnEkOacw1qCu8EAA--.6803S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCryUAryxGrW7Kw1ruF47XFb_yoW7Gryrpr
	W7Grs8GF9rXw12k34Sqry5WFnxtF40gFyDuw42ga4UArsxurW8Crs3Kwn5Grn3Xrs8Xr1r
	ur1UuFWxCwn09aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sREPrc3UUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQANEWoL3kQAGQAFs6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_014030_341639_DF83E72D 
X-CRM114-Status: GOOD (  21.66  )
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

On 2026-05-15 11:28 +0100, Conor Dooley wrote:
> On Fri, May 15, 2026 at 09:18:03AM +0800, Jia Wang wrote:
> > Rongda M0 is an mATX motherboard based on the UltraRISC DP1000 SoC.
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> >  arch/riscv/boot/dts/Makefile                       |   1 +
> >  arch/riscv/boot/dts/ultrarisc/Makefile             |   2 +
> >  .../dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi    |  85 ++++++++++++++++
> >  arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts | 111 +++++++++++++++++++++
> >  4 files changed, 199 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> > index 69d8751fb17c..702882974251 100644
> > --- a/arch/riscv/boot/dts/Makefile
> > +++ b/arch/riscv/boot/dts/Makefile
> > @@ -12,3 +12,4 @@ subdir-y += spacemit
> >  subdir-y += starfive
> >  subdir-y += tenstorrent
> >  subdir-y += thead
> > +subdir-y += ultrarisc
> > diff --git a/arch/riscv/boot/dts/ultrarisc/Makefile b/arch/riscv/boot/dts/ultrarisc/Makefile
> > new file mode 100644
> > index 000000000000..d01a770d3cba
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/ultrarisc/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +dtb-$(CONFIG_ARCH_ULTRARISC) += dp1000-rongda-m0.dtb
> > diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi
> > new file mode 100644
> > index 000000000000..101b416b1079
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi
> > @@ -0,0 +1,85 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> > + */
> > +
> > +#include "dp1000.dtsi"
> > +
> > +&pmx0 {
> > +	i2c0_pins: i2c0-pins {
> > +		pins = "PA12", "PA13";
> > +		function = "func0";
> 
> This is what I meant about func0 btw, and having this be "i2c" etc instead.

Right, agreed. I will use semantic function names instead.

> > diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts
> > new file mode 100644
> > index 000000000000..6f72d60ad55e
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts
> > @@ -0,0 +1,111 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> > + */
> > +
> > +#include "dp1000-rongda-m0-pinctrl.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +	model = "Rongda M0 Board";
> > +	compatible = "rongda,m0", "ultrarisc,dp1000";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +		serial1 = &uart1;
> > +		serial2 = &uart2;
> > +		serial3 = &uart3;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +
> > +	gpio-poweroff {
> > +		compatible = "gpio-poweroff";
> > +		gpios = <&gpio_b 0 GPIO_ACTIVE_HIGH>;
> > +		active-delay-ms = <100>;
> > +
> > +		status = "disabled";
> 
> Why bother adding the nodes if they are disabled? What enables them?
> 

Understood. Since the board uses the OpenSBI SRST extension for
reset/poweroff, these GPIO nodes are unused and do not need to appear in
the DTS.

I'll drop them in the next revision.

> > +	};
> > +
> > +	gpio-restart {
> > +		compatible = "gpio-restart";
> > +		gpios = <&gpio_b 1 GPIO_ACTIVE_HIGH>;
> > +		active-delay = <100>;
> > +
> > +		status = "disabled";
> > +	};
> > +};
> > +
> > +&i2c0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c0_pins>;
> > +};
> > +
> > +&i2c1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c1_pins>;
> > +};
> > +
> > +&i2c2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c2_pins>;
> > +
> > +	rtc@32 {
> > +		compatible = "whwave,sd3078";
> > +		reg = <0x32>;
> > +	};
> > +};
> > +
> > +&i2c3 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c3_pins>;
> > +};
> > +
> > +&spi0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&spi0_pins>;
> > +};
> > +
> > +&spi1 {
> > +	num-cs = <1>;
> 
> Why is num-cs set at the board level here?
>

`num-cs` is set at the board level because it reflects board wiring, not
the controller capability. On Rongda M0 only one SPI1 CS line is routed,
so the board DTS restricts `num-cs` to 1.

> > +
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&spi1_pins>;
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart0_pins>;
> > +};
> > +
> > +&uart1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart1_pins>;
> > +};
> > +
> > +&uart2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart2_pins>;
> > +};
> > +
> > +&ethernet {
> > +	phy-handle = <&phy0>;
> > +	/*
> > +	 * YT8531 RGMII timing on this board requires no PHY internal delays.
> > +	 * Using "rgmii-id" together with rx/tx-internal-delay-ps results in RX CRC
> > +	 * errors and no usable traffic, so keep plain "rgmii" here.
> > +	 */
> > +	phy-mode = "rgmii";
> > +
> > +	mdio {
> > +		compatible = "snps,dwmac-mdio";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		phy0: phy@0 {
> > +			reg = <0x00>;
> > +		};
> > +	};
> > +};
> > 
> > -- 
> > 2.34.1
> > 

Best Regards,
Jia Wang



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
