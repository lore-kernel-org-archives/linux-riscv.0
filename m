Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD458C87FCE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 23:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zMHwofonFn5iCcQw3MRMVWnFefNBkcHr6dMVGrXOLEc=; b=AXM2qOFS72XN+W
	gv0xdYPbtoylgreB46L9fwF2hxWv/wj8aEoNJjtTZozQ/HzykZ4hr7fTtyu1jWfwS7PjN3XpkWhw5
	nzcw2Q4SIsnsz9V9p9bFudxT09+XqkAFE7Pi5nIGb2VeuTTNQHgBWhqqGZYorCG9d8C03XsJIDDLN
	BF8bpQHhYqwZj7pwRZjkVRWQMr5irTZCY5QHfmvcRV+n7dqRVg53hCyTBGXE8/s+UZcKrthkoW8OX
	O4XyG2jwF0ECu+DVWQM9e9o8INtUq2QhGjoZIedNAk/qlh+DzfKpcWvKv+VMCZDGTbhkcCLCh6Fo7
	4blSYnr0SKbh1gAFIgkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5f7-00000008iDb-0ukA;
	Thu, 24 Jul 2025 23:47:45 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5V6-00000008h2x-1QXC
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 23:37:25 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2349f096605so17993275ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 16:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400243; x=1754005043; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pn/2JSdO71rXzNO2stWjtKSzEMWnL5mCAakTnDwVXrM=;
        b=bk5k2aMSaKaA8RrWVHgLCZJmPXeqR459fwO9BZqC1liZJJoMMfx9aI7VCK44jGaCY/
         Dk7L03SaKgbGNXPnmKjtfb9sl9T7XHGsqxoAykEnDSO8or5Q1g9Qq2P9xF4zMm7dmO9D
         6X6oEUUlKTiwLr1niyD2+UfKvL26t2S9lBodgB3mTg5c8FqG+S4ih1h26zad+K/vxat/
         nR+LH+D1diyf5RUPDdj9tI76NzLx52EgGvTkskc595NrqYqseNdDRCfuzZjpf/KkpTN8
         czdFNieorisgOcJzSVewU4r/TvA9LW64Gp87OK6aqwj0Q0e+UURAdczIk2sZ7lecJgSe
         6c9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400243; x=1754005043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pn/2JSdO71rXzNO2stWjtKSzEMWnL5mCAakTnDwVXrM=;
        b=cwQA/L5zaXq83FEjgNjplpxxn4VZCFvqprDKRzcNj1xHjlEXGPd5xlnO6cdmGokgLZ
         peYYxu7tvyEXpMVpqjgcsrVaUAiuZ//dLTdXFcVriEF/rXNPbpEbn9htlOAxkKhx18SE
         e1j6lrs4JJbzr8CQGDj5S+wTUHNUWYxmfn8LDCPHLESraHLOl4yty1hcWN13MX/td5Hc
         cHP9F2Q9TtCt8kE3sAwB4D9VmbY0Hq7FPongxCJiSh6evpkPmAPV8/zCT7MD2MyVebyC
         2DAYboxJQuUhrvIwt6NzTQzbjFyyhRfoVZkthp3d8c9hLN8pqbljYs7H4yF1sASPsxsB
         vruA==
X-Gm-Message-State: AOJu0Yz2HSD3vpXRVSpKhejNlkoCdW5cnz4IEeXu/g51j9z1HbPJ8cT1
	rBi+yrTNCPSaPekiYfSByeUVt//LCYa9lsq9RGH5Bxv54lvI3yyNaP0pv9Q8bQGP3GA=
X-Gm-Gg: ASbGncuGYu9I4oYxSj+h2uKd7C/kZpJNYOvAXlVBFcgJV7262n+jg2mKutQvHm4JjzS
	9pU68IMJJXldmcSCGsnypr6fO3/t5vjKhxwkirb+KQDztmU6kRVv0iudunK17ucSpc5n/Ns1+/h
	l15LlFBjK9dzq8V9Ddrq8rq7Qca8kHnOj2/iif1IhLzPXVZma3IrciNEgS5SQKuvU+Mld7GRoYy
	sk1rwu0C4D9EQFYm4M2lIlkxJ/yYvzPn+n31OWLiEC4Hpg5T5Mp3Oi7Y1ykkzEJUqxsuxMZZDIf
	F++b0NLLHtAAMvPCybuwAqg/8AsgWMhO4tj6wFR9yBXAXhREBBuTfYv/COu0euYibOhA8g3DbuP
	CDg1Qnf+a846DAy5Hwd3W1VwrU7y9ZA+O
X-Google-Smtp-Source: AGHT+IG/G30hZbdmg+vYLTFJ4nOwJXxTBe4ZWwYMeNmIug6yYy0RZhNu1ZgYT+kQPlkJisfs0XgYFA==
X-Received: by 2002:a17:902:e54e:b0:235:ea29:28e9 with SMTP id d9443c01a7336-23f981b0a15mr141134525ad.38.1753400243473;
        Thu, 24 Jul 2025 16:37:23 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:23 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:37:01 -0700
Subject: [PATCH 08/11] riscv/mm: prepare shadow stack for init task
MIME-Version: 1.0
Message-Id: <20250724-riscv_kcfi-v1-8-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_163724_382119_D9D5C6E9 
X-CRM114-Status: GOOD (  14.54  )
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

With CONFIG_SHADOW_CALL_STACK, shadow call stack goes into data section.
CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK indicates hardware assisted shadow
stack are used. Hardware assisted shadow stack on riscv uses PTE.R=0, PTE.W=1
& PTE.X=0 encodings. Without CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK, shadow stack
for init is placed in data section and thus regular read/write encodings are
applied to it. Although with CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK, they need to
go into different section. This change places it into `.shadowstack` section.
As part of this change early boot code (`setup_vm`), applies appropriate
PTE encodings to shadow call stack for init placed in `.shadowstack`
section.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h     |  4 ++++
 arch/riscv/include/asm/sections.h    | 22 ++++++++++++++++++++++
 arch/riscv/include/asm/thread_info.h | 10 ++++++++--
 arch/riscv/kernel/vmlinux.lds.S      | 12 ++++++++++++
 arch/riscv/mm/init.c                 | 29 ++++++++++++++++++++++-------
 5 files changed, 68 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index f04f3da881c9..bb80667d3c13 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -202,6 +202,10 @@ extern struct pt_alloc_ops pt_ops __meminitdata;
 #define PAGE_KERNEL_READ_EXEC	__pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
 					 | _PAGE_EXEC)
 
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+#define PAGE_KERNEL_SHADOWSTACK __pgprot(_PAGE_KERNEL & ~(_PAGE_READ | _PAGE_EXEC))
+#endif
+
 #define PAGE_TABLE		__pgprot(_PAGE_TABLE)
 
 #define _PAGE_IOREMAP	((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
index a393d5035c54..ae7c6fcbaaeb 100644
--- a/arch/riscv/include/asm/sections.h
+++ b/arch/riscv/include/asm/sections.h
@@ -14,6 +14,10 @@ extern char __init_data_begin[], __init_data_end[];
 extern char __init_text_begin[], __init_text_end[];
 extern char __alt_start[], __alt_end[];
 extern char __exittext_begin[], __exittext_end[];
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+extern char __init_shstk_start[], __init_shstk_end[];
+#endif
+extern char __end_srodata[];
 
 static inline bool is_va_kernel_text(uintptr_t va)
 {
@@ -31,4 +35,22 @@ static inline bool is_va_kernel_lm_alias_text(uintptr_t va)
 	return va >= start && va < end;
 }
 
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+static inline bool is_va_init_shadow_stack_early(uintptr_t va)
+{
+	uintptr_t start = (uintptr_t)(kernel_mapping_pa_to_va(__init_shstk_start));
+	uintptr_t end = (uintptr_t)(kernel_mapping_pa_to_va(__init_shstk_end));
+
+	return va >= start && va < end;
+}
+
+static inline bool is_va_init_shadow_stack(uintptr_t va)
+{
+	uintptr_t start = (uintptr_t)(__init_shstk_start);
+	uintptr_t end = (uintptr_t)(__init_shstk_end);
+
+	return va >= start && va < end;
+}
+#endif
+
 #endif /* __ASM_SECTIONS_H */
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index e066f41176ca..5bcc62cf5a0a 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -79,12 +79,18 @@ struct thread_info {
 };
 
 #ifdef CONFIG_SHADOW_CALL_STACK
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
 #define INIT_SCS							\
-	.scs_base	= init_shadow_call_stack,			\
+	.scs_base	= init_shadow_call_stack,	\
+	.scs_sp		= &init_shadow_call_stack[SCS_SIZE / sizeof(long)],
+#else
+#define INIT_SCS							\
+	.scs_base	= init_shadow_call_stack,	\
 	.scs_sp		= init_shadow_call_stack,
+#endif /* CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK */
 #else
 #define INIT_SCS
-#endif
+#endif /* CONFIG_SHADOW_CALL_STACK */
 
 /*
  * macros/functions for gaining access to the thread information structure
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 61bd5ba6680a..e65c0c099ed0 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -129,6 +129,18 @@ SECTIONS
 		*(.srodata*)
 	}
 
+	. = ALIGN(SECTION_ALIGN);
+	__end_srodata = .;
+
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	.shadowstack : AT(ADDR(.shadowstack) - LOAD_OFFSET){
+		__init_shstk_start = .;
+		KEEP(*(.shadowstack..init))
+		. = __init_shstk_start + PAGE_SIZE;
+		__init_shstk_end = .;
+	}
+#endif
+
 	. = ALIGN(SECTION_ALIGN);
 	_data = .;
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 1af3c0bc6abe..dba1cf3f8dfc 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -794,14 +794,22 @@ static __meminit pgprot_t pgprot_from_va(uintptr_t va)
 	if (IS_ENABLED(CONFIG_64BIT) && is_va_kernel_lm_alias_text(va))
 		return PAGE_KERNEL_READ;
 
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	/* If init task's shadow stack va, return write only page protections */
+	if (IS_ENABLED(CONFIG_64BIT) && is_va_init_shadow_stack(va)) {
+		pr_info("Shadow stack protections are being applied to for init\n");
+		return PAGE_KERNEL_SHADOWSTACK;
+	}
+#endif
+
 	return PAGE_KERNEL;
 }
 
 void mark_rodata_ro(void)
 {
-	set_kernel_memory(__start_rodata, _data, set_memory_ro);
+	set_kernel_memory(__start_rodata, __end_srodata, set_memory_ro);
 	if (IS_ENABLED(CONFIG_64BIT))
-		set_kernel_memory(lm_alias(__start_rodata), lm_alias(_data),
+		set_kernel_memory(lm_alias(__start_rodata), lm_alias(__end_srodata),
 				  set_memory_ro);
 }
 #else
@@ -959,14 +967,21 @@ static void __init create_kernel_page_table(pgd_t *pgdir,
 static void __init create_kernel_page_table(pgd_t *pgdir, bool early)
 {
 	uintptr_t va, end_va;
+	pgprot_t prot;
 
 	end_va = kernel_map.virt_addr + kernel_map.size;
-	for (va = kernel_map.virt_addr; va < end_va; va += PMD_SIZE)
+	for (va = kernel_map.virt_addr; va < end_va; va += PMD_SIZE) {
+		prot = PAGE_KERNEL_EXEC;
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+		if (early && is_va_init_shadow_stack_early(va))
+			prot = PAGE_KERNEL_SHADOWSTACK;
+#endif
 		create_pgd_mapping(pgdir, va,
-				   kernel_map.phys_addr + (va - kernel_map.virt_addr),
-				   PMD_SIZE,
-				   early ?
-					PAGE_KERNEL_EXEC : pgprot_from_va(va));
+					kernel_map.phys_addr + (va - kernel_map.virt_addr),
+					PMD_SIZE,
+					early ?
+					prot : pgprot_from_va(va));
+	}
 }
 #endif
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
