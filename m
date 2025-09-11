Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E59CA1016
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 12:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXTI71YWkqYaIgDcgGonhAD6+GI0WWnErhdF8Hrp42Q=; b=eXQH/G8EakGI0S
	Ez8dTourg9QIDIOpMCEnnW/ddgAXCHoKM05MzwGftDdjRZYETAAFj+92t65h4+0bo02J3n/fEU6SB
	cjw5PwoBCMfAAI+mz1ZGHdtdESH4eYRGt6h9TL/qcOZxSw++FVJIhJL2Z0pj/woGDKYTMNtGKmiev
	xLz8JqJ4mjgYy/hhcvcr/1IOrMWZ0LcoezRA0F59DEPx3AcKDYzCeUvdEkbR0lFTO82n7VS+sDqsT
	qoPP9gtLPkao05tMH5sbxqCyY+zl7UIXAPoxKrpm0M3io9XGAy6qJ0I4SSbVhsLMlIU0qT5BOiKZN
	A5VQXVCGnJEad+p6GH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwgfw-000000032kD-01Bi;
	Thu, 11 Sep 2025 12:45:20 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwgfs-000000032hf-0jt0
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 12:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757594712; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=2BUEuwEcOUukXezOVVtgLhzc2R17kXm8C8GBvwMavA8=;
	b=dzO4dWycL0TouN4f7uoPuaOv2N2TPdAyst1MD1Lrr8a6pEw4z/EG1c15W8UL6Q0sJ1Ga0LJJrI9THCDbQQfJXI1AkFi0KsBjc3cb8huF4/GE8lyiKmFOuR2y6OsbHZSUziibnTpKZNDMLmuxkpOEE1XMULmj6I2wqAqOp32C/0E=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WnmLJhX_1757594708 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 11 Sep 2025 20:45:10 +0800
From: cp0613@linux.alibaba.com
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [RFC PATCH 1/4] dt-bindings: riscv: Add trace components description
Date: Thu, 11 Sep 2025 20:44:45 +0800
Message-ID: <20250911124448.1771-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911124448.1771-1-cp0613@linux.alibaba.com>
References: <20250911124448.1771-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_054516_382985_19CC500D 
X-CRM114-Status: GOOD (  11.95  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

This patch has added property definitions related to the riscv
trace component, providing a foundation for subsequent driver
implementations.

The RISC-V Trace Control Interface can be found in [1].
Some principles are as follows:
1. Trace has three types of components:
1.1 Encoder: Collects CPU execution information through the
    Ingress Port and generates Trace Messages.
1.2 Funnel: Used to integrate multiple trace sources.
1.3 Sink: Used to store trace data.
2. Each hart requires one trace encoder.
3. When there are multiple trace sources, a trace funnel component
   is needed to integrate them. One trace funnel is required for
   each cluster.
4. When multiple trace funnels are fed into a single trace sink,
   multiple levels of trace funnels are required.
5. If there is only one cluster, the trace funnel (Level 0) can be
   connected directly to the trace sink.

Taking [cpu0]-->[encoder0]-->[funnel0]-->[sink0] as an example,
the DTS configuration is as follows:

    encoder0: trace_encoder@26001000 {
        compatible = "riscv_trace,encoder-controller";
        reg = <0x0 0x26001000 0x0 0x1000>;
        cpu = <&cpu0>;
        output_port {
            port0 {
                endpoint = <&funnel0>;
            };
        };
    };

    funnel0: trace_funnel@26404000 {
        compatible = "riscv_trace,funnel-controller";
        reg = <0x0 0x26404000 0x0 0x1000>;
        level = <1>;
        input_port {
            port0 {
                endpoint = <&encoder0>;
            };
        };
        output_port {
            port0 {
                endpoint = <&sink0>;
            };
        };
    };

    sink0: trace_sink@26401000 {
        compatible = "riscv_trace,sink-controller";
        reg = <0x0 0x26401000 0x0 0x1000>;
        input_port {
            port0 {
                endpoint = <&funnel0>;
            };
        };
    };

Note: The detailed property definition of each component will be
provided in the subsequent series of patches.

[1] https://github.com/riscv-non-isa/tg-nexus-trace.git

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 .../riscv/trace/riscv,trace,encoder.yaml      | 41 +++++++++++++++++
 .../riscv/trace/riscv,trace,funnel.yaml       | 46 +++++++++++++++++++
 .../riscv/trace/riscv,trace,sink.yaml         | 37 +++++++++++++++
 3 files changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/trace/riscv,trace,encoder.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/trace/riscv,trace,funnel.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/trace/riscv,trace,sink.yaml

diff --git a/Documentation/devicetree/bindings/riscv/trace/riscv,trace,encoder.yaml b/Documentation/devicetree/bindings/riscv/trace/riscv,trace,encoder.yaml
new file mode 100644
index 000000000000..e2ec3ce514b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/trace/riscv,trace,encoder.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/trace/riscv,trace,encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Trace Encoder Controller
+
+description: |
+  riscv trace encoder controller description.
+
+maintainers:
+  - Chen Pei <cp0613@linux.alibaba.com>
+
+properties:
+  compatible:
+    items:
+      - const: riscv_trace,encoder-controller
+  reg:
+    description: A memory region containing registers for encoder controller
+
+  cpu:
+    description: CPU identifier associated with this encoder
+
+  ports:
+    description: Output port definitions
+
+additionalProperties: true
+
+examples:
+  - |
+    encoder0: trace_encoder@26001000 {
+        compatible = "riscv_trace,encoder-controller";
+        reg = <0x0 0x26001000 0x0 0x1000>;
+        cpu = <&cpu0>;
+        output_port {
+            port0 {
+                endpoint = <&funnel0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/riscv/trace/riscv,trace,funnel.yaml b/Documentation/devicetree/bindings/riscv/trace/riscv,trace,funnel.yaml
new file mode 100644
index 000000000000..5da836997355
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/trace/riscv,trace,funnel.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/trace/riscv,trace,funnel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Trace Funnel Controller
+
+description: |
+  riscv trace funnel controller description.
+
+maintainers:
+  - Chen Pei <cp0613@linux.alibaba.com>
+
+properties:
+  compatible:
+    items:
+      - const: riscv_trace,funnel-controller
+  reg:
+    description: A memory region containing registers for funnel controller
+
+  ports:
+    description: Input/Output port definitions
+
+  level:
+    description: Level of the funnel (e.g., 1 means close to the encoder)
+
+additionalProperties: true
+
+examples:
+  - |
+    funnel0: trace_funnel@26404000 {
+        compatible = "riscv_trace,funnel-controller";
+        reg = <0x0 0x26404000 0x0 0x1000>;
+        level = <1>;
+        input_port {
+            port0 {
+                endpoint = <&encoder0>;
+            };
+        };
+        output_port {
+            port0 {
+                endpoint = <&sink0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/riscv/trace/riscv,trace,sink.yaml b/Documentation/devicetree/bindings/riscv/trace/riscv,trace,sink.yaml
new file mode 100644
index 000000000000..b42e65988f31
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/trace/riscv,trace,sink.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/trace/riscv,trace,sink.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Trace Sink Controller
+
+description: |
+  riscv trace sink controller description.
+
+maintainers:
+  - Chen Pei <cp0613@linux.alibaba.com>
+
+properties:
+  compatible:
+    items:
+      - const: riscv_trace,sink-controller
+  reg:
+    description: A memory region containing registers for sink controller
+
+  ports:
+    description: Input port definitions
+
+additionalProperties: true
+
+examples:
+  - |
+    sink0: trace_sink@26401000 {
+        compatible = "riscv_trace,sink-controller";
+        reg = <0x0 0x26401000 0x0 0x1000>;
+        input_port {
+            port0 {
+                endpoint = <&funnel0>;
+            };
+        };
+    };
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
