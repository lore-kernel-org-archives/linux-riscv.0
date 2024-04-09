Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D84CC67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 06:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znBGb8gAwA9JV0QxU1T54yWeuxQvH0s/GsEz3+SABUA=; b=wmU4r6t63fCTxm
	YfzmZh5djlaoR7BugVn4XnGkv04YeHTc2RTPyg3tHdWeiBha6V6VeZuG4xvqAy5xAfkpODMOLbNg+
	uJnqDl9BZFxpq+9P2HbP77lR5/B0xmz3rZ8de20vCMty56x966ODStCfRxzu18TeuI6quqHtPBzMY
	iEEAliPDt47QWQs3KkH2fYRrEw8UGInggUoK7QE6CR7jBLtmdmikvoT1qiVVRyhnsRP3NbwU+O+kx
	+OJ4bOA03GHWZPBK78eCvuJlNs6W9piaw8AYl/WbeoPK5RZZPDY7oQ8bFebM5vPVcp6SDrM/v5OQc
	1UX5eNWCiopASVin2H1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4ij-00000000WAe-1UTC;
	Tue, 09 Apr 2024 06:12:37 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iM-00000000VpS-1qD4
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 06:12:18 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e3e56c9d2cso20886225ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 23:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643131; x=1713247931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNY0RFhYm6lPg3oBhR3wmdSfV39szkEasZZOlUo5Gu4=;
        b=BnB+OIrXabE2rh8D9iyoIg5TSTJDHSAOfpDvQ9Pxm4n+FqsLHcWSk93iZXPj5+aBbU
         Pn8vytxdE+yNHt9mJy+sUSq+h1ozhdLa7KRIW33nPnxeRTKTJJiEwYqTlsxW5mPpKcF+
         s3arE92xbrYyOMIGw6CZ6Fn4jl0Y6a6QsaN/V/xVwA4BxNzRpfRmXHZmgCJ4jWYBOeJE
         fmshxf8E8oEo9yGMCJFUOgmhIZ7xClCNHgAl5IbQHCnnEdzAAK1Q6plGMIw/1JpnyOzo
         fv5Yp8QBC7Gf1dZKM5wCBQWxXczjuReCIsFPxYhN1Ey1L4YZEH+6bPb7tc6NAVm6XILP
         3OdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643131; x=1713247931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wNY0RFhYm6lPg3oBhR3wmdSfV39szkEasZZOlUo5Gu4=;
        b=dCcGtqoI5lQtje16LNGsMIzY/HdeclXXwcuIClNrB1eSmCOM00XShQbt4sAzJJ7ojw
         sXJO6tkcBJDrk8pLQK9lX/+YY+x02mMxZVPGZnmYZx7KiRZFmKXBTcDwQqRknX+yf5Mb
         OGF4RMQO5FhWKwMufCCG4Yivtk0zV3MbImA84hmf7Abz4t17vKk+7itFKS5paFFtUZwo
         027PP76wXO3bwq9+HN56c5VYLxJmx0Zj/dTSYpS5wbRCoTExeoM9ZCznuPtjkKQtd3Co
         RwfGNLByTWBzS/Ln0q7Lp2OFsbxJtgwlHdEwkSAmca5kOfWabZgSPsER0C2LYTBLSrtD
         Zd/g==
X-Gm-Message-State: AOJu0YwAXNjd3lMaC8sdkfmc0HSbLYoRSPEY+8Mx0/WqFl1mpEhReGgx
	GdLewO7jjO+UaqgslSZBIwQF4zsEivw7u7+GPQdITm9KD+xmyfou9VbfV1EwIIPjqhsnykNtHHv
	5
X-Google-Smtp-Source: AGHT+IFZDIZkA5N71LX8YU8JB8f+xPvbHs9xL8jZhoQEYjrihrilZVPxCloqSIoWg5GmlNSe0WLS6g==
X-Received: by 2002:a17:903:40d2:b0:1e2:9676:c326 with SMTP id t18-20020a17090340d200b001e29676c326mr15385084pld.29.1712643131586;
        Mon, 08 Apr 2024 23:12:11 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:11 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH 07/12] riscv/mm: prepare shadow stack for init task for kernel cfi
Date: Mon,  8 Apr 2024 23:10:38 -0700
Message-Id: <20240409061043.3269676-8-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_231215_529510_A30A71F8 
X-CRM114-Status: GOOD (  14.62  )
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

Under CONFIG_SHADOW_CALL_STACK, shadow call stack goes into data section.
Although with CONFIG_DYNAMIC_SCS on riscv, hardware assisted shadow stack
are used. Hardware assisted shadow stack on riscv uses PTE.R=0, PTE.W=1 &
PTE.X=0 encodings. Without CONFIG_DYNAMIC_SCS, shadow stack for init is
placed in data section and thus regular read/write encodings are applied
to it. Although with with CONFIG_DYNAMIC_SCS, they need to go into
different section. This change places it into `.shadowstack` section.
As part of this change early boot code (`setup_vm`), applies appropriate
PTE encodings to shadow call stack for init placed in `.shadowstack`
section.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h     |  4 ++++
 arch/riscv/include/asm/sections.h    | 22 +++++++++++++++++++++
 arch/riscv/include/asm/thread_info.h | 10 ++++++++--
 arch/riscv/kernel/vmlinux.lds.S      | 12 ++++++++++++
 arch/riscv/mm/init.c                 | 29 +++++++++++++++++++++-------
 5 files changed, 68 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 9f8ea0e33eb1..3409b250390d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -197,6 +197,10 @@ extern struct pt_alloc_ops pt_ops __initdata;
 #define PAGE_KERNEL_READ_EXEC	__pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
 					 | _PAGE_EXEC)
 
+#ifdef CONFIG_DYNAMIC_SCS
+#define PAGE_KERNEL_SHADOWSTACK __pgprot(_PAGE_KERNEL & ~(_PAGE_READ | _PAGE_EXEC))
+#endif
+
 #define PAGE_TABLE		__pgprot(_PAGE_TABLE)
 
 #define _PAGE_IOREMAP	((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
index a393d5035c54..4c4154d0021e 100644
--- a/arch/riscv/include/asm/sections.h
+++ b/arch/riscv/include/asm/sections.h
@@ -14,6 +14,10 @@ extern char __init_data_begin[], __init_data_end[];
 extern char __init_text_begin[], __init_text_end[];
 extern char __alt_start[], __alt_end[];
 extern char __exittext_begin[], __exittext_end[];
+#ifdef CONFIG_DYNAMIC_SCS
+extern char __init_shstk_start[], __init_shstk_end[];
+#endif
+extern char __end_srodata[];
 
 static inline bool is_va_kernel_text(uintptr_t va)
 {
@@ -31,4 +35,22 @@ static inline bool is_va_kernel_lm_alias_text(uintptr_t va)
 	return va >= start && va < end;
 }
 
+#ifdef CONFIG_DYNAMIC_SCS
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
index 5d473343634b..7ae28d627f84 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -63,12 +63,18 @@ struct thread_info {
 };
 
 #ifdef CONFIG_SHADOW_CALL_STACK
+#ifdef CONFIG_DYNAMIC_SCS
 #define INIT_SCS							\
-	.scs_base	= init_shadow_call_stack,			\
+	.scs_base	= init_shadow_call_stack,	\
+	.scs_sp		= &init_shadow_call_stack[SCS_SIZE / sizeof(long)],
+#else
+#define INIT_SCS							\
+	.scs_base	= init_shadow_call_stack,	\
 	.scs_sp		= init_shadow_call_stack,
+#endif /* CONFIG_DYNAMIC_SCS */
 #else
 #define INIT_SCS
-#endif
+#endif /* CONFIG_SHADOW_CALL_STACK */
 
 /*
  * macros/functions for gaining access to the thread information structure
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 002ca58dd998..cccc51f845ab 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -126,6 +126,18 @@ SECTIONS
 		*(.srodata*)
 	}
 
+	. = ALIGN(SECTION_ALIGN);
+	__end_srodata = .;
+
+#ifdef CONFIG_DYNAMIC_SCS
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
index fe8e159394d8..5b6f0cfa5719 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -713,14 +713,22 @@ static __init pgprot_t pgprot_from_va(uintptr_t va)
 	if (IS_ENABLED(CONFIG_64BIT) && is_va_kernel_lm_alias_text(va))
 		return PAGE_KERNEL_READ;
 
+#ifdef CONFIG_DYNAMIC_SCS
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
@@ -913,14 +921,21 @@ static void __init create_kernel_page_table(pgd_t *pgdir,
 static void __init create_kernel_page_table(pgd_t *pgdir, bool early)
 {
 	uintptr_t va, end_va;
+	pgprot_t prot;
 
 	end_va = kernel_map.virt_addr + kernel_map.size;
-	for (va = kernel_map.virt_addr; va < end_va; va += PMD_SIZE)
+	for (va = kernel_map.virt_addr; va < end_va; va += PMD_SIZE) {
+		prot = PAGE_KERNEL_EXEC;
+#ifdef CONFIG_DYNAMIC_SCS
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
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
