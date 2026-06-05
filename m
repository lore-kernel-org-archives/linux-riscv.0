Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25ACBCD6E5D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Mime-Version:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v19Zzb7GFIEPl3smmJd3ducVvgQpsXuczeZsnraT8k8=; b=G7AQFt3LyF+U5S
	0flYjlqHSLpEpzVFhECwF2kpwN4w+kd8VnMAs057HP8b0a8gGt3//SGzlghWH3zbeZ8JKEHM2lGKe
	+9OXRlBZZUvKLTXffJa8dXIWpYoMenzveVD37H3FdrODEl17fuaFnxKWA4NQoDB4HwsU7woLxac7H
	fBDHo+KP3Af9/UJMaXYsDxbTLUwxZgry2aBzsCCpS3JsCU2IJseJNBW2g0C/dkAh8SXurZTDKE28y
	4k445IcNqiy91dSWyHV1a+ywT3xgWluuHlKCgIC3twAKCC2NeZ0E78MKPXlniSUPtY+gKY5xrrR4/
	BeFdYn+APEZFUnQNc3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQZf-00000000NLx-1lvB;
	Fri, 05 Jun 2026 09:10:43 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQZc-00000000NKb-1aiT;
	Fri, 05 Jun 2026 09:10:41 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gWwdJ6LJbz9tqP;
	Fri,  5 Jun 2026 11:10:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780650628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pZu3uHIMs3CS8SP0rLKrzCVJEON6Er92uMM8TGXVtnE=;
	b=vI0C77rlpZ/kb5L+pgPubmrB62QzwYFwz/UtAHRj2WIe5QWJcrcdlu7DJXp+bnp/mZOxPW
	SxRfQrvUedLB+UfTzhRQlEINbsmW82fK4jS7YGqo5HGrMgiLgebZLvvOH9Vjqh/ToRynXG
	D3B+rRbWwyqls/Fl0rMv4gORxurK1z8WaEAA7cAQ+Ebasckmi6oshlvuUm0Ip8Q8s+4P5L
	qDlCaBMvu/zJI0UTVyQV3m+ia9Do+7DllCFdH4JJJDJP6rKQH7NEz/HqzwxP5Gynq2hisJ
	CHtaDC81fMXVh/G28KF5Ofk9RDloHe/p7aoANWUmKQq5Ds8lfZmJLTzAtofBxw==
Date: Fri, 05 Jun 2026 17:09:56 +0800
Message-Id: <DJ0ZYF5C8MMH.2GBBY188VVPSH@mailbox.org>
Cc: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <sophgo@lists.linux.dev>,
 <hanguidong02@gmail.com>, <michael.opdenacker@rootcommit.com>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v5 RESEND 5/5] riscv64: dts: sophgo: add initial Milk-V
 Duo S board support
From: "Shuwei Wu" <shuwei.wu@mailbox.org>
To: "Joshua Milas" <josh.milas@gmail.com>, <tglx@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <pjw@kernel.org>, <samuel.holland@sifive.com>, <unicorn_wang@outlook.com>,
 <inochiama@gmail.com>, <daniel.lezcano@linaro.org>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <liujingqi@lanxincomputing.com>,
 <alexander.sverdlin@gmail.com>, <rabenda.cn@gmail.com>, <dlan@kernel.org>,
 <chao.wei@sophgo.com>, <anup@brainfault.org>
Mime-Version: 1.0
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-6-josh.milas@gmail.com>
In-Reply-To: <20260530173347.33533-6-josh.milas@gmail.com>
X-MBO-RS-META: ty4b5d94rbfqutfk8wi54pxq6xud5tic
X-MBO-RS-ID: 68716531ea3f837e9e1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_021040_557679_C9906EBC 
X-CRM114-Status: GOOD (  18.79  )
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

Hi Joshua,

On Sun May 31, 2026 at 1:33 AM CST, Joshua Milas wrote:
> This adds initial riscv support for the Milk-V Duo S board
> [1] making it possible to boot Linux to the command line.
>
> Link: https://milkv.io/duo-s [1]
>
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
>  2 files changed, 86 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
>
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 6f65526d4193b..58cc6b70d8de4 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> new file mode 100644
> index 0000000000000..8632470f43ab0
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +
> +#include "sg2000.dtsi"
> +
> +/ {
> +	model = "Milk-V Duo S";
> +	compatible = "milkv,duo-s", "sophgo,sg2000";
> +
> +	aliases {
> +		i2c4 = &i2c4;
> +		mmc0 = &sdhci0;
> +		serial0 = &uart0;
> +		spi3 = &spi3;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&dmac {
> +	status = "okay";
> +};
> +
> +&emmc {
> +	bus-width = <4>;
> +	no-1-8-v;
> +	cap-mmc-hw-reset;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&gmac0 {
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +};
> +
> +&mdio {
> +	status = "okay";
> +};
> +
> +&saradc {
> +	status = "okay";
> +};
> +
> +&sdhci0 {
> +	bus-width = <4>;
> +	no-1-8-v;
> +	disable-wp;
> +	status = "okay";
> +};
> +
> +&sdhci1 {
> +	bus-width = <4>;
> +	cap-sdio-irq;
> +	no-mmc;
> +	no-sd;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&spi3 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&usb {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +

I tested this series on a Milk-V Duo S board with a RISC-V mainline kernel.

The board boots successfully with sg2000-milkv-duo-s.dtb. UART works, the SD
card is detected and readable, Ethernet works after enabling the MDIO mux
options, and the DMA, USB host, I2C4, SPI3 and SARADC nodes all probe
successfully.

One thing I noticed is that the Wi-Fi SDIO device is not enumerated with the
mainline DT. The sdhci1 host itself probes:

  mmc1: SDHCI controller on 4320000.mmc [4320000.mmc] using ADMA 64-bit
  mmc1: Failed to initialize a non-removable card

and /sys/bus/sdio/devices remains empty.

With the vendor image on the same board, the Wi-Fi SDIO device is detected on
the corresponding controller:

  mmc1: SDHCI controller on 4320000.wifi-sd [4320000.wifi-sd] using ADMA 64-bit
  sdio vendor ID: 0xc8a1
  sdio device ID: 0x0082
  aicwf_sdio_chipmatch USE AIC8800D80
  sdio ready

So it looks like the SDHCI host comes up, but the SDIO device behind it is not
discovered. I may still be missing some config option.

Have you seen this issue on your side? If not, could you please share the
relevant kernel config used for your testing?

-- 
Best regards,
Shuwei Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
