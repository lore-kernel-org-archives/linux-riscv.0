Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48614C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 09:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MneLe1qprxzVZhp5T3AczE3s3909S08AL6LuYIqmyWA=; b=XDD8E+7QeQABIN
	H0w1qejs0+xQObfplrGZrAqQyyJZgwh+yrodxjJ2UU2/z5EnGnighjsU1pIFVf2c732ZRHRcLT0dX
	1cEsM4oBYj0TkXgA3pYdqjJpSbCXNqKmLzuJn2Crr18LwQ9+ogK4Ujk9kyVgzcQj2YUZUtd/y5A+L
	iPLR86Z9fPsKo0Npav1e5qih1E5W8RYjb/J4C0eF0Qe7CrIdFpd4aOaFxZll659IAf7q9uUeX2nWP
	8OlSYpAwMI5Sm+8BGydQPo+4goLPAx9s0iPG6Yq+upMbJalFQB6A1trpXectEV35knB9GgEHHK+KU
	b7qrKutt2uJSVlvx8mCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYjSc-0000000EbH0-2ZCA;
	Tue, 30 Jul 2024 09:48:02 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYjSZ-0000000EbCr-0Ruh
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 09:48:00 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WY9J7496MzyN4p;
	Tue, 30 Jul 2024 17:42:47 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id BAA0D180105;
	Tue, 30 Jul 2024 17:47:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi100008.china.huawei.com
 (7.221.188.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 30 Jul
 2024 17:47:43 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alexghiti@rivosinc.com>, <peterlin@andestech.com>, <bjorn@rivosinc.com>,
	<akpm@linux-foundation.org>, <david@redhat.com>, <shikemeng@huaweicloud.com>,
	<samuel.holland@sifive.com>, <willy@infradead.org>, <charlie@rivosinc.com>,
	<leobras@redhat.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH] riscv: mm: Add support for uffd write-protect support
Date: Tue, 30 Jul 2024 17:53:25 +0800
Message-ID: <20240730095325.3540198-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi100008.china.huawei.com (7.221.188.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_024759_558158_64762AEA 
X-CRM114-Status: GOOD (  11.36  )
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

Use the 9th bit in the PTE for uffd-wp mark, which used for devmap and
is ready to be freed up.

The standard handlers are implemented for set/test/clear for both pte and
pmd. Additionally we must also track the uffd-wp state as a pte swp bit,
so use the 4th free bit for uffd-wp state track.

Rebased on commit 216e04bf1e4d ("riscv: mm: Add support for ZONE_DEVICE")
has been removed.

And uffd-unit-tests, uffd-stress test pass.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Link: https://lore.kernel.org/all/47c26640cd85f3db2e0a2796047199bb984d1b3f.1719386613.git-series.apopple@nvidia.com/
---
 arch/riscv/Kconfig                    |  1 +
 arch/riscv/include/asm/pgtable-bits.h |  5 +++
 arch/riscv/include/asm/pgtable.h      | 65 +++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index cf16c6108b8f..e6e224bc106c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -130,6 +130,7 @@ config RISCV
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
 	select HAVE_ARCH_USERFAULTFD_MINOR if 64BIT && USERFAULTFD
+	select HAVE_ARCH_USERFAULTFD_WP if 64BIT && USERFAULTFD
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_CONTEXT_TRACKING_USER
diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index 179bd4afece4..5719d2b8d064 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -19,6 +19,8 @@
 #define _PAGE_SOFT      (3 << 8)    /* Reserved for software */
 
 #define _PAGE_SPECIAL   (1 << 8)    /* RSW: 0x1 */
+#define _PAGE_UFFD_WP   (1 << 9)    /* RSW, userfaultfd wrprotected */
+
 #define _PAGE_TABLE     _PAGE_PRESENT
 
 /*
@@ -30,6 +32,9 @@
 /* Used for swap PTEs only. */
 #define _PAGE_SWP_EXCLUSIVE _PAGE_ACCESSED
 
+/* Used for swap PTEs only. */
+#define _PAGE_SWP_UFFD_WP _PAGE_USER
+
 #define _PAGE_PFN_SHIFT 10
 
 /*
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 81b838c6dafa..33b79ed8403f 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -449,6 +449,23 @@ static inline pte_t pte_mkhuge(pte_t pte)
 	return pte;
 }
 
+#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
+static inline int pte_uffd_wp(pte_t pte)
+{
+	return !!(pte_val(pte) & _PAGE_UFFD_WP);
+}
+
+static inline pte_t pte_mkuffd_wp(pte_t pte)
+{
+	return __pte(pte_val(pte) | _PAGE_UFFD_WP);
+}
+
+static inline pte_t pte_clear_uffd_wp(pte_t pte)
+{
+	return __pte(pte_val(pte) & ~(_PAGE_UFFD_WP));
+}
+#endif /* CONFIG_HAVE_ARCH_USERFAULTFD_WP */
+
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
 #define pte_leaf_size(pte)	(pte_napot(pte) ?				\
 					napot_cont_size(napot_cont_order(pte)) :\
@@ -824,6 +841,7 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
  * Format of swap PTE:
  *	bit            0:	_PAGE_PRESENT (zero)
  *	bit       1 to 3:       _PAGE_LEAF (zero)
+ *	bit            4:	uffd-wp state
  *	bit            5:	_PAGE_PROT_NONE (zero)
  *	bit            6:	exclusive marker
  *	bits      7 to 11:	swap type
@@ -861,6 +879,53 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 	return __pte(pte_val(pte) & ~_PAGE_SWP_EXCLUSIVE);
 }
 
+#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
+static inline pte_t pte_swp_mkuffd_wp(pte_t pte)
+{
+	return __pte(pte_val(pte) | _PAGE_SWP_UFFD_WP);
+}
+
+static inline int pte_swp_uffd_wp(pte_t pte)
+{
+	return !!(pte_val(pte) & _PAGE_SWP_UFFD_WP);
+}
+
+static inline pte_t pte_swp_clear_uffd_wp(pte_t pte)
+{
+	return __pte(pte_val(pte) & ~_PAGE_SWP_UFFD_WP);
+}
+
+static inline int pmd_uffd_wp(pmd_t pmd)
+{
+	return pte_uffd_wp(pmd_pte(pmd));
+}
+
+static inline pmd_t pmd_mkuffd_wp(pmd_t pmd)
+{
+	return pte_pmd(pte_mkuffd_wp(pmd_pte(pmd)));
+}
+
+static inline pmd_t pmd_clear_uffd_wp(pmd_t pmd)
+{
+	return pte_pmd(pte_clear_uffd_wp(pmd_pte(pmd)));
+}
+
+static inline int pmd_swp_uffd_wp(pmd_t pmd)
+{
+	return pte_swp_uffd_wp(pmd_pte(pmd));
+}
+
+static inline pmd_t pmd_swp_mkuffd_wp(pmd_t pmd)
+{
+	return pte_pmd(pte_swp_mkuffd_wp(pmd_pte(pmd)));
+}
+
+static inline pmd_t pmd_swp_clear_uffd_wp(pmd_t pmd)
+{
+	return pte_pmd(pte_swp_clear_uffd_wp(pmd_pte(pmd)));
+}
+#endif /* CONFIG_HAVE_ARCH_USERFAULTFD_WP */
+
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
 #define __pmd_to_swp_entry(pmd) ((swp_entry_t) { pmd_val(pmd) })
 #define __swp_entry_to_pmd(swp) __pmd((swp).val)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
