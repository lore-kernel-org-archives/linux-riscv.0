Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B3FD10C03
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Oct 2024 17:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9bJvlztqavCGLi54uRcWuJTYuHHbrRhh2AXHA+F39Y=; b=ygajtfrMC1Ckgz
	VVBGegdB0Eab0pw1Sd64B/qh/Or689sj3mIkZCYJA0nd97A1MNYRy51o7Q2aKFYavUOvQdWz/fZHs
	IDOR4IbcZFQ8TWRg7B4Hb7zf90ulBAzykMQAGEjXgFuBLVZYbTlSJVDLlT7FrcOvroUMmkRogwETj
	Lqru9n9iBHmRsZOZ+ewzWbDv6iWc4ODseHQlsDT3hFMNDp4FFtBXIgbSUHwlmyx+NazhbJ+z5QLdi
	vQRvvlipbAjm677l7omTZ/bESrvbEe+YUOdDt7BIifSzfhbmVL5F/F5cARhzo7VgYfusELCf0BuwA
	z94v3VVWfv/cXCK1lIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4kNJ-00000006x9g-2rcn;
	Sat, 26 Oct 2024 17:14:53 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4kNE-00000006x6z-3SPL
	for linux-riscv@lists.infradead.org;
	Sat, 26 Oct 2024 17:14:50 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e2a97c2681so2189271a91.2
        for <linux-riscv@lists.infradead.org>; Sat, 26 Oct 2024 10:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729962888; x=1730567688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiHFo4DmtdeXVJSdAkSejNf62f3o6R3z/nVT/XM/LXQ=;
        b=mvrygMWUA6BngWr0BJ8vizpKc4fJ/PTzPgGYgmgTMRvAwRrLcoVlqRn7jo4up+GLd1
         LreYlotQ9TA+Tmk2UVw/HqjTcXNFuB+vtJ7T6z6bT1Ib/+Rv2J13FfbDHZBlhxMNfxvh
         GIOIsGa4RpznnMH0RRhOGD40l7y23BBIp6IfRxQPklZbYBCc1AWJ9BvN29o8Z70zzLIy
         1ukwR6DPCXLMBQI6XfzPo+g7ALIIYZJ6OK9lbGzTLX5oC2xL/U0G4tW1wMrk5zxkCBz6
         Awf0cw1MWscRk/nAPWOgyZUv7NSE2ecc5rE/spgxvUjMMXbufIGCzqKvGTbtgwFXa3xB
         2LGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729962888; x=1730567688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiHFo4DmtdeXVJSdAkSejNf62f3o6R3z/nVT/XM/LXQ=;
        b=w0UPmzGume39VAVdsnTkVaND/gArZhzW0l75C/hq75YaDikSLzwRp7SaO6uo38W9IC
         yahKG1fL7ksGUK7OyQpPMqkhXnTVUZWn9iS47jPsNmNqtuIV2lMEKnaTGqeRHLdG0lSV
         MK9VuJBpJiuHgTz0HPXeVhJLFphejG6fbQFWF59EuB7P6NJ+VSGI/qNNaCH5bgEE8HgE
         r00Z+3Rq6y2Htn3Q/ElUkV3hO7KUHk+8+FvCtDlFGXn3lwD/aByFzdy5Pt3jQmNyqd8L
         HDXvSEqHpJplLu4IwS517hnzpA9r72Blra5Q8NFF2J/q6FnWUJC/MxdoFvBUlJ9WIN4I
         spag==
X-Forwarded-Encrypted: i=1; AJvYcCU3YVSNe/SgtjDSF3JMBmcshdxh+QGtNbwIIBVffMcy7NpPBKwOo/85VblTVMJ2ll0eTHM4XdXb+9YSaw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Z8JWadlFaEcNvqxwj0kaTOo0eae7oSOTBGH1BEw9GV2Sn+jP
	2QtKF+rHrcnIqsRSVe3oFrzt+0rPD+zNMZY/8jh8X7ygYshSDOCaTIE0btBKoAc=
X-Google-Smtp-Source: AGHT+IEzN1IbGCkMVdSp3rlof3XN99qFbQm4PDAwtLCkE/kwbj+tFrZvPVcsHIV6RGdY5SSQlNI55A==
X-Received: by 2002:a17:90b:1202:b0:2e2:bbcd:6cbb with SMTP id 98e67ed59e1d1-2e8f105081dmr3625438a91.6.1729962887736;
        Sat, 26 Oct 2024 10:14:47 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e558114sm5663762a91.36.2024.10.26.10.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 10:14:47 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 3/6] riscv: Support CONFIG_RELOCATABLE on NOMMU
Date: Sat, 26 Oct 2024 10:13:55 -0700
Message-ID: <20241026171441.3047904-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241026171441.3047904-1-samuel.holland@sifive.com>
References: <20241026171441.3047904-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_101448_895736_3FD61852 
X-CRM114-Status: GOOD (  18.25  )
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

Move relocate_kernel() out of the CONFIG_MMU block so it can be called
from the NOMMU version of setup_vm(). Set some offsets in kernel_map so
relocate_kernel() does not need to be modified. Relocatable NOMMU
kernels can be loaded to any physical memory address; they no longer
depend on CONFIG_PAGE_OFFSET.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Kconfig               |  2 +-
 arch/riscv/include/asm/pgtable.h |  4 ++
 arch/riscv/mm/init.c             | 82 +++++++++++++++++---------------
 3 files changed, 49 insertions(+), 39 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 62545946ecf4..4420419e7054 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -934,7 +934,7 @@ config PARAVIRT_TIME_ACCOUNTING
 
 config RELOCATABLE
 	bool "Build a relocatable kernel"
-	depends on MMU && 64BIT && !XIP_KERNEL
+	depends on 64BIT && !XIP_KERNEL
 	select MODULE_SECTIONS if MODULES
 	help
           This builds a kernel as a Position Independent Executable (PIE),
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e224ac66e635..d0190ee9b2e4 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -12,7 +12,11 @@
 #include <asm/pgtable-bits.h>
 
 #ifndef CONFIG_MMU
+#ifdef CONFIG_RELOCATABLE
+#define KERNEL_LINK_ADDR	UL(0)
+#else
 #define KERNEL_LINK_ADDR	_AC(CONFIG_PAGE_OFFSET, UL)
+#endif
 #define KERN_VIRT_SIZE		(UL(-1))
 #else
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0e8c20adcd98..a74e28367f9f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -307,6 +307,44 @@ static void __init setup_bootmem(void)
 		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
 }
 
+#ifdef CONFIG_RELOCATABLE
+extern unsigned long __rela_dyn_start, __rela_dyn_end;
+
+static void __init relocate_kernel(void)
+{
+	Elf64_Rela *rela = (Elf64_Rela *)&__rela_dyn_start;
+	/*
+	 * This holds the offset between the linked virtual address and the
+	 * relocated virtual address.
+	 */
+	uintptr_t reloc_offset = kernel_map.virt_addr - KERNEL_LINK_ADDR;
+	/*
+	 * This holds the offset between kernel linked virtual address and
+	 * physical address.
+	 */
+	uintptr_t va_kernel_link_pa_offset = KERNEL_LINK_ADDR - kernel_map.phys_addr;
+
+	for ( ; rela < (Elf64_Rela *)&__rela_dyn_end; rela++) {
+		Elf64_Addr addr = (rela->r_offset - va_kernel_link_pa_offset);
+		Elf64_Addr relocated_addr = rela->r_addend;
+
+		if (rela->r_info != R_RISCV_RELATIVE)
+			continue;
+
+		/*
+		 * Make sure to not relocate vdso symbols like rt_sigreturn
+		 * which are linked from the address 0 in vmlinux since
+		 * vdso symbol addresses are actually used as an offset from
+		 * mm->context.vdso in VDSO_OFFSET macro.
+		 */
+		if (relocated_addr >= KERNEL_LINK_ADDR)
+			relocated_addr += reloc_offset;
+
+		*(Elf64_Addr *)addr = relocated_addr;
+	}
+}
+#endif /* CONFIG_RELOCATABLE */
+
 #ifdef CONFIG_MMU
 struct pt_alloc_ops pt_ops __meminitdata;
 
@@ -877,44 +915,6 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
 #error "setup_vm() is called from head.S before relocate so it should not use absolute addressing."
 #endif
 
-#ifdef CONFIG_RELOCATABLE
-extern unsigned long __rela_dyn_start, __rela_dyn_end;
-
-static void __init relocate_kernel(void)
-{
-	Elf64_Rela *rela = (Elf64_Rela *)&__rela_dyn_start;
-	/*
-	 * This holds the offset between the linked virtual address and the
-	 * relocated virtual address.
-	 */
-	uintptr_t reloc_offset = kernel_map.virt_addr - KERNEL_LINK_ADDR;
-	/*
-	 * This holds the offset between kernel linked virtual address and
-	 * physical address.
-	 */
-	uintptr_t va_kernel_link_pa_offset = KERNEL_LINK_ADDR - kernel_map.phys_addr;
-
-	for ( ; rela < (Elf64_Rela *)&__rela_dyn_end; rela++) {
-		Elf64_Addr addr = (rela->r_offset - va_kernel_link_pa_offset);
-		Elf64_Addr relocated_addr = rela->r_addend;
-
-		if (rela->r_info != R_RISCV_RELATIVE)
-			continue;
-
-		/*
-		 * Make sure to not relocate vdso symbols like rt_sigreturn
-		 * which are linked from the address 0 in vmlinux since
-		 * vdso symbol addresses are actually used as an offset from
-		 * mm->context.vdso in VDSO_OFFSET macro.
-		 */
-		if (relocated_addr >= KERNEL_LINK_ADDR)
-			relocated_addr += reloc_offset;
-
-		*(Elf64_Addr *)addr = relocated_addr;
-	}
-}
-#endif /* CONFIG_RELOCATABLE */
-
 #ifdef CONFIG_XIP_KERNEL
 static void __init create_kernel_page_table(pgd_t *pgdir,
 					    __always_unused bool early)
@@ -1359,6 +1359,12 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 {
 	dtb_early_va = (void *)dtb_pa;
 	dtb_early_pa = dtb_pa;
+
+#ifdef CONFIG_RELOCATABLE
+	kernel_map.virt_addr = (uintptr_t)_start;
+	kernel_map.phys_addr = (uintptr_t)_start;
+	relocate_kernel();
+#endif
 }
 
 static inline void setup_vm_final(void)
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
