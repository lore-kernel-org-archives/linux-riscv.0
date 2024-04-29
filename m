Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC59AC25B10
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 00:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2eeGL72GeZb27GquDaFxonWKE3y1Xm1UEkWi6BQ0Z7c=; b=kFqZPDHvpuf5Yf
	w4duc5/PUZ9BP5UdQOWcSF+kMn1ZgXfkMxMv3S+WdzTGBMJ8tS6jFMQC/Az/Z6uWNPPAJ0QvjgTL2
	m2SCiPhCA2EVe5YmyXZAkTTO7AUJScZ+6fGjtUXtPMYio8tUAgbrcFwR04S/Jldm5r9jOm/o7d5Ps
	evcVwFjImK6VaAkh1ffCukbQDi7oodrNAmO3lx3x1973Wi7bQKKMjeEmlUcEDH7A4Sg1TMktVOyYW
	byLYn5OFsbySVL59EqY1cWxereQd0sybQnlIoTWAnlLLRcgIuN2fwx2Eecs+q/TyJfAS2eTqKm/el
	6DIRFo8jLeWZjRC6mbgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Erf-000000012ws-2BTJ;
	Mon, 29 Apr 2024 00:27:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ErM-000000012ga-2V6c
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 00:27:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5AC8B60B8E;
	Mon, 29 Apr 2024 00:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B201C4AF1B;
	Mon, 29 Apr 2024 00:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714350428;
	bh=Me6kV0m1Pfmm/VqxiWspxINMuSUzJ8rjhLb86dLUq5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nrHLlhOPF9845cevx6RTVszjP9xR769xlV9mNn5CNFexjwSTOVuh78FztRGyk8szx
	 xcvRWUmMcbDokAHnt9EsBeBFHE0Zfp8IzDnrJ5DqhfPI9GizymFU/rX+VOxrVqXbIo
	 FN8iYSmKdv3JngOQ8X7WXjrlD8pdrLgdMFs3dZIg8GyJOB8QBbB7dt7aI4gspgbZEc
	 XQljSieLVHSmPsYiWinlaQYD4NdItDTyC9rGlnfsVKYPD4ZdAPgv3PV5cBO96IJD+3
	 HKeWsVsp4KkYJtOM28uU6bniF4uXwI3kU0SoWiO0RxTPNc7IjZ1q9PJuNz+gxmd/RJ
	 Nl0ZCHM1rWaTw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/8] riscv: dts: starfive: add Milkv Mars board device tree
Date: Mon, 29 Apr 2024 08:13:17 +0800
Message-ID: <20240429001317.432-9-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429001317.432-1-jszhang@kernel.org>
References: <20240429001317.432-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_172711_228565_41A71E83 
X-CRM114-Status: GOOD (  12.15  )
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

The Milkv Mars is a development board based on the Starfive JH7110 SoC.
The board features:

- JH7110 SoC
- 1/2/4/8 GiB LPDDR4 DRAM
- AXP15060 PMIC
- 40 pin GPIO header
- 3x USB 3.0 host port
- 1x USB 2.0 host port
- 1x M.2 E-Key
- 1x eMMC slot
- 1x MicroSD slot
- 1x QSPI Flash
- 1x 1Gbps Ethernet port
- 1x HDMI port
- 1x 2-lane DSI and 1x 4-lane DSI
- 1x 2-lane CSI

Add the devicetree file describing the currently supported features,
namely PMIC, UART, I2C, GPIO, SD card, QSPI Flash, eMMC and Ethernet.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/starfive/Makefile         |  1 +
 .../boot/dts/starfive/jh7110-milkv-mars.dts   | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts

diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index 0141504c0f5c..2fa0cd7f31c3 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -8,5 +8,6 @@ DTC_FLAGS_jh7110-starfive-visionfive-2-v1.3b := -@
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-beaglev-starlight.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
 
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
new file mode 100644
index 000000000000..fa0eac78e0ba
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+#include "jh7110-common.dtsi"
+
+/ {
+	model = "Milk-V Mars";
+	compatible = "milkv,mars", "starfive,jh7110";
+};
+
+&gmac0 {
+	starfive,tx-use-rgmii-clk;
+	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
+	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
+};
+
+
+&phy0 {
+	motorcomm,tx-clk-adj-enabled;
+	motorcomm,tx-clk-10-inverted;
+	motorcomm,tx-clk-100-inverted;
+	motorcomm,tx-clk-1000-inverted;
+	motorcomm,rx-clk-drv-microamp = <3970>;
+	motorcomm,rx-data-drv-microamp = <2910>;
+	rx-internal-delay-ps = <1500>;
+	tx-internal-delay-ps = <1500>;
+};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
