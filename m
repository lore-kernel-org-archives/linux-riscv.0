Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B8DC369A9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 16:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZqpJtiT8J0cgAkhKdOEpnIo6+gZ2GzToo1UbQrHZbo=; b=bAw4J6+E5DNERd
	dPLJxu8MO0R2DIDkh8/+2XDc+Wj/XnYJj+w2WCGsmeZam7FUI9wnYiVftLH7OmEPOjZfokBAtDYmw
	kVT665vk7zlSKjqgJtr2g//3dbE4BX9nnWBjXi8c2s/cW8hIq0jsmE5fa7J+ED2bU+8NOEiO75JUl
	OwKJRbm4rcrvpBUpRNGWHGyCr+P6EtJQc4u118UdvQx+iBiNQlbdYmmol79cqb/XvxjCivQzljwEp
	XTxrc+IGwclxD7uItSaUDyAQ86wYhoo1plyFObiPY/3Bbj4Ks4EyeyNykrwdLJjTVBmv6tdaiuSU4
	77AUZv+D9rQVI+RkIUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ugq-0000000BACR-2yRN;
	Thu, 10 Apr 2025 16:23:44 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tmX-0000000B0Vx-1Stf
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 15:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=2333; q=dns/txt;
  s=NAESA-Selector1; t=1744298733; x=1775834733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wu4oKS0KTSOgNU0dGCxiBbNlozxgCXIDJmii7C05EZo=;
  b=ea2KFv/VmW1yNpnqX/rwgLmDt5B6uAjFxh3QdO2APCVKOSAn9fwrJ2Wc
   2UA3LHNjRkLynj0PtS4+Hex//Uv+MWzGSc3NxZ3OAipBnXIVoI1QVChvP
   tgB+zneX/WMA4/gZyJejZBWhePsDBr7fo9uzukOV0ZpD1JLSL+yWRMgXO
   WGMz4FRWpKs3hsdi1ADcP3KR+yzejB3BOTj/993DT1ch5Yet5/G3q4YSf
   Pa/nHAQkU7mLKb0gyg3LzSOf4gKwyxtPhVTuPTp2CQfRgS/C5zkuez/oJ
   6jO+U4rgEBHwfjtHwgDnWNApN2ghiI4vfgXqAOvux9jRQlENv7zK6BK1M
   Q==;
X-CSE-ConnectionGUID: suUACVkyQ22S5KQmstt3Bg==
X-CSE-MsgGUID: 1OS1JZhXRsa/TjxyXZRkUA==
X-IronPort-AV: E=Sophos;i="6.15,202,1739862000"; 
   d="scan'208";a="22515105"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 10 Apr 2025 09:25:32 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 10 Apr 2025 20:55:20 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/10] riscv: dts: eswin: add HiFive Premier P550 board device tree
Date: Thu, 10 Apr 2025 20:55:19 +0530
Message-Id: <20250410152519.1358964-11-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Apr 2025 15:25:20.0274 (UTC) FILETIME=[C548FF20:01DBAA2C]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_082533_468305_F8720057 
X-CRM114-Status: GOOD (  12.16  )
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

From: Min Lin <linmin@eswincomputing.com>

Add initial board data for HiFive Premier P550 Development board

Currently the data populated in this DT file describes the board
DRAM configuration, UART and GPIO.

Signed-off-by: Min Lin <linmin@eswincomputing.com>
Co-developed-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/boot/dts/Makefile                  |  1 +
 arch/riscv/boot/dts/eswin/Makefile            |  2 ++
 .../dts/eswin/eic7700-hifive-premier-p550.dts | 29 +++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 arch/riscv/boot/dts/eswin/Makefile
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 64a898da9aee..29a97a663ea2 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += allwinner
 subdir-y += canaan
+subdir-y += eswin
 subdir-y += microchip
 subdir-y += renesas
 subdir-y += sifive
diff --git a/arch/riscv/boot/dts/eswin/Makefile b/arch/riscv/boot/dts/eswin/Makefile
new file mode 100644
index 000000000000..224101ae471e
--- /dev/null
+++ b/arch/riscv/boot/dts/eswin/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_ESWIN) += eic7700-hifive-premier-p550.dtb
diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
new file mode 100644
index 000000000000..131ed1fc6b2e
--- /dev/null
+++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2024, Beijing ESWIN Computing Technology Co., Ltd.
+ */
+
+/dts-v1/;
+
+#include "eic7700.dtsi"
+
+/ {
+	compatible = "sifive,hifive-premier-p550", "eswin,eic7700";
+	model = "SiFive HiFive Premier P550";
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
+
+&uart2 {
+	status = "okay";
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
