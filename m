Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68D4C38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 17:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/TrSMludLm6OBYlHSE5zunRGu4yNZ1xmHdOEkWfRBw=; b=k+3wa4vihXblDs
	xAFWp1K7JxklnIxf3ly5y0T3+I+lRiI8+CwOneDxq+JaoJo+8ITD/a808Pfh3OQfVlMf1VdYGGz2t
	5OP2s4nd/uBvxDwVUuZkUm/3ybNgsCEM1cNU+1SUw/gj0EM3nPPTdae6C5J7NL0dLTncTXC/31km0
	xB+topBBwVKWDP1WAMq8xN1t9h0gQZcXvwatwxb68Pg9mCeq+hDUmfoisaqr3iTpILtTf2W0+4imG
	xZSb8hiE5Pl49RtA2jeeEPMuQFuywv9Uq74zAwEtO36BNYmWFAdxEHeRA23mTFk4/DcFsrDGskZpM
	iXqxQaW6dV5o6vU8UJug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooTC7-001JtE-Ol; Fri, 28 Oct 2022 17:30:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooShm-0015jM-Lk
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 16:59:40 +0000
Received: by mail-wr1-x42a.google.com with SMTP id w14so7392939wru.8
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 09:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmXIzlpO0gFQLKDuK9Y+/vStvG2XBv+k8tbLnLpI/QU=;
        b=NNeyX4eVp+vD3a/v2WLr4fhdRD8jG/m93zesdzYW/JoOkn3VBrCW94/p72lptdYMhh
         LKUj/oW8weroIIvzbtFDeZe7FEus8A7G+nLmZXysMh5M5fv7NGR0Bj3dcJALYmE/MEkT
         a15f5ebGYTCQdRgCnCXsVxR+ui0ptyZ1BSy2GHn+e5oE0+e7gHAN1djT7qSjvfb4OsNi
         2DoOX0EwyzOyiVIZNukWieHX8ZLmv69zKEZL+rJCfUoQDbC6anCCwfRiFXhb9LDTkIPA
         79UNbrJ0l6fES+INQ87w/sl47BNeqF2ejMSVOI/iZu52byZQLycWBeRsrWTbBqhOxeZn
         UZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmXIzlpO0gFQLKDuK9Y+/vStvG2XBv+k8tbLnLpI/QU=;
        b=67leFOpG2G8zWgVeEKOl/IyXCD4q9t5TfjO2abVhSXiJcSJIrCm/TORS7mRhhBFqMT
         8+cElY5ceOJL5itT35NEQUjzAIXZVTL6DYbKQx37spBxslGgarC6hRyIszxgATty4Dp3
         TcpEJtA1ILbUe5SKMEwsL/GhH7GsIu6Og6EbCddr7FHjGSzCr99JMpfRtrmeK0V/bmSR
         Y8k5Q9E8O7J31X1PHeLLaF6OBCjyVwTz2QmjdhP1o1WbaB6hMEZPmJPPKTemMCTEn/JH
         PkGrYdoIfMxGC9nYZRvogvpYTqRgtFbNDrqAmks2g+4JvPj7cY08k3CwAe32yzSOp/jV
         lYEg==
X-Gm-Message-State: ACrzQf3BrgPR5uJiyDu2GpG0B3lCsQV3GvysphObAA+bxkbHSYPzuHJv
	NZaKYvcuVkApbLQpG3vnHYE=
X-Google-Smtp-Source: AMsMyM4/d88zQ1rwA6shjvVG+I66Pv7iM990INblpkrcBN+AWGv0ngiDLIidPv35QgwBU7z9lCldlg==
X-Received: by 2002:a05:6000:1863:b0:22e:6946:be33 with SMTP id d3-20020a056000186300b0022e6946be33mr182553wri.630.1666976376943;
        Fri, 28 Oct 2022 09:59:36 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d53b:eaf9:15f:6a8a])
        by smtp.gmail.com with ESMTPSA id h2-20020adfe982000000b002322bff5b3bsm4939689wrm.54.2022.10.28.09.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:59:36 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 5/7] riscv: dts: renesas: Add minimal DTS for Renesas RZ/Five SMARC EVK
Date: Fri, 28 Oct 2022 17:59:19 +0100
Message-Id: <20221028165921.94487-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_095938_767794_C7572A5E 
X-CRM114-Status: GOOD (  17.26  )
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

Below are the blocks which are enabled:
- CPG
- CPU0
- DDR (memory regions)
- PINCTRL
- PLIC
- SCIF0

As we are reusing the RZ/G2UL SoC base DTSI [0], RZ/G2UL SMARC SoM [1] and
carrier [2] board DTSIs which enables almost all the blocks supported
by the RZ/G2UL SMARC EVK and whereas on RZ/Five SoC we will be gradually
enabling the blocks hence the aliases for ETH/I2C are deleted and rest
of the IP blocks are marked as disabled/deleted.

[0] arch/arm64/boot/dts/renesas/r9a07g043.dtsi
[1] arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
[2] arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4 -> v5
* Reworked completely (sort of new patch)

v3 -> v4
* Dropped deleting place holder nodes
* Updated SW1 settings comment
* Update commit message

v2 -> v3
* Dropped RB tags from Conor and Geert
* Now re-using the SoM and carrier board DTS/I from RZ/G2UL

v1 -> v2
* New patch
---
 arch/riscv/boot/dts/Makefile                  |  1 +
 arch/riscv/boot/dts/renesas/Makefile          |  2 +
 .../boot/dts/renesas/r9a07g043f01-smarc.dts   | 27 ++++++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    | 58 ++++++++++++
 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 91 +++++++++++++++++++
 5 files changed, 179 insertions(+)
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
index 000000000000..2aa8515451d3
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
+ * Please change below macros according to SW1 setting on the SoM
+ */
+#define SW_SW0_DEV_SEL	1
+#define SW_ET0_EN_N	1
+
+#include "r9a07g043f.dtsi"
+#include "rzfive-smarc-som.dtsi"
+#include "rzfive-smarc.dtsi"
+
+/ {
+	model = "Renesas SMARC EVK based on r9a07g043f01";
+	compatible = "renesas,smarc-evk", "renesas,r9a07g043f01", "renesas,r9a07g043";
+};
diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
new file mode 100644
index 000000000000..45a182fa3b4b
--- /dev/null
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
@@ -0,0 +1,58 @@
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
+
+	/delete-node/opp-table-0;
+	/delete-node/thermal-zones;
+};
+
+&adc {
+	status = "disabled";
+};
+
+&dmac {
+	status = "disabled";
+};
+
+&eth0 {
+	status = "disabled";
+};
+
+&eth1 {
+	status = "disabled";
+};
+
+&ostm1 {
+	status = "disabled";
+};
+
+&ostm2 {
+	status = "disabled";
+};
+
+&sdhi0 {
+	status = "disabled";
+};
+
+&tsu {
+	status = "disabled";
+};
+
+&wdt0 {
+	status = "disabled";
+};
diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
new file mode 100644
index 000000000000..e64f0e5f8e30
--- /dev/null
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
@@ -0,0 +1,91 @@
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
+&canfd {
+	status = "disabled";
+
+	channel0 {
+		status = "disabled";
+	};
+
+	channel1 {
+		status = "disabled";
+	};
+};
+
+&ehci0 {
+	status = "disabled";
+};
+
+&ehci1 {
+	status = "disabled";
+};
+
+&hsusb {
+	status = "disabled";
+};
+
+&i2c0 {
+	status = "disabled";
+};
+
+&i2c1 {
+	status = "disabled";
+};
+
+&ohci0 {
+	status = "disabled";
+};
+
+&ohci1 {
+	status = "disabled";
+};
+
+&phyrst {
+	status = "disabled";
+};
+
+&sdhi1 {
+	status = "disabled";
+};
+
+&snd_rzg2l {
+	status = "disabled";
+};
+
+&spi1 {
+	status = "disabled";
+};
+
+&ssi1 {
+	status = "disabled";
+};
+
+&usb0_vbus_otg {
+	status = "disabled";
+};
+
+&usb2_phy0 {
+	status = "disabled";
+};
+
+&usb2_phy1 {
+	status = "disabled";
+};
+
+&vccq_sdhi1 {
+	status = "disabled";
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
