Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B129C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 14:04:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 244B622BF5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 14:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 244B622BF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yS83IJJycXOmctrGDkZJbKs48U5dt7d6nDHhi+RxG3U=; b=AR3E1aKxsMUprnlgHecorGzrS
	0HxPKOqQho2hNFCixaIlO2NcvmDAA8YnRELD7RqcqcXKuzM4X3ZDv7FYu+Yd5BMbXMNPDctaJrHfD
	JO+QtL9krvFwi5EF39Eir3n9LqTIh7PqF/7GD6vwdNAkWyimq0gb7Bjiq4y93Fy/ywDai7hCY/TdT
	eiWWsDc4bqMiA0/oweMEY07o1YvceErb3K4N8nzZJA+0Gqp6QUgcmUp/CD2lTbXeRsjszHVA5Svwu
	VBKqAR/VqWBZ1jvH8VCAkviEPn8urolQqQFeLbgNuXpdwQ+cPWy5evPT2I+rPbFc5Jhx9l8n+CnGH
	l2aKdkSrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knMY3-0000co-NB; Thu, 10 Dec 2020 14:03:59 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMXg-0000Pw-V5
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 14:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607609316; x=1639145316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5HeCPpC2eIy6wf3Z5moPS/TBbmANlueIBuGfBKoPqYw=;
 b=AjZw0ctL3vc3lS6cPobPgxw8j+H6SgyWEn/NrviPQkAEKqB9FChOrDOU
 z/NYOa2AZZeNEqsLhZ4H5RJFeQmkVAJwfzfgbg48a3KVP5b5YbtoVNuEP
 hM78Va9UICd/HMVECSrOPc8+C6zz6Di6LkhHj1hudNdwGl08j40Ks8XA9
 7OEC6h8OhbESdpbNI9BPaB0sui5jgSK2sMjVqmVKLrcIDByHRCdhv/PFr
 HI98L1KLTWBC//ja1ZepS1u5u/novxrn9jCVfaiQrUQm/rz+FN6Q5upXS
 w4JMX0ygrBA2Isi8aTJ3u61vlCbOtPUxEvPo94hdXLTrDey74ZzvzGAY1 w==;
IronPort-SDR: tpMN9ATM2LjE1DUe8dTfihRWlsHt9uPGpdmxUQe8YBuOYHOIBgfTTaawSFDWBesWoeh84lQX0T
 IzAauyUCMHpF8UPd+lk5ucLlkVEyLK9hYhUI6grdkJIM1LqFaBVxw/QeB2uZmirpZP/cTvaKki
 H0myl2MM1bjZb2xj+ve/3OU9eTsL1gVe/guucp6iYEjPdxASF8xcOdEIaIrz1+B1JJNz6blQeW
 W9vEXcvJE6tc+mjlN7plPSZWI2X9l3DTac9FSfuq2roRv5UIBKPO60wJGy2YJFlO8eudvSSdMV
 kSI=
X-IronPort-AV: E=Sophos;i="5.78,408,1599494400"; d="scan'208";a="258584840"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 22:08:35 +0800
IronPort-SDR: Nx4GC+bkKfnVWYNrGnlORtRKkslFeFJyNg5em/xTF5lqfgOG1CbgWNKIIpyj9DZ7wMbLlU7394
 XVwSNJI4EDitKkn4TiRhBy+EuwsQ1zqZw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 05:47:28 -0800
IronPort-SDR: /epogBhLeR3572DbcYQ7HyAhK9OpEtxRa6qMzBBSROf5shuVU7mWQAXgqew+Z5qzgF7tf0755c
 nHJPO+KQchqQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Dec 2020 06:03:35 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v8 09/22] dt-bindings: reset: Document canaan,
 k210-rst bindings
Date: Thu, 10 Dec 2020 23:03:00 +0900
Message-Id: <20201210140313.258739-10-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210140313.258739-1-damien.lemoal@wdc.com>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_090337_235629_33DFEB4C 
X-CRM114-Status: GOOD (  15.56  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Document the device tree bindings for the Canaan Kendryte K210 SoC
reset controller driver in
Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml. The header
file include/dt-bindings/reset/k210-rst.h is added to define all
possible reset lines of the SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../bindings/reset/canaan,k210-rst.yaml       | 40 ++++++++++++++++++
 include/dt-bindings/reset/k210-rst.h          | 42 +++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
 create mode 100644 include/dt-bindings/reset/k210-rst.h

diff --git a/Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml b/Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
new file mode 100644
index 000000000000..53e4ede9c0bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/canaan,k210-rst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan Kendryte K210 Reset Controller Device Tree Bindings
+
+maintainers:
+  - Damien Le Moal <damien.lemoal@wdc.com>
+
+description: |
+  Canaan Kendryte K210 reset controller driver which supports the SoC
+  system controller supplied reset registers for the various peripherals
+  of the SoC. The K210 reset controller node must be defined as a child
+  node of the K210 system controller node.
+
+  See also:
+  - dt-bindings/reset/k210-rst.h
+
+properties:
+  compatible:
+    const: canaan,k210-rst
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - '#reset-cells'
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/k210-rst.h>
+    sysrst: reset-controller {
+      compatible = "canaan,k210-rst";
+      #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/reset/k210-rst.h b/include/dt-bindings/reset/k210-rst.h
new file mode 100644
index 000000000000..883c1aed50e8
--- /dev/null
+++ b/include/dt-bindings/reset/k210-rst.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2019 Sean Anderson <seanga2@gmail.com>
+ * Copyright (c) 2020 Western Digital Corporation or its affiliates.
+ */
+#ifndef RESET_K210_SYSCTL_H
+#define RESET_K210_SYSCTL_H
+
+/*
+ * Kendryte K210 SoC system controller K210_SYSCTL_SOFT_RESET register bits.
+ * Taken from Kendryte SDK (kendryte-standalone-sdk).
+ */
+#define K210_RST_ROM	0
+#define K210_RST_DMA	1
+#define K210_RST_AI	2
+#define K210_RST_DVP	3
+#define K210_RST_FFT	4
+#define K210_RST_GPIO	5
+#define K210_RST_SPI0	6
+#define K210_RST_SPI1	7
+#define K210_RST_SPI2	8
+#define K210_RST_SPI3	9
+#define K210_RST_I2S0	10
+#define K210_RST_I2S1	11
+#define K210_RST_I2S2	12
+#define K210_RST_I2C0	13
+#define K210_RST_I2C1	14
+#define K210_RST_I2C2	15
+#define K210_RST_UART1	16
+#define K210_RST_UART2	17
+#define K210_RST_UART3	18
+#define K210_RST_AES	19
+#define K210_RST_FPIOA	20
+#define K210_RST_TIMER0	21
+#define K210_RST_TIMER1	22
+#define K210_RST_TIMER2	23
+#define K210_RST_WDT0	24
+#define K210_RST_WDT1	25
+#define K210_RST_SHA	26
+#define K210_RST_RTC	29
+
+#endif /* RESET_K210_SYSCTL_H */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
