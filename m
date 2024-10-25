Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11536D0C605
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+F5ghGOjvE733s8Y4JEYFm8glI/PXztP9yLHq7SnRY=; b=LvJ1Xj1aw0X6GR
	x2RrAunTiLwaRIoi1JGGKEhVpxdbh+YNV8hjHHWwPtmBfELBO6NokZrd4wfrICUm48kvyI6DMy0ZJ
	d8wFEj2oL3RCierdoxKO1Srt9lWJT2AOPd30LACDVA0sR5D7Lvmj/AWtwg19YHvaLshwS4m0xdbfx
	HfdRiLKnREQSpm1LIytnyxHyG5NgNZpXYAY1wjTZalpd+PPhuP1fi9s5uU2pH92T8V/gUWH/NeX8v
	ElPWBxY+jzUFycpn6pQAL0ks0NML8VXOTnz/Ue7cdZeBAfVxUA/5gmYjJpexv8vztPWsnQ804UZWL
	VBwmDy7JZ8bgomHFKvFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IwX-00000003aDJ-2hyj;
	Fri, 25 Oct 2024 11:57:25 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IVa-00000003W1C-1BYw
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 11:29:35 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71e5ae69880so1339265b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Oct 2024 04:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855773; x=1730460573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIGxF2ZObIsraW8vGBCdt5dvhIiK6tBRnTKa3/XZgvQ=;
        b=M9mtTUzj8pm5Ic70vF8PyH+6AVfsA97cYPOCVjUXu58ybUpISGx7oSoiG9k+iocerS
         EOfvMXbZegkgxctAYcJU6xC7osDmyYlU+JIN/EvNb8r/stPDc2br27vN78csa6u4pq+p
         tdB/V91lzJrljRIVX1aYBo+LsPubOd4IeasnAWCpHPHxK3GmTzLG+9vK66oVPNHz0tDy
         dNmCCyWAmsLRvFaaMDbByhlksewVFisdFhryZQ4ynZQfYwQPF6QUbQ+JGpon03XL0q5h
         37KgSXFRuxCRZNiAr/29eJ+881REebCtse16KFv8imqQNaEZ14KteXdQYrEAlqkGBpHQ
         HRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855773; x=1730460573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIGxF2ZObIsraW8vGBCdt5dvhIiK6tBRnTKa3/XZgvQ=;
        b=EfIbBgud9Fec5u1U1Iu5pv8cAVRdXTTV4GgfqoTvHrkz4JcDE9r+2dztVPkr8DOJ8U
         QT7k+RJPmiNqoZAUIJ74hNFF4RzJhin60TpBgpKExHW52W509y/0huq6HKenhHSGigzS
         xEFYXkzWhG7P+Y5C6gOPdQcdLyi/nQ+wL2tFt+FvJmbKOGTf++MYB8HhxSt3QcZDuSW+
         40aeYZ9zSRedh6iLwned8Bl6rULl0wFqCaO12lys8VBKYu+R+BbWtURH8I3RegXM1N3W
         F4t1aICekQUTIEO3smywlaQjnPOhW1ZfzdztS7vRBhnisniklNnCjbq/i7I+1mItZunB
         KgGA==
X-Forwarded-Encrypted: i=1; AJvYcCUZj7Gc93Z/OTBh2Rag6cgWefPsimlIyRTZ9066teQ7MyhJ9UJlviRHeBv48pnisxy9P0I9CVvWlMO8Rg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm9s0gDy9dCX7x9yypLI81fdk6bJ6pEKsWuqk/0aiXajCOYU+Q
	PM2Ldf00eB4nG/WNclAhJbm+hVq8w6xixQWljJOUHM7QQH8dLQpK
X-Google-Smtp-Source: AGHT+IH9hL6sjc3soe+IsGOsI9AiJaPl4BtIw9lhwEN62zU4CVjOVV7qgP/yNH28TGevoCYuTQ+TGw==
X-Received: by 2002:a05:6a00:180f:b0:71e:77e7:d60 with SMTP id d2e1a72fcca58-72030bba29amr13321624b3a.23.1729855773157;
        Fri, 25 Oct 2024 04:29:33 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793175bsm877382b3a.48.2024.10.25.04.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:29:32 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: dts: sophgo: Add emmc support for Huashan Pi
Date: Fri, 25 Oct 2024 19:29:00 +0800
Message-ID: <20241025112902.1200716-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025112902.1200716-1-inochiama@gmail.com>
References: <20241025112902.1200716-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042934_350123_DD9232AD 
X-CRM114-Status: GOOD (  15.27  )
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

From: Inochi Amaoto <inochiama@outlook.com>

Add emmc node configuration for Huashan Pi.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    | 12 +++++++++++
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  1 +
 arch/riscv/boot/dts/sophgo/cv181x.dtsi        | 21 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2002.dtsi        |  1 +
 4 files changed, 35 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv181x.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index 4ea27cd357dc..26b57e15adc1 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -43,6 +43,18 @@ &osc {
 	clock-frequency = <25000000>;
 };
 
+&emmc {
+	status = "okay";
+	bus-width = <4>;
+	max-frequency = <200000000>;
+	mmc-ddr-1_8v;
+	mmc-ddr-3_3v;
+	mmc-hs200-1_8v;
+	no-sd;
+	no-sdio;
+	non-removable;
+};
+
 &sdhci0 {
 	status = "okay";
 	bus-width = <4>;
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 815114db54ed..8a1b95c5116b 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
 #include "cv18xx.dtsi"
+#include "cv181x.dtsi"
 
 / {
 	compatible = "sophgo,cv1812h";
diff --git a/arch/riscv/boot/dts/sophgo/cv181x.dtsi b/arch/riscv/boot/dts/sophgo/cv181x.dtsi
new file mode 100644
index 000000000000..5fd14dd1b14f
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv181x.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#include <dt-bindings/clock/sophgo,cv1800.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	soc {
+		emmc: mmc@4300000 {
+			compatible = "sophgo,cv1800b-dwcmshc";
+			reg = <0x4300000 0x1000>;
+			interrupts = <34 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_AXI4_EMMC>,
+				 <&clk CLK_EMMC>;
+			clock-names = "core", "bus";
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index 242fde84443f..8c35cdc34d2d 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-sg2002.h>
 #include "cv18xx.dtsi"
+#include "cv181x.dtsi"
 
 / {
 	compatible = "sophgo,sg2002";
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
