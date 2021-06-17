Return-Path: <SRS0=17fP=LL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DB9C2B9F4
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 09:27:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6895613DF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 09:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6895613DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JAz4CNzvq2Lzy1iILnmVVJKx4H5gvzdgVtqM/Bbj6Gg=; b=Ir3Kr1pdrZYXjZ
	CHw/IsECt5edglPFmeCeT5Sjr1neNUEOeCzTHaGG2DCXGlBzat4B501wit0RZuygUQEnXJPeSFMMt
	miS+Ms/7DNIPMLNohTPV1AuGsH38MJFBRYdjOuZHyo4rKBkrpNDfxbovGpomHQZfxNRFITdxhbH0x
	rHaYdKtl9gzGA0zq/EryNuCRU3YqL5/7QjXZG36CXFZ89Z7P7wrXdUruwcpUdcNdjGpk+sKL7Uzvf
	OoE3d/6cOKlQq50wqSQAU9yclj2jaW5BqqVE8Ozc8Z4nsy9RZLtj0v7/RP9ZcPTxnCWiKNOa7jhRm
	Fji+NVEkgeh2rIv+7SLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltoIa-009dG5-Vo; Thu, 17 Jun 2021 09:26:56 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltoIW-009dBR-DY
 for linux-riscv@lists.infradead.org; Thu, 17 Jun 2021 09:26:55 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G5Gnq1TlXzZfmx;
 Thu, 17 Jun 2021 17:23:43 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 17:26:38 +0800
Received: from huawei.com (10.175.113.32) by dggpemm000001.china.huawei.com
 (7.185.36.245) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 17 Jun
 2021 17:26:37 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH v2 -next] riscv: mm: fix build errors caused by mk_pmd()
Date: Thu, 17 Jun 2021 17:58:31 +0800
Message-ID: <20210617095831.2398438-1-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_022652_719370_0D36FC93 
X-CRM114-Status: UNSURE (   8.90  )
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

With "riscv: mm: add THP support on 64-bit", mk_pmd() function
introduce build errors,
1.build with CONFIG_ARCH_RV32I=y:
arch/riscv/include/asm/pgtable.h: In function 'mk_pmd':
arch/riscv/include/asm/pgtable.h:513:9: error: implicit declaration of function 'pfn_pmd';
 did you mean 'pfn_pgd'? [-Werror=implicit-function-declaration]

2.build with CONFIG_SPARSEMEM=y && CONFIG_SPARSEMEM_VMEMMAP=n
arch/riscv/include/asm/pgtable.h: In function 'mk_pmd':
include/asm-generic/memory_model.h:64:14: error: implicit declaration of function 'page_to_section';
 did you mean 'present_section'? [-Werror=implicit-function-declaration]

Move the definition of mk_pmd to pgtable-64.h to fix the first error.
Use macro definition instead of inline function for mk_pmd
to fix the second problem. It is similar to the mk_pte macro.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
---
Changes in v2:
- Move mk_pmd to pgtable-64.h
---
 arch/riscv/include/asm/pgtable-64.h | 2 ++
 arch/riscv/include/asm/pgtable.h    | 5 -----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 1439017b16f8..228261aa9628 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -79,6 +79,8 @@ static inline unsigned long _pmd_pfn(pmd_t pmd)
 	return pmd_val(pmd) >> _PAGE_PFN_SHIFT;
 }
 
+#define mk_pmd(page, prot)    pfn_pmd(page_to_pfn(page), prot)
+
 #define pmd_ERROR(e) \
 	pr_err("%s:%d: bad pmd %016lx.\n", __FILE__, __LINE__, pmd_val(e))
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5ae51e6bd5ab..6bc2582f82e9 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -516,11 +516,6 @@ static inline unsigned long pmd_pfn(pmd_t pmd)
 	return ((__pmd_to_phys(pmd) & PMD_MASK) >> PAGE_SHIFT);
 }
 
-static inline pmd_t mk_pmd(struct page *page, pgprot_t prot)
-{
-	return pfn_pmd(page_to_pfn(page), prot);
-}
-
 static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 {
 	return pte_pmd(pte_modify(pmd_pte(pmd), newprot));
-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
