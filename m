Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD0DCD4F26
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 10:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+Ocwyk9ifGurfb7nXM7Nzz5hyLqdxctLuZa266MA6w=; b=REmWXeIlFgbE8k
	OLfkJeH50lU1amNTsJ+Wxrn0X1o3QNVFyRQljZ/AFZ6MazeCiOLFpOvI9eCAw5HtpbO0TD/spBAUx
	iss+4omp81uykmiN2kkdfmqMSSqJ7HoEl83CtSE1qKNsZrnSftwWAv0AJHpLmsQrIf0OgXGdV3a1n
	qngZx8AnrCliSGvlLvJ58k4+2fLfhtgQWXiQk01xAceC9wpR4RCb9HdHTjR89acVsBHJJ+BSZVa//
	yK9//FI12kX8K7ie25KgO1XTEe3ooqbMNQgrb0VFK4ql9Mdr1Tv6iYZkAGE8xsWkyuPu4Ef6MBTpA
	Ys710zFuG8XLPjO4FJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWoy-00000002In4-0VUk;
	Fri, 19 Jun 2026 10:51:36 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWol-00000002IkF-0Pc3
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 10:51:35 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c86307c4e6bso922547a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jun 2026 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1781866282; x=1782471082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyCAlXy5U92yJRNxpudE8QDW5HtKMoI60RBC7r6sEOQ=;
        b=bXb9ot+XIU3+KtV9D7zgEr7YF7q65ipTWVyyrK4KBPho0lFbheC5F4uBghKQmNJeCy
         8WFMFHZ1TSjLfPjcf+pFXAM1YF1Z3Oj4bYsjtMD7P1OaSqovcYXkgcTksU8gYo1qPJNC
         qWuOzZBrhIbgnAy1c9+fyGXZcdzHxo1iS+OlV9IWnd7JVvmup4ggyMzZ5AUG5S42pHJy
         /Td+C6Ce1jV4JCXouNbiLAIFCXTqdqmEpY9111k+g//Ho5sv6RtWjwUWUipZJOvMZENw
         HzZO+R3I01yWQKZgVc9lnu6Z4ypp/efulA2gPgoWowxkYKL7i0YIvYPd5cltMLf9n6D3
         wxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866282; x=1782471082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iyCAlXy5U92yJRNxpudE8QDW5HtKMoI60RBC7r6sEOQ=;
        b=jXvDLhVnen1tOAEPattlnr+cJa3jgExTZlZKqM9xTuDRGu+U5gvV+o+PN6/sRzmO6u
         pnaz14Tf6Ztd1mREUjx8srn1hMFko3GzZrkjlkaqnaltCsIhGgASCXxXPDEpyzyRoz9g
         bKOn48+UL6/Esjirx27dAfqFvv68Wrp/deY6o3R9gv4UCxqZ47Pursrcie4r59Xy+A+T
         FcmmhQTA+BELff9ucD1bBwj9CgzEOnfQMrKHTi8/PSJkkHksm2zv8DTe6+iAcRiX0BQ4
         caGB5kA4E2KvXAZAdQcpXAcoj7sHYsVjrNBDueKG+bkb/P502M7V47MNYAdfmOKx49tc
         oLgg==
X-Forwarded-Encrypted: i=1; AFNElJ8DIk973zdTo5LqSY375kIK/cRENhcpDuSlpH3ySokuRkQrXPVqQyPXZGOkmnKthwrsfC/W6cei6BEvxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTcUBXvYBLgSKR6LiNe+1RreOSP0Tx1vWqxDPz/mFl4JCojKQ1
	5EcfzXpuH3LGvSP6/WGNThCr4PZPBbEfu6yzMAO+lfqw+BykwnPh307ZcY5YHHTbM/k=
X-Gm-Gg: AfdE7cmCxGSbXaHN3uuyxRC5p4AnjSW8CLBGaYWRMZWva/jy66GeOQukBEseh15Wves
	ieDrnRPTi982/FpNiZeCCFrQvmbiReHsYh01E6ExbIXjBVf1d+VhlotNYa0XjXyfuvSXkStI6Ic
	IDlgeuBxHD2XgwcklvqK7IWbirnrS5cI4LGbGqN1d+h8mYedWT2K3SVB3uoxYFI2wCetUmP2riy
	0939Jzszp6OnfmnU6R7Fi7k9JAL8aUOXvqrX27D0x06eKb0ydhMCIEx8bV3yw3C+Cdlo/M0sRIZ
	i61G0YcFSlHx/THk3PK6+lIrtjw1AJo2xQT6uS0lzViSTkzBwOkCEU37Cip4t50V/JB2Q6nul19
	dunuCy+OBqxKMTqsNq2SszVCAc9FK/cgJdpFBLHkCZGN7CzLvk70cedqsPA8EzNTChHDHlryDOa
	/o315krk1RS2A/Zvl0aQ7+CiLo4QkxqD/FZ9+/
X-Received: by 2002:a05:6a21:468a:b0:3b9:5efb:cb2a with SMTP id adf61e73a8af0-3bb31adb348mr3976874637.3.1781866282139;
        Fri, 19 Jun 2026 03:51:22 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a84c6eb1bsm1993583a12.2.2026.06.19.03.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:51:21 -0700 (PDT)
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
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 3/3] dt-bindings: sifive: Add WorldGuard Checker
Date: Fri, 19 Jun 2026 18:58:34 +0800
Message-ID: <20260619105834.1277302-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260619105834.1277302-1-peter.lin@sifive.com>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_035133_811754_9821A02D 
X-CRM114-Status: GOOD (  15.94  )
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

Add DT binding for SiFive wgChecker2, a hardware firewall enforcing
WID-based access control in RISC-V Worlds. Provides checker slots to
program per-WID permissions for downstream resources, with optional
sub-range partitioning.

Link: https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf
Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 .../devicetree/bindings/riscv/worlds.yaml     |   9 +
 .../bindings/sifive/sifive,wgchecker2.yaml    | 237 ++++++++++++++++++
 2 files changed, 246 insertions(+)
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
index 000000000000..043c748385ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
@@ -0,0 +1,237 @@
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
+    const: sifive,wgchecker2
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
+    const: 7
+    description: |
+      Specifier for one access-control rule, encoded as seven u32 cells:
+        <addr-hi addr-lo size-hi size-lo perm-hi perm-lo config>
+
+      where:
+        - addr-hi, addr-lo: 64-bit base address of the protected region.
+        - size-hi, size-lo: 64-bit size of the protected region in bytes.
+        - perm-hi: Permission bitmap for WIDs 16..31. Two bits per WID:
+                     bit 2*(WID-16)   = Read  permission
+                     bit 2*(WID-16)+1 = Write permission
+                   Set bits grant access. Use 0x0 for systems with
+                   riscv,nworlds <= 16.
+        - perm-lo: Permission bitmap for WIDs 0..15. Two bits per WID:
+                     bit 2*WID   = Read  permission
+                     bit 2*WID+1 = Write permission
+                   Set bits grant access.
+        - config:  Slot configuration bits:
+                     Bit 0 (ER): Report read  violations as bus errors
+                     Bit 1 (EW): Report write violations as bus errors
+                     Bit 2 (IR): Report read  violations via interrupt
+                     Bit 3 (IW): Report write violations via interrupt
+                     Bit 4 (L):  Lock bit - prevents further modification
+                   Bits 5..31 are reserved and must be zero.
+
+      Multiple entries may be listed to apply different policies to
+      different address ranges, including sub-ranges within a single
+      physical resource.
+
+required:
+  - compatible
+  - reg
+  - '#access-controller-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    // Example 1: Single device protection
+    // WID 0 and WID 3 have RW access to UART; errors and IRQs reported.
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
+            riscv,isa = "rv64imac";
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
+            // WID 0,3 RW; report errors+IRQs
+            access-controllers = <&wgchecker0
+                                  0x0 0x001c1000 0x0 0x00001000
+                                  0x0 0x000000c3 0x0f>;
+        };
+
+        wgchecker0: wgchecker@1c2000 {
+            compatible = "sifive,wgchecker2";
+            reg = <0x0 0x001c2000 0x0 0x1000>;
+            #access-controller-cells = <7>;
+            interrupts = <80 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-parent = <&aplic_m>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    // Example 2: Multi-reg device with separate per-range rules
+    // m_mode: WID 3 only; s_mode: WID 0,3 RW.
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
+            riscv,isa = "rv64imac";
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
+            access-controllers = <&wgchecker1
+                                  0x0 0x00010000 0x0 0x00008000
+                                  0x0 0x000000c0 0x0f>,
+                                 <&wgchecker1
+                                  0x0 0x00a00000 0x0 0x00004000
+                                  0x0 0x000000c3 0x0f>;
+        };
+
+        wgchecker1: wgchecker@35000 {
+            compatible = "sifive,wgchecker2";
+            reg = <0x0 0x00035000 0x0 0x1000>;
+            #access-controller-cells = <7>;
+            interrupts = <81 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-parent = <&aplic_m>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    // Example 3: DRAM partitioning with secure enclave
+    // Sub-range 1 [0x80000000, 0xC0000000): WID 0,1,3 RW
+    // Sub-range 2 [0xC0000000, 0xC1000000): WID 1,3 only (secure enclave)
+    // Sub-range 3 [0xC1000000, 0x100000000): WID 0,1,3 RW
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
+            riscv,isa = "rv64imac";
+        };
+    };
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ddr: memory@80000000 {
+            device_type = "memory";
+            reg = <0x0 0x80000000 0x0 0x80000000>;
+            access-controllers =
+                <&wgchecker2
+                 0x0 0x80000000 0x0 0x40000000
+                 0x0 0x000000cf 0x0f>,
+                <&wgchecker2
+                 0x0 0xc0000000 0x0 0x01000000
+                 0x0 0x000000cc 0x0f>,
+                <&wgchecker2
+                 0x0 0xc1000000 0x0 0x3f000000
+                 0x0 0x000000cf 0x0f>;
+        };
+
+        wgchecker2: wgchecker@40000000 {
+            compatible = "sifive,wgchecker2";
+            reg = <0x0 0x40000000 0x0 0x1000>;
+            #access-controller-cells = <7>;
+            interrupts = <82 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-parent = <&aplic_m>;
+        };
+    };
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
