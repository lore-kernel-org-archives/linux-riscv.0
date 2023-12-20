Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF1EC41535
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 01:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aWejkEJZHElnclOGreh/2NlUmh+lfhLAYHmiajTQxj4=; b=mXnCaVV95c281y
	7E8IwYwe8dMb1aSxRC2GRK9FnDDJm75LDxfcc3X9nKeQ65W+862kbWPBYphMiWYUCOrt+1tEXzuzX
	Jt9zfMz6oo01iWTtEJ6vC1Ro3GxcTnS4JvJHmn/n8DkCmVD9qcRG3DMfDmLhdKLuqEoGoUulPRTqs
	Edzu4tOQQXe0pU6rQuCmnntZ+gpspEMfGEdG/90AdhHh4RDHeI1t/Y1U4NkncRxij8KgJ7qP6tw9i
	ODkpskXndi1deJB9ZZybEPW33L1r8wsxx4Ac/cGXkAHrWvXw+6gQzGwL23jWLOM5DLL8TArLrBaPS
	V1yu2IPSJodo+dzbZA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFlOi-00FtBa-2i;
	Wed, 20 Dec 2023 01:29:20 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFlOf-00FtAL-2y
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 01:29:19 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-35fc16720f9so4638905ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 17:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703035754; x=1703640554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=noOHXEXq53TwUTKHZbjt20gs+byIIS92aaWVxSd+8PM=;
        b=LbV0lLb0quEVcylamz1LeQU062dV0qGxLq8Nt/xa6WOMT/0vmyNTN6GiSUDsz5D2mB
         esppjUlWhbDgi+m6iyWHomO2idSOICdYpKN6TR/QtCGmjdqaec/9SvPGfBpBwrVg2FXM
         JB2d5rJ0dn7ZmKy1omGpwBJtglJfOVgnF2mm9XoJD2XpW9qA3fF7Bg4X1InDUnjETG+f
         DmUN3XTgos4O9bnls0r60I+Qget0E59MQKluz3rMEcAYhU0cWmi4o94sF0cFKKRx2RLp
         ZNDZeb1GJjL/0iOBSYJvFlN/XeoO40eut+P6SngIwYXyQ9LrfL6TYN5g9fo57ERr/3R9
         iRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703035755; x=1703640555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=noOHXEXq53TwUTKHZbjt20gs+byIIS92aaWVxSd+8PM=;
        b=ikNcMdDmMQSlHMBsq0disjYT8qi5dB2DmfY0Q3EQllyYGHz5K5EdWQv1vBPo2E//TE
         BpCDmbCX77WU4lMEk4LPF4jtNb6WoZv97Zyp05na3t/E9YnfcnTbSPjTltfkP0hx23Qc
         COARauxk3YEsHJ2JHxJOuntAVlr1/y/7hxtRx4Mw2wPQbWoFxPApl80xqIWUhOTFzixJ
         1eOILDtqK/FEHiT6SkArC1x4wUDFEPYHTsCHme6lkbK9yZVuJx+SBDClbbVaM1crnuu5
         iq0RIIx7y0wxNu8uxVnN1PVpucIveiuuYfzDzwVvqdZn4zFlqcVuLSkGgWV4NRz0LZLA
         e83A==
X-Gm-Message-State: AOJu0YyHjzuhxpfiimiQZCWZo2uE0/ZSbRJQOO36O40WIXeHLHVqxnIG
	/G/sDXVxLkWtiU8LdCF6BCgLlQ==
X-Google-Smtp-Source: AGHT+IH50uzI5kXTHlVql/ObPmMqVN0rJzoUbZbZCOF27Pr4JsJyzKHepUWmsgBrJirVOGgCkYLf7g==
X-Received: by 2002:a05:6e02:1c4b:b0:35f:acab:1187 with SMTP id d11-20020a056e021c4b00b0035facab1187mr7163437ilg.28.1703035754610;
        Tue, 19 Dec 2023 17:29:14 -0800 (PST)
Received: from Vincent-X1Extreme-TW.. (111-251-213-195.dynamic-ip.hinet.net. [111.251.213.195])
        by smtp.gmail.com with ESMTPSA id n2-20020a170902d2c200b001d04c097d32sm21531292plc.270.2023.12.19.17.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 17:29:14 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	ajones@ventanamicro.com,
	alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [v4 PATCH] riscv: mm: execute local TLB flush after populating vmemmap
Date: Wed, 20 Dec 2023 09:29:06 +0800
Message-Id: <20231220012906.1482456-1-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_172918_017636_44856C6F 
X-CRM114-Status: GOOD (  10.90  )
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
 arch/riscv/include/asm/tlbflush.h | 1 +
 arch/riscv/mm/init.c              | 5 +++++
 arch/riscv/mm/tlbflush.c          | 6 ++++++
 3 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 8f3418c5f172..bf8c52719a3a 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -68,4 +68,5 @@ static inline void flush_tlb_kernel_range(unsigned long start,
 #define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
 #endif /* !CONFIG_SMP || !CONFIG_MMU */
 
+void local_flush_tlb_kernel_range(unsigned long start, unsigned long end);
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
