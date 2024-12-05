Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9C4E7716C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6gwxxFJCUUFcBwPmDGlyt9urE02ylYcHGUrtfabC3o=; b=m1z974OSvtGFZh
	ANku8t9DdM57Hp/BrfoJLEljepMISTGzLWPGOo704IxGGuV7TmNYHsUl4Ki93oDoDvs9ylCLr5NGY
	M+P1Vp8OvQg3roF8jyNkrJSNBoiP9UoTJwqTSOG2Uw8jzDxAyPBWI8nvJDLorOX5WWQBGdkd6BMkv
	iKvsdcCXd/ZASaz7TEBe0zvw1DJRSW6+dDRzhupnXf9px6AKaXgntM3AMzmvLItB8Ux0s4G+GoxBK
	CwasgTxsboSnx8ao/zCSUQ2oObZx6FT2XLNHfmyIWPOMpxc+7zGHaSzvNjkCsbIhtFkis5mIW1LWB
	u68Cmey4JnVrcEYKaqhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9M3-0000000FakS-3NDI;
	Thu, 05 Dec 2024 10:45:07 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9G8-0000000FYT9-393W
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:39:01 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7ee51d9ae30so516912a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395140; x=1733999940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HKGaUSlXgW0yAKeFS5JtDgO8P73Aga3Eke367yRUOM=;
        b=h7wMj4ZprgLG5Y2UyryzuHrT8uVQe6PY2wgeYifmwozN8175dSHsRLFo6jsQW6uIR0
         f1XcC9sy167mdTd/yRytdNNcjz11lX7qQEH0BznCkpB+rO8jj4OPWqI2P4EuhVO+Figb
         TM/4xgKTWVYSk/EL8v9vax+xMhq57r5Lu+YqheP1rVYVVp82DNTlK7Lv1cF2zrcdtOZy
         OpMFvg6WmWErPWEUzRp0vcMpFD1hExYgXEF1mDT1pfKQCIJ84866AyQ1nOWC1SeAET5H
         fSJRoqHKhnv3ckJs3WEbbfa38Q27hlkvxTZcqTKYIUMs89nip808fmLMaldeCXy36yuF
         znvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395140; x=1733999940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HKGaUSlXgW0yAKeFS5JtDgO8P73Aga3Eke367yRUOM=;
        b=rHCn0+DviaHm4abesaVjTKjkVmrIojKsAbqDKUg3Lj2c36ZYR7rFX73+o6ED0pj95t
         +T/wd0k3MZiyD+33LZlMwO5Lr/jgw+EqR3nZv6c5Y8FlqI5suvOsFUkYxchBe0qAy2tq
         y9tJldTmAFN38KQ2fyr5najcWVz0gf5EEyukUh19N649tbMVShVbRPq6BKgmyOgQUEOY
         vnI1akYGnXdvmDDnqdw2yJXTSb1WPjiyIiEYgGGkhcJTRjuEFKdCviqtJ/0KRbGdUaxf
         qSIeEcjkzfib78N5g8O4lMlZiuJvIfA/WLikcKgO9vZmm3Svd1ZI4GSqktMavNQA+6uZ
         Xhig==
X-Forwarded-Encrypted: i=1; AJvYcCXkKGkvwowlSz05/VIJ76kkO1RczBnNzBJ2NaMrgnnC6Ot/C0RBBc9lGAkgrAqG5VwpeX0DMaL/4zyPAw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5gDRk6yW3a1UQ7FU0jJc1DwLvfOH9YVkxT1QoNIT07BZFuyn9
	IRT2Rk+j774Pos4het2HU6+FljPKBmnQbGuuY6XvFZ730uARERnBRo5/nAfgkPY=
X-Gm-Gg: ASbGnctTv07pC23n9eXs3m+21SUpvWDjRabYm4fB0xwe7IvYF53w2iTByIwfh6UYBy6
	E1qYihMRnZDu7037QYQqCdZMZlzbIJB4RSX9GhVftbYDdsleOp1M/nPQ3qk9bba9JUTYYuOnR/O
	iy8uUm5fyWtYzb+K0nq+iyHL5a7ZLfmS/GHrNtdFsYMeFy6QuNdo8HmjM7clgJ5MyOaB98jKCEb
	iFFh3IiuHj18NXpsAQ5inXecK/gg26SdWAS8cYpB8Y1ftg9wqxAJExlxINyt/y34FDhHE5n/Kx2
	DmQCVsduB5T69A6EQkywVmcKoeFSn5PQ
X-Google-Smtp-Source: AGHT+IENYN2wIy2LzaSrsQXEce8aC4H6FioafWLUrw0utp3p27SZ8r2YKo2I/DuxTOOKoa8IMLVh9Q==
X-Received: by 2002:a05:6a21:78a6:b0:1e0:d60c:3f49 with SMTP id adf61e73a8af0-1e165413484mr13667504637.43.1733395140137;
        Thu, 05 Dec 2024 02:39:00 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.38.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:38:59 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 20/21] riscv: mm: Adjust address space layout and init page table for 64K Page
Date: Thu,  5 Dec 2024 18:37:28 +0800
Message-Id: <20241205103729.14798-21-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023900_786006_98EABFCF 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/page.h    |  6 +++++-
 arch/riscv/include/asm/pgtable.h | 12 +++++++++++
 arch/riscv/mm/init.c             | 36 +++++++++++++++++++++++---------
 3 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 9bc908d94c7a..236b0106a1c9 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -40,8 +40,12 @@
  * By default, CONFIG_PAGE_OFFSET value corresponds to SV57 address space so
  * define the PAGE_OFFSET value for SV48 and SV39.
  */
+#ifdef CONFIG_RISCV_64K_PAGES
+#define PAGE_OFFSET_L4		_AC(0xffffa80000000000, UL)
+#else
 #define PAGE_OFFSET_L4		_AC(0xffffaf8000000000, UL)
-#define PAGE_OFFSET_L3		_AC(0xffffffd600000000, UL)
+#endif /* CONFIG_RISCV_64K_PAGES */
+#define PAGE_OFFSET_L3		_AC(0xffffffd800000000, UL)
 #else
 #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
 #endif /* CONFIG_64BIT */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 9f347e5eefeb..fbc397c4e1c8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -147,6 +147,18 @@ static inline unsigned long __page_val_to_pfn(unsigned long val);
 #include <asm/pgtable-32.h>
 #endif /* CONFIG_64BIT */
 
+#define __PMD_SHIFT	(PMD_SHIFT - (PAGE_SHIFT - HW_PAGE_SHIFT))
+#define __PMD_SIZE	(_AC(1, UL) << __PMD_SHIFT)
+
+#define __PUD_SHIFT	(PUD_SHIFT - (PAGE_SHIFT - HW_PAGE_SHIFT))
+#define __PUD_SIZE	(_AC(1, UL) << __PUD_SHIFT)
+
+#define __P4D_SHIFT	(P4D_SHIFT - (PAGE_SHIFT - HW_PAGE_SHIFT))
+#define __P4D_SIZE	(_AC(1, UL) << __P4D_SHIFT)
+
+#define __PGD_SHIFT	(PGD_SHIFT - (PAGE_SHIFT - HW_PAGE_SHIFT))
+#define __PGD_SIZE	(_AC(1, UL) << __PGD_SHIFT)
+
 #include <linux/page_table_check.h>
 
 #ifdef CONFIG_XIP_KERNEL
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 678b892b4ed8..2c6b7ea33009 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -695,15 +695,15 @@ static uintptr_t __meminit best_map_size(phys_addr_t pa, uintptr_t va, phys_addr
 		return PAGE_SIZE;
 
 	if (pgtable_l5_enabled &&
-	    !(pa & (P4D_SIZE - 1)) && !(va & (P4D_SIZE - 1)) && size >= P4D_SIZE)
+	    !(pa & (__P4D_SIZE - 1)) && !(va & (P4D_SIZE - 1)) && size >= P4D_SIZE)
 		return P4D_SIZE;
 
 	if (pgtable_l4_enabled &&
-	    !(pa & (PUD_SIZE - 1)) && !(va & (PUD_SIZE - 1)) && size >= PUD_SIZE)
+	    !(pa & (__PUD_SIZE - 1)) && !(va & (PUD_SIZE - 1)) && size >= PUD_SIZE)
 		return PUD_SIZE;
 
 	if (IS_ENABLED(CONFIG_64BIT) &&
-	    !(pa & (PMD_SIZE - 1)) && !(va & (PMD_SIZE - 1)) && size >= PMD_SIZE)
+	    !(pa & (__PMD_SIZE - 1)) && !(va & (PMD_SIZE - 1)) && size >= PMD_SIZE)
 		return PMD_SIZE;
 
 	return PAGE_SIZE;
@@ -937,17 +937,33 @@ static void __init create_kernel_page_table(pgd_t *pgdir,
 				   PMD_SIZE, PAGE_KERNEL);
 }
 #else
+
+#ifdef CONFIG_RISCV_64K_PAGES
+/* TODO: better implementation */
+#define KERNEL_MAP_STEP			PAGE_SIZE
+#else
+#define KERNEL_MAP_STEP			PMD_SIZE
+#endif
+
 static void __init create_kernel_page_table(pgd_t *pgdir, bool early)
 {
 	uintptr_t va, end_va;
 
 	end_va = kernel_map.virt_addr + kernel_map.size;
-	for (va = kernel_map.virt_addr; va < end_va; va += PMD_SIZE)
-		create_pgd_mapping(pgdir, va,
-				   kernel_map.phys_addr + (va - kernel_map.virt_addr),
-				   PMD_SIZE,
-				   early ?
-					PAGE_KERNEL_EXEC : pgprot_from_va(va));
+	if (early)
+		for (va = kernel_map.virt_addr; va < end_va; va += PMD_SIZE)
+			create_pgd_mapping(pgdir, va,
+					   kernel_map.phys_addr + (va - kernel_map.virt_addr),
+					   PMD_SIZE,
+					   early ?
+						PAGE_KERNEL_EXEC : pgprot_from_va(va));
+	else
+		for (va = kernel_map.virt_addr; va < end_va; va += KERNEL_MAP_STEP)
+			create_pgd_mapping(pgdir, va,
+					   kernel_map.phys_addr + (va - kernel_map.virt_addr),
+					   KERNEL_MAP_STEP,
+					   early ?
+						PAGE_KERNEL_EXEC : pgprot_from_va(va));
 }
 #endif
 
@@ -1138,7 +1154,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 
 	/* Sanity check alignment and size */
 	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
-	BUG_ON((kernel_map.phys_addr % PMD_SIZE) != 0);
+	BUG_ON((kernel_map.phys_addr % __PMD_SIZE) != 0);
 
 #ifdef CONFIG_64BIT
 	/*
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
