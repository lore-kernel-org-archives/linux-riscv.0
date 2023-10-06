Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03C0E81DEE
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 12:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gvdf0W1+BhUoicMETlXf96EPamNAI+r8lQer6xn+nWc=; b=vj/dV5fW50/7+k
	KjjZYKpKFrWu/Va4GhmSzbUKF44HJSIgmFJh2ff/vsa08a3kkBchcjsorebtCsfY5dlzXckcSDMAW
	fkIweq8FXFTnUUf5lGvWJg8Xms7omQ8Gwhrk3s+JfAvYZQ+z2l3LFWB6VAlDLKpMTP3gEzyVMhaEa
	2MStXeGo9Adq3lFIa2rhZxStjC/1hNjo7IoK9pEP4/w3ZsTGaqn0vPGfvF7cIY5FsUhWTfhYd7Et2
	A/XsnA7bQtR97OkqWTQ40EinfDJbLNfeFHDEL+IhBFasVnea17GX38lWYXcwZZ+sIMHHDLsOGqUGK
	OS0E2RPH6wqKzZIfbeEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qojvG-005m63-0S;
	Fri, 06 Oct 2023 12:27:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qojvD-005m47-1F
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 12:27:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 28FDEB82885;
	Fri,  6 Oct 2023 12:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D96C433AD;
	Fri,  6 Oct 2023 12:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696595229;
	bh=bOf8w7XnCc16OPMA+e95RqpCtIBPs/nM95W8FKx64k0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NP80/FAHyJhx3j01yWIu134p/m29xD1K3Ijk8Or65OIPy+/vZg3qqkLuqI06ZtSa3
	 siQewwfwxXxIUr7ls+Z3ldqvWMoknqNIx/FWvcKpvh9MhN2eD3khDwWpi1o307/zyk
	 JhQx9m3LJN2HRuxoxQqPyiUCu5UEes+e3K+dMPGxLESsclqnPeKvvPoV5XpZ2RI2Ni
	 Ntw9A7qIFcvlL/0tfQw+3PCQg7eBrYZTnyS/7uUK8vSvP9Ht9t8lsa9GsN0Gyd4TMz
	 1r2VnN+YKlOIkzQ8MpwyuGpKdzKwWbi7dCPctPJGtcMteKfR7TOvH2FT466OQ3YmZn
	 lr3nvfYLaEPTg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>
Subject: [PATCH v2 4/5] riscv: dts: sophgo: add initial CV1800B SoC device tree
Date: Fri,  6 Oct 2023 20:14:48 +0800
Message-Id: <20231006121449.721-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231006121449.721-1-jszhang@kernel.org>
References: <20231006121449.721-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_052711_692240_6281A666 
X-CRM114-Status: GOOD (  11.03  )
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

Add initial device tree for the CV1800B RISC-V SoC by SOPHGO.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 123 ++++++++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1800b.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
new file mode 100644
index 000000000000..df40e87ee063
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "sophgo,cv1800b";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <25000000>;
+
+		cpu0: cpu@0 {
+			compatible = "thead,c906", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <65536>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+
+	osc: oscillator {
+		compatible = "fixed-clock";
+		clock-output-names = "osc_25m";
+		#clock-cells = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&plic>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		dma-noncoherent;
+		ranges;
+
+		uart0: serial@4140000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x04140000 0x100>;
+			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&osc>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart1: serial@4150000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x04150000 0x100>;
+			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&osc>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart2: serial@4160000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x04160000 0x100>;
+			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&osc>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart3: serial@4170000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x04170000 0x100>;
+			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&osc>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart4: serial@41c0000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x041c0000 0x100>;
+			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&osc>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		plic: interrupt-controller@70000000 {
+			compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
+			reg = <0x70000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <101>;
+		};
+
+		clint: timer@74000000 {
+			compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
+			reg = <0x74000000 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
+	};
+};
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
