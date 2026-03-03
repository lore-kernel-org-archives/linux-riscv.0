Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BF6EB3649
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 01:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+RotmOFIrnMvG3oE8irN8MhZ+zWlbb6ddypARU5bAw=; b=QSgqfB1EUmil2b
	1aMIXU2aG8lLuMKDdpTBs+vVqRLuFnisZ/qzQ/PzYi1SX4Ns5LVT2Q5gVeZz5wVVsRhxyzrtL3f85
	wKLf+Ea4jRSa9i6Ck5Jrt1cJ9k+mjIh8WmsZ3GG6aES0gc/W3hEuTM2Bm3vmw1bXdWl5CtVapN2Dq
	92+ol6BBZGDz4VqH2Vzl8G9kADrdvm2u0AI4yAVbGHe1d4qpmuRRxbGlEWWN+egvpPukdBffPaa5Q
	Uyd6f7COtS6kOw09bHtzpp9MVRhLt0oZNqcmec6LSwlxp0ZIk0OO7TBr8i6EeEzzqFyaSQSIbJrtl
	SbUG2oEAz3WpRwrXqTGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEBQ-0000000EIjn-1aNz;
	Tue, 03 Mar 2026 01:04:20 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEBM-0000000EIiw-3fre
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 01:04:18 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-82735a41985so3012978b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 17:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772499855; x=1773104655; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LJfO34USsvCpv1UH9qU1hYEgkmphxj2R3COc9IPiZ2A=;
        b=i6tzsqFMOk0T2icnjPQLYkEFd/iRYllSxgtRwVd26NaasO7eGTcizHh6t/K46iiLf3
         Ldud/Hh20Kitop85f9b/DYXkXZIaJQkVkevY8mDErveKH9QvvLTNkvxbBPSi/zm7XKDV
         0wWqZBtMbsahsWCYawltPlfq6xTYEroAvfjdv8NQbepSh7hDpBi6AXm6nLu+8sjLrES8
         Q0vha9+fNyhn1rMJa6GlNoLP8/NldNNMG0RVRhxt7Qsy+1SHJJsJylbyMHNI3S5XiBq9
         aBvt8ROAEktDxX0df8MmAv8Orb0Mina0zrl62Sfkggvn6kUsPq69z6UTSmmkadvmhOl6
         CBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772499855; x=1773104655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJfO34USsvCpv1UH9qU1hYEgkmphxj2R3COc9IPiZ2A=;
        b=kAYQc1e/UsjlRmZAPE/lwQrGtNXepzOELsZobKtmBiO+Dn5w8BpZU+CWwI8hv0hrRY
         S3NLIw032K8h3J7EqB61PfQEYKaO8dOoOm+E2qf8s7BH7uUvfZO3bLFm9A8JfRFl3S7m
         BaO/F2YZwcgYVvzGGZv35I3BjExn3tKHOg4M70+yfqW5gxpFRDc5rwcqhRDgNuvm7BDw
         4MXorWKNHmNM8gtbJcDF3frMozFa6L1VLuh3AsaqRcabMefqgmfSGUwL9yFJ4pbY+0m2
         WdJubjyal3JL0BgihgcxgROxNrzHMtu9iKPILS9NJzrnY1J0+9aeAr4Qx9cETuvUS2vP
         jwyw==
X-Forwarded-Encrypted: i=1; AJvYcCXU/wup0//NSp42mlp1LF9wQy3oiaaklmA3TDQ2dGry+w1O3U14ygfoXZvOrSiJYhSKjWNoy7TqITRUHg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4tov/mXSLFaSHOZY9PGTYxa+d24z8SJV3H4tuTpQ/K4OTgx7R
	kTLZcTJicj7urxEfw8JNwqNgdI/msdDmF5YZMmOv8Y0D/tUEO36rqkP7
X-Gm-Gg: ATEYQzyWsdXWC2HpJlqXoEDt+5iUs6v3VM2+AeZhX/loC4hOPL/DHv0XOu+9dMtxC/m
	kHH7FCsnfYArSj1H+AP3gaet0NaV6gh2utmIlEoaZg1GVlAnUNdMSMsCy8FetPKHoYnn6mQ9FDF
	ybFgE8oxB8zj2u6wFFzoPr2LvN/7Iamey1eJeQSEN3xQMhGumpnew8aIe0sH7CbEIeC837Shw85
	97gFR3IFDaApmcqye9OvEL/uIMj+1hTMr/tLU9A8QH8WYQVLq4UfpbYGx96CIDKVH4aiTsFCjsq
	yBu62lw99Hc8ggPqMobRnbLbf318v7WkJsyBeu7x77/2P4bghBkMLgm73O4iyRajImscQrQ4F/t
	PC0zGeAn+ke7jRA7239WkUFUTgL34R8qZPM2R1b9hcf0rOgQbPAnF+07UM6c0OVIPx6NqbhoE+x
	C1hLP3Mr9s24hnnQAI/uxkQA==
X-Received: by 2002:a17:90b:578d:b0:343:e2ba:e8be with SMTP id 98e67ed59e1d1-35965c3c945mr12250080a91.10.1772499855342;
        Mon, 02 Mar 2026 17:04:15 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c49eb5bsm361668a91.11.2026.03.02.17.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 17:04:14 -0800 (PST)
Date: Tue, 3 Mar 2026 09:03:46 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
	Conor Dooley <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v5 0/3] riscv: spacemit: Add ethernet support
 for K3
Message-ID: <aaYyUAaz7cSnBXl9@inochi.infowork>
References: <20260227075718.2243818-1-inochiama@gmail.com>
 <CAJM55Z_soPhC9P03edfq_A-GN07PbGqu31aHgE_5kKhkQwkMmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z_soPhC9P03edfq_A-GN07PbGqu31aHgE_5kKhkQwkMmQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_170416_932645_E678DF4A 
X-CRM114-Status: GOOD (  22.76  )
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

On Mon, Mar 02, 2026 at 08:08:59AM -0500, Emil Renner Berthing wrote:
> Quoting Inochi Amaoto (2026-02-27 08:57:14)
> > Add initial support for ethernet controller of the Spacemit K3 SoC.
> > This ethernet controller is almost a standard Synopsys DesignWare
> > MAC (version 5.40a). This controller require a syscon device to
> > configure some basic features, like interface type and internal delay.
> 
> I don't know how we can accept this when it can't be tested since it still
> doesn't come with the device tree nodes. If you don't want it to be part of the
> series, just share a tree where this code is working. There are plenty of free
> public git hosting sites available.
> 

It seems like you have not read my reply before, I was forbidden from
opening other's patch. So some dependency can not be satisfied. For me,
the only thing I can open is the ethernet device node. The other things,
like clock, pinctrl and gpio devices. You should collect by yourself and
I can not provide.

Here is the ethernet DTS patch

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b691304d4b74..1dfeef564ef3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -5,6 +5,7 @@
  */
 
 #include "k3.dtsi"
+#include "k3-pinctrl.dtsi"
 
 / {
 	model = "SpacemiT K3 Pico-ITX";
@@ -24,6 +25,25 @@ memory@100000000 {
 	};
 };
 
+&eth0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_cfg>;
+
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy0>;
+	status = "okay";
+
+	mdio {
+		phy0: phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
new file mode 100644
index 000000000000..aa8e7cfd7efe
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/gpio/gpio.h>
+
+#define K3_PADCONF(pin, func) (((pin) << 16) | (func))
+
+&pinctrl {
+	gmac0_cfg: gmac0-cfg {
+		/* Base pins: - Used by RMII directly */
+		gmac0_base_pins: gmac0-0-pins {
+			pinmux = <K3_PADCONF(0, 1)>,
+				 <K3_PADCONF(1, 1)>,
+				 <K3_PADCONF(2, 1)>,
+				 <K3_PADCONF(3, 1)>,
+				 <K3_PADCONF(6, 1)>,
+				 <K3_PADCONF(7, 1)>,
+				 <K3_PADCONF(11, 1)>,
+				 <K3_PADCONF(12, 1)>,
+				 <K3_PADCONF(13, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		/* RGMII extra pins: add on top of base pins */
+		gmac0_rgmii_add_pins: gmac0-1-pins {
+			pinmux = <K3_PADCONF(4, 1)>,
+				 <K3_PADCONF(5, 1)>,
+				 <K3_PADCONF(8, 1)>,
+				 <K3_PADCONF(9, 1)>,
+				 <K3_PADCONF(10, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		/* Optional int pins */
+		gmac0_int_pins: gmac0-3-pins {
+			pinmux = <K3_PADCONF(14, 1)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+
+		gmac0-6-pins {
+			pinmux = <K3_PADCONF(15, 0)>;
+
+			bias-disable;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 6cc31e94c13a..066006826e92 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/clock/spacemit,k3-clocks.h>
+#include <dt-bindings/reset/spacemit,k3-resets.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 /dts-v1/;
@@ -437,6 +438,112 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		gmac_axi_setup: stmmac-axi-config {
+			snps,wr_osr_lmt = <0xf>;
+			snps,rd_osr_lmt = <0xf>;
+			/* max axi burst len is 256 */
+			snps,blen = <256 128 64 32 16 0 0>;
+		};
+
+		eth0: ethernet@cac80000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac80000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC0_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC0_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC0_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupt-parent = <&saplic>;
+			interrupts = <131 IRQ_TYPE_LEVEL_HIGH>,
+				     <276 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC0>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x3e4 0x3e8>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		eth1: ethernet@cac82000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac82000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC1_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC1_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC1_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupt-parent = <&saplic>;
+			interrupts = <133 IRQ_TYPE_LEVEL_HIGH>,
+				     <277 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC1>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x3ec 0x3f0>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		eth2: ethernet@cac8e000 {
+			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+			reg = <0x0 0xcac8e000 0x0 0x2000>;
+			clocks = <&syscon_apmu CLK_APMU_EMAC2_BUS>,
+				 <&syscon_apmu CLK_APMU_EMAC2_1588>,
+				 <&syscon_apmu CLK_APMU_EMAC2_RGMII_TX>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			interrupt-parent = <&saplic>;
+			interrupts = <130 IRQ_TYPE_LEVEL_HIGH>,
+				     <278 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			resets = <&syscon_apmu RESET_APMU_EMAC2>;
+			reset-names = "stmmaceth";
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <4096>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+			snps,force_sf_dma_mode;
+			snps,axi-config = <&gmac_axi_setup>;
+			spacemit,apmu = <&syscon_apmu 0x248 0x24c>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k3-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
-- 
2.53.0

Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
