Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA02C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 03:01:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCB0C610A2
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 03:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCB0C610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zbMT2leeRyWt7oB+7lDVh4dzC2w7L5L/iYINgLaR22c=; b=X3MKfijKWcfB49
	TcPtOcw8FEHfSu/nEW22YbmUMNbPwRda10mBW36kv9wS/NyUhKMZIgXtu+rlxhWrem+19J7kf29re
	rKbtdLYhDWbnZonyWfGfbgvWEFQ0w2SNDIYHNfsPaC8/l2AUHni/O93GU/sOvUaQuoqt/kf4nhIlB
	QjNv3EgTkVoKqTJqb5uLg8lYYnaYd6lWWYExbwGnSmltnPcpCWvzUlVu/4QAe3eeD142S4bDatr64
	mzciMxFZpvbckXZCrY7qqf8yhND6jjAsLlhMMiV1g8JPIK5mIRD2JpHUMed/lakHUgrEhDUqODBMY
	xrT4FhzCPpuXC5Ae3SVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUgt9-001U1H-55; Mon, 27 Sep 2021 03:01:07 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUgt6-001Tzu-RT
 for linux-riscv@lists.infradead.org; Mon, 27 Sep 2021 03:01:06 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HHnRP5hTdzWN0L;
 Mon, 27 Sep 2021 10:59:29 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 27 Sep 2021 11:00:45 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 27 Sep 2021 11:00:45 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
 <palmerdabbelt@google.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v2] riscv: mm: Enable PMD split page table lock for RV64
Date: Mon, 27 Sep 2021 11:03:25 +0800
Message-ID: <20210927030325.167313-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210926_200105_107743_03332618 
X-CRM114-Status: UNSURE (   9.65  )
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

After commit 1355c31eeb7e ("asm-generic: pgalloc: provide generic
pmd_alloc_one() and pmd_free_one()"), the main part to support
PMD split page table lock is in asm-generic/pgalloc.h.

The only change is add pgtable_pmd_page_ctor() into alloc_pmd_late(),
then we could enable ARCH_ENABLE_SPLIT_PMD_PTLOCK for RV64.

Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
v2:
- rebase to v5.15-rc3, update changelog, and add RB

 arch/riscv/Kconfig   | 1 +
 arch/riscv/mm/init.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 301a54233c7e..5c4463f30eb0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -14,6 +14,7 @@ config RISCV
 	def_bool y
 	select ARCH_CLOCKSOURCE_INIT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
+	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index c0cddf0fc22d..1f21375ba86f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -367,7 +367,8 @@ static phys_addr_t __init alloc_pmd_late(uintptr_t va)
 	unsigned long vaddr;
 
 	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr);
+	BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page(vaddr)));
+
 	return __pa(vaddr);
 }
 
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
