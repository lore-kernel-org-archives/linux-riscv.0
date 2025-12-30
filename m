Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB542E92FD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 02:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVhyDfELRBRwYKcpb+igTYbw3r6t6DR0z0eL0oCWkQ8=; b=FpqU4KtZPB0MQY
	qDNidYMWynAcPeYoR37adGO8v9ToqhJycJjb1S2cXVxPfmGObXm79nj0KL14gQzEpAXe/o5u5Ivv8
	Au17ZbE8a7C0nilu/cndhboHtsx1uMq60lJZJl+wIeWIwW23TlSjvCTts5cw6C+euAhO77jYWYXEi
	lBeNt5NW4Ne8P1iavgVV5sFHUv4WZpVcv28V49W0gf2A2nZ4EaOnm7qzGEvyu4Fraj7styNsJSZjE
	Q6WinCg2O/LWwVDaUtlmi4dCczJErXIeWbP/htDhRqK9uGfNEruE06EehTaoSznDx9a+jCpmMYyKn
	reePZcLN7kxGhCh8GLkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPcT-00000004Jk3-2KQb;
	Tue, 30 Dec 2025 02:37:57 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPcO-00000004Jhv-2qoH;
	Tue, 30 Dec 2025 02:37:55 +0000
Received: from duge-virtual-machine (unknown [223.160.207.108])
	by APP-01 (Coremail) with SMTP id qwCowACXQW3oOlNpIqZOAg--.5334S4;
	Tue, 30 Dec 2025 10:37:38 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: conor@kernel.org
Cc: vkoul@kernel.org,
	gregkh@linuxfoundation.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	neil.armstrong@linaro.org,
	krzk+dt@kernel.org,
	jiayu.riscv@isrc.iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: soc: canaan: Add top syscon for Canaan K230 SoC
Date: Tue, 30 Dec 2025 10:37:21 +0800
Message-ID: <20251230023725.15966-3-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowACXQW3oOlNpIqZOAg--.5334S4
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyxXr4xuFW7WF1kJr1fWFg_yoW8KrWxpr
	yxCFyfKrs5WF1aya1SkFy8Wa43Ga97Cr18Aw1ayryDtrn8Ga4jyaya9rW3Za1UXFyxGay2
	vFWSvFy7Kr1DArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUbH5lUUUUUU==
X-Originating-IP: [223.160.207.108]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_183753_086564_7AFFAFA7 
X-CRM114-Status: UNSURE (   9.53  )
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

The Canaan K230 SoC top system controller provides register access
to configure related modules. It includes a USB2 PHY and eMMC/SDIO PHY.

Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
---
 .../soc/canaan/canaan,k230-hisys-cfg.yaml     | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml

diff --git a/Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml b/Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml
new file mode 100644
index 000000000000..77875f2d4f48
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/canaan/canaan,k230-hisys-cfg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan K230 HiSysConfig system controller
+
+maintainers:
+  - Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
+
+description:
+  The Canaan K230 HiSysConfig system controller provides register access to
+  configure high-speed peripherals (e.g. eMMC/SDIO PHY tuning) and USB PHY
+  configuration.
+
+properties:
+  compatible:
+    items:
+      - const: canaan,k230-hisys-cfg
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  usb-phy@70:
+    $ref: schemas/phy/canaan,k230-usb-phy.yaml#
+    unevaluatedProperties: false
+
+  usb-phy@90:
+    $ref: schemas/phy/canaan,k230-usb-phy.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    hi_sys_config: syscon@91585000 {
+        compatible = "canaan,k230-hisys-cfg", "syscon", "simple-mfd";
+        reg = <0x91585000 0x400>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        usbphy0: usb-phy@70 {
+            compatible = "canaan,k230-usb-phy";
+            reg = <0x70 0x1C>, <0xb0 0x8>;
+            clocks = <&sysclk K230_HS_USB0_AHB_GATE>;
+            #phy-cells = <0>;
+        };
+
+        usbphy1: usb-phy@90 {
+            compatible = "canaan,k230-usb-phy";
+            reg = <0x90 0x1C>, <0xb8 0x8>;
+            clocks = <&sysclk K230_HS_USB1_AHB_GATE>;
+            #phy-cells = <0>;
+        };
+    };
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
