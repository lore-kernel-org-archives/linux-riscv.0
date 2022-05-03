Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8FFC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  3 May 2022 23:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6WpeYV0Z5GBRfDsC06TliqWPNUZ+VL/ynX7srQcbKjo=; b=1AI87k5+0vVTk4
	8bQkUeibaa9wan1D4GKl7EC409yJNZlaJk509oZmuEDtpEBPCsJbECaL2IyqU2W5N56YT3hNJPjtR
	8YQEqdQsbxsquZTGtA3l7s/RdU6z0N6W7REXw+//wlyaMUZfAggx5eB981uzBU0huwunuj/tuFr5Z
	3Zd79TjgrkE3tgLvlVASwMu9OWUbIJH1j99M7EbNaWZEsWMqpSLxht2+kbQFvsfQp4IgVCjN1+/Eo
	WdsO05i7wG9/U9eDX/yDWRvsXA9J7ZP6Ka+YXsG2QiGjU1u3L/GZMTHXgYTTAfxN7wHxLbKwJUW55
	fBJIPufseXwMBoPazbeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm2N0-0086Kx-4S; Tue, 03 May 2022 23:55:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm2Mx-0086Jd-DT
 for linux-riscv@lists.infradead.org; Tue, 03 May 2022 23:55:52 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nm2Mp-0004gB-UB; Wed, 04 May 2022 01:55:43 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: krzk+dt@kernel.org, palmer@dabbelt.com, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 palmer@rivosinc.com, arnd@arndb.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 8/8] riscv: dts: microchip: add the sundance polarberry
Date: Wed, 04 May 2022 01:55:42 +0200
Message-ID: <3101012.5fSG56mABF@phil>
In-Reply-To: <20220501192557.2631936-9-mail@conchuod.ie>
References: <20220501192557.2631936-1-mail@conchuod.ie>
 <20220501192557.2631936-9-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_165551_506111_239CBB38 
X-CRM114-Status: GOOD (  16.50  )
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

Am Sonntag, 1. Mai 2022, 21:25:59 CEST schrieb Conor Dooley:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add a minimal device tree for the PolarFire SoC based Sundance
> PolarBerry.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

[...]

> diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
> new file mode 100644
> index 000000000000..96ec589d1571
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020-2022 Microchip Technology Inc */
> +
> +/dts-v1/;
> +
> +#include "mpfs.dtsi"
> +#include "mpfs-polarberry-fabric.dtsi"
> +
> +/* Clock frequency (in Hz) of the rtcclk */
> +#define MTIMER_FREQ	1000000
> +
> +/ {
> +	model = "Sundance PolarBerry";
> +	compatible = "sundance,polarberry", "microchip,mpfs";
> +
> +	aliases {
> +		serial0 = &mmuart0;
> +		ethernet0 = &mac1;

I guess you could sort them alphabetically (ethernet above serial0)

> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	cpus {
> +		timebase-frequency = <MTIMER_FREQ>;
> +	};
> +
> +	ddrc_cache_lo: memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x0 0x2e000000>;
> +		status = "okay";

"okay" is implied I think, so when you only add the node
here, you probably don't need to specify the status.

> +	};
> +
> +	ddrc_cache_hi: memory@1000000000 {
> +		device_type = "memory";
> +		reg = <0x10 0x00000000 0x0 0xC0000000>;
> +		status = "okay";
> +	};
> +};
> +
> +&refclk {
> +	clock-frequency = <125000000>;
> +};
> +
> +&mmuart0 {
> +	status = "okay";
> +};
> +
> +&mmc {
> +	status = "okay";

having the status property last (below sd-uhssdr104) can be helpful
for readability, as readers would know where to expect it.

> +	bus-width = <4>;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	cap-mmc-highspeed;
> +	card-detect-delay = <200>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +};
> +
> +&mac1 {
> +	status = "okay";
> +	phy-mode = "sgmii";
> +	phy-handle = <&phy1>;
> +	phy1: ethernet-phy@5 {
> +		reg = <5>;
> +		ti,fifo-depth = <0x01>;
> +	};
> +	phy0: ethernet-phy@4 {
> +		reg = <4>;
> +		ti,fifo-depth = <0x01>;
> +	};
> +};
> +
> +&mac0 {
> +	status = "disabled";

mac0 is already disabled in the mpfs.dtsi, so you either don't
need to duplicate it here, or if it's a reminder of something,
I guess a comment for the "why" would be helpful.

> +	phy-mode = "sgmii";
> +	phy-handle = <&phy0>;
> +};
> +
> +&rtc {
> +	status = "okay";
> +};
> +
> +&mbox {
> +	status = "okay";
> +};
> +
> +&syscontroller {
> +	status = "okay";
> +};

My personal preference would be alphabetical sorting also for
phandles, so

&mac0 {}
&mac1 {}
&mbox {}
&refclk {}
&rtc {}

etc - makes finding things a lot easier in the long run
especially when files get longer.


Heiko




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
