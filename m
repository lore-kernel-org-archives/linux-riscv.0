Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21BECF9C71
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 05:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Subject:From:Mime-Version:
	Date:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Fku906Nxe1dM2V5FdqUnaAus1hT3qwY+8OLP/QIAnc=; b=cWikH/Ch9EIpDR
	NqOnIABtm8S2d2SFih58gToC9XYITR7SF6blS43M0KWi21w3LwaSDq9J06eGbUkXUy1HkBFmkXZ27
	Eu6oqX+fN4g4+e9Px8k00Xbc8Mf0fNmPYVdiBbSUsAKpYYIRWu/aMGNG25/GU4c40p27Y8lK1apPA
	5KCjWEGPiUNSwppqirKjbMz3Gal9RZrnI6S+tOhmRq9QP1MuRSz/rbK8f1v2NvRJ4jXa5FpxehIIL
	wCX7UmOOCgJIIq9YSM5mOwnfLQkQmq1FKezJ8bRfFipD9CEDNm2UemzixfcaKElowXANGaQgYB7kI
	7huvXnB3ObjllHulD/9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stKdj-000000043lH-36fF;
	Wed, 25 Sep 2024 05:32:39 +0000
Received: from va-1-20.ptr.blmpb.com ([209.127.230.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stKd9-000000043cb-2LlI
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 05:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1727242317;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=pGWCgDk61rwIBgwBo0KUX98obiQ99nTGhun7/GfXg38=;
 b=piCUif4NF9SJ+UBY6eg0wjhZXap4PtikstBTPmYfyjoK0YMUH4PzaL/amg/qUVC0/NbCR1
 yDsJzIG2NW84YdayC7WeuVepYqglyDyWzT9YhyYwfC/DBhh92MpH4K/78fd9pt4hbTe9Ow
 iU/trsrV5pLVcpgbEU77Ae0s4ambO8XwqqSpNUCEFEdoD5cqbd9WFNte7Ic3LVHYOd4qX3
 4xMu1hcbixfR/NAhd40NcpdyBpLejLdzS41sRih2QmN5286NK3ImxLGTZJCefu1wz1knjb
 OAors1y5aSGkpu2QevLokLaNdDC1hSKElO6D/+UIbJVKgHxqN6GGG4wqB09gXg==
X-Mailer: git-send-email 2.34.1
To: "Emil Renner Berthing" <kernel@esmil.dk>
Cc: "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>, 
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
Date: Wed, 25 Sep 2024 13:31:23 +0800
Mime-Version: 1.0
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+266f3a04c+64084f+lists.infradead.org+sandie.cao@deepcomputing.io>
Subject: [PATCH v3 3/3] riscv: dts: starfive: add framework dts
Message-Id: <20240925053123.1364574-4-sandie.cao@deepcomputing.io>
Received: from roma-MacBookPro.. ([61.141.249.39]) by smtp.feishu.cn with ESMTPS; Wed, 25 Sep 2024 13:31:55 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_223203_791577_48C8BF64 
X-CRM114-Status: GOOD (  10.44  )
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


DeepComputing is creating a RISC-V Framework Laptop 13 Mainboard 
powered by a StarFive JH7110 processor.This is a developer-focused 
product, aimed at making tinkering with RISC-V more accessible.
The Mainboard is under development and we'll share more on functionality, 
compatibility, and availability as the program progresses.

For this Mainboard, the Model name in Framework is Framework FRANME0000;
the Model name in DeepComputing is DeepComputing fm7110.

The board features:

- JH7110 SoC
- 8 GiB LPDDR4 DRAM
- 1x Type-c(PD3.0:60W Max;usb3.2 Gen1;usb2.0;DP1.4:4K@30Hz/2.5K@60Hz)
- 1x Type-c(PD3.0:60W Max,usb3.2 Gen1;usb2.0)
- 2x Type-c(usb3.2 Gen1;usb2.0)
- 1x eMMC slot Support 32G/128G
- 1x MicroSD slot
- 1x QSPI Flash
- 1x PCIe Wi-Fi (Support AMD RZ616 Wi-Fi 6E,Intel Wi-Fi 6E AX210 No vPro)

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
