Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6908BC53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 16:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMSQHCNY4zuws5nRkv+2tkTS0ZtoYj/TPPwh8yjwAaM=; b=sHGCKpRPdRYenR
	w/nAClURjF8837AlFDdVU7QbccCXMYeJMdkXyk0GW9tajNFJeIbP2n/OP6HgyPi6RBJft7sFal+WW
	mCfdF6jZn54RDjcik0VqeJVweVYfiPZLx2JVWSwdx2G24BBLUH2/tTl7se797nZ5cFQVJAH+UAH1C
	XqxmL5FusINUbAwqjIcVOky0B63dh4pl3Ana3GaMbUkYK5astdB9ijcfyE8lYsNDzy2XawNDSiqFL
	6Rw8zqvUotO9/KlwP7vmkZf6+tWeyHa0oxkdsMbZiOX0O6o6Skvg3qcssW64wvezLi4gvNs/68Bhv
	iewYNeqJXx6Q2QWdrlSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7K2-00000008aV2-2KbC;
	Wed, 29 Jul 2026 16:39:58 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Jz-00000008aT9-0GZo
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 16:39:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4954d383e64so7465945e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 09:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1785343193; x=1785947993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cS5bnPBGMkIbEsasH3IiqlepISBkwGNxs11plFYtxYU=;
        b=DjWoJZJgXLNNq8P7jjfqixLqzZM/cPQHC3cb6KWlk2q85OAR9/5CBPExVflaybXnWg
         Wrm6Sb3s1WNXFEYu+kmUaMRoJGSytqdEOgraYsjl0YrKfpxiuDa1f2uJrtiIO0Zs4Yr9
         NIC4gEPXnDDVNs1Uygc2rUU1zJWMZf0nQrvLFk8XeS20bE+nopz0QCSpilftn5DmEqua
         othpc0w6MXvMSu8P1gP2I736VV72m0z3GxEe2IiZXP60OPZ7x0yLGSP9h17Yjhz7phJe
         EleA3zlnsOs8zLH8Qnm1bZyFV2teStGNxGFsVkhvxz4b8vhrLQ8M5hKHeWXnAjw8z+q2
         B/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343193; x=1785947993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cS5bnPBGMkIbEsasH3IiqlepISBkwGNxs11plFYtxYU=;
        b=Dq9mFHsCKYPqM16weF0fn9/CrTNsmhq0A5maSgu4EskIaBvqnFyCh2OvNQaxek/KMj
         3oENwm0UwOUD9WZbzHZP+Qdo6E6uD+/LRPg1zvS3rhSqZboHrbaNk8E9m/BCQmZsBJBe
         AMPeVS/aaZkv3smg3nIE6FcXaFJo2SSXCAWmWEIucIy6wo/2r2fjrAzeuGYSBdBRaiKg
         L21BDFUtRmw+v2HbACODkuf0wHqZsvXV9uuZYD+W2BmcQLqIpA2qAhfCwLXO4VO/dm4h
         /y+E91vdk5WLm6lw8nxasPEDhdtjcNj5KK7Db5kRd8sDgEFc0tzSnTMG4vVtQz0B4QZf
         aZZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrt9NePWQrl1KAqJyx3Jr/AeD/6kGlvn6YO6fAHldBP7yBS86xfTdJf2R066QP62mF/xm76olXMrUB1TQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6iYssgAK/U/sqYkS2nhRP4IQk7Wz4ZsdBm8HhyZAP3/czIT7e
	+9qNQwEhL3CCwtHabiHeiHk1zTNhu91B53TG4XMSEwwg0bZUMZuz8zkOvGMhBjRilUw=
X-Gm-Gg: AR+sD12SziB0heAwIXguJ+cNLFDicAEImGvMfMW5TzVOI5I4/OUZQY0KauedJoC0lOb
	+t5aow0tR4+WNhQSvps4A2Bxq786JrYc/ytCdhrq9t4HsiAa6PSmoqgFLNTaEFOFj4Jzu0bfwA3
	1kOoRtOSuXKb8GHUWE9s24q/DLKe0ce9lCsWUI7khYtiZBA8q/ayKv+ojtFrp3kRIJJuF52xRm0
	1dT552cQD5SSo8Rgzfr8jp/++XW9TFAhrjabClGCBgdL/X1nyHuga4ajowK/fsQ0+qt8RW8AqUo
	84vVflal4ewq7D2qZ5QeDp3PdppL9J5PULTNHwwU9OQkHPfJK171Q4f6MttTf4c2BBEkk7+/SWb
	0HyCcUJN1hg9sRPScLGpKOn32HTE+T6nLTUQxTvxUS+n0QIcdzIRtmUZyjRyxwE45AGNAGp1G0W
	EfZMwopExVlarZg3BprZi7qEhWIWTe24l5XtSoPXA6bx5XPMcogWRXfmwVD2PkgKttTvt+kj+rr
	Lto8zgCzxMZ2OTduO0arlOD
X-Received: by 2002:a05:600c:1907:b0:495:4df2:7412 with SMTP id 5b1f17b1804b1-496c65b10edmr93741055e9.32.1785343193016;
        Wed, 29 Jul 2026 09:39:53 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45b0535sm164242145e9.4.2026.07.29.09.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:39:52 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com,
	dlan@kernel.org,
	guodong@riscstar.com,
	dfustini@oss.tenstorrent.com,
	michal.simek@amd.com,
	junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com,
	jim.shu@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	robin.randhawa@sifive.com,
	scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 3/3] dt-bindings: sifive: Add WorldGuard Checker
Date: Thu, 30 Jul 2026 00:39:08 +0800
Message-ID: <20260729163908.249838-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260729163908.249838-1-peter.lin@sifive.com>
References: <20260729163908.249838-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_093955_283418_36D0ABB6 
X-CRM114-Status: GOOD (  17.96  )
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

Add YAML binding schema for the SiFive wgChecker, a programmable
access controller integrated in the interconnect fabric of RISC-V
Worlds-capable SoCs.

wgChecker enforces World ID (WID) based access control on downstream
bus transactions. Each checker slot encodes a 2-bit permission field
per WID (read/write), enabling fine-grained memory partitioning and
device isolation between execution contexts. Violations are reported
via bus errors, interrupts, or both, selectable and lockable per slot.

The binding registers wgChecker as an access-controllers provider.
Consumers (i.e. its protected device) reference it via the standard
access-controllers phandle to declare their access requirements.

Also document the sifive,trustedwid property for the /cpus node,
identifying the privileged WID authorized to configure all checkers
on the platform.

Link: https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf
Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 .../devicetree/bindings/riscv/worlds.yaml     |   9 +
 .../bindings/sifive/sifive,wgchecker2.yaml    | 356 ++++++++++++++++++
 2 files changed, 365 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml

diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Documentation/devicetree/bindings/riscv/worlds.yaml
index cc8b3747591e..c39a06c2dd8d 100644
--- a/Documentation/devicetree/bindings/riscv/worlds.yaml
+++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
@@ -34,6 +34,14 @@ properties:
     minimum: 2
     maximum: 64
 
+  sifive,trustedwid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 31
+    description: |
+      The World ID (WID) designated as the trusted WID for this platform.
+      Transactions tagged with this WID are authorized to access and configure
+      WorldGuard blocks, including wgCheckers and wgMarkers.
+
 additionalProperties: true
 
 examples:
@@ -44,6 +52,7 @@ examples:
         #size-cells = <0>;
         timebase-frequency = <1000000>;
         riscv,nworlds = <4>;
+        sifive,trustedwid = <3>;
 
         cpu@0 {
             device_type = "cpu";
diff --git a/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
new file mode 100644
index 000000000000..c025a4765cb3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
@@ -0,0 +1,356 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 SiFive, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sifive/sifive,wgchecker2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive WorldGuard Checker
+
+maintainers:
+  - Yu-Chien Peter Lin <peter.lin@sifive.com>
+
+description: |
+  The RISC-V Worlds ISA extension defines World IDs (WIDs) as architectural
+  identifiers that tag each system transaction with its originating context.
+  System integrators assign WIDs to execution contexts such as privilege modes,
+  trusted execution environments, or other isolation boundaries.
+
+  The SiFive WorldGuard Checker is a hardware firewall positioned in the
+  system interconnect fabric. It inspects every transaction, evaluating the
+  WID against access control policies encoded in checker slots for each
+  protected resource. Transactions from unauthorized WIDs are blocked and
+  reported as bus errors, interrupts, or both.
+
+  This enables spatial partitioning of memory regions and memory-mapped devices
+  across execution contexts. Different address ranges can enforce distinct
+  policies, allowing isolated workloads to coexist with hardware-enforced
+  protection.
+
+  The wgChecker acts as an access-controller provider as defined in the
+  access-controllers framework. Protected devices are consumers that declare
+  their access policy via the access-controllers property. The hardware
+  supports up to 32 World IDs.
+
+  The World ID authorized to configure WorldGuard blocks is specified by the
+  sifive,trustedwid property in the /cpus node.
+
+allOf:
+  - $ref: /schemas/access-controllers/access-controllers.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: qemu,wgchecker2
+          - const: sifive,wgchecker2
+      - const: sifive,wgchecker2
+
+  reg:
+    maxItems: 1
+    description:
+      Base address and size of the wgChecker memory-mapped I/O registers.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt line asserted when a WID access violation is detected and
+      interrupt reporting is enabled in the slot configuration (IR or IW
+      bits set).
+
+  '#access-controller-cells':
+    const: 1
+    description: |
+      Specifies the partition identifier to reference a partition child
+      node that defines the access control region, WID permissions, and
+      access failure configuration. The special ID 0xFFFFFFFF indicates
+      unprotected mode, granting unrestricted access to the device.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^partition@[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      reg:
+        maximum: 0xFFFFFFFE
+        description:
+          Partition identifier. Must be unique within the wgChecker node.
+          The value 0xFFFFFFFF is reserved for unprotected mode and must
+          not be used.
+
+      sifive,protected-region:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Protected memory region encoded as a base address and size.
+        items:
+          - description: Upper 32 bits of the base address
+          - description: Lower 32 bits of the base address
+          - description: Upper 32 bits of the region size
+          - description: Lower 32 bits of the region size
+
+      sifive,slot-permissions:
+        $ref: /schemas/types.yaml#/definitions/uint64
+        description: |
+          64-bit WID permission bitmap. Each WID N uses two consecutive bits:
+            - bit[2*N]  : Read  permission for WID N
+            - bit[2*N+1]: Write permission for WID N
+          Set bits grant access.
+
+      sifive,slot-config:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 0x1F
+        description: |
+          Access failure configuration flags for this slot:
+            bit[0] (ER): report read  violations as bus errors
+            bit[1] (EW): report write violations as bus errors
+            bit[2] (IR): report read  violations via interrupt
+            bit[3] (IW): report write violations via interrupt
+            bit[4] (L) : lock this slot against further modification
+          Bits[5:31] are reserved and must be zero.
+
+    required:
+      - reg
+      - sifive,protected-region
+      - sifive,slot-permissions
+      - sifive,slot-config
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - '#access-controller-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    // Example 1: Peripheral device protection
+
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        timebase-frequency = <1000000>;
+        riscv,nworlds = <4>;
+        sifive,trustedwid = <3>;
+
+        cpu@0 {
+            device_type = "cpu";
+            reg = <0>;
+            compatible = "riscv";
+            riscv,isa-base = "rv64i";
+            riscv,isa-extensions = "i", "m", "a", "c", "smlwid";
+            riscv,pmwid = <3>;
+
+            cpu_intc0: interrupt-controller {
+                #interrupt-cells = <1>;
+                compatible = "riscv,cpu-intc";
+                interrupt-controller;
+            };
+        };
+    };
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        uart: uart@1c1000 {
+            compatible = "ns16550a";
+            reg = <0x0 0x001c1000 0x0 0x1000>;
+            reg-names = "control";
+            interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+            access-controllers = <&wgchecker0 0>;
+        };
+
+        wgchecker0: access-controller@1c2000 {
+            compatible = "qemu,wgchecker2", "sifive,wgchecker2";
+            reg = <0x0 0x001c2000 0x0 0x1000>;
+            #access-controller-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            interrupts = <80 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-parent = <&aplic0_m>;
+
+            partition@0 {
+                    reg = <0>;
+                    sifive,protected-region = <0x0 0x001c1000 0x0 0x00001000>;
+                    sifive,slot-permissions = <0x0 0x000000c3>;
+                    sifive,slot-config = <0x0f>;
+            };
+        };
+
+        aplic0_m: interrupt-controller@c000000 {
+            compatible = "qemu,aplic", "riscv,aplic";
+            reg = <0x0 0xc000000 0x0 0x4000>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            riscv,num-sources = <96>;
+            interrupts-extended = <&cpu_intc0 11>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    // Example 2: Device with multiple address regions and per-region access rules
+
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        timebase-frequency = <1000000>;
+        riscv,nworlds = <16>;
+        sifive,trustedwid = <3>;
+
+        cpu@0 {
+            device_type = "cpu";
+            reg = <0>;
+            compatible = "riscv";
+            riscv,isa-base = "rv64i";
+            riscv,isa-extensions = "i", "m", "a", "c", "smlwid";
+            riscv,pmwid = <3>;
+
+            cpu_intc1: interrupt-controller {
+                #interrupt-cells = <1>;
+                compatible = "riscv,cpu-intc";
+                interrupt-controller;
+            };
+        };
+    };
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        device: device@10000 {
+            compatible = "vendor,soc1-ip";
+            reg = <0x0 0x00010000 0x0 0x8000>,
+                  <0x0 0x00a00000 0x0 0x4000>;
+            reg-names = "m_mode", "s_mode";
+            // m_mode: WID 3 only; s_mode: WID 0,3 RW
+            access-controllers = <&wgchecker1 0>,
+                                 <&wgchecker1 1>;
+        };
+
+        wgchecker1: access-controller@35000 {
+            compatible = "qemu,wgchecker2", "sifive,wgchecker2";
+            reg = <0x0 0x00035000 0x0 0x1000>;
+            #access-controller-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            interrupts = <81 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-parent = <&aplic1_m>;
+
+            partition@0 {
+                    reg = <0>;
+                    sifive,protected-region = <0x0 0x00010000 0x0 0x00008000>;
+                    sifive,slot-permissions = <0x0 0x000000c0>;
+                    sifive,slot-config = <0x0f>;
+            };
+
+            partition@1 {
+                    reg = <1>;
+                    sifive,protected-region = <0x0 0x00a00000 0x0 0x00004000>;
+                    sifive,slot-permissions = <0x0 0x000000c3>;
+                    sifive,slot-config = <0x0f>;
+            };
+        };
+
+        aplic1_m: interrupt-controller@c000000 {
+            compatible = "qemu,aplic", "riscv,aplic";
+            reg = <0x0 0xc000000 0x0 0x4000>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            riscv,num-sources = <96>;
+            interrupts-extended = <&cpu_intc1 11>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    // Example 3: DRAM partitioning with a secure enclave
+
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        timebase-frequency = <1000000>;
+        riscv,nworlds = <4>;
+        sifive,trustedwid = <3>;
+
+        cpu@0 {
+            device_type = "cpu";
+            reg = <0>;
+            compatible = "riscv";
+            riscv,isa-base = "rv64i";
+            riscv,isa-extensions = "i", "m", "a", "c", "smlwid", "smwiddeleg", "sswid";
+            riscv,pmwid = <3>;
+
+            cpu_intc2: interrupt-controller {
+                #interrupt-cells = <1>;
+                compatible = "riscv,cpu-intc";
+                interrupt-controller;
+            };
+        };
+    };
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        memory@80000000 {
+            device_type = "memory";
+            reg = <0x0 0x80000000 0x0 0x80000000>;
+            access-controllers = <&wgchecker2 0>,
+                                 <&wgchecker2 1>,
+                                 <&wgchecker2 2>;
+        };
+
+        wgchecker2: access-controller@40000000 {
+            compatible = "qemu,wgchecker2", "sifive,wgchecker2";
+            reg = <0x0 0x40000000 0x0 0x1000>;
+            #access-controller-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            interrupts = <82 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-parent = <&aplic2_m>;
+
+            partition@0 {
+                    reg = <0>;
+                    sifive,protected-region = <0x0 0x80000000 0x0 0x40000000>;
+                    sifive,slot-permissions = <0x0 0x000000cf>;
+                    sifive,slot-config = <0x0f>;
+            };
+
+            partition@1 {
+                    reg = <1>;
+                    sifive,protected-region = <0x0 0xc0000000 0x0 0x01000000>;
+                    sifive,slot-permissions = <0x0 0x000000cc>;
+                    sifive,slot-config = <0x0f>;
+            };
+
+            partition@2 {
+                    reg = <2>;
+                    sifive,protected-region = <0x0 0xc1000000 0x0 0x3f000000>;
+                    sifive,slot-permissions = <0x0 0x000000cf>;
+                    sifive,slot-config = <0x0f>;
+            };
+        };
+
+        aplic2_m: interrupt-controller@c000000 {
+            compatible = "qemu,aplic", "riscv,aplic";
+            reg = <0x0 0xc000000 0x0 0x4000>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            riscv,num-sources = <96>;
+            interrupts-extended = <&cpu_intc2 11>;
+        };
+    };
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
