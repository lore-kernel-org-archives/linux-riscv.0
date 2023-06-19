Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F351BEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lXq7gyn2kKRrGcF6mWVXNtafOOQB450Kir9uZvpNhnY=; b=hV6PVx0I5B0l9B
	Glw0UMsb+bnhV/EpZLvge5iml/yK26WtjFQ44NHNZJMzKpTwrXO5P3D8Moy8bWS0rZe3cTUaHLLid
	l9jOFqmlcY50GHgPT7/a118C8uc3o5T5Cf4G6tcLUghHGav9KQkoPuixFHK0/KvEeiIWoHWWHfh2S
	b96Wysy5Ff7vIv3KwLYLHUXhAjSa8SD1D3g7rua1Xgme6jWdByoSxe/+KbSwoGvRsCdz+eQf5Sd1h
	tX2vRfe9vsCT0QmWQ5MiWLsqmkcsnzhUwrLA2dnh+hGMejNwfKrcEOpPuFss0A62Rb3Sgw7WOR85S
	jjBnqMSywlyDvBgUr28Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBTk-0084IU-00;
	Mon, 19 Jun 2023 09:47:20 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBTg-0084H5-33
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 09:47:19 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31129591288so1582942f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687168034; x=1689760034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pm5bDO7dAW0U1/ZbP5zCHPn8yVTZ8TIF+oUNu//7tHw=;
        b=eoKvIZdQXEl0s4AQsuIPqutj8dZ3pqg+m54vtxstzp6Q0Cl1fFmcVYBGLRaGahbRvw
         4WTUnVOpcgg1uKzRkVqNkc0cTFSTeg99LuqB6iFfQdZ4lcwONnwloO9/Uh7KKy6yxRo0
         ID3jZMT9Jm13te2HaRdlSP3bZ4ka+kz9eBSG7NfZ6aN/qXeRSrxhqCOuT/i9I1x6CLsf
         ejknWxyg7oYUDdBmP2yQjBXnRKg+SxrNYPjgIpIXs1XK1kguhu0Xh36iOiKEHEFAjeBN
         T/00S5O8FK7uHrHczAvt9ujM+Gt1C6GFyFqzc/l46kBEjEkUfeBCqhBnhHzTaGQkvDVr
         AYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687168034; x=1689760034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pm5bDO7dAW0U1/ZbP5zCHPn8yVTZ8TIF+oUNu//7tHw=;
        b=C1nHpBdpWi6FeQ7PYp+HLtnHyduuBW/XGGVnxt34uIAKgprpTpfxSCrsAxg2d6Gsfw
         cCrj610NvT0b8THQnD1KBe3XYoeZ57gmYi4IzsNrm+EQL2sJRSckGCnuk+ZRhNOfCo62
         pc75bXaRw2pNuLrUhFex1V4FPCviHEQFNhk344z18Ig16eq6cJpGDZoEkSQPdB0/cvHD
         9XjVJ6Etu4YqE9OdyYTx2uSV1DrcuqqEPnv+UVX4K0p6mWNhxH81Mm0eP0f6S80MGKcC
         D+3WZGcmMs0RydzJ6kVvjQUR+X76I5rO+6KfyVsQPgGfDl2rXnGithHuW+Ffdn338mTk
         QyFg==
X-Gm-Message-State: AC+VfDybtTfrSAzWeOYAnoJPOnUyja2eVIiDzhw+aiX+rz5tStFRe9z9
	ZBBP9y7iFmu5sQS2dTFLu5ySkg==
X-Google-Smtp-Source: ACHHUZ4srevsoh92EwaOJ4I0058DKxrJQ5ezWwKSVZZI0bdfQ65hdj+8R6fMYDUvniAfJk44wWtanA==
X-Received: by 2002:adf:f952:0:b0:311:162a:ce2a with SMTP id q18-20020adff952000000b00311162ace2amr5395662wrr.29.1687168034471;
        Mon, 19 Jun 2023 02:47:14 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id c1-20020a5d5281000000b0030aded83385sm30971199wrv.27.2023.06.19.02.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:47:14 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 1/2] Documentation: riscv: Add early boot document
Date: Mon, 19 Jun 2023 11:47:04 +0200
Message-Id: <20230619094705.51337-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_024717_200078_C979D91B 
X-CRM114-Status: GOOD (  30.94  )
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

This document describes the constraints and requirements of the early
boot process in a RISC-V kernel.

Szigned-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/riscv/boot-image-header.rst |   3 -
 Documentation/riscv/boot.rst              | 181 ++++++++++++++++++++++
 Documentation/riscv/index.rst             |   1 +
 3 files changed, 182 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/riscv/boot.rst

diff --git a/Documentation/riscv/boot-image-header.rst b/Documentation/riscv/boot-image-header.rst
index d7752533865f..a4a45310c4c4 100644
--- a/Documentation/riscv/boot-image-header.rst
+++ b/Documentation/riscv/boot-image-header.rst
@@ -7,9 +7,6 @@ Boot image header in RISC-V Linux
 
 This document only describes the boot image header details for RISC-V Linux.
 
-TODO:
-  Write a complete booting guide.
-
 The following 64-byte header is present in decompressed Linux kernel image::
 
 	u32 code0;		  /* Executable code */
diff --git a/Documentation/riscv/boot.rst b/Documentation/riscv/boot.rst
new file mode 100644
index 000000000000..b02230818b79
--- /dev/null
+++ b/Documentation/riscv/boot.rst
@@ -0,0 +1,181 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================================
+Early boot requirements/constraints on RISC-V
+=============================================
+
+:Author: Alexandre Ghiti <alexghiti@rivosinc.com>
+:Date: 23 May 2023
+
+This document describes what the RISC-V kernel expects from the previous stages
+and the firmware, but also the constraints that any developer must have in mind
+when touching the early boot process, e.g. before the final virtual mapping is
+setup.
+
+Pre-kernel boot (Expectations from firmware)
+============================================
+
+Registers state
+---------------
+
+The RISC-V kernel expects:
+
+  * `$a0` to contain the hartid of the current core.
+  * `$a1` to contain the address of the device tree in memory.
+
+CSR state
+---------
+
+The RISC-V kernel expects:
+
+  * `$satp = 0`: the MMU must be disabled.
+
+Reserved memory for resident firmware
+-------------------------------------
+
+The RISC-V kernel expects the firmware to mark any resident memory with the
+`no-map` flag, thus the kernel won't map those regions in the direct mapping
+(avoiding issues with hibernation, speculative accesses and probably other
+subsystems).
+
+Kernel location
+---------------
+
+The RISC-V kernel expects to be placed at a PMD boundary (2MB for rv64 and 4MB
+for rv32). Note though that the EFI stub will physically relocate the kernel if
+that's not the case.
+
+Device-tree
+-----------
+
+The RISC-V kernel always expects a device tree, it is:
+
+- either passed directly to the kernel from the previous stage using the `$a1`
+  register,
+- or when booting with UEFI, the device tree will be retrieved by the EFI stub
+  using the EFI configuration table or it will be created.
+
+Bootflow
+--------
+
+There exist 2 methods to enter the kernel:
+
+- `RISCV_BOOT_SPINWAIT`: the firmware releases all harts in the kernel, one hart
+  wins a lottery and executes the early boot code while the other harts are
+  parked waiting for the initialization to finish. This method is now
+  **deprecated**.
+- Ordered booting: the firmware releases only one hart that will execute the
+  initialization phase and then will start all other harts using the SBI HSM
+  extension.
+
+UEFI
+----
+
+UEFI memory map
+~~~~~~~~~~~~~~~
+
+When booting with UEFI, the RISC-V kernel will use only the EFI memory map to
+populate the system memory.
+
+The UEFI firmware must parse the subnodes of the `/reserved-memory` device tree
+node and abide by the device tree specification to convert the attributes of
+those subnodes (`no-map` and `reusable`) into their correct EFI equivalent
+(refer to section "3.5.4 /reserved-memory and UEFI" of the device tree
+specification).
+
+RISCV_EFI_BOOT_PROTOCOL
+~~~~~~~~~~~~~~~~~~~~~~~
+
+When booting with UEFI, the EFI stub requires the boot hartid in order to pass
+it to the RISC-V kernel in `$a1`. The EFI stub retrieves the boot hartid using
+one of the following methods:
+
+- `RISCV_EFI_BOOT_PROTOCOL` (**preferred**).
+- `boot-hartid` device tree subnode (**deprecated**).
+
+Any new firmware must implement `RISCV_EFI_BOOT_PROTOCOL` as the device tree
+based approach is deprecated now.
+
+During kernel boot: (Kernel internals)
+======================================
+
+EFI stub and device tree
+------------------------
+
+When booting with UEFI, the device tree is supplemented by the EFI stub with the
+following parameters (largely shared with arm64 in Documentation/arm/uefi.rst):
+
+==========================  ======   ===========================================
+Name                        Size     Description
+==========================  ======   ===========================================
+linux,uefi-system-table     64-bit   Physical address of the UEFI System Table.
+
+linux,uefi-mmap-start       64-bit   Physical address of the UEFI memory map,
+                                     populated by the UEFI GetMemoryMap() call.
+
+linux,uefi-mmap-size        32-bit   Size in bytes of the UEFI memory map
+                                     pointed to in previous entry.
+
+linux,uefi-mmap-desc-size   32-bit   Size in bytes of each entry in the UEFI
+                                     memory map.
+
+linux,uefi-mmap-desc-ver    32-bit   Version of the mmap descriptor format.
+
+kaslr-seed                  64-bit   Entropy used to randomize the kernel image
+                                     base address location.
+
+bootargs                             Kernel command line
+==========================  ======   ===========================================
+
+Virtual mapping setup
+---------------------
+
+The installation of the virtual mapping is done in 2 steps in the RISC-V kernel:
+
+1. :c:func:`setup_vm` installs a temporary kernel mapping in
+   :c:var:`early_pg_dir` which allows to discover the system memory: only the
+   kernel text/data are mapped at this point. When establishing this mapping,
+   no allocation can be done (since the system memory is not known yet), so
+   :c:var:`early_pg_dir` page table is statically allocated (using only one
+   table for each level).
+
+2. :c:func:`setup_vm_final` creates the final kernel mapping in
+   :c:var:`swapper_pg_dir` and takes advantage of the discovered system memory
+   to create the linear mapping. When establishing this mapping, the kernel
+   can allocate memory but cannot access it directly (since the direct mapping
+   is not present yet), so it uses temporary mappings in the fixmap region to
+   be able to access the newly allocated page table levels.
+
+For :c:func:`virt_to_phys` and :c:func:`phys_to_virt` to be able to correctly
+convert direct mapping addresses to physical addresses, it needs to know the
+start of the DRAM: this happens after 1, right before 2 installs the direct
+mapping (see :c:func:`setup_bootmem` function in arch/riscv/mm/init.c). So
+any usage of those macros before the final virtual mapping is installed must be
+carefully examined.
+
+Device-tree mapping via fixmap
+------------------------------
+
+The RISC-V kernel uses the fixmap region to map the device tree because the
+device tree virtual mapping must remain the same between :c:func:`setup_vm` and
+:c:func:`setup_vm_final` calls since :c:var:`reserved_mem` array is initialized
+with virtual addresses established by :c:func:`setup_vm` and used with the
+mapping established by :c:func:`setup_vm_final`.
+
+Pre-MMU execution
+-----------------
+
+Any code that executes before even the first virtual mapping is established
+must be very carefully compiled as:
+
+- `-fno-pie`: This is needed for relocatable kernels which use `-fPIE`, since
+  otherwise, any access to a global symbol would go through the GOT which is
+  only relocated virtually.
+- `-mcmodel=medany`: Any access to a global symbol must be PC-relative to avoid
+  any relocations to happen before the MMU is setup.
+- Also note that *all* instrumentation must also be disabled (that includes
+  KASAN, ftrace and others).
+
+As using a symbol from a different compilation unit requires this unit to be
+compiled with those flags, we advise, as much as possible, not to use external
+symbols.
diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/index.rst
index 175a91db0200..1f66062def6d 100644
--- a/Documentation/riscv/index.rst
+++ b/Documentation/riscv/index.rst
@@ -5,6 +5,7 @@ RISC-V architecture
 .. toctree::
     :maxdepth: 1
 
+    boot
     boot-image-header
     vm-layout
     hwprobe
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
