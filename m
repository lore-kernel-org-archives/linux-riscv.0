Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC30C71149
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZfCK7GQ+S3L5cn0+Hbborhio3LCayZlo2iDmvRodK0=; b=jIiNrmNWL0v2yX
	6heWmlVcdUGdZCwAovV5ffHm88Ts+h1u5VOELVwVBZo7eBAGXKf7fxmUB0ll7t4iOi6Y2nZx+QPq4
	pA1ago1JaqICgtcU3+Hq8oMRQU4YtE1Ba3baawFc6cs6tEF/tSmbBbGMhzZv2vAVEVW7PKiiu5orG
	V1kDRW2Ao/z9TX18asjP4m6pWhZG0RsnakdTQzPMdwtCAfhSIKQBTZJxHcOFuFAJV2Vqss7oH3e+/
	gwYslfS6M2M6GYwuHxXu80WGQW6bnW7WZAeLZ7JMUJzdobGNXFBploT0zyg9rslzE+gi8f0ioQP6x
	NCONGVC8JqkLuiEaCYXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowT-0000000EXMW-2gw2;
	Thu, 12 Jun 2025 20:54:33 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPj5M-0000000DeBW-09cb
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 14:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749739159; x=1781275159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R0DjUyymyH51702nfIhvD4gSoTHc5AdW1g9ClY+/bUU=;
  b=SMuPTDZGHfXbA8y2GWTSbu8xaPnbFciwFcJCj7l3kfCedZXpqqYod2kS
   aS4YrzFIWF20LKdeGZnm1Maxe9PWsJuLq6fIBnz1/+A+iL8XcauKuENkw
   Fb6i9AmqS/tXqyLyeGba1PAZyf2iA8mxJtI2zs765LZ5KcgyQWvsDOoQO
   mx3TfGTpSt/2+UIFyU/+qBryvRc/4PPsgDaWaV8OnCDVdEHeKKHH7Zcx/
   vK2IQQjI/cBfz7pnUFtRzHnMiI18I/pKLn2eX5Ou+KxmtBRDHT9wX7KkC
   M6sqywAIcNZu/7Z37vpv+TCA5SUnI1ExMDJYG171pAjnpxzOToK1DQYXD
   w==;
X-CSE-ConnectionGUID: dmA6qLipRWS3XnypdCwDbw==
X-CSE-MsgGUID: 4TKwQbdORASE3YBIXh0YVw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 17:39:18 +0300
X-CSE-ConnectionGUID: +8ZAKTERTIydl0ak4WMZ5w==
X-CSE-MsgGUID: i1rORHJeROiet+NjGoACVw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces04_data.me-crop.lan with SMTP; 12 Jun 2025 17:39:16 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 12 Jun 2025 17:39:17 +0300
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
Subject: [PATCH v3 3/7] dt-bindings: interrupt-controller: add MIPS P8700 aclint-sswi
Date: Thu, 12 Jun 2025 17:39:07 +0300
Message-ID: <20250612143911.3224046-4-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_073920_345874_46BFFA98 
X-CRM114-Status: GOOD (  14.40  )
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

Add ACLINT-SSWI variant for the MIPS P8700. This CPU has
SSWI device compliant with the RISC-V draft spec (see [1])
CPU indexes on this platform are not contiguous, instead
it uses bit-fields to encode hart,core,cluster numbers, thus
property "riscv,hart-indexes" is mandatory

Link: https://github.com/riscvarchive/riscv-aclint [1]

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 .../thead,c900-aclint-sswi.yaml               | 64 ++++++++++++++++---
 1 file changed, 55 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
index 8d330906bbbd..c1ab865fcd64 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
@@ -4,23 +4,32 @@
 $id: http://devicetree.org/schemas/interrupt-controller/thead,c900-aclint-sswi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: T-HEAD C900 ACLINT Supervisor-level Software Interrupt Device
+title: ACLINT Supervisor-level Software Interrupt Device
 
 maintainers:
   - Inochi Amaoto <inochiama@outlook.com>
 
 description:
-  The SSWI device is a part of the THEAD ACLINT device. It provides
-  supervisor-level IPI functionality for a set of HARTs on a THEAD
-  platform. It provides a register to set an IPI (SETSSIP) for each
-  HART connected to the SSWI device.
+  The SSWI device is a part of the ACLINT device. It provides
+  supervisor-level IPI functionality for a set of HARTs on a supported
+  platforms. It provides a register to set an IPI (SETSSIP) for each
+  HART connected to the SSWI device. See draft specification
+  https://github.com/riscvarchive/riscv-aclint
+
+  Following variants of the SSWI ACLINT supported, using dedicated
+  compatible string
+  - THEAD C900
+  - MIPS P8700
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sophgo,sg2044-aclint-sswi
-      - const: thead,c900-aclint-sswi
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2044-aclint-sswi
+          - const: thead,c900-aclint-sswi
+      - items:
+          - const: mips,p8700-aclint-sswi
 
   reg:
     maxItems: 1
@@ -34,6 +43,14 @@ properties:
     minItems: 1
     maxItems: 4095
 
+  riscv,hart-indexes:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4095
+    description:
+      A list of hart indexes that APLIC should use to address each hart
+      that is mentioned in the "interrupts-extended"
+
 additionalProperties: false
 
 required:
@@ -43,8 +60,22 @@ required:
   - interrupt-controller
   - interrupts-extended
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mips,p8700-aclint-sswi
+    then:
+      required:
+        - riscv,hart-indexes
+    else:
+      properties:
+        riscv,hart-indexes: false
+
 examples:
   - |
+    //Example 1
     interrupt-controller@94000000 {
       compatible = "sophgo,sg2044-aclint-sswi", "thead,c900-aclint-sswi";
       reg = <0x94000000 0x00004000>;
@@ -55,4 +86,19 @@ examples:
                             <&cpu3intc 1>,
                             <&cpu4intc 1>;
     };
+
+  - |
+    //Example 2
+    interrupt-controller@94000000 {
+      compatible = "mips,p8700-aclint-sswi";
+      reg = <0x94000000 0x00004000>;
+      #interrupt-cells = <0>;
+      interrupt-controller;
+      interrupts-extended = <&cpu1intc 1>,
+                            <&cpu2intc 1>,
+                            <&cpu3intc 1>,
+                            <&cpu4intc 1>;
+      riscv,hart-indexes = <0x0 0x1 0x10 0x11>;
+    };
+
 ...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
