Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB710C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 04:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+OfHud2AwsuyXadefLejRn3QcZxGTsjiSCzEcx0eRk=; b=pvggRirlMf79RZ
	NI124qcAI1EzlhXszG6wqvJNJnmFtjYt9SSFKIbGSbAoN+Y+douQGhvav31ZAEXoDBkrYAbo0rryV
	mpDsHpieZHbjVQgttNPKLOT/t2EJDR3RCiVYn7HeR09DsV8YY0+tmxY5FZTemeru05TsU+QJesXng
	6SrgzDYAKf9mCwqnyZrWyDbw8qVUOv0rEvpCG2xEWyPc0dMbV5ZfLqQwYJDntUhhuunzFD0PQjQLV
	Bz/L2AHSjZDP7ASLvZ05S3bbUi16mC2s/puH2x/lOhPPjmB917Pa2se4iMNBHFpvJedhdzdQy7n0F
	A6i7JhO6ne3b2QJPQCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phNrW-00Gc1F-2G;
	Wed, 29 Mar 2023 04:56:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phNrT-00GbzS-08
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 04:56:40 +0000
Received: by mail-wr1-x435.google.com with SMTP id m2so14323739wrh.6
        for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 21:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680065797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQMSo3dI1TiCgJ5bOYmXGeEP35jM8ytuP5TLzldwWRk=;
        b=oHzBbKmfvidPMXVZTsEnD3Nq8DrVl2ki2+fns5DbUkbhqkVcyOXHnVU1ShAOw6KMfN
         jRKYI06+OpsREA2TvO2HcVgRzHy36hzSfmGcbmpF6fQkFOCWxB67H4T8BvFIsWgBAvdq
         9oLf3Bj6yrlCorWf6W4vJ0M9L+T57cGuF39BtWSk279Vww3Yv1Jj095jPMBEAipUhvUs
         U9myrZhKJnMgsGxbidyNhkaEk0I0UGdO5RrjgQdqIFPlt5dgQBL2+aqZO+un5TtgpOWO
         DGKqZD7CUpiPHsBrH7foUX9kVx7D0a373qtyl0OeOaAkDgQI5POdME9T8+scDzUUlOvw
         9iiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQMSo3dI1TiCgJ5bOYmXGeEP35jM8ytuP5TLzldwWRk=;
        b=O8rV58qU4PNAvmzhce7M5+GCw4DqLQb1NwfAvYjaAi28DBUOnQJIcyCKp6aqaeTHKo
         JQNV9fykG/Qr8TdyfqPuVsJ4Jnk9w1BM4TkseD+xPhVn/CabAsS872Cpr4oCMctfv2K8
         I1mvA023l0RPJYizprzQkE7fQTjled7dhaM+nVtbKKWgO0DVVm1VeIcZQFs7w1BPeM1b
         XIM3Jm+Sm9zBaMRkmqrYNQ/AOmvViGplmhNGdbJPLY0eqo3L3H8SSbaj3UKbCyw2xKDy
         4nWoel1ONKtbJ9sIOlIY0X4Enn+pLDHNob1QdsIaeSSo4Y6WjmHD0sbp5OVrR3coJPyz
         jHLA==
X-Gm-Message-State: AAQBX9cVvCgrc/cF4NYNqRCu3nQCkJTVA85HdE0sPj4QYVRExhkLgQIg
	WU76ZO9xGukFwUD0mZdFBmWdYA==
X-Google-Smtp-Source: AKy350apw2rJxTh795JIx8DPttqwEHcr5qnVOJOYeKOdyO3sghAOnPCeswjEAny+PP0Gt+12hyUksA==
X-Received: by 2002:adf:fe51:0:b0:2d9:457a:1069 with SMTP id m17-20020adffe51000000b002d9457a1069mr14280855wrs.37.1680065796823;
        Tue, 28 Mar 2023 21:56:36 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id e8-20020adffd08000000b002c592535839sm29042488wrr.17.2023.03.28.21.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:56:36 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v9 3/6] riscv: Introduce CONFIG_RELOCATABLE
Date: Wed, 29 Mar 2023 06:53:26 +0200
Message-Id: <20230329045329.64565-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_215639_080029_D6DC408C 
X-CRM114-Status: GOOD (  22.05  )
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

This config allows to compile 64b kernel as PIE and to relocate it at
any virtual address at runtime: this paves the way to KASLR.
Runtime relocation is possible since relocation metadata are embedded into
the kernel.

Note that relocating at runtime introduces an overhead even if the
kernel is loaded at the same address it was linked at and that the compiler
options are those used in arm64 which uses the same RELA relocation
format.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig              | 14 +++++++++
 arch/riscv/Makefile             |  7 +++--
 arch/riscv/kernel/vmlinux.lds.S | 17 +++++++++--
 arch/riscv/mm/Makefile          |  4 +++
 arch/riscv/mm/init.c            | 54 ++++++++++++++++++++++++++++++++-
 5 files changed, 91 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3c5907431081..6ff9f574195d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -562,6 +562,20 @@ config COMPAT
 
 	  If you want to execute 32-bit userspace applications, say Y.
 
+config RELOCATABLE
+	bool "Build a relocatable kernel"
+	depends on MMU && 64BIT && !XIP_KERNEL
+	help
+          This builds a kernel as a Position Independent Executable (PIE),
+          which retains all relocation metadata required to relocate the
+          kernel binary at runtime to a different virtual address than the
+          address it was linked at.
+          Since RISCV uses the RELA relocation format, this requires a
+          relocation pass at runtime even if the kernel is loaded at the
+          same address it was linked at.
+
+          If unsure, say N.
+
 endmenu # "Kernel features"
 
 menu "Boot options"
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 6203c3378922..860b09e409c7 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -7,9 +7,12 @@
 #
 
 OBJCOPYFLAGS    := -O binary
-LDFLAGS_vmlinux :=
+ifeq ($(CONFIG_RELOCATABLE),y)
+	LDFLAGS_vmlinux += -shared -Bsymbolic -z notext -z norelro
+	KBUILD_CFLAGS += -fPIE
+endif
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
-	LDFLAGS_vmlinux := --no-relax
+	LDFLAGS_vmlinux += --no-relax
 	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
 ifeq ($(CONFIG_RISCV_ISA_C),y)
 	CC_FLAGS_FTRACE := -fpatchable-function-entry=4
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index e05e6df44225..615ff5842690 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -122,10 +122,23 @@ SECTIONS
 		*(.sdata*)
 	}
 
-	.rela.dyn : {
-		*(.rela*)
+	.rela.dyn : ALIGN(8) {
+		__rela_dyn_start = .;
+		*(.rela .rela*)
+		__rela_dyn_end = .;
 	}
 
+#ifdef CONFIG_RELOCATABLE
+	.data.rel : { *(.data.rel*) }
+	.got : { *(.got*) }
+	.plt : { *(.plt) }
+	.dynamic : { *(.dynamic) }
+	.dynsym : { *(.dynsym) }
+	.dynstr : { *(.dynstr) }
+	.hash : { *(.hash) }
+	.gnu.hash : { *(.gnu.hash) }
+#endif
+
 #ifdef CONFIG_EFI
 	.pecoff_edata_padding : { BYTE(0); . = ALIGN(PECOFF_FILE_ALIGNMENT); }
 	__pecoff_data_raw_size = ABSOLUTE(. - __pecoff_text_end);
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 2ac177c05352..b85e9e82f082 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -1,6 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 CFLAGS_init.o := -mcmodel=medany
+ifdef CONFIG_RELOCATABLE
+CFLAGS_init.o += -fno-pie
+endif
+
 ifdef CONFIG_FTRACE
 CFLAGS_REMOVE_init.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_cacheflush.o = $(CC_FLAGS_FTRACE)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index f803671d18b2..bce899b180cd 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -20,6 +20,9 @@
 #include <linux/dma-map-ops.h>
 #include <linux/crash_dump.h>
 #include <linux/hugetlb.h>
+#ifdef CONFIG_RELOCATABLE
+#include <linux/elf.h>
+#endif
 
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
@@ -146,7 +149,7 @@ static void __init print_vm_layout(void)
 		print_ml("kasan", KASAN_SHADOW_START, KASAN_SHADOW_END);
 #endif
 
-		print_ml("kernel", (unsigned long)KERNEL_LINK_ADDR,
+		print_ml("kernel", (unsigned long)kernel_map.virt_addr,
 			 (unsigned long)ADDRESS_SPACE_END);
 	}
 }
@@ -831,6 +834,44 @@ static __init void set_satp_mode(void)
 #error "setup_vm() is called from head.S before relocate so it should not use absolute addressing."
 #endif
 
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
 #ifdef CONFIG_XIP_KERNEL
 static void __init create_kernel_page_table(pgd_t *pgdir,
 					    __always_unused bool early)
@@ -1029,6 +1070,17 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	BUG_ON((kernel_map.virt_addr + kernel_map.size) > ADDRESS_SPACE_END - SZ_4K);
 #endif
 
+#ifdef CONFIG_RELOCATABLE
+	/*
+	 * Early page table uses only one PUD, which makes it possible
+	 * to map PUD_SIZE aligned on PUD_SIZE: if the relocation offset
+	 * makes the kernel cross over a PUD_SIZE boundary, raise a bug
+	 * since a part of the kernel would not get mapped.
+	 */
+	BUG_ON(PUD_SIZE - (kernel_map.virt_addr & (PUD_SIZE - 1)) < kernel_map.size);
+	relocate_kernel();
+#endif
+
 	apply_early_boot_alternatives();
 	pt_ops_set_early();
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
