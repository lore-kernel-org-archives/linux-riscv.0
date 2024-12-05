Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FF4E77177
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jo97bj+gMvLiVCussfpn7l8dgH80Y5ojBs0WObAMwII=; b=AQ9gvfJGZZEkkA
	3v8+ZDqKu5OGGSBLrbqsiMZ9QAtpqYUPpOBJDheCnrA+/67IQYJKVZa0Zp+XNuksGqY/jnrNocYVw
	EV7VLxllGXVMGX7vAlFPs12OZDxER3b7qki9bRPBEPSPdwA7wnU4/IozpSwGfaSPjMCYnJrngQ9al
	jf4O2Mo0VS2W4txr0waMnq7oa9kkFqjRRrUwlx7wUEcul7gUu6gGJLx2amt89SaEskeOo2dY7dDCu
	0+BjrLa5J+AdsEWR6bF5qSdDCvzVbKbrKehhItJUeDdmfQU3aaxNae0L07oCkCM2xFEFx2GGnUTZF
	DnLUoqMvnwSwty4h2ZvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Lt-0000000FaTi-3uW0;
	Thu, 05 Dec 2024 10:44:57 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Fc-0000000FYEl-1Brh
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:38:29 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7fbd9be84bdso709414a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395108; x=1733999908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFQIXohFMC+aCLCj7cIVe0JD4G758F8Hwu3svQYABEY=;
        b=Kez6TqyAN2R+7ox2x5Svoded4boLTxI9+FQS1zzxYec0KceaDPwn8T22ueNuzZru6d
         ootlnPW91GBTtkmcnfNzSKihebTfaG82CZ+FZGrLP61nVJEN9aD5xA9qISJ1goz3Hjl1
         Z8Chf/sOXfZ+tEqmwSOlfPIP4W6J1BP3c7qiwXVY5gXapGbzFQMIitJKOz71xaIfsNG5
         de0izF1d+5/8tWpOVF/gTngM1ulDnJ0j50l4fqcjVmlcko1W3HMHan/mWbuGMPZahEkV
         vs7jYkHUh8KE14GI0VrFIpGiWmHxw7Nbiw07BLpM1Mae2VJjZp8Yikq6TYWCCYy2107l
         auRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395108; x=1733999908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFQIXohFMC+aCLCj7cIVe0JD4G758F8Hwu3svQYABEY=;
        b=q7xf3ueQIF7Y9d1msnjtMaky7Gk1rXTada/bcRPaVMaC3Lny7NkYGzjtRz7/Y2XhcZ
         CQljAmXXFesPqpjlwFpCDeBO4GmQe96zWQJ4JciJn80u8CJOhXZ3mC8hEI+GLnAwrFmX
         HhSnvzKP3NDRR/eCCskI8Yq7p/xzYdgDcw4hQwS5som0PtK/y5MgMZIaxDI2cw3uAuAk
         iGFdoVjT10vOxl2xw2A3+3hGmVN3IWVDY/h+O+ZsxTMV2aQ+z/0gca8cXq75R/1JPyZT
         U0owkzTap23P+Cjb6rwKd2l/DrcvSM+H8DSnmWn05UQL5Nur0de1dQd80n2uZjRvx9au
         ci9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVW2nt6Xf69KTbzmbN9kG2JVD7k6k+EaQHPnu0XchTlS+1uyahV6fTIeFMh8cBLqKYY31XWESrm3SG5lA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAKL4X5mWOV2sQJ5xxHu0WqNgleGVqSCfWBOahISL3f/P726wF
	yDPooMN7MRt4nmQ8FrPD+vWl1qUmi4j/BrAh06KQOGFoul1tVnNSOzolwe0rwMo=
X-Gm-Gg: ASbGncsKYl733jEBZ4lb8K2qQlSk+b6xIHDmEKi/JZV1DmHoFDtfQZmrCO5LZ+pjqm0
	6dhxrBY+Xu8UzTD4Pn4vcW8rEu5UCa/C18O+UGFgew1k/UQrFcQUB91IHqQ99Z4frFxjb0kuJME
	AfShcbNjoAoIBFJwruRwQrjBqM0T8GiosVQcb7A8jGZCceKrz7ri+y6snlu6YNESqvfp/u4k24Z
	S7/FVwsXIW77OmqDRPMixFpcm1W/KoZAYhFhB01fKCIyKvaW+737e5gP/RH8xVhgZbtbBECBxwM
	vl9+l6DqWdfX/wsRX5G4TU8r9spQqvPg
X-Google-Smtp-Source: AGHT+IEVSD+tgAqJx2WiLXY6iHldH8R0b3LHGoJ+robZaZ03Gbz5dxvb2ZG0GtuQ60x2xrNdVJqFOw==
X-Received: by 2002:a05:6300:4041:b0:1e1:1659:82a4 with SMTP id adf61e73a8af0-1e16541341fmr16353259637.41.1733395107751;
        Thu, 05 Dec 2024 02:38:27 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.38.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:38:27 -0800 (PST)
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
Subject: [RFC PATCH v2 12/21] riscv: mm: Reimplement tlb flush function
Date: Thu,  5 Dec 2024 18:37:20 +0800
Message-Id: <20241205103729.14798-13-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023828_323714_A94B0D69 
X-CRM114-Status: GOOD (  15.20  )
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

When tlb flushing a page correponding to a certain address, CPU actually
only flushes tlb entries of the first 4K hardware page. This commit
reimplements tlb flushing function to flush all tlb entries of hardware pages
in the same software page.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h  |  9 ++++++---
 arch/riscv/include/asm/tlbflush.h | 26 ++++++++++++++++++++------
 arch/riscv/mm/fault.c             | 13 +++++++++----
 arch/riscv/mm/init.c              |  2 +-
 arch/riscv/mm/tlbflush.c          | 31 +++++++++++++++++++++----------
 5 files changed, 57 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index c0f7442c8a9e..9fa16c0c20aa 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -701,7 +701,7 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
 	 */
 	while (nr--)
-		local_flush_tlb_page(address + nr * PAGE_SIZE);
+		local_flush_tlb_page(address + nr * PAGE_SIZE, PAGE_SIZE);
 
 svvptc:;
 	/*
@@ -719,9 +719,12 @@ svvptc:;
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp)
 {
-	pte_t *ptep = (pte_t *)pmdp;
+	asm goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA_EXT_SVVPTC, 1)
+		 : : : : svvptc);
 
-	update_mmu_cache(vma, address, ptep);
+	local_flush_tlb_page(address, PMD_SIZE);
+
+svvptc:;
 }
 
 #define __HAVE_ARCH_PTE_SAME
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 72e559934952..25cc39ab84d5 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -29,18 +29,32 @@ static inline void local_flush_tlb_all_asid(unsigned long asid)
 }
 
 /* Flush one page from local TLB */
-static inline void local_flush_tlb_page(unsigned long addr)
+static inline void local_flush_tlb_page(unsigned long addr,
+					unsigned long page_size)
 {
-	ALT_SFENCE_VMA_ADDR(addr);
+	unsigned int i;
+	unsigned long hw_page_num = 1 << (PAGE_SHIFT - HW_PAGE_SHIFT);
+	unsigned long hw_page_size = page_size >> (PAGE_SHIFT - HW_PAGE_SHIFT);
+
+	for (i = 0; i < hw_page_num; i++, addr += hw_page_size)
+		ALT_SFENCE_VMA_ADDR(addr);
 }
 
 static inline void local_flush_tlb_page_asid(unsigned long addr,
+					     unsigned long page_size,
 					     unsigned long asid)
 {
-	if (asid != FLUSH_TLB_NO_ASID)
-		ALT_SFENCE_VMA_ADDR_ASID(addr, asid);
-	else
-		local_flush_tlb_page(addr);
+	unsigned int i;
+	unsigned long hw_page_num, hw_page_size;
+
+	if (asid != FLUSH_TLB_NO_ASID) {
+		hw_page_num = 1 << (PAGE_SHIFT - HW_PAGE_SHIFT);
+		hw_page_size = page_size >> (PAGE_SHIFT - HW_PAGE_SHIFT);
+
+		for (i = 0; i < hw_page_num; i++, addr += hw_page_size)
+			ALT_SFENCE_VMA_ADDR_ASID(addr, asid);
+	} else
+		local_flush_tlb_page(addr, page_size);
 }
 
 void flush_tlb_all(void);
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 4772152be0f9..94524e5adc0b 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -118,7 +118,7 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
 	pmd_t *pmd_k;
 	pte_t *pte_k;
 	int index;
-	unsigned long pfn;
+	unsigned long pfn, page_size;
 
 	/* User mode accesses just cause a SIGSEGV */
 	if (user_mode(regs))
@@ -154,8 +154,10 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
 		no_context(regs, addr);
 		return;
 	}
-	if (pud_leaf(pudp_get(pud_k)))
+	if (pud_leaf(pudp_get(pud_k))) {
+		page_size = PUD_SIZE;
 		goto flush_tlb;
+	}
 
 	/*
 	 * Since the vmalloc area is global, it is unnecessary
@@ -166,8 +168,10 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
 		no_context(regs, addr);
 		return;
 	}
-	if (pmd_leaf(pmdp_get(pmd_k)))
+	if (pmd_leaf(pmdp_get(pmd_k))) {
+		page_size = PMD_SIZE;
 		goto flush_tlb;
+	}
 
 	/*
 	 * Make sure the actual PTE exists as well to
@@ -180,6 +184,7 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
 		no_context(regs, addr);
 		return;
 	}
+	page_size = PAGE_SIZE;
 
 	/*
 	 * The kernel assumes that TLBs don't cache invalid
@@ -188,7 +193,7 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
 	 * necessary even after writing invalid entries.
 	 */
 flush_tlb:
-	local_flush_tlb_page(addr);
+	local_flush_tlb_page(addr, page_size);
 }
 
 static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index f9334aab45a6..678b892b4ed8 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -356,7 +356,7 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
 		set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, prot));
 	else
 		pte_clear(&init_mm, addr, ptep);
-	local_flush_tlb_page(addr);
+	local_flush_tlb_page(addr, PAGE_SIZE);
 }
 
 static inline pte_t *__init get_pte_virt_early(phys_addr_t pa)
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 9b6e86ce3867..d5036f2a8244 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -27,7 +27,7 @@ static void local_flush_tlb_range_threshold_asid(unsigned long start,
 	}
 
 	for (i = 0; i < nr_ptes_in_range; ++i) {
-		local_flush_tlb_page_asid(start, asid);
+		local_flush_tlb_page_asid(start, stride, asid);
 		start += stride;
 	}
 }
@@ -36,7 +36,7 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
 		unsigned long size, unsigned long stride, unsigned long asid)
 {
 	if (size <= stride)
-		local_flush_tlb_page_asid(start, asid);
+		local_flush_tlb_page_asid(start, stride, asid);
 	else if (size == FLUSH_TLB_MAX_SIZE)
 		local_flush_tlb_all_asid(asid);
 	else
@@ -126,14 +126,7 @@ void flush_tlb_mm_range(struct mm_struct *mm,
 			  start, end - start, page_size);
 }
 
-void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
-{
-	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
-			  addr, PAGE_SIZE, PAGE_SIZE);
-}
-
-void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
-		     unsigned long end)
+static inline unsigned long local_flush_tlb_page_size(struct vm_area_struct *vma)
 {
 	unsigned long stride_size;
 
@@ -161,6 +154,24 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		}
 	}
 
+	return stride_size;
+}
+
+void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
+{
+	unsigned long page_size;
+
+	page_size = local_flush_tlb_page_size(vma);
+	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
+			  addr, page_size, page_size);
+}
+
+void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
+		     unsigned long end)
+{
+	unsigned long stride_size;
+
+	stride_size = local_flush_tlb_page_size(vma);
 	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
 			  start, end - start, stride_size);
 }
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
