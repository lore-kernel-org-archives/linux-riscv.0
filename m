Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042B3C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 13:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wq0nuXoEjkCYz4bFdZQHcqchV+bsjjTuhijbMoFuaIo=; b=2LJLnILiZJ6Mon
	k5lcuK7vZUIx8YEIOZMBl/YarXXG5MjEPN62cmzWoG+xe/pDmkYw3A3vUfUXNLSIEMVuHHNdbpBAf
	WWeIrj9EU9Lx/lHmVcYerShIDr+O5o2LgJVSAQrN9JB8LQtDfmUwpq1IzQ4FE6rppSRNU2lRRfkMU
	m5aXfNLFx5JGvsaiCDGOtYc72eX+eQe8AwCVxvfPMCcWFdJrTp6i7H5KHmglOi9pYg0io67lfJ0hB
	06ocPKfjXVQLYO36wlaBPICQzl4fSQvGCbwe6x2/1Flom5LFqhVhAV5d6Xr1eifrDbFoq/LORs/ys
	QGA+LRckwyvor2E5VtYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAo8-00000003f3G-18GF;
	Wed, 31 Jan 2024 13:39:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAo1-00000003exZ-0frQ
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 13:39:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 837B161776;
	Wed, 31 Jan 2024 13:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F90C43394;
	Wed, 31 Jan 2024 13:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706708348;
	bh=TEoBcq07sKA3KFqE6Y9J+f8ZeVl1OlpAdt/o3ypscuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mWOWLa7WXNfP1YOMkESI+rwFi+vG5JrXK+27N1W7D82vzATNcbM+rd7sEvct75LdN
	 Z4h/5yWfBGzeXGEbSV9uNqHRubMWPDhrAorFYh7TDaKYqA64mOH9w89KxaCnu/QdVI
	 4XorwyCRCdPOFX7vNbnzg5+gpo/0L3+lO0gyhtcG1gQS20BAhprkphv4y5m9fK9sqf
	 5uD4BY2g38tJgACQ6aLU+Luhyt47+QryIJ0XAq6wnkQSXQiC9REo5utXbCZ48N5pFd
	 GnoAepkaw71YmsY/7S8lKn9rB8D0IUw/s3zFvUeJ4YvE0NxiLoQQ2es+n1HjkHeQIB
	 q3pjaSbgZRSSg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] riscv: dts: starfive: add Milkv Mars board device tree
Date: Wed, 31 Jan 2024 21:26:00 +0800
Message-ID: <20240131132600.4067-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131132600.4067-1-jszhang@kernel.org>
References: <20240131132600.4067-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_053909_407057_B6ACB4CC 
X-CRM114-Status: GOOD (  12.51  )
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
 .../boot/dts/starfive/jh7110-milkv-mars.dts   | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
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
index 000000000000..de600e799e7d
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+#include "jh7110-visionfive2-mars-common.dtsi"
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
+
+&mmc1 {
+	disable-wp;
+	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
+};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
