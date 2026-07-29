Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C43C53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 16:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4VrjRPml4Md1cZwSFTgw2MtFaXyWBeLp8nPiD8oxps=; b=hEY3U9AKHqYUaF
	fYgj57xRlcARkLf4Ud97nDHyAT0/XZ/WhpgdTPwu70h0QTcOzkhGey+u/droH3MLUH+PD2qMDo1qv
	9nJgyA0NnH5XHjEqePr4KtNLJapnJgxtixaxYQSjDxouA/8LG1G/8NHNeoKlg3xgjUp8XUQ2B40m4
	OO845VtPPFvcV4Ym7mNa5R6lVAayU3aM43qwYQraAvveLOtjX3KS5WDYx8v8CyoYA3tani/npMLV7
	UZCi9WPU8BLJZa/sbrAJOgXgJaI6BfQH5XmhCE1lPTCokd1+Nk3xGpc0evph18UJLWBhR7lie/a5x
	qi/AyPs2a4jDuShexV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Jr-00000008aQJ-1iuo;
	Wed, 29 Jul 2026 16:39:47 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Jp-00000008aNl-2Jyp
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 16:39:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4954afac04bso13306915e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 09:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1785343184; x=1785947984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXo5Hfq+PdrRzrAqsKzhmflGrHnglgU4pxXRXkmrMyI=;
        b=RvPpGyF/fFVTxC1QgFoIFSI2tD1mHq8qPQ2ABBswtVQ4SMvdemRcqIEBMGbYyL5Ros
         ESEfqR/dRuuNWKwJ81zYqJq7TpVAY8P+9HjlG4AD6KL1lCkLkK2vwTf93KuX2fB3FP53
         4xwHJtXQBWoUpXmmTmRhZZDeYNNTqB+OV08OT/lJ/Wgd8/4xhPxPfq+j2SEDhceBBcyx
         2JXXRPij6JpEGe+IU79oh9pWHJr/l//lPGrIN92vDYxIUctv0YImz8YB5yJjw1SjPJ2b
         yT3nclUSJywUw7NO5SZNixBf5thS9JJpqeYf1kQ5zYhTLoc0lxKjYg7S1lOWZFy2ivwe
         bsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343184; x=1785947984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXo5Hfq+PdrRzrAqsKzhmflGrHnglgU4pxXRXkmrMyI=;
        b=J9T5W2DpzDidDsAg/5ssbcgHGaxIxFqcb1fy51VlCtyvlGdzQ5S+kFsjcmMmR9Zk8l
         sTeEZxbrR97dd9JtbwZYXfPjMMoJJcQ6I2/OpTX3BPo0U6IArSAg4eBBJhOFyZy+SM+W
         mQG8WKDB3lDsKZz0fyJQXTFFtkH8sOQKhWbUWOQWZLLVq8J+tc9ksvqDtlcNjSP91Pc2
         rJTAs5R1YggaHSyLDtggUsJTx58ffVb93uydVG5MxsYJzcCIL8JU8i26Ll4ZS69mf3v3
         N1G7QBKGw+3R5AcLjaJJoRzQaQ8sgpHfvUCSaQe3jyR9moAkXcc3MvAOtqfAjuH1e8Pv
         7Z7g==
X-Forwarded-Encrypted: i=1; AHgh+RpE8qAKSLmcNf5CwTn5uJvHzV9R2G/QOd+JNKakLNvFbPlhgZcF2ImxOFM8PXWLyzMiauMOa7zK8FJ2LQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8cPJfst3+rXxTcJHk4TLClw62fRXJWaKgARAOwe3n7yguERiP
	yzssp7dDrIeN9ZeYUN0f3ZkSsNssOXlaTmH6e5VgyaZkC5CQaD5+sSP8rPJL9ibHu4Q=
X-Gm-Gg: AR+sD11m8Kl0lPDmGK9wGwYWa+PB5Jt0DO0xUA0uV6JoMQW7lVbkEik2X6bLox3vJAm
	INYjNFcjMiAwVVTV7ZxBbdaavy6SoHkp5XhSIhOXhkJCm0KxWv0pACNNAsRBJH9SnwgyvizuFoA
	mcwJWwCSnUYYWilvexNZr02m4oVHvkLaukeHQSZBaD0gWmR0zUVAVOY0yzXSNglPL53TiSaj596
	Se7jOyYfonk2dMZeN+cTYoqYGwTQgsglO+gvhM7FbRy6i+oSo0G+NQgTS2VYfbSIIi2rgY4TDvZ
	iNg6FbkQXS7tMDSoxkPYg/UX94NBv5wyH5qUQ7zNtroUw+H7w7TqGgY2FwhwynF8p9TBAY6TFUm
	Da3fEO/d8T/x6eLOLFdC8vjyHRaJCS2r6/wkpba4vxSwaYmxB0UeEtvQzR8GHi8bHZFHb6tD0OM
	oy/9E/ve5L/z2EuMpvfTVOSm7Ck6/cI4RsmJi1getkys2FXFU7Cl9bGstneSTZrMQBTAujdRusy
	AksLLJ2+9QsAUcGqcLaHVI=
X-Received: by 2002:a05:600c:c48f:b0:495:4487:61af with SMTP id 5b1f17b1804b1-496c65cbceemr88122545e9.36.1785343183886;
        Wed, 29 Jul 2026 09:39:43 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45b0535sm164242145e9.4.2026.07.29.09.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:39:42 -0700 (PDT)
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
Subject: [PATCH v2 2/3] dt-bindings: riscv: Add Worlds per-hart properties
Date: Thu, 30 Jul 2026 00:39:07 +0800
Message-ID: <20260729163908.249838-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260729163908.249838-1-peter.lin@sifive.com>
References: <20260729163908.249838-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_093945_640423_F9C05B49 
X-CRM114-Status: GOOD (  17.46  )
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

Add per-hart DT properties for the RISC-V Worlds architecture:
riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
platform-defined values are primarily used by M-mode firmware
to configure World ID CSRs and restrict WID usage across
privilege levels.

Also add schema validation rules to enforce valid property
combinations based on the ISA extensions present.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 .../devicetree/bindings/riscv/cpus.yaml       | 61 +++++++++++++++
 .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 5feeb2203050..5922a0307cfe 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -26,6 +26,7 @@ description: |
 allOf:
   - $ref: /schemas/cpu.yaml#
   - $ref: extensions.yaml
+  - $ref: worlds.yaml
   - if:
       not:
         properties:
@@ -39,6 +40,44 @@ allOf:
       properties:
         thead,vlenb: false
 
+  - if:
+      properties:
+        riscv,isa-extensions:
+          not:
+            contains:
+              const: smwid
+    then:
+      properties:
+        riscv,pmwidlist: false
+
+  - if:
+      properties:
+        riscv,isa-extensions:
+          not:
+            contains:
+              const: smlwid
+    then:
+      properties:
+        riscv,pmlwidlist: false
+
+  - if:
+      allOf:
+        - properties:
+            riscv,isa-extensions:
+              not:
+                contains:
+                  const: smwid
+        - properties:
+            riscv,isa-extensions:
+              contains:
+                enum:
+                  - smlwid
+                  - smwiddeleg
+                  - sswid
+    then:
+      required:
+        - riscv,pmwid
+
 properties:
   compatible:
     oneOf:
@@ -120,6 +159,28 @@ properties:
       thead systems where the vector register length is not identical on all harts, or
       the vlenb CSR is not available.
 
+  riscv,pmwid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      M-mode World ID (WID) for this hart, M-mode firmware may read this property
+      to identify the WID for M-mode. For a Worlds-aware platform without any Worlds
+      ISA implemented, this is the WID for all privilege modes.
+    minimum: 0
+    maximum: 63
+
+  riscv,pmwidlist:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Optional bitmask of WIDs available for M-mode use on this hart; each set bit N
+      indicates WID N is available. Firmware may read this to select a platform
+      authorized WID.
+
+  riscv,pmlwidlist:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      Optional bitmask of WIDs available for S-mode and U-mode use on this hart; each
+      set bit N indicates WID N is available. Firmware may read this to select platform
+      authorized WIDs for lower-privilege modes.
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false
diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Documentation/devicetree/bindings/riscv/worlds.yaml
new file mode 100644
index 000000000000..cc8b3747591e
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR MIT)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/worlds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Worlds Extension
+
+maintainers:
+  - Yu-Chien Peter Lin <peter.lin@sifive.com>
+
+description: |
+  The RISC-V Worlds ISA extension, as described in the RISC-V Privileged
+  Specification, adds World ID tagging for context isolation.
+
+  This binding describes the system-wide Worlds configuration for the /cpus node
+  and is used alongside per-hart Worlds-related properties such as riscv,pmwid in
+  the RISC-V CPU binding and Worlds-related ISA extensions enumerated via
+  riscv,isa-extensions.
+
+select:
+  properties:
+    $nodename:
+      pattern: "^cpus$"
+
+properties:
+  riscv,nworlds:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Number of World IDs (WIDs) supported by the platform. This is a system-wide
+      property that describes the total number of isolation contexts available.
+      Hardware components such as the WorldGuard Checker use this to determine
+      the valid range of WID values.
+    minimum: 2
+    maximum: 64
+
+additionalProperties: true
+
+examples:
+  - |
+    // Example: System with 4 World IDs
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        timebase-frequency = <1000000>;
+        riscv,nworlds = <4>;
+
+        cpu@0 {
+            device_type = "cpu";
+            reg = <0>;
+            compatible = "sifive,bullet0", "riscv";
+            riscv,isa-base = "rv64i";
+            riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
+            riscv,pmwid = <0>;
+
+            interrupt-controller {
+                #interrupt-cells = <1>;
+                compatible = "riscv,cpu-intc";
+                interrupt-controller;
+            };
+        };
+
+        cpu@1 {
+            device_type = "cpu";
+            reg = <1>;
+            compatible = "sifive,bullet0", "riscv";
+            riscv,isa-base = "rv64i";
+            riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
+            riscv,pmwid = <1>;
+
+            interrupt-controller {
+                #interrupt-cells = <1>;
+                compatible = "riscv,cpu-intc";
+                interrupt-controller;
+            };
+        };
+    };
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
