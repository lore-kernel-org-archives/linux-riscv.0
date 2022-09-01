Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1419AECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 22:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79U08d6TSifQHm4RUPhm4WF44b731b0cQ+nZZCL7VLg=; b=PQYm923feKAsCz
	VItW0W+K8DfFytS6n4KYjbvwQbOzNWm1LSLdDtY962b61qwYm1NPkKEN6dVx2+Rv9Yeg3sQ5NZ6X8
	20rn8M93UuI1XSZnfm6LNCIob4drVAWIPEmfaFvPmE8XCMQ/k0gO/VM2HvPCkB7BcLP0rrQohYfVe
	WAqWzdY3/CLWX0P9xye0dBnc3PcG+CgeHL4auiNBnrDzEiLzSsMC8Ew+6Em5kAR/votD1PNFhf42Z
	HBD9LyA0pU5i5APxFc1+RAeohe6BuuqYigGnre7TfAVTJbuKNd2Nrj0pTuZKI3YtEpyHM93u0Ehoy
	YBEcyRcVFMMDhXjcIJCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsuZ-00FUqG-Gt; Thu, 01 Sep 2022 22:43:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsuT-00FUlv-0D
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 22:43:42 +0000
Received: from localhost (unknown [188.27.54.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A66776601EBD;
	Thu,  1 Sep 2022 23:43:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662072219;
	bh=qSEp5SybsWViAzv/VCOFJkSqNKS5KKyfvzLsd6XpWQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YGTkAEqx1Ndy6V+y1dADJlyc6v+uWY0JXsIUthW+1otCWlyGinNnuKJ5D/3gJ2p85
	 UCmBqEZjbt2SLFVvCwuVJ85VZnGtG1blrWmhiB6lopH0CxWnU0nvXEyGzbXrWsl5aD
	 oEN9RihYRularyWLORY6LYkpFhXn/upsB3PjeCMnToyBLqzzjD/uKyopuhrz18rQq8
	 RmQ3r6FA7EWan0KzxOn68M+7ujxYq/gVimEHEwSEQyJIZwHGXIrySbJ9EljqYuZI/+
	 p/kMH9Xgt4+hnCCTguDKLh2DJNsNyapYmzkX7i3515wtvZJaKvfdzVyy6icFyZKXZw
	 hRW4n584VNwng==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 3/3] riscv: dts: starfive: Add StarFive VisionFive V1 device tree
Date: Fri,  2 Sep 2022 01:42:53 +0300
Message-Id: <20220901224253.2353071-4-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901224253.2353071-1-cristian.ciocaltea@collabora.com>
References: <20220901224253.2353071-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_154341_203001_812044B9 
X-CRM114-Status: GOOD (  13.68  )
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

Add initial device tree for the StarFive VisionFive V1 SBC [1], which
is similar with the already supported BeagleV Starlight Beta board,
both being based on the StarFive JH7100 SoC.

[1] https://github.com/starfive-tech/VisionFive

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/riscv/boot/dts/starfive/Makefile         |  2 +-
 .../jh7100-starfive-visionfive-v1.dts         | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts

diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index 0ea1bc15ab30..039c143cba33 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb
+dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb jh7100-starfive-visionfive-v1.dtb
diff --git a/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts b/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
new file mode 100644
index 000000000000..e82af72f1aaf
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2021 StarFive Technology Co., Ltd.
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+/dts-v1/;
+#include "jh7100-common.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "StarFive VisionFive V1";
+	compatible = "starfive,visionfive-v1", "starfive,jh7100";
+
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpio 63 GPIO_ACTIVE_HIGH>;
+		priority = <224>;
+	};
+};
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
