Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33386E6F098
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 00:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVoFqj1aRkv/k273pjio0nd3KkyV6RQujKvygsjC9lU=; b=HgnCmqKB7A3evF
	HI+0qXaZKy8SXuUpwDg9rWiQ92Squ44BO3WnvR4d0uKqNnRsowNkxV3G0tprBLUdOgvN5BQ3qkqHC
	HkgEQDW1KteG7DQjStfYFw1eR1kgFgv83SQdb2aQEP52t1vNfDb+lO/rk9rqOqXF7uWGOxnH1uyXv
	r1PafZ89p7F4RuypjDhtJ/n+X0IP2RWnekYGoje3C9ZYeSTncxK2mTKRID8sbjOFigIPi8EfBbnfA
	c7zR11N0FPHDenUtU6OY/jJ1HpVcAYK/UtPRcsvlMW+qJtsjZVW3r4iJ5jzyHA2ipOCY6YhnqNsNE
	WK4jaOBm4BcjhVMhnQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t71hD-00000008ZyA-1wbS;
	Sat, 02 Nov 2024 00:08:51 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t71hA-00000008ZwK-3qhw
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 00:08:50 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2e34a089cd3so1972123a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 17:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730506127; x=1731110927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOEMNZ+33viJM90wJhw0Ad72Zh5qPAKNdSNu0KRw6Xo=;
        b=Z2dY0tFf6e26h/uPMfQrCLXscPjfgRzFeO38sxrOzRhNXhBM3uQjye+CK6FG1peRFY
         mLIvlJdudU7Rc8KP6d5B+s4NhEkQHdravTQeOACazRdpiLqd3/30xwogBiGjLuTZ0r+1
         9O5yQnaBgS9UwzJ/b243V9FgyIme00k/rGpxKmk4TtkpLwZMbUU361jrD3rLJ414ReBr
         AWqoEuAovOYzrQ1opSeGok7epT6DxS2B+NApC+43/xe8PYJRBf9caSS1TeRa2ig8Rg7H
         aqpiPt06muwucgxrf1Px9Uv05H22HxsWBcyHXmT6Lj7npWrWnSfWODEWWP3IpleR8RPD
         6hOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730506127; x=1731110927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOEMNZ+33viJM90wJhw0Ad72Zh5qPAKNdSNu0KRw6Xo=;
        b=sxlamh9G/MTyXWz+y1VfwWtoZ0BvcP3U1cwFhyCTtvRLaFdFn14QEEPDONLt7E6nWH
         UBteGtF1Xo/FVw1roY2n0zvndv4EtgRS2zEKOOVJK35l8RNtLHKM3mFrFiko9PawzkbD
         YumJIPvZfWrQlMpvw1pL8RRPtrHxmo01LJZxeeT14HWquucMoRx2h6UzlaQgDTFAWrNd
         iRrYgxvU+uBHD/RQm/Jyohl+JKZtpXhSo4OOjFlUvPzdJvdJzCieiRWoFtalkuDtAc1C
         mZFXsZ7toELw80yAucpLyn4SN1wCNuufjKgnmGgsHaV/V2DwIXmPH4PGV0I9RY51Yadm
         6QwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4YrDFhYW00ii4rpufMoA6WB4NOtJrR8xBndp+4phpLYgldN2pJkRyDsXAKGXbuuGGJp6C1CIlaDlAfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoiRB4+hdY4nHHHBfejyh8AsqthKD0s0DDrV98yMbXnhpIRAWo
	dcYeWeDjrOdQN/2PP5JdLxXp/XCjvMD9spzTekjpT4B56ZQA0hz3/vbnX4MjTEA=
X-Google-Smtp-Source: AGHT+IE6EkC5NIMo5m4ZPw7HiXuYchFGSfyQgkFEdoKuXEzVgx9eOAQYjDGPGRWM5i/c7czbrOnwSQ==
X-Received: by 2002:a17:90a:f406:b0:2e0:d693:7884 with SMTP id 98e67ed59e1d1-2e8f0f55a2bmr27105930a91.5.1730506127517;
        Fri, 01 Nov 2024 17:08:47 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fc00856sm5505749a91.54.2024.11.01.17.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:08:47 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 01/11] dt-bindings: riscv: Describe physical memory regions
Date: Fri,  1 Nov 2024 17:07:55 -0700
Message-ID: <20241102000843.1301099-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241102000843.1301099-1-samuel.holland@sifive.com>
References: <20241102000843.1301099-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_170848_992099_2B1EBEEF 
X-CRM114-Status: GOOD (  23.12  )
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
memory pages for DMA. M-mode firmware needs to know about aliases so it
can protect itself from lower-privileged software. Firmware also needs
to know the platform's Physical Address Width in order to efficiently
implement Smmpt.

The RISC-V Privileged Architecture delegates the description of Physical
Memory Attributes to the platform. On DT-based platforms, it makes sense
to put this information in the devicetree.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 .../bindings/riscv/physical-memory.yaml       | 101 ++++++++++++++++++
 include/dt-bindings/riscv/physical-memory.h   |  44 ++++++++
 2 files changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/physical-memory.yaml
 create mode 100644 include/dt-bindings/riscv/physical-memory.h

diff --git a/Documentation/devicetree/bindings/riscv/physical-memory.yaml b/Documentation/devicetree/bindings/riscv/physical-memory.yaml
new file mode 100644
index 000000000000..deb49b34672f
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/physical-memory.yaml
@@ -0,0 +1,101 @@
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
+  The RISC-V Supervisor Domains specification defines a platform-specific
+  Physical Address Width (PAW), which describes the largest physical address
+  supported by a platform. Any access to an address >= 2^PAW is guaranteed to
+  raise an access fault, and therefore metadata (e.g. Memory Protection Tables)
+  need not be maintained for those addresses.
+
+  On DT-based RISC-V platforms, all of this information is provided by the
+  riscv,physical-memory-regions property of the root node.
+
+properties:
+  $nodename:
+    const: '/'
+
+  riscv,physical-memory-regions:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description:
+      A table of physical memory regions. The first entry in the table must
+      cover the entire range of physical addresses supported by the platform
+      (i.e. 0 to 2^PAW-1) and provides the default PMAs for all addresses not
+      covered by another table entry. Remaining table entries provide PMAs for
+      more specific physical memory regions, which must be contained within the
+      range of entry 0, but which must not overlap with each other.
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
+      compatible = "starfive,jh7100";
+      #address-cells = <2>;
+      #size-cells = <2>;
+      riscv,physical-memory-regions =
+          <0x00 0x00000000 0x40 0x00000000 (PMA_RW | PMA_IO) 0x0>,
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
index 000000000000..7cb2e58fa8c1
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
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
