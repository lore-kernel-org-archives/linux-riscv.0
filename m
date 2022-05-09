Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C10BC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 11:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3IOPH2DRoM9mPUvsvZHwiZfuj4p0fDDtHesa24hH7M=; b=xRhLdW/iG+lfYI
	qDw9xAYHr84ir1iMySVwmdtAFZ2j+pdtNPAVr4b0hrn/hP4d8vcf66RB+ws9lAg0kNIMxC4nhD7iQ
	POgYBo8gcYb19q2A4zq3nhxnDFF11pQjR+qJi2IVBowHAoRl33rNDZsVy5KJfV3zc1Ldn0wHM5ms/
	OUkli05rw9L+HGiSvQwKZ8BdirJ9YXX50Brs+5ft4t2aqprwdH3tIznvetKqHrnz4+ke+mDsQEMQj
	PasMPMjtGpSSGdOOqNN1S1osXTIrG4TmD3xhVrVuuTJWt+oXkbIVPNbFJtCbqmoen60AbSTpj1+Jz
	oTqm33ogxyyK1vaPpBNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no1Hb-00E0MR-St; Mon, 09 May 2022 11:10:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no1HX-00E0JM-UA
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 11:10:29 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1no1HJ-0005hU-GK; Mon, 09 May 2022 13:10:13 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: krzk+dt@kernel.org, palmer@dabbelt.com, robh+dt@kernel.org,
 Conor Dooley <mail@conchuod.ie>
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 palmer@rivosinc.com, arnd@arndb.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 8/8] riscv: dts: microchip: add the sundance polarberry
Date: Mon, 09 May 2022 13:10:12 +0200
Message-ID: <8060906.T7Z3S40VBb@diego>
In-Reply-To: <20220504203051.1210355-9-mail@conchuod.ie>
References: <20220504203051.1210355-1-mail@conchuod.ie>
 <20220504203051.1210355-9-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_041028_033200_E90E5098 
X-CRM114-Status: GOOD (  23.45  )
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

Am Mittwoch, 4. Mai 2022, 22:30:52 CEST schrieb Conor Dooley:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add a minimal device tree for the PolarFire SoC based Sundance
> PolarBerry.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/Makefile        |  1 +
>  .../dts/microchip/mpfs-polarberry-fabric.dtsi | 16 +++
>  .../boot/dts/microchip/mpfs-polarberry.dts    | 97 +++++++++++++++++++
>  3 files changed, 114 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
>  create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
> 
> diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
> index af3a5059b350..39aae7b04f1c 100644
> --- a/arch/riscv/boot/dts/microchip/Makefile
> +++ b/arch/riscv/boot/dts/microchip/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
> +dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
>  obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .o, $(dtb-y))
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
> new file mode 100644
> index 000000000000..49380c428ec9
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020-2022 Microchip Technology Inc */
> +
> +/ {
> +	fabric_clk3: fabric-clk3 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <62500000>;
> +	};
> +
> +	fabric_clk1: fabric-clk1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <125000000>;
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
> new file mode 100644
> index 000000000000..1cad5b0d42e1
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
> @@ -0,0 +1,97 @@
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
> +		ethernet0 = &mac1;
> +		serial0 = &mmuart0;
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
> +	};
> +
> +	ddrc_cache_hi: memory@1000000000 {
> +		device_type = "memory";
> +		reg = <0x10 0x00000000 0x0 0xC0000000>;
> +	};
> +};
> +
> +/*
> + * phy0 is connected to mac0, but the port itself is on the (optional) carrier
> + * board.
> + */
> +&mac0 {
> +	status = "disabled";
> +	phy-mode = "sgmii";
> +	phy-handle = <&phy0>;

nit: it makes it was easier recognizing the status if it's in the
same place all the time (for example as the last property)
like in &mmc below.

Though that may just be my preference ;-) .
The other option would be to adhere to stricter sorting
because right now status is neither in one place nor sorted.


> +};
> +
> +&mac1 {
> +	status = "okay";
> +	phy-mode = "sgmii";
> +	phy-handle = <&phy1>;

nit (1): same as above
nit (2): blank line between properties and subnodes makes
  everything more readable.

> +	phy1: ethernet-phy@5 {
> +		reg = <5>;
> +		ti,fifo-depth = <0x01>;
> +	};

nit: blank line?

Otherwise:
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> +	phy0: ethernet-phy@4 {
> +		reg = <4>;
> +		ti,fifo-depth = <0x01>;
> +	};
> +};
> +
> +&mbox {
> +	status = "okay";
> +};
> +
> +&mmc {
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
> +	status = "okay";
> +};
> +
> +&mmuart0 {
> +	status = "okay";
> +};
> +
> +&refclk {
> +	clock-frequency = <125000000>;
> +};
> +
> +&rtc {
> +	status = "okay";
> +};
> +
> +&syscontroller {
> +	status = "okay";
> +};
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
