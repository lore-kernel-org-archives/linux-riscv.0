Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D082CF9C5B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Sep 2024 05:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-Id:Subject:Date:To
	:From:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ye2D4r8CJvsQb4Nk4406ULzwWxX9uO1OwdtFynK6icQ=; b=eeJa4+bdmzKxPr
	lJKyEXTjpwjyUAFlM1aMOA+ivUouW3en6bILRmcy5LImYxwYuahHWJZM/u/HGvkFj8fJKRCbs3DXJ
	9kQ+0q4qC75P7sml7cwIO0RabnAM2OrwePio/1yoNstrzL/H+lA2auAQsWt1V2lpBdpIg8gEaNlRw
	c/4CWnMYLgh3ugzotUd+EMubM4gFinEU7kqGpJyFDblJPKHS0LBVL1Rk3PGS3yXibw448v1960Gmo
	O8xij29zTnUK4LR7kISBaKkd5B4G+RGxvJl2o8pFYwh2S+minnZ8X6/mynmZzKQpH6qkAxejcJVnD
	qVCrHAWRejUa0d0r8s3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssbks-0000000GLY5-1pUO;
	Mon, 23 Sep 2024 05:37:02 +0000
Received: from va-2-32.ptr.blmpb.com ([209.127.231.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssbkp-0000000GLX9-3uM7
	for linux-riscv@lists.infradead.org;
	Mon, 23 Sep 2024 05:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1727069813;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=ZbMcawlsAgdaVt5ccYbl800Dyq5oo00DqzA8zRTS0iU=;
 b=YMFGpOCB0uXyMUJruf3Orxy3f66ALntYk2cCmOylfk6VafWamyS41YLlSRNJBODnfd8wVo
 XXner3jn1Deil2HTzZLl2YP2Rw6CKDUJnBDstbWCl22MZ764Noi2H5M910W6xxy+YVmkTu
 vdxwAMqXFel13RyYWj4EdJtYE1hiTCaV/fbzs5vyE08JOqrooSKsNbWakxR4dvewVZmsAr
 k+sqXzs0OqqWzFTO9rqo74veXV1lvLOSZ3zinDknpFlGanqFhBDZ2K44UfzFEdOoX7kFCS
 J8MeB8OfjdyS4aH81xC8d8rPd6bFRiZaEHKWISOzi0aQHEnVj4qDU3eowHKT3A==
Cc: "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
To: "Emil Renner Berthing" <kernel@esmil.dk>
Date: Mon, 23 Sep 2024 13:36:20 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.34.1
Received: from roma-MacBookPro.. ([61.141.249.188]) by smtp.feishu.cn with ESMTPS; Mon, 23 Sep 2024 13:36:52 +0800
Subject: [PATCH 1/2] riscv:dts:starfive:add framework dts
Message-Id: <20240923053621.1585972-2-sandie.cao@deepcomputing.io>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+266f0fe75+73ce6b+lists.infradead.org+sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_223700_076836_EFC8B766 
X-CRM114-Status: UNSURE (   8.93  )
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

Add dts to support RISC-V Framework Laptop 13 Mainboard. 

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/starfive/Makefile         |  1 +
 .../boot/dts/starfive/jh7110-framework.dts    | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-framework.dts

diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index 7a163a7d6ba3..ebc8966fde0c 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -12,3 +12,4 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-framework.dtb
diff --git a/arch/riscv/boot/dts/starfive/jh7110-framework.dts b/arch/riscv/boot/dts/starfive/jh7110-framework.dts
new file mode 100644
index 000000000000..4da7ade5c8e7
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-framework.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+/dts-v1/;
+#include "jh7110-common.dtsi"
+
+/ {
+	model = "jh7110 framework";
+	compatible = "jh7110 framework", "starfive,jh7110";
+};
+
+&gmac0 {
+	status = "disabled";
+};
+
+&gmac1 {
+	status = "disabled";
+};
+
+&usb0 {
+	dr_mode = "host"; /*host or peripheral*/
+	status = "okay";
+};
+
+&pwmdac {
+	status = "disabled";
+};
+
+
+&pcie0 {
+	status = "disabled";
+};
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
