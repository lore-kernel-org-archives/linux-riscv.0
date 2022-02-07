Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15666C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 16:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5D6oeMKuLfKu258kUxKScQ9itDGlc5j8Ohnw0fk6T9A=; b=YjvPzyPGEy+Svw
	AwafXDVT5VKgr25wc09LBjaQQ7r4BZpVjwjXgGk8XQO42A9e9LiBz0UOcPI1DxUOmjvxGj5eQUClB
	FH+TQmWCWtahvO/0cyM7tYU2IfRUmsEM0N3BsyzhOty4qQflY2fLoedJZbtuBxEWzCN3m3DCn8tRG
	8/vkvOM5769VDfM9HKh5E1NkAaGkPIqOjv6evtfkvwH4Xy1Yg88NTjFRe3r+ASfoYbx4kVdG8GhNq
	q15x4OqNiRvo0xJtN1ZuSS8iOcXm5oID5m7bq1+nnaWmjSJ6d9WDPNBQmlD+wzB8YhvEAuNo3L2JT
	bUivAB2vtEP3MamhdEng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6wt-00B6ot-1y; Mon, 07 Feb 2022 16:33:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH6oH-00B3ui-Ha
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 16:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644251053; x=1675787053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n2LjH9RvCOGwAWYhZSl0Qh8YBpRUu6w3nvwzlqEBYu8=;
 b=qF3GABD44bD9LQjoyflubqW4MOM+pGxAXR4aqCOWcY6R8W7fztYhHBwT
 6Gz09X3Gcx0TzqUqMzL5EuGRXAM4AdruJpRiPwBw/IR+KWX91dWscrbi5
 h+73OzxbQmjwUsgCFcAzpwmfeLI0a/qmYQzf57bzJVmDJLvuSqavbi5Q/
 mJ7f573ws7QN1EsRyQ6xKiPg0gV3UxAdkbIkPUbpcu6NY+ardW9wYA6xh
 YSZ2V/ZULHYXg0kdD+PJAW8b078zc0P8duxyjYUcRCIsaT0synRSW5brh
 1rgjsyJxr4txY6LL8ZNhQWcIf1BwjFnAGxBAhKoGwi3a1NCcXetwZhNVk w==;
IronPort-SDR: iDM2bDS1QqR+dKLczjPOMDRlybkVbNC1iWvWLT07LeHQfywiJcEgbSEZ1qfSvQpMVJphvjV3KN
 JaFGGqHdJhrbhzKKOk7bF5Lhtb37/g+ygc5fXq5aoKHv8QGpKD5GxUoNAFe7JzHXeqRAtO8a7M
 TIii0kuZrVVL6ltFK5GurzEm001PJ9JOlGsmUmCwVZwkXJBERRrMvxqOmGnoiehR93YyyunUq4
 VprOvOn179cm9tdv9TzaRIBUbQRXn7DZPT23V+6c8m6e18LcGacpfkwOHdO1yMsDV33B2o03Ze
 KhENaUAYI3StMrxCbdzfJ/mr
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="147873167"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Feb 2022 09:24:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Feb 2022 09:24:11 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 7 Feb 2022 09:24:06 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <krzysztof.kozlowski@canonical.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
CC: <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>, 
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atishp@rivosinc.com>, Palmer Dabbelt
 <palmer@rivosinc.com>
Subject: [PATCH v6 04/12] dt-bindings: rtc: add bindings for microchip mpfs rtc
Date: Mon, 7 Feb 2022 16:26:30 +0000
Message-ID: <20220207162637.1658677-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207162637.1658677-1-conor.dooley@microchip.com>
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_082413_713276_FB7A3980 
X-CRM114-Status: GOOD (  10.42  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the real time clock on
the Microchip PolarFire SoC.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .../bindings/rtc/microchip,mfps-rtc.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
new file mode 100644
index 000000000000..a2e984ea3553
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml#
+
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire Soc (MPFS) RTC Device Tree Bindings
+
+allOf:
+  - $ref: rtc.yaml#
+
+maintainers:
+  - Daire McNamara <daire.mcnamara@microchip.com>
+  - Lewis Hanly <lewis.hanly@microchip.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: |
+          RTC_WAKEUP interrupt
+      - description: |
+          RTC_MATCH, asserted when the content of the Alarm register is equal
+          to that of the RTC's count register.
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: rtc
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc@20124000 {
+        compatible = "microchip,mpfs-rtc";
+        reg = <0x20124000 0x1000>;
+        clocks = <&clkcfg 21>;
+        clock-names = "rtc";
+        interrupts = <80>, <81>;
+    };
+...
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
