Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CF8CF9C71
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 08:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Mime-Version:From:Date:Subject:
	Message-Id:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=64EE0RHQJZbG9zKeh/cLBzVhpGKFlNsG0oqtiAqW9Pg=; b=o3ekAtL2bWEhjr
	f1X/77mHvaNGGJG26UTba+wTXq0MDAdOc4NGGcZEg71zKjFinwqo3T2rDq9EOWpHk1iYq8/eTIX9H
	6U9qNJXVkdzi3I0TEszU/i6CEBqe7u8tGV9SSKydaaTVzMzAi0JUFtHkYb6ZjmFxyV+x5BAWoGMRK
	vrm9tcYsdyskLqXfR5CshwWyq4TnukM6Z2Fy9vhlA7mFBNne/knu6upE/qf6skJrxagqNUPUX+mVo
	UK1Bh7Gw6TrUYJQQVs6J/4qZtYQxxes2WHLbqKnZr2K0m7v1oLHRqLdNdrNTHDRvqTnExMkri96mr
	kJ3ApThbDVOS6ZeYR5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st0a9-00000001X6H-20aq;
	Tue, 24 Sep 2024 08:07:37 +0000
Received: from va-2-45.ptr.blmpb.com ([209.127.231.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st0a7-00000001X4u-1PpI
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 08:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1727165249;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=fzkxprVY0lk6xx/1RY0VC7ls/cvJeG6XaU2AqRX8C3A=;
 b=StysXZtUGeWXIFxFcA71ZhQdQVvChJmXX+WuGWgtzG+RaR/VOQMNoC97HSpweEi54Lpbr0
 Uxfw5RIJNRlOz0vOaZv7wRKHV2Su0MGEvVNs44WcLyhYRPcRpuHuWcXi4cy3qHAvObhqi4
 2oxLmMWlRUxz8JwUz5tw9OJUtMFcNrCdeMPxHmNXvm8IY+pWYQmWenZxRNre8k8F8YM+ii
 zYMBpP4byLXWvjk2DeAPCPJ6L/4PtqHrPtrJzive9MPFimkMfroQTos4UnfMuX7238Ka/I
 tPApxEpZ/qyB1HkcW1b4qBfJpNzkCvq+8jIb2yitq/PfxdSWmHIy/YC/bmMPkg==
X-Mailer: git-send-email 2.34.1
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: "Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heiko Stuebner" <heiko.stuebner@cherry.de>, 
	"Neil Armstrong" <neil.armstrong@linaro.org>, <rafal@milecki.pl>, 
	"Linus Walleij" <linus.walleij@linaro.org>, 
	"Michael Zhu" <michael.zhu@starfivetech.com>, 
	"Drew Fustini" <drew@beagleboard.org>, <linux-riscv@lists.infradead.org>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<dhs@frame.work>, <ams@frame.work>, <gregkh@linuxfoundation.org>, 
	<yuning.liang@deepcomputing.io>, <huiming.qiu@deepcomputing.io>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20240924080650.1345485-4-sandie.cao@deepcomputing.io>
Subject: [patch v2 3/3] riscv: dts: starfive: add framework dts
Received: from roma-MacBookPro.. ([61.141.249.39]) by smtp.feishu.cn with ESMTPS; Tue, 24 Sep 2024 16:07:27 +0800
X-Lms-Return-Path: <lba+266f27340+7eb816+lists.infradead.org+sandie.cao@deepcomputing.io>
Date: Tue, 24 Sep 2024 16:06:50 +0800
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Mime-Version: 1.0
To: "Conor Dooley" <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_010735_482295_74A3551B 
X-CRM114-Status: GOOD (  10.00  )
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

Add framework dts to support RISC-V Framework Laptop 13 Mainboard.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/starfive/Makefile         |  1 +
 .../boot/dts/starfive/jh7110-framework.dts    | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-framework.dts

diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index 7a163a7d6ba3..3746f7122834 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -8,6 +8,7 @@ DTC_FLAGS_jh7110-starfive-visionfive-2-v1.3b := -@
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-beaglev-starlight.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
 
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-framework.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
diff --git a/arch/riscv/boot/dts/starfive/jh7110-framework.dts b/arch/riscv/boot/dts/starfive/jh7110-framework.dts
new file mode 100644
index 000000000000..ff12c24ebab3
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-framework.dts
@@ -0,0 +1,34 @@
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
+	model = "Framework FRANME0000";
+	compatible = "deepcomputing,fm7110", "starfive,jh7110";
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
+	dr_mode = "host";
+	status = "okay";
+};
+
+&pwmdac {
+	status = "disabled";
+};
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
