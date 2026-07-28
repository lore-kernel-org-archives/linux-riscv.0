Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550D2C54F51
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DclcALFVUsTwEV+FS7blY7Ug68EL1dfwAsjaJs9+ehY=; b=pqF3fLlMYEsd+G
	WKEDtgYkIVzKAJibgMZxdNMJlxE86DZvRFfiAaFiT9gCVTkQBC9tUBBwUyJr2c7Fu8S8ZINlSY7mI
	hZ7+Ll/iYtgGh9/W7igxoRNnSYY14X8lR8PqT/7uo6QWuDGwD5dEgF09QXTxzNpYYa6ShrkI/mg+X
	e+ut5SswZH8c+R8Wr6Vm/8w3Q9E8X4iBG9DAP2EmqrFwlZGLOZmizthyhPehxoG9CTUhYW6CqWlnt
	HRpsbP+wkR7i2J1bsPNFPGTupLzwjprzfMvI0fZJu7gM+xwFR9O3GiPccy7K2qA1YyfHiJfZKkCJT
	UVoSMXd2j1ygkvYkYcTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop4f-00000006HIe-3TLi;
	Tue, 28 Jul 2026 21:10:53 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop4a-00000006H53-0NyG
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 21:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=75T68Dc5K+ZZomhXTVbW/9LBYG260fJUSxJ+PhasIDk=; b=aSEuD1EIK7iPtJ5/MoNNM+KGJj
	IuYOXfKcv3+ISWjtaEySmcauMleZa9zCnoTeSNl1dhpLPBM0K4XDH5ty5MPgwjBS5InuS8cGrtshh
	Q14A1psopXNnybfkc+UXWxkCtUiDRUQjBz7SQXTPMyVtv1eEO0PCPg1dYu7Sv3PXjRKRSfuntw3Tc
	Z+WFlz+Xp4QKx/Ymtx315HNmwiW+b9IrRykLB5f2O6gtMkDJJy7h8VvjHiA3I+dgPjm02v/STQc70
	twKeWjyGhlB9ShflPZewXAwE4Pllgdl77IpCnNFASUT+yWMsA0KNqq0zcWz/Jw7FftQyLZENSc506
	mXCVEqjg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wop4S-00000001a5G-1QNd;
	Tue, 28 Jul 2026 23:10:40 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 3/3] riscv: dts: spacemit: Add Milk-V Jupiter board (M1)
Date: Tue, 28 Jul 2026 23:05:08 +0200
Message-ID: <20260728211020.1248676-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728211020.1248676-1-aurelien@aurel32.net>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_141048_157725_B696C416 
X-CRM114-Status: GOOD (  13.73  )
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

Add support for the Milk-V Jupiter board with the M1 CPU. The M1 differs
from the K1 only by its package, which provides improved cooling
performance and allows it to run at up to 1.8 GHz instead of 1.6 GHz.

Add m1-opp.dtsi to define the 1.8 GHz operating point and the
corresponding core voltage, based on the upstream kernel. Include it
from m1-milkv-jupiter.dts.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/Makefile         |   1 +
 .../boot/dts/spacemit/m1-milkv-jupiter.dts    |  11 ++
 arch/riscv/boot/dts/spacemit/m1-opp.dtsi      | 117 ++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/m1-opp.dtsi

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 851b701e5da48..c5c38c17b6ced 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -8,3 +8,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-ifx.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += m1-milkv-jupiter.dtb
diff --git a/arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts
new file mode 100644
index 0000000000000..32e1468385ca0
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2026 Aurelien Jarno <aurelien@aurel32.net>
+ */
+
+#include "k1-milkv-jupiter-common.dtsi"
+#include "m1-opp.dtsi"
+
+/ {
+	model = "Milk-V Jupiter (M1)";
+};
diff --git a/arch/riscv/boot/dts/spacemit/m1-opp.dtsi b/arch/riscv/boot/dts/spacemit/m1-opp.dtsi
new file mode 100644
index 0000000000000..38e0ce7765a2b
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/m1-opp.dtsi
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/ {
+	cluster0_opp_table: opp-table-cluster0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-614400000 {
+			opp-hz = /bits/ 64 <614400000>;
+			opp-microvolt = <950000 950000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-819000000 {
+			opp-hz = /bits/ 64 <819000000>;
+			opp-microvolt = <950000 950000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <950000 950000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1228800000 {
+			opp-hz = /bits/ 64 <1228800000>;
+			opp-microvolt = <950000 950000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <1050000 1050000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1160000 1160000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+	};
+
+	cluster1_opp_table: opp-table-cluster1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-614400000 {
+			opp-hz = /bits/ 64 <614400000>;
+			opp-microvolt = <950000 950000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-819000000 {
+			opp-hz = /bits/ 64 <819000000>;
+			opp-microvolt = <950000 950000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <950000 950000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1228800000 {
+			opp-hz = /bits/ 64 <1228800000>;
+			opp-microvolt = <950000 950000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <1050000 1050000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1160000 1160000 1160000>;
+			clock-latency-ns = <200000>;
+		};
+	};
+};
+
+&cpu_0 {
+	operating-points-v2 = <&cluster0_opp_table>;
+};
+
+&cpu_1 {
+	operating-points-v2 = <&cluster0_opp_table>;
+};
+
+&cpu_2 {
+	operating-points-v2 = <&cluster0_opp_table>;
+};
+
+&cpu_3 {
+	operating-points-v2 = <&cluster0_opp_table>;
+};
+
+&cpu_4 {
+	operating-points-v2 = <&cluster1_opp_table>;
+};
+
+&cpu_5 {
+	operating-points-v2 = <&cluster1_opp_table>;
+};
+
+&cpu_6 {
+	operating-points-v2 = <&cluster1_opp_table>;
+};
+
+&cpu_7 {
+	operating-points-v2 = <&cluster1_opp_table>;
+};
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
