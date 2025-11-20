Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515E7CF64B0
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 04:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NHbb4fCEyThEhG6J//Flgnzq5itYk2uD5/rB7J59sYs=; b=NKziM3bwzc+8FM
	XWC4MEhNVjRR4TBiX0tgjpYpgv5fr2n8CbKmt2bezTGqaMyJszbmIup8m1GbqSSJHKA9GSsCsiJC5
	NkX9MKx/vK6NjG63A3gEbBjkKQZptwyjK0wdhbprXi7/L4PCHvaSBJmzjF4tlN3pWqTZboGLXghl/
	xi8bN1YYC/tCWBKIdfz9GVmw7l7OEqP4EC8Oud2G1AxEm2BTlmZEBlixmGK4mp1O27qNjZmUVVmwA
	knZBjgJe+aW7KDWjyUPcCsIrf7fl3GMGP8t5gYgkASwvdbJ8E5Q/NMYm5t4W5U9WV0U6X85w5Z+kn
	J/IC6q8M+RQ+zEJYI+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLw9a-000000067kV-2h05;
	Thu, 20 Nov 2025 04:20:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLw9X-000000067jz-3kU4
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 04:20:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F3ED60174
	for <linux-riscv@lists.infradead.org>; Thu, 20 Nov 2025 04:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA12C16AAE
	for <linux-riscv@lists.infradead.org>; Thu, 20 Nov 2025 04:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763612414;
	bh=uQ6jPpidLX4uOgAlX5NronHl7gblyLMczfkFI2J2Ulc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=h2Y/kkbss+Oni0zWcK4LZGdFYbYWH+c+fFZfEexYa1hJ88quB22XAyYhMW8wHeuv3
	 3td1C9AUUyijvRmw9m1iR2E4cyHyXAuc7N7xGD9UjYfVpjn119xW02BMv6cBmg+DBJ
	 IpidnfkNkkOLYK2yIg6cL8wtWVf+uVJu6W6cCNEjpQGZi0FGhsQ12FMok7KQSQxE41
	 wdAInTTrBN9DgyjbJtW+LvNPjDV6J/x1jJcN+f+swL5z+bctDwOMroq8z2Ghi22ZqG
	 PtPGJ9jEWHqQpsdzPEO4/za4pUIyaVV0t0Gzd7X2gcLwj5aE+Wyq06/osCX98pYEWv
	 i/L6xQ/voUraA==
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 1/3] riscv: mm: pmdp_huge_get_and_clear(): avoid atomic ops when !CONFIG_SMP
Date: Wed, 19 Nov 2025 21:18:28 -0700
Message-ID: <20251120042001.1766011-2-pjw@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251120042001.1766011-1-pjw@kernel.org>
References: <20251120042001.1766011-1-pjw@kernel.org>
MIME-Version: 1.0
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
pmdp_huge_get_and_clear(), so, similar to what x86 does, let's not use
atomics in this case.  See also commit 546e42c8c6d94 ("riscv: Use an
atomic xchg in pudp_huge_get_and_clear()").

Cc: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/include/asm/pgtable.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5a08eb5fe99f..64a2197e6d97 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -861,7 +861,13 @@ static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 					unsigned long address, pmd_t *pmdp)
 {
+#ifdef CONFIG_SMP
 	pmd_t pmd = __pmd(atomic_long_xchg((atomic_long_t *)pmdp, 0));
+#else
+	pmd_t pmd = *pmdp;
+
+	pmd_clear(pmdp);
+#endif
 
 	page_table_check_pmd_clear(mm, pmd);
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
