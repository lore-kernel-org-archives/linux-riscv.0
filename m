Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055F2F327AD
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 06:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Cc:In-Reply-To:Message-Id:
	References:From:To:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxeT9m7e+LgrO9ytXwTnJIRC0bc8HQmGjMNhPaeR5V0=; b=iacaFE4F/ZdUA2
	de3L/9uZmI/2m/DOoZ9Aod2XK68MCtxsuvkyDSLkYWJErpFYxMevqUJRUGl82IKrAYmKv1+YjhJBb
	l8Y9Mm8bV/YLD1yIXYwNPGTIic1XekgfT0NdopbCPS06W+wDQII3Vr1jRtU6S2Cb/1J8vlgEzcgZ4
	jXw5m/yWpdxm9Dnni3evwDiSpOHR5LX/QH7IFfVSShCrkj+8R/+IxKkOSVZ0l1PmC5zT/+BhY2qLV
	jmIPQphLpaYYGux11xxRTOQcT2jIOoU2WGHlgDE4XkLMUyMoDmg0ApQ9s2SYOZiWS2pUurdHmv0wt
	DlCPOEKrTIanwQCVa8Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4pZ-000000087X9-3ozV;
	Tue, 21 Apr 2026 06:43:33 +0000
Received: from va-2-26.ptr.blmpb.com ([209.127.231.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4pX-000000087VU-1Z1H
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 06:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1776753806;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=6/8m1jwqw/6gdlFElveR8F5qXIxZI6jMOvX9OG4Jjb4=;
 b=G6rHTNt7q+3C/yXg9zIVrCDA9/0yMFD1zu3Rkt9kIClHX1P32DtkJyHLj3aHg4AWEVaCuf
 /S4qeVcPuQGwRcRFbr5wz+onqfxdvYpMhTrPsrRNvq1yhJepFkhZE8R1n/mpQ758tqTv1d
 0rLQFcbpIHGsi9pqgHCdUYAvzXD7jbLU5ZkpAIcmvfwMArvVTQuLzKje3JNRu3Gxtott0a
 j6ni31/e1ZP9AIqNQkTamQI/oMZ0ODRfQKB7tSGlTs1XORTsOzrrT08tvXoW03YPxs+Nrz
 p/0a5ua+pm0Ww6Pc8ySJ9en31OsVUwPfO5nJiQmturjadEEwI8ujXns7G3M9tw==
Subject: [PATCH v5 2/2] riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([113.110.140.180]) by smtp.feishu.cn with ESMTPS; Tue, 21 Apr 2026 14:43:22 +0800
Date: Tue, 21 Apr 2026 14:43:06 +0800
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
References: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
Message-Id: <20260421064306.1583888-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
X-Lms-Return-Path: <lba+269e71c8c+27e0dc+lists.infradead.org+sandie.cao@deepcomputing.io>
In-Reply-To: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, "Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_234331_493867_907D1312 
X-CRM114-Status: UNSURE (   8.86  )
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

The FML13V05 board from DeepComputing incorporates a SpacemiT K3 RISC-V
SoC.It is a mainboard designed for the Framework Laptop 13 Chassis,
which has (Framework) SKU FRANHQ0001.

The FML13V05 board features:
- SpacemiT K3 RISC-V SoC
- LPDDR5 16GB or 32GB
- eMMC 32GB ~128GB (Optional)
- UFS 3.1 256G (Optional)
- QSPI Flash
- MicroSD Slot
- PCIe-based Wi-Fi
- 4 USB-C Ports
 - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
 - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
 - Port 3 & 4: USB 3.2 Gen 1

This minimal device tree enables booting into a serial console with UART
output.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 7e2b87702571..acb993c452ba 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
new file mode 100644
index 000000000000..b5d5112de358
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2026 DeepComputing (HK) Limited
+ */
+
+#include "k3.dtsi"
+#include "k3-pinctrl.dtsi"
+
+/ {
+	model = "DeepComputing FML13V05";
+	compatible = "deepcomputing,fml13v05", "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	memory@100000000 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x4 0x00000000>;
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_0_cfg>;
+	status = "okay";
+};
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
