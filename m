Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A1FC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Oct 2022 04:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0PtMB0FdkHb6k1pjHAZnZoQZO5mDQp8cVrSyC/rzd0=; b=xk9uXVhTXRITam
	7HjE8Qg4PcmMIUYxdPocX/yJGsN7lBCruWzMQCed7r2Kh7Qa9kydAxi5sYzG7AwRCHExMm5d/2iiR
	29/zUmdsuHIBv0n9avlClRjtjoE0Rw/bj3jnDZh6Hhb3LYHSKKM1S+7DceHIuROaychnp2TSrQlfV
	ljHFCBayUXMKvvJ2hYeoEDGwjeJFy8OfVfUr34O/AW1y6h90hPyUbh75VNlpqH8zXkePY+hGxLSkR
	CiFo338+MxeUPpEqCozlNHCNWemR3mDxiAJ7sHGs4ZHXPINYGAPZGJJYSoHh20cfb3yBnoHP/fXY/
	ixakdTwyn8lsTMF56Mqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oodQe-004cBj-DR; Sat, 29 Oct 2022 04:26:40 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oodQa-004cAf-L1
	for linux-riscv@lists.infradead.org; Sat, 29 Oct 2022 04:26:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E375DB82C9E
	for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 04:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D99C43147
	for <linux-riscv@lists.infradead.org>; Sat, 29 Oct 2022 04:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667017592;
	bh=0X6sbdtU1ASk+HWNzupcd82PSckOfahyy4rWtTLlMTA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZZFyE7fo8/A4yTP6dAVseuo/g2ECeyLmtJzni7kzmj659Fpo0TVcvjohM3Oo4o7Ts
	 vClw8d4lyxWsOCs0CktVWLEXvyTQPyMg+45BLUAwoKJp9yewS6FfX17zM0GdcbzOTo
	 Wsao+2Ug+uiJl9engsjFBhQRdqH7OI67uq+lfG02TRMmDlQNvXFN76PMN4Wok1aSc6
	 uKZXtJ0Af3n9GJytWqINpjmItPYfJHn4ql0DJ+LM9XVLLAb5Rh3TGfmnhjQY8NJa3t
	 VOg50fpWbd3rkF1+3hO24ZpqapsdgdMMTBtf2gfVGydErqmz9zFFVIKj15llA7fKKU
	 s7773fa0QkVPQ==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-13b103a3e5dso8455962fac.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 21:26:32 -0700 (PDT)
X-Gm-Message-State: ACrzQf29b8tIQPoAiFsW8PPYFb9eIQAaZf5nnofmWSPv3xcc19wyHREC
	JH57EJiNLeYn4EVPuYmTgmTwP/zbLVy6Vp2nkBQ=
X-Google-Smtp-Source: AMsMyM5mjZe9wficSNhAST6aSDfyezl3xJRAYaY+R/snrGC4m2XLVZGdvcai6rDpfedZAxFIFqOPNmVBZTZUt/ONtcg=
X-Received: by 2002:a05:6870:5803:b0:12c:c3e0:99dc with SMTP id
 r3-20020a056870580300b0012cc3e099dcmr10207277oap.19.1667017591346; Fri, 28
 Oct 2022 21:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221028165921.94487-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221028165921.94487-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 29 Oct 2022 12:26:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQn+6pTjuiGf-febHhDHjVeJ78Zdywd+EkteeO0MEUGaw@mail.gmail.com>
Message-ID: <CAJF2gTQn+6pTjuiGf-febHhDHjVeJ78Zdywd+EkteeO0MEUGaw@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_212636_991982_632C9667 
X-CRM114-Status: GOOD (  25.19  )
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

This should combine with the previous one, which makes the patch complete.

On Sat, Oct 29, 2022 at 12:59 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the minimal blocks required for booting the Renesas RZ/Five
> SMARC EVK with initramfs.
>
> Below are the blocks which are enabled:
> - CPG
> - CPU0
> - DDR (memory regions)
> - PINCTRL
> - PLIC
> - SCIF0
>
> As we are reusing the RZ/G2UL SoC base DTSI [0], RZ/G2UL SMARC SoM [1] and
> carrier [2] board DTSIs which enables almost all the blocks supported
> by the RZ/G2UL SMARC EVK and whereas on RZ/Five SoC we will be gradually
> enabling the blocks hence the aliases for ETH/I2C are deleted and rest
> of the IP blocks are marked as disabled/deleted.
>
> [0] arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> [1] arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> [2] arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4 -> v5
> * Reworked completely (sort of new patch)
>
> v3 -> v4
> * Dropped deleting place holder nodes
> * Updated SW1 settings comment
> * Update commit message
>
> v2 -> v3
> * Dropped RB tags from Conor and Geert
> * Now re-using the SoM and carrier board DTS/I from RZ/G2UL
>
> v1 -> v2
> * New patch
> ---
>  arch/riscv/boot/dts/Makefile                  |  1 +
>  arch/riscv/boot/dts/renesas/Makefile          |  2 +
>  .../boot/dts/renesas/r9a07g043f01-smarc.dts   | 27 ++++++
>  .../boot/dts/renesas/rzfive-smarc-som.dtsi    | 58 ++++++++++++
>  arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 91 +++++++++++++++++++
>  5 files changed, 179 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/renesas/Makefile
>  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
>  create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
>  create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
>
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index ff174996cdfd..b0ff5fbabb0c 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -3,5 +3,6 @@ subdir-y += sifive
>  subdir-y += starfive
>  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
>  subdir-y += microchip
> +subdir-y += renesas
>
>  obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> diff --git a/arch/riscv/boot/dts/renesas/Makefile b/arch/riscv/boot/dts/renesas/Makefile
> new file mode 100644
> index 000000000000..2d3f5751a649
> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043f01-smarc.dtb
> diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts b/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
> new file mode 100644
> index 000000000000..2aa8515451d3
> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/Five SMARC EVK
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +
> +/*
> + * DIP-Switch SW1 setting
> + * 1 : High; 0: Low
> + * SW1-2 : SW_SD0_DEV_SEL      (0: uSD; 1: eMMC)
> + * SW1-3 : SW_ET0_EN_N         (0: ETHER0; 1: CAN0, CAN1, SSI1, RSPI1)
> + * Please change below macros according to SW1 setting on the SoM
> + */
> +#define SW_SW0_DEV_SEL 1
> +#define SW_ET0_EN_N    1
> +
> +#include "r9a07g043f.dtsi"
> +#include "rzfive-smarc-som.dtsi"
> +#include "rzfive-smarc.dtsi"
> +
> +/ {
> +       model = "Renesas SMARC EVK based on r9a07g043f01";
> +       compatible = "renesas,smarc-evk", "renesas,r9a07g043f01", "renesas,r9a07g043";
> +};
> diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> new file mode 100644
> index 000000000000..45a182fa3b4b
> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/Five SMARC EVK SOM
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <arm64/renesas/rzg2ul-smarc-som.dtsi>
> +
> +/ {
> +       aliases {
> +               /delete-property/ ethernet0;
> +               /delete-property/ ethernet1;
> +       };
> +
> +       chosen {
> +               bootargs = "ignore_loglevel";
> +       };
> +
> +       /delete-node/opp-table-0;
> +       /delete-node/thermal-zones;
> +};
> +
> +&adc {
> +       status = "disabled";
> +};
> +
> +&dmac {
> +       status = "disabled";
> +};
> +
> +&eth0 {
> +       status = "disabled";
> +};
> +
> +&eth1 {
> +       status = "disabled";
> +};
> +
> +&ostm1 {
> +       status = "disabled";
> +};
> +
> +&ostm2 {
> +       status = "disabled";
> +};
> +
> +&sdhi0 {
> +       status = "disabled";
> +};
> +
> +&tsu {
> +       status = "disabled";
> +};
> +
> +&wdt0 {
> +       status = "disabled";
> +};
> diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
> new file mode 100644
> index 000000000000..e64f0e5f8e30
> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/Five SMARC EVK carrier board
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <arm64/renesas/rzg2ul-smarc.dtsi>
> +
> +/ {
> +       aliases {
> +               /delete-property/ i2c0;
> +               /delete-property/ i2c1;
> +       };
> +};
> +
> +&canfd {
> +       status = "disabled";
> +
> +       channel0 {
> +               status = "disabled";
> +       };
> +
> +       channel1 {
> +               status = "disabled";
> +       };
> +};
> +
> +&ehci0 {
> +       status = "disabled";
> +};
> +
> +&ehci1 {
> +       status = "disabled";
> +};
> +
> +&hsusb {
> +       status = "disabled";
> +};
> +
> +&i2c0 {
> +       status = "disabled";
> +};
> +
> +&i2c1 {
> +       status = "disabled";
> +};
> +
> +&ohci0 {
> +       status = "disabled";
> +};
> +
> +&ohci1 {
> +       status = "disabled";
> +};
> +
> +&phyrst {
> +       status = "disabled";
> +};
> +
> +&sdhi1 {
> +       status = "disabled";
> +};
> +
> +&snd_rzg2l {
> +       status = "disabled";
> +};
> +
> +&spi1 {
> +       status = "disabled";
> +};
> +
> +&ssi1 {
> +       status = "disabled";
> +};
> +
> +&usb0_vbus_otg {
> +       status = "disabled";
> +};
> +
> +&usb2_phy0 {
> +       status = "disabled";
> +};
> +
> +&usb2_phy1 {
> +       status = "disabled";
> +};
> +
> +&vccq_sdhi1 {
> +       status = "disabled";
> +};
> --
> 2.25.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
