Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9C5C7EE22
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 00:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nWZ/zjCBrrbQ1xGPHn6fq9m+Vp8xPu8RTHjR0b8nFyQ=; b=XOHoEChbr+lZdA
	PJ3tjCOnX19Ci2aZb9FdzrVnxYREdtlQxElZmX1bcLwpCf0p4W75QZTVHaoE26nGUf/4gwBnVmO6a
	u4RvmVIlM287T2wWJD4jR7LZns3g9UmsSGLzOo/m4n9gsPvA+7bHzQKdETmRHDwWlq0TBRUrA5umO
	CakVGy4u81ANViELsBaU72Of97LKlV9/MV0idISd5IMuU1Bn/+hlbP3BKtXJqGtAYZKyzmsQyt6xq
	NCekniYpQeq+FZsmQk+mNb5nawntJUtVUu5YyoTjaCV3CXRYMEg+zrGjfyasGt5D9YCudDvJ8n0se
	0vwAK4RiArb0B23ySlFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwuOG-007M9z-2B;
	Thu, 11 May 2023 00:42:40 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwuOD-007M9V-2k
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 00:42:39 +0000
Date: Thu, 11 May 2023 08:42:31 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH v2 3/5] riscv: dts: thead: add sipeed Lichee Pi 4A board
 device tree
Message-ID: <ZFw59xlxoCSyb--J@ofant>
References: <20230510204456.57202-1-frank.li@vivo.com>
 <20230510204456.57202-3-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230510204456.57202-3-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_174237_967784_BA6135A6 
X-CRM114-Status: GOOD (  17.32  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Yangtao:

On 04:44 Thu 11 May     , Yangtao Li wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Sipeed's Lichee Pi 4A development board uses Lichee Module 4A core
> module which is powered by T-HEAD's light(a.k.a TH1520) SoC. Add
> minimal device tree files for the core module and the development
> board.
> 
> Support basic uart/gpio/dmac drivers, so supports booting to a basic
> shell.
> 
> Cc: Icenowy Zheng <uwu@icenowy.me>
> Cc: Wei Fu <wefu@redhat.com>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> -cleanup `light`
>  arch/riscv/boot/dts/Makefile                  |  1 +
>  arch/riscv/boot/dts/thead/Makefile            |  2 +
>  .../dts/thead/th1520-lichee-module-4a.dtsi    | 39 +++++++++++++++++++
>  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 33 ++++++++++++++++
>  4 files changed, 75 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/thead/Makefile
>  create mode 100644 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
>  create mode 100644 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index f0d9f89054f8..1e884868ccba 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -2,6 +2,7 @@
>  subdir-y += allwinner
>  subdir-y += sifive
>  subdir-y += starfive
> +subdir-y += thead
>  subdir-y += canaan
>  subdir-y += microchip
>  subdir-y += renesas
> diff --git a/arch/riscv/boot/dts/thead/Makefile b/arch/riscv/boot/dts/thead/Makefile
> new file mode 100644
> index 000000000000..e311fc9a5939
> --- /dev/null
> +++ b/arch/riscv/boot/dts/thead/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_THEAD) += th1520-lichee-pi-4a.dtb
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> new file mode 100644
> index 000000000000..bc5f8677d546
> --- /dev/null
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2023 Yangtao Li <frank.li@vivo.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "th1520.dtsi"
> +
> +/ {
> +	model = "Sipeed Lichee Module 4A";
> +	compatible = "sipeed,lichee-module-4a", "thead,th1520";
we should have these compatibles documented, so a DT-Binding should go first

> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x00000000 0x2 0x00000000>;
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <24000000>;
> +};
> +
> +&osc_32k {
> +	clock-frequency = <32768>;
> +};
> +
> +&apb_clk {
> +	clock-frequency = <62500000>;
> +};
> +
> +&uart_sclk {
> +	clock-frequency = <100000000>;
> +};
for all the above clock-frequency, if it's a real fixed one - so should all hardware
be the same? then probably moving them to th1520.dtsi would be better?

> +
> +&dmac0 {
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> new file mode 100644
> index 000000000000..86d677175feb
> --- /dev/null
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2023 Yangtao Li <frank.li@vivo.com>
> + */
> +
> +#include "th1520-lichee-module-4a.dtsi"
> +
> +/ {
> +	model = "Sipeed Lichee Pi 4A";
> +	compatible = "sipeed,lichee-pi-4a", "sipeed,lichee-module-4a", "thead,th1520";
ditto

> +
> +	aliases {
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio1;
> +		gpio2 = &gpio2;
> +		gpio3 = &gpio3;
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +		serial5 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> -- 
> 2.34.1
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
