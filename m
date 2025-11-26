Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310B3D10F22
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 11:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tF8MvxD0kS7J0WWPLbk4KBK8KPJQHwKrT6CyKFV/vKs=; b=tceGSAE8Mw+k5K
	GUqNEpkrId1cKdaN7ZSS496Q9b8NMO+Znbm2yNMkyAG3DiS2vFji1E1ce2GuLT6MogJjDw41z5R3n
	Q4Lth1A8xFsdNNSXQktQZKjZn8a7aXr8uIs9qCwMWLBwTjv6nidbklZ4ou3gJOXSCMYUsNFq2Lp3Y
	Wggd34tC+WJjEYmRQX91+SF9cn++4gZXbyN2QS/uGlQfwUUQ+kc8WFVTx9RA1/e7s01y3BnJlDFWl
	gq9JAKpfMl9trk2BPJl6pJGVW0ERnOrE7L2TPrigsFq6yuA9xGXUXkNeCXeDnVT4Cg684G1Aq+ZoH
	5P85/l3AOKZR2o2Q4Qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOE8R-0000000EwPw-2G9l;
	Wed, 26 Nov 2025 11:56:35 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOE8M-0000000EwOa-4AHo
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 11:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=FsFZAa7mJuleKXtIm8+lL9WVy7it1dzq5lspUZWFQw0=;
	b=kzd2/VaW+u698FJU+P+tgqVd5Kr7/xilVyCY5jZAyHARzsGT4d3XZ6dTc88vHp
	eFJtjLlHaSWorpjUBZiUq6xiM7EwJquS7s4PJONFiFFHYU7Qj9ni6FtDGC9QJud9
	smm43nQM5PMyZ5gy01CxVWptX3ik7je4WXCQIBzQLkUmI=
Received: from [192.168.10.1] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBnveN26iZpJOi_FQ--.56535S3;
	Wed, 26 Nov 2025 19:54:34 +0800 (CST)
From: Shuwei Wu <shuweiwoo@163.com>
Date: Thu, 27 Nov 2025 02:44:07 +0800
Subject: [PATCH 1/3] dt-bindings: thermal: Add SpacemiT K1 thermal sensor
MIME-Version: 1.0
Message-Id: <20251127-b4-k1-thermal-v1-1-f32ce47b1aba@163.com>
References: <20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com>
In-Reply-To: <20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com>
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
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764182662; l=2456;
 i=shuweiwoo@163.com; s=20251125; h=from:subject:message-id;
 bh=FL5o5y1/Twpcu8Mqfn+GwJ0PqQ90brtbtK8QQ2rfmuE=;
 b=tC7J82dJezjNQsCZQVsA75NIKy+KngltMFnBrvPel/zXVL0GCVi2i2dA4Daa06GoQkm6eJttX
 akAhUWCgCAJBVNhHzpxN+3UfQL6nXbuixZUYFpv1EqfyK8qO+PyFiCX
X-Developer-Key: i=shuweiwoo@163.com; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-CM-TRANSID: PigvCgBnveN26iZpJOi_FQ--.56535S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar17Gr4kuF1kZFW8Gr4kWFg_yoW8tw4rpF
	4fGrn8Grs7uF17Xw4SgFykAan8Kw40yFWUXrn7Ww15trn0gFySqr9Fkr1UZa48CryjgayU
	ZF4UurW2k3WDA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRV6wiUUUUU=
X-Originating-IP: [240c:c983:3:1d94:eae4:9ca1:49b8:c024]
X-CM-SenderInfo: 5vkx4vplzr0qqrwthudrp/1tbiNhcSjmkm3gD8mAAAsI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_035631_487880_1C20F860 
X-CRM114-Status: GOOD (  10.59  )
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

Document the SpacemiT K1 Thermal Sensor Unit (TSU), which supports
monitoring temperatures for five zones: soc, package, gpu, cluster0,
and cluster1.

Signed-off-by: Shuwei Wu <shuweiwoo@163.com>
---
 .../bindings/thermal/spacemit,k1-thermal.yaml      | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/spacemit,k1-thermal.yaml b/Documentation/devicetree/bindings/thermal/spacemit,k1-thermal.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6057161b4b00c8f869d16199a1cc0fc964fed998
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/spacemit,k1-thermal.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/spacemit,k1-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 Thermal Sensor Unit
+
+description:
+  The SpacemiT K1 Thermal Sensor Unit (TSU) monitors the temperature of
+  the SoC using multiple internal sensors (e.g., soc, package, gpu, clusters).
+
+maintainers:
+  - Shuwei Wu <shuweiwoo@163.com>
+
+$ref: thermal-sensor.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-thermal
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
+        compatible = "spacemit,k1-thermal";
+        reg = <0xd4018000 0x100>;
+        clocks = <&syscon_apbc CLK_TSEN>,
+                 <&syscon_apbc CLK_TSEN_BUS>;
+        clock-names = "core", "bus";
+        interrupts = <61>;
+        resets = <&syscon_apbc RESET_TSEN>;
+        #thermal-sensor-cells = <1>;
+    };

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
