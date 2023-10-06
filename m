Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5982CE92FF9
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 09:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iJbFteGvdkz3V6H21Qd8PoGBUxdgZf4eRPUfu1qcAw=; b=aFn+ZKNCug62z7
	PO2pbb3Llgr7Br259nmv/8/+duh5n+R1zSriDJbzNPaOLHpI7JZXABQ4NiBQvjMqcxQNGlwyyRJy4
	vQJwfGA0xJy161PVuT+1DUdT7WHCmPDih1RNIXll7sqKLVmfwtz5zzhqlxDMn5kaKXGfz1CDATOJF
	+/qav/QvLIjXDTojfbALU9QH4zA/nruSLPc9c026Nchc7rDG+pvc5uyKdFLTCu3kM30sz0uh/EuFb
	uLaSNjwrOFSHUleZgukIkmyOFt3gYWN4/kH4gmJ61uwy2fGdmMOJ45mMEbdZMJDKYwe17UyUGgtiG
	ojIvUMfaQ9KCKXLUfWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qohBM-005Oib-04;
	Fri, 06 Oct 2023 09:31:40 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qohBI-005Ohh-2O
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 09:31:38 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-406650da82bso17043045e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Oct 2023 02:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696584694; x=1697189494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XW7A9oA+n1MGMkCXJe0m6VYvf+I2ZYEJ+oZKrMZZsA=;
        b=1h+YxH+43F2sKO+owirzmgXGtWNVogxV1ULD8LU433bLNE+pAjIycSA3h+Uc0e/pTc
         6Q8xiFNs3nwjK5t3aQz48vhGhwbAyAYUvxmMYdnjbgrbhgI9gLMBpfjsr56XZXmel/Vr
         i+d9+iK+OjZ/4UHfj4pzMo8JDVA4k08N3NinmK0Esf8sXxqeNrChDV6mJZdB2gD6oFWl
         fYl1UObao8qSmY2G8xSd7lhbi07eUzf1Ct4R6gSCUDWd6zMgzbKOHU4kx3KzQUwJd6aL
         xUut1lRYszQY+pf7dipJg7+ef9zeZ1IDQJzKtAWR/vHDETL5WZVlvb/9rJl+11LXhLss
         SKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696584694; x=1697189494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XW7A9oA+n1MGMkCXJe0m6VYvf+I2ZYEJ+oZKrMZZsA=;
        b=LdS8+0esAEu2ABi80Xs57S4y6HeNx2D8J9IrhR2RzqXfXykwgedq4jTJlx70LPOY6D
         0Y05YRG46Yo1PFAR89DJzt4NrYKdIFsM7E57fYS8h/uvaYsFHv0g0w09vp0SG0ToMCFI
         GP7IOGsXIcpa6AKJz08ggynWW2SnWClm3ocL60IaUYcaGFHn8Rr3aYUCzunr9dOn3B7Z
         NCH+KTvaISXptn3o8PNctXsYMnHXVD9Nh2wdi5h2/ctVn5ADC9SBx46RICi6wr39W5u3
         bt4ki9PBOZrfeFEmHQC8fdw8kXiI8bzOMHYT2ZkmWa70IYgH+kKljewgPChaA7ac0hEj
         QFdA==
X-Gm-Message-State: AOJu0YxHqhAclxqrwA0zcroUxLwXb/Yeo3hFwzVM1m7RU4VWS2hWKQj6
	XyCHM8HdkKYXHbHPNAL7v1uWEA==
X-Google-Smtp-Source: AGHT+IECOh4aKcdWw6Ubv05K2Tj1mMWcWsL9IQfL+dVU9Bq5vQnOIGUvAoDnGQUyvbm42cKDz2UJFg==
X-Received: by 2002:a05:600c:2a4e:b0:405:49aa:d578 with SMTP id x14-20020a05600c2a4e00b0040549aad578mr7123254wme.37.1696584694531;
        Fri, 06 Oct 2023 02:31:34 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id e14-20020adffd0e000000b00315af025098sm1227483wrr.46.2023.10.06.02.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 02:31:34 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 2/2] riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings
Date: Fri,  6 Oct 2023 11:29:30 +0200
Message-Id: <20231006092930.15850-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006092930.15850-1-alexghiti@rivosinc.com>
References: <20231006092930.15850-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_023136_782002_F87DD71B 
X-CRM114-Status: GOOD (  21.76  )
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

When STRICT_KERNEL_RWX is set, any change of permissions on any kernel
mapping (vmalloc/modules/kernel text...etc) should be applied on its
linear mapping alias. The problem is that the riscv kernel uses huge
mappings for the linear mapping and walk_page_range_novma() does not
split those huge mappings.

So this patchset implements such split in order to apply fine-grained
permissions on the linear mapping.

Below is the difference before and after (the first PUD mapping is split
into PTE/PMD mappings):

Before:

---[ Linear mapping ]---
0xffffaf8000080000-0xffffaf8000200000    0x0000000080080000      1536K PTE     D A G . . W R V
0xffffaf8000200000-0xffffaf8077c00000    0x0000000080200000      1914M PMD     D A G . . W R V
0xffffaf8077c00000-0xffffaf8078800000    0x00000000f7c00000        12M PMD     D A G . . . R V
0xffffaf8078800000-0xffffaf8078c00000    0x00000000f8800000         4M PMD     D A G . . W R V
0xffffaf8078c00000-0xffffaf8079200000    0x00000000f8c00000         6M PMD     D A G . . . R V
0xffffaf8079200000-0xffffaf807e600000    0x00000000f9200000        84M PMD     D A G . . W R V
0xffffaf807e600000-0xffffaf807e716000    0x00000000fe600000      1112K PTE     D A G . . W R V
0xffffaf807e717000-0xffffaf807e71a000    0x00000000fe717000        12K PTE     D A G . . W R V
0xffffaf807e71d000-0xffffaf807e71e000    0x00000000fe71d000         4K PTE     D A G . . W R V
0xffffaf807e722000-0xffffaf807e800000    0x00000000fe722000       888K PTE     D A G . . W R V
0xffffaf807e800000-0xffffaf807fe00000    0x00000000fe800000        22M PMD     D A G . . W R V
0xffffaf807fe00000-0xffffaf807ff54000    0x00000000ffe00000      1360K PTE     D A G . . W R V
0xffffaf807ff55000-0xffffaf8080000000    0x00000000fff55000       684K PTE     D A G . . W R V
0xffffaf8080000000-0xffffaf8400000000    0x0000000100000000        14G PUD     D A G . . W R V

After:

---[ Linear mapping ]---
0xffffaf8000080000-0xffffaf8000200000    0x0000000080080000      1536K PTE     D A G . . W R V
0xffffaf8000200000-0xffffaf8077c00000    0x0000000080200000      1914M PMD     D A G . . W R V
0xffffaf8077c00000-0xffffaf8078800000    0x00000000f7c00000        12M PMD     D A G . . . R V
0xffffaf8078800000-0xffffaf8078a00000    0x00000000f8800000         2M PMD     D A G . . W R V
0xffffaf8078a00000-0xffffaf8078c00000    0x00000000f8a00000         2M PTE     D A G . . W R V
0xffffaf8078c00000-0xffffaf8079200000    0x00000000f8c00000         6M PMD     D A G . . . R V
0xffffaf8079200000-0xffffaf807e600000    0x00000000f9200000        84M PMD     D A G . . W R V
0xffffaf807e600000-0xffffaf807e716000    0x00000000fe600000      1112K PTE     D A G . . W R V
0xffffaf807e717000-0xffffaf807e71a000    0x00000000fe717000        12K PTE     D A G . . W R V
0xffffaf807e71d000-0xffffaf807e71e000    0x00000000fe71d000         4K PTE     D A G . . W R V
0xffffaf807e722000-0xffffaf807e800000    0x00000000fe722000       888K PTE     D A G . . W R V
0xffffaf807e800000-0xffffaf807fe00000    0x00000000fe800000        22M PMD     D A G . . W R V
0xffffaf807fe00000-0xffffaf807ff54000    0x00000000ffe00000      1360K PTE     D A G . . W R V
0xffffaf807ff55000-0xffffaf8080000000    0x00000000fff55000       684K PTE     D A G . . W R V
0xffffaf8080000000-0xffffaf8080800000    0x0000000100000000         8M PMD     D A G . . W R V
0xffffaf8080800000-0xffffaf8080af6000    0x0000000100800000      3032K PTE     D A G . . W R V
0xffffaf8080af6000-0xffffaf8080af8000    0x0000000100af6000         8K PTE     D A G . X . R V
0xffffaf8080af8000-0xffffaf8080c00000    0x0000000100af8000      1056K PTE     D A G . . W R V
0xffffaf8080c00000-0xffffaf8081a00000    0x0000000100c00000        14M PMD     D A G . . W R V
0xffffaf8081a00000-0xffffaf8081a40000    0x0000000101a00000       256K PTE     D A G . . W R V
0xffffaf8081a40000-0xffffaf8081a44000    0x0000000101a40000        16K PTE     D A G . X . R V
0xffffaf8081a44000-0xffffaf8081a52000    0x0000000101a44000        56K PTE     D A G . . W R V
0xffffaf8081a52000-0xffffaf8081a54000    0x0000000101a52000         8K PTE     D A G . X . R V
...
0xffffaf809e800000-0xffffaf80c0000000    0x000000011e800000       536M PMD     D A G . . W R V
0xffffaf80c0000000-0xffffaf8400000000    0x0000000140000000        13G PUD     D A G . . W R V

Note that this also fixes memfd_secret() syscall which uses
set_direct_map_invalid_noflush() and set_direct_map_default_noflush() to
remove the pages from the linear mapping. Below is the kernel page table
while a memfd_secret() syscall is running, you can see all the !valid
page table entries in the linear mapping:

...
0xffffaf8082240000-0xffffaf8082241000    0x0000000102240000         4K PTE     D A G . . W R .
0xffffaf8082241000-0xffffaf8082250000    0x0000000102241000        60K PTE     D A G . . W R V
0xffffaf8082250000-0xffffaf8082252000    0x0000000102250000         8K PTE     D A G . . W R .
0xffffaf8082252000-0xffffaf8082256000    0x0000000102252000        16K PTE     D A G . . W R V
0xffffaf8082256000-0xffffaf8082257000    0x0000000102256000         4K PTE     D A G . . W R .
0xffffaf8082257000-0xffffaf8082258000    0x0000000102257000         4K PTE     D A G . . W R V
0xffffaf8082258000-0xffffaf8082259000    0x0000000102258000         4K PTE     D A G . . W R .
0xffffaf8082259000-0xffffaf808225a000    0x0000000102259000         4K PTE     D A G . . W R V
0xffffaf808225a000-0xffffaf808225c000    0x000000010225a000         8K PTE     D A G . . W R .
0xffffaf808225c000-0xffffaf8082266000    0x000000010225c000        40K PTE     D A G . . W R V
0xffffaf8082266000-0xffffaf8082268000    0x0000000102266000         8K PTE     D A G . . W R .
0xffffaf8082268000-0xffffaf8082284000    0x0000000102268000       112K PTE     D A G . . W R V
0xffffaf8082284000-0xffffaf8082288000    0x0000000102284000        16K PTE     D A G . . W R .
0xffffaf8082288000-0xffffaf808229c000    0x0000000102288000        80K PTE     D A G . . W R V
0xffffaf808229c000-0xffffaf80822a0000    0x000000010229c000        16K PTE     D A G . . W R .
0xffffaf80822a0000-0xffffaf80822a5000    0x00000001022a0000        20K PTE     D A G . . W R V
0xffffaf80822a5000-0xffffaf80822a6000    0x00000001022a5000         4K PTE     D A G . . . R V
0xffffaf80822a6000-0xffffaf80822ab000    0x00000001022a6000        20K PTE     D A G . . W R V
...

And when the memfd_secret() fd is released, the linear mapping is
correctly reset:

...
0xffffaf8082240000-0xffffaf80822a5000    0x0000000102240000       404K PTE     D A G . . W R V
0xffffaf80822a5000-0xffffaf80822a6000    0x00000001022a5000         4K PTE     D A G . . . R V
0xffffaf80822a6000-0xffffaf80822af000    0x00000001022a6000        36K PTE     D A G . . W R V
...

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/pageattr.c | 263 ++++++++++++++++++++++++++++++++-------
 1 file changed, 221 insertions(+), 42 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 161d0b34c2cb..743b30633d5c 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -5,6 +5,7 @@
 
 #include <linux/pagewalk.h>
 #include <linux/pgtable.h>
+#include <linux/vmalloc.h>
 #include <asm/tlbflush.h>
 #include <asm/bitops.h>
 #include <asm/set_memory.h>
@@ -25,19 +26,6 @@ static unsigned long set_pageattr_masks(unsigned long val, struct mm_walk *walk)
 	return new_val;
 }
 
-static int pageattr_pgd_entry(pgd_t *pgd, unsigned long addr,
-			      unsigned long next, struct mm_walk *walk)
-{
-	pgd_t val = READ_ONCE(*pgd);
-
-	if (pgd_leaf(val)) {
-		val = __pgd(set_pageattr_masks(pgd_val(val), walk));
-		set_pgd(pgd, val);
-	}
-
-	return 0;
-}
-
 static int pageattr_p4d_entry(p4d_t *p4d, unsigned long addr,
 			      unsigned long next, struct mm_walk *walk)
 {
@@ -96,7 +84,6 @@ static int pageattr_pte_hole(unsigned long addr, unsigned long next,
 }
 
 static const struct mm_walk_ops pageattr_ops = {
-	.pgd_entry = pageattr_pgd_entry,
 	.p4d_entry = pageattr_p4d_entry,
 	.pud_entry = pageattr_pud_entry,
 	.pmd_entry = pageattr_pmd_entry,
@@ -105,12 +92,179 @@ static const struct mm_walk_ops pageattr_ops = {
 	.walk_lock = PGWALK_RDLOCK,
 };
 
+static int __split_linear_mapping_pmd(pud_t *pudp,
+				      unsigned long vaddr, unsigned long end)
+{
+	pmd_t *pmdp;
+	unsigned long next;
+
+	pmdp = pmd_offset(pudp, vaddr);
+
+	do {
+		next = pmd_addr_end(vaddr, end);
+
+		if (next - vaddr >= PMD_SIZE &&
+		    vaddr <= (vaddr & PMD_MASK) && end >= next)
+			continue;
+
+		if (pmd_leaf(*pmdp)) {
+			struct page *pte_page;
+			unsigned long pfn = _pmd_pfn(*pmdp);
+			pgprot_t prot = __pgprot(pmd_val(*pmdp) & ~_PAGE_PFN_MASK);
+			pte_t *ptep_new;
+			int i;
+
+			pte_page = alloc_page(GFP_KERNEL);
+			if (!pte_page)
+				return -ENOMEM;
+
+			ptep_new = (pte_t *)page_address(pte_page);
+			for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep_new)
+				set_pte(ptep_new, pfn_pte(pfn + i, prot));
+
+			smp_wmb();
+
+			set_pmd(pmdp, pfn_pmd(page_to_pfn(pte_page), PAGE_TABLE));
+		}
+	} while (pmdp++, vaddr = next, vaddr != end);
+
+	return 0;
+}
+
+static int __split_linear_mapping_pud(p4d_t *p4dp,
+				      unsigned long vaddr, unsigned long end)
+{
+	pud_t *pudp;
+	unsigned long next;
+	int ret;
+
+	pudp = pud_offset(p4dp, vaddr);
+
+	do {
+		next = pud_addr_end(vaddr, end);
+
+		if (next - vaddr >= PUD_SIZE &&
+		    vaddr <= (vaddr & PUD_MASK) && end >= next)
+			continue;
+
+		if (pud_leaf(*pudp)) {
+			struct page *pmd_page;
+			unsigned long pfn = _pud_pfn(*pudp);
+			pgprot_t prot = __pgprot(pud_val(*pudp) & ~_PAGE_PFN_MASK);
+			pmd_t *pmdp_new;
+			int i;
+
+			pmd_page = alloc_page(GFP_KERNEL);
+			if (!pmd_page)
+				return -ENOMEM;
+
+			pmdp_new = (pmd_t *)page_address(pmd_page);
+			for (i = 0; i < PTRS_PER_PMD; ++i, ++pmdp_new)
+				set_pmd(pmdp_new,
+					pfn_pmd(pfn + ((i * PMD_SIZE) >> PAGE_SHIFT), prot));
+
+			smp_wmb();
+
+			set_pud(pudp, pfn_pud(page_to_pfn(pmd_page), PAGE_TABLE));
+		}
+
+		ret = __split_linear_mapping_pmd(pudp, vaddr, next);
+		if (ret)
+			return ret;
+	} while (pudp++, vaddr = next, vaddr != end);
+
+	return 0;
+}
+
+static int __split_linear_mapping_p4d(pgd_t *pgdp,
+				      unsigned long vaddr, unsigned long end)
+{
+	p4d_t *p4dp;
+	unsigned long next;
+	int ret;
+
+	p4dp = p4d_offset(pgdp, vaddr);
+
+	do {
+		next = p4d_addr_end(vaddr, end);
+
+		/*
+		 * If [vaddr; end] contains [vaddr & P4D_MASK; next], we don't
+		 * need to split, we'll change the protections on the whole P4D.
+		 */
+		if (next - vaddr >= P4D_SIZE &&
+		    vaddr <= (vaddr & P4D_MASK) && end >= next)
+			continue;
+
+		if (p4d_leaf(*p4dp)) {
+			struct page *pud_page;
+			unsigned long pfn = _p4d_pfn(*p4dp);
+			pgprot_t prot = __pgprot(p4d_val(*p4dp) & ~_PAGE_PFN_MASK);
+			pud_t *pudp_new;
+			int i;
+
+			pud_page = alloc_page(GFP_KERNEL);
+			if (!pud_page)
+				return -ENOMEM;
+
+			/*
+			 * Fill the pud level with leaf puds that have the same
+			 * protections as the leaf p4d.
+			 */
+			pudp_new = (pud_t *)page_address(pud_page);
+			for (i = 0; i < PTRS_PER_PUD; ++i, ++pudp_new)
+				set_pud(pudp_new,
+					pfn_pud(pfn + ((i * PUD_SIZE) >> PAGE_SHIFT), prot));
+
+			/*
+			 * Make sure the pud filling is not reordered with the
+			 * p4d store which could result in seeing a partially
+			 * filled pud level.
+			 */
+			smp_wmb();
+
+			set_p4d(p4dp, pfn_p4d(page_to_pfn(pud_page), PAGE_TABLE));
+		}
+
+		ret = __split_linear_mapping_pud(p4dp, vaddr, next);
+		if (ret)
+			return ret;
+	} while (p4dp++, vaddr = next, vaddr != end);
+
+	return 0;
+}
+
+static int __split_linear_mapping_pgd(pgd_t *pgdp,
+				      unsigned long vaddr,
+				      unsigned long end)
+{
+	unsigned long next;
+	int ret;
+
+	do {
+		next = pgd_addr_end(vaddr, end);
+		/* We never use PGD mappings for the linear mapping */
+		ret = __split_linear_mapping_p4d(pgdp, vaddr, next);
+		if (ret)
+			return ret;
+	} while (pgdp++, vaddr = next, vaddr != end);
+
+	return 0;
+}
+
+static int split_linear_mapping(unsigned long start, unsigned long end)
+{
+	return __split_linear_mapping_pgd(pgd_offset_k(start), start, end);
+}
+
 static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 			pgprot_t clear_mask)
 {
 	int ret;
 	unsigned long start = addr;
 	unsigned long end = start + PAGE_SIZE * numpages;
+	unsigned long lm_start;
+	unsigned long lm_end;
 	struct pageattr_masks masks = {
 		.set_mask = set_mask,
 		.clear_mask = clear_mask
@@ -120,11 +274,58 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 		return 0;
 
 	mmap_write_lock(&init_mm);
+
+	/*
+	 * We are about to change the permissions of a kernel mapping, we must
+	 * apply the same changes to its linear mapping alias, which may imply
+	 * splitting a huge mapping.
+	 */
+
+	if (is_vmalloc_or_module_addr((void *)start)) {
+		struct vm_struct *area = NULL;
+		int i, page_start;
+
+		area = find_vm_area((void *)start);
+		page_start = (start - (unsigned long)area->addr) >> PAGE_SHIFT;
+
+		for (i = page_start; i < page_start + numpages; ++i) {
+			lm_start = (unsigned long)page_address(area->pages[i]);
+			lm_end = lm_start + PAGE_SIZE;
+
+			ret = split_linear_mapping(lm_start, lm_end);
+			if (ret)
+				goto unlock;
+
+			ret = walk_page_range_novma(&init_mm, lm_start, lm_end,
+						    &pageattr_ops, NULL, &masks);
+			if (ret)
+				goto unlock;
+		}
+	} else if (is_kernel_mapping(start) || is_linear_mapping(start)) {
+		lm_start = (unsigned long)lm_alias(start);
+		lm_end = (unsigned long)lm_alias(end);
+
+		ret = split_linear_mapping(lm_start, lm_end);
+		if (ret)
+			goto unlock;
+
+		ret = walk_page_range_novma(&init_mm, lm_start, lm_end,
+					    &pageattr_ops, NULL, &masks);
+		if (ret)
+			goto unlock;
+	}
+
 	ret =  walk_page_range_novma(&init_mm, start, end, &pageattr_ops, NULL,
 				     &masks);
-	mmap_write_unlock(&init_mm);
 
-	flush_tlb_kernel_range(start, end);
+unlock:
+	/*
+	 * We can't use flush_tlb_kernel_range() here as we may have split a
+	 * hugepage that is larger than that, so let's flush everything.
+	 */
+	flush_tlb_all();
+
+	mmap_write_unlock(&init_mm);
 
 	return ret;
 }
@@ -159,36 +360,14 @@ int set_memory_nx(unsigned long addr, int numpages)
 
 int set_direct_map_invalid_noflush(struct page *page)
 {
-	int ret;
-	unsigned long start = (unsigned long)page_address(page);
-	unsigned long end = start + PAGE_SIZE;
-	struct pageattr_masks masks = {
-		.set_mask = __pgprot(0),
-		.clear_mask = __pgprot(_PAGE_PRESENT)
-	};
-
-	mmap_read_lock(&init_mm);
-	ret = walk_page_range(&init_mm, start, end, &pageattr_ops, &masks);
-	mmap_read_unlock(&init_mm);
-
-	return ret;
+	return __set_memory((unsigned long)page_address(page), 1,
+			    __pgprot(0), __pgprot(_PAGE_PRESENT));
 }
 
 int set_direct_map_default_noflush(struct page *page)
 {
-	int ret;
-	unsigned long start = (unsigned long)page_address(page);
-	unsigned long end = start + PAGE_SIZE;
-	struct pageattr_masks masks = {
-		.set_mask = PAGE_KERNEL,
-		.clear_mask = __pgprot(0)
-	};
-
-	mmap_read_lock(&init_mm);
-	ret = walk_page_range(&init_mm, start, end, &pageattr_ops, &masks);
-	mmap_read_unlock(&init_mm);
-
-	return ret;
+	return __set_memory((unsigned long)page_address(page), 1,
+			    PAGE_KERNEL, __pgprot(0));
 }
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
