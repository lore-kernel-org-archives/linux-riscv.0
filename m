Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C029C3DA45
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 03:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVGwU5Ln4SRSx+XsqOcCckHTFEosnq2Mo9ccYLTmCuU=; b=s+4Ni60Gga7tF9
	LXJV74trytj/KszSWrKPyBGo231Y1zb6UQC7IdQHTBPFXV+tnmkpd8+Y8RS7WfhTEjQIMxnrQ+6HN
	ZO7lExy4USOBvWzkmD2hk4qRiBwHyccjt/qlT/s8enqSV0lSzcIt63h+3K2/Di3capj/xMa25oDPT
	IY3HdizAd6IN8SxRdEa8n+zpnI4arrG4YmcFd+gF3tpIvRuBa6vqPheDLkF29m3ZtLtGoyDwq6+d5
	5PKyCJcDWraHZPPTsUyChg6QdRDsVGfJfjj39KXabH2jrb2ySKpgjlKp1qqjaDoeDUAlF+hD2zf+U
	tKGsWl5l2jjrXZt7DUtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1Pc-00000005jmY-1bBS;
	Tue, 09 Jul 2024 03:21:04 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1PZ-00000005jkQ-2J4f
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 03:21:03 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 09 Jul 2024 03:18:52 +0000
Subject: [PATCH v4 09/10] riscv: dts: spacemit: add Banana Pi BPI-F3 board
 device tree
MIME-Version: 1.0
Message-Id: <20240709-k1-01-basic-dt-v4-9-ae5bb5e56aaf@gentoo.org>
References: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
In-Reply-To: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=mJc6hZeXKZcPaMSmqXhuz5fuxopioAcnLOzTKcNsQPA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmjKw54FO/wGQQEetIDywkal1MPnSgjquHCTvUC
 2baklrbcrKJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoysOV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277S9oD/0V6Q7ZRNo0qx87KI
 3EXKU34sr343u/RmJm+xgwRZcRUqQDgg0lBxVUiY5uIamSaQdJSE1oZtCH5LADUaowY7Fr6eoXo
 AyUmam25notxo2jNxwVmT758NtSTEcWHS9M6rjh9f5m9fwZhUZaGSJv8vLznMvcLrWRm3tAhOgm
 MHnYhDcikZcpVmJYY1mTzbz+5ggQBD4k+EeAp5Y1kS/thqP60giX11zg/tawRaN+5bG0UcQ6sAO
 KIPsPfnCHR/EMI8hBwTQ1wCwzL8UVzWEmP61X1Ohwg/Sd5Qh8tTT8frRcHjDDOMOdVY/n+lJI8p
 WFvC7MhUiNP2rWJYtfLyVJW+Kl+ZXYxt4YZqWD9BXUUAoZ85LWHXDE1fYxEnA38s6d8eTd9p3dg
 WnZzaCAyufPyl3AuMj9Ju0Kk70LOL5Z0VePu3BwZmyxpInWytJcE6tWM7Bvrf+zmSt3CF2X/eCt
 aNqFMwgURR1cEXSdMwsiZm9QhcLef6f5TVrNVr4oq/potrcH+s3/G3S3vbWdDZxDnL2Lc+F8/2v
 1na6H2dp/Nd2M6cS4bU3OPDFvFAFyQN8xfWJbV6/bu+xmiC1gJZW9JBgWaO8EVP33GV8x9OYM1p
 6nmPq0ElndWRqaPTa+A95c/q4JXcH3lPd3pmhtDmEAUHAFPArjFQJRByibbj2YR7ux2w==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_202101_667690_535C8D5F 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yangyu Chen <cyy@cyyself.name>

Banana Pi BPI-F3 [1] is a industrial grade RISC-V development board, it
design with SpacemiT K1 8 core RISC-V chip [2].

Currently only support booting into console with only uart enabled,
other features will be added soon later.

Link: https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3 [1]
Link: https://www.spacemit.com/en/spacemit-key-stone-2/ [2]
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/Makefile                    |  1 +
 arch/riscv/boot/dts/spacemit/Makefile           |  2 ++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 19 +++++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index fdae05bbf5563..bff887d38abe4 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -5,6 +5,7 @@ subdir-y += microchip
 subdir-y += renesas
 subdir-y += sifive
 subdir-y += sophgo
+subdir-y += spacemit
 subdir-y += starfive
 subdir-y += thead
 
diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
new file mode 100644
index 0000000000000..ac617319a5742
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SPACEMIT) += k1-bananapi-f3.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
new file mode 100644
index 0000000000000..023274189b492
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
+ */
+
+#include "k1.dtsi"
+
+/ {
+	model = "Banana Pi BPI-F3";
+	compatible = "bananapi,bpi-f3", "spacemit,k1";
+
+	chosen {
+		stdout-path = "serial0";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
