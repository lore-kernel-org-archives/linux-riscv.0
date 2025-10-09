Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A56CAC5BB
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jla6OVta6KzuISOINqoZVsDdak+gm3Tn5GmaCL4NGTU=; b=oshx6GUXATsDuJ
	BCsK2a6NrOoY3kCHOlqm/OPE9+ysm65Ce1nAurtOfG7WkoyhKSGE/ZdboZcXng/OirwJcAsPQ0ZR0
	/IS9+Pw6BKUJgxBZO3026hURbS0PXRgAqhEkkEmDuL8L8JNMOlC8ATUhzaBCDZfCrbcDp2SM2pWS5
	c1Tac/TA0Eyg4ea5525RfyEjXki542wFKW6zwp4q1ot4kq+3x2P5lYIeMP1FQV0O+eeDan3PsJ1+W
	hl780w+Pdk5r9gi3nZ2xsCI6fqh4lShb8hiZrZsoPfwRG/csvDKhE/c2xiXx8spX7bPDg/aTfzkbO
	94XpQ6JGOT+PhcVD+d8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvq-00000004zNI-2xTC;
	Thu, 09 Oct 2025 01:59:02 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvo-00000004zKW-1UY8
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:59:01 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-27ee41e074dso5056525ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 18:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759975139; x=1760579939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRBm+Pg8TyGJGYp2jCQm+1zXWV7khrVi/kELEVhXf6I=;
        b=YqoHC68/I6uZBZPycMJvmuPOxdRP7rgygKvXQB6CE8u/gGak4q/2v5q+6JrMRLiboq
         d4I/yBhi4sTY/Q08oKAO4IcsZS5pgC8jS5wBtTxpzvDXJKol0COX2rh8e6lX/scTXT1s
         armxkNjxy/a8nStbWueRDXXktn5ZNV5NEKU0a/o7VLrM+FftxRn1GX2ajtUC4d2V3dM1
         9z7QmpqE8OjzcEfcxCS7ct9ceAX3uuhbk3Uq9foPfZZUd2Ep8SIvFKD+vcfSw3i+Z53s
         dVpG5kGo2hZRggXwvNPVbFTBUJJkKiyJFYkCVxrDojJ7L+vfSouDp7nxn+hbO8LmDcfc
         Omsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975139; x=1760579939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRBm+Pg8TyGJGYp2jCQm+1zXWV7khrVi/kELEVhXf6I=;
        b=Y8qxcN6BSoaSzpiUkgGIxSiT7GSokAO3ScL66dhJXiZ99JR+L+6dJHoKthvMbSKpNu
         vpQjGKAeF53AwzEyWZo1c78CmwoWKQHWzdzy36e2V0pAxt6T0QnHAGmIEqVyYcnnEaeE
         l2/VE5UozapRRpPpCEI5YbNgyrYsp0oeby3zFqRad1FtEAiGGRBo4KMD+l4U70378jhS
         n5uJBJtCWjoat4OzFg6A5GZy4MNxxuL8F1q1rWG4OLlHkLaNb1wwJ3AST63PrptjvFJx
         /WttBmTSNdTxKX/1Ob5paQCkfd3HaBqEAQn9w2a8DtuO7V/LXHn5hqGKgwV++g+0Ztet
         Vw/g==
X-Forwarded-Encrypted: i=1; AJvYcCXlW1fIbMlqDsRbi0O2uYwSGLFODGN5aiPn5YI+BpxWVc5ToftSwJixuwj+e6Ql/3FNbGHq0aSb5gENVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj8UFN7V0NmWYfsMcfLGD4qr4V51/Priq8O4vcugZLcw/+Uh+r
	4hoKCcoXAMjjsoELq2FuqEOa8AxySIp56XMZhOaHa5TC7OMksVZbbeReH5JZmk/vOrU=
X-Gm-Gg: ASbGncsMcpTsYurQCCvn3jcc32zNM8kujnbYmd8kc9SmE9XoR5zj5wms5irpgik6MDp
	7jrVbbsHsEizc/wP6McJ4ktWachWa3Yc3PoOIBFezU6j/z+KKO5mfe8bsl7kvnGUAbGtEj0dRnC
	a5ThxhFSqMLmtTBbIM4nZgxdRFaanJcIOZwo5UiK+xZW+VklWC7UCsmCBkooH4RHYovhSdEohbW
	0e3OFfJZSpKfy1BDGm2bTqUXzTri95Kay11Qt5nkAyG6b60hy4tL7jhHkVrp/GOaS9d9L+/ym+j
	SauZLGV1iasLDnrZwnQCa1zBnyzdbhM6X3G64a9A0M6xvoEanBNXPRRgKCt4a4VvjB7Mczm6cqM
	bwM5JBJ59JO6YGhrnj7aHiv2fYtsNtHrwuq7fa7QYYZgYESC8c22PD9HrBxmwR6RwIEliUh08er
	8s4vM=
X-Google-Smtp-Source: AGHT+IHnM19QNt+KVU6ihXNJt4W+kfmuE2lNld1taoppLPPH4Aa0tlEl4j47mz2vz9hZfmhsxUhEJQ==
X-Received: by 2002:a17:903:144f:b0:28e:9427:68f6 with SMTP id d9443c01a7336-29027262579mr68191475ad.27.1759975139512;
        Wed, 08 Oct 2025 18:58:59 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de53f9sm11033585ad.14.2025.10.08.18.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:58:59 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 15/18] dt-bindings: riscv: Describe physical memory regions
Date: Wed,  8 Oct 2025 18:57:51 -0700
Message-ID: <20251009015839.3460231-16-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009015839.3460231-1-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_185900_405142_BC8DACDC 
X-CRM114-Status: GOOD (  22.32  )
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

Information about physical memory regions is needed by both the kernel
and M-mode firmware. For example, the kernel needs to know about
noncacheable aliases of cacheable memory in order to allocate coherent
memory pages for DMA. M-mode firmware needs to know about those aliases
so it can protect itself from lower-privileged software.

The RISC-V Privileged Architecture delegates the description of Physical
Memory Attributes (PMAs) to the platform. On DT-based platforms, it
makes sense to put this information in the devicetree.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Remove references to Physical Address Width (no longer part of Smmpt)
 - Remove special first entry from the list of physical memory regions
 - Fix compatible string in example

 .../bindings/riscv/physical-memory.yaml       | 91 +++++++++++++++++++
 include/dt-bindings/riscv/physical-memory.h   | 44 +++++++++
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/physical-memory.yaml
 create mode 100644 include/dt-bindings/riscv/physical-memory.h

diff --git a/Documentation/devicetree/bindings/riscv/physical-memory.yaml b/Documentation/devicetree/bindings/riscv/physical-memory.yaml
new file mode 100644
index 0000000000000..825b712a9fbae
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/physical-memory.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/physical-memory.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Physical Memory Regions
+
+maintainers:
+  - Samuel Holland <samuel.holland@sifive.com>
+
+description:
+  The RISC-V Privileged Architecture defines a number of Physical Memory
+  Attributes (PMAs) which apply to a given region of memory. These include the
+  types of accesses (read, write, execute, LR/SC, and/or AMO) allowed within
+  a region, the supported access widths and alignments, the cacheability and
+  coherence of the region, and whether or not accesses to the region may have
+  side effects.
+
+  Some RISC-V platforms provide multiple physical address mappings for main
+  memory or certain peripherals. Each alias of a region generally has different
+  PMAs (e.g. cacheable vs non-cacheable), which allows software to dynamically
+  select the PMAs for an access by referencing the corresponding alias.
+
+  On DT-based RISC-V platforms, this information is provided by the
+  riscv,physical-memory-regions property of the root node.
+
+properties:
+  $nodename:
+    const: '/'
+
+  riscv,physical-memory-regions:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description:
+      Each table entry provides PMAs for a specific physical memory region,
+      which must not overlap with any other table entry.
+    minItems: 1
+    maxItems: 256
+    items:
+      minItems: 4
+      maxItems: 6
+      additionalItems: true
+      items:
+        - description: CPU physical address (#address-cells)
+        - description: >
+            Size (#size-cells). For entry 0, if the size is zero, the size is
+            assumed to be 2^(32 * #size-cells).
+        - description: >
+            Flags describing the most restrictive PMAs for any address within
+            the region.
+
+            The least significant byte indicates the types of accesses allowed
+            for this region. Note that a memory region may support a type of
+            access (e.g. AMOs) even if the CPU does not.
+
+            The next byte describes the cacheability, coherence, idempotency,
+            and ordering PMAs for this region. It also includes a flag to
+            indicate that accesses to a region are unsafe and must be
+            prohibited by software (for example using PMPs or Smmpt).
+
+            The third byte is reserved for future PMAs.
+
+            The most significant byte is the index of the lowest-numbered entry
+            which this entry is an alias of, if any. Aliases need not be the
+            same size, for example if a smaller memory region repeats within a
+            larger alias.
+        - description: Reserved for describing future PMAs
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/riscv/physical-memory.h>
+
+    / {
+      compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      riscv,physical-memory-regions =
+          <0x00 0x18000000 0x00 0x00020000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY) 0x0>,
+          <0x00 0x18080000 0x00 0x00020000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY) 0x0>,
+          <0x00 0x41000000 0x00 0x1f000000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY) 0x0>,
+          <0x00 0x61000000 0x00 0x1f000000 (PMA_RWXA | PMA_NONCOHERENT_MEMORY | PMR_ALIAS(3)) 0x0>,
+          <0x00 0x80000000 0x08 0x00000000 (PMA_RWXA | PMA_NONCOHERENT_MEMORY) 0x0>,
+          <0x10 0x00000000 0x08 0x00000000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY | PMR_ALIAS(5)) 0x0>,
+          <0x20 0x00000000 0x10 0x00000000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY) 0x0>,
+          <0x30 0x00000000 0x10 0x00000000 (PMA_RWXA | PMA_NONCOHERENT_MEMORY | PMR_ALIAS(7)) 0x0>;
+    };
+
+...
diff --git a/include/dt-bindings/riscv/physical-memory.h b/include/dt-bindings/riscv/physical-memory.h
new file mode 100644
index 0000000000000..7cb2e58fa8c1c
--- /dev/null
+++ b/include/dt-bindings/riscv/physical-memory.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_RISCV_PHYSICAL_MEMORY_H
+#define _DT_BINDINGS_RISCV_PHYSICAL_MEMORY_H
+
+#define PMA_READ			(1 << 0)
+#define PMA_WRITE			(1 << 1)
+#define PMA_EXECUTE			(1 << 2)
+#define PMA_AMO_MASK			(3 << 4)
+#define PMA_AMO_NONE			(0 << 4)
+#define PMA_AMO_SWAP			(1 << 4)
+#define PMA_AMO_LOGICAL			(2 << 4)
+#define PMA_AMO_ARITHMETIC		(3 << 4)
+#define PMA_RSRV_MASK			(3 << 6)
+#define PMA_RSRV_NONE			(0 << 6)
+#define PMA_RSRV_NON_EVENTUAL		(1 << 6)
+#define PMA_RSRV_EVENTUAL		(2 << 6)
+
+#define PMA_RW				(PMA_READ | PMA_WRITE)
+#define PMA_RWA				(PMA_RW | PMA_AMO_ARITHMETIC | PMA_RSRV_EVENTUAL)
+#define PMA_RWX				(PMA_RW | PMA_EXECUTE)
+#define PMA_RWXA			(PMA_RWA | PMA_EXECUTE)
+
+#define PMA_ORDER_MASK			(3 << 8)
+#define PMA_ORDER_IO_RELAXED		(0 << 8)
+#define PMA_ORDER_IO_STRONG		(1 << 8)
+#define PMA_ORDER_MEMORY		(2 << 8)
+#define PMA_READ_IDEMPOTENT		(1 << 10)
+#define PMA_WRITE_IDEMPOTENT		(1 << 11)
+#define PMA_CACHEABLE			(1 << 12)
+#define PMA_COHERENT			(1 << 13)
+
+#define PMA_UNSAFE			(1 << 15)
+
+#define PMA_IO				(PMA_ORDER_IO_RELAXED)
+#define PMA_NONCACHEABLE_MEMORY		(PMA_ORDER_MEMORY | PMA_READ_IDEMPOTENT | \
+						PMA_WRITE_IDEMPOTENT)
+#define PMA_NONCOHERENT_MEMORY		(PMA_NONCACHEABLE_MEMORY | PMA_CACHEABLE)
+#define PMA_NORMAL_MEMORY		(PMA_NONCOHERENT_MEMORY | PMA_COHERENT)
+
+#define PMR_ALIAS_MASK			(0xff << 24)
+#define PMR_ALIAS(n)			((n) << 24)
+
+#endif /* _DT_BINDINGS_RISCV_PHYSICAL_MEMORY_H */
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
