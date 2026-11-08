Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A37606A323
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 21:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2kjiL3WR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uQ7jomlq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EEPqybI197hJvMB/JZOaaojBXU/0QmPCF0AnUi+bfAc=; b=2kjiL3WR5HwY43Pr0FMLL2M5V2
	YdbzvzPE1CkgJ0zr4bL0pWmbNGupZTDdT2ok1PeGunER0soZn7L00sptDGMHWqCqw22cuBIAfbXiV
	Q2xf3+e2GBuj3oys+4bgbxuHZ/bZyV9/IKToaSxMZ+akY+woxU7ZK53BkZGo8gEuWF5wh3okQiS+5
	x4EchQv8TZbXr6ieMLLEfuusoalpIO+YSDoOSDZvgK+s0nLFVHlsD49EtRYmcXuy4k7qksZk6aMps
	rXKw9hcKX1Q12U+dq5m7aRrvodGYbd+7rd4AAKRdbXOjUbwxPIHkK9BLWF2qu6EiMTr7fp5k7+krY
	08tYmxQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQARN-0000000GiqD-0RCG;
	Sun, 08 Nov 2026 21:28:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQARG-0000000GinL-3R87
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 21:28:40 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e4831c028so322210f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 13:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173313; x=1794778113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXRVCJ6p53mhv78a1V9znscskgidqnRubCEiNV0CGUQ=;
        b=uQ7jomlqpeP1Jrjekiv45MRYvRX9p05ep12hSGm8a6vie4GQK42y9q1pmgFn3JD64r
         o0Q7mV3o7/OQDEwhizHHvaGBKhojM7WERGHPi9NSRlVELEbfP1UIJsB29N9sQFzN74EA
         Nt6mNQFJrXJGrGnbDYMXfp+UXsotjwxjhVogC8+WIb1zpU9jkLXKEeXSxgBs5NjA1FLU
         8zgF3rZXN1tSfgVu4hkzvldo8acahUyRFyyMgf4m56INfvC42Ny5PnDYDdLVrOOn5T+T
         UGnkYTVFO7DFOUmniw48XZa+7PbRhV5yp+ApGWWnUc/oSF7ChbRKfi/H+O2J/haEo9Ev
         X6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173313; x=1794778113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QXRVCJ6p53mhv78a1V9znscskgidqnRubCEiNV0CGUQ=;
        b=a/u4EsqJ1vDSS49RyrfvRLVWSp5vyE2ZFGzKperEtO5zIe/EN5kvCxQSYGGin/e/ED
         SfUmJG1uQs7p33LdbjsUhGuIutiSsXO3KCgAZcdkUxDLToSXR+FjcPD4ppvlpJP38Wn/
         f7bxThei+v0ExlQSMtJmBJ3eDzRt3FsJ7QWc8KxBOK/8SoqEAG8KFsqI/moPWHF7RWPZ
         kjXADrp5ZtGZKye35kknvQY0AsmxNC8NpibJiI5ZwycRXrYTEzkTJNQu/x3XUpzeikLZ
         zCrtGtUaBbwTsABee6xhvTzizjwIuTw99SBlhNeQFtZ2JQaWP9GpkpCBisiCyFzFUEeQ
         ilaQ==
X-Forwarded-Encrypted: i=1; AL+hErECUhd0GuDdELwiVQfJ/pwSgH0l/TM7pLyui21RMn2rNi2rswcN2sBOkM3cYMkAA4fCbokOeqnNfVctuQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8bB63uaqItuJptIf1XIGGiq59l6C+ekEvphbuNdYgIMilr6P7z
	BRBqNCICRfm69TBDJLSwkUBZRFBDDxELguk9pkJPgQg0ebrUoacuNraw
X-Gm-Gg: AYBFou2t3M7TE0+xnuVeaS7vGEqodM6E9PrJfHUJ5JY4HDZZ+Xx9WNgTszZyrP/6J0k
	3/etYWFywJC8iEgv76fB5Wab6vJce5Ig3cqkkABNKx/IL0mtM9lv2bhLU28i2t/FInyU20sFWRL
	VXYCleD958IV0cEHt4iKo/HAp8PEbBFVlJw94DvsW9JE22aRWX9pqnUtU6r9v+2cAWmE5tlIi5t
	2HhlvkO1H6h/JpQwNdCqOA1HkQcdqxLNZhTUSMHotc0mfWICnh2CElofQHdYzZ6ExnAJvYh7F53
	nlA+Sdve7MIHWXk9iZujxYf0N4nqOsWmdLsx/qdNkpX8JmV+EIijCfOPmPWrezWv3KoDHExxPDU
	E+9RCZrIrx28MHE20/BbnSmZYV19iGWBaIc0vJ3H3AhF4nyXWBeRGcXiu1BPw8B6F6mwa8l7jv6
	3tQz5LfEij42PKrva6gdHXNmeHpQgreyxPG0z6afadsV/9QM+f1F0YRoeVQu8VjJgQTh3tVz6Ld
	WPnUymBexMw3svxOpOOI+400MUEmPIXSEASWvY8i+J+xTUyaFiqbJ+e2ZsBz+D3nCCs/JlyjPpi
	IjqxQy5aqBme3/hpFz6lGYFjhKuV+QfVZw==
X-Received: by 2002:a05:6000:260b:b0:48b:108:48cf with SMTP id ffacd0b85a97d-495844a312emr4255528f8f.25.1794173312645;
        Sun, 08 Nov 2026 13:28:32 -0800 (PST)
Received: from hp-z640.fritz.box ([109.76.148.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597091400sm5692050f8f.32.2026.11.08.13.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:28:30 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 1/4] dt-bindings: rtc: Add StarFive JH7110 RTC
Date: Sun,  8 Nov 2026 21:28:23 +0000
Message-ID: <20261108212826.15890-2-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108212826.15890-1-oo.hehir@gmail.com>
References: <20261108212826.15890-1-oo.hehir@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_132834_898407_0FE9E950 
X-CRM114-Status: GOOD (  11.63  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the RTC in the always-on domain of the StarFive JH7110 SoC.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 .../bindings/rtc/starfive,jh7110-rtc.yaml     | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml b/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
new file mode 100644
index 000000000..a88ab91ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/starfive,jh7110-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Real Time Clock
+
+maintainers:
+  - Owen O'Hehir <oo.hehir@gmail.com>
+
+description:
+  The RTC in the always-on domain of the StarFive JH7110 SoC. It counts BCD
+  time and date from a 32.768 kHz clock and has an alarm, a frequency offset
+  adjustment and millisecond and one-second pulse outputs.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: starfive,jh7110-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Millisecond pulse
+      - description: One-second pulse
+      - description: Alarm and calibration events
+
+  interrupt-names:
+    items:
+      - const: ms-pulse
+      - const: sec-pulse
+      - const: rtc
+
+  clocks:
+    items:
+      - description: APB bus clock
+      - description: Calibration reference clock
+      - description: 32.768 kHz counter clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: cal
+      - const: 32k
+
+  resets:
+    items:
+      - description: 32.768 kHz counter domain reset
+      - description: APB bus reset
+      - description: Calibration reset
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    rtc@17040000 {
+        compatible = "starfive,jh7110-rtc";
+        reg = <0x17040000 0x10000>;
+        interrupts = <10>, <11>, <12>;
+        interrupt-names = "ms-pulse", "sec-pulse", "rtc";
+        clocks = <&aoncrg JH7110_AONCLK_RTC_APB>,
+                 <&aoncrg JH7110_AONCLK_RTC_CAL>,
+                 <&aoncrg JH7110_AONCLK_RTC_32K>;
+        clock-names = "apb", "cal", "32k";
+        resets = <&aoncrg JH7110_AONRST_RTC_32K>,
+                 <&aoncrg JH7110_AONRST_RTC_APB>,
+                 <&aoncrg JH7110_AONRST_RTC_CAL>;
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
