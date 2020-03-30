Return-Path: <SRS0=hbIk=5P=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D2DC2D0ED
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2020 11:54:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CC592072E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2020 11:54:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RI531Ub8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CC592072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fishsemi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=murr+5eScaOINBLlkGJ37x5aq1H87BJIw/3jtmzXtzM=; b=RI531Ub8NV3ETLXXcc8f1WNJhv
	U0AQjaNIu+KoZD+ZQLA25CePmQVV6MPbT6/RsdeUcbMuXldPvmJ3R7GEck7iGaEq7poS2FoARvRpE
	h2X9ykOE9Mcxry31bgMGmUM0bYhZwME2rf7FX9HA/CGAIJfqIs/v8GUlZxcrkm7hWTfSe4L5hn/px
	mr+feXYakI1oDT3B9hIAeSEOydUjry1AdlsGpTMk7J9+3qGZyjQLrk5XtqB5+dnxB+HEFqiyCu4EN
	11xW/wck4Ta9zDaQJPmMU++V2SR/34bQPEKSOUlD118KyZ8VTT1W9x9aVjhgXXvjVHeMa/KhCdGv+
	mZ6cyCHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIszP-0001x3-U4; Mon, 30 Mar 2020 11:53:59 +0000
Received: from out28-197.mail.aliyun.com ([115.124.28.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIszM-0001wS-Jq
 for linux-riscv@lists.infradead.org; Mon, 30 Mar 2020 11:53:58 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.03929106|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0110356-0.000277475-0.988687;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03308; MF=hanchuanhua@fishsemi.com; NM=1; PH=DS;
 RN=14; RT=14; SR=0; TI=SMTPD_---.H7e-2Ko_1585569212; 
Received: from localhost.localdomain(mailfrom:hanchuanhua@fishsemi.com
 fp:SMTPD_---.H7e-2Ko_1585569212)
 by smtp.aliyun-inc.com(10.147.44.118);
 Mon, 30 Mar 2020 19:53:46 +0800
From: Chuanhua Han <hanchuanhua@fishsemi.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH] riscv: mm: Remove the copy operation of pmd
Date: Mon, 30 Mar 2020 19:53:19 +0800
Message-Id: <20200330115319.1507-1-hanchuanhua@fishsemi.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_045356_831165_CE67B5F8 
X-CRM114-Status: UNSURE (   6.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: sfr@canb.auug.org.au, schwab@suse.de, Anup.Patel@wdc.com,
 linux-kernel@vger.kernel.org, peterx@redhat.com,
 linux-riscv@lists.infradead.org, ebiederm@xmission.com,
 Chuanhua Han <hanchuanhua@fishsemi.com>, akpm@linux-foundation.org,
 shihpo.hung@sifive.com, tglx@linutronix.de
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Since all processes share the kernel address space,
we only need to copy pgd in case of a vmalloc page
fault exception, the other levels of page tables are
shared, so the operation of copying pmd is unnecessary.

Signed-off-by: Chuanhua Han <hanchuanhua@fishsemi.com>
---
 arch/riscv/mm/fault.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index be84e32adc4c..24f4ebfd2df8 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -208,9 +208,9 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 vmalloc_fault:
 	{
 		pgd_t *pgd, *pgd_k;
-		pud_t *pud, *pud_k;
-		p4d_t *p4d, *p4d_k;
-		pmd_t *pmd, *pmd_k;
+		pud_t *pud_k;
+		p4d_t *p4d_k;
+		pmd_t *pmd_k;
 		pte_t *pte_k;
 		int index;
 
@@ -234,12 +234,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 			goto no_context;
 		set_pgd(pgd, *pgd_k);
 
-		p4d = p4d_offset(pgd, addr);
 		p4d_k = p4d_offset(pgd_k, addr);
 		if (!p4d_present(*p4d_k))
 			goto no_context;
 
-		pud = pud_offset(p4d, addr);
 		pud_k = pud_offset(p4d_k, addr);
 		if (!pud_present(*pud_k))
 			goto no_context;
@@ -248,11 +246,9 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		 * Since the vmalloc area is global, it is unnecessary
 		 * to copy individual PTEs
 		 */
-		pmd = pmd_offset(pud, addr);
 		pmd_k = pmd_offset(pud_k, addr);
 		if (!pmd_present(*pmd_k))
 			goto no_context;
-		set_pmd(pmd, *pmd_k);
 
 		/*
 		 * Make sure the actual PTE exists as well to
-- 
2.17.1


