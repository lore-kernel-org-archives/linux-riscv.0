Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1FBC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 13:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HH6vqNHCowQfEjkDJRg19gOvyjky8ALlQI1bgzHXvhs=; b=QB1uzW6ioCA3CZ
	h5oGaQUMDko0bKGlUysgBKuX08/DS1BFXCCZ0fl4ZNyowNboc73n4qf6e3W9lhapzH6mDizuqTog5
	NQqGERT4GXWxejrlmt7wIYrlXxi117+0pPeAgX4nmQTuO5Vtabmh/oT1Z+AnrpDLM5qwaT1OW9mAX
	I1k3D+nZtpzvWHpUanr69x1t8KfvrtnmR3Q6rkStptx9ZqHHnZW7yIOG6wrHUgppB24aSvnBQ8nIH
	rty9qq9cZpxtciS0my1Q0OHNHbLRp7XMrfGcFg8X8iGeHEijXribFNlyojRrR9kAt7T4TIdAHM9Us
	94RS6YGiDpGqH2C3q6hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJbqG-00FVSZ-6b; Mon, 14 Feb 2022 13:56:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJbq9-00FVOn-Q8
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 13:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644846990; x=1676382990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S5yk/nKl+yfqerme9u3V2jXvLX05QLsi07mGzQMyLL4=;
 b=Ij/BoHTWUh/NF2YNArSCm3d0hpj/euNyyU0dvk9eXvHlujA8cYbx0okF
 stq9lNav4VjV563lxg1b5hJ8g9UzO/Tk67Ydja11LiaK+8dRvTdxs7G4s
 4VDw/bffrXdlL7iRQvyLHzJKWhfQPljAJ41Clfa8Hb3a09amxSPcx2Zb0
 5ktRsrXdwq9uhtvhukgS15aLNepS+d8QqoUOIjpQk1AVfQ5mqZx6tfCt5
 K5ZyJHd2PeX0jTIHFVwUMKfXzZIhYtWzsc4BbdRb9QtCUZbUa/fPwd8/S
 8G/aOy5dMDY4L+3uuavuYZ9odxtH1MCSuj3c9RLyvcTdvKVN5xQRpVPkY Q==;
IronPort-SDR: KkYAeW0yo9IFmD1duJbhASl/qyLGdR+m2XwEyzYAGE5Zt8Wrrw7u9LDXQ6r4qqaC7SuF8Qvy/e
 gQXFLwnNJYIPOp5eQtXqoapnvjbfP+tLxr0PvG3JQCVKzPb3ewIK5IHpGXFI9icseWE3rxpNVG
 hAQT5cN9WbFf3VFWwl+k0gyzCFQYUbh5bC9tgR8TjZNfdpY/k784CXQC2Cr6gXmZH0FwIfrKX/
 YYlCfv4U5TW7/VewMBmip4NqPGjQlHiyPEcsSch8FvhJ1mqHNvMe9WrqpdZ/es6LormGpnGkOv
 ZX41z4HEegN0ZQ1Y8A56Jtbm
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; d="scan'208";a="148618035"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Feb 2022 06:56:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 14 Feb 2022 06:56:27 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 14 Feb 2022 06:56:21 -0700
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
 <atishp@rivosinc.com>, Rob Herring <robh@kernel.org>, Palmer Dabbelt
 <palmer@rivosinc.com>
Subject: [PATCH v7 04/11] dt-bindings: gpio: add bindings for microchip mpfs
 gpio
Date: Mon, 14 Feb 2022 13:58:34 +0000
Message-ID: <20220214135840.168236-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214135840.168236-1-conor.dooley@microchip.com>
References: <20220214135840.168236-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_055629_933883_614D83BB 
X-CRM114-Status: UNSURE (   9.57  )
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

Add device tree bindings for the gpio controller on
the Microchip PolarFire SoC.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../bindings/gpio/microchip,mpfs-gpio.yaml    | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
new file mode 100644
index 000000000000..110651eafa70
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MPFS GPIO Controller Device Tree Bindings
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - microchip,mpfs-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
+    minItems: 1
+    maxItems: 32
+
+  interrupt-controller: true
+
+  clocks:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  "#interrupt-cells":
+    const: 1
+
+  ngpios:
+    description:
+      The number of GPIOs available.
+    minimum: 1
+    maximum: 32
+    default: 32
+
+  gpio-controller: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#interrupt-cells"
+  - interrupt-controller
+  - "#gpio-cells"
+  - gpio-controller
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@20122000 {
+        compatible = "microchip,mpfs-gpio";
+        reg = <0x20122000 0x1000>;
+        clocks = <&clkcfg 25>;
+        interrupt-parent = <&plic>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        interrupts = <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>;
+    };
+...
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
