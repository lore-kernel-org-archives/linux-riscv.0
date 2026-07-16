Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A76C44501
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujXiILi8eVlry3MO6vaEqBYsUAwhw9mRX0npWbVlAPQ=; b=MPuBNnUxob7pt5
	dAn1ZciGsWBZN4HTGTxAJ0ArVnzh2OiQt5tEnfbQzM9cgFrwTais90c5u6Jad1ElldCPRB/Dn+n9n
	WHvFZPsIFGhOAvZd6KyJG0eqfBMviZKL2HG1/Fyk6w0Q/P3josHSXdLOH3TKVriSLrwY+qeB/69/y
	FHDpxI0p42RKYtfIFLbDNF8vTWW93oekzu6BP9IWckxJhoHRK1PsCHd8Bn4y924gS51jhmKI1dMaj
	qHlDHn2OpAtitjg15Z5Dq/xa+nlE27IJ/oCtBzm5HGaw/ssmgrZaAccW71QCAhoX/hnDpoX4CKrYK
	PV9CklFkNuDMG8jOqTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRt-0000000HJWK-40K3;
	Thu, 16 Jul 2026 12:44:21 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRm-0000000HJMo-2LB0
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:44:20 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8423f236418so2681233b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205854; x=1784810654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqzuyyB7zI40Qj8rdd4/j/Hz77YcBH2L+r/0EHWbI6M=;
        b=C6QRhTV5mo9nVNw+cIvrpS+ZP5zIUiQq87LD0j4lydPnGdyMTOTLOwYOJrcxM71/fa
         z27E8weFdL1sogXnC5TJvbQ6zh7G5iuwtW7EfYQ3lqAHgmFCLB5A4DNKunJDShlyT4e7
         um0/ibTQhd63a5Nznh9pn9i0z6vWvyV9ylM7b56l4yRfugpUXH08jkUiVCer1hCfxorS
         weRTJNm+xvbZb6pd2O4gVnlohmHMjdzn/+lzkp03LXkp/6QDxayOy1UWJO9406nWkB0/
         8q1jynlwydR6nlI8eXEkPXVv8imA8ULuwE/atD5O8jWLVt0Wh0Jq4Rjiv2A6a0VkdWJQ
         rynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205854; x=1784810654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZqzuyyB7zI40Qj8rdd4/j/Hz77YcBH2L+r/0EHWbI6M=;
        b=NNPqy5EVatGu3a8OvZfKJUgr2dsy5i5gKE6WhiisJ6ykF9wOqx0lpC9+C8UoAtmsxO
         Ibu977PKlSNnjhikR+ZKE6xv8JFdVuOM/KuChnpAAOy2U+JPcC+jJMlEceFtJUtddWNu
         aDv/myPDARf15XsudYVUX+ZVbcceBaiJ5qWD7kMmYthvmvN0CHIyTuWby30WX4leN9xv
         EPjYia8OQrx/Prl2qydOotO92ohrfPYMD1t5Re8Y1kIjtcDZKtMG4xJzHVHCvBugiflY
         MdPDVhtptGb+L1l6GUGO7EJDxFBmg9VH2ijx2RsPY3iF40bp5QOJSE2wxV9ghgsQGzGj
         qcuA==
X-Gm-Message-State: AOJu0YynhEUV8lCuHz44p0SemMsdmifShmcxKrPDvnmBuXheauVdSxDg
	uLQT82vfBCw/Gj1PyyaARkkqHh1Z/5u7g7p621RwnD6KEWFk4aMV25ZamfV+553vc9dc1b/mIZX
	t8f15RZ0=
X-Gm-Gg: AfdE7cm8zjh4dwggDgjNyoU3+r6/DqD1mqgzfGyLn7xzOTEKrcJmMTAbuRHF1SFwwUY
	er7B7ePCLS80LuBAP4/3/FQOlg58MRyYocy3tyNwmaJTLvR/42xYs6JJRsgmWvlhQBFuXm9FCRD
	Yybhtrr29Qc6a/rgRHOS27Wpw9rGmWBKC2gkhKi/ZtgrX5xhp7zGIMLTV4SkqMbMB/Dwozxg6vv
	VNFdyx/BGrpmbqsFBr6OTT60Z5HodVoxktXrlm4Fjy3k5Y4dDxA31YQ9RqWOicbZyLiA83we2Zc
	RKVDVNKmNq35X3s7McYZg9wB5EISm6JOmZTJCs8ZOTgKst5RccPdPp8H5fg7TvENwAyXbDsrSVz
	2aWeTH1I3fBKnLIrErUzLDs6YcXNwEpt11533Vkkmcd6rdGTZQJnjw7jNKt/UExolvUuo5+USNf
	qlovELi2v0fCiXIrv7L2R3G2M=
X-Received: by 2002:a05:6a00:21d2:b0:845:c6fc:2821 with SMTP id d2e1a72fcca58-84889604f51mr19555102b3a.22.1784205853705;
        Thu, 16 Jul 2026 05:44:13 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.44.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:44:12 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 10/15] mm/gup: add fast-GUP specific lockless PTE helpers
Date: Thu, 16 Jul 2026 20:41:45 +0800
Message-Id: <138d74aa9863ae8ff445e16a2798d062895b75bc.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054414_605250_FC6CA274 
X-CRM114-Status: GOOD (  10.50  )
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

fast-GUP snapshots a PTE without holding the PTL, pins the page, and
then revalidates that the PTE did not change. Keep both reads under the
same lockless PTE semantics by defaulting the fast-GUP revalidation to
ptep_get_lockless().

Introduce fast-GUP specific PTE snapshot and revalidation helpers. The
default implementation preserves the existing ptep_get_lockless()
semantics, while allowing architectures to override the helpers when the
public lockless getter provides extra semantics that fast-GUP does not
consume.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 include/linux/pgtable.h | 18 ++++++++++++++++++
 mm/gup.c                |  6 ++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index da14328093a86..62943fcbf7046 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -813,6 +813,24 @@ static inline pte_t ptep_get_lockless(pte_t *ptep)
 }
 #endif
 
+#ifndef gup_ptep_get_lockless
+static inline pte_t gup_ptep_get_lockless(pte_t *ptep, pte_t *rawp)
+{
+	pte_t pte = ptep_get_lockless(ptep);
+
+	*rawp = pte;
+
+	return pte;
+}
+#endif
+
+#ifndef gup_ptep_revalidate
+static inline bool gup_ptep_revalidate(pte_t *ptep, pte_t raw_pte)
+{
+	return pte_val(raw_pte) == pte_val(ptep_get_lockless(ptep));
+}
+#endif
+
 #ifndef pmdp_get_lockless
 static inline pmd_t pmdp_get_lockless(pmd_t *pmdp)
 {
diff --git a/mm/gup.c b/mm/gup.c
index 99902c15703b0..72fb147193e55 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2842,10 +2842,12 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
 	if (!ptep)
 		return 0;
 	do {
-		pte_t pte = ptep_get_lockless(ptep);
+		pte_t raw_pte, pte;
 		struct page *page;
 		struct folio *folio;
 
+		pte = gup_ptep_get_lockless(ptep, &raw_pte);
+
 		/*
 		 * Always fallback to ordinary GUP on PROT_NONE-mapped pages:
 		 * pte_access_permitted() better should reject these pages
@@ -2871,7 +2873,7 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
 			goto pte_unmap;
 
 		if (unlikely(pmd_val(pmd) != pmd_val(pmdp_get_lockless(pmdp))) ||
-		    unlikely(pte_val(pte) != pte_val(ptep_get_lockless(ptep)))) {
+		    unlikely(!gup_ptep_revalidate(ptep, raw_pte))) {
 			gup_put_folio(folio, 1, flags);
 			goto pte_unmap;
 		}
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
