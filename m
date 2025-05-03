Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7420AC369C2
	for <linux-riscv@archiver.kernel.org>; Sat,  3 May 2025 15:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLcaobbmCUdSHr3ioOT0i6rcEEGcO5+npuCF1vC5umI=; b=cmBrtE05fkXlO9
	asCLJKuBy5QeJp/uiZ/9mDrBPc7CExh5+uvPlsRQTmdoAS5sTpECitWigysXHEgRFe1voll2+424q
	6qjEyKQYJ9JZCzaSxfD0vLwo45j3ucJzqp/wesUTs8BcxQIwk3tfXDACuqmwz0o3/nc+CtPdjT8qh
	fUqyFeQlBMdxrwuo7sNvF49ESvrCMuRl6UKjKa65AHC5KvbjWuMEo0RVcEU1O/7fNm/bnwbUWB90K
	qSBNA8Q4SuaETK2uMgWrsyL8AJ42r9Q2Czl71lGIgD9rhlVOIns+D8LkQdCk9E68Jcq7rFtWoEtZ8
	MwHSAynIf28XL7vswxRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBEee-000000041C0-3LOw;
	Sat, 03 May 2025 15:19:52 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBEec-000000041BR-074f
	for linux-riscv@lists.infradead.org;
	Sat, 03 May 2025 15:19:51 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 543FIpxb087675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 3 May 2025 23:18:51 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Sat, 3 May 2025
 23:18:51 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <paul.walmsley@sifive.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <daniel.lezcano@linaro.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <tim609@andestech.com>,
        "Ben
 Zong-You Xie" <ben717@andestech.com>
Subject: [PATCH v2 8/9] riscv: dts: andes: add Voyager board device tree
Date: Sat, 3 May 2025 23:18:28 +0800
Message-ID: <20250503151829.605006-9-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250503151829.605006-1-ben717@andestech.com>
References: <20250503151829.605006-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 543FIpxb087675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_081950_383062_909E2FCC 
X-CRM114-Status: GOOD (  13.96  )
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
