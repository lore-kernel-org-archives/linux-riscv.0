Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5DCC7EE25
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 15:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2nvy/rlqmbGL5jsNHNYix6/vBaWNWxsj1DBpjMQv3wU=; b=SYOM0AxBi1X78J
	FIzI8iEGUIMu+QzXptl8sVuu18ldbPsvfWD56nyVy6AN95I3mTnsxt5DLElVAaahKjCsIAPTi3L4Q
	M/S/VNM1HrYw/pKSHF5TPd/SKfQFVgAISrzqLoAi0ugBlKJE/xGwetn946c0TP6ZVVHwmrHZx3dO3
	pdC0Fv8lcq+WYepIRW27RN5pw6xz3QYzgItA/aAwy/Z1n+q/r3agWhC8vvKzzduyra21lZr65CpZq
	oX5JB9RWHJjDHnzDY49StnuYy9wGW1RgDrAFL17fNUQxe4gH43oJFFMB+Nwe+Jm5vAKPwuQIqBAjx
	4K02JUMMTg97jPXAwKpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfe8-00DK2J-0N;
	Thu, 18 May 2023 15:34:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfe5-00DK0E-1f
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 15:34:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1C8BB65028;
	Thu, 18 May 2023 15:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765F6C433D2;
	Thu, 18 May 2023 15:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684424064;
	bh=9ZVQaWxp1rntSaFGKdgAUvSryPweqDi/a9hnkE1Whk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D4BGUnHoEQEDOGv3XS0kZ4uAw6KKAZfdXAGaQPtSUtMmLl3CSgyHra2G/dbS4zjEP
	 7IM/IREhAVbAdxAWoacPwlwRvTT1EDKdw6XiIPQIZWyeFM4l60NoHTqzAYpCmmF3Be
	 nCizjtQqcqxf4ZsF38r6P5Nrobvb743GjexYMlsaWKqp99dktup1pgIxMi5kEimUwK
	 fD7phZT913VUV2jDw9fP2QExGcyZk9NAdRUhr4+7sTiOxDlZ6rULA3bRoa0Foi+pXR
	 65byqHOuO8mVq2AGA8aCNe/HtxG8FRnNCs7QogZ74Neb7UKzV8J6SJSIJt4wMgFtwv
	 WdjLR9z9joeCQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 07/10] riscv: dts: bouffalolab: add the bl808 SoC base device tree
Date: Thu, 18 May 2023 23:22:41 +0800
Message-Id: <20230518152244.2178-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230518152244.2178-1-jszhang@kernel.org>
References: <20230518152244.2178-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_083425_637981_7419EE4A 
X-CRM114-Status: GOOD (  13.30  )
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

Add a baisc dtsi for the bouffalolab bl808 SoC.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/boot/dts/bouffalolab/bl808.dtsi | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808.dtsi

diff --git a/arch/riscv/boot/dts/bouffalolab/bl808.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808.dtsi
new file mode 100644
index 000000000000..87906fe51db5
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/bl808.dtsi
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+/*
+ * Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "bouffalolab,bl808";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		timebase-frequency = <1000000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "thead,c906", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <32768>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
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
+	xtal: xtal-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		uart3: serial@30002000 {
+			compatible = "bouffalolab,bl808-uart";
+			reg = <0x30002000 0x1000>;
+			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&xtal>;
+			status = "disabled";
+		};
+
+		plic: interrupt-controller@e0000000 {
+			compatible = "bouffalolab,bl808-plic", "thead,c900-plic";
+			reg = <0xe0000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <82>;
+		};
+	};
+};
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
