Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19711C3ABD9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKdZwaudIZtGhNq6V+1xGYucFHerBFI9IemwgJ0k1e4=; b=h1Z41w7Gp/86Pt
	nef9ClH0SpNSjXy9ufD0pJoTCZ8fQDUSj8r1iEdsT5riPIV8rMJBuRrZGKpVk64TKwlfwoVqLSMKI
	MBhH589ToJ3WKOe29j5Gx0hjDzv/oEbGBmgW3oylZ9wjbRaMOXSU/6cZ0Wc+hQsgpLmxfR8Cde3B1
	06uwvbGKrLefmfb7lZNkvyMyiLDFGcEY1UXgWhp3qcbU/Y2jmh3zRDwqXKX5qR3z9ZjRKHjsqvw9Z
	mcIm+60pKCnHPMnMi9UxpuZzs3RPsWFpxsldzbFFQwLQDtyGST/IX/bWczZhTGWqWJO4d9cKdU20k
	8uHqnQ75fWIzO2D2wxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCXi-0000000FGqt-17fB;
	Wed, 14 May 2025 13:53:06 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8pE-0000000EjLo-09F4
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 09:54:57 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 54E9s3iV092466
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 17:54:03 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Wed, 14 May 2025
 17:54:02 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>,
        Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH v4 8/9] riscv: dts: andes: add Voyager board device tree
Date: Wed, 14 May 2025 17:53:49 +0800
Message-ID: <20250514095350.3765716-9-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514095350.3765716-1-ben717@andestech.com>
References: <20250514095350.3765716-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 54E9s3iV092466
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_025456_382917_C7CDC921 
X-CRM114-Status: GOOD (  13.87  )
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

Introduce the device tree support for Voyager development board.

Currently only support booting into console with only uart,
other features will be added later.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 arch/riscv/boot/dts/Makefile                |  1 +
 arch/riscv/boot/dts/andes/Makefile          |  2 ++
 arch/riscv/boot/dts/andes/qilai-voyager.dts | 28 +++++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 arch/riscv/boot/dts/andes/Makefile
 create mode 100644 arch/riscv/boot/dts/andes/qilai-voyager.dts

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 64a898da9aee..3b99e91efa25 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += allwinner
+subdir-y += andes
 subdir-y += canaan
 subdir-y += microchip
 subdir-y += renesas
diff --git a/arch/riscv/boot/dts/andes/Makefile b/arch/riscv/boot/dts/andes/Makefile
new file mode 100644
index 000000000000..c545c668ef70
--- /dev/null
+++ b/arch/riscv/boot/dts/andes/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_ANDES) += qilai-voyager.dtb
diff --git a/arch/riscv/boot/dts/andes/qilai-voyager.dts b/arch/riscv/boot/dts/andes/qilai-voyager.dts
new file mode 100644
index 000000000000..fa7d2b32a9b4
--- /dev/null
+++ b/arch/riscv/boot/dts/andes/qilai-voyager.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2025 Andes Technology Corporation. All rights reserved.
+ */
+
+#include "qilai.dtsi"
+
+/ {
+	model = "Voyager";
+	compatible = "andestech,voyager", "andestech,qilai";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@400000000 {
+		device_type = "memory";
+		reg = <0x4 0x00000000 0x4 0x00000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
