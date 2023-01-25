Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A88C54EAA
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 12:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w3guBYduNL1ZoOsJR/iePyAfBTcv/FRtNvBQuiF0UkU=; b=3FxzNHWyUy/Da1
	ds1N9pdUcaVatiPoJsws8W5SaFyI/VVuObk0uq6AzIWaVvgj6pCPB07VeeoyNVTyVCPxDbF5v4TnS
	6ZXylG8i1wufEEGv28ilh2HfGByNeJ8Ntk/3Gf/HWHY6XfdDrGk40EjEmRTnK/KtS9y0ayDSxPkYj
	N6SEJg6mG5kqluGeyGbtCuxhOJPHQ4/3hJZ67QWIj2kYUbAFfhZtbXTOQt6WBrq5gjiaWijZDhwjj
	luAxN1XM3COWy9rhF33aIhS2mek5ijnbEn9DaERRLdtjyEXVGsBbT9GffHLbE8tTQm4fPKpZcRLGn
	jeXaFnfXzegJgALEe7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKfJZ-007L0w-N1; Wed, 25 Jan 2023 12:55:45 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKfJX-007L0P-Td
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 12:55:45 +0000
Received: by mail-pl1-x62a.google.com with SMTP id p24so17748223plw.11
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 04:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fa5yK8o6SQQrktgfBrs22zwKGa8IfXRpSXJjrHvV2g4=;
        b=pKZ5IpEZ8iaHVrhl2p6vjFkOm7z1YqBkUZkeFtuAqg/tqQfH8LzW8OLCFpHwV7N1s6
         lhaqYB6WL4N9uZjO9JSWyJ7teEeEC4xcQJLvLavkItJ5sagGjuLHb+ixMeTL9RHKQ4/j
         ok8SBF5i6noSh7v1UClxFkmGJsHD3gbq1THjiYpiDFjyHZb60T4apfGNZPBwz+gBvVq/
         yI5/ZC1qNJ4UwpKOZZZOepNbhT+lKl7F8Yq1/wJFAZ/Kzc81gFHN1cXtHCC3ejME7muO
         yQ8U0nx/RZfBA0onVGBkJe5TrFCX9v6ax/L4FDr0ii1COJ0OwxVr49NR5OOs4NOyS0Ev
         UT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fa5yK8o6SQQrktgfBrs22zwKGa8IfXRpSXJjrHvV2g4=;
        b=KFsDWGhd/+gOM1sUj3AqGZYXtTXq8zpZYpyxehBYZVc30GCisst20RdXlfUkMg/W2L
         WDzYjWgWbx9Vj+LMNPGA2ti/u/rCNUhKN6JJkHTMuFb++SNR1KK1npocSbNo3Sl35Xpi
         LUimERozTEUeh0q55fsO3f3SrIRV4OaCRDrS0FojUJljwj8VvABC1EaXI/e3wXnPxcRp
         puj9/Hwm58kcHjJBOWq/4k2uiZlgx8DxEwAiRBUnUpgtafIwWzAtKfhyHh5RpISzRnPQ
         kE3FTAhpJ6verWaALVOYhBx87NM9plFOVEfK1/wCb9vg0aut4myodFRFVL1TBuMhfrkz
         D4dw==
X-Gm-Message-State: AFqh2krh65LxzDJhK3rEJelVPL+zTUJTLIWs2CpmETD6ufEwWN9AEnYU
	SGhUE9cxqIH9t+q59BR6ZmPUbvVavGiV0rJqvfI=
X-Google-Smtp-Source: AMrXdXuckUmJoUnKhuKTiDP/WflyrquLywTceI1MAkwfP7eCVPiv1qhnth71Xj7U3NlSD9nE5kfayQ==
X-Received: by 2002:a05:6a20:93a4:b0:b6:7b49:8ed with SMTP id x36-20020a056a2093a400b000b67b4908edmr39035708pzh.16.1674651340939;
        Wed, 25 Jan 2023 04:55:40 -0800 (PST)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id w12-20020a170902a70c00b00189bf5dc96dsm3519978plq.230.2023.01.25.04.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 04:55:40 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Nanyong Sun <sunnanyong@huawei.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH] riscv: mm: Implement pmdp_collapse_flush for THP
Date: Wed, 25 Jan 2023 18:25:11 +0530
Message-Id: <20230125125512.2494577-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_045543_976499_C9228A4C 
X-CRM114-Status: GOOD (  11.11  )
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

When THP is enabled, 4K pages are collapsed into a single huge
page using the generic pmdp_collapse_flush() which will further
use flush_tlb_range() to shoot-down stale TLB entries. Unfortunately,
the generic pmdp_collapse_flush() only invalidates cached leaf PTEs
using address specific SFENCEs which results in repetitive (or
unpredictable) page faults on RISC-V implementations which cache
non-leaf PTEs.

Provide a RISC-V specific pmdp_collapse_flush() which ensures both
cached leaf and non-leaf PTEs are invalidated by using non-address
specific SFENCEs as recommended by the RISC-V privileged specification.

Fixes: e88b333142e4 ("riscv: mm: add THP support on 64-bit")
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/include/asm/pgtable.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4eba9a98d0e3..6d948dec6020 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -721,6 +721,30 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
 	return __pmd(atomic_long_xchg((atomic_long_t *)pmdp, pmd_val(pmd)));
 }
+
+#define pmdp_collapse_flush pmdp_collapse_flush
+static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
+					unsigned long address, pmd_t *pmdp)
+{
+	pmd_t pmd = pmdp_huge_get_and_clear(vma->vm_mm, address, pmdp);
+
+	/*
+	 * When leaf PTE enteries (regular pages) are collapsed into a leaf
+	 * PMD entry (huge page), a valid non-leaf PTE is converted into a
+	 * valid leaf PTE at the level 1 page table. The RISC-V privileged v1.12
+	 * specification allows implementations to cache valid non-leaf PTEs,
+	 * but the section "4.2.1 Supervisor Memory-Management Fence
+	 * Instruction" recommends the following:
+	 * "If software modifies a non-leaf PTE, it should execute SFENCE.VMA
+	 * with rs1=x0. If any PTE along the traversal path had its G bit set,
+	 * rs2 must be x0; otherwise, rs2 should be set to the ASID for which
+	 * the translation is being modified."
+	 * Based on the above recommendation, we should do full flush whenever
+	 * leaf PTE entries are collapsed into a leaf PMD entry.
+	 */
+	flush_tlb_mm(vma->vm_mm);
+	return pmd;
+}
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 /*
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
