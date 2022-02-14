Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9EFC4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NmGx1rxB1Rof8NlUt/IS3V/ZvuwOhyNIvMnHZUWZ/5k=; b=cbSzP9bbCHjkAE
	jlStxDrCDsmkRR0rqMXw34VNMEdR2vManrsJOAiqSGcQPEy1j1dlFnejL1O7iBblPPJIb2NmTmxjr
	ZMEuN5y1Rjoiav47yL75IiBT5BYNEpfj0kA1/hRd4Zu5usgfFX4+RXGyFL45x0ygZy9g8Km7rZOZd
	zchunqnHwrrAFpIUY9ANPkAAq4n4DOc4B1av7WOFGE9K94Ee90kXiJ0lLjtUIMRE8svXuyEyQwgMs
	IBN++W7o+GZZUklQk3020I3FqwGc3OaRdAp4GmAjrt0od90wAgU3kXwlUMTkIq0hGHK0oR6VGXbeu
	i8GGe4UCnBdyfcmI+sdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJbqB-00FVPc-7X; Mon, 14 Feb 2022 13:56:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJbq8-00FVNv-Ew
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 13:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644846988; x=1676382988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RaK9SgN0U8rRaE6oOJFFvGb1cgu8ENs7J984QpIB3As=;
 b=EnYj5pzAYpyh3fAYnj3eVJkW5P/3bAkcwN8NKiIG1CJI0zTmJ4lB5ecr
 eRQ/qPHdepb6kiFBjigpvnKkjXuF1WFJABC9YzJlVeOzJCkBWrW6e/2sZ
 RXQD7tK2gbi1d2NrCYUpQXs2KvnZy5hYg6QefpqQkF1dCBGUVhyG3tMZb
 cupuIw45DlWr+HszxH0upb3yubu6nD1Aox9BWJQsQ871ClutIOchTup8R
 Q/NKsuIgZHZ2XrIIbrmi5mdUZEw3mnKAqe1JWdSw2amOcI8JQsdOo4KWt
 vKBp9z5U4dh+QlOHLfGzxkEDComHT+RiTgs0Fu3q9Hb6xTNXLyDyOySf6 g==;
IronPort-SDR: UP5KAEpJ3QOcSjMg3QuPd61GIGkyeewE8UHSU9XeSWWk50jsqpHf/7+D7ASRM3R73rdp42cLOW
 cSAgOuyKQv7pL1h/kgLL6tI4yTWovmE1zetPbdlJ/KlF2IoNhvCqnpyZdOGW9e4thGsOXELtdm
 NDiyFsGmZ9MpE00JliaQ+y3eCP05giZNtvSG64CrtqxeOswMT6Nzr7zIED+zakBcfkWKCbhicP
 WLnzqqN6YeAMJZbMUnbQ53gzruvj1boWeyZDU1NNVYBqC2Jm6KK2uZKBTC2V/F9tiYLY+FgiyJ
 EUzkkukbWLETXAHDIHr08rSC
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; d="scan'208";a="148618016"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Feb 2022 06:56:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 14 Feb 2022 06:56:21 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 14 Feb 2022 06:56:16 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <krzysztof.kozlowski@canonical.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>,
 <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
 <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, Rob Herring
 <robh@kernel.org>
Subject: [PATCH v7 03/11] dt-bindings: rtc: add bindings for microchip mpfs rtc
Date: Mon, 14 Feb 2022 13:58:33 +0000
Message-ID: <20220214135840.168236-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214135840.168236-1-conor.dooley@microchip.com>
References: <20220214135840.168236-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_055628_610737_E3F7CFFF 
X-CRM114-Status: GOOD (  10.25  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
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
