Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D96CD4F3A
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T8YQoMOKz+H/+WaSKoG0b4QGovQtkmYQFwi8loIMe4I=; b=4tYAiydeNxbcYZ
	4Zir04qtGgTCu8moBCYUN/x+cFQBTzygJd/2mxVqBf82Y9pmz0pe4C8Qh8v3UPIJTJQKmXhJEVQ9x
	p0F3PbI4vysAnyVPr/IeXyP7BK83Ie8JPNSsM75ab1n5howcnyQKESvPfV9JW72GnlZsVE98knfza
	qYqfYaLo59iIqhH8V4Fy58iahOACNZhxhRuo0KGsBxCCo3RtMh97onnnizXqj9v8WqTsOa/S1c3D6
	xnpOkYr0nw551uv2X9X3VbEosVV+foIvhslNojcVhbYuLbJ59iEhw+hpjn/KWl7buHD5i7BOXEOaP
	TUvgFTuzkywZPwzlz6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQy-00000009k73-192W;
	Thu, 13 Nov 2025 01:47:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQw-00000009k2a-0B2k
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Nov 2025 01:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jKST6UqYk+QaqGuOiC3PtA1F5GA6hglNlMJ+dkxeIto=; b=YICvA1xTe2CYle8ZjYBaHnqd3y
	tM3KkspxYLvGh9kToSfwomq1+2TXTouQFa4YYH7BVolFRbDzBQcj8Zl9iwHD8Bmc5+y2hHHNmjl7d
	rlGNUdemGR5m11IEU6Ua+GnffrvzXSMlApbL9VHi3IkSs8JsFatOUt8zAS1mzI/V1css/+9hGBYmf
	6F4jwf+z1SO1WCVrTGwUZVQKWkXAiwoMs4p+4mxFQ/meT+PIZ1IyGmEraU2kswLmUYF1cwg0NpD1g
	jHxkij7LY1FL3vIQquVxan0TlM9N06qccQNMcZ7IFUPBeaz/nkS9UXNMB9u4iuzngPAdlrYxvfU+O
	acQdNmPg==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJLZC-0000000Gmv5-3zy1
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 00:52:05 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-793021f348fso212238b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998448; x=1763603248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKST6UqYk+QaqGuOiC3PtA1F5GA6hglNlMJ+dkxeIto=;
        b=XF6TCpr9VvEijn0xcEvEEYHo12UJnT5dj5tTqmBsQmB4g3KSCxg/t+HgOvNXGFePoZ
         crst/OkC962focuh+stPR0SiTv+CWabZN3/uy71bpzqhn0bNd9eoi9cvRWfIWlLpMJfz
         9XKGep+k0FsR1eYEsa8n1T9gJeFkVvJqp2LZ4bVjRie0/UBi6xSOvSWPKSi7/xud29eE
         ApZ+3JKq/nKcNx7ojfCOFQEZM5N9hafRv0SUUpRxiW0/C74vDoa99cVwP9ze/726/7hZ
         F16BXhVkLZW2G97LqmYcWTqF2jLF7Mt9u+Z6C9yUnME05kuD81fcVFXKWnoRAyYKmyxR
         MoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998448; x=1763603248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jKST6UqYk+QaqGuOiC3PtA1F5GA6hglNlMJ+dkxeIto=;
        b=M1dZ3+xvC41u5/gfz4MBYWYJPHqIVV47DknID/ZOBUtQzPK59xy+S6eVD8cTvgxc/g
         r7oxxbkb+46yMAESP4cZ5vLFbVo8FklfS485WtYJqKJl+YJUyppY6KDnm1ONR0s27mpq
         L2Wt5Zne8SB/rTbD/w2OGia8Wv2tIxGEGyPXAMqCTe3FWY9nRaVUluoO7xTqgSZGhXR+
         w7OF+QScdTJ2wxxJ4OFx8tyjDRZFQJRIZvQ04rsnsc5U1Fb7sJVvdT4E3yOg/46VM7dB
         55LNIQwDAwWAPOPf6TGeotjbfh/v7GSRmPHMqEtXFV3hI0jAm3mmioc2xMl8wkcM/arH
         6sqA==
X-Forwarded-Encrypted: i=1; AJvYcCWb5kANbuL0I/HboupxHxEeDgADL/XuAI+DRvaZKAy435QcW9z5t3X+n65g1PQFBlAZ4i3hDDb98RrCMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMDWbtyrEjo7MgLBegcTG8E+0XNDnN5zVC8IGOPdJ0VgkeliyM
	nQ38gEhwIIZoAzAjguZ7yZK+G01ZyNWVz4SCrDEXHE+3B+8d/2aR+kufAR/VPT55EC0=
X-Gm-Gg: ASbGnctgTak4mL1UG+xMiY4xcFpyRk4H3FR2vttKjzVzKGDhp2fUYf6GC/x6un9E/Pu
	M1Xx2TqbXoGBpQD8izSkA/eG5iiH6XZX6D+fs6iMVRtPfiOs7plJT6arfV3WuZZVIAzEvOMEqTc
	HpQLvV7iwuyxosnN3W9Tyk6vzyjMxK/3bfvFSgjBDnRasPaiDopP9UDvgLYRVRHDW+nPw/FsP5O
	pkUBSYY/xXBh4SipdIghTUil/yzLQCPLr8hI2m6YCnb05NZGzFakaaEzsGEe+lfOqFDGmH7F5Qx
	X2si8vbGFxxdYELNp/ILBiaoYzGPTrWxgG7SwTXEkAwmEw9rYQzTEx/CLly8SPvdxPVnsxW3299
	fi+6Fm0XbaQIqPo+IiDzZI6GtxTSZ5YFwgfxDUYSLlayyoczqPoeGlPUaM3JtlRcnSKuDrH6FC8
	j280+EBFbHcVTukj7NM1fheA==
X-Google-Smtp-Source: AGHT+IHEN2CLBCBQn7bcySaSxAzHnvyn3lSrJ3SkfwuCWTMT+513mFJW8h5K2OPvmFqqAe8aAa+xIw==
X-Received: by 2002:a17:902:cf05:b0:295:59ef:df96 with SMTP id d9443c01a7336-2984ed923femr62192415ad.13.1762998447807;
        Wed, 12 Nov 2025 17:47:27 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:27 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Cc: devicetree@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Conor Dooley <conor@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 19/22] dt-bindings: riscv: Describe physical memory regions
Date: Wed, 12 Nov 2025 17:45:32 -0800
Message-ID: <20251113014656.2605447-20-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_005203_703059_30F83AD1 
X-CRM114-Status: GOOD (  22.87  )
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

Changes in v3:
 - Split PMR_IS_ALIAS flag from PMR_ALIAS_MASK number
 - Add "model" property to DT binding example to fix validation

Changes in v2:
 - Remove references to Physical Address Width (no longer part of Smmpt)
 - Remove special first entry from the list of physical memory regions
 - Fix compatible string in DT binding example

 .../bindings/riscv/physical-memory.yaml       | 92 +++++++++++++++++++
 include/dt-bindings/riscv/physical-memory.h   | 45 +++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/physical-memory.yaml
 create mode 100644 include/dt-bindings/riscv/physical-memory.h

diff --git a/Documentation/devicetree/bindings/riscv/physical-memory.yaml b/Documentation/devicetree/bindings/riscv/physical-memory.yaml
new file mode 100644
index 000000000000..8beaa588c71c
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/physical-memory.yaml
@@ -0,0 +1,92 @@
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
+      model = "BeagleV Starlight Beta";
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
index 000000000000..d6ed8015c535
--- /dev/null
+++ b/include/dt-bindings/riscv/physical-memory.h
@@ -0,0 +1,45 @@
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
+#define PMR_ALIAS_MASK			(0x7f << 24)
+#define PMR_IS_ALIAS			(0x80 << 24)
+#define PMR_ALIAS(n)			(PMR_IS_ALIAS | ((n) << 24))
+
+#endif /* _DT_BINDINGS_RISCV_PHYSICAL_MEMORY_H */
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
