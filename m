Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D08AC4167D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 09:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnOfoECR3LlF6CaJ+70OZvxo+mos6k8csPWclpTJGXs=; b=rTbmmTbFhStcI1
	8bggyWm1QVvX9q0/yLQXLn6CqMC5BclCVd/LR0ZVrmboUlygfZ73tq3yDizTZCIm6Db57DuEhH/pm
	SM6wgNCmKqPhJ7TVHsWPIGMzD/gvRN9Nk0QEg8A22teWREByrA3F4foCfDOL77hJmpBG8Ud77VyMt
	JUX7m58557VK2OHW7ua9C1lRnxJ2TpSIpqsMfCNl35Zgj2yf3bqbAhM08ergJPVGwGi4YzVMKe3wX
	1MjvfanwKU9Lk54d/LZUNdmYcAZrGL7zg+CA4enOm0pDWATtTOTCMB0zd7sBjZXrvE7qNiMmfX+kt
	XyI4QqA25iYwmAlxk2hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my9bx-009BBA-4P; Fri, 17 Dec 2021 09:33:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my9bs-009B8O-WA
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 09:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639733585; x=1671269585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gS2HEVkFP5ZT4c04g14Ry523BXpa4eJOH4ez0d0CMYg=;
 b=sMANZTmBy9d42cLfdWeS6CQAb6zG6I6s+vMLxBxdz2lav3aWnZFcLlD9
 WDDlRpsYkHj4+ddsWTO6ckPARX1YHo9g4FwyWNUy0vTGSp8btYpFzmqAn
 e3gZ/vTqHGEgDrtEryviCZ2ZuFzn2CfS7yl+M0VYKNo30L/d+puX+eUhY
 VO0t4YpqpePgherJrLiXjEsf+BwHFGINXheviwiX9dhvEKrp0iSl1jfkz
 ROCZyYMX6+SMoBQDHitXXrXQy2yiqUSTc+1tNPfTisEgRMNftCn+x4RiH
 QMxU6ACDrbSvZRev2QeJKBGVweMxOalyq0HeHQQabKRXnXXPUKMHzi6ds g==;
IronPort-SDR: RpqDwPDYdO0XhcVYtN2cMX5kcR6mmBvXnuh+MkWOJ7snVHp8GWWgynwZ2ASVR4aMpPXVT6v6GN
 myhE6XlJRvSLmmTOpeKIqWHfdUzQ2RWKvgn7ahkXd8Rn0sEfPeg4lCV9/BH3tWmZlYhsclXEQU
 dp5EZecfYu8MOz/qF1oN7o46DtxhViDCGFZawUJJHMDMqzXRmYWaIg1fHh9TJCauoxNJQfM/34
 zzIXwwvfRPqULw0uMNSVYomrNLZIsi0jJsywpJMrQFCAD7zfpD4BIgssxMmdlInzmQDNmCUSX7
 KHq+Do9zN9H35WLG/ZqGA9YT
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="142745628"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 02:33:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:32:53 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 17 Dec 2021 02:32:48 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atish.patra@wdc.com>
Subject: [PATCH v2 07/17] dt-bindings: rtc: add bindings for microchip mpfs rtc
Date: Fri, 17 Dec 2021 09:33:15 +0000
Message-ID: <20211217093325.30612-8-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_013305_129250_F611E790 
X-CRM114-Status: GOOD (  10.37  )
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

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 .../bindings/rtc/microchip,mfps-rtc.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
new file mode 100644
index 000000000000..d57460cbe5e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
@@ -0,0 +1,63 @@
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
+    maxItems: 2
+
+  microchip,prescaler:
+    description: |
+      The prescaler divides the input frequency to create a time-based strobe (typically 1 Hz) for
+      the calendar counter. The Alarm and Compare Registers, in conjunction with the calendar
+      counter, facilitate time-matched events. To properly operate in Calendar or Binary mode,
+      the 26-bit prescaler must be programmed to generate a strobe to the RTC.
+    maxItems: 1
+    $ref: /schemas/types.yaml#/definitions/uint32
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
+    #include <dt-bindings/clock/microchip,mpfs-clock.h>
+    rtc@20124000 {
+        compatible = "microchip,mpfs-rtc";
+        reg = <0x20124000 0x1000>;
+        clocks = <&clkcfg CLK_RTC>;
+        clock-names = "rtc";
+        interrupts = <80>, <81>;
+    };
+...
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
