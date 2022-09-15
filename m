Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF5CC6FA8D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 18:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0U4w5NR/dgE/meJg+11vKBxuPYzZx7a211m+GdVz6I=; b=JkLdvyIk7eP3Pa
	eHblA3HHOim8PFQzZPbAMp1FrA8Mw+UxefsrTEkNBoYerPBBVvTXZFTE/nLZbA+HKpSG6I5Sms4q9
	Xxe24gYOKsylP20puTowAKXJ4OhZZgtCSIJCuaq8wHBYyC4rCFbjhaOp4T9ODx4hMeboxe95Yxi2k
	rGgWQV9UqoLVyQezZZQ93Pi3algB8AQFKSQ7zLqUfs4/OmIjFNQoI8SduVCQCCSWt67MapjsiWk/0
	wEfoTvGr7yMZwdjmTmZpBeuTl2cBkk66G6TSvmNBs3GO9TGVmXOM9Zapzlv1ZGhihXLsC7SjVlgd2
	wf9GVofkrrYvw2v6hr1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQu-00FUVn-9m; Thu, 15 Sep 2022 18:17:52 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQk-00FU9J-PD
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 18:17:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id i203-20020a1c3bd4000000b003b3df9a5ecbso13497671wma.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 11:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=9s/CP7W96ES5VqAZt40rb7ebkGJqwcyexra6FnDdBm4=;
        b=PE89wCmeFqwCzQWhhn3ZmWfNZ7rGskKL4Irvmk+xnBDWcvWjPrIy4Dz8pKOnBPvqDD
         64PQ8ARWVUXDEZGyVTVWAUNdiSNeaNlyxaQ81g/w6n5yPMpTOJTQXwHh4k9MZj3chUJh
         dp4TfPUfpk7gQaon4ZRdUQEUjFrbKnghNNDmlsK26M0cpUmwzpyxovzmuty5Vf7vOppb
         MwqmZNQvhoahP6azxLGLwKTxBj0vzrAU4fnuLZnpPbmyX1FcEBxRbFJMpVaKnCpSEEoQ
         p9Y1YsDCaMxBBTQr9rY351wHLhsICoiRUWSRo/jz34ysf4Ul6dxA0Cfml862k8aTbqDa
         A5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9s/CP7W96ES5VqAZt40rb7ebkGJqwcyexra6FnDdBm4=;
        b=ZAqrqxLaM9TBKAfQ68CZVvjg9al/2yANi20vXYmP2l/2B4vuGjI/8S1IgXTeCUQOcY
         fvr+RvsYoQbYIzm4w/jIPUIwlBO1jGhhyxjJwss1kHgm3zQBUiufdG7Dnf6Lql2QkFgl
         PGQM6rmjaZLOPAMBhx+tsWB1L5sG1gLVZh0kBtRyW5Mc2wxd1sFJ/QuJuYF2qE9EVAZn
         0NqrTT7TJM8kh1G5xbAl5v2rs10viuYY1SR9XVSwIAutYMdnNKtmxUCs6Js2vvev7G8+
         PTSdNOxoAgMp6DSKM6KZCUP2kIYM13joBCuEKUwC+QlJ7zmdghGamZAHCSTPQ1QKJDoI
         HiAA==
X-Gm-Message-State: ACrzQf16hhoIFol99BTduVSeb5rKy4wPgKcNMOtYzYrTqzSTugQ84JhS
	zoXAnDBbsi0loM2JeQhviSEaCCAkxRvOdg==
X-Google-Smtp-Source: AMsMyM70ZmPPYK+FQLW2Pf4DXNNy9eAb7VvwpOkcQhZ+RdDrJgsAsWS1BDFxditUJ6b+qJqHEoPqWw==
X-Received: by 2002:a7b:ce97:0:b0:3b3:4136:59fe with SMTP id q23-20020a7bce97000000b003b3413659femr812119wmj.24.1663265858196;
        Thu, 15 Sep 2022 11:17:38 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d411:a48b:4035:3d98])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b003b47e8a5d22sm4243151wmq.23.2022.09.15.11.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 11:17:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 08/10] riscv: dts: renesas: Add minimal DTS for Renesas RZ/Five SMARC EVK
Date: Thu, 15 Sep 2022 19:15:56 +0100
Message-Id: <20220915181558.354737-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_111743_082533_2FBC1E9C 
X-CRM114-Status: GOOD (  16.24  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the minimal blocks required for booting the Renesas RZ/Five
SMARC EVK with initramfs.

Below are the blocks enabled:
- CPG
- CPU0
- DDR (memory regions)
- PINCTRL
- PLIC
- SCIF0

Note we have deleted the nodes from the DT for which support needs to be
added for RZ/Five SoC and are enabled by RZ/G2UL SMARC EVK SoM/carrier
board DTS/I.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
* Dropped RB tags from Conor and Geert
* Now re-using the SoM and carrier board DTS/I from RZ/G2UL

v1->v2
* New patch
---
 arch/riscv/boot/dts/Makefile                  |  1 +
 arch/riscv/boot/dts/renesas/Makefile          |  2 +
 .../boot/dts/renesas/r9a07g043f01-smarc.dts   | 27 +++++++++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    | 42 ++++++++++++++
 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 56 +++++++++++++++++++
 5 files changed, 128 insertions(+)
 create mode 100644 arch/riscv/boot/dts/renesas/Makefile
 create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
 create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
 create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index ff174996cdfd..b0ff5fbabb0c 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -3,5 +3,6 @@ subdir-y += sifive
 subdir-y += starfive
 subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
 subdir-y += microchip
+subdir-y += renesas
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
diff --git a/arch/riscv/boot/dts/renesas/Makefile b/arch/riscv/boot/dts/renesas/Makefile
new file mode 100644
index 000000000000..2d3f5751a649
--- /dev/null
+++ b/arch/riscv/boot/dts/renesas/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043f01-smarc.dtb
diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts b/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
new file mode 100644
index 000000000000..9747f30c5db5
--- /dev/null
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/Five SMARC EVK
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+
+/*
+ * DIP-Switch SW1 setting
+ * 1 : High; 0: Low
+ * SW1-2 : SW_SD0_DEV_SEL	(0: uSD; 1: eMMC)
+ * SW1-3 : SW_ET0_EN_N		(0: ETHER0; 1: CAN0, CAN1, SSI1, RSPI1)
+ * Please change below macros according to SW1 setting on SoM
+ */
+#define SW_SW0_DEV_SEL	1
+#define SW_ET0_EN_N	1
+
+#include "r9a07g043.dtsi"
+#include "rzfive-smarc-som.dtsi"
+#include "rzfive-smarc.dtsi"
+
+/ {
+	model = "Renesas SMARC EVK based on r9a07g043f01";
+	compatible = "renesas,smarc-evk", "renesas,r9a07g043f01", "renesas,r9a07g043";
+};
diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
new file mode 100644
index 000000000000..8547c273f140
--- /dev/null
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/Five SMARC EVK SOM
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#include <arm64/renesas/rzg2ul-smarc-som.dtsi>
+
+/ {
+	aliases {
+		/delete-property/ ethernet0;
+		/delete-property/ ethernet1;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+	};
+};
+
+#if (SW_SW0_DEV_SEL)
+/delete-node/ &adc;
+#endif
+
+#if (!SW_ET0_EN_N)
+/delete-node/ &eth0;
+#endif
+/delete-node/ &eth1;
+
+/delete-node/ &ostm1;
+/delete-node/ &ostm2;
+
+/delete-node/ &reg_1p8v;
+/delete-node/ &reg_3p3v;
+
+/delete-node/ &sdhi0;
+
+#if !(SW_SW0_DEV_SEL)
+/delete-node/ &vccq_sdhi0;
+#endif
+
+/delete-node/ &wdt0;
diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
new file mode 100644
index 000000000000..3fde7192241e
--- /dev/null
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/Five SMARC EVK carrier board
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#include <arm64/renesas/rzg2ul-smarc.dtsi>
+
+/ {
+	aliases {
+		/delete-property/ i2c0;
+		/delete-property/ i2c1;
+	};
+};
+
+/delete-node/ &audio_clk1;
+/delete-node/ &audio_clk2;
+/delete-node/ &audio_mclock;
+
+/delete-node/ &canfd;
+
+/delete-node/ &cpu_dai;
+
+/delete-node/ &ehci0;
+/delete-node/ &ehci1;
+
+/delete-node/ &hsusb;
+
+/delete-node/ &i2c0;
+/delete-node/ &i2c1;
+
+/delete-node/ &ohci0;
+/delete-node/ &ohci1;
+
+&pinctrl {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+};
+
+/delete-node/ &phyrst;
+
+/delete-node/ &sdhi1;
+
+/delete-node/ &snd_rzg2l;
+
+/delete-node/ &spi1;
+
+/delete-node/ &ssi1;
+
+/delete-node/ &usb0_vbus_otg;
+
+/delete-node/ &usb2_phy0;
+/delete-node/ &usb2_phy1;
+
+/delete-node/ &vccq_sdhi1;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
