Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452DCC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 13:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjMbphQxDJ4nw3U7luIl4/o/6XxnldZUvo5RGx3OBd0=; b=m/zjq4uBmBDKiI
	ejIrfq9YvHK/hBQgNIGVr+TUK5tZh+bpApKip6Q4UDC8wNyyQTxXIbLEy86wmHc3zTRG0hgzatOcU
	V9jO6xLcLD2VGPC71sxu/0gMup6tknz/qxitOFV4sPJrx1VR7kUToHA1m00i2A6aTC4TBaEhvAfXE
	b6eU/4/aVrXFoAuJGYRWKA7hpqDc/PtiEERfV/5CHiOtkuieWRLYRXaJOdzotL0oIJvU1MhMSwYiW
	4iugPiWYPKa7k0NO1wg9aYmOTAOJz4jVSwnIVyFNLZurF1+I15R/Nps+b5Pct3Era33JmK8lpE3Hf
	3pOij+yMqmVDRqbh9OaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHoF-00BPtM-Mm; Sun, 27 Nov 2022 13:35:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHoB-00BPpJ-No
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 13:35:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 544FF60DCC;
	Sun, 27 Nov 2022 13:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3AAC433D7;
	Sun, 27 Nov 2022 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669556098;
	bh=KdlxQOc6nYzqZnDtcA2yP2/SDiF4cqIL6oaqqCIa6EU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cljbwijob+PHPYTH2utatqZN3tz5GV5LegXlFAdq3KXxkGYpwGuIYvYKjipLwENYT
	 bNY2XOdW1k6Rmz2wRxD2yGMozi1X/YcgtdT/G5dluEbdUKp8ehuEvot7u9BRUJLn3Y
	 u55WZeUt/8H1Gu7cre0DUbEGfYvyHyyoTmXMVjSoUfyCLaF4NM3aezr7VTSKxagHlO
	 WrrXT2beikz2uUPgDoBhmcFWLktXOrYLV9z/f2H5obOYin+lOEDJvk3b/CAMDq1lG6
	 TKOpAtv1n77Mfc8x/Q/IWmE3f4DCRZUP0vSidXFpbzqp+nhu35HwgI0LFz5Cw1uzqu
	 2Wdsyj01CuIkA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 6/9] riscv: dts: bouffalolab: add the bl808 SoC base device tree
Date: Sun, 27 Nov 2022 21:24:45 +0800
Message-Id: <20221127132448.4034-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127132448.4034-1-jszhang@kernel.org>
References: <20221127132448.4034-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_053459_885251_4E11A3BD 
X-CRM114-Status: GOOD (  12.89  )
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
---
 arch/riscv/boot/dts/bouffalolab/bl808.dtsi | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808.dtsi

diff --git a/arch/riscv/boot/dts/bouffalolab/bl808.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808.dtsi
new file mode 100644
index 000000000000..f4b170ccc32e
--- /dev/null
+++ b/arch/riscv/boot/dts/bouffalolab/bl808.dtsi
@@ -0,0 +1,74 @@
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
+		uart0: serial@30002000 {
+			compatible = "bouffalolab,bl808-uart";
+			reg = <0x30002000 0x1000>;
+			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&xtal>;
+			status = "disabled";
+		};
+
+		plic: interrupt-controller@e0000000 {
+			compatible = "thead,c900-plic";
+			reg = <0xe0000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 0xffffffff>,
+					      <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <64>;
+		};
+	};
+};
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
