Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BC8CF256D
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 04:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMH+Nr683h32/qfZF0wJKh9aeXIhv9TFt5jgxVteD+E=; b=PT7QlSdWopQMfS
	YUjK3WO5GT+tiZPzae4Ymkde9LmqE8BoeWJ4h4xhelBaQE0c27sksNoLouL+MkwyMak5xnytVtpSB
	6VoDSlP+4kb1nEawW577cX764pfhRZOLirbnl2L2UkuXC2zO/nsqaJjNy2xjnSnV/w/3uZv4KmUKH
	/VWVpPgnb6ZJc4h+fxFQOYdXmIP7Ypc+kqT8eSfvB2QeBim0AbzOQyi+raHDkgMxsivfd7Rsh3Z4c
	dmuRStTHDbpzxOrQRywtLjbeRuWgfxqzvzwxeFuVx+Af34xa4cPNgFFbsZiakdWzd3rBzpkqsRaJb
	m82Q4+ZQSO4LpImTF7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLw9c-000000067lC-3yC1;
	Thu, 20 Nov 2025 04:20:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLw9a-000000067k9-23Ip
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 04:20:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6CDD40A10
	for <linux-riscv@lists.infradead.org>; Thu, 20 Nov 2025 04:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4ADC4CEF1
	for <linux-riscv@lists.infradead.org>; Thu, 20 Nov 2025 04:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763612415;
	bh=zcNBGYq266uucCi/v8bKlwe5spwZDfe/RzSgu6RUk8Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tDXrcuLfge8jkbSBEOkYQGBI/EmNaI8drJ7LRSIsMlojR//KbPs4L+Ire1oMSdABJ
	 qC1XFLQ90S1FobpqwyUBjSiewHAlMxoFULT3Onjem7SsycUDevkQatg/hIj6fKpviU
	 6NCtQUkBCwVSfhPfVyHviyNGO4/j7cmsgONCe2GtTjkbtqIwx+UyTvZS/zMQ0+XKug
	 0r7zXIAa5E/k9KReTzaCUBvCDOX6efDVEy/bnZCWPHrRWgwNzk0E3SLoMYG2WiUudG
	 Ms/hAggY8lrZOZVd0EfU4kNquthUcnW2cwVAK4XIvA5HzsCwC+Wz9dWlVmu9g+4/uz
	 az9re8kE1aW5g==
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 2/3] riscv: mm: ptep_get_and_clear(): avoid atomic ops when !CONFIG_SMP
Date: Wed, 19 Nov 2025 21:18:29 -0700
Message-ID: <20251120042001.1766011-3-pjw@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251120042001.1766011-1-pjw@kernel.org>
References: <20251120042001.1766011-1-pjw@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_202018_571031_FFEEB032 
X-CRM114-Status: UNSURE (   7.65  )
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

When !CONFIG_SMP, there's no need for atomic operations in
ptep_get_and_clear(), so, similar to x86, let's not use atomics in
this case.

Cc: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/include/asm/pgtable.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 64a2197e6d97..e1610d031199 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -590,7 +590,13 @@ extern int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long a
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long address, pte_t *ptep)
 {
+#ifdef CONFIG_SMP
 	pte_t pte = __pte(atomic_long_xchg((atomic_long_t *)ptep, 0));
+#else
+	pte_t pte = *ptep;
+
+	set_pte(ptep, __pte(0));
+#endif
 
 	page_table_check_pte_clear(mm, pte);
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
