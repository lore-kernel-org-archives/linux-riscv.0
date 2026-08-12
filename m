Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8570DC5AD5A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 12:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZ+nGhid973Zx/7jGVcM3c8Rd9rcNgN1PrQn9e1lT7k=; b=Ly+1neVWlVmI4F
	4oWhOqRwHn7KbAK7pm+YdaQr/Iz0a2p7UifwsTZh0qVWptS3GoUF19gA0WQg0moN6tFJbosRJR36H
	JUdoTLJaWLkHfF47WlK+K30avprpEpUjhpSTCRH1vmFSIzYSfD/bWbLzjeAPnytuDrfVBRooFdp5p
	tUwfiaH0prDnT8OAunioC7NawU7VoWkP86a6dajDwmsfVcJ09IP82ESKfViKuvcb4YxyJXO3xlGG6
	4X5JYqvo6ae34W3z32XgM5WaBnTMU1ChS8mu1rydVPmNhfLMx3P0c4jCSJnoGMlrAhhrm0uWCkTbV
	P3Jb1fCmuAZs9f/bSVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7yO-0000000GB4v-2NCd;
	Wed, 12 Aug 2026 12:22:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7yL-0000000GB2t-2i7B
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 12:22:19 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-495437bb891so8043895e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 05:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786537336; x=1787142136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5DUOnFgT4BM2v4pDSlAoo93/0oVmKBpbPEKyoUyGdXE=;
        b=Vy56FYf4URrPQpf2YcLlFin5CsdQZhrbsRszY6lxJfZ2KGdrRUPZk0jd9Pont/AC/k
         vLOt4muwWf0FCkZDHqXFBlWhG1OIsfR/8NVNVCiEAKLWsJypSHQd8DW+xmyCaoImhin7
         ip9mPTDGCx30jCVKny2zmbEyUsX4i8bABwd+AcEAFbhm2deSaKHr3ZR9QCLoMAjyl4g0
         /Lbjkx5VzeTL/jS1e1D597maFER5CCsplugYvVxlVdGnXDU+V04h8sZS6NcRFdzBUQIx
         AZE/pSD32VJ4wtfUVeo77HqnMdIXWfdVlTUq0Km8F251aIKg3ncWi4Vt859wONtScacf
         RMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786537336; x=1787142136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5DUOnFgT4BM2v4pDSlAoo93/0oVmKBpbPEKyoUyGdXE=;
        b=Pmt3lnvkfYr3kdtTS77IN3c3I0OBV2muPhPldzfF858TOQUX9C/xFyvbjqUnyyxhz7
         f9oy/3hvKJ54usCZ12kJaKFra+5IVd7NQo+zrC5u7DgJc8JWZkJrbnHkBSHeq+jUDMej
         yKJEfQF8UdU+WIL53jAEE5G9xVXASIy4u1daiv+XkUAeBNwdIGcF8CtT4aBvIvOKqw7W
         WFuZofoFg1y/LmAKrcEBvzLC5siKH5htTD/OaaVL2KnQ86VTL5ql3yKolS5k140E8FyC
         JCm90Sb5peNNelfV/6SMEYU+T0hhVIeXpDuyzgbhelb/9kmLDb4exGrEUcdaKedDnrzx
         +mRw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0o4Xi34y8GxjTYu19C0wLFUaI3qGrSmf8dfeX44vkl7rAWWHpHYMn92msVvE8Yn7N3aFYq3lKr3yhlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhcUvtlnMpTy+pTvBD2iHnxXUTcHtUGO3TNJA9hO/pBeIM/SVg
	t2ymat8O1XO7TX5I2ggE1vREww0Hs2B/HC7tz+bGKTkxtJbVgiDI+GCThnGTShnbQ0M=
X-Gm-Gg: AR+sD13Tv8DNdID+QvnFYOSgX90OKdNe7GdCTn9LJAXZHpuvZVkSIG9SaW8RB0jPqIQ
	6VkKXGsJmfW6b2j8ksX2+vZU6aqC82hXLrnb8MIePBwS4uLG5AWerqCbb/mcf4279hFRRz+D+El
	nbFTskRELmjx6YiRiTvWWgDKRE7L7T2B/aS4KyeOsFdwWju6Eofgp7bzXRYEDRwD7AC5dAWKClf
	/z+X1dXzNnHzZAx31mj+qy3MC1hDqbsz7fq1mVhYIyjVyYhZcK8nGlBXt0d6QA5D9UDzFhSk9fT
	Wkcq2IxfS0a7lh+mdroRwgWLZNq4nLnRWs4gcIWfKbzp8myfEfQo9FZzXXkoeipp/voYSt+HgUr
	7J6v1cVERu3r+0f+HnPxzJLqdHs4yaneXb6BxtFVrZiIW51q0orO+rPgkPoA7nIFJ9zOEbbtkA9
	QVySmwsHY2jH04jTySeI/LMqnQzM+ulSbWat5KHg2WZ9PdkWFMw5qx2nvYwxgF+6LlbSgmHWVTG
	bBh9+Pq1h7Z
X-Received: by 2002:a05:600c:3544:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-4997c51d13cmr52410645e9.7.1786537335594;
        Wed, 12 Aug 2026 05:22:15 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aaa5d04sm65858905e9.2.2026.08.12.05.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:22:14 -0700 (PDT)
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
Subject: [RFC PATCH v3 3/3] dt-bindings: access-controllers: Add SiFive WorldGuard Checker
Date: Wed, 12 Aug 2026 20:21:31 +0800
Message-ID: <20260812122131.1534906-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260812122131.1534906-1-peter.lin@sifive.com>
References: <20260812122131.1534906-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_052217_795144_41345A7A 
X-CRM114-Status: GOOD (  16.84  )
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

Add binding for the SiFive wgChecker, a programmable access controller
integrated in the interconnect fabric of RISC-V Worlds-capable SoCs.

At this initial stage, the binding is designed for M-mode firmware
to configure wgChecker partitions during platform initialization.
Linux typically runs as an untrusted World and does not require a
wgChecker driver; instead, it operates within the constraints enforced
by firmware-configured partitions.

wgChecker acts as an access-controllers provider, with consumers
(protected devices) referencing it via the standard access-controllers
phandle to declare their access requirements.

Link: https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf
Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Changes v2->v3:
- Drop sifive,trustedwid property
- Reposition YAML file to bindings/access-controllers (Krzysztof)
- Fix compatible string (Krzysztof and Conor)
- Drop unneed description from stardard property (Krzysztof)
- Use consistent quotes (Krzysztof)
- Keep access controller provider node only (Krzysztof)
- Fix node name (Conor)
- Rename sifive,protected-region to sifive,wg-region
---
 .../access-controllers/sifive,wgchecker2.yaml | 178 ++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/access-controllers/sifive,wgchecker2.yaml

diff --git a/Documentation/devicetree/bindings/access-controllers/sifive,wgchecker2.yaml b/Documentation/devicetree/bindings/access-controllers/sifive,wgchecker2.yaml
new file mode 100644
index 000000000000..23ff7d6ef08e
--- /dev/null
+++ b/Documentation/devicetree/bindings/access-controllers/sifive,wgchecker2.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 SiFive, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/access-controllers/sifive,wgchecker2.yaml#
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
+  System integrators assign WIDs to execution contexts such as privilege
+  modes, trusted execution environments, or other isolation boundaries.
+
+  The SiFive WorldGuard Checker is a hardware firewall positioned in the
+  system interconnect fabric. It supports up to 32 WIDs and inspects every
+  transaction, evaluating the WID against access control policies encoded
+  in checker slots for each protected resource. Transactions from
+  unauthorized WIDs are blocked and reported as bus errors, interrupts, or
+  both.
+
+  This enables spatial partitioning of memory regions and memory-mapped
+  devices across execution contexts. Different address ranges can enforce
+  distinct policies, allowing isolated workloads to coexist with
+  hardware-enforced protection.
+
+  The wgChecker acts as an access-controller provider as defined in the
+  access-controllers framework. Protected devices are consumers that
+  declare their access policy via the access-controllers property.
+
+allOf:
+  - $ref: /schemas/access-controllers/access-controllers.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qemu,wgchecker2
+      - const: sifive,wgchecker2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt line asserted when a WID access violation is detected and
+      interrupt reporting is enabled in the slot configuration (IR or IW
+      bits set).
+
+  "#access-controller-cells":
+    const: 1
+    description: |
+      Specifies the partition identifier to reference a partition child
+      node that defines the access control region, WID permissions, and
+      access failure configuration. The special ID 0xFFFFFFFF indicates
+      unprotected mode, granting unrestricted access to the device.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
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
+      sifive,wg-region:
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
+      - sifive,wg-region
+      - sifive,slot-permissions
+      - sifive,slot-config
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - "#access-controller-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    // Example 1: Peripheral device protection
+
+    access-controller@c1000 {
+        compatible = "qemu,wgchecker2", "sifive,wgchecker2";
+        reg = <0xc1000 0x1000>;
+        #access-controller-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <80 4>;
+
+        partition@0 {
+            reg = <0>;
+            sifive,wg-region = <0x0 0x000c0000 0x0 0x00001000>;
+            sifive,slot-permissions = <0x0 0x000000c3>;
+            sifive,slot-config = <0x0f>;
+        };
+    };
+
+  - |
+    // Example 2: DRAM partitioning with multiple regions
+
+    access-controller@40000000 {
+        compatible = "qemu,wgchecker2", "sifive,wgchecker2";
+        reg = <0x40000000 0x1000>;
+        #access-controller-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <82 4>;
+
+        partition@0 {
+            reg = <0>;
+            sifive,wg-region = <0x0 0x80000000 0x0 0x40000000>;
+            sifive,slot-permissions = <0x0 0x000000cf>;
+            sifive,slot-config = <0x0f>;
+        };
+
+        partition@1 {
+            reg = <1>;
+            sifive,wg-region = <0x0 0xc0000000 0x0 0x01000000>;
+            sifive,slot-permissions = <0x0 0x000000cc>;
+            sifive,slot-config = <0x0f>;
+        };
+
+        partition@2 {
+            reg = <2>;
+            sifive,wg-region = <0x0 0xc1000000 0x0 0x3f000000>;
+            sifive,slot-permissions = <0x0 0x000000cf>;
+            sifive,slot-config = <0x0f>;
+        };
+    };
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
