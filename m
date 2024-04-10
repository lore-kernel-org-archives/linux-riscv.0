Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5490CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 05:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L9aXt4HfZgucRlZsSpqRbDMzFOtIWM6b5YbgaOuRwI4=; b=GmBbBUKSSj/GsW
	DdIU4dizDvb1FWSrMNnAAI95WgIdCUdNq7kONsl8hIRkfJEfLn/ZmZSt+KdOMfjWDxGQ3cVo8w32S
	CJAQ754HhagXwB/53v75EkwwrYi8JjkUi6O5QyyM+toC8ZAE3JGYr0t1Tiw/jOxc26SzbXrKKEhkm
	8bZJBa3XFv33qtAt35G/jksVgeuZD5Z/Z7MM6m4qKbmihlA4j1CylmyNV+AYiIDvBTomwZgiy/3zb
	wMlywGI3WSG3wSOfr/lyLZu46m0u9ADa12+2KpwwS2qJjbZ0LMmQEIcRn27IrPI6C5ionWgXQuo44
	hDnFPn0kRsLcjZk+prGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruQTM-00000005Bjn-2sWC;
	Wed, 10 Apr 2024 05:26:12 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruQTI-00000005Bh5-0CJ1
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 05:26:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D39F40004;
	Wed, 10 Apr 2024 05:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712726765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Um4WIpNb1+UQMrQR3QwYZbAFwR55RaRCf7rvIeJqRyQ=;
	b=DKJGJ4TUpnK07O1tTxfbOo9Jn8xpVTX6kkZmlkw00Sk6w32AukkU75a+BZNFF3UIb4lUCn
	xio1pN0aJjZhkrosFz8LwK1uxNOIIc4KfIeJJUKEmu2XZWVnwJ5/JVD57couggLOZ5uKvv
	yA+X/UBKjnSwBajOr/NDc45wqbg1LZIR/oYW58Jel8PHi1wz4CYYHtkgg6m8C299V8uBeg
	8vCRjeLn8JKgi6SQ0hQiSavczaBeG/8O+zh4PfXkAY1uKjjmtnTzJNR8TDbccGzWRVW2vx
	foF/5dSDWVn2cuswImvQ/z7sHzbfSmzmT7QHfApy4C76BU04asG/iPyBuXygMw==
From: michael.opdenacker@bootlin.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] riscv: dts: sophgo: add initial Milk-V Duo S board support
Date: Wed, 10 Apr 2024 07:25:18 +0200
Message-Id: <20240410052518.2945789-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410052518.2945789-1-michael.opdenacker@bootlin.com>
References: <20240410052518.2945789-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_222608_526000_3C74F0FE 
X-CRM114-Status: GOOD (  13.46  )
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

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This adds initial support for the Milk-V Duo S board
(https://milkv.io/duo-s), enabling the serial port and
SD card support, allowing to boot Linux to the command line.

Link: https://lore.kernel.org/linux-riscv/171266958507.1032617.9460749136730849811.robh@kernel.org/T/#t

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duos.dts     | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 57ad82a61ea6..e008acb5240f 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duos.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts
new file mode 100644
index 000000000000..679d2854938a
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2024 Michael Opdenacker <michael.opdenacker@bootlin.com>
+ */
+
+/dts-v1/;
+
+#include "cv1800b.dtsi"
+
+/ {
+	model = "Milk-V Duo S";
+	compatible = "milkv,duos", "sophgo,cv1800b";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&sdhci0 {
+	status = "okay";
+	disable-wp;
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
