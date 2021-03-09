Return-Path: <SRS0=trcm=IH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12CAC433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 10:57:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 308486523D
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 10:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 308486523D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/DpyGQeAKr9duu1Zt18FIvwkV2yzQ75d8+2S5NgKpMw=; b=pj+Q7z3XE95iUrwnYVVaoV0m9
	5H6BanDmOUR8pPgHf1QxoPWUGAFItZhNb/NLtz69UezXYXmKMyJ7biDpsCMlqIp8EFfBK3p3o0Hp+
	u6ZH/TKAt6OCLuBMuRNK8Nn6diS2rDeOrbEz4ceGG3HR9CRwg/eq4bCMMjiyYEHnEMC0sHhO1VCrl
	R03qZ8Uk5yKzz+lCyBKfgYPQn5TPkbRl+YRM/TzHyhFvingWHo8YPd7U04t0u0Hn5Xr5+7c2L2mn2
	HQzgpTm3jnwXgvCZCfibaCYvJyjY0lmKjL7NYOiocksZ5rTVFOj4zwNqBGj1EbgDCUwCMxFiZQ539
	i2SkUIJGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJa2u-004FJg-4X; Tue, 09 Mar 2021 10:57:00 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJa2o-004FJG-RS
 for linux-riscv@lists.infradead.org; Tue, 09 Mar 2021 10:56:57 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lJa2g-00066w-9p; Tue, 09 Mar 2021 10:56:46 +0000
Subject: Re: [PATCH v4 3/5] RISC-V: Initial DTS for Microchip ICICLE board
To: Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <alistair.francis@wdc.com>, Anup Patel
 <anup.patel@wdc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Conor.Dooley@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Ivan.Griffin@microchip.com, Lewis.Hanly@microchip.com
References: <20210303200253.1827553-1-atish.patra@wdc.com>
 <20210303200253.1827553-4-atish.patra@wdc.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <e97e6dd6-fcb5-fac1-41e2-534f524bf5d2@codethink.co.uk>
Date: Tue, 9 Mar 2021 10:56:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303200253.1827553-4-atish.patra@wdc.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_105654_992406_960FB4B9 
X-CRM114-Status: GOOD (  18.33  )
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

On 03/03/2021 20:02, Atish Patra wrote:
> Add initial DTS for Microchip ICICLE board having only
> essential devices (clocks, sdhci, ethernet, serial, etc).
> The device tree is based on the U-Boot patch.
> 
> https://patchwork.ozlabs.org/project/uboot/patch/20201110103414.10142-6-padmarao.begari@microchip.com/
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>   arch/riscv/boot/dts/Makefile                  |   1 +
>   arch/riscv/boot/dts/microchip/Makefile        |   2 +
>   .../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
>   .../boot/dts/microchip/microchip-mpfs.dtsi    | 329 ++++++++++++++++++
>   4 files changed, 404 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/microchip/Makefile
>   create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>   create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index 7ffd502e3e7b..fe996b88319e 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   subdir-y += sifive
>   subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
> +subdir-y += microchip
>   
>   obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
> new file mode 100644
> index 000000000000..622b12771fd3
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += microchip-mpfs-icicle-kit.dtb
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> new file mode 100644
> index 000000000000..ec79944065c9
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020 Microchip Technology Inc */
> +
> +/dts-v1/;
> +
> +#include "microchip-mpfs.dtsi"
> +
> +/* Clock frequency (in Hz) of the rtcclk */
> +#define RTCCLK_FREQ		1000000
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	model = "Microchip PolarFire-SoC Icicle Kit";
> +	compatible = "microchip,mpfs-icicle-kit";
> +
> +	chosen {
> +		stdout-path = &serial0;
> +	};
> +
> +	cpus {
> +		timebase-frequency = <RTCCLK_FREQ>;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x0 0x40000000>;
> +		clocks = <&clkcfg 26>;
> +	};
> +

The latest Microchip releases have two memory nodes to provide the
full 2GiB of memory space.

> +	soc {
> +	};
> +};
> +
> +&serial0 {
> +	status = "okay";
> +};
> +
> +&serial1 {
> +	status = "okay";
> +};
> +
> +&serial2 {
> +	status = "okay";
> +};
> +
> +&serial3 {
> +	status = "okay";
> +};
> +
> +&sdcard {
> +	status = "okay";
> +};
> +
> +&emac0 {
> +	phy-mode = "sgmii";
> +	phy-handle = <&phy0>;
> +	phy0: ethernet-phy@8 {
> +		reg = <8>;
> +		ti,fifo-depth = <0x01>;
> +	};
> +};
> +
> +&emac1 {
> +	status = "okay";
> +	phy-mode = "sgmii";
> +	phy-handle = <&phy1>;
> +	phy1: ethernet-phy@9 {
> +		reg = <9>;
> +		ti,fifo-depth = <0x01>;
> +	};
> +};



-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
