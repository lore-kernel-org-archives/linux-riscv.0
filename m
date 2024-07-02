Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EA0C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYh0Fk2e0DnJo1ZW+ByNuGSm3rO1VD0jFiAt9w2Sfow=; b=gHqcYy7kzZZ6Xo
	qzIf0RikkRyzWZ/Phy5vSZ/KYTjZN1RW59CblPGvPCrVmvutv6wAwX76szZupqTvLtRGkGi90KZlK
	T2gBYvvl6DF+DbFD+l52WLc8BHp8OuKC7ocmrpRaYLCa1VxjK5WzO2adLQX1hDG/WE8sfqiTk6sdk
	A7Vyc6zXAEQ1o1jxBMmL0PbiOfBsf8Ot8BqSQ4o2cAwGIxSB+LtlPhYtmN8gAxOKo4xvYUSnb1LMD
	5G+xhXlcbZLAIJYDYtfGH94vvls22XCUSWUuXgynorLFHhJB8sCe4AkcLc8ZMh2UeJef31avGadq3
	Cl4fuP1bDByVQfcXlwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZHy-000000062xq-47Rs;
	Tue, 02 Jul 2024 08:55:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZHw-000000062wS-3cFC
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 08:55:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42574064b16so24191845e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 01:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719910499; x=1720515299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIThDSMu0YHhK3Il5EBAYEpaIGUwsTH7rJyBDsaK5V0=;
        b=KAVT4N83RCzgECkWbdq3NB8PmC+g2ZGg3SEn9XyND//atThgzxsvbA3G5UfmLMcuby
         KLP4pdwPE35VYbwK1IDB5jim+MR+4nMIr1TeOpKdMbdVe+/08K7BUWHKDSgyq5REsCc2
         mhrVFaSYkipF6gm9oTKD8tWVHlZ3vZHJ/Q1UXM9V3fKomybq/gUJ4vzZkH6P4wGx8D2i
         LjAqjxOP9nVfLvUDIAMfuaY3ySm6p4AYxaxWQrTzg3rAUXi65zjoOGfQ08EflPOdCpw6
         pua/SbiHi3tuTdjAwdrsdgcqVftC4gMnfa6RKzW9T7zQiB67dANx8X7B8SdOu9zRz40a
         pn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719910499; x=1720515299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIThDSMu0YHhK3Il5EBAYEpaIGUwsTH7rJyBDsaK5V0=;
        b=obroLOVMuGHLf31VuliKiA4SI9Ix114759LV/VmSBOr2V1HHLEm60e66emGT4XdR7s
         vrOdaHm79aEriz5hu+cvjwYgfqooN4E36db48RRXW+ZxbVht91n96X7q10CHYwcP5a2z
         RUlNBcFym4epPI/HuyinQVRDNN5snJQbjLunHJqefJ8Dr+N9XzPOs+0UWXxY44a3aVVZ
         Ye7og1PBVxpKL/o7Tn+XBDMcmoPg49HQFIfIEn0936mAgB/igUYLgxKkic4lrytH4XX/
         7KSHyAgS2sgzuzKamOOnU9Id337Df4sIpEy4YTYQdXtxUdtw9IC6CSKVnb+9FbztYfrD
         qCYA==
X-Forwarded-Encrypted: i=1; AJvYcCX+jf6wn9gCzOKSCMTkJ47o7aoaKsicEU7t2FUTvaVdqFGVB9FhnFQUSfKa+JLq8PajISXXAyxwNrO5QK2Lm1DSG55Xm6kRiSLAQafW7OwP
X-Gm-Message-State: AOJu0Yz+QmZE2v8YdAD7+g+lCeSrpfX99uiL2giXlJtk6hxq2sP5d7+j
	WMQEU30tmIglk/jbxp04IPWTaeJg3SkQSPLBxgqAg83IGA1uwkHex24RmQpNRHE=
X-Google-Smtp-Source: AGHT+IEDGO5lSYXzrNCtUPjdOzG/kBq6PyIV7c530qUlaMBb/cLWp/uOV4WEq8k/ROEiTkODEzbQXA==
X-Received: by 2002:a05:600c:2147:b0:425:6b8a:7013 with SMTP id 5b1f17b1804b1-4257a074a93mr50887735e9.35.1719910499045;
        Tue, 02 Jul 2024 01:54:59 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af552bbsm189623875e9.13.2024.07.02.01.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 01:54:58 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 4/4] riscv: Stop emitting preventive sfence.vma for new userspace mappings with Svvptc
Date: Tue,  2 Jul 2024 10:50:34 +0200
Message-Id: <20240702085034.48395-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240702085034.48395-1-alexghiti@rivosinc.com>
References: <20240702085034.48395-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_015500_927884_75A04DD3 
X-CRM114-Status: GOOD (  15.65  )
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

The preventive sfence.vma were emitted because new mappings must be made
visible to the page table walker but Svvptc guarantees that it will
happen within a bounded timeframe, so no need to sfence.vma for the uarchs
that implement this extension, we will then take gratuitous (but very
unlikely) page faults, similarly to x86 and arm64.

This allows to drastically reduce the number of sfence.vma emitted:

* Ubuntu boot to login:
Before: ~630k sfence.vma
After:  ~200k sfence.vma

* ltp - mmapstress01
Before: ~45k
After:  ~6.3k

* lmbench - lat_pagefault
Before: ~665k
After:   832 (!)

* lmbench - lat_mmap
Before: ~546k
After:   718 (!)

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 16 +++++++++++++++-
 arch/riscv/mm/pgtable.c          | 13 +++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index aad8b8ca51f1..816147e25ca9 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -476,6 +476,9 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 		struct vm_area_struct *vma, unsigned long address,
 		pte_t *ptep, unsigned int nr)
 {
+	asm goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA_EXT_SVVPTC, 1)
+		 : : : : svvptc);
+
 	/*
 	 * The kernel assumes that TLBs don't cache invalid entries, but
 	 * in RISC-V, SFENCE.VMA specifies an ordering constraint, not a
@@ -485,12 +488,23 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 	 */
 	while (nr--)
 		local_flush_tlb_page(address + nr * PAGE_SIZE);
+
+svvptc:
+	/*
+	 * Svvptc guarantees that the new valid pte will be visible within
+	 * a bounded timeframe, so when the uarch does not cache invalid
+	 * entries, we don't have to do anything.
+	 */
 }
 #define update_mmu_cache(vma, addr, ptep) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
 
 #define __HAVE_ARCH_UPDATE_MMU_TLB
-#define update_mmu_tlb update_mmu_cache
+static inline void update_mmu_tlb(struct vm_area_struct *vma,
+				  unsigned long address, pte_t *ptep)
+{
+	flush_tlb_range(vma, address, address + PAGE_SIZE);
+}
 
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp)
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 533ec9055fa0..4ae67324f992 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -9,6 +9,9 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
 			  unsigned long address, pte_t *ptep,
 			  pte_t entry, int dirty)
 {
+	asm goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA_EXT_SVVPTC, 1)
+		 : : : : svvptc);
+
 	if (!pte_same(ptep_get(ptep), entry))
 		__set_pte_at(vma->vm_mm, ptep, entry);
 	/*
@@ -16,6 +19,16 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
 	 * the case that the PTE changed and the spurious fault case.
 	 */
 	return true;
+
+svvptc:
+	if (!pte_same(ptep_get(ptep), entry)) {
+		__set_pte_at(vma->vm_mm, ptep, entry);
+		/* Here only not svadu is impacted */
+		flush_tlb_page(vma, address);
+		return true;
+	}
+
+	return false;
 }
 
 int ptep_test_and_clear_young(struct vm_area_struct *vma,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
