Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AA5D1036F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 01:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DiAxSz9GXGwY0BUaVwXvEdkYhktQntVuDPMdOCC7FZY=; b=pScvqGZIbMpIl6
	p6agZz5qOj4yb8jB6ODVgHhKDvLyaJ5ETEMza4k3d6aRGqi9X9kcYsD4+HfamDDLpFUeb1/ZwBUQl
	DgqHiaO4TU2NiwiADqbge/+MF3sKRarYEvpBi7t1tqhfQJipttNEpp5mNDbAJrKLOKJh+ooqw1G4w
	F7ZUxe/+b/N3VEE8QK/pxEyP+fNm+b+RJk/pCsRUb7T2HrOl/T2DOG5uhfiuZStu9qAs7kEScPm8/
	rkT+GR32zaKjINnxaHG3BBZH2rxZWW4NsNPu7vG8SAA2dX4mRRzMK+zMbmekyPXFS1L5nSbqn09qa
	NfyAB+c9EBOJo93FvpdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO4aC-0000000EBd1-1nNP;
	Wed, 26 Nov 2025 01:44:36 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO4a9-0000000EBcf-2kfn
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 01:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1764121449;
	bh=WQXerLQfEzkCxOdDOg6Z8yEdERJE0Z5dvD249YR9kqE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KcFDFjZdicn3B2fyU1iRSfw/X3bUf1zMLbVL/fVnetFWDlKZV+b6QDpG1Z8al+8+n
	 suguKOxWOjnW87Jgrcu/S/3t+SP+loLpPbAgLxFM2dc5KiXXIrNnZdkQMpnccHpa0z
	 UrJiLFPOBnU3cKXNERyaBICh0S+Z0RYrRTPN4Ru947jYSxvMuYi6OJffIwxvxkIZDZ
	 ZOL/SqTuJUEOJyluxDokqrW2AYoqtJx1gu8UhbkRMHsCxOsdEOsFMKzNcLXrcG55Xo
	 DrMCW+Vh5MSuFRJC3iVUcWMZhvkTaoTgHyVDpFzg5S9sNrkqOTlkHwxkKFJ49iyosI
	 b0YCttHUxFGGA==
Received: from [192.168.2.54] (unknown [98.97.63.250])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 2C58AB2203E8;
	Wed, 26 Nov 2025 02:44:04 +0100 (CET)
Message-ID: <24150aee-368b-41e5-bcca-b60c561e31ec@freeshell.de>
Date: Tue, 25 Nov 2025 17:44:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] riscv: dts: starfive: Add VisionFive 2 Lite board
 device tree
To: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251125075604.69370-1-hal.feng@starfivetech.com>
 <20251125075604.69370-6-hal.feng@starfivetech.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20251125075604.69370-6-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_174434_252317_D658C124 
X-CRM114-Status: GOOD (  14.51  )
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


On 11/24/25 23:56, Hal Feng wrote:
> VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S SoC.
> 
> Board features:
> - JH7110S SoC
> - 4/8 GiB LPDDR4 DRAM
> - AXP15060 PMIC
> - 40 pin GPIO header
> - 1x USB 3.0 host port
> - 3x USB 2.0 host port
> - 1x M.2 M-Key (size: 2242)
> - 1x MicroSD slot (optional non-removable 64GiB eMMC)
> - 1x QSPI Flash
> - 1x I2C EEPROM
> - 1x 1Gbps Ethernet port
> - SDIO-based Wi-Fi & UART-based Bluetooth
> - 1x HDMI port
> - 1x 2-lane DSI
> - 1x 2-lane CSI
> 
> VisionFive 2 Lite schematics: https://doc-en.rvspace.org/VisionFive2Lite/PDF/VF2_LITE_V1.10_TF_20250818_SCH.pdf
> VisionFive 2 Lite Quick Start Guide: https://doc-en.rvspace.org/VisionFive2Lite/VisionFive2LiteQSG/index.html
> More documents: https://doc-en.rvspace.org/Doc_Center/visionfive_2_lite.html
> 
> Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Tested-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/Makefile         |  1 +
>  .../jh7110-starfive-visionfive-2-lite.dts     | 20 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts
> 
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index 62b659f89ba7..2b1e7fcd6f84 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -13,5 +13,6 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-marscm-emmc.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-marscm-lite.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
> +dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-lite.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts
> new file mode 100644
> index 000000000000..b96eea4fa7d5
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2025 StarFive Technology Co., Ltd.
> + * Copyright (C) 2025 Hal Feng <hal.feng@starfivetech.com>
> + */
> +
> +/dts-v1/;
> +#include "jh7110-starfive-visionfive-2-lite.dtsi"
> +
> +/ {
> +	model = "StarFive VisionFive 2 Lite";

> +	compatible = "starfive,visionfive-2-lite", "starfive,jh7110s";

Add "starfive,jh7110" to the compatible list as the least-compatible
(left-to-right order last item):

compatible = "starfive,visionfive-2-lite", "starfive,jh7110s",
"starfive,jh7110";

or if there is review feedback that no new compatible should be added,
then as usual for new JH-7110 boards:

compatible = "starfive,visionfive-2-lite", "starfive,jh7110";

> +};
> +
> +&mmc0 {
> +	bus-width = <4>;
> +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_HIGH>;
> +	disable-wp;
> +	cap-sd-highspeed;
> +};

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
