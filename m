Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AA8C3ABCB
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 02:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ke2lfUtmJkkcZ5TeIDWgGiEgdHf/xEyE6zHzLwwk4eo=; b=wCY8FahaJtEzGv
	JLOvRGTB+hkAfxaKSeAOrVcWy/ZeqvDFT62mBxC+77X4Hra0cQXYvbdSB66LSMXeVTDwRNSoJNOIb
	OhbHNSFpQhHgbPZRi2IvWagJ3cfnZEpDRtumw9BUmtmErkGi8jvdYhXjOgajhiImb0RX/OAXpRRBf
	SNVnsuLCBwIZsiOpGSyGGaQGoY64CZrXCBKxTQipChQCPUylEQi+uyW/DC47WF6IlC9i2s+yHO5Ir
	MhQ7EBAzJ+dGHjdUxP/AqtEhW/criByrAFkCmOKLGaKAnPbvfn6x/DaqohaDjkxOBkCIyK7jLtvOZ
	poFnZe9g4YhdDBQHDiQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq1kO-00000002xpb-0GqG;
	Mon, 16 Sep 2024 02:45:52 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq1kK-00000002xp0-3wJC
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 02:45:50 +0000
Date: Mon, 16 Sep 2024 02:45:36 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Jesse Taube <Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: add pinctrl property to
 uart0 in BPI-F3
Message-ID: <20240916024536-GYA2058951@gentoo>
References: <7ede7ca6-f8db-4b38-a1cc-8be3d0db7fae@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ede7ca6-f8db-4b38-a1cc-8be3d0db7fae@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_194549_031573_50CCB014 
X-CRM114-Status: GOOD (  22.97  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, Palmer Dabbelt <palmer@dabbelt.com>, Meng Zhang <kevin.z.m@hotmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Jesse

On 10:45 Sun 15 Sep     , Jesse Taube wrote:
> 
> Before pinctrl driver implemented, the uart0 controller reply on
> bootloader for setting correct pin mux and configurations.
> 
> Now, let's add pinctrl property to uart0 of Bananapi-F3 board.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  3 +++
>   arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    | 20 ++++++++++++++++++++
>   arch/riscv/boot/dts/spacemit/k1.dtsi            |  5 +++++
>   3 files changed, 28 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts 
> b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 023274189b492..bc88d4de25a62 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -4,6 +4,7 @@
>    */
> 
>   #include "k1.dtsi"
> +#include "k1-pinctrl.dtsi"
> 
>   / {
>   	model = "Banana Pi BPI-F3";
> @@ -15,5 +16,7 @@ chosen {
>   };
> 
>   &uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_2_cfg>;
>   	status = "okay";
>   };
> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi 
> b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> new file mode 100644
> index 0000000000000..a8eac5517f857
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +#define K1_PADCONF(pin, func) (((pin) << 16) | (func))
> 
> It would be nice to have a pinfunc header like
> arch/arm/boot/dts/nxp/imx/imx7ulp-pinfunc.h.
> It would reference and encode the data of "3.2 Pin Multiplex" in
> https://developer.spacemit.com/documentation?token=An1vwTwKaigaXRkYfwmcznTXned 
> , the document you attached in the summary.
Not sure if it's worth the effort..

I gave up of introducing another macro, as it's exactly one to one mapping to
GPIO ID, which mean pin(x) -> GPIO_x

maybe I could put a comment at K1_PADCONF() to document this?

/* pin is same to the GPIO id according to 3.2 Pin Multiplex of User Manual */
#define K1_PADCONF(pin, func) (((pin) << 16) | (func))

does this sound good to you?

> 
> Otherwise,
> Acked-by: Jesse Taube <Mr.Bossman075@gmail.com>
> 
thanks

> +
> +&pinctrl {
> +	uart0_2_cfg: uart0-2-cfg {
> +		uart0-2-pins {
> +			pinmux = <K1_PADCONF(68, 2)>,
> +				 <K1_PADCONF(69, 2)>;
> +
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi 
> b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 0777bf9e01183..a2d5f7d4a942a 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -416,6 +416,11 @@ uart9: serial@d4017800 {
>   			status = "disabled";
>   		};
> 
> +		pinctrl: pinctrl@d401e000 {
> +			compatible = "spacemit,k1-pinctrl";
> +			reg = <0x0 0xd401e000 0x0 0x400>;
> +		};
> +
>   		plic: interrupt-controller@e0000000 {
>   			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
>   			reg = <0x0 0xe0000000 0x0 0x4000000>;
> 
> -- 
> 2.45.2

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
