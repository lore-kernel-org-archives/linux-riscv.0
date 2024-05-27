Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205CEC25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7RDhcuLuumQbY5fQXaGLVbdOtaInl495M1c3MGkIUI=; b=BTqyKSXnW4E6Vr
	RfFV6COj0xAHM8LL3bgo5hNui1xMxMQNyvFRmk/33FPZK3fYjT3bkpCyonuZZYfwnciARLGoxtLfj
	n72tKp0AXOM1DWx9rtAwWzOcK0gMRqbKVKMkTFVFPU8kpRcUa8VugdauwYv2T5bBHJAnCYDxAagu2
	qdWi3nljxxPjg6D3WVpPCTLTWlMJXgnRvudeMbj9/CgaC14L0K+QNfpcFEY73o+Yw4q/7w05DWXvr
	yS+6vf5TfVqN70SxXZlCc/HrNZwuw98nb9hVQJHnm6EfIQRXJVcqsqc5qYj3PF1PHk1yCI41hMs9A
	WKq2Vwxxyh55da2eBtbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBXak-0000000Eae2-2a23;
	Mon, 27 May 2024 10:28:34 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBXaf-0000000Eabd-11RX
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 10:28:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 111DE20003;
	Mon, 27 May 2024 10:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716805707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VGTOM0pfiSCveUfaceYtAyHVg+Ep/GypPt5E5h7VYhY=;
	b=C8qDiWZ+ZcP7lbEetHICu5+RHu/QzNHwaRfaMT5c9rHwTyWtpVwralRDGgb1U7+M3Wyuy4
	5sbuZxFxQvSPTqC6csIygrHHkP7k4ecR9LXvAtYK0ROIQp6eGGoZfEL8NM5d4+xRZNtuSd
	Qrt4Xm5XNwyjkIvPekmpmHgGahCO6ptOj9Oo686PV/U+8+4qvhbSVHtqJ2vYQ3JhAmtq3i
	eE20RGfMufo2L2E73dVS95n3M7lvT4pvIdRZ26QjdvMwp22dP0IvW6ha5fAeKDkn6Ssihr
	LF+9D6vOJ1Q+mC936oA9OB5E6uAmk2SpBMo0sQppKE3l33BrpOMCfgIpz63CuQ==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Mon, 27 May 2024 12:28:21 +0200
Subject: [PATCH 5/5] riscv: dts: sophgo: Add LicheeRV Nano board device
 tree
MIME-Version: 1.0
Message-Id: <20240527-sg2002-v1-5-1b6cb38ce8f4@bootlin.com>
References: <20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com>
In-Reply-To: <20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Chao Wei <chao.wei@sophgo.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_032829_472794_32E4834D 
X-CRM114-Status: GOOD (  11.44  )
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

LicheeRV Nano [1] is an embedded development platform base on the SOPHGO
SG2002 chip.

Add only support for UART.

Link: https://wiki.sipeed.com/hardware/en/lichee/RV_Nano/1_intro.html
[1]

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 arch/riscv/boot/dts/sophgo/Makefile                |  1 +
 .../boot/dts/sophgo/sg2002-lichee-rv-nano.dts      | 25 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 57ad82a61ea6..5759b21805dc 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-lichee-rv-nano.dts b/arch/riscv/boot/dts/sophgo/sg2002-lichee-rv-nano.dts
new file mode 100644
index 000000000000..aaad2733801b
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002-lichee-rv-nano.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+ */
+
+/dts-v1/;
+
+#include "sg2002.dtsi"
+
+/ {
+	model = "LicheeRV Nano";
+	compatible = "sipeed,licheerv-nano", "sophgo,sg2002";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
