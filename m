Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B39EE49AE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 08:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tXKyrMxC/1HRXOyVRZkg+JyL5wBiBFWZoatcYZiJZl4=; b=xa/G/zqRgpoovE
	3jZ/ejv8mmJSi+HgBc0jGVVp6XmOu4lN2Cy8g+b5nHmAjM+IpKhplETqs7v6ebxBQaSQvxJFPbSr2
	NnS7asjrMu0yaQlIfmGei78NtZREruHuSLuieDKX0Mv8UYLNCp4ve59ATEqezrWHdjbdZwly+SQLF
	7Pa6hatcnJagbezBrUtacC2QrIsNCbuDYE2lOctOr8xQWA+mHepW6gS86Ls5BBNG4IaNbh+0p8GCY
	E0bPAbPkmSta54xU53x28MIClqhWDdLjwbYWxUklDWT7l9PTNzsIj1Agze50sgo2T14oAN7r2D7HH
	GgV7yBCSGnBV/urWPOEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYjbb-0000Rq-2L;
	Wed, 23 Aug 2023 08:52:47 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYjbY-0000Qo-1d
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 08:52:46 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so13104845a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Aug 2023 01:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692780762; x=1693385562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMAzBQ2JWtyTS8mD8e3Fxmu2d91tt0ITlswZAkxTIh4=;
        b=OxEp5de1cW3arQOc7FTUhnrwD2M3065uhbMylGGIzlaSBIYnfSpA2ScRQUycl3Fn2I
         6HQpegZ5L6O93HqxZhbsUxzYXnwfwPusJEGQqvIt+JzP/r9Wl3gCKmrQMqUK6kLf3iwP
         02Df7eU/vgdF4o97ikufrsUegyIy3efwxfLmZ0a1j3QZWMpNOnoBOG+RcljTrKWtyy3i
         P6sfFz+3NjFugVMhVprxslhMJXJt20YozDgBAmr37O8iVlowk5LSPo3f3pLZw3ke6qmI
         Vn3ctXAiQKF8eawIwY5SOok00/fIvlpDXFETu2pLpx6jJKE+wSA3CE+Q4auY6vkqU3nP
         Ymwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692780762; x=1693385562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMAzBQ2JWtyTS8mD8e3Fxmu2d91tt0ITlswZAkxTIh4=;
        b=ha11E6xrI4x6+rb0IvdAVrujN0l4+8mqhiri9zT54T8vMvTRl2krBxK0/HyoVh/ROy
         0a2/IjQFL1SWE44s7AufcXaFPxWPzB5+0nVSnZ8R82jvwjzG52fY7hiyK0bfQoMX4ONn
         JGw8/s2NGHu5kyCh32Gsrvb+hhaWBl5JN3FaQEIu40/Kb3vHm3OAzNP4n11aPH7MPJJ7
         jm/AvzM2AHEyWfk9R7hETc5l1x6n7SqVa25LKHdpYVkhNPBjzATQ5wn+4e578vrzFopp
         OFZzDTLcKWEuroS3V7V9r1qr80L608BLyzpSbn1OmV7XNDQ+/bzc7+qCXMoPx84c22dT
         XBww==
X-Gm-Message-State: AOJu0Yy/8WX1Ww1tELAYxLvvDFmmI32g9k7vPgU7+hyadCaLks0nIzSl
	JRwmG36g56NsxCUP1agpVmQavQ==
X-Google-Smtp-Source: AGHT+IEZWFRQo+JFnpF1qlyr688eDH49YjAZuwvCYmHF+GBS3mKDm8CMK03WV266B3Bq58Lqb+bM7g==
X-Received: by 2002:a17:906:28c:b0:99d:fcb7:60db with SMTP id 12-20020a170906028c00b0099dfcb760dbmr14077749ejf.16.1692780762254;
        Wed, 23 Aug 2023 01:52:42 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709066b8900b009a168ab6ee2sm8665633ejr.164.2023.08.23.01.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 01:52:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] riscv: dts: use capital "OR" for multiple licenses in SPDX
Date: Wed, 23 Aug 2023 10:52:38 +0200
Message-Id: <20230823085238.113642-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_015244_543209_57C8BDAB 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

Documentation/process/license-rules.rst and checkpatch expect the SPDX
identifier syntax for multiple licenses to use capital "OR".  Correct it
to keep consistent format and avoid copy-paste issues.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Rebased on next-20230822, so might not apply cleanly.  What does not
apply, can be skipped and I will fix it after next RC.
---
 arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi     | 2 +-
 arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts  | 2 +-
 .../boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts    | 2 +-
 .../boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts    | 2 +-
 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi | 2 +-
 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts      | 2 +-
 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts           | 2 +-
 arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts      | 2 +-
 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts               | 2 +-
 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi                    | 2 +-
 arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts         | 2 +-
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi                   | 2 +-
 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi                | 2 +-
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi               | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi
index 9b03fca2444c..ed7b12e65a10 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
 
 / {
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
index 8785de3c9224..3a2c3281eb88 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
 
 #include <dt-bindings/gpio/gpio.h>
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
index 4df8ffb71561..711450ffb602 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
 
 #include "sun20i-d1-lichee-rv-86-panel.dtsi"
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
index 1874fc05359f..b217799e6166 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
 
 #include "sun20i-d1-lichee-rv-86-panel.dtsi"
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
index 6cc7dd0c1ae2..10116fb3935a 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
 
 #include "sun20i-d1-lichee-rv.dts"
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
index 52b91e1affed..08cf716328a0 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
 // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
 
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
index d60a0562a8b1..204da82a5dc6 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
 // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
 
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
index f2e07043afb3..e2bb6bc16c13 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
 
 #include <dt-bindings/gpio/gpio.h>
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
index 4ed33c1e7c9c..8dbe717c79ce 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
 
 /*
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
index 97e7cbb32597..b18f368e06e0 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
 
 #include "sun20i-d1s.dtsi"
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts
index e6d924f671fd..1a7d6ef33f17 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
 
 #include <dt-bindings/gpio/gpio.h>
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 8275630af977..450387265469 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
 
 #define SOC_PERIPHERAL_IRQ(nr)	(nr + 16)
diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
index b7156123df54..3b077dc086ab 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
 
 / {
diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 822f022eec2d..5a9d7f5a75b4 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
 
 #include <dt-bindings/clock/sun6i-rtc.h>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
