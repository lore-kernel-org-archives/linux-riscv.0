Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEFEC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 09:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsbPwKKD93BRl6waUef10uTqoOVPLMsrXaFBWt8Bu/E=; b=kbIUeXtyZoqRgD
	+jGke6oiA/xMvkUY8tPAF1d3z43Zy3ctIb2Akye0omZk5voF0L9DsgKHmZmUB5Nz7bSq6BZUCrdZ1
	5xSoNfyr9Xw1BL8PIRyiiju6tRHxCbjqfxMJZuUuTPOLFsD/okygG2EDH3x3Ssd0/9+PizkitkCTN
	/pl1py19N8dnGSrvT374ylw0wG7nOlMD1erWyBEKF7ttmtZS27N4ugDjrU3DrJJTZGLfT00ym8qV4
	jeGXXDCn7Spup/F5zgXHOcy0/d7uF48UW9ifHogtvJnn2fvPlJyfFGC6lNp8u4ZK2xIoGWroFxOWW
	8Awhlz+0IMN/heKzWwbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my9cK-009BVl-Fz; Fri, 17 Dec 2021 09:33:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my9cI-009BTW-3E
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 09:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639733609; x=1671269609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YRf+J/CveN9v/mBBSULutpk2yICowM0+G8+Um5XzvjY=;
 b=lqdzW8wSyLhgX0wTgZSQdqq9lsb31QjH4VYdFhm7rYa/RuAbnObuwk4F
 dMsdaPUSyvoYI6+IpY4RR7FmpqDh/bRefPpsdnfatv6ikS0Nu8G9tH8KR
 /q8Sbyya3VqjPFukxZWzskDPO6UkO+NW+6dsMnLt3BVmP4Vo/mLiNMGrp
 sO+HibFygu37Jtm78aohWXGs8+X9kr18CmnAv3+hW+sPDiVgt9AH6Xkde
 C+6FsoHHAwzOfSgwqmBcVx+mtvrETyzOUeNnmOd4XwvFKwZmM/Rsaf257
 +Nst2olo+ytwF59BEu24UdBUOCsQ3z3bl1AvKCbmWPeSP3I4NNtomymFa Q==;
IronPort-SDR: 5kU8ugyR6rFeYPzzwUrOvEcmXLHtPPnE5vScHarLL9KZrqGgCDT9/heNLX87vVeTWwjG371zcS
 vOSSzHbuR/4/dQ/tktwTyH7jtnCqoRkniyVnm1coEwHESSlFti67Qz7O+gQMQ6OHyg2yU5Xuyy
 MUuVLwqM3PAAQJGhViph+1IOuzChZoym27O9pJRmbr96EbBGVIOxKb9pJSLNqlye+qPBv2vrKK
 2zD6YVS3VJzQZSDmKfUf+JhsvEH9aNbYXXIZ3QqQN5OJb6phHTMc1BsO1x3IB9CBDtrxkXgBQ0
 yn2XTxGFFYooSAIp1RZOZRJ8
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="147571120"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 02:33:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:33:20 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 17 Dec 2021 02:33:15 -0700
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
Subject: [PATCH v2 11/17] dt-bindings: usb: add bindings for microchip mpfs
 musb
Date: Fri, 17 Dec 2021 09:33:19 +0000
Message-ID: <20211217093325.30612-12-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_013330_198212_9152CB62 
X-CRM114-Status: UNSURE (   9.36  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the usb controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/usb/microchip,mpfs-musb.yaml     | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml

diff --git a/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
new file mode 100644
index 000000000000..eec918046c73
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/microchip,mpfs-musb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MPFS USB Controller Device Tree Bindings
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-musb
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: dma
+      - const: mc
+
+  clocks:
+    maxItems: 1
+
+  dr_mode:
+    enum:
+      - host
+      - otg
+      - peripheral
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - dr_mode
+
+additionalProperties: false
+
+examples:
+  - |
+    #include "dt-bindings/clock/microchip,mpfs-clock.h"
+    usb: usb@20201000 {
+        compatible = "microchip,mpfs-musb";
+        reg = <0x20201000 0x1000>;
+        clocks = <&clkcfg CLK_USB>;
+        interrupt-parent = <&plic>;
+        interrupts = <86>, <87>;
+        interrupt-names = "dma","mc";
+        dr_mode = "host";
+    };
+
+...
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
