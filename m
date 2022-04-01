Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F34C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 21:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BCpdh6gd7TybkjNk9bgug6ivUSiTbNygZqyWaad2r8k=; b=B1cCTI+TUYXmxO
	oJkBzz5Tv8/E/x9Zm6Uqs+nwMB0P+Qi8d/m2j0uFu04VDqK73Flok6RkGn+3SNw3pdV6BkXHiFUSf
	dGDWSmsK22RVbcU7B05L8+xXap085RnFhOj3hokq/GREqUl+kNReUWKqcl21/RovmMXQzfFHM5t2z
	6k1KIQH5iSE3exZQMsperlcflxHOA0e9UeAltKloX4DqONjcZRG/GX9uhx8/9uLASe10VQsdVlljZ
	K5Nz68IJmTTOK8DMz6QO87nWLDrtht+j0Hd5ZMcdR5/+fMGv/d9dNVR25mPM+q4sv5xpWkjeJtubU
	EHvezuacO0PuJGHkJ2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naOwU-007PSn-L6; Fri, 01 Apr 2022 21:36:26 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naOwR-007PQQ-M9
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 21:36:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id u12so1335689plg.10
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 14:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=aYp862D2P9rwZ8w0k1RYiGcPZn0LcpIwaRufe0fXT+Y=;
 b=cR90qpjLF0s9TN5+/tmfd7tRVhzAw6Rgcp1bmgNs6j2lfN/LDqZYdNhcaIXKiZMO/5
 fCHJ+cLyou32ow4gj+JQD8M47sayLWMuqhytBxmsrrMgJh784Y0FcJBSjaoMZTl/a0Ee
 uiGnFvZpZog9cICQuFau+R4G03yPe1jBNJ2LF1giFjkkEPHIMcuZel8Gu5eT7q+Whwx9
 B88Hdsg9JO30Lea971VElBKwttjn1vh3H5gNRKgO8XdOosayy4Tq/MDyVIjp94eIVyqz
 FPGzj7TTFGr4Y8Pw+6tnH6g7s2iWxY7x2EG4qk90xSy10Gmp79kNCIj3J/PgXJGZ6oTb
 flrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=aYp862D2P9rwZ8w0k1RYiGcPZn0LcpIwaRufe0fXT+Y=;
 b=N3iDQB00ZrucQ5jVlgzkXqaFTfzwXs97wI4/LSH1TbU7McBLNgT3DGBvZN9ma69HCk
 WWVGSWBCe0UzZXimylWf8HWSZEsMDazV+H8B33r+84MXa+JGL07o7MWsuUNiM8R6vKzg
 lclCDV/iq8G+fzgIuH21IhuKtapD3m0VITk0v0q9g3rTCnL4144TINEKsgsl5xS/9CBm
 ArC0NPFv7dKYJpJCxoRR1MxvXHXt6yvTLaPoDqtNM7N5hyvLpcm4c7AjWDgfgO5nucma
 KWpQdNasil3HtdlgLsTvRvsB72eKC7OAlMzewv2pcuhshvmTAbyEjBKTIYdahKz1eR7r
 m25g==
X-Gm-Message-State: AOAM533AHAddNVl9P9P58nCyQWjxebiyqlqfS3MxO3vS4o6ep7r56iNW
 JPJfG2ZGkx/Kg6VYGknWZty0QQ==
X-Google-Smtp-Source: ABdhPJy2vP197SYrTV+OCDd087GwI8iQmVI39nnJ2WNSiTv31PP7MRAc4GpXIwLVD8UeXqi3YbAXsA==
X-Received: by 2002:a17:90a:31cf:b0:1c9:f9b8:68c7 with SMTP id
 j15-20020a17090a31cf00b001c9f9b868c7mr14145759pjf.34.1648848981896; 
 Fri, 01 Apr 2022 14:36:21 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 d24-20020a637358000000b003823aefde04sm3228507pgn.86.2022.04.01.14.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 14:36:21 -0700 (PDT)
Subject: [PATCH v3] dt-bindings: Fix phandle-array issues in the idle-states
 bindings
Date: Fri,  1 Apr 2022 14:26:59 -0700
Message-Id: <20220401212658.30607-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, anup@brainfault.org,
 guoren@kernel.org, krzk@kernel.org, 
 lorenzo.pieralisi@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_143623_982350_B41FD241 
X-CRM114-Status: GOOD (  10.98  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

As per 39bd2b6a3783 ("dt-bindings: Improve phandle-array schemas"), the
phandle-array bindings have been disambiguated.  This fixes the new
RISC-V idle-states bindings to comply with the schema.

Fixes: 1bd524f7e8d8 ("dt-bindings: Add common bindings for ARM and RISC-V idle states")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Changes since v2:

* Add the missing schema requirement to riscv/cpus.yaml

Changes since v1:

* Only fix the RISC-V bindings, to avoid a merge conflict.

---
 .../devicetree/bindings/cpu/idle-states.yaml     | 16 ++++++++--------
 .../devicetree/bindings/riscv/cpus.yaml          |  2 ++
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/cpu/idle-states.yaml b/Documentation/devicetree/bindings/cpu/idle-states.yaml
index 95506ffb816c..0e89c469d0fc 100644
--- a/Documentation/devicetree/bindings/cpu/idle-states.yaml
+++ b/Documentation/devicetree/bindings/cpu/idle-states.yaml
@@ -719,8 +719,8 @@ examples:
             reg = <0x0>;
             riscv,isa = "rv64imafdc";
             mmu-type = "riscv,sv48";
-            cpu-idle-states = <&CPU_RET_0_0 &CPU_NONRET_0_0
-                            &CLUSTER_RET_0 &CLUSTER_NONRET_0>;
+            cpu-idle-states = <&CPU_RET_0_0>, <&CPU_NONRET_0_0>,
+                            <&CLUSTER_RET_0>, <&CLUSTER_NONRET_0>;
 
             cpu_intc0: interrupt-controller {
                 #interrupt-cells = <1>;
@@ -735,8 +735,8 @@ examples:
             reg = <0x1>;
             riscv,isa = "rv64imafdc";
             mmu-type = "riscv,sv48";
-            cpu-idle-states = <&CPU_RET_0_0 &CPU_NONRET_0_0
-                            &CLUSTER_RET_0 &CLUSTER_NONRET_0>;
+            cpu-idle-states = <&CPU_RET_0_0>, <&CPU_NONRET_0_0>,
+                            <&CLUSTER_RET_0>, <&CLUSTER_NONRET_0>;
 
             cpu_intc1: interrupt-controller {
                 #interrupt-cells = <1>;
@@ -751,8 +751,8 @@ examples:
             reg = <0x10>;
             riscv,isa = "rv64imafdc";
             mmu-type = "riscv,sv48";
-            cpu-idle-states = <&CPU_RET_1_0 &CPU_NONRET_1_0
-                            &CLUSTER_RET_1 &CLUSTER_NONRET_1>;
+            cpu-idle-states = <&CPU_RET_1_0>, <&CPU_NONRET_1_0>,
+                            <&CLUSTER_RET_1>, <&CLUSTER_NONRET_1>;
 
             cpu_intc10: interrupt-controller {
                 #interrupt-cells = <1>;
@@ -767,8 +767,8 @@ examples:
             reg = <0x11>;
             riscv,isa = "rv64imafdc";
             mmu-type = "riscv,sv48";
-            cpu-idle-states = <&CPU_RET_1_0 &CPU_NONRET_1_0
-                            &CLUSTER_RET_1 &CLUSTER_NONRET_1>;
+            cpu-idle-states = <&CPU_RET_1_0>, <&CPU_NONRET_1_0>,
+                            <&CLUSTER_RET_1>, <&CLUSTER_NONRET_1>;
 
             cpu_intc11: interrupt-controller {
                 #interrupt-cells = <1>;
diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index f62f646bc695..d632ac76532e 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -101,6 +101,8 @@ properties:
 
   cpu-idle-states:
     $ref: '/schemas/types.yaml#/definitions/phandle-array'
+    items:
+      maxItems: 1
     description: |
       List of phandles to idle state nodes supported
       by this hart (see ./idle-states.yaml).
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
