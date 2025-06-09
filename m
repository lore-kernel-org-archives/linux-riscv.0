Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D651C61CE8
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 13:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5tQYSX+bQvwPoji7BUPBk7CIAxpMZyVWhh/063TKgE=; b=1L7WU6NesrVNou
	MjUUMBKC+4mZOagIxGUrwfY/03tsSqGYBIscNSuqkv0ma7cC2dU8XI+uHZlwFoXgKSD1qdt28dMTV
	DC/POuAGYbruR2qnOJdIRvrtOhj74q/HV24sGyIvtD4x43tRsEuOIhRAu+LnRXCTZj+mdTU7o3sCR
	PeK0e1LGp8EKDH+MlOvrb9qUDxLUDkvdwqIkOv3LHOa3sywsVQCskuJoZPBF3fMMg7TdUiIwuuZrv
	kyvI5QLsF0V264SOkKkQhBiRaBbZdqce7+doCn7I0D+Xc8LiP9/oaoOxVe9fsApffalIN3UWMCslu
	1wv9vxG38++Y8sWbRrYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcz0-00000004JUY-0985;
	Mon, 09 Jun 2025 13:56:14 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcr8-00000004Hoj-1LCT
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 13:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749476886; x=1781012886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kjHMjCHOrmu4ZU1b0Blwlqeccd/ZypQ5pwcPpKiOjGk=;
  b=I1jYprtumxLYp6S5VR50RRI3hf5C3+TieVUmh01342t6Xn2B7N1UqFUS
   c7x/4rDNnw4D0IZPzAfi/G5rOcnUl8SC2cEVNnzEkBI6Z0x5IJhg12jEf
   sOqhw2SPQkdHv8lS02N5UimzZ8I4ADOn5N+ANgqXGEOJ5GGjkp9i6gmQf
   dWVYOPyzcQFf8XkkeCGg4leOQ6tYZ2bj+HTMwe3xEEuY6JwcGvtnODctv
   K8Aa2TjPUwN91X/3bq13M3VGpi2KtuW6bsWK8xkYjWPsvWY24DAbdFwYD
   ly8v9Kwtb/x8Nk6Z0jxE6Gw75hVqwKYgPkagHzXYOeqcSEaiX12pSQky0
   g==;
X-CSE-ConnectionGUID: AAAvlnACQq6rHu3XuFhSVw==
X-CSE-MsgGUID: F4WAVb8bS7CLNXIkPL7lWQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 16:48:01 +0300
X-CSE-ConnectionGUID: KVlrIBAwSKa0Z5qGDDArcA==
X-CSE-MsgGUID: PSXOWlntRkO5W187C3w9pg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 09 Jun 2025 16:47:58 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 09 Jun 2025 16:47:59 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v1 3/7] dt-bindings: interrupt-controller: add generic Risc-v aclint-sswi
Date: Mon,  9 Jun 2025 16:47:45 +0300
Message-ID: <20250609134749.1453835-4-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_064806_661127_FD3FD1F9 
X-CRM114-Status: GOOD (  17.48  )
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

Add generic, Risc-V spec compliant (see [1]) aclint-sswi binding

Thead specific binding preserved, and converted to variant of the
generic aclint-sswi

Link: https://github.com/riscvarchive/riscv-aclint [1]

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 .../riscv,aclint-sswi.yaml                    | 89 +++++++++++++++++++
 .../thead,c900-aclint-sswi.yaml               | 58 ------------
 2 files changed, 89 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-sswi.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-sswi.yaml
new file mode 100644
index 000000000000..cffddfcfcfea
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-sswi.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,aclint-sswi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Risc-V ACLINT Supervisor-level Software Interrupt Device
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+description:
+  The SSWI device is a part of the Risc-V ACLINT device. It provides
+  supervisor-level IPI functionality for a set of HARTs on a THEAD
+  platform. It provides a register to set an IPI (SETSSIP) for each
+  HART connected to the SSWI device. See specification
+  https://github.com/riscvarchive/riscv-aclint
+
+  T-HEAD C900 ACLINT is a variant of the ACLINT, using dedicated
+  compatible string
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2044-aclint-sswi
+          - const: thead,c900-aclint-sswi
+      - items:
+          - const: riscv,aclint-sswi
+
+  reg:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 0
+
+  interrupt-controller: true
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4095
+
+  riscv,hart-indexes:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 16384
+    description:
+      A list of hart indexes that APLIC should use to address each hart
+      that is mentioned in the "interrupts-extended"
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#interrupt-cells"
+  - interrupt-controller
+  - interrupts-extended
+
+examples:
+  - |
+    //Example 1
+    interrupt-controller@94000000 {
+      compatible = "sophgo,sg2044-aclint-sswi", "thead,c900-aclint-sswi";
+      reg = <0x94000000 0x00004000>;
+      #interrupt-cells = <0>;
+      interrupt-controller;
+      interrupts-extended = <&cpu1intc 1>,
+                            <&cpu2intc 1>,
+                            <&cpu3intc 1>,
+                            <&cpu4intc 1>;
+    };
+
+  - |
+    //Example 2
+    interrupt-controller@94000000 {
+      compatible = "riscv,aclint-sswi";
+      reg = <0x94000000 0x00004000>;
+      #interrupt-cells = <0>;
+      interrupt-controller;
+      interrupts-extended = <&cpu1intc 1>,
+                            <&cpu2intc 1>,
+                            <&cpu3intc 1>,
+                            <&cpu4intc 1>;
+      riscv,hart-indexes = <0 1 0x10 0x11>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
deleted file mode 100644
index 8d330906bbbd..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
+++ /dev/null
@@ -1,58 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/interrupt-controller/thead,c900-aclint-sswi.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: T-HEAD C900 ACLINT Supervisor-level Software Interrupt Device
-
-maintainers:
-  - Inochi Amaoto <inochiama@outlook.com>
-
-description:
-  The SSWI device is a part of the THEAD ACLINT device. It provides
-  supervisor-level IPI functionality for a set of HARTs on a THEAD
-  platform. It provides a register to set an IPI (SETSSIP) for each
-  HART connected to the SSWI device.
-
-properties:
-  compatible:
-    items:
-      - enum:
-          - sophgo,sg2044-aclint-sswi
-      - const: thead,c900-aclint-sswi
-
-  reg:
-    maxItems: 1
-
-  "#interrupt-cells":
-    const: 0
-
-  interrupt-controller: true
-
-  interrupts-extended:
-    minItems: 1
-    maxItems: 4095
-
-additionalProperties: false
-
-required:
-  - compatible
-  - reg
-  - "#interrupt-cells"
-  - interrupt-controller
-  - interrupts-extended
-
-examples:
-  - |
-    interrupt-controller@94000000 {
-      compatible = "sophgo,sg2044-aclint-sswi", "thead,c900-aclint-sswi";
-      reg = <0x94000000 0x00004000>;
-      #interrupt-cells = <0>;
-      interrupt-controller;
-      interrupts-extended = <&cpu1intc 1>,
-                            <&cpu2intc 1>,
-                            <&cpu3intc 1>,
-                            <&cpu4intc 1>;
-    };
-...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
