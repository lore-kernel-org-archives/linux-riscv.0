Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E5EC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mC4KenjcXI2Ku2DQePUG4txXR5h9KOvmAaBGI1mds4E=; b=AcxxCFqAUN788H
	g+SDgzN2pr103TlNuIv8dcoyC0UDmMZA2X9sJbyXSlHuOufAXGGylBEoy17qY2hE+rwrKlqQuvsH3
	nhJEtUsg5NdiiDOX27rZLd9GFu2EvhqmpOLSPINDBYTI16rBwvgGvKbUNjNQ4u9wWDo+E0zp1Sm2w
	Xc+Zj+Us3a5/swCXkuF3cWBsqCeBM4RKtqnYZwflwtLSL/ENhTb3xJBfD3Gy+h2pk1wDmvpeMTFLH
	2/ZZNwiigu7z/3LymJKLx6svrwb0wWiQg59zBXmELw0pxWnn2zAy6gqNI0BtCm+lsoG8yx0B4AAKC
	g9T7mI2jrTEdEqTWBbAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFyr-00D8KM-10;
	Thu, 07 Dec 2023 15:08:01 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFyo-00D8Im-2s
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 15:08:00 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50bfd8d5c77so970999e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 07:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701961675; x=1702566475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Copp2ndGZ68t6KATBAuS2R34UMtC0q0chiu6mkWyRdw=;
        b=y/XHAH+7DGuSaak2tT3ig0YNqhZJAWcrZ8p23YFfOnhitqB+gfOSJrOGyXVRXWbZxC
         eTfyjtrJgjKrBq9aQEikxIsYBWhCP3F0RsIzcJm+w4V6V+2dQyTC3rg+WT6nvkJtFH8z
         5tZiQFMIF1jjONCkgQStQ7jpkKC92Zzs8ZmzI0u7GteeG0x9HmxmkZxR+KdAXfHWgrp/
         AGP7WPFZ+eadrIfR2/SSn3T0smpUeqGO7efwh58jLlbT3t19mdJSbkXx+rpjkv6EDIyT
         GiroXX7586efwiVPPwvLkxLZHzAqBJ+qyw0xrTXOr/9yz8sT5mqCR1D8EV+e/CXshOk4
         ZpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701961675; x=1702566475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Copp2ndGZ68t6KATBAuS2R34UMtC0q0chiu6mkWyRdw=;
        b=jiQT1CY/dRCF2GV7vp7tH5RPD9DOI8/Etp5Nwr0g75iCzKnxxrgEhuxoa3ndEkaTBk
         QDsDwCgJS/62dghST47Pf78PZYhdc7IiBvs+9yh37N0NfmjBHWjECz0fp/VbQn18GFBy
         ShAdTAjpX9ZCfsvHcIwIDRTwPau8YRDzmI46fCiLGx85yYBqY9iPQHvYjoSyo+TfpAcc
         cCv2H8/0oISgmyw1FOPfq6RN+M8Ik0QeWKwkW+qXWRCAxlO3wXsSOonzth2Z10JgM8Gd
         nh3BuTWPqK8rOqr93tRVDE5+M4dLMwaQ8g+TSwEzZdug6LAvnjndgw2Tn/dWty3IvIKk
         3Uiw==
X-Gm-Message-State: AOJu0YzB2VBZBGy277ZW4BmxrpUO6C7ZeYpWk7s2n5R0Yv9r2wFdPmk+
	8ybp3pYVOJRbfzFdK5LyhUG7lA==
X-Google-Smtp-Source: AGHT+IF3ts9ek/mYmRNdXx3GxmP46nrPUW7Zl/dOKYDi965OgtHxqAPAmVkPP3Q02kKv6wkmHjBDJg==
X-Received: by 2002:ac2:5147:0:b0:50b:debe:d35d with SMTP id q7-20020ac25147000000b0050bdebed35dmr702137lfd.133.1701961675502;
        Thu, 07 Dec 2023 07:07:55 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id i11-20020a5d438b000000b003332ef77db4sm1647628wrq.44.2023.12.07.07.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 07:07:55 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	Dylan Jhong <dylan@andestech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RFC/RFT 4/4] TEMP: riscv: Add debugfs interface to retrieve #sfence.vma
Date: Thu,  7 Dec 2023 16:03:48 +0100
Message-Id: <20231207150348.82096-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207150348.82096-1-alexghiti@rivosinc.com>
References: <20231207150348.82096-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_070758_933549_B74DFB36 
X-CRM114-Status: GOOD (  13.10  )
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

This is useful for testing/benchmarking.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h  |  6 ++++--
 arch/riscv/include/asm/tlbflush.h |  4 ++++
 arch/riscv/kernel/sbi.c           | 12 ++++++++++++
 arch/riscv/mm/tlbflush.c          | 17 +++++++++++++++++
 4 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 89aa5650f104..b0855a620cfd 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -550,7 +550,7 @@ static inline int ptep_set_access_flags(struct vm_area_struct *vma,
 	return false;
 }
 
-extern u64 nr_sfence_vma_handle_exception;
+extern u64 nr_sfence_vma_spurious_read;
 extern bool tlb_caching_invalid_entries;
 
 #define flush_tlb_fix_spurious_read_fault flush_tlb_fix_spurious_read_fault
@@ -558,8 +558,10 @@ static inline void flush_tlb_fix_spurious_read_fault(struct vm_area_struct *vma,
 						     unsigned long address,
 						     pte_t *ptep)
 {
-	if (tlb_caching_invalid_entries)
+	if (tlb_caching_invalid_entries) {
+		__sync_fetch_and_add(&nr_sfence_vma_spurious_read, 1UL);
 		flush_tlb_page(vma, address);
+	}
 }
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index a09196f8de68..f419ec9d2207 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -14,14 +14,18 @@
 #ifdef CONFIG_MMU
 extern unsigned long asid_mask;
 
+extern u64 nr_sfence_vma, nr_sfence_vma_all, nr_sfence_vma_all_asid;
+
 static inline void local_flush_tlb_all(void)
 {
+	__sync_fetch_and_add(&nr_sfence_vma_all, 1UL);
 	__asm__ __volatile__ ("sfence.vma" : : : "memory");
 }
 
 /* Flush one page from local TLB */
 static inline void local_flush_tlb_page(unsigned long addr)
 {
+	__sync_fetch_and_add(&nr_sfence_vma, 1UL);
 	ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
 }
 #else /* CONFIG_MMU */
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index c672c8ba9a2a..ac1617759583 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -376,6 +376,8 @@ int sbi_remote_fence_i(const struct cpumask *cpu_mask)
 }
 EXPORT_SYMBOL(sbi_remote_fence_i);
 
+extern u64 nr_sfence_vma, nr_sfence_vma_all, nr_sfence_vma_all_asid;
+
 /**
  * sbi_remote_sfence_vma() - Execute SFENCE.VMA instructions on given remote
  *			     harts for the specified virtual address range.
@@ -389,6 +391,11 @@ int sbi_remote_sfence_vma(const struct cpumask *cpu_mask,
 			   unsigned long start,
 			   unsigned long size)
 {
+	if (size == (unsigned long)-1)
+		__sync_fetch_and_add(&nr_sfence_vma_all, 1UL);
+	else
+		__sync_fetch_and_add(&nr_sfence_vma, ALIGN(size, PAGE_SIZE) / PAGE_SIZE);
+
 	return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
 			    cpu_mask, start, size, 0, 0);
 }
@@ -410,6 +417,11 @@ int sbi_remote_sfence_vma_asid(const struct cpumask *cpu_mask,
 				unsigned long size,
 				unsigned long asid)
 {
+	if (size == (unsigned long)-1)
+		__sync_fetch_and_add(&nr_sfence_vma_all_asid, 1UL);
+	else
+		__sync_fetch_and_add(&nr_sfence_vma, ALIGN(size, PAGE_SIZE) / PAGE_SIZE);
+
 	return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
 			    cpu_mask, start, size, asid, 0);
 }
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 77be59aadc73..75a3e2dff16a 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -3,11 +3,16 @@
 #include <linux/mm.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
+#include <linux/debugfs.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
 
+u64 nr_sfence_vma, nr_sfence_vma_all, nr_sfence_vma_all_asid,
+	nr_sfence_vma_handle_exception, nr_sfence_vma_spurious_read;
+
 static inline void local_flush_tlb_all_asid(unsigned long asid)
 {
+	__sync_fetch_and_add(&nr_sfence_vma_all_asid, 1);
 	__asm__ __volatile__ ("sfence.vma x0, %0"
 			:
 			: "r" (asid)
@@ -17,6 +22,7 @@ static inline void local_flush_tlb_all_asid(unsigned long asid)
 static inline void local_flush_tlb_page_asid(unsigned long addr,
 		unsigned long asid)
 {
+	__sync_fetch_and_add(&nr_sfence_vma, 1);
 	__asm__ __volatile__ ("sfence.vma %0, %1"
 			:
 			: "r" (addr), "r" (asid)
@@ -149,3 +155,14 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 	__flush_tlb_range(vma->vm_mm, start, end - start, PMD_SIZE);
 }
 #endif
+
+static int debugfs_nr_sfence_vma(void)
+{
+	debugfs_create_u64("nr_sfence_vma", 0444, NULL, &nr_sfence_vma);
+	debugfs_create_u64("nr_sfence_vma_all", 0444, NULL, &nr_sfence_vma_all);
+	debugfs_create_u64("nr_sfence_vma_all_asid", 0444, NULL, &nr_sfence_vma_all_asid);
+	debugfs_create_u64("nr_sfence_vma_handle_exception", 0444, NULL, &nr_sfence_vma_handle_exception);
+	debugfs_create_u64("nr_sfence_vma_spurious_read", 0444, NULL, &nr_sfence_vma_spurious_read);
+	return 0;
+}
+device_initcall(debugfs_nr_sfence_vma);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
