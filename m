Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3943DC3601A
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 10:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=icQfAdtvZrNUdFZiHKc74SqEYId88VXR6d4MOWir5bk=; b=jG9awxuxCvIUuv
	ScYdFpdSTtk84p/hQWG+qrRWb+pnqOXhlQujDa1+utvwpYPISTDrjEt7sCWCEtzZzM9jrTuejDXJ9
	j9D5QDjHDSykBRqwYp584KhCkOM9NkU9wxsB9Dbs79Hd4fonKRJAOJOLh0oJqQ7cnYLWz0iBMrbk+
	Fyt6HfBtnfEDqKp71fCWEa0deyBOU4lcumHbjWhTeU7oakOMLqtWKEnWqq/KjQb25f+rLgZEspky4
	EsbWZsqPe5+bA5eoBbbujoo1zdcGyc68loE+vAo6HFTLzDepo6jbAHftdEBfwEr8QVm9q2MUHHXtT
	D3A8CM8cWuDkXuUWlrKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1k3z-0000000HQCx-3jYw;
	Mon, 07 Apr 2025 10:50:47 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1k3x-0000000HQ93-2C5X
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 10:50:47 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 537Ann8V001640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 18:49:49 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 7 Apr 2025
 18:49:49 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <tim609@andestech.com>, "Ben
 Zong-You Xie" <ben717@andestech.com>
Subject: [PATCH 7/9] riscv: dts: andes: add QiLai SoC device tree
Date: Mon, 7 Apr 2025 18:49:35 +0800
Message-ID: <20250407104937.315783-8-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407104937.315783-1-ben717@andestech.com>
References: <20250407104937.315783-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 537Ann8V001640
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_035045_875699_2721EFBA 
X-CRM114-Status: GOOD (  13.20  )
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

Introduce the initial device tree support for the Andes QiLai SoC.

For further information, you can refer to [1].

[1] https://www.andestech.com/en/products-solutions/andeshape-platforms/qilai-chip/

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 MAINTAINERS                          |   1 +
 arch/riscv/boot/dts/andes/qilai.dtsi | 194 +++++++++++++++++++++++++++
 2 files changed, 195 insertions(+)
 create mode 100644 arch/riscv/boot/dts/andes/qilai.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index d1e1b98dfe7b..b974e83c9f10 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20731,6 +20731,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
 F:	Documentation/devicetree/bindings/riscv/andes.yaml
 F:	Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
+F:	arch/riscv/boot/dts/andes/
 
 RISC-V ARCHITECTURE
 M:	Paul Walmsley <paul.walmsley@sifive.com>
diff --git a/arch/riscv/boot/dts/andes/qilai.dtsi b/arch/riscv/boot/dts/andes/qilai.dtsi
new file mode 100644
index 000000000000..7199a88afc9b
--- /dev/null
+++ b/arch/riscv/boot/dts/andes/qilai.dtsi
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Andes Technology Corporation. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <62500000>;
+
+		cpu0: cpu@0 {
+			compatible = "andestech,ax45mp", "riscv";
+			device_type = "cpu";
+			status = "okay";
+			reg = <0>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "zicntr", "zicsr", "zifencei",
+					       "zihpm", "xandespmu";
+			mmu-type = "riscv,sv39";
+			clock-frequency = <100000000>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <256>;
+			i-cache-line-size = <64>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <128>;
+			d-cache-line-size = <64>;
+			next-level-cache = <&l2_cache>;
+
+			cpu0_intc: interrupt-controller {
+				compatible = "andestech,cpu-intc", "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu1: cpu@1 {
+			compatible = "andestech,ax45mp", "riscv";
+			device_type = "cpu";
+			status = "okay";
+			reg = <1>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "zicntr", "zicsr", "zifencei",
+					       "zihpm", "xandespmu";
+			mmu-type = "riscv,sv39";
+			clock-frequency = <100000000>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <256>;
+			i-cache-line-size = <64>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <128>;
+			d-cache-line-size = <64>;
+			next-level-cache = <&l2_cache>;
+
+			cpu1_intc: interrupt-controller {
+				compatible = "andestech,cpu-intc", "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu2: cpu@2 {
+			compatible = "andestech,ax45mp", "riscv";
+			device_type = "cpu";
+			status = "okay";
+			reg = <2>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "zicntr", "zicsr", "zifencei",
+					       "zihpm", "xandespmu";
+			mmu-type = "riscv,sv39";
+			clock-frequency = <100000000>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <256>;
+			i-cache-line-size = <64>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <128>;
+			d-cache-line-size = <64>;
+			next-level-cache = <&l2_cache>;
+
+			cpu2_intc: interrupt-controller {
+				compatible = "andestech,cpu-intc", "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu3: cpu@3 {
+			compatible = "andestech,ax45mp", "riscv";
+			device_type = "cpu";
+			status = "okay";
+			reg = <3>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "zicntr", "zicsr", "zifencei",
+					       "zihpm", "xandespmu";
+			mmu-type = "riscv,sv39";
+			clock-frequency = <100000000>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <256>;
+			i-cache-line-size = <64>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <128>;
+			d-cache-line-size = <64>;
+			next-level-cache = <&l2_cache>;
+
+			cpu3_intc: interrupt-controller {
+				compatible = "andestech,cpu-intc", "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+	};
+
+	memory@400000000 {
+		device_type = "memory";
+		reg = <0x4 0x00000000 0x4 0x00000000>;
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		plic: interrupt-controller@2000000 {
+			compatible = "andestech,qilai-plic", "andestech,nceplic100";
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			reg = <0x0 0x2000000 0x0 0x2000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>,
+					      <&cpu1_intc 11>, <&cpu1_intc 9>,
+					      <&cpu2_intc 11>, <&cpu2_intc 9>,
+					      <&cpu3_intc 11>, <&cpu3_intc 9>;
+			riscv,ndev = <71>;
+		};
+
+		plic_sw: interrupt-controller@400000 {
+			compatible = "andestech,qilai-plicsw", "andestech,plicsw";
+			reg = <0x0 0x400000 0x0 0x400000>;
+			interrupts-extended = <&cpu0_intc 3>,
+					      <&cpu1_intc 3>,
+					      <&cpu2_intc 3>,
+					      <&cpu3_intc 3>;
+		};
+
+		plmt: timer@100000 {
+			compatible = "andestech,qilai-aclint-mtimer", "andestech,plmt0";
+			reg = <0x0 0x100000 0x0 0x100000>;
+			interrupts-extended = <&cpu0_intc 7>,
+					      <&cpu1_intc 7>,
+					      <&cpu2_intc 7>,
+					      <&cpu3_intc 7>;
+		};
+
+		l2_cache: cache-controller@200000 {
+			compatible = "andestech,ax45mp-cache", "cache";
+			reg = <0x0 0x200000 0x0 0x100000>;
+			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&plic>;
+			cache-line-size = <64>;
+			cache-level = <2>;
+			cache-sets = <2048>;
+			cache-size = <0x200000>;
+			cache-unified;
+		};
+
+		uart0: serial@30300000 {
+			compatible = "andestech,uart16550", "ns16550a";
+			reg = <0x0 0x30300000 0x0 0x100000>;
+			interrupts = <9 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <50000000>;
+			reg-offset = <32>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			no-loopback-test;
+			interrupt-parent = <&plic>;
+		};
+	};
+};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
