Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23874606EE87
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5G3J9QcK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJnXXtTp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ROdSpFpVmscTJfZn1LLwgF0h2te2ub8LIM+kIaIpObA=; b=5G3J9QcKpJPOxHfJUdq9QDesoi
	sipDT9OjP/ATShTHe4I0+Tc/Agb2n6kwR8Q188fV/FJSqr8Yi35oUpp7i9v7A7lakF5lR9yyls7hV
	Hpty93GwGRoxxrZlL45TkrUjdhqZc0nsKNFSBREgkWDUSZkqfoII65J9gSUBh1pDIKqo1pheg5HcM
	jWlH0SQ3n/OPsBLcVEDobS5gA+yCN9rmk+NJ2ACxruxAnwqIb5loVDG3djD7i+ierP02HX7ibdMpT
	T1LzkYDL3LNw2l+qwH2u/Tyuw1qDQ7P1hHnN5S50u1HsLghhdqhj9uyPCk10RLKWZho1QGkhGl5ey
	edOl0mAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRYb-0000000142T-0CoT;
	Mon, 09 Nov 2026 15:45:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRYS-000000013z8-0Rkt
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 15:45:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so12472715e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 07:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239106; x=1794843906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rh4heiROTn2BTclkUIfVJAc7WlFd4Gu+0wgV3dS1bGw=;
        b=WJnXXtTpqEBrhGB6LFeZEiXTQgXAUVFGOQscf6GDfQD3DNQSfQL4ifzuoWdzW27pCj
         em/OpYJfJGvvop0KCkEcgOIb6jNC9+fN+p6k1o01dc+Dd93Q11mqRq0x3OmctPANHCSW
         kOSUbPX7ZgxyOAJ/Qwtyz8tmlR7ZPJVcGgFgP/EEf39lS+xJbLvYakPmv2Swa31R785j
         0zT5P4o7matH7DQzbfPEzYiJI2YhtTP8a/oy39m3Wd23RYzPEBctSb7+ousJklgDRXIZ
         rScCDK9ITcvANzDIX3QZfHZaSX8l1/GkAMOGKWrnMXGS9rGZmpI6nigFI1fL4TIbyq0U
         S7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239106; x=1794843906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rh4heiROTn2BTclkUIfVJAc7WlFd4Gu+0wgV3dS1bGw=;
        b=euEbl6ajMiw96+1Zpjz2K2ILqww0cceR4Dfde816TzPw+RyhygirQGRkAJI3exA3sC
         WicLQH2O5nKSln0LnceyBm41HcMHQFr6tDVdxw1aYWrS1JgYuDE+uYa0Y6FU8MiASC8Q
         7e2mKmro3IzI2KsPF6YJqSCAqHXu9FHN4eBtnBDzIw9tKBGwbbZbWy/hml6W8Iif9VJG
         AdfpHjQ32ytWIQOloZxhkwQDInsCGxMRd+sJWEcpbwSadlhdnxRhOzt99mtyNCX13jZk
         /D6G/Ai+RmrTEg8Wu/pZoNxf6gnlSdB2EdRmu94QSuhEVuoyb1Czye6S/gmq4n81LxlO
         VTIg==
X-Forwarded-Encrypted: i=1; AL+hErHOCWykpcKQrh7EvbbIt4RtSYHY0pKbMVob/KPkXNcK++ffcDRLN25OdbPteJcX2suqrddKGHCNvQE4+g==@lists.infradead.org
X-Gm-Message-State: APuU4Z+xjT2gLdi3qCGXEI5l4H0iHt1xun/R627cT7+F10ghB+6Ab+DJ
	hiniv0EkLYtNdMmLqoS0SHJaUHGMRXTeJaDVh0HgU5S4kO3vkxH3VkQL
X-Gm-Gg: AYBFou1wtB+PBflegf8SUgshyKyOiNeXP0zp3FmG7ineGAahOhkTNQRMK0ROb29iXnu
	ImhacFNlrkCW3j2qZlHZP0xWN+OpgkfQP+bVJBH6X54jBTBZr9DJ+wqgUs+1khC2SCe93stdtEt
	NGUL1JSTmzSo6yUkbpvyWI1p3rNBmoKzSt02J8sBHzLjt5UBJdWONWk1DGzUrEOqHx2WNmVJHV6
	zjd4mdm0bYw/jAU2/XsytfJJviGaXWXfqyEXEMzLURNi8vFRNKxZ4BcpHX8JWcrgIaUv3FBAfK9
	8oTBXbz3lWee9IEFKVPubzd0eC5DYv0coH+RynrNP9rj0T4hVe7wylDBOzcBVQPPJKKeOrPe9kG
	kLZBYs9mknPsUHov7k80EsKWqkyVJHbUi+jNbwd911XLwqLktbqF1BvKxqAdUe+tmZgktkbR3Em
	/d6DjVS3CZ7xSyVOjRDZUNOhGPRhS2uP+jOpadrCuHsfcD7zU7Y/nM8vpHRJAg+wXlVOOg7orM6
	LXM+tkNndgWkLOtLd9HiEkw6vffE4ueZckuFYABQFRZ3CtIkXH6yT3OYZ4+GIDvfre2yRNmhdRV
	m4tKwYfDi/jBmONCnrJtiphIXb92qVDaCA==
X-Received: by 2002:a05:600c:811a:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4b963c82e21mr76267775e9.29.1794239105633;
        Mon, 09 Nov 2026 07:45:05 -0800 (PST)
Received: from hp-z640.fritz.box ([51.37.204.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm257163645e9.5.2026.11.09.07.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:45:04 -0800 (PST)
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 1/4] dt-bindings: rtc: Add StarFive JH7110 RTC
Date: Mon,  9 Nov 2026 15:44:58 +0000
Message-ID: <20261109154501.63762-2-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154501.63762-1-oo.hehir@gmail.com>
References: <20261109154501.63762-1-oo.hehir@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_074510_589701_3F6F4FD4 
X-CRM114-Status: GOOD (  11.70  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
