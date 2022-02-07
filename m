Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7293C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 16:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SinQnRLICGUOwwGxuU24Qc9/HIBEOr+usrCyc9uLvfg=; b=CQ24DoTNE1P2tz
	VZ7I5lAlGVyk0nQAqIdB2lAR1VHx5SRW8if57YbyIe6S/6h5CQHr4eHRoufgNDSfY8etPLAi6jFqZ
	KhsfuCp5GL/u61LSO6sG7eUF4KfsritBCJWs6RPc4Ixe/hp07l38soWRQAkgvLNNN58tRZEaiHVkd
	zbkWekOl0z9JmqQnQUOX4lS16dvclC+VfJqDNyLGwcDB6FryyKKjnGUcnCpXLSVnd3+inxdp3dgQQ
	qcq8Qqro3JS+Dyep+JPgrzmoHnYvkvadJUmjhc8fYiR0MdQD+9a00EWHvO0bokNDaJeBzCt37d+4l
	PrFUvrY6gR4hL9Q+HXQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6wb-00B6hV-MJ; Mon, 07 Feb 2022 16:32:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH6oC-00B3tM-B9
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 16:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644251048; x=1675787048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y9H0vm0uB6r2xnaMXtBb2QcKJondv9+jMqua1OTgIMc=;
 b=YClT4EISA+1nNC9xyfEdKkNWmxgCTW2PFcZU3KgXD9n1o4RkkJs2+xLr
 FHIVcLXd+YeCjkn8nTsFl/F8GmYB753+QFYhn6Ze4hh1f9ZudI5eSxKIp
 bdO5y1ZLTUbjjwwyD00rNhKhkp9biiug6ZGtRNaW87i9ujnWw934uM7WC
 /b3Gxpa7vHGsRe0RQgUddNtZ7RYP5rBM06I0eZGUABYrzG0KK7fx4kTDS
 thKy1j3L18ukajasqqkwSd9MsyyL6AhLO7s70Zj7R4mq//3LCelUIFjPf
 /93AFlYQNYHe7WT0UNLT/lUwzqqhkkv2U+3LrrYwaW8XXR1W0ycUp6rNP g==;
IronPort-SDR: 0P9xUk3U37cIxnXZPYqVfBjCJJBnnCcC9sCjfJ9EYGuImDXvIo5QsG+jsjfj15o3benLoO+ySm
 dRrH+tS8PIY6UcLqksz0qJlHYioSrFTu3Mxh9tcQbxQwvjbpPOTn6EOQQEbydwuBMG6P9mDhpL
 9XFTJhfO0yn8O9fZbDdeQ3s8pfhVM4cP/fA/7qISDsAgytegXikVG8dtj5JmWzK9dUVwbAPJUM
 V4xAG63ElgBWU+70kbphe/cmgo4S2UuHq3ZIIf1GJWH3lgD0M9ohEH1hpsTe82XlbD9TkYfryi
 IRDm5EPH/LuPY41lk/KuqqGL
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="152730203"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Feb 2022 09:24:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Feb 2022 09:24:06 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 7 Feb 2022 09:24:01 -0700
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
 <ivan.griffin@microchip.com>, <atishp@rivosinc.com>, Rob Herring
 <robh@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v6 03/12] dt-bindings: i2c: add bindings for microchip mpfs i2c
Date: Mon, 7 Feb 2022 16:26:29 +0000
Message-ID: <20220207162637.1658677-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207162637.1658677-1-conor.dooley@microchip.com>
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_082408_465205_1643ED55 
X-CRM114-Status: UNSURE (   9.67  )
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

Add device tree bindings for the i2c controller on
the Microchip PolarFire SoC.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .../bindings/i2c/microchip,corei2c.yaml       | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
new file mode 100644
index 000000000000..c8e605fbb8a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/microchip,corei2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MPFS I2C Controller Device Tree Bindings
+
+maintainers:
+  - Daire McNamara <daire.mcnamara@microchip.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
+        - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
+      - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description: |
+      Desired I2C bus clock frequency in Hz. As only Standard and Fast
+      modes are supported, possible values are 100000 and 400000.
+    enum: [100000, 400000]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@2010a000 {
+      compatible = "microchip,mpfs-i2c", "microchip,corei2c-rtl-v7";
+      reg = <0x2010a000 0x1000>;
+      clocks = <&clkcfg 15>;
+      interrupt-parent = <&plic>;
+      interrupts = <58>;
+      clock-frequency = <100000>;
+    };
+...
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
