Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26DDC25B06
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 15:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJl0UMnX49c+1cAlALvkyx0WTj+tZ+hct/6TLe9KXK8=; b=CUjDiSVGZZYZa4
	odTn/VqWFH3wdHY7+J+w1+lRK6UWx09UtiK0WSJVCOQar71LNtCxs6Fy6ts492Qfni1lU1dq/Xf8z
	QfVcwt8ib2nwX5ArM4YVc2ClgyR62FEYHy1OO0lGsypzhRu/GlGuMa2SNT9xZqWH4Oc9+tx/GqvjU
	e1/W0dxztX17p3qdsLJE5DXPIYnOwLWRDm6j9lFaOZtnf8aO4zcPhVdTRnOU9CUZaQg1/BMtgOv+P
	Twf6RRMDjHSSAkAEX6bgi8mMatDDZ8qzJ+UDua+v75lTQLezpffTXnKGPJ6VwXyeNLI9wikOZ9j1e
	I++YWumWG0+/0F4DfGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNbqZ-000jiS-Q8; Mon, 15 Aug 2022 15:17:43 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNbpI-000i6w-GC
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 15:16:26 +0000
X-IronPort-AV: E=Sophos;i="5.93,238,1654527600"; 
   d="scan'208";a="129579733"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Aug 2022 00:16:24 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C19994018A18;
	Tue, 16 Aug 2022 00:16:19 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 6/8] riscv: dts: renesas: Add minimal DTS for Renesas RZ/Five SMARC EVK
Date: Mon, 15 Aug 2022 16:14:49 +0100
Message-Id: <20220815151451.23293-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_081624_944759_E00B201B 
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable the minimal blocks required for booting the Renesas RZ/Five
SMARC EVK with initramfs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
* New patch
---
 arch/riscv/boot/dts/Makefile                  |  1 +
 arch/riscv/boot/dts/renesas/Makefile          |  2 ++
 .../boot/dts/renesas/r9a07g043f01-smarc.dts   | 16 ++++++++++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    | 22 +++++++++++++
 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 32 +++++++++++++++++++
 5 files changed, 73 insertions(+)
 create mode 100644 arch/riscv/boot/dts/renesas/Makefile
 create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
 create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
 create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index ff174996cdfd..b0ff5fbabb0c 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -3,5 +3,6 @@ subdir-y += sifive
 subdir-y += starfive
 subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
 subdir-y += microchip
+subdir-y += renesas
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
diff --git a/arch/riscv/boot/dts/renesas/Makefile b/arch/riscv/boot/dts/renesas/Makefile
new file mode 100644
index 000000000000..2d3f5751a649
--- /dev/null
+++ b/arch/riscv/boot/dts/renesas/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043f01-smarc.dtb
diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts b/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
new file mode 100644
index 000000000000..7428f643a9b3
--- /dev/null
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/Five SMARC EVK
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+
+#include "r9a07g043.dtsi"
+#include "rzfive-smarc.dtsi"
+
+/ {
+	model = "Renesas SMARC EVK based on r9a07g043f01";
+	compatible = "renesas,smarc-evk", "renesas,r9a07g043f01", "renesas,r9a07g043";
+};
diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
new file mode 100644
index 000000000000..4a4acde6a2a7
--- /dev/null
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/Five SMARC EVK SOM
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/ {
+	chosen {
+		bootargs = "ignore_loglevel";
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x38000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
new file mode 100644
index 000000000000..4864a2a62d6b
--- /dev/null
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/Five SMARC EVK carrier board
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+#include "rzfive-smarc-som.dtsi"
+
+/ {
+	aliases {
+		serial0 = &scif0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&pinctrl {
+	scif0_pins: scif0 {
+		pinmux = <RZG2L_PORT_PINMUX(6, 4, 6)>, /* TxD */
+			 <RZG2L_PORT_PINMUX(6, 3, 6)>; /* RxD */
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
