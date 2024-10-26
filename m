Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC884D10C01
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Oct 2024 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DuI2mOjIp1P9JIi4ZO6uU6qnzMCRxUOER9OE5+0b8No=; b=4S2Jd+/Ny71RkP
	KqBpk9JaRWv6x0LVSNw1GneBQsC9R1Z4IlqY9Rw/GBJY2bRSj0fGLjPt5LytypLe46fblFJvBU3zx
	DzgVuhU/FTvJ7WDcEF4EeBVNdV/svJkmXeShPwHVr7HUz1b4sMt4PwBi4zKzIb+tPAh3pedZ5WG1C
	aHOekvXnFKbq3FSkDNedrXZHGy8kEC8rN2fLfv6HeTxwP/eXTj6LkIy+a9Cv0qEdUTLC3CsxZyN9b
	Jv2ggGvuK0lo/Rg8+ecpRjNfDbs3LhR2Hc2Xrk6UwxhyvNpxp02xUMCNG2LDLveVEnGWkYLoDa7lx
	uVtxhZRdupzRBttmTHdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4kNQ-00000006xDx-0vt1;
	Sat, 26 Oct 2024 17:15:00 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4kNI-00000006x8G-1GAy
	for linux-riscv@lists.infradead.org;
	Sat, 26 Oct 2024 17:14:53 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e30116efc9so2423163a91.2
        for <linux-riscv@lists.infradead.org>; Sat, 26 Oct 2024 10:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729962891; x=1730567691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3iilPE9PRtO5dgnEVdYwMDgO0cR2NihKQ5GAqyVmi0I=;
        b=bPmhZsTMq5/mfSxPae5gqDUkFoyPUkOzTJQ40AUg68b8rKG0L/OMX7PhjB1847ZqFs
         z5WYdanmRbLGercITXjhY6hhVQzwkuLH6pR/ZhVP/JdvuZA8bPK9MmU6FJ+9IOKq+5Qx
         hFdeGfWCew5+6svyVYBxfDwqVP2ol5REAwpy1UAO8//RovMVr7fyJ1STHolxx2WdEodn
         HI4js2kFzefvRiWtckNJNrV6edpTSpaM1z71dlyNC4MEVDZUNa4+p7aKpxEJJu6/TE4W
         AdwGWmWGhP3FRUZqeWeDuZwqhiF7WUoztkup6jHLylD3V5bEi8SxOUi2gpHtzCJoiH5S
         0M1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729962891; x=1730567691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3iilPE9PRtO5dgnEVdYwMDgO0cR2NihKQ5GAqyVmi0I=;
        b=Md/QlvRlsVm5QJArMxTqCoWavdIM33sEvM+sD5KLIMJsyhfx4KGxQCmcV6wr+1zuXp
         DvS8RG+eG6aH77na7CcJvpjqOkrkZ0YGw9E6Y4xUPNmCP5c24sH0pKiNat2edlzrgt39
         P2QCMZYXQh+QQwGECcMsanaN5AZgK0aSFHHwemFCNAtyTmcWQcUVK5lGiN+tazRpmzpK
         KWEidahwCfC9cNv3R+NXdwquehxeM5fDeShVCwmNJT1IhM9tOWC/daqsDPYXTGejhd73
         IEklo8mKbmgZPh95ZOZDOnN+w/BGH1Zrfs5S5ZvRKc74ImSOeuTvIS7AZ5rJ4D00coPI
         ovzg==
X-Forwarded-Encrypted: i=1; AJvYcCUeFqo9lwembht9HZTElyfrN+gjg3BnzTVNDkCaLH7+gwKoLf/8keD6qb31O11de2QV5QyGUyDqnZW5Zw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAC+w3lbBCSlp5VU4yF2qhlHtzYPDKCZkNArCtWHB/PT6JpXfr
	hiQYaEKybF9JUUtmKJa0iuQcCH0FzD/mPRMEpBteB3IMc9VHlaaF5Z6CX7rDfDY=
X-Google-Smtp-Source: AGHT+IHKHWEssFZ3dU4bK/XFfhtDHlaKTxMDsGGVAwitWxfjevjp7X7a3fieuNlFSdnYzB2SDFDTOA==
X-Received: by 2002:a17:90a:3d0a:b0:2e2:c252:f861 with SMTP id 98e67ed59e1d1-2e8f10a7298mr4016154a91.28.1729962891258;
        Sat, 26 Oct 2024 10:14:51 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e558114sm5663762a91.36.2024.10.26.10.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 10:14:50 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 6/6] riscv: Remove CONFIG_PAGE_OFFSET
Date: Sat, 26 Oct 2024 10:13:58 -0700
Message-ID: <20241026171441.3047904-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241026171441.3047904-1-samuel.holland@sifive.com>
References: <20241026171441.3047904-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_101452_385790_C84C1ED9 
X-CRM114-Status: GOOD (  16.69  )
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

The current definition of CONFIG_PAGE_OFFSET is problematic for a couple
of reasons:
 1) The value is misleading for normal 64-bit kernels, where it is
    overridden at runtime if Sv48 or Sv39 is chosen. This is especially
    the case for XIP kernels, which always use Sv39.
 2) The option is not user-visible, but for NOMMU kernels it must be a
    valid RAM address, and for !RELOCATABLE it must additionally be the
    exact address where the kernel is loaded.

Fix both of these by removing the option.
 1) For MMU kernels, drop the indirection through Kconfig. Additionally,
    for XIP, drop the indirection through kernel_map.
 2) For NOMMU kernels, use the user-visible physical RAM base if
    provided. Otherwise, force the kernel to be relocatable.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Kconfig               |  8 +-------
 arch/riscv/include/asm/page.h    | 15 ++++++++-------
 arch/riscv/include/asm/pgtable.h |  2 +-
 arch/riscv/mm/init.c             |  8 ++------
 4 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 33aa79d84021..297ccbf4b5ce 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -195,6 +195,7 @@ config RISCV
 	select PCI_DOMAINS_GENERIC if PCI
 	select PCI_ECAM if (ACPI && PCI)
 	select PCI_MSI if PCI
+	select RELOCATABLE if !MMU && !PHYS_RAM_BASE_FIXED
 	select RISCV_ALTERNATIVE if !XIP_KERNEL
 	select RISCV_APLIC
 	select RISCV_IMSIC
@@ -282,13 +283,6 @@ config MMU
 	  Select if you want MMU-based virtualised addressing space
 	  support by paged memory management. If unsure, say 'Y'.
 
-config PAGE_OFFSET
-	hex
-	default 0x80000000 if !MMU && RISCV_M_MODE
-	default 0x80200000 if !MMU
-	default 0xc0000000 if 32BIT
-	default 0xff60000000000000 if 64BIT
-
 config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN_GENERIC
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 24d1ac052609..d1acd1efe0dc 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -28,15 +28,16 @@
  */
 #ifdef CONFIG_MMU
 #ifdef CONFIG_64BIT
-#define PAGE_OFFSET		kernel_map.page_offset
-/*
- * By default, CONFIG_PAGE_OFFSET value corresponds to SV57 address space so
- * define the PAGE_OFFSET value for SV48 and SV39.
- */
+#define PAGE_OFFSET_L5		_AC(0xff60000000000000, UL)
 #define PAGE_OFFSET_L4		_AC(0xffffaf8000000000, UL)
 #define PAGE_OFFSET_L3		_AC(0xffffffd600000000, UL)
+#ifdef CONFIG_XIP_KERNEL
+#define PAGE_OFFSET		PAGE_OFFSET_L3
 #else
-#define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
+#define PAGE_OFFSET		kernel_map.page_offset
+#endif /* CONFIG_XIP_KERNEL */
+#else
+#define PAGE_OFFSET		_AC(0xc0000000, UL)
 #endif /* CONFIG_64BIT */
 #else
 #define PAGE_OFFSET		((unsigned long)phys_ram_base)
@@ -100,7 +101,6 @@ typedef struct page *pgtable_t;
 #define ARCH_PFN_OFFSET		(PFN_DOWN((unsigned long)phys_ram_base))
 
 struct kernel_mapping {
-	unsigned long page_offset;
 	unsigned long virt_addr;
 	unsigned long virt_offset;
 	uintptr_t phys_addr;
@@ -114,6 +114,7 @@ struct kernel_mapping {
 	uintptr_t xiprom;
 	uintptr_t xiprom_sz;
 #else
+	unsigned long page_offset;
 	unsigned long va_kernel_pa_offset;
 #endif
 };
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index d0190ee9b2e4..b8125c3aa85d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -15,7 +15,7 @@
 #ifdef CONFIG_RELOCATABLE
 #define KERNEL_LINK_ADDR	UL(0)
 #else
-#define KERNEL_LINK_ADDR	_AC(CONFIG_PAGE_OFFSET, UL)
+#define KERNEL_LINK_ADDR	_AC(CONFIG_PHYS_RAM_BASE, UL)
 #endif
 #define KERN_VIRT_SIZE		(UL(-1))
 #else
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0aad925848a4..a1a185e6faf0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -843,6 +843,8 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
 	uintptr_t set_satp_mode_pmd = ((unsigned long)set_satp_mode) & PMD_MASK;
 	u64 satp_mode_cmdline = __pi_set_satp_mode_from_cmdline(dtb_pa);
 
+	kernel_map.page_offset = PAGE_OFFSET_L5;
+
 	if (satp_mode_cmdline == SATP_MODE_57) {
 		disable_pgtable_l5();
 	} else if (satp_mode_cmdline == SATP_MODE_48) {
@@ -1090,11 +1092,6 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	kernel_map.virt_addr = KERNEL_LINK_ADDR + kernel_map.virt_offset;
 
 #ifdef CONFIG_XIP_KERNEL
-#ifdef CONFIG_64BIT
-	kernel_map.page_offset = PAGE_OFFSET_L3;
-#else
-	kernel_map.page_offset = _AC(CONFIG_PAGE_OFFSET, UL);
-#endif
 	kernel_map.xiprom = (uintptr_t)CONFIG_XIP_PHYS_ADDR;
 	kernel_map.xiprom_sz = (uintptr_t)(&_exiprom) - (uintptr_t)(&_xiprom);
 
@@ -1106,7 +1103,6 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	kernel_map.va_kernel_xip_data_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr
 						+ (uintptr_t)&_sdata - (uintptr_t)&_start;
 #else
-	kernel_map.page_offset = _AC(CONFIG_PAGE_OFFSET, UL);
 	kernel_map.phys_addr = (uintptr_t)(&_start);
 	kernel_map.size = (uintptr_t)(&_end) - kernel_map.phys_addr;
 	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
