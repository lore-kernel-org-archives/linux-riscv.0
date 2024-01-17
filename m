Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB5FC47DA2
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 14:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eer/XV9LBFEKS76s+BlhbOHd/NcNKwTBF8EPdIuA2Qo=; b=LtIWGZYn0/icPD
	22sXrLJh8+r0me47hi2zq+Pe1hqQiJ4333GPxnwFQp6ZJImUb7+fLFW0xhnGwUxZoFffvEoH3yuOq
	zQoK0UlwJJmGPOXSs08Uljy6UmcvHb6kYYNFAnS8qO6VZSQJtNR91CUO6R9PqF6Y41XRISu7914fA
	vR1CeGg5nFaz482rjE+4fxTRkXnix5s+P8pIZKlHMQE149TssNQM5KIy2BFTocSUkt8iF6xfs/olF
	jbo3WVDBZiAxySbYrtfdRlQGdbSksVaNWjYpdZTtdnQ+7ZKRsrGKc+ZWMhvtbRSpYDdkYOhx4M6In
	hadpeKAG+uaomEm6Uj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ6WF-00Gqix-2k;
	Wed, 17 Jan 2024 14:03:51 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ6WC-00Gqcd-25
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 14:03:50 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6d99980b2e0so9097532b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 06:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705500221; x=1706105021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xL4jhI8FdWlIIXawcvJUHf1ZstVGLNBbKMCexCRPsIA=;
        b=lWs5pq9kmL5kZ+zuCBCGCiet9SeY0jXApt3FRZW2vwiaewtaME2jv+UqcZdnjIRdRR
         8tQSvIyKxxeLVrtUXddsHlxvUIT0DPFZUG1SdBN1Flh/oYS121FwJ+mpNcL2ALM2Cm1q
         HHWvvbugN/G6o1goyI3Wa5HBskWKUS9rFy0qQ/XVELLB7ZtxDstzOiFiETrM6jyWWAYJ
         onchX1IJ5LQVbSaJh1ZfWnXQEGusH//W6KPhwQ+OmRw1gwsOtiYtKt5tBbrsBLoIBtCc
         ipnkbQ7SiMwiOSGN1oDFVGQlbB3DG5V69zmlKy5Gtn0fEBObncpvEKlzGcdJNE5sHRPe
         eP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705500221; x=1706105021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xL4jhI8FdWlIIXawcvJUHf1ZstVGLNBbKMCexCRPsIA=;
        b=p+dp7BdJzi3uxC8Eax9tgJHge7FdqlQiuhO+DxoOyPJm6+AKcwDoLO7UcrCmccPf8Z
         d/dTpBhjSGgsEepNIG/haSVuHpTdkjJzOVJXB45DWMfJzEUScu0NziAChM2lmc++pgjH
         P2ZsEmsZhpuFRoea8etfvBTUQT5xo301/AKu0ni0fndNoqi7HtqjXZDzZsE+MWsfvQvn
         rmld+hjdHmjV8/bSZnYlHSIUpXz8Ds/kGV5eespf8o/YcLTHWUw5GS/F1ukw2dEW/aOK
         sjcqrcc2eKPfMF/Y1y0+jYigDzljdBPNnfUFW7qD3vauq0UuHfmBB41QrgMIn42giFhh
         HD5A==
X-Gm-Message-State: AOJu0YzIVXya9vLq7NPGyPr2zUWqetWxXqcuk5GwAtZ7+QnhTio5flth
	qFj/BEyAXgMVYHCHu5HIXreVFniFN0Z3CA==
X-Google-Smtp-Source: AGHT+IGjasI4VBbxYaeyoezi8+spS5FvfB22AWTxfKu01W1epSCUn0ZWg3XJjGfkdZc4K/JTPqlhGQ==
X-Received: by 2002:a05:6a20:9f8b:b0:19b:421:1762 with SMTP id mm11-20020a056a209f8b00b0019b04211762mr4187220pzb.109.1705500220792;
        Wed, 17 Jan 2024 06:03:40 -0800 (PST)
Received: from Vincent-X1Extreme-TW.. (111-251-220-251.dynamic-ip.hinet.net. [111.251.220.251])
        by smtp.gmail.com with ESMTPSA id r3-20020aa79883000000b006da5e1638b6sm1506312pfl.19.2024.01.17.06.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 06:03:40 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alexghiti@rivosinc.com,
	linux-riscv@lists.infradead.org,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [v6 PATCH] riscv: mm: execute local TLB flush after populating vmemmap
Date: Wed, 17 Jan 2024 22:03:33 +0800
Message-Id: <20240117140333.2479667-1-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_060348_727283_7123D906 
X-CRM114-Status: GOOD (  11.56  )
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

The spare_init() calls memmap_populate() many times to create VA to PA
mapping for the VMEMMAP area, where all "struct page" are located once
CONFIG_SPARSEMEM_VMEMMAP is defined. These "struct page" are later
initialized in the zone_sizes_init() function. However, during this
process, no sfence.vma instruction is executed for this VMEMMAP area.
This omission may cause the hart to fail to perform page table walk
because some data related to the address translation is invisible to the
hart. To solve this issue, the local_flush_tlb_kernel_range() is called
right after the sparse_init() to execute a sfence.vma instruction for this
VMEMMAP area, ensuring that all data related to the address translation
is visible to the hart.

Fixes: d95f1a542c3d ("RISC-V: Implement sparsemem")
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/tlbflush.h | 2 ++
 arch/riscv/mm/init.c              | 5 +++++
 arch/riscv/mm/tlbflush.c          | 6 ++++++
 3 files changed, 13 insertions(+)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 8f3418c5f172..525267379ccb 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -46,6 +46,7 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end);
 #endif
+void local_flush_tlb_kernel_range(unsigned long start, unsigned long end);
 #else /* CONFIG_SMP && CONFIG_MMU */
 
 #define flush_tlb_all() local_flush_tlb_all()
@@ -66,6 +67,7 @@ static inline void flush_tlb_kernel_range(unsigned long start,
 
 #define flush_tlb_mm(mm) flush_tlb_all()
 #define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
+#define local_flush_tlb_kernel_range(start, end) flush_tlb_all()
 #endif /* !CONFIG_SMP || !CONFIG_MMU */
 
 #endif /* _ASM_RISCV_TLBFLUSH_H */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 2e011cbddf3a..cc56a0945120 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1377,6 +1377,10 @@ void __init misc_mem_init(void)
 	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
 	arch_numa_init();
 	sparse_init();
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+	/* The entire VMEMMAP region has been populated. Flush TLB for this region */
+	local_flush_tlb_kernel_range(VMEMMAP_START, VMEMMAP_END);
+#endif
 	zone_sizes_init();
 	arch_reserve_crashkernel();
 	memblock_dump_all();
@@ -1386,6 +1390,7 @@ void __init misc_mem_init(void)
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 			       struct vmem_altmap *altmap)
 {
+	/* Defer the required TLB flush until the entire VMEMMAP region has been populated */
 	return vmemmap_populate_basepages(start, end, node, NULL);
 }
 #endif
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index e6659d7368b3..d11a4ae87ec1 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -193,6 +193,12 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 	__flush_tlb_range(NULL, start, end - start, PAGE_SIZE);
 }
 
+/* Flush a range of kernel pages without broadcasting */
+void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
+{
+	local_flush_tlb_range_asid(start, end - start, PAGE_SIZE, FLUSH_TLB_NO_ASID);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
