Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C18C77B70
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 08:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ji3GYVbNaWoqFdbr5iK4+4rgKQ027nprM3u1uBz8H60=; b=b5ZDqTgzEPdAEA
	t2DHxbkKTTq4n80hPXZAJWWRGmzMvDHnLttMVA71wfzfa6oQ8M58phz1o4A+bWCoRvOVguHeIyVW8
	lU4k9goO1PYCYo9xazmZoKhSIYS/kEeM72/f0zqDuebWjAqcqisQ12+XBmMrTHrZ2qacqqpF4z+cq
	t69TLuiechgRES7sBUXHe0ITuuarE8+VrHgQhxax2walDU5unRMYftli0jQWmPwZ5zSjIfaDW02Nc
	mNhjNrlnD1gHJZ9PqOdIvm7sbiMjsw45jblOuuIpSIL+3OxE/gYfuwWz9v32ap7yGZhOKy0ES5bjX
	O4cQsv3D69JUR+mGnRpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEbR-008eSD-2O;
	Fri, 14 Apr 2023 08:16:17 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEbO-008eRA-2h
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 08:16:16 +0000
Received: by mail-pj1-x1029.google.com with SMTP id y11-20020a17090a600b00b0024693e96b58so16847373pji.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 01:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681460173; x=1684052173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Et5STha4jbzBuqJNkIdznFnw7D/MJ4zRt7NgWSnTQE=;
        b=OrNqozwcUeL7S8sfx7Vz2WBGp0xMi1VHFQNORpGIFlCm1Y+gjYWdO8LQzyja55wx+E
         C36PsSbsbt1daEKu3OVb9YFdr4bQ9aVxv8EMpJrDW6UiICS1hz4mIa09pdA4ALJ04MSx
         GG9Ym/UQfsyz5hX65RNL32gVB76lrznEeNWwOt25eyPl91Jw1YT30jJMFqfUhuIPN8/e
         HcOSOm+WW2pUWHDqhvPbTL+5WbJ4HRU8uIyK0UcfFhab+BkpEyMZOQa7xZHjcAXr5PxP
         tXTWyfYJ+0YyW3Qy325jy/F5jTdeMqs2nxdOTHfqqkLW6CsCHbNVps6mf+NpfwIDrJT7
         HKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681460173; x=1684052173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Et5STha4jbzBuqJNkIdznFnw7D/MJ4zRt7NgWSnTQE=;
        b=eAQcyFFfFsow0AzslfsBARfS1HeIY8QYfSzWwJefyXj/oRAqFp2VO0bwDkBWlpM4og
         nuNc3HLWV94gHILEJkWRYBQmNMTQyFEApJXX2v39zEg3y6CLVnq7lrPyxG1XDN/wZBPv
         GHOgQqpEC+afKZ2rV8U3LQa1IOU6/WM2cyoxR9jbU5WCMzSv4WglmoEudD81wiVXxeob
         lwiu0oMqiuItCsGkbAENQ/JOf/4+f6sauOi6bgLyBODtjrqumBhBE2XA49ZNB54VHXbm
         BKOdn8LHRdaDQ88SUdURa/k8GuSzioeOdUQEDLfbRX6rLLbTKzw8pVvqZQikP76kjS6V
         UbPg==
X-Gm-Message-State: AAQBX9cuoKhEzBojgXAfy0VbSFp2Jgs0MA6bsz5xPUEitLRRDOtO5K6w
	xA8TGUUNtN6WSDj8x08lv5o6Ug==
X-Google-Smtp-Source: AKy350YfzPDMbqXRtUHZjW/PNRKgv4tsNTqhXZtZOuqxppmX8xAJM1lAWLX2E7p537GlajD4+PLviQ==
X-Received: by 2002:a17:90b:215:b0:23d:376a:c2bc with SMTP id fy21-20020a17090b021500b0023d376ac2bcmr4809185pjb.5.1681460173407;
        Fri, 14 Apr 2023 01:16:13 -0700 (PDT)
Received: from vincentchen-ThinkPad-T480s.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n18-20020a17090ade9200b00246cf1a8d3dsm2417997pjv.17.2023.04.14.01.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 01:16:13 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	vincent.chen@sifive.com,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: mm: execute local TLB flush after populating vmemmap
Date: Fri, 14 Apr 2023 16:16:05 +0800
Message-Id: <20230414081605.471375-1-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_011614_900028_1AB818B0 
X-CRM114-Status: GOOD (  10.43  )
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
mapping for the VMEMMAP area, where all "strcut page" are located once
CONFIG_SPARSEMEM_VMEMMAP is defined. These "struct page" are later
initialized in the zone_sizes_init() function. However, during this
process, no sfence.vma instruction is executed for this VMEMMAP area.
This omission may cause the hart to fail to perform page table work
because some data related to the address translation is invisible to the
hart. To solve this issue, the local_flush_tlb_kernel_range() is called
right after the spare_init() to execute a sfence.vma instruction for the
VMEMMAP area, ensuring that all data related to the address translation
is visible to the hart.

Fixes: d95f1a542c3d ("RISC-V: Implement sparsemem")
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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
index 478d6763a01a..5bd96f6c8f19 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1231,6 +1231,10 @@ void __init misc_mem_init(void)
 	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
 	arch_numa_init();
 	sparse_init();
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+	/* The entire VMEMMAP region has been propulated. Flush TLB for this region */
+	local_flush_tlb_kernel_range(VMEMMAP_START, VMEMMAP_END);
+#endif
 	zone_sizes_init();
 	reserve_crashkernel();
 	memblock_dump_all();
@@ -1240,6 +1244,7 @@ void __init misc_mem_init(void)
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
