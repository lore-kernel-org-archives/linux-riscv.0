Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E37CC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 08:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7dD6CtjwW7iGNkoH2gOZ0q7alKjcdph0E4PSMnV75Gs=; b=1r8LBGOJzyh6YQ
	v7JKc/BKCwQygsT2szXyzw0pb/2fjj2pJJ+0QO/RHD20acfxi2qeoTdDB2G/7blg87zwXCQCx0jyM
	w1xbXKmQfswwvsjlBWSN8MupZMxb/+IbTl/KP8M3JJbq+at6sT9RVLfXEnLk0YyXombMeZIDgKPJ5
	DeqHbB/BpzPZ3lZPUJZIjRppPUjOuKcR4pEp6gIP6BkgBj0fkurNAcY+zyEronyRQBZU5TQzA0UWQ
	5w4/DN1cT7IXAMeQzebLhziP8Noz/5QpwNEJBcpnKElr6MUM8VlRPEz5psNqRfzAOoItIXpNgUhJM
	MOInd7SMNExPh/d8xphA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0fpB-002LYs-TX; Mon, 13 Jun 2022 08:53:29 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0fp8-002LWJ-9A
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 08:53:28 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3E4A83FC04
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jun 2022 08:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1655110390;
	bh=fhdPlI5rmS+APeBJNR4lTD/VgT4RAcbvyvwt5HUOiAU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=QZppZfZQC9zfTlLFsdKR0nR4BzrR1pk4aSQuV2X8ILjYJiwsNMnkwaDhobT0lGKon
	 /JuuXVmbnqb4gfruYvhWMWdXPHpPutDflTJDJ3LukehvWxI7FXJJHm/bJhx+8vdrC9
	 8MPZT9Ow+zwo6NLN9hj2Vbi4nr/zxdI0+1ISB+xRydnb5wTXzZ+Uvy2MipdsyIsZNm
	 DOtaPZgqJEH2u/VP1siOD3Q6BQV47Usdi13KiwHXklpNUn4c5osl+psRp1GNmAbWGZ
	 qO5GRnKpoL45sUh29OexeffsFOqvboi7EP2HBwT035CRzzrJTfD/A+4XMj+KY8avLD
	 V7BOfQzjC0Zcw==
Received: by mail-wr1-f72.google.com with SMTP id s3-20020adf9783000000b00219f10a7517so609673wrb.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jun 2022 01:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fhdPlI5rmS+APeBJNR4lTD/VgT4RAcbvyvwt5HUOiAU=;
        b=C/MUuTGzeT07r3XqQWjzJ91ZpA03Zoy3m89zQQz0a1+DsaJCv+B3djQ4ovKzjSInxz
         zohIBOlOJ7DyVARZ2LVhU2TZF4eSX22ghm1CXKtLC762j8/m1u23Cw/RyQuSif8QRTN0
         KZYSrHBCb6xEW2jl7WK2jWch4hOxwLuiIvZcm79TLe3UE2y9p7/ZGrePpOnn4C5CCGlM
         GU3GVt8IWgzr2Nlot5NAr7Tt1LgNsDJ+GdHbS0cB5VL3Q+jSb4nINT4MbY8qTxnlBtir
         FweYwR1hnLBDISPxoFv+rT+4KaAWNul6+63HmI17u01AAmRgE+QvHiU5auAJiB21X0Od
         5VlQ==
X-Gm-Message-State: AOAM532tDg8CK11PG112DURoG9C0EdtRN+AHXHTNbWpAREY1TliBLLyb
	inZMBfHn2JXky16s8AqgCd9MKkLuPAGuw5baQjaXyfeOJMSS5fToYcbCoaK945JleL8Ekr24/0q
	KIrFx37IpBs1xBmtHgd57d05JUdscPkuIIuQI3QRgDU51Pg==
X-Received: by 2002:a05:600c:3d98:b0:39c:5cad:ab58 with SMTP id bi24-20020a05600c3d9800b0039c5cadab58mr13009700wmb.100.1655110389701;
        Mon, 13 Jun 2022 01:53:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4t5KV7LAtTb4dE0wLpkTfSRrdGgNSzReoTM8ZcUo1rFG7gBn3Z6s34yNb3QgrtEjmt4i1Jg==
X-Received: by 2002:a05:600c:3d98:b0:39c:5cad:ab58 with SMTP id bi24-20020a05600c3d9800b0039c5cadab58mr13009667wmb.100.1655110389455;
        Mon, 13 Jun 2022 01:53:09 -0700 (PDT)
Received: from alex.home (lfbn-gre-1-146-29.w90-112.abo.wanadoo.fr. [90.112.113.29])
        by smtp.gmail.com with ESMTPSA id z16-20020adfec90000000b0020cff559b1dsm7957794wrn.47.2022.06.13.01.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 01:53:09 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH -fixes v2] riscv: Fix missing PAGE_PFN_MASK
Date: Mon, 13 Jun 2022 10:53:07 +0200
Message-Id: <20220613085307.260256-1-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_015326_639624_49D02512 
X-CRM114-Status: GOOD (  12.41  )
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

There are a bunch of functions that use the PFN from a page table entry
that end up with the svpbmt upper-bits because they are missing the newly
introduced PAGE_PFN_MASK which leads to wrong addresses conversions and
then crash: fix this by adding this mask.

Fixes: 100631b48ded ("riscv: Fix accessing pfn bits in PTEs for non-32bit variants")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/include/asm/pgtable-64.h | 12 ++++++------
 arch/riscv/include/asm/pgtable.h    |  6 +++---
 arch/riscv/kvm/mmu.c                |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 5c2aba5efbd0..dc42375c2357 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -175,7 +175,7 @@ static inline pud_t pfn_pud(unsigned long pfn, pgprot_t prot)
 
 static inline unsigned long _pud_pfn(pud_t pud)
 {
-	return pud_val(pud) >> _PAGE_PFN_SHIFT;
+	return __page_val_to_pfn(pud_val(pud));
 }
 
 static inline pmd_t *pud_pgtable(pud_t pud)
@@ -278,13 +278,13 @@ static inline p4d_t pfn_p4d(unsigned long pfn, pgprot_t prot)
 
 static inline unsigned long _p4d_pfn(p4d_t p4d)
 {
-	return p4d_val(p4d) >> _PAGE_PFN_SHIFT;
+	return __page_val_to_pfn(p4d_val(p4d));
 }
 
 static inline pud_t *p4d_pgtable(p4d_t p4d)
 {
 	if (pgtable_l4_enabled)
-		return (pud_t *)pfn_to_virt(p4d_val(p4d) >> _PAGE_PFN_SHIFT);
+		return (pud_t *)pfn_to_virt(__page_val_to_pfn(p4d_val(p4d)));
 
 	return (pud_t *)pud_pgtable((pud_t) { p4d_val(p4d) });
 }
@@ -292,7 +292,7 @@ static inline pud_t *p4d_pgtable(p4d_t p4d)
 
 static inline struct page *p4d_page(p4d_t p4d)
 {
-	return pfn_to_page(p4d_val(p4d) >> _PAGE_PFN_SHIFT);
+	return pfn_to_page(__page_val_to_pfn(p4d_val(p4d)));
 }
 
 #define pud_index(addr) (((addr) >> PUD_SHIFT) & (PTRS_PER_PUD - 1))
@@ -347,7 +347,7 @@ static inline void pgd_clear(pgd_t *pgd)
 static inline p4d_t *pgd_pgtable(pgd_t pgd)
 {
 	if (pgtable_l5_enabled)
-		return (p4d_t *)pfn_to_virt(pgd_val(pgd) >> _PAGE_PFN_SHIFT);
+		return (p4d_t *)pfn_to_virt(__page_val_to_pfn(pgd_val(pgd)));
 
 	return (p4d_t *)p4d_pgtable((p4d_t) { pgd_val(pgd) });
 }
@@ -355,7 +355,7 @@ static inline p4d_t *pgd_pgtable(pgd_t pgd)
 
 static inline struct page *pgd_page(pgd_t pgd)
 {
-	return pfn_to_page(pgd_val(pgd) >> _PAGE_PFN_SHIFT);
+	return pfn_to_page(__page_val_to_pfn(pgd_val(pgd)));
 }
 #define pgd_page(pgd)	pgd_page(pgd)
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 1d1be9d9419c..5dbd6610729b 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -261,7 +261,7 @@ static inline pgd_t pfn_pgd(unsigned long pfn, pgprot_t prot)
 
 static inline unsigned long _pgd_pfn(pgd_t pgd)
 {
-	return pgd_val(pgd) >> _PAGE_PFN_SHIFT;
+	return __page_val_to_pfn(pgd_val(pgd));
 }
 
 static inline struct page *pmd_page(pmd_t pmd)
@@ -590,14 +590,14 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 	return __pmd(pmd_val(pmd) & ~(_PAGE_PRESENT|_PAGE_PROT_NONE));
 }
 
-#define __pmd_to_phys(pmd)  (pmd_val(pmd) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)
+#define __pmd_to_phys(pmd)  (__page_val_to_pfn(pmd_val(pmd)) << PAGE_SHIFT)
 
 static inline unsigned long pmd_pfn(pmd_t pmd)
 {
 	return ((__pmd_to_phys(pmd) & PMD_MASK) >> PAGE_SHIFT);
 }
 
-#define __pud_to_phys(pud)  (pud_val(pud) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)
+#define __pud_to_phys(pud)  (__page_val_to_pfn(pud_val(pud)) << PAGE_SHIFT)
 
 static inline unsigned long pud_pfn(pud_t pud)
 {
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1c00695ebee7..9826073fbc67 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -54,7 +54,7 @@ static inline unsigned long gstage_pte_index(gpa_t addr, u32 level)
 
 static inline unsigned long gstage_pte_page_vaddr(pte_t pte)
 {
-	return (unsigned long)pfn_to_virt(pte_val(pte) >> _PAGE_PFN_SHIFT);
+	return (unsigned long)pfn_to_virt(__page_val_to_pfn(pte_val(pte)));
 }
 
 static int gstage_page_size_to_level(unsigned long page_size, u32 *out_level)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
