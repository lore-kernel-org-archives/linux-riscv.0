Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A772ACF64B3
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 04:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoFo2c3TzuYk1Ioy6xPOxfIs0cchCWDoYJOhoQafXGk=; b=y37C63sFnpUEnB
	1aZjaolf3aEs+7Uza7HWHu+cVbin6MQWcTfifMf7ggryt3eAXTTYLBhITPjaFYGmWBwkgRfbzcERZ
	jhiuiXOy/pK/AGWAOlzXjy6MO7dO9HBWFdnCSHGgjt56axbmlt8psPgMog5yvypWPULXbYrCZ0d5c
	uUahSBpmIFhWXhwAJsxhrZd+E6HL8LMwBmdhvAaDQKnuSxKc5iOAz3m8C1lqq/7fblWr8t6WI1jux
	HvsoJPsk07TVHOCNd9d2mEXxSxmPBW8M1W7sSR3AUD5ap/3CpKKJkk8hSPTAEgyMF2d5FTCujluS4
	9F58XYGIEsxqDr4XKo3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLw9e-000000067m3-0ydk;
	Thu, 20 Nov 2025 04:20:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLw9b-000000067kt-47zr
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 04:20:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A9474150F
	for <linux-riscv@lists.infradead.org>; Thu, 20 Nov 2025 04:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08018C4CEF1
	for <linux-riscv@lists.infradead.org>; Thu, 20 Nov 2025 04:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763612419;
	bh=s/EAxZCgKXtMb5DmiQwa6cGPDgBc7z6NW6vt2TTeWEY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=l4eilxlG6/lEMDTDMxpksWq6tUsE5o7ceQpYyW7Vp+hvyD8bRoyrRjV2xcYSnvZ5N
	 Rtvh7bFQielw/6yPm8lXCV0IPIZCpIt+WtI0yta0adY2nO366poTUlb/CI14SsnYMG
	 /OqfdmKHh0ODBpGQ+UxCTnHrNQ1PrkgSyHbN3+5k5jh3xePxNjQ+H4kZ6HcEqZ+czu
	 0eKcfX2HTCQFPsrONxutkR6b0qUbraGTu751rw0hjlLdpTf+Vy99t5hzDQ3/cI/xiS
	 YBzOpqjQEYjInf+QHCbJZix5spSKoRC7fGjKzyz6yBh/HgTLFghO+ln9IqBh1wJvJ3
	 +sKIiq77rVT0Q==
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] riscv: mm: use xchg() on non-atomic_long_t variables, not atomic_long_xchg()
Date: Wed, 19 Nov 2025 21:18:30 -0700
Message-ID: <20251120042001.1766011-4-pjw@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251120042001.1766011-1-pjw@kernel.org>
References: <20251120042001.1766011-1-pjw@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_202020_257283_EDBB8AB0 
X-CRM114-Status: UNSURE (   9.42  )
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

Let's not call atomic_long_xchg() on something that's not an
atomic_long_t, and just use xchg() instead.  Continues the cleanup
from commit 546e42c8c6d94 ("riscv: Use an atomic xchg in
pudp_huge_get_and_clear()"),

Cc: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/include/asm/pgtable.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e1610d031199..a1ffa502739b 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -591,7 +591,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long address, pte_t *ptep)
 {
 #ifdef CONFIG_SMP
-	pte_t pte = __pte(atomic_long_xchg((atomic_long_t *)ptep, 0));
+	pte_t pte = __pte(xchg(&ptep->pte, 0));
 #else
 	pte_t pte = *ptep;
 
@@ -868,7 +868,7 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 					unsigned long address, pmd_t *pmdp)
 {
 #ifdef CONFIG_SMP
-	pmd_t pmd = __pmd(atomic_long_xchg((atomic_long_t *)pmdp, 0));
+	pmd_t pmd = __pmd(xchg(&pmdp->pmd, 0));
 #else
 	pmd_t pmd = *pmdp;
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
