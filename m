Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C76CC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Mar 2022 09:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vynRJPzgwJJzIvIUcPSRYtTe6zweaxaPRvTuNew4I00=; b=gCjFObgX8WgoRL
	IRAJLbZCFIz1Rg0yY/vaUOO91zbxxvM27KqB3WJgfgIwWbs1DAUcMC0lwpt4J0A0TM5/uh4oFHzS3
	3RLqPXhlDmGE9xAYia+ENJkU5N/IQa5efm94WeEaTlRWbo+VccMqh5OHIL1ev3jxvEaIItqA2GEDZ
	QpJSHNvVZ/ZXSIEhqft4qghndmAo650yFfGP6eUfaFSQHTpehBId3HXyILRYRnEF2I3UmJUq1x95r
	gAL0fSndr65JeYK/tHbjWU7p2pkNgE4MmbB7CKcCSLd4zHiZN+/0zHUhR0uFHUxsaqNi5h62WwhdF
	X+03aSTzBJybspVhZWow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPheW-005s3L-Ee; Thu, 03 Mar 2022 09:21:40 +0000
Received: from out29-4.mail.aliyun.com ([115.124.29.4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPheR-005s0S-TM
 for linux-riscv@lists.infradead.org; Thu, 03 Mar 2022 09:21:38 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1271601|-1;
 BR=01201311R111S20rulernew998_84748_2000303; CH=blue; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.182089-0.00122574-0.816685;
 FP=9022867507797874893|1|1|1|0|-1|-1|-1; HT=ay29a033018047198;
 MF=guangzhen.wang@tihchip.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---.Myuz88z_1646299280; 
Received: from localhost.localdomain(mailfrom:guangzhen.wang@tihchip.com
 fp:SMTPD_---.Myuz88z_1646299280) by smtp.aliyun-inc.com(33.32.41.12);
 Thu, 03 Mar 2022 17:21:28 +0800
From: Will Wang <guangzhen.wang@tihchip.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	Will Wang <guangzhen.wang@tihchip.com>
Subject: [PATCH] riscv: avoid making unexpected changes to pte
Date: Thu,  3 Mar 2022 17:21:19 +0800
Message-Id: <20220303092119.25314-1-guangzhen.wang@tihchip.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_012136_155947_CFD8D3BC 
X-CRM114-Status: UNSURE (   7.71  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

_PAGE_CHG_MASK does not protect the pte value in pte_modify as
described. Use _PAGE_CHG_MASK to limit the value of newprot.

Signed-off-by: Guangzhen Wang <guangzhen.wang@tihchip.com>
---
 arch/riscv/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index bf204e7c1f74..dfc9cc4146d0 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -370,7 +370,7 @@ static inline int pmd_protnone(pmd_t pmd)
 /* Modify page protection bits */
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
-	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot));
+	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | (pgprot_val(newprot) & ~_PAGE_CHG_MASK));
 }
 
 #define pgd_ERROR(e) \
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
