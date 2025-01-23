Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A63C0218B
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 13:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYSuZ54gLJt4PmIlG7SgJdgZSAXk15sygxerSfZF/vI=; b=esgu7KhziAa0Yp
	lBR8jMzG7MXAcrvMOiPJgyTFnlt8qIf/+Ow2rkMAD72HWR41Xqv1tOXvkBB9SaszzEHBB0jO5Bjhn
	0FKAUHfJXj983CJWYHCylVtvwqCiheViqgSZcqIpX6nPowyzEKlpSVclSffgT09QQSTLrIkAUrYZf
	MX4C/IjHW12OLjMremJ20EboeT6Q7HSYHm7W2TmkM2lh02EfxLTLqG6GYn9+hll9z3layRpnipBmb
	rhfP76rDmZmi/0fcKb+bl0qll55gbpHlRZKWXHeA4b8esMwO2mKdaW/EmJnYXdjiANY5Bvwnnkoih
	iGgVKF4Hdt1ogp2zLeKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taxGY-0000000CWWI-41xZ;
	Thu, 23 Jan 2025 13:29:02 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taxGU-0000000CWSa-47Cb
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 13:29:01 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21661be2c2dso15403325ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jan 2025 05:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638938; x=1738243738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSVoet4BIZh93xV/DLydReH1JogDWuAFDaImcbetZJc=;
        b=FCHypj1dcOHI9TRPI9rp2cRm7kUpAI4BH28yD7m9lCOw5joaBJoaszb2KHodydIidF
         aCi8dRrjnyDp+fTGCckvymB7tkzTDhg1tPTA6nYnyT6dH9mFrD+6Ttho7kKt/7Lg8TPX
         1ddZfa4HyifA5qTMw/eElunDVdR0qr1g4R+THOypMxwCza8wbeKTyubHUvOXeJ4bNSBE
         l3fMY66iyYpcqMAg4flsSaKUUVyPDcI0JHwakshdFSUsq6onHn+QVmmdv1bKqcZiUl91
         3Axzc1jQj/vunmsgDmCPlkGfooltEo6K/wUu63Z+iajkwoYi8LwgOOitSM8RlK056Sua
         80HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638938; x=1738243738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSVoet4BIZh93xV/DLydReH1JogDWuAFDaImcbetZJc=;
        b=dePh3c3R+4MP3qgUKKo4NeNAo2Ux0dsKIfvF1SOFAPK+BuL46hutc3m8pUoreU2w3I
         2hOcnRozUsVWa+UJkn9QzQBCAYzwDTI6JUzztieCP0Wfq/rJfHRzay1vekGY0uC+3+Nt
         Q9Evd9YH0yV4TlkdkmoVwM3PNChSgO3/Aco8rakVcZeCETzwSrpKELURQsH9OxI87cdc
         hwVT4ETQohw+hQ2yKhmPDOTHLblHJ/ihuN3xbvDI8yQaHNwdIEWQunkRzq6RlyeQffLT
         0aibNZb3QXEkGgSZB6fGlZu4e4NJWYzAUkEaAi9DdZrJEagsDNkLW932mZS6egs+Q4a5
         wnoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFWI6pjkEPX/5Vd/WH7j8SMDTVCHAJDN1aF54yf9jQg0gUvxZ0DOHQs00b/tUkH0nir0QPsvBOfGH5uw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTRTRrjSqvCkgnvE+97p8bltB3MEZoahY00V/5VT7DEFFDVR4t
	1aMM0d/XBN565HlZj9G0e5gbb1my+ljrEBzZ2lv0eQCvzMI7uF0X4l4xDNkqfXk=
X-Gm-Gg: ASbGnctAUop2kRv0ENlgUi6SBUXU/PRzPn8z4unnVb00vTEg5Y40yxqN+y4/kBuv/0W
	L2X+YHHNw+oA/Z3KD1NsFbnsmb4tb3GrnX9ssxpwLIBe+ySZslgI7xPldo4MPplGxP/F9p7KUNF
	DljJEY6/ascPBIA4YK6HDIgQhI7lQYQT0+rSRrKvNk1jZnyEEt+4+JdJYNcWGvtDrM1Hzwhv+xp
	03fSiaL+hETC1TdFecHLXhRQvcdGLauWJgeP6pbGUHwmLUXODJXS9eprhfPXjIJ//a6heTm9Fdl
	bvuHWmfeX8Xb46GdCfXpyWxycM0/8sV4zAr0LD56KaJM
X-Google-Smtp-Source: AGHT+IE9ITT+lxW4q5ku2WHS5AYNu8WFWCG+wILMASo2spfcLUt1T5YAi0clrsTLRCDPofgLk2+QPw==
X-Received: by 2002:a17:902:e5ce:b0:216:6590:d472 with SMTP id d9443c01a7336-21c3551ae48mr419794535ad.21.1737638938491;
        Thu, 23 Jan 2025 05:28:58 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:28:57 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 4/5] x86: pgtable: unconditionally use tlb_remove_table()
Date: Thu, 23 Jan 2025 21:26:17 +0800
Message-Id: <00bf7935d65826eee547ac195d7854b1c946dbc5.1737637631.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1737637631.git.zhengqi.arch@bytedance.com>
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_052859_019329_624F0A2F 
X-CRM114-Status: UNSURE (   8.54  )
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

If the CONFIG_MMU_GATHER_TABLE_FREE is disabled, the tlb_remove_table()
will fall back to pagetable_dtor() + tlb_remove_page(). So let's use
tlb_remove_table() unconditionally to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/kernel/paravirt.c | 17 +----------------
 arch/x86/mm/pgtable.c      | 11 -----------
 2 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 1ccaa3397a670..527f5605aa3e5 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -59,21 +59,6 @@ void __init native_pv_lock_init(void)
 		static_branch_enable(&virt_spin_lock_key);
 }
 
-#ifndef CONFIG_PT_RECLAIM
-static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
-{
-	struct ptdesc *ptdesc = (struct ptdesc *)table;
-
-	pagetable_dtor(ptdesc);
-	tlb_remove_page(tlb, ptdesc_page(ptdesc));
-}
-#else
-static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
-{
-	tlb_remove_table(tlb, table);
-}
-#endif
-
 struct static_key paravirt_steal_enabled;
 struct static_key paravirt_steal_rq_enabled;
 
@@ -195,7 +180,7 @@ struct paravirt_patch_template pv_ops = {
 	.mmu.flush_tlb_kernel	= native_flush_tlb_global,
 	.mmu.flush_tlb_one_user	= native_flush_tlb_one_user,
 	.mmu.flush_tlb_multi	= native_flush_tlb_multi,
-	.mmu.tlb_remove_table	= native_tlb_remove_table,
+	.mmu.tlb_remove_table	= tlb_remove_table,
 
 	.mmu.exit_mmap		= paravirt_nop,
 	.mmu.notify_page_enc_status_changed	= paravirt_nop,
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 1fef5ad32d5a8..3bc8ad282b272 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -19,22 +19,11 @@ EXPORT_SYMBOL(physical_mask);
 #endif
 
 #ifndef CONFIG_PARAVIRT
-#ifndef CONFIG_PT_RECLAIM
-static inline
-void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
-{
-	struct ptdesc *ptdesc = (struct ptdesc *)table;
-
-	pagetable_dtor(ptdesc);
-	tlb_remove_page(tlb, ptdesc_page(ptdesc));
-}
-#else
 static inline
 void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
 	tlb_remove_table(tlb, table);
 }
-#endif /* !CONFIG_PT_RECLAIM */
 #endif /* !CONFIG_PARAVIRT */
 
 gfp_t __userpte_alloc_gfp = GFP_PGTABLE_USER | PGTABLE_HIGHMEM;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
