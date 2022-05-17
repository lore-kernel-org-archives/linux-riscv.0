Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532EEC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 07:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UulSb+Dlwp3cCVEIWtyXZjtffzddOW8IZ9nTYQbVIzU=; b=sMUPago/A28zLm
	XjWbreNBf1e3QzI9iK+wuB4P3JeVABwmLgyZyeXob7bCScAa5BDfITRXdLx7SbapsfgQ0YdhR0T9G
	UcYwFPRBrSM8a9jXsgJawDtPPL9g1f3WjWZTVTzSxOg9hhUNAcPWDIuTd8aeVwxcdz9LylPAgBVAH
	6Lp3Rl4XlU3vJZ2JoMp49HHk4baD4JzhD3eC+eoqMKVcMzrKduFKAYFsCSshks4TgB4W4Za9X8UZr
	5UZxTu0Fx4I1PWci/vHvklA4/oMg4G4P69CGX59b3jeAgx/y3i60m0ptp/JtFQxou6fL6PGGKzNjz
	xpg4jX+3wtody8RlGPKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqrci-00C8Rj-0C; Tue, 17 May 2022 07:28:04 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqrc8-00C88S-Ry; Tue, 17 May 2022 07:27:31 +0000
Received: from kwepemi100018.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L2SL90wTHzGpxl;
 Tue, 17 May 2022 15:24:33 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100018.china.huawei.com (7.221.188.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 17 May 2022 15:27:26 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 17 May 2022 15:27:25 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
 <linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tong Tiangen
 <tongtiangen@huawei.com>, <wangkefeng.wang@huawei.com>, Guohanjun
 <guohanjun@huawei.com>, Xie XiuQi <xiexiuqi@huawei.com>
Subject: [PATCH -next 2/2] arm64/mm: fix page table check compile error for
 CONFIG_PGTABLE_LEVELS=2
Date: Tue, 17 May 2022 07:45:48 +0000
Message-ID: <20220517074548.2227779-3-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517074548.2227779-1-tongtiangen@huawei.com>
References: <20220517074548.2227779-1-tongtiangen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_002729_143219_31118DCF 
X-CRM114-Status: UNSURE (   7.99  )
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

If CONFIG_PGTABLE_LEVELS=2 and CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y,
then we trigger a compile error:

  error: implicit declaration of function 'pte_user_accessible_page'

Move the definition of page table check helper out of branch
CONFIG_PGTABLE_LEVELS > 2

Fixes: daf214c14dbe ("arm64/mm: enable ARCH_SUPPORTS_PAGE_TABLE_CHECK")
Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/arm64/include/asm/pgtable.h | 33 ++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 4e61cde27f9f..979601528f1e 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -667,22 +667,6 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #define pud_valid(pud)		pte_valid(pud_pte(pud))
 #define pud_user(pud)		pte_user(pud_pte(pud))
 
-#ifdef CONFIG_PAGE_TABLE_CHECK
-static inline bool pte_user_accessible_page(pte_t pte)
-{
-	return pte_present(pte) && (pte_user(pte) || pte_user_exec(pte));
-}
-
-static inline bool pmd_user_accessible_page(pmd_t pmd)
-{
-	return pmd_present(pmd) && (pmd_user(pmd) || pmd_user_exec(pmd));
-}
-
-static inline bool pud_user_accessible_page(pud_t pud)
-{
-	return pud_present(pud) && pud_user(pud);
-}
-#endif
 
 static inline void set_pud(pud_t *pudp, pud_t pud)
 {
@@ -855,6 +839,23 @@ static inline int pgd_devmap(pgd_t pgd)
 }
 #endif
 
+#ifdef CONFIG_PAGE_TABLE_CHECK
+static inline bool pte_user_accessible_page(pte_t pte)
+{
+	return pte_present(pte) && (pte_user(pte) || pte_user_exec(pte));
+}
+
+static inline bool pmd_user_accessible_page(pmd_t pmd)
+{
+	return pmd_present(pmd) && (pmd_user(pmd) || pmd_user_exec(pmd));
+}
+
+static inline bool pud_user_accessible_page(pud_t pud)
+{
+	return pud_present(pud) && pud_user(pud);
+}
+#endif
+
 /*
  * Atomic pte/pmd modifications.
  */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
