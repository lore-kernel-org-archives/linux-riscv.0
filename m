Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFF2C77B7C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 18:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=USakzaRCVNCi2soTrX3m5Ns+Qu75oPpoECDvCy2nR4A=; b=we1UHppIGQY1un
	mpxkNolNCO27WGVy0UTUNh9QdbuEeEoasDRdzyf4d7RQ1J2XJYXBoTwcXFVSX+ED83Ct5gygZOLcL
	VtbgRVXo1uWQaim8TCmXR3gpiJFTWrjP/9FNcM0YG3b/k/fqza96AsoOC1xJYR3gl3A7NGtMvF1bh
	lxQytb3r78PX7yRZWA8P5m0JNyqN2t6sdHSW5LPxLbv5zjLcnhIHHsULgdxlSjBSNTZhr2ObWNMg9
	DlOrlJ4P03Pg4L+8NfQPwlSg928Ylw1UUOlbRimqu4wpw58jjaY4I21fizVyqBD40lZ/lP2gUwKh2
	xi7cP8R210x9AejysD5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvjDI-00GYI9-1A;
	Sun, 07 May 2023 18:34:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvjDF-00GYH9-3D
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 18:34:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9326561C9C;
	Sun,  7 May 2023 18:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763F4C4339C;
	Sun,  7 May 2023 18:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683484465;
	bh=2RFGJcRC8JFrMMqTRjHn7GAHKS+k26LwNQvh7lnf8Oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EaLyerAZnN7eLruXlnT2hQfLIKGVwmdNkkKVAuDGkjPSWrzxycJZVouATTBG8A06h
	 IXzKSkNlQaualCy4W0yX1WkhhPH7BJ0nejUz+wkKrSv89OLb4AxcuJ7l/mUeiP/sBQ
	 De1b18YxQMbnoLvBjJuq5GbjH8Whca2XNuA3XRk57I4ZmWGEseVkt1AmmQ0yYERPM2
	 1yqt/moQtM8VkLFpvAt1MABtkqACsxpNvAnOAYp14l7VqbjIzNZW8bacdY8G42tLsb
	 lIw9CtZdfdJwwskl7BHrFHHHlXgLNklDiX1BaWB3yJFfHy27LdXf3YuVVNjBrTdOPU
	 V8YkFhtw+7WUg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH 4/5] riscv: dts: thead: add sipeed Lichee Pi 4A board device tree
Date: Mon,  8 May 2023 02:23:03 +0800
Message-Id: <20230507182304.2934-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230507182304.2934-1-jszhang@kernel.org>
References: <20230507182304.2934-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_113426_112709_4EAE6C8F 
X-CRM114-Status: GOOD (  15.21  )
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

Sipeed's Lichee Pi 4A development board uses Lichee Module 4A core
module which is powered by T-HEAD's light(a.k.a TH1520) SoC. Add
minimal device tree files for the core module and the development
board.

Support basic uart/gpio/dmac drivers, so supports booting to a basic
shell.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/Makefile                  |  1 +
 arch/riscv/boot/dts/thead/Makefile            |  2 +
 .../dts/thead/light-lichee-module-4a.dtsi     | 38 +++++++++++++++++++
 .../boot/dts/thead/light-lichee-pi-4a.dts     | 32 ++++++++++++++++
 4 files changed, 73 insertions(+)
 create mode 100644 arch/riscv/boot/dts/thead/Makefile
 create mode 100644 arch/riscv/boot/dts/thead/light-lichee-module-4a.dtsi
 create mode 100644 arch/riscv/boot/dts/thead/light-lichee-pi-4a.dts

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
index 000000000000..9e00acc714cc
--- /dev/null
+++ b/arch/riscv/boot/dts/thead/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_THEAD) += light-lichee-pi-4a.dtb
diff --git a/arch/riscv/boot/dts/thead/light-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/light-lichee-module-4a.dtsi
new file mode 100644
index 000000000000..24c9971e0fb5
--- /dev/null
+++ b/arch/riscv/boot/dts/thead/light-lichee-module-4a.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "light.dtsi"
+
+/ {
+	model = "Sipeed Lichee Module 4A";
+	compatible = "sipeed,lichee-module-4a", "thead,light";
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
diff --git a/arch/riscv/boot/dts/thead/light-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/light-lichee-pi-4a.dts
new file mode 100644
index 000000000000..4f0ba2149d2d
--- /dev/null
+++ b/arch/riscv/boot/dts/thead/light-lichee-pi-4a.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include "light-lichee-module-4a.dtsi"
+
+/ {
+	model = "Sipeed Lichee Pi 4A";
+	compatible = "sipeed,lichee-pi-4a", "sipeed,lichee-module-4a", "thead,light";
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
