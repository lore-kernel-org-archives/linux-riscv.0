Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F01CAC59D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 10:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pjGUNGk/pskIvVZTGhbfHn8KsG8S79y2B0RNfvyqwuI=; b=UD+QD7mXkIAxAu
	+T2cMmgGiEqpdqAG4Tdefu6J0Y8Dv2iQ4ymi8n3+mUChkpPvuDLYwvQ6y2qwBuo4Ga4Cpteipli00
	62d3nVTSMMmC43yEkKdVgPvL8VcSlmPRNEMy6sHWi3JbZ8lMiG+SryaZmrLwhBO5VIFwUwiHCHwKp
	r9IbcG1RS1e1WfjLgbGqw7q9eJsUZqY/gpIyW48JNtJDoG4DIkg4zh8FJ3TR9q8XxfgWMvmJCTKu3
	OG/RmvTwKhT0J3Ip0yZssyKMTegbkUT6Z8LOlBuucXtvJit5W4YIG5fa4qf90hN9R3h99MhdF2+s5
	VwcE9uCKOejIfwdm5gVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6EF-00000003bMb-2Eb5;
	Mon, 15 Sep 2025 10:14:35 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6EC-00000003bJ5-1gEj
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 10:14:34 +0000
Received: from ubt.. (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAD3lxHf5sdoHWn3Ag--.53429S4;
	Mon, 15 Sep 2025 18:13:55 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Xu <peterx@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH V12 2/5] mm: userfaultfd: Add pgtable_supports_uffd_wp()
Date: Mon, 15 Sep 2025 18:13:40 +0800
Message-Id: <20250915101343.1449546-3-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915101343.1449546-1-zhangchunyan@iscas.ac.cn>
References: <20250915101343.1449546-1-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAD3lxHf5sdoHWn3Ag--.53429S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr1DGFWrJr1DWr15Xw15XFb_yoWxZFyUpF
	4rGw43Xw4ktF97Ga93JF48C3s8Zw4xGFyDGryF9a18A3W3t39YvFyFkF1rKr97Jr4kWry3
	tF17trZ3Cr42vF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x
	0262kKe7AKxVW8ZVWrXwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
	JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7IUnaXdUUUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiCRAGB2jHtda7WAAAs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_031432_809486_225F5ABF 
X-CRM114-Status: GOOD (  17.33  )
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

Some platforms can customize the PTE/PMD entry uffd-wp bit making
it unavailable even if the architecture provides the resource.
This patch adds a macro API that allows architectures to define their
specific implementations to check if the uffd-wp bit is available
on which device the kernel is running.

Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
---
 fs/userfaultfd.c                   | 22 +++++++++++-----------
 include/asm-generic/pgtable_uffd.h | 17 +++++++++++++++++
 include/linux/mm_inline.h          | 10 ++++++++--
 include/linux/userfaultfd_k.h      | 27 +++++++++++++--------------
 mm/memory.c                        |  6 ++++--
 5 files changed, 53 insertions(+), 29 deletions(-)

diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index 54c6cc7fe9c6..e41736ffa202 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -1270,9 +1270,9 @@ static int userfaultfd_register(struct userfaultfd_ctx *ctx,
 	if (uffdio_register.mode & UFFDIO_REGISTER_MODE_MISSING)
 		vm_flags |= VM_UFFD_MISSING;
 	if (uffdio_register.mode & UFFDIO_REGISTER_MODE_WP) {
-#ifndef CONFIG_HAVE_ARCH_USERFAULTFD_WP
-		goto out;
-#endif
+		if (!pgtable_supports_uffd_wp())
+			goto out;
+
 		vm_flags |= VM_UFFD_WP;
 	}
 	if (uffdio_register.mode & UFFDIO_REGISTER_MODE_MINOR) {
@@ -1980,14 +1980,14 @@ static int userfaultfd_api(struct userfaultfd_ctx *ctx,
 	uffdio_api.features &=
 		~(UFFD_FEATURE_MINOR_HUGETLBFS | UFFD_FEATURE_MINOR_SHMEM);
 #endif
-#ifndef CONFIG_HAVE_ARCH_USERFAULTFD_WP
-	uffdio_api.features &= ~UFFD_FEATURE_PAGEFAULT_FLAG_WP;
-#endif
-#ifndef CONFIG_PTE_MARKER_UFFD_WP
-	uffdio_api.features &= ~UFFD_FEATURE_WP_HUGETLBFS_SHMEM;
-	uffdio_api.features &= ~UFFD_FEATURE_WP_UNPOPULATED;
-	uffdio_api.features &= ~UFFD_FEATURE_WP_ASYNC;
-#endif
+	if (!pgtable_supports_uffd_wp())
+		uffdio_api.features &= ~UFFD_FEATURE_PAGEFAULT_FLAG_WP;
+
+	if (!uffd_supports_wp_marker()) {
+		uffdio_api.features &= ~UFFD_FEATURE_WP_HUGETLBFS_SHMEM;
+		uffdio_api.features &= ~UFFD_FEATURE_WP_UNPOPULATED;
+		uffdio_api.features &= ~UFFD_FEATURE_WP_ASYNC;
+	}
 
 	ret = -EINVAL;
 	if (features & ~uffdio_api.features)
diff --git a/include/asm-generic/pgtable_uffd.h b/include/asm-generic/pgtable_uffd.h
index 828966d4c281..200da65262a8 100644
--- a/include/asm-generic/pgtable_uffd.h
+++ b/include/asm-generic/pgtable_uffd.h
@@ -1,6 +1,23 @@
 #ifndef _ASM_GENERIC_PGTABLE_UFFD_H
 #define _ASM_GENERIC_PGTABLE_UFFD_H
 
+/*
+ * Some platforms can customize the uffd-wp bit, making it unavailable
+ * even if the architecture provides the resource.
+ * Adding this API allows architectures to add their own checks for the
+ * devices on which the kernel is running.
+ * Note: When overriding it, please make sure the
+ * CONFIG_HAVE_ARCH_USERFAULTFD_WP is part of this macro.
+ */
+#ifndef pgtable_supports_uffd_wp
+#define pgtable_supports_uffd_wp()	IS_ENABLED(CONFIG_HAVE_ARCH_USERFAULTFD_WP)
+#endif
+
+static __always_inline bool uffd_supports_wp_marker(void)
+{
+	return pgtable_supports_uffd_wp() && IS_ENABLED(CONFIG_PTE_MARKER_UFFD_WP);
+}
+
 #ifndef CONFIG_HAVE_ARCH_USERFAULTFD_WP
 static __always_inline int pte_uffd_wp(pte_t pte)
 {
diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index 89b518ff097e..d6526a7f034b 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -570,9 +570,15 @@ static inline bool
 pte_install_uffd_wp_if_needed(struct vm_area_struct *vma, unsigned long addr,
 			      pte_t *pte, pte_t pteval)
 {
-#ifdef CONFIG_PTE_MARKER_UFFD_WP
 	bool arm_uffd_pte = false;
 
+	/*
+	 * Some platforms can customize the PTE uffd-wp bit, making it unavailable
+	 * even if the architecture allows providing the PTE resource.
+	 */
+	if (!uffd_supports_wp_marker())
+		return false;
+
 	/* The current status of the pte should be "cleared" before calling */
 	WARN_ON_ONCE(!pte_none(ptep_get(pte)));
 
@@ -601,7 +607,7 @@ pte_install_uffd_wp_if_needed(struct vm_area_struct *vma, unsigned long addr,
 			   make_pte_marker(PTE_MARKER_UFFD_WP));
 		return true;
 	}
-#endif
+
 	return false;
 }
 
diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index c0e716aec26a..c19435863076 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -228,15 +228,14 @@ static inline bool vma_can_userfault(struct vm_area_struct *vma,
 	if (wp_async && (vm_flags == VM_UFFD_WP))
 		return true;
 
-#ifndef CONFIG_PTE_MARKER_UFFD_WP
 	/*
 	 * If user requested uffd-wp but not enabled pte markers for
 	 * uffd-wp, then shmem & hugetlbfs are not supported but only
 	 * anonymous.
 	 */
-	if ((vm_flags & VM_UFFD_WP) && !vma_is_anonymous(vma))
+	if (!uffd_supports_wp_marker() && (vm_flags & VM_UFFD_WP) &&
+	    !vma_is_anonymous(vma))
 		return false;
-#endif
 
 	/* By default, allow any of anon|shmem|hugetlb */
 	return vma_is_anonymous(vma) || is_vm_hugetlb_page(vma) ||
@@ -436,28 +435,26 @@ static inline bool userfaultfd_wp_use_markers(struct vm_area_struct *vma)
 
 static inline bool pte_marker_entry_uffd_wp(swp_entry_t entry)
 {
-#ifdef CONFIG_PTE_MARKER_UFFD_WP
+	if (!uffd_supports_wp_marker())
+		return false;
+
 	return is_pte_marker_entry(entry) &&
-	    (pte_marker_get(entry) & PTE_MARKER_UFFD_WP);
-#else
-	return false;
-#endif
+	       (pte_marker_get(entry) & PTE_MARKER_UFFD_WP);
 }
 
 static inline bool pte_marker_uffd_wp(pte_t pte)
 {
-#ifdef CONFIG_PTE_MARKER_UFFD_WP
 	swp_entry_t entry;
 
+	if (!uffd_supports_wp_marker())
+		return false;
+
 	if (!is_swap_pte(pte))
 		return false;
 
 	entry = pte_to_swp_entry(pte);
 
 	return pte_marker_entry_uffd_wp(entry);
-#else
-	return false;
-#endif
 }
 
 /*
@@ -466,7 +463,9 @@ static inline bool pte_marker_uffd_wp(pte_t pte)
  */
 static inline bool pte_swp_uffd_wp_any(pte_t pte)
 {
-#ifdef CONFIG_PTE_MARKER_UFFD_WP
+	if (!uffd_supports_wp_marker())
+		return false;
+
 	if (!is_swap_pte(pte))
 		return false;
 
@@ -475,7 +474,7 @@ static inline bool pte_swp_uffd_wp_any(pte_t pte)
 
 	if (pte_marker_uffd_wp(pte))
 		return true;
-#endif
+
 	return false;
 }
 
diff --git a/mm/memory.c b/mm/memory.c
index 0ba4f6b71847..607e14177412 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1465,7 +1465,9 @@ zap_install_uffd_wp_if_needed(struct vm_area_struct *vma,
 {
 	bool was_installed = false;
 
-#ifdef CONFIG_PTE_MARKER_UFFD_WP
+	if (!uffd_supports_wp_marker())
+		return false;
+
 	/* Zap on anonymous always means dropping everything */
 	if (vma_is_anonymous(vma))
 		return false;
@@ -1482,7 +1484,7 @@ zap_install_uffd_wp_if_needed(struct vm_area_struct *vma,
 		pte++;
 		addr += PAGE_SIZE;
 	}
-#endif
+
 	return was_installed;
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
