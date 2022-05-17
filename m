Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CF5C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 07:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0Qrl5jDyOu5SQZTXCmZXIoxGJn086dJjsRJsG9sjpk=; b=Q89pXvvrwmKooc
	67tEaTegLAKXSDehposf8PspYKJmeVZZBoRRiMX3hcIzywI/X7Wc62QpRTMOcx+1xF+YGJq+AM+ty
	/i2CAe/E/f/jd/RkV5VJrUWeAdsX9nrQsHmjLh01L7FAVdnZbNuKwLulhaOqHw4apJur8e3aip0f8
	nWQf8VUdj3Ubowa3uXrX5pXwfvN71Y3UppmKqmgXg+N9cxkGB6i42QYhH4x5IfwPm5YLTDScyEG8Q
	ce7sKwQWUMBPgFwKUKL6Sp+cjbiLZiXTJ4+QvJTud43YSwaLaOPMmupuGJmD9v1tISekPxtTw/a9l
	0LzMfKDPvGElxY6Zw9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqrcW-00C8LO-9t; Tue, 17 May 2022 07:27:52 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqrc8-00C87f-Fj; Tue, 17 May 2022 07:27:30 +0000
Received: from kwepemi100019.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L2SNp0JjxzhZ7T;
 Tue, 17 May 2022 15:26:50 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100019.china.huawei.com (7.221.188.189) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 17 May 2022 15:27:24 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 17 May 2022 15:27:23 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
 <linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tong Tiangen
 <tongtiangen@huawei.com>, <wangkefeng.wang@huawei.com>, Guohanjun
 <guohanjun@huawei.com>, Xie XiuQi <xiexiuqi@huawei.com>
Subject: [PATCH -next 1/2] riscv/mm: fix two page table check related issues
Date: Tue, 17 May 2022 07:45:47 +0000
Message-ID: <20220517074548.2227779-2-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517074548.2227779-1-tongtiangen@huawei.com>
References: <20220517074548.2227779-1-tongtiangen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_002728_914742_E5DB0B1F 
X-CRM114-Status: GOOD (  10.27  )
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

Two page table check related issues have been fixed here.

1. Open CONFIG_PAGE_TABLE_CHECK in riscv32, we got a compile error[1]:

   error: implicit declaration of function 'pud_leaf'

   Add pud_leaf() definition to incluce/asm-generic/pgtable-nopmd.h to fix
   this issue.

2. Keep consistent with other pud_xxx() helpers, move pud_user() to
   pgtable-64.h and add pud_user() to pgtable-nopmd.h.

[1]https://lore.kernel.org/linux-mm/202205161811.2nLxmN2O-lkp@intel.com/T/

Fixes: 856eed79f8d3 ("riscv/mm: enable ARCH_SUPPORTS_PAGE_TABLE_CHECK")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/riscv/include/asm/pgtable-64.h | 5 +++++
 arch/riscv/include/asm/pgtable.h    | 5 -----
 include/asm-generic/pgtable-nopmd.h | 2 ++
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 7e246e9f8d70..ba2494cbc24f 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -86,6 +86,11 @@ static inline int pud_leaf(pud_t pud)
 	return pud_present(pud) && (pud_val(pud) & _PAGE_LEAF);
 }
 
+static inline int pud_user(pud_t pud)
+{
+	return pud_val(pud) & _PAGE_USER;
+}
+
 static inline void set_pud(pud_t *pudp, pud_t pud)
 {
 	*pudp = pud;
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 62e733c85836..4200ddede880 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -634,11 +634,6 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 	return __set_pte_at(mm, addr, (pte_t *)pmdp, pmd_pte(pmd));
 }
 
-static inline int pud_user(pud_t pud)
-{
-	return pte_user(pud_pte(pud));
-}
-
 static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 				pud_t *pudp, pud_t pud)
 {
diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index 10789cf51d16..8ffd64e7a24c 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -30,6 +30,8 @@ typedef struct { pud_t pud; } pmd_t;
 static inline int pud_none(pud_t pud)		{ return 0; }
 static inline int pud_bad(pud_t pud)		{ return 0; }
 static inline int pud_present(pud_t pud)	{ return 1; }
+static inline int pud_user(pud_t pud)		{ return 0; }
+static inline int pud_leaf(pud_t pud)		{ return 0; }
 static inline void pud_clear(pud_t *pud)	{ }
 #define pmd_ERROR(pmd)				(pud_ERROR((pmd).pud))
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
