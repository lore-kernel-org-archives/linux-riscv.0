Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C58C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:43:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A56C2184E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:43:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OXMBVXOH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="a0b5q2Kc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A56C2184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8P+E/4GgPT7ZTMst+xQgcBR6bnMnkdohMfU19duoReo=; b=OXMBVXOHwpEfuK
	Vr6kcqcc2cUzn9QJfshTEn1gsGNLM2qUa8KMnISTvu0C/rYDRm7i8yFiGAlX1RZYHeSQ0h1PkrcK3
	SUqZWwtb3Y2EMfOompCDymi5maTqswwXSHHP9ubzPoOIHr1hcGCw+xt+JHEHr7yU4wLprNGv0yUB+
	gceo8zpI0TMdPlagtkQKw7dOcYNWiPRDRtWMwk0n+5d351308eRL3x87mQjxge3NYAvskkH9Sig/b
	NrnS4zj7Rejofz3MhbzG+RzL0w/nrAtFjsY2JIeaYRULvjRsCXp8V0w8DI0x1o6/8gaPK1kRGYbeJ
	Qsbxl+eSedY8fZYUkYXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEVJ9-0000t8-5E; Thu, 11 Apr 2019 08:43:43 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEVJ5-0000sQ-VE
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 08:43:41 +0000
Received: by mail-pl1-x642.google.com with SMTP id b3so3070987plr.7
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 01:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wlkTljkwq+PkQfX1dW/uq4ezlFHkmRq4tmpfuCy2ILM=;
 b=a0b5q2KcMeI2ouCBKXCoE3wMZTBP5mL/SeGdh7fPnfX1P4y9F0yy7kTyaMyS6cwYGS
 tHrClsmwiTO5bYidNzMMDIwiwqC4WZxzLGt+XU4YX+NFyvUmMqhxMsDAKqq12Fuh9OXz
 hfuQUNOFAlE4V4Ws9nBIGjHF6IG2m/0z+2fCkonRfnSHME2ggYofwwwhoiddBZ07jzTK
 G4qR4Bg3SM5UFAse6t1P6+2+W5p0YR53PsPduZHmowB6YREoQOfFzm3R00vMhAnKsFkT
 EHesv4B25MTWGOoKEYpaWHv85LmeLG/cse3Z38qIEkbko+68IcmzGERZ9TcbNuSIN1GB
 c5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wlkTljkwq+PkQfX1dW/uq4ezlFHkmRq4tmpfuCy2ILM=;
 b=ZO/RZE1iGoTdLgRxDfnw9ulZvPPbFg/uaptG6n1/0XQcFuUweT322O0ttxkdwilCvE
 Tqi1sPBe/iQyFAqO8JZCErqz2T4wzjgmtXMh52xzgqN+y6WOdKQomLTkbT/DxYFpEd6o
 SvDMaG8lQMP1Cw25481N+SwujTbuPE8n4RJ77US5gCnnb6DzWfqOd2cMrjFWJCxwg1uc
 VoS8JgMbqmPmSAItNyCGIcLMvgA5+Ny2CS5+dMtcqNCsam8V61UCW4Fc2R9Y5wqyl4xP
 OG9SbKQBtXTr4y2n2yTxQ0TgkrZo6KuGXs25QrOALpPZDufXyoDpOtjTO+3uvnAHfaEc
 TzMQ==
X-Gm-Message-State: APjAAAXzRgyMP/n+R8TqjlqyijzXQOr+HBoCcy90wC5tnx0hmraWR0zR
 wHxKgqcHDT3LoQQ4Gh/XZnGUe3aT3X8=
X-Google-Smtp-Source: APXvYqym1+UGVXXwnIz1BJV3MN5bvNTOpQK4MK2SRRYqsY5eeoonJXMjKd2HGP+8qz5pFqdqx3k21g==
X-Received: by 2002:a17:902:1003:: with SMTP id
 b3mr47737480pla.306.1554972219434; 
 Thu, 11 Apr 2019 01:43:39 -0700 (PDT)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a3sm61699456pfn.182.2019.04.11.01.43.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 01:43:38 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH 3/6] dt-bindings: riscv: convert cpu binding to json-schema
Date: Thu, 11 Apr 2019 01:43:01 -0700
Message-Id: <20190411084304.5072-4-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190411084304.5072-2-paul.walmsley@sifive.com>
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_014340_006025_28DC23E8 
X-CRM114-Status: GOOD (  19.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Paul Walmsley <paul@pwsan.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

At Rob's request, we're starting to migrate our DT binding
documentation to json-schema YAML format.  Start by converting our cpu
binding documentation.  While doing so, document more properties and
nodes.  This includes adding binding documentation support for the E51
and U54 CPU cores ("harts") that are present on this SoC.  These cores
are described in:

    https://static.dev.sifive.com/FU540-C000-v1.0.pdf

This cpus.yaml file is intended to be a starting point and to
evolve over time.  It passes dt-doc-validate as of the yaml-bindings
commit 4c79d42e9216.

This patch was originally based on the ARM json-schema binding
documentation as added by commit 672951cbd1b7 ("dt-bindings: arm: Convert
cpu binding to json-schema").

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
---
 .../devicetree/bindings/riscv/cpus.yaml       | 274 ++++++++++++++++++
 1 file changed, 274 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/cpus.yaml

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
new file mode 100644
index 000000000000..11ade807fd49
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -0,0 +1,274 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/cpus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V bindings for 'cpus' DT nodes
+
+maintainers:
+  - Paul Walmsley <paul.walmsley@sifive.com>
+  - Palmer Dabbelt <palmer@sifive.com>
+
+description: |+
+  In SoC device tree data files, the layout of CPUs is described in
+  the "cpus" node.   This node in turn contains a number of subnodes
+  representing CPUs, which define properties for every cpu.
+
+  Bindings for CPU nodes follow the Devicetree Specification, available from:
+
+  https://www.devicetree.org/specifications/
+
+  with updates for RISC-V cores provided in this document.
+
+  ================================
+  Convention used in this document
+  ================================
+
+  This document follows the conventions described in the Devicetree
+  Specification, with the addition:
+
+  - square brackets define bitfields, e.g. reg[7:0] represents the
+    value of the bitfield in the reg property contained in bits 7 down
+    to 0
+
+  =====================================
+  cpus and cpu node bindings definition
+  =====================================
+
+  If a Devicetree file is used to provide hardware data to the kernel,
+  the RISC-V architecture requires the cpus and cpu nodes to be
+  present and contain the properties described below.
+
+properties:
+  $nodename:
+    const: cpus
+    description: Container of cpu nodes
+
+  '#address-cells':
+    const: 1
+    description: |
+      A single unsigned 32-bit integer uniquely identifies
+      each RISC-V hart in a system.  (See the "reg" node under
+      the "cpu" node, below).
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^cpu@[0-9a-f]+$':
+    properties:
+      device_type:
+        const: cpu
+
+      reg:
+        maxItems: 1
+        description: |
+          Set the "reg" property to the hart ID of this CPU node.
+          Each value in this property must be unique in the scope
+          of the Devicetree file that contains it.
+
+      compatible:
+        items:
+          - const: riscv
+          - enum:
+              - sifive,rocket0
+              - sifive,e5
+              - sifive,e51
+              - sifive,u54-mc
+              - sifive,u54
+              - sifive,u5
+        description: |
+          Identifies that the hart uses the RISC-V instruction set
+          and identifies the type of the hart.
+
+      mmu-type:
+        items:
+          - enum:
+              - riscv,sv32
+              - riscv,sv39
+              - riscv,sv48
+        description: |
+          Identifies the MMU address translation mode used on this
+          hart.  These values originate from the RISC-V Privileged
+          Specification document, available from
+          https://riscv.org/specifications/
+
+      riscv,isa:
+        items:
+          - enum:
+              - rv64imac
+              - rv64imafdc
+        description: |
+          Identifies the specific RISC-V instruction set architecture
+          supported by the hart.  These are documented in the RISC-V
+          User-Level ISA document, available from
+          https://riscv.org/specifications/
+
+          The RISC-V Linux port only will execute on a subset of these
+          values.  However, other hart cores may be present in the
+          Devicetree hardware description file that do not run Linux.
+
+      timebase-frequency:
+        maxItems: 1
+        description: |
+          Specifies the clock frequency of the system timer in Hz.
+          This value is common to all harts in this Linux system image.
+
+      i-cache-block-size:
+        maxItems: 1
+        description: |
+          Specifies the size, in bytes, of an instruction cache line.
+
+      i-cache-sets:
+        maxItems: 1
+        description: |
+          Specifies the number of sets in the hart's instruction cache.
+
+      i-cache-size:
+        maxItems: 1
+        description: |
+          Specifies the size, in bytes, of the hart's instruction cache.
+
+      i-tlb-sets:
+        maxItems: 1
+        description: |
+          Specifies the number of sets in the hart's instruction TLB.
+          If present, the "tlb-split" property must be set.
+
+      i-tlb-size:
+        maxItems: 1
+        description: |
+          Specifies the number of entries in the hart's instruction TLB.
+          If present, the "tlb-split" property must be set.
+
+      d-cache-block-size:
+        maxItems: 1
+        description: |
+          Specifies the size, in bytes, of a data cache line.
+
+      d-cache-sets:
+        maxItems: 1
+        description: |
+          Specifies the number of sets in the hart's data cache.
+
+      d-cache-size:
+        maxItems: 1
+        description: |
+          Specifies the size, in bytes, of the hart's data cache.
+
+      d-tlb-sets:
+        maxItems: 1
+        description: |
+          Specifies the number of sets in the hart's data TLB.
+          If present, the "tlb-split" property must be set.
+
+      d-tlb-size:
+        maxItems: 1
+        description: |
+          Specifies the number of entries in the hart's data TLB.
+          If present, the "tlb-split" property must be set.
+
+      tlb-split: true
+
+    patternProperties:
+      '^interrupt-controller@[0-9a-f]+$':
+        properties:
+          $nodename:
+            const: interrupt-controller
+            description: Describes the CPU's local interrupt controller
+
+          '#interrupt-cells':
+            const: 1
+
+          compatible:
+            const: riscv,cpu-intc
+
+          interrupt-controller: true
+
+        required:
+          - '#interrupt-cells'
+          - compatible
+          - interrupt-controller
+
+    required:
+      - device_type
+      - reg
+      - compatible
+      - riscv,isa
+      - timebase-frequency
+
+required:
+  - '#address-cells'
+  - '#size-cells'
+
+examples:
+  - |
+    // Example 1: SiFive Freedom U540G Development Kit
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        timebase-frequency = <1000000>;
+        cpu@0 {
+                clock-frequency = <0>;
+                compatible = "sifive,rocket0", "riscv";
+                device_type = "cpu";
+                i-cache-block-size = <64>;
+                i-cache-sets = <128>;
+                i-cache-size = <16384>;
+                reg = <0>;
+                riscv,isa = "rv64imac";
+                sifive,dtim = <&L8>;
+                sifive,itim = <&L7>;
+                status = "okay";
+                L10: interrupt-controller {
+                        #interrupt-cells = <1>;
+                        compatible = "riscv,cpu-intc";
+                        interrupt-controller;
+                };
+        };
+        cpu@1 {
+                clock-frequency = <0>;
+                compatible = "sifive,rocket0", "riscv";
+                d-cache-block-size = <64>;
+                d-cache-sets = <64>;
+                d-cache-size = <32768>;
+                d-tlb-sets = <1>;
+                d-tlb-size = <32>;
+                device_type = "cpu";
+                i-cache-block-size = <64>;
+                i-cache-sets = <64>;
+                i-cache-size = <32768>;
+                i-tlb-sets = <1>;
+                i-tlb-size = <32>;
+                mmu-type = "riscv,sv39";
+                reg = <1>;
+                riscv,isa = "rv64imafdc";
+                status = "okay";
+                tlb-split;
+                L13: interrupt-controller {
+                        #interrupt-cells = <1>;
+                        compatible = "riscv,cpu-intc";
+                        interrupt-controller;
+                };
+        };
+    };
+
+  - |
+    // Example 2: Spike ISA Simulator with 1 Hart
+    cpus {
+            cpu@0 {
+                    device_type = "cpu";
+                    reg = <0>;
+                    status = "okay";
+                    compatible = "riscv";
+                    riscv,isa = "rv64imafdc";
+                    mmu-type = "riscv,sv48";
+                    interrupt-controller {
+                            #interrupt-cells = <1>;
+                            interrupt-controller;
+                            compatible = "riscv,cpu-intc";
+                    };
+            };
+    };
+...
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
