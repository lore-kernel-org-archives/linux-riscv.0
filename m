Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE27C41535
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 02:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+JKjmyqQhDJbx2aidXaTaC4L5QlJi5o5+v1VMNv5cy0=; b=Qaj6SefeYc/dfK
	WWc0D3HHKs7I/YODlISXiymuWCNS8j0TzjQjbb7b8PoO3/96LaMLFfyg7L6vtkt7I0rLtq/nKxySX
	3rCEVHBKmbX3C/S420YQ4FQMiKshMhojwq9Q5QwLO49M9Q4H/w6jRsn2gbocFVY1yNw860j2iM+zc
	GLofgdZBynv3JZAQl5uyWX3yedBgFvT4jnA6reZ0MPrry/V8nclpYhib4TVa1VULIRKQ4rTFdvMDP
	h6+nDZj1KTZzAXRCMLmcTvoxPyrtM5Gzv5D1yc/LC7VO0gxsveNg/1cGfk6lH2x1HvZw1kxVgLQ8t
	l8CVA0JRwcxGs69nNF4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFmYt-00FzeA-0S;
	Wed, 20 Dec 2023 02:43:55 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFmYp-00FzdV-32
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 02:43:53 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-35fb96f3404so8654285ab.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 18:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703040231; x=1703645031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9JKD3osDYeII8WCBHlQGdLIM2gRfXRd4YfCRkeM11U=;
        b=FGV/pbUQ/VW8miOP9/Q8gz1qae8/JiLbEuLpm9lt6O0C6xdGA3bfutHQpKJ7N/LXya
         9kzLxGLq9lEETZNM7uc1/75kamgvg+o1OLkZLoIrl3LIP07ZLemiH1OAp1kn+S1zo2P4
         1mxU3gqdHej5lF6bYLMc/2+Mo6o6APJeEUWj0E4tsu3mG91piroGtAQWOBJKscc8AkoH
         tKw2SIKFyl/xN/JMqGGp4uHoUP8MoGq8Pt8UQGkAwzoG8+F+qI38uGyRhhv75QHWGWQr
         OPiJEOlc4d3M9Ifc9VyIv6KwsSvYpeSAz6N4SWbg6+wGGTRrXPJ8/u3p/KFbnc78lSXd
         sX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703040231; x=1703645031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9JKD3osDYeII8WCBHlQGdLIM2gRfXRd4YfCRkeM11U=;
        b=clKmDBikUL8Lf3Zghs+cEWEiViSjWT+h2eXbQ+69U49zvF5TQZ0t0b74dzS1wmg+BX
         CiX7SBUaWtqR6/RHQz/0PGJABXNxprHvG9/kaztw5lwPl70f/08gMhqKtH0aVa5bS5nq
         sZpN1ORgJHbf8DHCdK/BzDH2/xRmT1EX1YfrkMjbtYn1LCJajliLAXe2jMErWQMviwEG
         CWJQvyy6cHAKET7mJvxGpk/9YR3AmVgyxI8UhbhiMDSc6UIdXMwX5ie0oVDAr7ugmUaf
         2g5ViP9Z5uP6xd02hQ8la9XUuThDU/+EH4pc0O69PPcYyGJrP4vrXgMjT5XX8LK44nZG
         tSkg==
X-Gm-Message-State: AOJu0Yy4ypQjBrEkV47lJ4mmDCrHo3d9UI0uPnpUqcxIjQ4OaGtcb+wM
	wyEw5tjdfrCuz2XvTVFF/WaDIg==
X-Google-Smtp-Source: AGHT+IGL9eVzAuTqX6pWKtDPn/eK8TXMJkjKV9SknTyZ2+EF9qTNF/7+brNZcaHsW3pCuUKo8sNy+g==
X-Received: by 2002:a05:6e02:1bad:b0:35d:62f2:1f45 with SMTP id n13-20020a056e021bad00b0035d62f21f45mr31716571ili.20.1703040230696;
        Tue, 19 Dec 2023 18:43:50 -0800 (PST)
Received: from Vincent-X1Extreme-TW.. (111-251-213-195.dynamic-ip.hinet.net. [111.251.213.195])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902a70d00b001cf6453b237sm21738191plq.236.2023.12.19.18.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 18:43:50 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	ajones@ventanamicro.com,
	alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v5] riscv: mm: execute local TLB flush after populating vmemmap
Date: Wed, 20 Dec 2023 10:43:43 +0800
Message-Id: <20231220024343.1547648-1-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_184351_989249_0457032A 
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
right after the spare_init() to execute a sfence.vma instruction for this
VMEMMAP area, ensuring that all data related to the address translation
is visible to the hart.

Fixes: d95f1a542c3d ("RISC-V: Implement sparsemem")
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
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
