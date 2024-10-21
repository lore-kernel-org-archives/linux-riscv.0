Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9D0D3E18D
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 07:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBr5kYS+4tF2W5A6UbBVZx+L8WF8cJPXwLOyEAECH+M=; b=TwSsrPK0wuITRi
	ErEHztqtqYKzUyeKT6emAn3f6EqHVrDO4O1OQ3pPFBFsB1E6Vl+AcFyayu2emu7ApuCtQYA+3FDDk
	rF/JU7nWI8rQ6FG/+O3FTVTKY/OPyb7rf06QRm/ZoMGzs3gNaRrAgpMzSgQKSI9zaLFqB5dUpPyvS
	nK40mqEn0ZraKWPblBOMS0us/skMwfqte/aDR5kP+qEaQaYSe9arLbCTaNsqWEWs/0S/1taz2OLsW
	+re6bPbzn6GD3YzJOiNFPigr49t5diKyrXqwb5qbdiqq+IBth33NpcoBr3BeftIJMWrwZ9ujcQw3h
	LsqxXGB6T+4VG8kg+VYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mmG-00000006MXR-1ORa;
	Mon, 21 Oct 2024 07:24:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mg0-00000006L1y-1QHF
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 07:18:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 204615C58B1;
	Mon, 21 Oct 2024 07:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981D3C4CECD;
	Mon, 21 Oct 2024 07:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729495083;
	bh=uoS5XTRMeT/gGcLkJRtVlVTCHjy0kWjFGMleEtECSvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hi/+coWyQ9HmJR2rIZDA/xoftFHtg9qrhjwgY0bLSCiU1tgTvgeuj64tM8eRO1S8l
	 IheLgBTBKvn8hvDU6IEki0p99LvUDFrzP2/WPv34WDkXFCdSTCOT0f7P1VHI62p0E/
	 zwKZdJpwzjQvcyO0xlgwG0QsPWTn1/JjgV8yQmXMmmmfj/oBiyWeDegZKci10h/5to
	 oA1UfgTIfWXv/tBfj3NnI5EHD824CyBf9gL3Iw4XpVg8lIiXEV0M0VOsKrf5LIMbuL
	 5Q+3hAV/qh3+ZTEvzk0MLLKMQtv5BdcOIHZNShkNMC5TM51BpAmAmjKq/JBNyY8ioU
	 66UQTEsEkWOhg==
Date: Mon, 21 Oct 2024 09:17:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, rafal@milecki.pl, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko.stuebner@cherry.de>, 
	Michael Zhu <michael.zhu@starfivetech.com>, Drew Fustini <drew@beagleboard.org>, 
	Alexandru Stan <ams@frame.work>, Daniel Schaefer <dhs@frame.work>, 
	Sandie Cao <sandie.cao@deepcomputing.io>, Yuning Liang <yuning.liang@deepcomputing.io>, 
	Huiming Qiu <huiming.qiu@deepcomputing.io>, Alex Elder <elder@riscstar.com>, linux@frame.work, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] riscv: dts: starfive: add DeepComputing FML13V01
 board device tree
Message-ID: <ae5gels34ozgzrcrwz53wj22hoy5cq3crn3dmkhitxlffmnavt@6lbmrcpjmqyd>
References: <20241020134959.519462-1-guodong@riscstar.com>
 <20241020134959.519462-4-guodong@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241020134959.519462-4-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_001804_493298_A6FE53FE 
X-CRM114-Status: GOOD (  21.31  )
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

On Sun, Oct 20, 2024 at 09:49:59PM +0800, Guodong Xu wrote:
> From: Sandie Cao <sandie.cao@deepcomputing.io>
> 
> The FML13V01 board from DeepComputing incorporates a StarFive JH7110 SoC.
> It is a mainboard designed for the Framework Laptop 13 Chassis, which has
> (Framework) SKU FRANHQ0001.
> 
> The FML13V01 board features:
> - StarFive JH7110 SoC
> - LPDDR4 8GB
> - eMMC 32GB or 128GB
> - QSPI Flash
> - MicroSD Slot
> - PCIe-based Wi-Fi
> - 4 USB-C Ports
>  - Port 1: PD 3.0 (60W Max), USB 3.2 Gen 1, DP 1.4 (4K@30Hz/2.5K@60Hz)
>  - Port 2: PD 3.0 (60W Max), USB 3.2 Gen 1
>  - Port 3 & 4: USB 3.2 Gen 1
> 
> Create the DTS file for the DeepComputing FML13V01 board. Seven device
> nodes have been verified functional and remain enabled: i2c2, i2c5, i2c6
> qspi, mmc0, mmc1 and usb0.  All others remain disabled, or are disabled
> by nodes in "jh7110-deepcomputing-fml13v01.dts".
> 
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> [elder@riscstar.com: revised the description, updated some nodes]
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v5: No change
> v4: Changed model string to "DeepComputing FML13V01"
>     Changed dts filename and Makefile accordingly to reflect the change
>     Updated device nodes status, and verified functional
>     Revised the commit message
> v3: Updated the commit message
> v2: Changed the model and copmatible strings
>     Updated the commit message with board features
> 
>  arch/riscv/boot/dts/starfive/Makefile         |  1 +
>  .../jh7110-deepcomputing-fml13v01.dts         | 44 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> 
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index 7a163a7d6ba3..b3bb12f78e7d 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -8,6 +8,7 @@ DTC_FLAGS_jh7110-starfive-visionfive-2-v1.3b := -@
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-beaglev-starlight.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
>  
> +dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-deepcomputing-fml13v01.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> new file mode 100644
> index 000000000000..b515b7d04c37
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2024 DeepComputing (HK) Limited
> + */
> +
> +/dts-v1/;
> +#include "jh7110-common.dtsi"
> +
> +/ {
> +	model = "DeepComputing FML13V01";
> +	compatible = "deepcomputing,fml13v01", "starfive,jh7110";
> +};
> +
> +&camss {
> +	status = "disabled";
> +};
> +
> +&csi2rx {
> +	status = "disabled";
> +};
> +
> +&gmac0 {
> +	status = "disabled";
> +};
> +
> +&i2c0 {
> +	status = "disabled";
> +};
> +
> +&pwm {
> +	status = "disabled";
> +};
> +
> +&pwmdac {
> +	status = "disabled";
> +};
> +
> +&spi0 {
> +	status = "disabled";

If your board has to disable all these, then they should not have been
enabled in DTSI in the first place. Only blocks present and working in
the SoC (without amny external needs) should be enabled.

I suggest to fix that aspect first.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
