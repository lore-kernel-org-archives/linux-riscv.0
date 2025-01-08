Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA67E77199
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYKpJAMrsAE4KDiKuami4466pSbZjqJqHhDVJT2gtHI=; b=pFDy1SLHlKjmok
	DsVTsjwUYslPurUN1BdnqE12Gx7sRA9WUB6E8lqBUDYkLuuKCHEW4yNrjDlzxt5qyoUFaaDqr4TWE
	a0X1mFl9X1ogpauusrBNC0mhOk+tqkj3Hk7fNZEyTaG1KiaYn2AKe8VXW3yMsAKuTVbCcuhb6K69r
	3oNqiUHthZ2Ng7coeq4oQ5Y6ym+Yw7DpM/tmhhcffec1ZftMtgsG+Ts6bPDKGRWfPXyzeBCJ9OlxY
	cqfvmoycFKxo6dfkckXnMwke/v0eHMHAJ62+YCorxo1y/kx1jgfY+OuCYeZODvhLRMrKC6hHVGAtm
	FJvgFhLPc6FKYewxMqtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRKL-00000007XGg-1fOl;
	Wed, 08 Jan 2025 08:22:09 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQ4t-00000007LQi-1bNd
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 07:02:09 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2166f1e589cso27330925ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jan 2025 23:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319727; x=1736924527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0duyzCo9dAwX01bCrGbAFGgpbJyQOIdvGclplTLFMvs=;
        b=ERCvY9CeP81VVet725Ftm2pAC5xlr78aeQHXQ0T+Y2IJAVJy3JeYc5hbNrKe8+s1cZ
         OdIzQBfLN5S24KbXYU28eP5jT3NNiL/wY5Oh/JVNC5ldWD4cYtFdUp/nkpdS5MqXhuJz
         0FCNy31O4JhspjCuGM9p5N3elnqmvKt6wx2ghDl1OGkWf6Ypv/EmtxDu3z94e0UGJZZn
         iZjRGn29Yl9vBX4+0ynXhimciXs1qtXVY6C5cwS2wYBySv6O295Hdd4LpR6TiAMOTLkN
         zpYLorA5JZYA9PxCssCK7wzJRX2acEAEPfAZEwyV9qVhM5pzTG5nG1smBm77vN5OiRZ/
         MB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319727; x=1736924527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0duyzCo9dAwX01bCrGbAFGgpbJyQOIdvGclplTLFMvs=;
        b=pmi/ZdZ6W3NuPFVHNWCNEc7EI4gYoQMBVnko8EgM1+hD3JXNgR45gAe4c5SPbVDgYt
         sbuqXCe05XmzMxuFSO9TfF5SRd6KqL2ReJPjQLYWbiC/m07Y3olXD2UG+dkOpwWR4yhX
         ws6j9Wd38VFFyknp5Ax5/6mt3QFGcBnBY8bRQOSllvDzFeYdtiza2B8QSHYHBaUjs/B6
         76auSktDDekDRzoWFRrwDimn4G3a586w/1NE3Cll1SPgDlTrPuc1Cbq54PTa4QuXWIV6
         1PMmbdXPJqQ9271MQqyw06nZg7uoIAVcLeWFG4v/R8v66dEo4mEaXeByBkKJ/DgIoxk/
         fG9g==
X-Forwarded-Encrypted: i=1; AJvYcCXbDZDnpg2ogx2vW3RHCJrsKM0DaujpqnglWrqtY3n0K+plrOm5hHl0L5i9jdhcSEqmGBahHHfDYOaudw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/H+a5loSHn1ccBE5b/1CaqRkKKQ5nvqYf9mSCUnpoA5P5ciPp
	Bbj+oTAunr7kxMxpE5+fslItJizVr4KX0HWGs365mQ2Mw+4uMayiVO3790ka9XM=
X-Gm-Gg: ASbGncvu9dMOOVk26wmboJYbOL3gM+wIvoACam5NJg2nJfOS0msTJzkvWrLerXmDAkf
	vvcm6olZmGDOLqHrCqW5kuOLNsUpq/MHT2O9Ua7KItI3dvTPLGnMMlVzGTMRO/25cBokSEENpG9
	j6K6wQDVqt51ZfMAdmyDAnuhb2qYPhPJeHSrsLdYokkeQqUYhwNzb0aQuboI4YXKwaJ5MlpXszd
	cmsN+TmCvJ4RRZXgBAlycd1xmQ6iDcSkQBm4zgosaub/csi7/t4cTlOXWYtCGoveI/W+YGx7fBj
	ss7gClHf/A4HkrT/hAHD6i1wGh8=
X-Google-Smtp-Source: AGHT+IFHWir1ocwTjoDZn2JicpigLOS4g472SxX6v3Yl/J2b2LHmsbTHHj3CMM+1OfXcdbPj30xuWQ==
X-Received: by 2002:a17:902:c406:b0:216:7ee9:21ff with SMTP id d9443c01a7336-21a83fdf307mr27262725ad.49.1736319726731;
        Tue, 07 Jan 2025 23:02:06 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:02:06 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 11/17] x86: pgtable: convert __tlb_remove_table() to use struct ptdesc
Date: Wed,  8 Jan 2025 14:57:27 +0800
Message-Id: <39f60f93143ff77cf5d6b3c3e75af0ffc1480adb.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_230207_419796_4EECE4C4 
X-CRM114-Status: GOOD (  11.78  )
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

Convert __tlb_remove_table() to use struct ptdesc, which will help to move
pagetable_dtor() to __tlb_remove_table().

And page tables shouldn't have swap cache, so use pagetable_free() instead
of free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/include/asm/tlb.h | 16 +++++++++-------
 arch/x86/kernel/paravirt.c |  4 +++-
 arch/x86/mm/pgtable.c      | 12 +++++++-----
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 73f0786181cc9..680ec3d47915a 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -31,24 +31,26 @@ static inline void tlb_flush(struct mmu_gather *tlb)
  */
 static inline void __tlb_remove_table(void *table)
 {
-	free_page_and_swap_cache(table);
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
+
+	pagetable_free(ptdesc);
 }
 
 #ifdef CONFIG_PT_RECLAIM
 static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
 {
-	struct page *page;
+	struct ptdesc *ptdesc;
 
-	page = container_of(head, struct page, rcu_head);
-	put_page(page);
+	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	__tlb_remove_table(ptdesc);
 }
 
 static inline void __tlb_remove_table_one(void *table)
 {
-	struct page *page;
+	struct ptdesc *ptdesc;
 
-	page = table;
-	call_rcu(&page->rcu_head, __tlb_remove_table_one_rcu);
+	ptdesc = table;
+	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
 }
 #define __tlb_remove_table_one __tlb_remove_table_one
 #endif /* CONFIG_PT_RECLAIM */
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 7bdcf152778c0..dc1ab9301d2c6 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -62,7 +62,9 @@ void __init native_pv_lock_init(void)
 #ifndef CONFIG_PT_RECLAIM
 static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
-	tlb_remove_page(tlb, table);
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
+
+	tlb_remove_page(tlb, ptdesc_page(ptdesc));
 }
 #else
 static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index a6cd9660e29ec..f9516024cbe5d 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -23,7 +23,9 @@ EXPORT_SYMBOL(physical_mask);
 static inline
 void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
-	tlb_remove_page(tlb, table);
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
+
+	tlb_remove_page(tlb, ptdesc_page(ptdesc));
 }
 #else
 static inline
@@ -62,7 +64,7 @@ void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
 {
 	pagetable_dtor(page_ptdesc(pte));
 	paravirt_release_pte(page_to_pfn(pte));
-	paravirt_tlb_remove_table(tlb, pte);
+	paravirt_tlb_remove_table(tlb, page_ptdesc(pte));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 2
@@ -78,7 +80,7 @@ void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
 	tlb->need_flush_all = 1;
 #endif
 	pagetable_dtor(ptdesc);
-	paravirt_tlb_remove_table(tlb, ptdesc_page(ptdesc));
+	paravirt_tlb_remove_table(tlb, ptdesc);
 }
 
 #if CONFIG_PGTABLE_LEVELS > 3
@@ -88,7 +90,7 @@ void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
 
 	pagetable_dtor(ptdesc);
 	paravirt_release_pud(__pa(pud) >> PAGE_SHIFT);
-	paravirt_tlb_remove_table(tlb, virt_to_page(pud));
+	paravirt_tlb_remove_table(tlb, ptdesc);
 }
 
 #if CONFIG_PGTABLE_LEVELS > 4
@@ -98,7 +100,7 @@ void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
 
 	pagetable_dtor(ptdesc);
 	paravirt_release_p4d(__pa(p4d) >> PAGE_SHIFT);
-	paravirt_tlb_remove_table(tlb, virt_to_page(p4d));
+	paravirt_tlb_remove_table(tlb, ptdesc);
 }
 #endif	/* CONFIG_PGTABLE_LEVELS > 4 */
 #endif	/* CONFIG_PGTABLE_LEVELS > 3 */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
