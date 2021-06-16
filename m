Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50ABEC48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 02:07:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0092F61209
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 02:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0092F61209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmzuuRmb0wGL44hXIZ9GQ9I0VtsfRD6QnkY6MxGB+vw=; b=DwOZoYHVd/9fWW
	0H8rRqxy9ixSr5+ab8D2l+pWzsMxDoL5FV2nPsjO5xE51dV/sVy7Ac/aGcy4RUmQb/pCRa8LqLJJz
	UtKbsYrPWz1TVoQdFkGJmt7JW4GRtj/m9Ry1AmmPpPAvZvmS7LyJFix/QKkc4e5+zpUh/T89xEA7p
	4UAjNY3uz22g8y+Bb2nxBLSDSLXJzDejRCKdckJa01R5wxSuD4mlebzJST2g+qAbv46olkyQ9XY55
	S7TufImFtIiH5LbUP+LBtMrFhUVV1rwvckc4Nw/Y0ubD7X5N8I4LI06l09vWeY+ceesHkajJNdXit
	qaXdBPITY1MaFck80W0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltKxs-004R0V-To; Wed, 16 Jun 2021 02:07:36 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltKxp-004Qzn-6y
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 02:07:35 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G4T330cwJz1BMxl;
 Wed, 16 Jun 2021 10:02:23 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 10:07:20 +0800
Received: from huawei.com (10.175.113.32) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 16 Jun
 2021 10:07:20 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
CC: Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@lst.de>, Anup Patel
 <Anup.Patel@wdc.com>, <linux-riscv@lists.infradead.org>
Subject: [PATCH -next 1/2] mm/pgtable: add stubs for {pmd/pub}_{set/clear}_huge
Date: Wed, 16 Jun 2021 10:38:32 +0800
Message-ID: <20210616023833.92471-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <mhng-0e961c64-341d-4a36-863f-1eec0778a0eb@palmerdabbelt-glaptop>
References: <mhng-0e961c64-341d-4a36-863f-1eec0778a0eb@palmerdabbelt-glaptop>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_190733_470515_32AA6947 
X-CRM114-Status: UNSURE (   8.71  )
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

From: Christophe Leroy <christophe.leroy@csgroup.eu>

For architectures with no PMD and/or no PUD, add stubs similar to what we
have for architectures without P4D.

Link: https://lkml.kernel.org/r/5ac5976419350e8e048d463a64cae449eb3ba4b0.1620795204.git.christophe.leroy@csgroup.eu
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Uladzislau Rezki <uladzislau.rezki@sony.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/pgtable.h | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 46b13780c2c8..d41474a2d255 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1371,10 +1371,34 @@ static inline int p4d_clear_huge(p4d_t *p4d)
 }
 #endif /* !__PAGETABLE_P4D_FOLDED */
 
+#ifndef __PAGETABLE_PUD_FOLDED
 int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot);
-int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot);
 int pud_clear_huge(pud_t *pud);
+#else
+static inline int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
+{
+	return 0;
+}
+static inline int pud_clear_huge(pud_t *pud)
+{
+	return 0;
+}
+#endif /* !__PAGETABLE_PUD_FOLDED */
+
+#ifndef __PAGETABLE_PMD_FOLDED
+int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot);
 int pmd_clear_huge(pmd_t *pmd);
+#else
+static inline int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
+{
+	return 0;
+}
+static inline int pmd_clear_huge(pmd_t *pmd)
+{
+	return 0;
+}
+#endif /* !__PAGETABLE_PMD_FOLDED */
+
 int p4d_free_pud_page(p4d_t *p4d, unsigned long addr);
 int pud_free_pmd_page(pud_t *pud, unsigned long addr);
 int pmd_free_pte_page(pmd_t *pmd, unsigned long addr);
-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
