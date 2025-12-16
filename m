Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B36D5B87E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 02:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ZmT1IqPSxEkxL2KSNi8eMwbV+WeCeWNsrTvkSQIjac=; b=iWPnJ01EXk/1Jg
	qs1+xOqTw3cFcwmUw1FDZOyurgDaVeAstQesCScqyF40X7AJFESv+ScvWfwX+55Sj3CVskEHTQ8AD
	vWkX864zr+kPrn2LSQ0OFsYUQHLmbQmGNBuJjMAW+N0DoO7zgK4NfjAX9bYJnxcG431r1WH9BJznA
	k7efMwiScu/4p7rZSVXzwyXoobySqd09qi0GD3ZLWbGQQEmQocHfz0LIqskF+N8k61lSilmCeR2Az
	t/2fm/FqDEbCTT76qPDDt28Gd7h5+AzZA3ABq/qNo38GjzlLITVUB+mGkNa26dIVs3pBeHhzsakq1
	QVACKFsV9XsVWZffr1xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKOb-00000004XoI-3E0r;
	Tue, 16 Dec 2025 02:02:37 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKOY-00000004Xn8-3CCO
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 02:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=EB3+lUrYjXdHLb6lVc83k/KDwbQO/1iZ6Sq6de5B41Y=;
	b=Li0WyGTi2cbBBX1G6SOMtBibyLzKPQjZkjKiaBmjKWr766cczANSt+EGPrdVsu
	dNiCHtItot1V28+h32ONX/RsCOfyn0HuTS3RVN8F6nLdPv0iciVcR2sIBnxLRDP7
	Dzaz5a+FdH2M2wd+vnEbsJZw2nO68wSjgmSu7PuLVSpIA=
Received: from [192.168.10.1] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDXUu97vUBpOmJ5Ag--.29S3;
	Tue, 16 Dec 2025 10:01:36 +0800 (CST)
From: Shuwei Wu <shuweiwoo@163.com>
Date: Tue, 16 Dec 2025 10:00:35 +0800
Subject: [PATCH v2 1/3] dt-bindings: thermal: Add SpacemiT K1 thermal
 sensor
MIME-Version: 1.0
Message-Id: <20251216-patchv2-k1-thermal-v1-1-d4b31fe9c904@163.com>
References: <20251216-patchv2-k1-thermal-v1-0-d4b31fe9c904@163.com>
In-Reply-To: <20251216-patchv2-k1-thermal-v1-0-d4b31fe9c904@163.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Shuwei Wu <shuweiwoo@163.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765850492; l=2596;
 i=shuweiwoo@163.com; s=20251125; h=from:subject:message-id;
 bh=0uikCfen/M7ul2A9nGFiRto3pqY9jv/BdC6ugaZH33k=;
 b=dlAx+dseeSycqN1YujmmvjrGBobHVCrErX4V5EYL9bsUTWEK7Qx1eiR4Y7x79LUKpROIm2yW0
 O2+u/kpUMpJDsVw5DYEF/yhKKcc6OrUIJmzKQ2upx/EQBV4QFqzdIRl
X-Developer-Key: i=shuweiwoo@163.com; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-CM-TRANSID: _____wDXUu97vUBpOmJ5Ag--.29S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw1UXF1rKFWrGw1UZr4DXFb_yoW5Jr4fpF
	4fGr93Grs7uF17Xw4Sqr1kCa1Fgan5AF1UXrn2gw1Fyrn0gFyaqwnFkr1UZa48Cry7Zay5
	ZF4Uury2k3WDA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pikwI9UUUUU=
X-Originating-IP: [240c:c983:3:5c03:81d3:caf5:2e64:be2]
X-CM-SenderInfo: 5vkx4vplzr0qqrwthudrp/xtbC5AH5iGlAvYG0mwAA3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_180235_154196_98BD6120 
X-CRM114-Status: GOOD (  11.35  )
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

Document the SpacemiT K1 Thermal Sensor, which supports
monitoring temperatures for five zones: soc, package, gpu, cluster0,
and cluster1.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shuwei Wu <shuweiwoo@163.com>
---
Changes in v2:
- Rename binding file to spacemit,k1-tsensor.yaml and update compatible
---
 .../bindings/thermal/spacemit,k1-tsensor.yaml      | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/spacemit,k1-tsensor.yaml b/Documentation/devicetree/bindings/thermal/spacemit,k1-tsensor.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..328101a7f08361424d77bb5ac68667a6e7d5d398
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/spacemit,k1-tsensor.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/spacemit,k1-tsensor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 Thermal Sensor
+
+description:
+  The SpacemiT K1 Thermal Sensor monitors the temperature of the SoC
+  using multiple internal sensors (e.g., soc, package, gpu, clusters).
+
+maintainers:
+  - Shuwei Wu <shuweiwoo@163.com>
+
+$ref: thermal-sensor.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-tsensor
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock for thermal sensor
+      - description: Bus clock for thermal sensor
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: Reset for the thermal sensor
+
+  "#thermal-sensor-cells":
+    const: 1
+    description:
+      The first cell indicates the sensor ID.
+      0 = soc
+      1 = package
+      2 = gpu
+      3 = cluster0
+      4 = cluster1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - resets
+  - "#thermal-sensor-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+
+    thermal@d4018000 {
+        compatible = "spacemit,k1-tsensor";
+        reg = <0xd4018000 0x100>;
+        clocks = <&syscon_apbc CLK_TSEN>,
+                 <&syscon_apbc CLK_TSEN_BUS>;
+        clock-names = "core", "bus";
+        interrupts = <61>;
+        resets = <&syscon_apbc RESET_TSEN>;
+        #thermal-sensor-cells = <1>;
+    };

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
