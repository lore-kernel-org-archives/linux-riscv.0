Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE0CE77372
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Sep 2023 12:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/qBKbonUl3+Bz0J0ECVkOJX4RnOiikbrbVO9JchCzo=; b=gSgVjVxoxMn1yu
	MCfc1fO5H1pTFO9KwUKfjUEXr/iHAxsDPNVYPiN2sUvlCty8jrA7aJsd36q/Ig5dlPVxaaGBbscf+
	cNCCWKGBAi98t+SDCWGzHTA+307i4ajJRBtALA+6n4rJ800mzM77tcM7Pdipdpsbnn8Fi7mbUPjh1
	1y81345/GilIec+Ntu9Mi+NQxTc0GXAfAidxjESgKzJD6WKAqrXXVcw3DSMvDjMJKIiLdMG/Z9YTU
	pPXHlrBrGmBf/63jSb4l5ofzlW7YfLuRvL2osscKmpyIjmdw6Nc7NOXH7v88b9u2GCxVGwjmCnTUl
	ZLlp4Bpde7659x9JZk9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmZSG-009XSS-0K;
	Sat, 30 Sep 2023 12:52:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmZSA-009XP8-10
	for linux-riscv@lists.infradead.org;
	Sat, 30 Sep 2023 12:52:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 85C69CE1189;
	Sat, 30 Sep 2023 12:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1781DC433C8;
	Sat, 30 Sep 2023 12:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696078331;
	bh=m/SQdPZRniU8V63PbNGJZepQgR0uVjC52GDULoPYhLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pf9D5YxB+dW6I7uWNYpDr2vWwXsZm1pPALw4GYcxrH+LFwm9F5wXyYxQNxwy3ynzI
	 5nbINhGExdfhweHSgEgW6mJ3bcpoEjqLia2pNDTjPIzbCxI/G0m2ClbZb+4zD9W65H
	 TzeY2J/OOhZV4SBFmh2p5Ce276sc6Q3f+R+LoPqt0rnqAgoNd4/7a7bqey3r1m6KlG
	 vwPSCOyXja71/KsLWfS2dry6M7jig46j44vHDaLZqg/istRzl++TjDskaHuxXhIIkV
	 oD/sChwBPsfBAdN40+MtqKQJ4ItnSw+Yi9QDDWJjJgqXtSEHiSZysUOfuO/9Zj3a9b
	 djMEc8zmLsLcQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com
Subject: [PATCH 5/5] riscv: dts: sophgo: add Milk-V Duo board device tree
Date: Sat, 30 Sep 2023 20:39:37 +0800
Message-Id: <20230930123937.1551-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230930123937.1551-1-jszhang@kernel.org>
References: <20230930123937.1551-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230930_055214_524162_91AF2389 
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

Milk-V Duo[1] board is an embedded development platform based on the
CV1800B chip. Add minimal device tree files for the development board.

Support basic uart drivers, so supports booting to a basic shell.

Link: https://milkv.io/duo [1]
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/sophgo/Makefile           |  2 +-
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 5a471b19df22..5ea9ce398ff6 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
-
+dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
new file mode 100644
index 000000000000..3af9e34b3bc7
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "cv1800b.dtsi"
+
+/ {
+	model = "Milk-V Duo";
+	compatible = "milkv,duo", "sophgo,cv1800b";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x3f40000>;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
