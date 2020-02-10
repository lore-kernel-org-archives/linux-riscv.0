Return-Path: <SRS0=tGDq=36=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BA2C35250
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2020 05:57:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9A4220661
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2020 05:57:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IHcYF4g8";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="AiEyxIK0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9A4220661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sfkmb35IpZPof1bD/rOU/zeEqg9sSc9VPK5w6BC0wlc=; b=IHcYF4g8uwy63G
	jL30lV6zHIk3He/qELlAYvXgUD2ViLKIZQrmrpwjeO/ex9zUjshJqaI3Yvumx0LWLCYXH5zWC05F+
	FPXECWg4P+32ZJxAt85PDz05c8wuXXq7b9oQP815Bo/w3+O2EGlD8SquW0T6aFIYi3BuV5LcD02D6
	oijAUGfngbmJC9M6rRAec40qGfZfydwEwK9B4gPzjFN9wFKcvOsRZMcR4NYywSGphEugDUfKvgnjn
	8P+wF/QCd75w9S4PJ2yLlaVEXXP6M9IbLbKg7oJS2plhv9j7JFS9ZWtZRp1CNUje10l61OHTT+oH4
	rJlyCahrODXuqzKNMLCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j124E-0004cb-QH; Mon, 10 Feb 2020 05:57:10 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j124B-0004YP-TS
 for linux-riscv@lists.infradead.org; Mon, 10 Feb 2020 05:57:09 +0000
Received: by mail-pg1-x544.google.com with SMTP id 6so3327809pgk.0
 for <linux-riscv@lists.infradead.org>; Sun, 09 Feb 2020 21:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sfkmb35IpZPof1bD/rOU/zeEqg9sSc9VPK5w6BC0wlc=;
 b=AiEyxIK0eV9Djm2Eo7bsijie1cc+LBMz3Uh8E+ihWsg3qgnhO/7750+B90xPY9XD5h
 oiF9ZPOw3jMTl7TKaLwrgStvnzBOQaFvWnOWi+sLj83t6LkDeQMlT++eupUb3KSBIYtE
 DZpNW+eZh2r2Ap15ekORaQVyxetQpYiLjxD14b7KjieNsMLPPaonNVsr+tYrhXq47rxl
 qGDto+/DlKBvvDd8oTRM4lFwaIQQymjRvyf/B8jPmrjWrXtjuMj/768eRevs3dXuBtai
 yW+2qbLRjJFiBVoph/sLYWCgor48Mms1NOoWTtNgtxSJPQyB22Dtveg1FyKIBlZhEoir
 0gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sfkmb35IpZPof1bD/rOU/zeEqg9sSc9VPK5w6BC0wlc=;
 b=rrKn7v6v9oYamejHm2wqyDNxYCZ1lG42MVTmR5cxrsDxiiMZaj/DXKrrcs44kEngVC
 W01pqWQZieYT/Ad8XsfqAfiOzB2Iv9uJS1v1okiX5YT7ulYqOGlaq1OF6vup/iIybC+D
 nJFGp6xZQ2nKCxvo3/CNHFqr6+7/uum3w8SQvz1QxdSnfGkfNRlsbD8PRKC8L6rmrDgE
 OuvjtUfpOTv/mAA6GwWx/ukR4cG4N+PUIP2Az+ew7Rc56sM2+2McCTh8FHj9IFMHO4Gv
 mSl0uXz4C5HW+NkcQfb4YR7A66lrh+9fnOJtm1ogYen40cFqQ11TeUFHDN63fKlJhh0P
 WyvQ==
X-Gm-Message-State: APjAAAXXqerxhEqu5K+FlyoDq6fxJtHkpyM+R21wozPnjZcaJiIcRZvO
 4+uMP98hxaMBxtCJWZmNWPPWoQ==
X-Google-Smtp-Source: APXvYqz3+aETwERtIyI+w4fTaxuNqIUthoZSuJH5Ho8GkNKVyNo+nwGfFEeLVB0BgaBmG5f4FqDcYQ==
X-Received: by 2002:a63:6607:: with SMTP id a7mr13074659pgc.310.1581314226978; 
 Sun, 09 Feb 2020 21:57:06 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id s206sm11140234pfs.100.2020.02.09.21.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 21:57:06 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 joe@perches.com, nickhu@andestech.com
Subject: [PATCH v2 2/2] riscv: adjust the indent
Date: Mon, 10 Feb 2020 13:56:54 +0800
Message-Id: <20200210055654.96725-3-zong.li@sifive.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210055654.96725-1-zong.li@sifive.com>
References: <20200210055654.96725-1-zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200209_215707_971226_97A51FD6 
X-CRM114-Status: GOOD (  10.14  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Adjust the indent to match Linux coding style.

Changes in v2:
- Remove an unnecessary void* type casting. Suggested by Joe Perches.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/mm/kasan_init.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index f8eaf7e73a23..abeb590e81f2 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -19,18 +19,20 @@ asmlinkage void __init kasan_early_init(void)
 	for (i = 0; i < PTRS_PER_PTE; ++i)
 		set_pte(kasan_early_shadow_pte + i,
 			mk_pte(virt_to_page(kasan_early_shadow_page),
-			PAGE_KERNEL));
+			       PAGE_KERNEL));
 
 	for (i = 0; i < PTRS_PER_PMD; ++i)
 		set_pmd(kasan_early_shadow_pmd + i,
-		 pfn_pmd(PFN_DOWN(__pa((uintptr_t)kasan_early_shadow_pte)),
-			__pgprot(_PAGE_TABLE)));
+			pfn_pmd(PFN_DOWN
+				(__pa((uintptr_t) kasan_early_shadow_pte)),
+				__pgprot(_PAGE_TABLE)));
 
 	for (i = KASAN_SHADOW_START; i < KASAN_SHADOW_END;
 	     i += PGDIR_SIZE, ++pgd)
 		set_pgd(pgd,
-		 pfn_pgd(PFN_DOWN(__pa(((uintptr_t)kasan_early_shadow_pmd))),
-			__pgprot(_PAGE_TABLE)));
+			pfn_pgd(PFN_DOWN
+				(__pa(((uintptr_t) kasan_early_shadow_pmd))),
+				__pgprot(_PAGE_TABLE)));
 
 	/* init for swapper_pg_dir */
 	pgd = pgd_offset_k(KASAN_SHADOW_START);
@@ -38,8 +40,9 @@ asmlinkage void __init kasan_early_init(void)
 	for (i = KASAN_SHADOW_START; i < KASAN_SHADOW_END;
 	     i += PGDIR_SIZE, ++pgd)
 		set_pgd(pgd,
-		 pfn_pgd(PFN_DOWN(__pa(((uintptr_t)kasan_early_shadow_pmd))),
-			__pgprot(_PAGE_TABLE)));
+			pfn_pgd(PFN_DOWN
+				(__pa(((uintptr_t) kasan_early_shadow_pmd))),
+				__pgprot(_PAGE_TABLE)));
 
 	flush_tlb_all();
 }
@@ -86,7 +89,7 @@ void __init kasan_init(void)
 	unsigned long i;
 
 	kasan_populate_early_shadow((void *)KASAN_SHADOW_START,
-			(void *)kasan_mem_to_shadow((void *)VMALLOC_END));
+				    kasan_mem_to_shadow((void *)VMALLOC_END));
 
 	for_each_memblock(memory, reg) {
 		void *start = (void *)__va(reg->base);
@@ -95,14 +98,14 @@ void __init kasan_init(void)
 		if (start >= end)
 			break;
 
-		populate(kasan_mem_to_shadow(start),
-			 kasan_mem_to_shadow(end));
+		populate(kasan_mem_to_shadow(start), kasan_mem_to_shadow(end));
 	};
 
 	for (i = 0; i < PTRS_PER_PTE; i++)
 		set_pte(&kasan_early_shadow_pte[i],
 			mk_pte(virt_to_page(kasan_early_shadow_page),
-			__pgprot(_PAGE_PRESENT | _PAGE_READ | _PAGE_ACCESSED)));
+			       __pgprot(_PAGE_PRESENT | _PAGE_READ |
+					_PAGE_ACCESSED)));
 
 	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
 	init_task.kasan_depth = 0;
-- 
2.25.0


