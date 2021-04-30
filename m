Return-Path: <SRS0=p8lL=J3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A75DC433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 07:57:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C77761462
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 07:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C77761462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o3OAZVJ/Puu3qFTSCYcmpHdyBo3ETis1AGy26JeWDaM=; b=INsnXxOVlfK2GslzzQKuQ5z9t
	wjti0ijZk3l2KP8CAwjPMZ1/qA0I+8VNfHMYAUEfWKFwkERXbWHydGmeoKj7DQDriexsgFZnSotIn
	djUpwNtgakHBEh2TKD5vHT/lyWUACLj2zjGsF3St9v4acbJQgaHRl04RS8SiSJq2ibWCtaAedk08W
	VfcRybbyHQYKtA2FPtSFcC0ZefraiwcEyC87Kffnd9BwcdaHhhnSdL/UyqUkd0KjFvVCcnV9nWZxV
	0UEZZU02VSKDs0PSTC5wEFpexOr4tzBNREtFqY8Qn4pyyRmOPpsmO3nLj9Oey7DGCwykkiIFCNIWM
	ZDBmVPkgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcO10-007SvL-6r; Fri, 30 Apr 2021 07:56:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcO0x-007Suv-Pp
 for linux-riscv@desiato.infradead.org; Fri, 30 Apr 2021 07:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=7TcDEyEghrbLOC7VkfUHCG8yZRKPkg0/jAVkGpahXkU=; b=24IaFYJqaeKGAK9W66SPAh9hH5
 fi6gO9LOHz1jpvaZKE8Rx2sprBw2CJsO4nqfO5LYcdOA3o5jUhWZ/XC3emF5y2la4Lui8Nqimmvap
 K0m+wejNt68uvSHwnGdDnHxVBgBFJNhVwI7hZaceEQUPcPUWTLelH2NwuunLXeKrFzEV+YLZP+RYx
 hVPjtAEVCFHB495BmtettIahSrs+5AHCyBjs7tApdQIzUL3lmxMXMz8kIt3A/FarrsZSnTg+qa5q5
 ty5vMZ0B3zxNn65Y4h/aJSxaGZYJ2KD6ggjPTSw4FuBfFmb59+xQrIsVXpj8wUik/GxXoKKSPNVEs
 Q0ZCtNtg==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcO0u-001DWW-OM
 for linux-riscv@lists.infradead.org; Fri, 30 Apr 2021 07:56:42 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FWl4T0sKbzBtKK;
 Fri, 30 Apr 2021 15:54:01 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Fri, 30 Apr 2021
 15:56:21 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH -next 1/4] riscv: mm: add _PAGE_LEAF macro
Date: Fri, 30 Apr 2021 16:28:47 +0800
Message-ID: <20210430082850.462609-2-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430082850.462609-1-sunnanyong@huawei.com>
References: <20210430082850.462609-1-sunnanyong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_005640_981435_F0525B5B 
X-CRM114-Status: GOOD (  10.75  )
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

In riscv, a page table entry is leaf when any bit of read, write,
or execute bit is set. So add a macro:_PAGE_LEAF instead of
(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC), which is frequently used
to determine if it is a leaf page. This make code easier to read,
without any functional change.

Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
---
 arch/riscv/include/asm/pgtable-64.h   | 3 +--
 arch/riscv/include/asm/pgtable-bits.h | 5 +++++
 arch/riscv/include/asm/pgtable.h      | 6 ++----
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index f3b0da64c..e3b7c5dd6 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -46,8 +46,7 @@ static inline int pud_bad(pud_t pud)
 #define pud_leaf	pud_leaf
 static inline int pud_leaf(pud_t pud)
 {
-	return pud_present(pud) &&
-	       (pud_val(pud) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC));
+	return pud_present(pud) && (pud_val(pud) & _PAGE_LEAF);
 }
 
 static inline void set_pud(pud_t *pudp, pud_t pud)
diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index bbaeb5d35..2ee413912 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -39,5 +39,10 @@
 #define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
 					  _PAGE_WRITE | _PAGE_EXEC |	\
 					  _PAGE_USER | _PAGE_GLOBAL))
+/*
+ * when all of R/W/X are zero, the PTE is a pointer to the next level
+ * of the page table; otherwise, it is a leaf PTE.
+ */
+#define _PAGE_LEAF (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC)
 
 #endif /* _ASM_RISCV_PGTABLE_BITS_H */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 80e63a93e..f489e412f 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -166,8 +166,7 @@ static inline int pmd_bad(pmd_t pmd)
 #define pmd_leaf	pmd_leaf
 static inline int pmd_leaf(pmd_t pmd)
 {
-	return pmd_present(pmd) &&
-	       (pmd_val(pmd) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC));
+	return pmd_present(pmd) && (pmd_val(pmd) & _PAGE_LEAF);
 }
 
 static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
@@ -243,8 +242,7 @@ static inline int pte_exec(pte_t pte)
 
 static inline int pte_huge(pte_t pte)
 {
-	return pte_present(pte)
-		&& (pte_val(pte) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC));
+	return pte_present(pte) && (pte_val(pte) & _PAGE_LEAF);
 }
 
 static inline int pte_dirty(pte_t pte)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
