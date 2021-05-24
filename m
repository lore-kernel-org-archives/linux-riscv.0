Return-Path: <SRS0=jEvo=KT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3D9C47084
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 23:45:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7684A61420
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 23:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7684A61420
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oRXab0oFvFwolHAPAOT7baRncytdzx0Gutk8bo94DK4=; b=1D0Nwq+OeIKOR4
	Nb+d4JTgVZ0BcVcgLbw3hsTyWeBM27CsbxyCRPQd2KvmAdsOMNevSs15pshIme05a0sUU5nMP+H++
	JShLYpazTRGVM/iOwVco51TL4Xm3AYDc97fzPTSJrGmjqa4RLg5yvGLYtfxjeR03OOTX54bopPavb
	MYdpVcLbS822soEjJV5pVZws+mJRu3QLdQEhUQJ7rfIDWDdt0juNb44NlE1rEu4O42ygYcCXsvyTO
	KwO9jzKsAy7kwbe8sYMEBmVdeiNDS7zSVGDVB/PDvSv5bpO0zQcy7bxcMoFQl1Pih84DS3mTZxzDt
	TyrnHceFw+Zm3gRLrVrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llKGL-002Om5-Bq; Mon, 24 May 2021 23:45:33 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll461-000igj-PN
 for linux-riscv@lists.infradead.org; Mon, 24 May 2021 06:29:51 +0000
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FpS0l6NlLz80vB;
 Mon, 24 May 2021 14:26:47 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 14:29:38 +0800
Received: from huawei.com (10.175.113.32) by dggpemm000001.china.huawei.com
 (7.185.36.245) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 24 May
 2021 14:29:37 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH -next] riscv: mm: fix build errors caused by mk_pmd()
Date: Mon, 24 May 2021 15:02:20 +0800
Message-ID: <20210524070220.793082-1-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_232950_019316_D540045F 
X-CRM114-Status: UNSURE (   7.11  )
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

Use macro definition instead of inline function for mk_pmd
to fix the above problems.It is similar to the mk_pte macro.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
---
 arch/riscv/include/asm/pgtable.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4b708ae08910..f35d9c90d4cb 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -508,10 +508,7 @@ static inline unsigned long pmd_pfn(pmd_t pmd)
 	return ((__pmd_to_phys(pmd) & PMD_MASK) >> PAGE_SHIFT);
 }
 
-static inline pmd_t mk_pmd(struct page *page, pgprot_t prot)
-{
-	return pfn_pmd(page_to_pfn(page), prot);
-}
+#define mk_pmd(page, prot)    pfn_pmd(page_to_pfn(page), prot)
 
 static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 {
-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
