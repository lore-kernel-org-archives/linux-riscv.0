Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E527C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 10:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZDcx+lFRS70IS+gPQl5es4ojRnM2T/oDyTA93+LQ18=; b=2glx3LR9lT63A9
	ktUx6yqkerMHMCIv+djbJ8EMldN3tGTgKFCe+BhjpCsPzBNqRGBXdLlAlfOC1vKycaqK+xSQwL5Fc
	DE2Pd7a+X4WEJz3q8bzwfO30MU5YVEuBi+JUD957ldSqZjiv8h3nLpXZu3DxUntrzBT5BIW2jbPIh
	CdY71gkq50sn6WktA9VcRhDVX1xqYl2jGHP6cFy4+4xWjV12sCWwMC6GPkjNo/OJnXmCvekjB7lpT
	U/NTVxjAr0xRjmkEbShy2OVWu/B6mbGP+QWy+EyYpqMBObV+hT43ID5PQMUsOysq4hemYsL3BLkE9
	4FnrzFFhjTp7oP21gKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muBXk-003P8e-Du; Mon, 06 Dec 2021 10:48:24 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muBXh-003P4i-FA
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 10:48:23 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 675B94003E
 for <linux-riscv@lists.infradead.org>; Mon,  6 Dec 2021 10:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638787698;
 bh=uBHu8SZdjJQkCA/FR348EzSoCIWhCD+JHxQLyWBcing=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=CSbLIA0EU5iWuHXE/EJjK0GlerE/XLewj90UJSDvFDaRwRSVzPX01TymN08Dz15Ey
 r3nE6CdoqjrRo6jHAizLtowhkA5O4/pEEkU4yp8jhEBatbmf17Z+TcLY1Y25kA9zg+
 jgi4MLrKI+nL5tpQSF42688b/ilVkx5tEvjh8GQPsCqQBH28Wqx8hT2EpEngrFMnAS
 tu2B5N4c4gnjxaZGLaqFsI6Orm6AMAI7dfnl/mVdvBsJKAYYTMYieDMXSz7Tfg/Vzc
 vU/9Pk8c1agrWnBf1h+24+inOp3JlLoK/QbyiybO2lR/S/KmRyiL4l5Gu5C27hG7U0
 ArwmSOvFHJ9qw==
Received: by mail-wr1-f71.google.com with SMTP id
 k15-20020adfe8cf000000b00198d48342f9so1913663wrn.0
 for <linux-riscv@lists.infradead.org>; Mon, 06 Dec 2021 02:48:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uBHu8SZdjJQkCA/FR348EzSoCIWhCD+JHxQLyWBcing=;
 b=E47HW8eqkk29RVuNByBsS19XSCgn5saeJgmhlzaPKNUfHLLjIWQj1B2Uvx4X+TyPhJ
 IlKOK9nFJY5b9PyWoaPMvOb6ycge9T5HtjKF9dJF5Ix2pnizzKUUzpBRO+Ft8jpSrnYF
 IRblJkxXx/VSGhNgqN7n/Ly6TrM56kz612ksKdnRxRYUa2NBS4qp7eRZECvDdFt+jlmM
 OkUJQmP94bXSPBqrw0oASFX0rsrprIg4OHiSfpvNXCNxP4yYPdZBtbY8oBwn2nXS2xDq
 uuBSFvDPI5DIWffnlNBM8RfW8/sfOTGWWqQJLx/txOFTFyXS/OH4NXjN73OnLNgEib6+
 TwHA==
X-Gm-Message-State: AOAM532eLy8fMudIodUHQzXDMzP9Gi40PXTlXJKqyTdFe9/8aWkKW7Hb
 MscoMtLFb0n0cwFaYClp16Xg62pGM4+1tyL4Ed+zV4ihCfAKJbcc/DG2VrGd6f8kA+M5q66lOct
 xUoc8Rd5uYSM7z00KTR1tExeM9N5c2GOXl+V3aGGdUxdvew==
X-Received: by 2002:a7b:c763:: with SMTP id x3mr37984589wmk.31.1638787697930; 
 Mon, 06 Dec 2021 02:48:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCJYBJZUlpCug8yEN+QOTHVY+3WNSPT4dFS5tugxwzXk8gyXlxb6OIerSZS8hYmn7E1U9/NA==
X-Received: by 2002:a7b:c763:: with SMTP id x3mr37984567wmk.31.1638787697752; 
 Mon, 06 Dec 2021 02:48:17 -0800 (PST)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id d2sm10975342wmb.31.2021.12.06.02.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 02:48:17 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@rivosinc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, panqinglin2020@iscas.ac.cn,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v3 01/13] riscv: Move KASAN mapping next to the kernel mapping
Date: Mon,  6 Dec 2021 11:46:45 +0100
Message-Id: <20211206104657.433304-2-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_024821_739971_1F233EED 
X-CRM114-Status: GOOD (  20.67  )
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

Now that KASAN_SHADOW_OFFSET is defined at compile time as a config,
this value must remain constant whatever the size of the virtual address
space, which is only possible by pushing this region at the end of the
address space next to the kernel mapping.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 Documentation/riscv/vm-layout.rst | 12 ++++++------
 arch/riscv/Kconfig                |  4 ++--
 arch/riscv/include/asm/kasan.h    |  4 ++--
 arch/riscv/include/asm/page.h     |  6 +++++-
 arch/riscv/include/asm/pgtable.h  |  6 ++++--
 arch/riscv/mm/init.c              | 25 +++++++++++++------------
 6 files changed, 32 insertions(+), 25 deletions(-)

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
index b7f98930d38d..1bd687b97104 100644
--- a/Documentation/riscv/vm-layout.rst
+++ b/Documentation/riscv/vm-layout.rst
@@ -47,12 +47,12 @@ RISC-V Linux Kernel SV39
                                                               | Kernel-space virtual memory, shared between all processes:
   ____________________________________________________________|___________________________________________________________
                     |            |                  |         |
-   ffffffc000000000 | -256    GB | ffffffc7ffffffff |   32 GB | kasan
-   ffffffcefee00000 | -196    GB | ffffffcefeffffff |    2 MB | fixmap
-   ffffffceff000000 | -196    GB | ffffffceffffffff |   16 MB | PCI io
-   ffffffcf00000000 | -196    GB | ffffffcfffffffff |    4 GB | vmemmap
-   ffffffd000000000 | -192    GB | ffffffdfffffffff |   64 GB | vmalloc/ioremap space
-   ffffffe000000000 | -128    GB | ffffffff7fffffff |  124 GB | direct mapping of all physical memory
+   ffffffc6fee00000 | -228    GB | ffffffc6feffffff |    2 MB | fixmap
+   ffffffc6ff000000 | -228    GB | ffffffc6ffffffff |   16 MB | PCI io
+   ffffffc700000000 | -228    GB | ffffffc7ffffffff |    4 GB | vmemmap
+   ffffffc800000000 | -224    GB | ffffffd7ffffffff |   64 GB | vmalloc/ioremap space
+   ffffffd800000000 | -160    GB | fffffff6ffffffff |  124 GB | direct mapping of all physical memory
+   fffffff700000000 |  -36    GB | fffffffeffffffff |   32 GB | kasan
   __________________|____________|__________________|_________|____________________________________________________________
                                                               |
                                                               |
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6d5b63bd4bd9..6cd98ade5ebc 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -161,12 +161,12 @@ config PAGE_OFFSET
 	default 0xC0000000 if 32BIT && MAXPHYSMEM_1GB
 	default 0x80000000 if 64BIT && !MMU
 	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
-	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
+	default 0xffffffd800000000 if 64BIT && MAXPHYSMEM_128GB
 
 config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN_GENERIC
-	default 0xdfffffc800000000 if 64BIT
+	default 0xdfffffff00000000 if 64BIT
 	default 0xffffffff if 32BIT
 
 config ARCH_FLATMEM_ENABLE
diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
index b00f503ec124..257a2495145a 100644
--- a/arch/riscv/include/asm/kasan.h
+++ b/arch/riscv/include/asm/kasan.h
@@ -28,8 +28,8 @@
 #define KASAN_SHADOW_SCALE_SHIFT	3
 
 #define KASAN_SHADOW_SIZE	(UL(1) << ((CONFIG_VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
-#define KASAN_SHADOW_START	KERN_VIRT_START
-#define KASAN_SHADOW_END	(KASAN_SHADOW_START + KASAN_SHADOW_SIZE)
+#define KASAN_SHADOW_START	(KASAN_SHADOW_END - KASAN_SHADOW_SIZE)
+#define KASAN_SHADOW_END	MODULES_LOWEST_VADDR
 #define KASAN_SHADOW_OFFSET	_AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
 
 void kasan_init(void);
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 109c97e991a6..e03559f9b35e 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -33,7 +33,11 @@
  */
 #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
 
-#define KERN_VIRT_SIZE (-PAGE_OFFSET)
+/*
+ * Half of the kernel address space (half of the entries of the page global
+ * directory) is for the direct mapping.
+ */
+#define KERN_VIRT_SIZE		((PTRS_PER_PGD / 2 * PGDIR_SIZE) / 2)
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 39b550310ec6..d34f3a7a9701 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -39,8 +39,10 @@
 
 /* Modules always live before the kernel */
 #ifdef CONFIG_64BIT
-#define MODULES_VADDR	(PFN_ALIGN((unsigned long)&_end) - SZ_2G)
-#define MODULES_END	(PFN_ALIGN((unsigned long)&_start))
+/* This is used to define the end of the KASAN shadow region */
+#define MODULES_LOWEST_VADDR	(KERNEL_LINK_ADDR - SZ_2G)
+#define MODULES_VADDR		(PFN_ALIGN((unsigned long)&_end) - SZ_2G)
+#define MODULES_END		(PFN_ALIGN((unsigned long)&_start))
 #endif
 
 /*
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index c0cddf0fc22d..4224e9d0ecf5 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -103,6 +103,9 @@ static void __init print_vm_layout(void)
 	print_mlm("lowmem", (unsigned long)PAGE_OFFSET,
 		  (unsigned long)high_memory);
 #ifdef CONFIG_64BIT
+#ifdef CONFIG_KASAN
+	print_mlm("kasan", KASAN_SHADOW_START, KASAN_SHADOW_END);
+#endif
 	print_mlm("kernel", (unsigned long)KERNEL_LINK_ADDR,
 		  (unsigned long)ADDRESS_SPACE_END);
 #endif
@@ -130,18 +133,8 @@ void __init mem_init(void)
 	print_vm_layout();
 }
 
-/*
- * The default maximal physical memory size is -PAGE_OFFSET for 32-bit kernel,
- * whereas for 64-bit kernel, the end of the virtual address space is occupied
- * by the modules/BPF/kernel mappings which reduces the available size of the
- * linear mapping.
- * Limit the memory size via mem.
- */
-#ifdef CONFIG_64BIT
-static phys_addr_t memory_limit = -PAGE_OFFSET - SZ_4G;
-#else
-static phys_addr_t memory_limit = -PAGE_OFFSET;
-#endif
+/* Limit the memory size via mem. */
+static phys_addr_t memory_limit;
 
 static int __init early_mem(char *p)
 {
@@ -613,6 +606,14 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 
 	riscv_pfn_base = PFN_DOWN(kernel_map.phys_addr);
 
+	/*
+	 * The default maximal physical memory size is KERN_VIRT_SIZE for 32-bit
+	 * kernel, whereas for 64-bit kernel, the end of the virtual address
+	 * space is occupied by the modules/BPF/kernel mappings which reduces
+	 * the available size of the linear mapping.
+	 */
+	memory_limit = KERN_VIRT_SIZE - (IS_ENABLED(CONFIG_64BIT) ? SZ_4G : 0);
+
 	/* Sanity check alignment and size */
 	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
 	BUG_ON((kernel_map.phys_addr % PMD_SIZE) != 0);
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
