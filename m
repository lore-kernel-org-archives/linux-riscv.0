Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C0EC7EE25
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 18:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10FqMjIU04UHfQFZVmUJt2VVwLNrdZ9Sai4+JClVz64=; b=u0dUWhz87LQY5u
	DrtRDdYlWggbKxlhwz7ppPk1fm/SqtAGZTzEy/5hZEMkxtUwIoCSn0r9G4Yzx+YDvhNv4jGo/G8fR
	0Lqw7/a2kBpFGsBKVSYgeG1ItOc2uIAsex7FRQjPyX4/O6Fpck1LDJuxuk9UrFzQ+Jjp7HSl/jFtY
	nhFT6sGC6kuqi2JKM7ykMl9/y2AHz14ZdpwtghJj1+eSztSvgdBL4PJtfSbVW9N8zZBfPKtBBPhx/
	6TIpQy5+Dq6LN6v2G2pF0CWA+SciG/3oEUfgxS7pzO6vZXiRECVrm97Q/jIXk3rSX2qnBUtEdwqs0
	0Ju+kELnO4bS9dSSeP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzioP-00Dt2o-2g;
	Thu, 18 May 2023 18:57:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzioN-00Dt0x-0j
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 18:57:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C780C651B0;
	Thu, 18 May 2023 18:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67568C433A7;
	Thu, 18 May 2023 18:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684436234;
	bh=SPhHXPcnyMrXjaiP7DOxwbB5VjmdUJq9U0kUEmDjQ0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kahOTcxTy32CFM9eHd/MHg6lpg/GXB3H9L5itF0hjkwIgLWkXf14++KVJUXdJsHhx
	 2hSOWca+EOez7Tsd73O5z396YvhAC2TJwFiUIm51230K1jbg0ts8DXU2EML0wimE7y
	 CCuZT5F6PT1KeRQdFIssnO0sC42+p5sG0mCB/Zir3xQvV724B35dt74iEMtLs5x0dP
	 Ftg/9JWwfTIpc+GWix2ZSbBX9iA5zYgE7Zk7wmNH5Zdlfp2l2PRENKUKXIsYRjGcng
	 FuSLVOCLPMoNgR/FHr5IXiEUe96qyaIzc5zGp2gh3FN+/23CozongCD3Wy2P9YiEnx
	 L35M74T2aOEYA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v2 7/9] riscv: dts: thead: add sipeed Lichee Pi 4A board device tree
Date: Fri, 19 May 2023 02:45:39 +0800
Message-Id: <20230518184541.2627-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230518184541.2627-1-jszhang@kernel.org>
References: <20230518184541.2627-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_115715_353392_9ED619E7 
X-CRM114-Status: GOOD (  15.71  )
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
Cc: devicetree@vger.kernel.org, Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Sipeed's Lichee Pi 4A development board uses Lichee Module 4A core
module which is powered by T-HEAD's TH1520 SoC. Add minimal device
tree files for the core module and the development board.

Support basic uart/gpio/dmac drivers, so supports booting to a basic
shell.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/Makefile                  |  1 +
 arch/riscv/boot/dts/thead/Makefile            |  2 +
 .../dts/thead/th1520-lichee-module-4a.dtsi    | 38 +++++++++++++++++++
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 32 ++++++++++++++++
 4 files changed, 73 insertions(+)
 create mode 100644 arch/riscv/boot/dts/thead/Makefile
 create mode 100644 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
 create mode 100644 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index f0d9f89054f8..1e884868ccba 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -2,6 +2,7 @@
 subdir-y += allwinner
 subdir-y += sifive
 subdir-y += starfive
+subdir-y += thead
 subdir-y += canaan
 subdir-y += microchip
 subdir-y += renesas
diff --git a/arch/riscv/boot/dts/thead/Makefile b/arch/riscv/boot/dts/thead/Makefile
new file mode 100644
index 000000000000..e311fc9a5939
--- /dev/null
+++ b/arch/riscv/boot/dts/thead/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_THEAD) += th1520-lichee-pi-4a.dtb
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
new file mode 100644
index 000000000000..4b0249ac710f
--- /dev/null
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "th1520.dtsi"
+
+/ {
+	model = "Sipeed Lichee Module 4A";
+	compatible = "sipeed,lichee-module-4a", "thead,th1520";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x00000000 0x2 0x00000000>;
+	};
+};
+
+&osc {
+	clock-frequency = <24000000>;
+};
+
+&osc_32k {
+	clock-frequency = <32768>;
+};
+
+&apb_clk {
+	clock-frequency = <62500000>;
+};
+
+&uart_sclk {
+	clock-frequency = <100000000>;
+};
+
+&dmac0 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
new file mode 100644
index 000000000000..a1248b2ee3a3
--- /dev/null
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include "th1520-lichee-module-4a.dtsi"
+
+/ {
+	model = "Sipeed Lichee Pi 4A";
+	compatible = "sipeed,lichee-pi-4a", "sipeed,lichee-module-4a", "thead,th1520";
+
+	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+		serial5 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
