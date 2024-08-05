Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8B6C52D70
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7yk48ycKrnymRdG2ib1eyzixgkmI6XLdBRX7hyqxJrw=; b=ALMwKOxd80bvut
	QYz4GR2w4pUhuwDsbTLNmjO4beXAhbUn/+hTg8kEDJcHgbRGrcReR+RArpD641a2fLdlpilRjDdk1
	dh+7Mo31p2qCPgnthrgzIgDB0PRIA8dTPebm79Eajl3Vvancveziafa9f9pmpI+nJUWcLYyw7sQsV
	WZz2steUfA5yllwuIVkxnbSwy11ojbLDP5csPu3TDg0UIddmRjYXbQoDdlwT9IaR0JhSmUjFtrpCo
	BWgK4oI6Ng3cSM3QcC6SWr0zeYEpk+RADuWI3GiGQorTcWOYbKWDmTVoAokZb6zzsyyfCpy5jkBUZ
	eY+9JgZPqPxKAqNitztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sauPk-0000000FOLy-1fdh;
	Mon, 05 Aug 2024 09:54:04 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sauPg-0000000FOJQ-3pBP
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 09:54:03 +0000
Received: from ubt.. (unknown [210.73.53.31])
	by APP-03 (Coremail) with SMTP id rQCowACHjvoJobBmMT6cAw--.14790S5;
	Mon, 05 Aug 2024 17:53:18 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH V3 3/3] riscv: mm: Add uffd write-protect support
Date: Mon,  5 Aug 2024 17:52:43 +0800
Message-Id: <20240805095243.44809-4-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240805095243.44809-1-zhangchunyan@iscas.ac.cn>
References: <20240805095243.44809-1-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowACHjvoJobBmMT6cAw--.14790S5
X-Coremail-Antispam: 1UD129KBjvJXoWxWw1xuFy3Cr47Aw4xGw4rZrb_yoWrWrWkpF
	s5Ga1rurWDJFn7KayfGrW8Kr4rZw45Wa4DXr9xua1kJFWUKrWDXF95Kw1aqryrXFWvq34x
	JrWrKr4rCr47AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPab7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY02
	Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU
	xwIDUUUUU
X-Originating-IP: [210.73.53.31]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiCQ4AB2awi9k5hwABs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_025401_374632_24B11752 
X-CRM114-Status: GOOD (  10.97  )
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

Reuse PTE bit(9) to do uffd-wp tracking and make it mutually exclusive
with soft-dirty and DEVMAP which all use this PTE bit.

Additionally for tracking the uffd-wp state as a PTE swap bit,
we use swap entry pte bit(4) which is also used by swap
soft-dirty tracking.

Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
---
 arch/riscv/Kconfig                    |  7 +++
 arch/riscv/include/asm/pgtable-bits.h | 13 ++++++
 arch/riscv/include/asm/pgtable.h      | 64 +++++++++++++++++++++++++++
 3 files changed, 84 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f1460fc01cd4..aa595a5ed4b8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -971,6 +971,13 @@ config RISCV_HAS_SOFT_DIRTY
 	help
 	  The PTE bit(9) is used for soft-dirty tracking.
 
+config RISCV_HAS_USERFAULTFD_WP
+	bool "userfaultfd write protection"
+	select HAVE_ARCH_USERFAULTFD_WP
+	depends on USERFAULTFD
+	help
+	  The PTE bit(9) is used for userfaultfd write-protected
+	  tracking.
 endchoice
 
 endmenu # "Kernel features"
diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index c6d51fe9fc6f..7de16141c049 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -38,6 +38,19 @@
 #define _PAGE_SWP_SOFT_DIRTY	0
 #endif /* CONFIG_MEM_SOFT_DIRTY */
 
+#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
+/*
+ * CONFIG_HAVE_ARCH_USERFAULTFD_WP is mutually exclusive with
+ * HAVE_ARCH_SOFT_DIRTY so we can use the same bit for uffd-wp
+ * and soft-dirty tracking.
+ */
+#define _PAGE_UFFD_WP		(1 << 9) /* RSW: 0x2 for uffd-wp tracking */
+#define _PAGE_SWP_UFFD_WP	_PAGE_USER
+#else
+#define _PAGE_UFFD_WP		0
+#define _PAGE_SWP_UFFD_WP	0
+#endif
+
 #define _PAGE_TABLE     _PAGE_PRESENT
 
 /*
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ddf6e4f44252..c6e790e75309 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -417,6 +417,38 @@ static inline pte_t pte_wrprotect(pte_t pte)
 	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
 }
 
+#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
+static inline int pte_uffd_wp(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_UFFD_WP;
+}
+
+static inline pte_t pte_mkuffd_wp(pte_t pte)
+{
+	return pte_wrprotect(__pte(pte_val(pte) | _PAGE_UFFD_WP));
+}
+
+static inline pte_t pte_clear_uffd_wp(pte_t pte)
+{
+	return __pte(pte_val(pte) & ~(_PAGE_UFFD_WP));
+}
+
+static inline int pte_swp_uffd_wp(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_SWP_UFFD_WP;
+}
+
+static inline pte_t pte_swp_mkuffd_wp(pte_t pte)
+{
+	return pte_wrprotect(__pte(pte_val(pte) | _PAGE_SWP_UFFD_WP));
+}
+
+static inline pte_t pte_swp_clear_uffd_wp(pte_t pte)
+{
+	return __pte(pte_val(pte) & ~(_PAGE_SWP_UFFD_WP));
+}
+#endif /* CONFIG_HAVE_ARCH_USERFAULTFD_WP */
+
 /* static inline pte_t pte_mkread(pte_t pte) */
 
 static inline pte_t pte_mkwrite_novma(pte_t pte)
@@ -783,6 +815,38 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
 	return pte_pmd(pte_mkdevmap(pmd_pte(pmd)));
 }
 
+#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
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
 #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
 static inline int pmd_soft_dirty(pmd_t pmd)
 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
