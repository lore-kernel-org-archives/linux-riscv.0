Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642D0C77B70
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 06:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zYc72U7UY8jqpjiGu1ACOMqW/OroV0MoXypgTGSBrxE=; b=ouPTSuML9IJLNK
	gbw3q5UK0fZLTpNkmixMk5slhdxZ9/Pxdh089sOYDr25y4VI/XHPMuNJFoRQQffXQFTPK130yIRr7
	ZZ4WD2r0FZSMDu/GKX84myz8Z8N8STfEBDHExsY282yk5CUr25mZWG3hZGwn+R4J9/V2EBwQeGSNd
	UPAwKIOIc6flsG9G5CDkQNwKdkhsIrcHSeb0aSr97Y8J/A2nzzHG61BVgZrZZgTIz1WWEv5KSM1CI
	ZtNBEpHWSY169go57qqSaCTXHaAUrR8NeMueqRy3GKdXQ//iXEWCI5rWTQsqdjQivH3PCM+JVhkbB
	TXcGBtsujNl+b8aAdRoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poI0V-00Ezcy-1U;
	Mon, 17 Apr 2023 06:06:31 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poI0Q-00Ezc5-2D
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 06:06:29 +0000
Received: by mail-pj1-x1034.google.com with SMTP id h24-20020a17090a9c1800b002404be7920aso24960190pjp.5
        for <linux-riscv@lists.infradead.org>; Sun, 16 Apr 2023 23:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681711585; x=1684303585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwG59zjCRG7FV4Zr69WZYVu8IwtuTfs4UkWVMn1S6/E=;
        b=TjXmexDhwTjmqLS+BvCutWRiCbEaOE+xo3srO+t50svlk65UpGfCeST8K5mPfWwegf
         hG8g/jKqZXNTJUkrFaFiWvaJC51NUmJMqbpQsbZQ05mK+EYZU394K+3DAiKU4xwcoYHU
         SwHl+4kKlGcP/aGwAoJDRcOhQnDkmLt/ewAlH1EkvKG+j6qWGIj/67UUlf2Hwm4fJpP+
         FujyXG+ZtoJOlpSyB2PZQLY+tHURb3duhHt8uE2rweTfPQjsEmRJmQ2/wvKamKde+GDI
         Kj26YKWk3f5R+Vn1zQYSvRkcHHbhaj6hVXhr5UB1mW2MlosW1UO5Gwwz1w7M7KpHrDiL
         +P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681711585; x=1684303585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwG59zjCRG7FV4Zr69WZYVu8IwtuTfs4UkWVMn1S6/E=;
        b=XcJ26+/x0AVwu+eMkvbKOZE78/a70air2/ecXf3MtEapvdso7Bo2uXzIbT+Oh52uBv
         zkLgBMJiZ53K2zwgVc/ymRwPCGcdeGzOaz435eOp50Nv4FrFiPTmzU49OKj+AB8JNX2A
         vst4Sa20oeqR4ePdCmUczgKaPUK1FS2uofd6tgarss1MBD3iCnF9GBWKnjZyY/C6Rbc7
         hr5cgTi0o0kd4DBsYpEUS+niZ/07v515LQiOLQAjq4VYSoKj4CaKH6GPA1i28sYzfwgC
         o/R1LJ6reNmDQIhiGSIjnmas2k0OYu0oS01EZ6uhF8D+zZhQogZvlDW7d2XG6L7QN9sC
         +5Fw==
X-Gm-Message-State: AAQBX9caiL5Azfk1LLWsDdvbfZzOr6h8+aMKCcgUTl+4Y69x6lkgP0Ib
	My5HZA7hTd53cjHgXB/JynIgsw==
X-Google-Smtp-Source: AKy350azSvniZ67kew97K1sIFDIA74nfrvIYKTMrmBykLvSlTsyhPfn8eN6Goh3VBoU6ouPb5noQUw==
X-Received: by 2002:a17:902:ec92:b0:1a6:5fa2:aa50 with SMTP id x18-20020a170902ec9200b001a65fa2aa50mr13699499plg.1.1681711585532;
        Sun, 16 Apr 2023 23:06:25 -0700 (PDT)
Received: from vincentchen-ThinkPad-T480s.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id u10-20020a170902a60a00b001a076025715sm6814839plq.117.2023.04.16.23.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 23:06:25 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	vincent.chen@sifive.com,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3] riscv: mm: execute local TLB flush after populating vmemmap
Date: Mon, 17 Apr 2023 14:06:18 +0800
Message-Id: <20230417060618.639395-1-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_230626_734690_F8F81518 
X-CRM114-Status: GOOD (  10.26  )
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
right after the spare_init() to execute a sfence.vma instruction for the
VMEMMAP area, ensuring that all data related to the address translation
is visible to the hart.

Fixes: d95f1a542c3d ("RISC-V: Implement sparsemem")
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/tlbflush.h | 7 +++++++
 arch/riscv/mm/init.c              | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index a09196f8de68..f9d3712bd93b 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -61,4 +61,11 @@ static inline void flush_tlb_kernel_range(unsigned long start,
 	flush_tlb_all();
 }
 
+/* Flush a range of kernel pages without broadcasting */
+static inline void local_flush_tlb_kernel_range(unsigned long start,
+						unsigned long end)
+{
+	local_flush_tlb_all();
+}
+
 #endif /* _ASM_RISCV_TLBFLUSH_H */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0f14f4a8d179..bcf365cbbcc1 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1221,6 +1221,10 @@ void __init misc_mem_init(void)
 	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
 	arch_numa_init();
 	sparse_init();
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+	/* The entire VMEMMAP region has been populated. Flush TLB for this region */
+	local_flush_tlb_kernel_range(VMEMMAP_START, VMEMMAP_END);
+#endif
 	zone_sizes_init();
 	reserve_crashkernel();
 	memblock_dump_all();
@@ -1230,6 +1234,7 @@ void __init misc_mem_init(void)
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 			       struct vmem_altmap *altmap)
 {
+	/* Defer the required TLB flush until the entire VMEMMAP region has been populated */
 	return vmemmap_populate_basepages(start, end, node, NULL);
 }
 #endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
