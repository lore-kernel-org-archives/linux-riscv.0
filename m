Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF52AC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 17:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1Z3vUYGD8oWu4HVb12+WmnbFb/fEOpM8wOat4gC0gg=; b=TdZ9fZX53gA9uG
	qXpzwgzwMOcoSWnO9Nh3otDtzOz3cLReMzS1KPUEsms2Mwa/aLsMY9bGuC/I8SKE8pGnPjAh+enxl
	7TKiiM4HhxtS2hk21kj4l29oKdOTalwIGMusUgslPYqhD2gc6q9FTj+HoYh2UEXgrC8w6EMX684Wj
	yApbZFS7x/HCLzkF7sWgRz38r4wi2ong57g0mNUMhsh1niFF79qaQP9fyybsrRdXUqxRvuSqUBmS4
	o4ECVx2HwkhwYTDUvUpGK5xCe78OhxAI7bKCd0WJ8XoljMxkEN7I42Yo20sTiIix0beqcc2nueY/Q
	nmkGU+g4IfLMSVBrkWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyFwd-00ARD6-Vx; Thu, 24 Nov 2022 17:23:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyFvz-00AQke-So
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 17:22:51 +0000
Received: by mail-wm1-x32d.google.com with SMTP id t1so1743209wmi.4
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 09:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pVq/7Up2ay5U3igFGOv4evJBykOn5gce8qJ7iJVARg=;
        b=VkDha0/y1YroAoUc12D0j4O8KV1nd0kU2H6cs0j6bnou9/NzJ5M8TOk/BeWgCMudeH
         Jn2ChNGVTcQUXWao9Mlm6D+Yvuo7XSUuttSixS58iqpf1SJ0gARfYzmAkEWRGLUrW57k
         V72ywOMPN0+0t6X9epAS8KXtOiwKdGV1FA9RCfg2Grmawoa7bV3aitwDQP2hFYMp84hk
         VUtvKnten+3jTgK3kMWhI6e3kxa14k+BK4Nq4ioMdSmhamLEgeASv+o00GexKVfLIWIr
         LL4B11Yl4PvJnZyCUE6Hw+RlJr9aBa3xEeBkOoTyB7GVXEjubBiVUYeed7+wh7QIGJrY
         JjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pVq/7Up2ay5U3igFGOv4evJBykOn5gce8qJ7iJVARg=;
        b=yVLZ79Kk3l00qjsCYgIxcyCXBWrjar8My57yMVqxNenPjuu5YNQGDBs+E/lx1jM7Te
         3SCT7Y3qXnkxsDENgXy37yZETjMr+vtLT7g9dEncN8xsUhd2kp8YF3J5RV73xtwWnXRn
         6z/ETDFRzoxJJTKPEV5KJ7oItvD1w3tG0rwN0GDZaSASFn7nJJvx9T/UD6kc+UN9pzwA
         kIbH9KzvlSTYnklMHgCCJYHbXbZbO0EJhi1nyCB1+9Vr/s98AT9kQgLH8T7KU+Qm+X/T
         d6cG0GFFjIOqQACGTDGwE8LrmZEp5XeI1QxqA8lxfayjqGuX4EoYlt94iE1wz916MBX2
         3k0g==
X-Gm-Message-State: ANoB5pmB02ltUoWfvw0seE0C+AgZ8p4JHRLEz9lN4LQPdpS2zm8hdLRd
	RYmU6mFZbaDKhL+keFTS/hc=
X-Google-Smtp-Source: AA0mqf44h28x8D3Kz4FZq8tJ6Tjsx+IjiDmKprEJ7QCdnZzDVqibUn3iDgIcixYS2XyhHS0NCgTh3A==
X-Received: by 2002:a7b:cc85:0:b0:3bf:d1e2:1d9 with SMTP id p5-20020a7bcc85000000b003bfd1e201d9mr17967480wma.115.1669310566585;
        Thu, 24 Nov 2022 09:22:46 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:89ee:3f5d:1c99:35d8])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003c64c186206sm2698086wmn.16.2022.11.24.09.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 09:22:45 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 6/7] dt-bindings: cache: r9a07g043f-l2-cache: Add DT binding documentation for L2 cache controller
Date: Thu, 24 Nov 2022 17:22:06 +0000
Message-Id: <20221124172207.153718-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_092248_006131_E0F356F0 
X-CRM114-Status: GOOD (  16.15  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add DT binding documentation for L2 cache controller found on RZ/Five SoC.

The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
Single) from Andes. The AX45MP core has an L2 cache controller, this patch
describes the L2 cache block.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
RFC v3 -> v4
* Dropped l2 cache configuration parameters
* s/larger/large
* Added minItems/maxItems for andestech,pma-regions
---
 .../cache/andestech,ax45mp-cache.yaml         | 93 +++++++++++++++++++
 .../cache/andestech,ax45mp-cache.h            | 38 ++++++++
 2 files changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
 create mode 100644 include/dt-bindings/cache/andestech,ax45mp-cache.h

diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
new file mode 100644
index 000000000000..bf255b177d0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2022 Renesas Electronics Corp.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Andestech AX45MP L2 Cache Controller
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+
+description:
+  A level-2 cache (L2C) is used to improve the system performance by providing
+  a large amount of cache line entries and reasonable access delays. The L2C
+  is shared between cores, and a non-inclusive non-exclusive policy is used.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - andestech,ax45mp-cache
+
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: andestech,ax45mp-cache
+      - const: cache
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  cache-line-size:
+    const: 64
+
+  cache-level:
+    const: 2
+
+  cache-sets:
+    const: 1024
+
+  cache-size:
+    enum: [131072, 262144, 524288, 1048576, 2097152]
+
+  cache-unified: true
+
+  next-level-cache: true
+
+  andestech,pma-regions:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 1
+    maxItems: 16
+    items:
+      minItems: 3
+      maxItems: 3
+    description: Optional array of memory regions to be set in the PMA.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - cache-line-size
+  - cache-level
+  - cache-sets
+  - cache-size
+  - cache-unified
+  - interrupts
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/cache/andestech,ax45mp-cache.h>
+
+    cache-controller@2010000 {
+        reg = <0x13400000 0x100000>;
+        compatible = "andestech,ax45mp-cache", "cache";
+        interrupts = <508 IRQ_TYPE_LEVEL_HIGH>;
+        cache-line-size = <64>;
+        cache-level = <2>;
+        cache-sets = <1024>;
+        cache-size = <262144>;
+        cache-unified;
+        andestech,pma-regions = <0x58000000 0x08000000
+                                 (AX45MP_PMACFG_ETYP_NAPOT | AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF)>;
+    };
diff --git a/include/dt-bindings/cache/andestech,ax45mp-cache.h b/include/dt-bindings/cache/andestech,ax45mp-cache.h
new file mode 100644
index 000000000000..aa1cad24075d
--- /dev/null
+++ b/include/dt-bindings/cache/andestech,ax45mp-cache.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for Andes AX45MP PMA configuration
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#ifndef __DT_BINDINGS_ANDESTECH_AX45MP_CACHE_H
+#define __DT_BINDINGS_ANDESTECH_AX45MP_CACHE_H
+
+/* OFF: PMA entry is disabled */
+#define AX45MP_PMACFG_ETYP_DISABLED			0
+/* Naturally aligned power of 2 region */
+#define AX45MP_PMACFG_ETYP_NAPOT			3
+
+/* Device, Non-bufferable */
+#define AX45MP_PMACFG_MTYP_DEV_NON_BUF			(0 << 2)
+/* Device, bufferable */
+#define AX45MP_PMACFG_MTYP_DEV_BUF			(1 << 2)
+/* Memory, Non-cacheable, Non-bufferable */
+#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_NON_BUF	(2 << 2)
+/* Memory, Non-cacheable, Bufferable */
+#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF		(3 << 2)
+/* Memory, Write-back, No-allocate */
+#define AX45MP_PMACFG_MTYP_MEM_WB_NA			(8 << 2)
+/* Memory, Write-back, Read-allocate */
+#define AX45MP_PMACFG_MTYP_MEM_WB_RA			(9 << 2)
+/* Memory, Write-back, Write-allocate */
+#define AX45MP_PMACFG_MTYP_MEM_WB_WA			(10 << 2)
+/* Memory, Write-back, Read and Write-allocate */
+#define AX45MP_PMACFG_MTYP_MEM_WB_R_WA			(11 << 2)
+
+/* AMO instructions are supported */
+#define AX45MP_PMACFG_NAMO_AMO_SUPPORT			(0 << 6)
+/* AMO instructions are not supported */
+#define AX45MP_PMACFG_NAMO_AMO_NO_SUPPORT		(1 << 6)
+
+#endif /* __DT_BINDINGS_ANDESTECH_AX45MP_CACHE_H */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
