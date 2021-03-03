Return-Path: <SRS0=/aKF=IC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F1BC433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 00:54:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F065D64EC4
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 00:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F065D64EC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RPHvo6rFfJD71/bNaCze550PH5KhHcAwa5BkWUoMbJU=; b=bgyFizjHA67Ih9V1SLFGnjwYW
	6y3H7eBBJruJ+vJqibla5oH6rj5xJUeORxGGkvEkOKfx08yXZpr2fo1QOSokWgu0YJPRVVduJDsJ/
	c0tD1PZfj47/adsh0ChahMT4O1oL/GwkIykYhTic/BeHBgMePTjoeVrze0m8bFwQTj7Rv5tyGyx50
	wAMWXGd8VNIIIVKD5tbaWPfGVIvY6wNcWBUJjOW5NJYvSnLX9oelJUKSL35OqzgoMgQwVwd/drrpp
	aUEKXcOm/aPITplBmaoN7zXpvMcl7qYZ3aKevUflS3BW5YGKM866H/xnwPK6XdZ3qGEVhkPf7Go+J
	j9wXw20pQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHcF0-007FHk-Pn; Thu, 04 Mar 2021 00:53:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXmr-006MHg-3W
 for linux-riscv@desiato.infradead.org; Wed, 03 Mar 2021 20:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ue6EK2Wvo4V0EjR6OH04CfPfN7tQVDCbARloJ/6oZEg=; b=Gs871Hnwp7Uq8+WYuTgQklzTlc
 95jGhwa9+wuiXZfJFVZoKminNd/bAArW8EAqglvA1xvnaJOZ8/k+cr9pV1SaBA8w7I11c2i6Nf1fy
 0HJrNnE7KBhB1uh6DDGhwiFgyUrNjgUEflMe+IHR9SmqOjQVjOBo9kXN3nYBnwTWStskXS+eWeJ2T
 BLlcv7QO+Pj7v14Mz7AGs8KWK+rwW1qoagb/JdyvHSmW4OVEW384bcxzazdcsMLmq6ButGXSpDSlb
 bODvPgtQkrc6lI8zYsl8YByjreKg9+6vsGZQo1GUl4Zy0runqjH2/rX9ZDS9vVaIE3vd6MBAvBv18
 4kjUmJhQ==;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXmf-0041Eb-Oj
 for linux-riscv@lists.infradead.org; Wed, 03 Mar 2021 20:07:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614802069; x=1646338069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m1gWBmlFWCSrPX0EbyuLB9CVl6BjYMXJwMSjxYidaAk=;
 b=dszRdzhRKCgG6Qt5QQi9mHVHciohtrJ31B4sha8xmCwKj9FXLHes5Bb1
 Wg571kDp+a0mrQAMG7OCgidBpEBOn4GDLT2KYputyN7G7Ee8E6xuHsweR
 mmYHLc3WBKNZcrU67fIbuo7e9/30ImP8AwrF+3cU2hmex9rdlA7n/NcDd
 QiXjbDXMrE7r84NZ9Yiyp2C0VeUAe006EU6LbLo3tchQHEyHIBhkuOhhh
 OGgTnn5IdzxcVq7CIxkB0Tvwqgygx/JD8HW6RrCIBKf5S2zcaXl6zHCr4
 rLuEVhpo8ai9ft68Gb+ik4n0Y4LOSddHvsEA+VbD0r7zkCZDfv9gXjaCf Q==;
IronPort-SDR: 4TSLtOHUqtxylK32wkdlQMHZAm+XuxnU2QAhen08bqfoNTu20lnzun0eneD9QlxxdbaMxH6Kva
 U5LfmWbzWvX+bOEow08ACfiAWZti9E2fNO7qRvN9xnOXvZUbUOkyX9ma4vnLsdz+JEzKMQv2Da
 E4X1VCuZefmSTVk1iNf8DuaD1brVkJr/ha+ysOVuwr/Nd/Pat7QEMpB00H0zuJNfqRY5CLvGgG
 ryVwgt1Jy4S2OJOI/YP97JU3Zy1jAsfXPy+ReZKjIVF/RA05/8hsoLkggxxWXg8QDCM0Vy0oVM
 9Ek=
X-IronPort-AV: E=Sophos;i="5.81,220,1610380800"; d="scan'208";a="271907150"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 04:06:59 +0800
IronPort-SDR: XwrS9RdGr6H0leamQphAsK6hABvJX5eE1Fsku0XaUv66YTwAfIM6+tpVTPc0t9AkcNBXfQnQYd
 +1dsB+cVUbQamvAkqM/glvqM4EkaRcN10bdNqVWbLoMItaNh8nBu43cxsG/tNjxxM+UpNQtYO9
 UgUmlkbJlXskcgjvwiITK7/ADdDvikgWotJPVNzA9qZsO9IR/zEAgQ8xXjiG6CzdYRvjxrpMWS
 DTIrMshik07WOL3ydFrl9HEsoZjszk8uLMOETx+77FZB4pAuFkLDAnh+51Us3BZLgyVa04HN4H
 gw8J8VXmf676Tlr7IHwGjSiQ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 11:48:13 -0800
IronPort-SDR: nK34yjfuUZmSoHl02fsbBygD8ZPrGnmTDCLLeu3mva0TNwhoWxE1fLc5/ZWQ4rz55MTMmODTlx
 VyGrtKZlURnBEnsgzS9QTA/59EMRFrCj9k8FfBL4tst+iBL7Bps/PTEqse2QwHCIFrcNzFzOLQ
 hcMbC5wKLQWcMbXkK/rCHRFFRBJKiGrXvITunmwXihoc2K9tayXkl633AL1PdP5WgLNoXKKQeq
 1lqLvac77LnFBFLNz8mlv4KLrmBSixcx5e0G9lveN6ozjT+gLhpvNRxSRLCh3UK1XN86jkr02M
 IX4=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Mar 2021 12:06:59 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Conor.Dooley@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Ivan.Griffin@microchip.com, Lewis.Hanly@microchip.com
Subject: [PATCH v4 3/5] RISC-V: Initial DTS for Microchip ICICLE board
Date: Wed,  3 Mar 2021 12:02:51 -0800
Message-Id: <20210303200253.1827553-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303200253.1827553-1-atish.patra@wdc.com>
References: <20210303200253.1827553-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_200752_625789_A6F29361 
X-CRM114-Status: GOOD (  13.22  )
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

Add initial DTS for Microchip ICICLE board having only
essential devices (clocks, sdhci, ethernet, serial, etc).
The device tree is based on the U-Boot patch.

https://patchwork.ozlabs.org/project/uboot/patch/20201110103414.10142-6-padmarao.begari@microchip.com/

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/microchip/Makefile        |   2 +
 .../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 329 ++++++++++++++++++
 4 files changed, 404 insertions(+)
 create mode 100644 arch/riscv/boot/dts/microchip/Makefile
 create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
 create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 7ffd502e3e7b..fe996b88319e 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += sifive
 subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
+subdir-y += microchip
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
new file mode 100644
index 000000000000..622b12771fd3
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += microchip-mpfs-icicle-kit.dtb
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
new file mode 100644
index 000000000000..ec79944065c9
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2020 Microchip Technology Inc */
+
+/dts-v1/;
+
+#include "microchip-mpfs.dtsi"
+
+/* Clock frequency (in Hz) of the rtcclk */
+#define RTCCLK_FREQ		1000000
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "Microchip PolarFire-SoC Icicle Kit";
+	compatible = "microchip,mpfs-icicle-kit";
+
+	chosen {
+		stdout-path = &serial0;
+	};
+
+	cpus {
+		timebase-frequency = <RTCCLK_FREQ>;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x40000000>;
+		clocks = <&clkcfg 26>;
+	};
+
+	soc {
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
+
+&serial1 {
+	status = "okay";
+};
+
+&serial2 {
+	status = "okay";
+};
+
+&serial3 {
+	status = "okay";
+};
+
+&sdcard {
+	status = "okay";
+};
+
+&emac0 {
+	phy-mode = "sgmii";
+	phy-handle = <&phy0>;
+	phy0: ethernet-phy@8 {
+		reg = <8>;
+		ti,fifo-depth = <0x01>;
+	};
+};
+
+&emac1 {
+	status = "okay";
+	phy-mode = "sgmii";
+	phy-handle = <&phy1>;
+	phy1: ethernet-phy@9 {
+		reg = <9>;
+		ti,fifo-depth = <0x01>;
+	};
+};
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
new file mode 100644
index 000000000000..b9819570a7d1
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -0,0 +1,329 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2020 Microchip Technology Inc */
+
+/dts-v1/;
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "Microchip MPFS Icicle Kit";
+	compatible = "microchip,mpfs-icicle-kit";
+
+	chosen {
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			clock-frequency = <0>;
+			compatible = "sifive,e51", "sifive,rocket0", "riscv";
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <16384>;
+			reg = <0>;
+			riscv,isa = "rv64imac";
+			status = "disabled";
+
+			cpu0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+
+		cpu@1 {
+			clock-frequency = <0>;
+			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			reg = <1>;
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+			status = "okay";
+
+			cpu1_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+
+		cpu@2 {
+			clock-frequency = <0>;
+			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			reg = <2>;
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+			status = "okay";
+
+			cpu2_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+
+		cpu@3 {
+			clock-frequency = <0>;
+			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			reg = <3>;
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+			status = "okay";
+
+			cpu3_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+
+		cpu@4 {
+			clock-frequency = <0>;
+			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			reg = <4>;
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+			status = "okay";
+			cpu4_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		cache-controller@2010000 {
+			compatible = "sifive,fu540-c000-ccache", "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <1024>;
+			cache-size = <2097152>;
+			cache-unified;
+			interrupt-parent = <&plic>;
+			interrupts = <1 2 3>;
+			reg = <0x0 0x2010000 0x0 0x1000>;
+		};
+
+		clint@2000000 {
+			compatible = "sifive,clint0";
+			reg = <0x0 0x2000000 0x0 0xC000>;
+			interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
+						&cpu1_intc 3 &cpu1_intc 7
+						&cpu2_intc 3 &cpu2_intc 7
+						&cpu3_intc 3 &cpu3_intc 7
+						&cpu4_intc 3 &cpu4_intc 7>;
+		};
+
+		plic: interrupt-controller@c000000 {
+			#interrupt-cells = <1>;
+			compatible = "sifive,plic-1.0.0";
+			reg = <0x0 0xc000000 0x0 0x4000000>;
+			riscv,ndev = <186>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 11
+					&cpu1_intc 11 &cpu1_intc 9
+					&cpu2_intc 11 &cpu2_intc 9
+					&cpu3_intc 11 &cpu3_intc 9
+					&cpu4_intc 11 &cpu4_intc 9>;
+		};
+
+		dma@3000000 {
+			compatible = "sifive,fu540-c000-pdma";
+			reg = <0x0 0x3000000 0x0 0x8000>;
+			interrupt-parent = <&plic>;
+			interrupts = <23 24 25 26 27 28 29 30>;
+			#dma-cells = <1>;
+		};
+
+		refclk: refclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <600000000>;
+			clock-output-names = "msspllclk";
+		};
+
+		clkcfg: clkcfg@20002000 {
+			compatible = "microchip,mpfs-clkcfg";
+			reg = <0x0 0x20002000 0x0 0x1000>;
+			reg-names = "mss_sysreg";
+			clocks = <&refclk>;
+			#clock-cells = <1>;
+			clock-output-names = "cpu", "axi", "ahb", "envm",	/* 0-3   */
+				 "mac0", "mac1", "mmc", "timer",		/* 4-7   */
+				"mmuart0", "mmuart1", "mmuart2", "mmuart3",	/* 8-11  */
+				"mmuart4", "spi0", "spi1", "i2c0",		/* 12-15 */
+				"i2c1", "can0", "can1", "usb",			/* 16-19 */
+				"rsvd", "rtc", "qspi", "gpio0",			/* 20-23 */
+				"gpio1", "gpio2", "ddrc", "fic0",		/* 24-27 */
+				"fic1", "fic2", "fic3", "athena", "cfm";	/* 28-32 */
+		};
+
+		serial0: serial@20000000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x20000000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupt-parent = <&plic>;
+			interrupts = <90>;
+			current-speed = <115200>;
+			clocks = <&clkcfg 8>;
+			status = "disabled";
+		};
+
+		serial1: serial@20100000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x20100000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupt-parent = <&plic>;
+			interrupts = <91>;
+			current-speed = <115200>;
+			clocks = <&clkcfg 9>;
+			status = "disabled";
+		};
+
+		serial2: serial@20102000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x20102000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupt-parent = <&plic>;
+			interrupts = <92>;
+			current-speed = <115200>;
+			clocks = <&clkcfg 10>;
+			status = "disabled";
+		};
+
+		serial3: serial@20104000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x20104000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupt-parent = <&plic>;
+			interrupts = <93>;
+			current-speed = <115200>;
+			clocks = <&clkcfg 11>;
+			status = "disabled";
+		};
+
+		emmc: mmc@20008000 {
+			compatible = "cdns,sd4hc";
+			reg = <0x0 0x20008000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <88 89>;
+			pinctrl-names = "default";
+			clocks = <&clkcfg 6>;
+			bus-width = <4>;
+			cap-mmc-highspeed;
+			mmc-ddr-3_3v;
+			max-frequency = <200000000>;
+			non-removable;
+			no-sd;
+			no-sdio;
+			voltage-ranges = <3300 3300>;
+			status = "disabled";
+		};
+
+		sdcard: sdhc@20008000 {
+			compatible = "cdns,sd4hc";
+			reg = <0x0 0x20008000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <88>;
+			pinctrl-names = "default";
+			clocks = <&clkcfg 6>;
+			bus-width = <4>;
+			disable-wp;
+			cap-sd-highspeed;
+			card-detect-delay = <200>;
+			sd-uhs-sdr12;
+			sd-uhs-sdr25;
+			sd-uhs-sdr50;
+			sd-uhs-sdr104;
+			max-frequency = <200000000>;
+			status = "disabled";
+		};
+
+		emac0: ethernet@20110000 {
+			compatible = "cdns,macb";
+			reg = <0x0 0x20110000 0x0 0x2000>;
+			interrupt-parent = <&plic>;
+			interrupts = <64 65 66 67>;
+			local-mac-address = [00 00 00 00 00 00];
+			clocks = <&clkcfg 4>, <&clkcfg 2>;
+			clock-names = "pclk", "hclk";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		emac1: ethernet@20112000 {
+			compatible = "cdns,macb";
+			reg = <0x0 0x20112000 0x0 0x2000>;
+			interrupt-parent = <&plic>;
+			interrupts = <70 71 72 73>;
+			mac-address = [00 00 00 00 00 00];
+			clocks = <&clkcfg 5>, <&clkcfg 2>;
+			status = "disabled";
+			clock-names = "pclk", "hclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+	};
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
