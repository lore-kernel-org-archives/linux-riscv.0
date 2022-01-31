Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D58FC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 11:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oi/qkaLFSL/vt59YzPlcA1p8clJRRb11CnYXW+w8Yko=; b=ccb12/Zb88C1rl
	gL6o/X0r/DpcW7rDWSQipkamn7Y2cNqRDAazE51rc+vtH1FbcDV9cG6roTdMkWHSEpjpeqdOxavMZ
	aEHjx66EV+D8DWSXR7xUlWiZJcgjfhZgtkiLw9e+QoKWEqYaxCpKXXxh65ciW2rtDPxZfyfkcauOZ
	HeU+aHGpErgymVE8O8fmqKqMIM/BCE90jlyBd80EjGl+ant6q3mbxteCl8leRLVwwYL3AAyD11PMj
	6hXkRek9y0I2jYgk01+1Z+eIvdx2GugR6KvuLLfSTukY1od1eAQQXxaW3wH34sg0zk2VRIoX0QnFw
	GHXYOLyfQ37zhQwkaxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEV86-009Bem-8h; Mon, 31 Jan 2022 11:45:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEV81-009Bb5-NU
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 11:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643629549; x=1675165549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d/Ij+ZoegdPKUHf5fPnbf1WX33hvhyGyLbuNgg8uHv8=;
 b=0Fpn+yHhx+Au1emJVFulLeL013RvdxQnn4pIWYZeJFA+EP/pwgK8Sj22
 g+q97lv6xzcq2aaZgJzP1bZ9Zu7qboAoeu6JI3D0RzqCPW8L5EgNcpHiM
 fSyKZgesNCoNX7DU9khZhq5BTLQQAAUqGI3KkGGX86zy88nHkmW8v2hpn
 uxQrzYmkFHd2uoVzLNI57MnAhB62fgS5rWzGjbLNCAZIvoKiK0kENDows
 ijpDOWN+HdDXsVrwsAjoDMtYxEKqPiC69N/RGqUZVrNaT4jjMtIs8ffd2
 8dmv3oMAGSq+d5ekq9RwE8+sgDBO/Pq1aX4YKzTBDkxjgK/OZcWLov34F Q==;
IronPort-SDR: ApHrUhmjM+hxBbdO4+mA1APl8M6WM02B+guqrQjA7GJKR9hIDN8e8B5OBwUlNDcFcJCDL960ta
 rqQyWj4pwqy7r6WgxUmKffqEgjCGGV9aWqxQNUEKdEcgx7BCusQcAnCXryjxNq9CZ2RjpOUvcn
 oSTVDNjaOSoyMsM7Quo2EJuChIounXix7IjZHAV9YWGrjemI3S218YsMcrFScSzVHV862wWvWU
 IA6ZoBXnXhiCQFG0BcPgrxim/lFsAWX65iMj0AIcj6ppFHssodngXGxckbwE7wzWt1UNwnA1ZQ
 IHxABhtf+apNbbe47vlJ0CI7
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="160544963"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Jan 2022 04:45:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 04:45:48 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 31 Jan 2022 04:45:42 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>,
 <heiko@sntech.de>, <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>, 
 <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
 <atishp@rivosinc.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 03/12] dt-bindings: i2c: add bindings for microchip mpfs i2c
Date: Mon, 31 Jan 2022 11:47:18 +0000
Message-ID: <20220131114726.973690-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131114726.973690-1-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_034550_118425_CB108B03 
X-CRM114-Status: GOOD (  10.00  )
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

Reviewed-by: Rob Herring <robh@kernel.org>

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/i2c/microchip,mpfs-i2c.yaml      | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
new file mode 100644
index 000000000000..065ec3d4c95e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/microchip,mpfs-i2c.yaml#
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
+    #include <dt-bindings/clock/microchip,mpfs-clock.h>
+    i2c@2010a000 {
+      compatible = "microchip,mpfs-i2c", "microchip,corei2c-rtl-v7";
+      reg = <0x2010a000 0x1000>;
+      clocks = <&clkcfg CLK_I2C0>;
+      interrupt-parent = <&plic>;
+      interrupts = <58>;
+      clock-frequency = <100000>;
+    };
+...
-- 
2.35.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
