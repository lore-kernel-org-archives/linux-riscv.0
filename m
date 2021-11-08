Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C36C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:07:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDF1E61284
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDF1E61284
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9V9dg3lk4tCeXGyPebPlo7v33LEWW3oH0pO7PH5iDII=; b=PjwGpUYRGpy2d4
	89FH02aNWc9m9et7O+VhzQ2aKi5mRrGKSGRwMqptJqQn26er1VgudGDcy1UMIw2QdBHHdDBLyyVMS
	Xsh7PdzNS76eLTNkJx2EaIbXGWrON/z8lys7JAn3T+apgwMko1M8wXyNutc6vyHpBwCy0j3LuX1zs
	UuVh5txuPp1cf7zyn4QFun+E3YWq0LImjoiCePr2/K+HVSmFb7uHhh0TczAi/moZLeGuEYVFKo9qP
	vn85J2hddEs7/o/b6xp/XfHMvpMgIo1lzZC/2ElqZKvyB7fdD7OOlOisKh6/HCW5UCezar0nE7OpN
	RtSLpf/LeacWq4iRlc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk6FM-00Gmi7-8W; Mon, 08 Nov 2021 15:07:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk6FI-00Gmeo-Bu
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 15:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636384060; x=1667920060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2n9GIVVmCiRGA0iC1L+MwladkBD7mqRRs9RpfrJ5md4=;
 b=v+J31ZPbMr9D/Tmg4leQNybk9p3ZXFZqyeoSYYSLnfGPgtJdOG67wDRI
 q5AJyu3uz6bpaublEbIbSCw7ylkAiATIwSiHy3hpZrlarfbLlufVNAVuK
 EnNNVXc8WYsB0p6w+0z078jd9IyUzvXTw0QDQsPeJEEFVCQtXHVLWe73g
 OQFEiQnYKx0CB02SLahkGjoV9KX43I8gpo1x7neIcYZOwqLru0Mxjypj1
 4xs+8CyXMLylKivrTRBBU745fGeo7CLom65e0/sCVnWetPzFDOi1hl0mv
 pQD0UsI0jdOROoYHhyYlJHsCCRq9erxgyzpnl8CmOo6hPZy14BzefLQPa g==;
IronPort-SDR: r7HbJwr7nexggEpFJSRbMyvcbV+vuw7mdk4Dwj6UvhaaU2wF6vXwT3vPJ2zpHGbF9DMntkXnF6
 RjqpXDvVlyM26NG5XITgpyj2WgYyz5vGsg1IWIfN1RywZ+Uu5qj50VKZ4K5KBnYZfA9OZKpWb4
 j8170KXE3xPHqfFiitgen3YtXWjmwdLwXtC1gAnadV6MyXUTgFk3to8aKPboYGqaMtRWVUzB4J
 W78+mRWg/ZGo5kBCaldVWbaMWti3jiQeK9OcyQ1oDC0hmvl+ac+o2eYChkEhZrPXrPH6M0+Dhm
 icZlJxTAE3IZwvz1+5V++bT6
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="75727308"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Nov 2021 08:07:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:07:38 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via
 Frontend Transport; Mon, 8 Nov 2021 08:07:34 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>
Subject: [PATCH 11/13] dt-bindings: usb: add bindings for microchip mpfs musb
Date: Mon, 8 Nov 2021 15:05:52 +0000
Message-ID: <20211108150554.4457-12-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_070740_514639_E087E722 
X-CRM114-Status: GOOD (  10.74  )
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
 .../bindings/usb/microchip,mpfs-usb-host.yaml | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml

diff --git a/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml b/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
new file mode 100644
index 000000000000..b867f49e7d70
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/microchip,mpfs-usb-host.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MPFS USB Controller Device Tree Bindings
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  This USB controller is found on the Microchip PolarFire SoC.
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-usb-host
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    minItems: 2
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
+    #include "dt-bindings/interrupt-controller/microchip,mpfs-plic.h"
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      usb: usb@20201000 {
+        compatible = "microchip,mpfs-usb-host";
+        reg = <0x0 0x20201000 0x0 0x1000>;
+        clocks = <&clkcfg CLK_USB>;
+        interrupt-parent = <&plic>;
+        interrupts = <PLIC_INT_USB_DMA PLIC_INT_USB_MC>;
+        interrupt-names = "dma","mc";
+        dr_mode = "host";
+        status = "disabled";
+      };
+    };
+
+...
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
