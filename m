Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D13C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 08:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SAqt4ycpJ3ITFPJacmO+QLD2iXrV1dMMQdisqSjfoZQ=; b=RJXk98wTN53DFV
	bzfCMalSiZZMvYzqA5o1gJ4NwzSi4H8fEEEXeNYYKSw+cnBPJ/mwysd7HgIxyb7L9iTcR0kWcGVNB
	VuBnBFOP+1YFVY+cDGf8HjqXrJc2PRujIyXzfLw5+QOA+77A514MhZ8v4N0JfNDwBy6t9YXGlAbmx
	Qj9HnwaIxz7LJPr8CpXR0/DgjjFvR4crUmJW/o7RUVQxk9x0GSy8jHhp91ke00l5kgT2O9qZy2QBA
	yfMze5yFgHyPvoSZF4PkJJlgc+7bV3arBYcV0nPTIlNtCDTwQ8L/QTzHh6vmccVYmjauoEHIndALE
	bk+/bCIMvVuGwcKoxWlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRnV-00CHuh-M9; Thu, 21 Apr 2022 08:04:17 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRlS-00CGuM-Ru; Thu, 21 Apr 2022 08:02:13 +0000
Received: from kwepemi100004.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KkVLd0wtXzFqY4;
 Thu, 21 Apr 2022 15:59:37 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100004.china.huawei.com (7.221.188.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Apr 2022 16:02:08 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Apr 2022 16:02:07 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 Tong Tiangen <tongtiangen@huawei.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
Subject: [PATCH -next v5 2/5] mm: page_table_check: move
 pxx_user_accessible_page into x86
Date: Thu, 21 Apr 2022 08:20:39 +0000
Message-ID: <20220421082042.1167967-3-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421082042.1167967-1-tongtiangen@huawei.com>
References: <20220421082042.1167967-1-tongtiangen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_010211_295357_A24706B6 
X-CRM114-Status: UNSURE (   9.44  )
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

From: Kefeng Wang <wangkefeng.wang@huawei.com>

The pxx_user_accessible_page() check the PTE bit, it's
architecture-specific code, move them into x86's pgtable.h,

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/x86/include/asm/pgtable.h | 19 +++++++++++++++++++
 mm/page_table_check.c          | 17 -----------------
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index b7464f13e416..564abe42b0f7 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1447,6 +1447,25 @@ static inline bool arch_has_hw_pte_young(void)
 	return true;
 }
 
+#ifdef CONFIG_PAGE_TABLE_CHECK
+static inline bool pte_user_accessible_page(pte_t pte)
+{
+	return (pte_val(pte) & _PAGE_PRESENT) && (pte_val(pte) & _PAGE_USER);
+}
+
+static inline bool pmd_user_accessible_page(pmd_t pmd)
+{
+	return pmd_leaf(pmd) && (pmd_val(pmd) & _PAGE_PRESENT) &&
+		(pmd_val(pmd) & _PAGE_USER);
+}
+
+static inline bool pud_user_accessible_page(pud_t pud)
+{
+	return pud_leaf(pud) && (pud_val(pud) & _PAGE_PRESENT) &&
+		(pud_val(pud) & _PAGE_USER);
+}
+#endif
+
 #endif	/* __ASSEMBLY__ */
 
 #endif /* _ASM_X86_PGTABLE_H */
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index eb0d0b71cdf6..3692bea2ea2c 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -52,23 +52,6 @@ static struct page_table_check *get_page_table_check(struct page_ext *page_ext)
 	return (void *)(page_ext) + page_table_check_ops.offset;
 }
 
-static inline bool pte_user_accessible_page(pte_t pte)
-{
-	return (pte_val(pte) & _PAGE_PRESENT) && (pte_val(pte) & _PAGE_USER);
-}
-
-static inline bool pmd_user_accessible_page(pmd_t pmd)
-{
-	return pmd_leaf(pmd) && (pmd_val(pmd) & _PAGE_PRESENT) &&
-		(pmd_val(pmd) & _PAGE_USER);
-}
-
-static inline bool pud_user_accessible_page(pud_t pud)
-{
-	return pud_leaf(pud) && (pud_val(pud) & _PAGE_PRESENT) &&
-		(pud_val(pud) & _PAGE_USER);
-}
-
 /*
  * An enty is removed from the page table, decrement the counters for that page
  * verify that it is of correct type and counters do not become negative.
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
