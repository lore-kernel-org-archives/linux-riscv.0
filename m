Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43551C48BC4
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 15:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4pGY8ZaZld5o+7yMgzreFN/5JnFAcyClv5mM9WzoA+0=; b=T2oWDWK4WT00lC
	cg0kTYIHFSFeH9DhP8P9xDhzyw3xlXqecWz1MvgSv/BzLokh/hqyFlYFLBCdVDEq2vAwhlBRxqcrx
	FwyuXbVAbWIel6VWy+cYhF3Tlo//RiUKZFRv5URb8h9McTtnNt7WYrKVHWkQy41XYuk0nP9imVf12
	Ns5cwbFIky3buCDX/oXp5HpsxsyWWtAWOjd+CY0uKkBHnSb29+Rk6XM7Y5Euqg5XzkzHy8Rneln6Q
	Blh8JEPgB/B9i8uYYYiK5AuKMN+tWCjFqMQ2LfVJQFuFgVR1NVdbxz7whwkJ/PGFpKew3PNPCubdr
	HZhgNVnio7pHh5S6i9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbMBz-00000005sOy-09B1;
	Sat, 17 Feb 2024 15:01:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbMBw-00000005sOL-3oOV
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 15:01:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46C0B61335;
	Sat, 17 Feb 2024 15:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD4EC433F1;
	Sat, 17 Feb 2024 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708182083;
	bh=IojVOTkkmUgO8R4R5BC+JvxU3MusAnoRWz5cmE/Gqjc=;
	h=From:To:Cc:Subject:Date:From;
	b=CtrUsh6bwVqhdBGdyOuDk0xtJef3k8N8vCn7a3CH5JXonVHQxfPDLMFYZdVsQDVWk
	 +bjGkaUhzstRRxhqn8KOlfclvoHzFFGzo67TuaoxpU8lmWHjta9QxHjyN8o/C3jf0y
	 PjMVYo4N6IeVR9dOnA/e47OtlC4ClvurnxM7fFTS6D0nfUzgLPukjzTlGm1O7ag76A
	 lhj0tWdeUNi2x9yXHIeHYzB/mKh4DraVWbyGjO4sUL83gBliNF7T4BXhGmXzHVrEli
	 ZU4VJRgjOqQiF9rXK/MXwDUC8+TcX1EnGeGiIYuYkoK0ndebkMu2qVS/x4TZ/z42ey
	 OkyO12z0GoLKQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH RFC] riscv: dts: sophgo: add sdcard support for milkv duo
Date: Sat, 17 Feb 2024 22:48:26 +0800
Message-ID: <20240217144826.3944-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_070125_005716_3AE44B6C 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

Add sdhci dt node in SoC dtsi and enable it in milkv duo dts.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
Since cv1800b's clk support isn't in, this patch uses fixed dummy clk
and just RFC, I will send formal patch after clk support is ready.

 .../riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts |  8 ++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi          | 17 +++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index 3af9e34b3bc7..94e64ddce8fa 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -33,6 +33,14 @@ &osc {
 	clock-frequency = <25000000>;
 };
 
+&sdhci0 {
+	status = "okay";
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 2d6f4a4b1e58..405f4ba18392 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -4,6 +4,7 @@
  * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
  */
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
@@ -45,6 +46,13 @@ osc: oscillator {
 		#clock-cells = <0>;
 	};
 
+	sdhci_clk: sdhci-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <375000000>;
+		clock-output-names = "sdhci_clk";
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -175,6 +183,15 @@ uart4: serial@41c0000 {
 			status = "disabled";
 		};
 
+		sdhci0: mmc@4310000 {
+			compatible = "sophgo,cv1800b-dwcmshc";
+			reg = <0x4310000 0x1000>;
+			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
 		plic: interrupt-controller@70000000 {
 			reg = <0x70000000 0x4000000>;
 			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
