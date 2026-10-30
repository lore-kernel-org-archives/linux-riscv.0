Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1316606A320
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x46jz8mJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Fq8AOM6L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ahQjwvpo39/bkZbVAEByyTh1wx1e5j5b4t+D/bZlLBY=; b=x46jz8mJJxKxykTUJxejTWbwc+
	b6ti9plIIF2x/U2nZGPcPSE1w5PpjPfCnH93/VD6pkk5GB2hPJ/7CRV3a8LJLRb3RpzEU+7A5RBzv
	amkg1wazsXDtzp9AOJzr/jqCKhHbXWuDWczo8BVEjwFYiV56MHCOubgl9OqTYyhAZ+dQ1mRNOJmtf
	0MOQjJ8o5/O6QWJXSlfwJX1m7bgukpibgfUuspCo8lBakq17WjTDP/ptgLnFFwqw8U2Xxu3JWw8tb
	qPp30lvbIEgdXLv+CH8aJjYQU3z0J7DV9bqh0opC+6gxmE3eqSR4tv9WINQXghD8vjteKRTBHcCtl
	WaTWV5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnHl-0000000BpaK-019N;
	Fri, 30 Oct 2026 14:08:49 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnHf-0000000BpVn-2SL8
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 14:08:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ea7987517aso5618295ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2026 07:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793369322; x=1793974122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
        b=Fq8AOM6LGpLsgNUrkra43yYjKJaXCk81FdQL5APGIjoHalwn0D/7LgpmojFT4I79Jv
         NDiC2yCbscpInnOBUS9eedRsUeyAKta2NM8/AtTai0zuspuqX/WRfZi95OoxxEmVGYFe
         oIm5oUOh/kSUktWVqak9ZWTaX5SFQ1jneOxPD31WaDwmqz6P0Yz0Euu7cB65/kljPbMF
         aT+iATBx2AMMG/MCE17gixM3lo+oYa7IJNjaKh6WMRxhAc7cIdIuCelM7qIVq3HpMI65
         GBpR7I81iYW7+YILd/8yLV3Is0/5y5WrItjU+s5ynerGND/5cU3K10Ei+LzBQlsr4jhu
         0aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369322; x=1793974122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
        b=Zt27Vu1DWXPPbb9cILCBdfad8hNUfE+d8UmdUJT+n5ScOx7mh843Ii4kbZHE67Xkbc
         ErI6ZRmvNWQnEt14mw0ALQKNsM8XYIxtSyi3b/x2/1ISzcAdnMsHVa1wrwKHve8Lue2v
         i+ZLzr86L/kDZdb/VgKm5fQ5894NxNmlAaLcxv5Aj+KBNUSuPTQZD2TeeAkdPhhT1xmY
         iuPMKYfH9FoFkKo2nwT6xdSyECCeQs7qP8s0+FhtWrrcy28oqRoKJ5NQdNBw9wVwIvSp
         qACqvVfwuwUYmxlX9dUutcjr4bgYcZX2lg6/p7rIitTGqsJdhnDsZvnHxrXzEfx9rXOu
         mauA==
X-Forwarded-Encrypted: i=1; AKwUvBxazn+u26Hlt/3yeZpNFekRrHqM/yITn/9zyQQggrk3HI3HUJPOn4qXY6ZhsgOJN4VBg0Pj7J1mlqD13w==@lists.infradead.org
X-Gm-Message-State: AFq9FYJap9MzC+Ycwu8LBFxgxJeiHSRjWD+Op5VIZQg6BQL3qYbK1lKN
	PSC0IF49yVrkOEQD8hGdjJADKe6eyqYHWY5sjupDbewy027N9r0CvBRlE8xaxjIbVqE=
X-Gm-Gg: AYBFou1hOOxfn7IYSdxdjpsAmCPS7k92A714bDfhxjxL4odAxWWfTkBo9sQmDUCqWk4
	SXiJLtXC88bEISi3PmbWRwIZagkjp/KF10vbhQ0d0yAkKHInhYUbWRe60uJ3jJK8RW1CTFGwtyY
	z323L0DZEUzncLlQsMRqMw7Qhu+Tpc6kTvEnzuz3QG80gpqz1PncOBdnckOh9CYux2l0nBg+ubx
	vM5rhTf3tqI0pMUKut+70HpEPOejXP9UNeupjSC7d0ELiMd9P9rOvJSiscjnWf2jDcqeCq4Xnnz
	37OcIvQcj0UMk8VLG9hDcio4J/WOCsOO0UnkcqOUDWqhaIndx/N2I3c2WX2Vw7KRmm/76Ar3oPr
	2z8Kql/hyUz6rWJwaDUUapJg6qXoM0WuJloyeEFmVwCJU+0j6zPCaWCk13Qh2XdfrkAOfbsq3lf
	gh7aml7BWtguESA24SzmdvdSFQQgQfZf0KR4pgWlYqDQgErDrWNvd1DsEI071lUfhHwDOw1lTU3
	QSgWsMh2ONczRD8paIkdkuU1zbfwXJL2T+QOA+mUtkjOUU8CB2F9b+YjeGm+EG6ByUOk63mbDk2
	CfYIAxlyw1CMnw2dYbjNDoKZwwBmETs2THYvLbijdmZECPOexyk=
X-Received: by 2002:a17:902:e5c1:b0:2d6:e9f3:9305 with SMTP id d9443c01a7336-2eb36414ef0mr26789535ad.5.1793369315295;
        Fri, 30 Oct 2026 07:08:35 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm7601795ad.62.2026.10.30.07.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:34 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 1/4] powerpc/mm: make vmemmap_populate_compound_pages() static
Date: Fri, 30 Oct 2026 22:07:17 +0800
Message-ID: <20261030140720.1256062-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030140720.1256062-1-songmuchun@bytedance.com>
References: <20261030140720.1256062-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070843_622406_5F5D4BA2 
X-CRM114-Status: GOOD (  10.15  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

vmemmap_populate_compound_pages() is no longer used outside
radix_pgtable.c.

Make it static and drop the unused dev_pagemap argument from
its only remaining caller to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
 arch/powerpc/include/asm/book3s/64/radix.h |  6 ------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 13 +++++++------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index da954e779744..8452a2714cb1 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -356,11 +356,5 @@ int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #define vmemmap_can_optimize vmemmap_can_optimize
 bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
 #endif
-
-#define vmemmap_populate_compound_pages vmemmap_populate_compound_pages
-int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-					      unsigned long start,
-					      unsigned long end, int node,
-					      struct dev_pagemap *pgmap);
 #endif /* __ASSEMBLER__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index ebac5f9058f6..2924604fbb38 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1117,7 +1117,9 @@ static inline pte_t *vmemmap_pte_alloc(pmd_t *pmdp, int node,
 	return pte_offset_kernel(pmdp, address);
 }
 
-
+static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+						     unsigned long start,
+						     unsigned long end, int node);
 
 int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, int node,
 				      struct vmem_altmap *altmap)
@@ -1132,7 +1134,7 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	unsigned long pfn = page_to_pfn((struct page *)start);
 
 	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
-		return vmemmap_populate_compound_pages(pfn, start, end, node, NULL);
+		return vmemmap_populate_compound_pages(pfn, start, end, node);
 	/*
 	 * If altmap is present, Make sure we align the start vmemmap addr
 	 * to PAGE_SIZE so that we calculate the correct start_pfn in
@@ -1228,10 +1230,9 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	return 0;
 }
 
-int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-					      unsigned long start,
-					      unsigned long end, int node,
-					      struct dev_pagemap *pgmap)
+static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+						     unsigned long start,
+						     unsigned long end, int node)
 {
 	/*
 	 * we want to map things as base page size mapping so that
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
