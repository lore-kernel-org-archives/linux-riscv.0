Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC9EC6FA89
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 18:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lGySIbrjZ06C/x1arXOmHWuA+ZCPDXsuWaMuGIlL9BQ=; b=4Yd8diWq81pniL
	4lrQr89t9G+vTYw2Z6fCmRbjFbvfiXWSl5wt9hOIltnpAvoUo8J9EnFFRP0QjMtoG8+GMK3rHOzPf
	GU0nP+abJEvKEk45ILASdbQv0yTyHgIbwIi5ZeataNciEmrrxeCQtTzb6k/UB3jsroLqiF7Qho2dp
	fYw72KT7QD1lcqGQfZQbVlo6Bake5eInVEWXRIAdDrKt2MWolh1pIjWrpYOa5qKa35x2MghV+NrnV
	jha1xZHT2XK7P2a04fnMbRmII0e/iZ/pLIfaYvWEkBD9AcQH9EkcLwVokpSAZ08S/bTvaVjTaYHTM
	YD7yO3bl+lOfbHK05oYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQs-00FUU2-9Y; Thu, 15 Sep 2022 18:17:50 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQk-00FU7y-OZ
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 18:17:46 +0000
Received: by mail-wr1-x436.google.com with SMTP id g3so11214110wrq.13
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 11:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=O2VLizPOFB8Cw4tUD1XPYg1pr+6HOsBm1gy7frAi+N8=;
        b=WjEv3HYvp+P8hT/A+r1RHj7K0WdkUmFxq4Bph7B8aE9nk4YmAVR9Vtjz/ZxaZ/PgLb
         L1oReoZcG1UW51RdkDI6kB74J1mO0ellGTLUMWnfInG8EE8wayZCH/xablk2X+MAk6he
         UZKTly33tWVbNozQhmhTiyQ0c+U1xruHTxKVB/H3q5vMRRAxI8GSp6vmjDw/o/fDYV5C
         BcK73vgZCXhaswM6xzcG/7PyQfAg3Wz3HX8Juf319Vs1RmZL3MkjXaD4bgSt2E6tnqW/
         1vuOjUF6Cgoapvz2zrDrd9AR7nJwL+YPuf/iSQCwB1gvFvDJKpSgm1cYS5uA1vW/PXgV
         Ouog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=O2VLizPOFB8Cw4tUD1XPYg1pr+6HOsBm1gy7frAi+N8=;
        b=wOPUI/+jFoV3ukFPkINYXiy1fqZILsX8oYsQgO2I2sKRAPRqko9vGQ+UxjOHSZlyM9
         tsODDrRcQ2I7NkOqzs/u5eY/Hlho1iEb+i1oSi6P5JAriwF6ahDa1frBQdmNZieI+BYr
         WCUZey5iK790pMBQPD5EFfq360Ta9whft7HW3BNVN5PtzGQ6ppwsu/+3RiCOffF4Yu0O
         xOQx6L4tvMWX9sTRU9JmddeLSLP2zZaJEYcn7PcRmAKQKI0TkV2e2gy359Sv3fy3N2yU
         Yl38K3qp03SdlcYmtGk9OnmWaKKvgKpotN4cYo7pFRgNKMTbWkIIC8I5+S3zIiM3Hu8h
         2zaw==
X-Gm-Message-State: ACrzQf2FqolL1lJRBbkLITUbCCo0Zspf7/oUdVg94lTC77GmPEGTUTkl
	6rhLCE42UZk1XiYbR7nFXoU=
X-Google-Smtp-Source: AMsMyM4GZLek6Dbkaa0Gg6W0uuQfJsrc32TNRUf+JpBGN81tL3eR5A97hx5L6vwOK3q4FrzRhi6RpA==
X-Received: by 2002:a05:6000:178c:b0:222:f8ec:9977 with SMTP id e12-20020a056000178c00b00222f8ec9977mr569349wrg.509.1663265854886;
        Thu, 15 Sep 2022 11:17:34 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d411:a48b:4035:3d98])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b003b47e8a5d22sm4243151wmq.23.2022.09.15.11.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 11:17:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 06/10] riscv: dts: renesas: Add initial devicetree for Renesas RZ/Five SoC
Date: Thu, 15 Sep 2022 19:15:54 +0100
Message-Id: <20220915181558.354737-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_111742_948772_EFA0BE31 
X-CRM114-Status: GOOD (  14.67  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
Single).

Below is the list of IP blocks added in the initial SoC DTSI which can be
used to boot via initramfs on RZ/Five SMARC EVK:
- AX45MP CPU
- CPG
- PINCTRL
- PLIC
- SCIF0
- SYSC

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v2->v3
* Fixed clock entry for CPU core
* Fixed timebase frequency to 12MHz
* Fixed sorting of the nodes
* Included RB tags

v1->v2
* Dropped including makefile change
* Updated ndev count
---
 arch/riscv/boot/dts/renesas/r9a07g043.dtsi | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043.dtsi

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
new file mode 100644
index 000000000000..fb6733f3cc2b
--- /dev/null
+++ b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/Five SoC
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/r9a07g043-cpg.h>
+
+/ {
+	compatible = "renesas,r9a07g043";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <12000000>;
+
+		ax45mp: cpu@0 {
+			compatible = "andestech,ax45mp", "riscv";
+			device_type = "cpu";
+			reg = <0x0>;
+			status = "okay";
+			riscv,isa = "rv64imafdc";
+			mmu-type = "riscv,sv39";
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <0x40>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <0x40>;
+			clocks = <&cpg CPG_CORE R9A07G043_CLK_I>;
+
+			cpu0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+	};
+
+	/* clock can be either from exclk or crystal oscillator (XIN/XOUT) */
+	extal_clk: extal-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&plic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		scif0: serial@1004b800 {
+			compatible = "renesas,scif-r9a07g043",
+				     "renesas,scif-r9a07g044";
+			reg = <0 0x1004b800 0 0x400>;
+			interrupts = <412 IRQ_TYPE_LEVEL_HIGH>,
+				     <414 IRQ_TYPE_LEVEL_HIGH>,
+				     <415 IRQ_TYPE_LEVEL_HIGH>,
+				     <413 IRQ_TYPE_LEVEL_HIGH>,
+				     <416 IRQ_TYPE_LEVEL_HIGH>,
+				     <416 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A07G043_SCIF0_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G043_SCIF0_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		cpg: clock-controller@11010000 {
+			compatible = "renesas,r9a07g043-cpg";
+			reg = <0 0x11010000 0 0x10000>;
+			clocks = <&extal_clk>;
+			clock-names = "extal";
+			#clock-cells = <2>;
+			#reset-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
+		sysc: system-controller@11020000 {
+			compatible = "renesas,r9a07g043-sysc";
+			reg = <0 0x11020000 0 0x10000>;
+			status = "disabled";
+		};
+
+		pinctrl: pinctrl@11030000 {
+			compatible = "renesas,r9a07g043-pinctrl";
+			reg = <0 0x11030000 0 0x10000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			gpio-ranges = <&pinctrl 0 0 152>;
+			clocks = <&cpg CPG_MOD R9A07G043_GPIO_HCLK>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G043_GPIO_RSTN>,
+				 <&cpg R9A07G043_GPIO_PORT_RESETN>,
+				 <&cpg R9A07G043_GPIO_SPARE_RESETN>;
+		};
+
+		plic: interrupt-controller@12c00000 {
+			compatible = "renesas,r9a07g043-plic", "andestech,nceplic100";
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			riscv,ndev = <512>;
+			interrupt-controller;
+			reg = <0x0 0x12c00000 0 0x400000>;
+			clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
+			interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9>;
+		};
+	};
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
