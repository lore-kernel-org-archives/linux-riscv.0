Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED4DC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 08:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrw04nRC7MQRAummoYD2lAArS/tkvcnLYtdqNoksegM=; b=GNjOHF9wB0LuuH
	fVok+NZh1fVF3bT/zSPIYQvdF6Bq8N0zZWgSLrtOQlxTnd/F+v8d73xJJekHLrcJKLNg7Y++a+Oe+
	Dws+NvHImBn3DlMpiuQagvLj/83kwKSD6L2PaRmMXwuWKTTa0ZR8C0O7b/QvixNTt+r7WGElZb4b3
	/smmAzQScXuTQEYNjBvaYjx52g0PrNOPpVTDJa+7meO49NNQpN5beZNMCNTYWrlWwKKfepH4FYvZM
	6fk84ngR/FxIzvTj32vPf302u3glu+dg8Xgvx7bY6wYGMRXHRtA8HqKdIyI1NY+C3w+a9xvEBTClI
	dSBNobnGWHZ4RpGe8dzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRn7-00CHhS-BQ; Thu, 21 Apr 2022 08:03:53 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRlR-00CGsv-0w; Thu, 21 Apr 2022 08:02:11 +0000
Received: from kwepemi100003.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KkVLb0GvNzFqWr;
 Thu, 21 Apr 2022 15:59:35 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100003.china.huawei.com (7.221.188.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Apr 2022 16:02:06 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Apr 2022 16:02:05 +0800
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
Subject: [PATCH -next v5 1/5] mm: page_table_check: using PxD_SIZE instead of
 PxD_PAGE_SIZE
Date: Thu, 21 Apr 2022 08:20:38 +0000
Message-ID: <20220421082042.1167967-2-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421082042.1167967-1-tongtiangen@huawei.com>
References: <20220421082042.1167967-1-tongtiangen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_010209_433920_C3E010ED 
X-CRM114-Status: UNSURE (   9.87  )
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

Macro PUD_SIZE/PMD_SIZE is more general in various architectures. Using
PUD_SIZE/PMD_SIZE instead of PUD_PAGE_SIZE/PMD_PAGE_SIZE can better
support page table check in architectures other than x86 and it is no
functional impact on x86.

Suggested-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 mm/page_table_check.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 2458281bff89..eb0d0b71cdf6 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -177,7 +177,7 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, unsigned long addr,
 
 	if (pmd_user_accessible_page(pmd)) {
 		page_table_check_clear(mm, addr, pmd_pfn(pmd),
-				       PMD_PAGE_SIZE >> PAGE_SHIFT);
+				       PMD_SIZE >> PAGE_SHIFT);
 	}
 }
 EXPORT_SYMBOL(__page_table_check_pmd_clear);
@@ -190,7 +190,7 @@ void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
 
 	if (pud_user_accessible_page(pud)) {
 		page_table_check_clear(mm, addr, pud_pfn(pud),
-				       PUD_PAGE_SIZE >> PAGE_SHIFT);
+				       PUD_SIZE >> PAGE_SHIFT);
 	}
 }
 EXPORT_SYMBOL(__page_table_check_pud_clear);
@@ -219,7 +219,7 @@ void __page_table_check_pmd_set(struct mm_struct *mm, unsigned long addr,
 	__page_table_check_pmd_clear(mm, addr, *pmdp);
 	if (pmd_user_accessible_page(pmd)) {
 		page_table_check_set(mm, addr, pmd_pfn(pmd),
-				     PMD_PAGE_SIZE >> PAGE_SHIFT,
+				     PMD_SIZE >> PAGE_SHIFT,
 				     pmd_write(pmd));
 	}
 }
@@ -234,7 +234,7 @@ void __page_table_check_pud_set(struct mm_struct *mm, unsigned long addr,
 	__page_table_check_pud_clear(mm, addr, *pudp);
 	if (pud_user_accessible_page(pud)) {
 		page_table_check_set(mm, addr, pud_pfn(pud),
-				     PUD_PAGE_SIZE >> PAGE_SHIFT,
+				     PUD_SIZE >> PAGE_SHIFT,
 				     pud_write(pud));
 	}
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
