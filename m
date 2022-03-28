Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F53C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Mar 2022 01:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Otd/jYJfKUKosgxiCgq+/t6sNc8BLT98bpQP4p0BQtU=; b=O4YrwBT5mAL3yj
	ZAkfmrlRikKCzHCqY2rXBRcAG1ks4BZZgtGSRS8iBrccy+xeE8tML7mdpXJwtWBBuu75ikBwq1neo
	+mjhAqv8hbLHPUivCe0PJh8VEDZE/nFogwiFJTp6l6VYxoqfpFLhdjrHnpC/kx/9eh+8OrHsxbHDz
	hoGWruYIZH3lP6vfusfAWHZtlz8P2cLZ5nN+46Dk7zTOFQZ2iRVjYnI7hTl5P61wFrfsw/W+ky+XO
	bLd0d0mTca2zzPsI+v5vxjRZnAsvH8G3ebWoHYBUpz5zsx74AvLL2SWKgFF9iXOUVkROcJaiYaONY
	nrXl+VLWXq6etU2AbgKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYeHQ-006zBJ-J6; Mon, 28 Mar 2022 01:34:48 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYeGl-006ysv-V6; Mon, 28 Mar 2022 01:34:09 +0000
Received: from kwepemi100013.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KRZwT5XMcz1GCx0;
 Mon, 28 Mar 2022 09:33:45 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100013.china.huawei.com (7.221.188.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Mar 2022 09:33:59 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Mar 2022 09:33:58 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 Tong Tiangen <tongtiangen@huawei.com>
Subject: [PATCH -next v3 1/4] mm: page_table_check: move
 pxx_user_accessible_page into x86
Date: Mon, 28 Mar 2022 01:52:39 +0000
Message-ID: <20220328015242.1136836-2-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20220328015242.1136836-1-tongtiangen@huawei.com>
References: <20220328015242.1136836-1-tongtiangen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_183408_331555_1BD64FA2 
X-CRM114-Status: GOOD (  10.29  )
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
also add default PMD/PUD_PAGE_SIZE definition, it's prepare
for support page table check feature on new architecture.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/x86/include/asm/pgtable.h | 19 +++++++++++++++++++
 mm/page_table_check.c          | 25 ++++++++-----------------
 2 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 62ab07e24aef..8cd6514e3052 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1430,6 +1430,25 @@ static inline bool arch_faults_on_old_pte(void)
 	return false;
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
index 2458281bff89..145f059d1c4d 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -10,6 +10,14 @@
 #undef pr_fmt
 #define pr_fmt(fmt)	"page_table_check: " fmt
 
+#ifndef PMD_PAGE_SIZE
+#define PMD_PAGE_SIZE	PMD_SIZE
+#endif
+
+#ifndef PUD_PAGE_SIZE
+#define PUD_PAGE_SIZE	PUD_SIZE
+#endif
+
 struct page_table_check {
 	atomic_t anon_map_count;
 	atomic_t file_map_count;
@@ -52,23 +60,6 @@ static struct page_table_check *get_page_table_check(struct page_ext *page_ext)
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
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
