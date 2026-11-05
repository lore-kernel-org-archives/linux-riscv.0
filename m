Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41277606A32E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 06:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LR295Xtl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=dW41zqlW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ahQjwvpo39/bkZbVAEByyTh1wx1e5j5b4t+D/bZlLBY=; b=LR295XtlDa1xjXO13/4yVi795o
	5TE7pGKN4lu0ewPkP8k1pEk3pPqOI5+FWS0V9X/zoGgonzjgbCeJceb0KYUS2GbQ0nshFyICV6BTo
	gtN0gLOVNaRqKvec4ZgTT3xU1Eer9vRTXcUTBaM86BG+jOFpHCLjpo7tJKkr6rTVwA2N+s9Aa0AFw
	E9j7WpFkArlvYiyHmkpuQgnDOe35l4y2w6zff1kgw1d0YNRLXkFGuOOtdD7wH0TCYG8Q2fSRzThO6
	iwE61GDsnJgcpIBQe+0rzS1xhuxxDor7v5W8T7uZUDOBuv0iQzcTchH8X5x/N8PluqyqP7ufpTcGF
	sBh7S9xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqiN-00000007v8T-1uo4;
	Thu, 05 Nov 2026 06:12:47 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqiG-00000007v5P-1Fap
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 06:12:41 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1328677a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 22:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859159; x=1794463959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
        b=dW41zqlW6tdwkO1o6UrACq/+dLgpb+d8uYsZjPgdachBFZ+obugV17EP/hOFhMhj9G
         DsRbaLF2w5AV8QwB6yru81kTTEDTuRCBX+IBIA9W2TezSUR3Qf0teb7yPV62r772v7dv
         B3rIKpcd05EavLCeopc7P6A1IzJarwbhmR/HkaGLicqJ646gxoVYS2rqK+ibFI1p9+oV
         qPvPQQpCcBvKP8POPdTfE90fov9pySXzFjj9NVyhUZg4nRlXrKwVoenxNGvtgPjeho6D
         bQmQnwcNKJrFLw8kfSimNT/X0oQuxSwEBZvt/8dMYeI0hbHqz2x6j+e/I/e8ar662X1i
         uzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859159; x=1794463959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
        b=mdetJJVQUrj641HUfTS+aug0841rlbdRvcozxHu0ZnDfZhGbGar1GoVEBfvwFdOPFe
         z17w70pDcPbbBgsrPDHOnK/9CzkrG+WmuwTTuqIK9KqqDVhvkAcXKcV1H1K4CrYuCzKQ
         teGPhJMZBxe8NbiK8CKW9ZdX0AaUHK/4iyqb+tddEJNWeiDX1Fu4S8JMMHBC3WXQiHPc
         ir6qRq3o4fP/Ne2rek0O3O9o7ralShKeHAmL4dRhr9pnxs7OHyf5NypWzJukN860+7EU
         0CMfS0NkJX99Qz1LKt8T5qk3MXyCbkES2B5Ic28CfiQ2j4ko5/vbzERmSFYXYrw6lZtE
         4/FQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEFDbUexU7dVlk9iveC/x8Vnxakb9kYrkvBEAmtUVY2ktHHLuzqaREg21jXdJ48uyHQoX3jm5IvRx4nQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9MC6OanDzr/J20fKIgZQbuwhlowM8MSOL8r3YtpANDEbtkETtV
	A7UTdsSkxeibYXbwGZHwoKdAuaByb/eis0Q67UwQBpPDD8S4ffrQVErH7y+xcNlOPMs=
X-Gm-Gg: AYBFou07Ofc9s7S+3cWfUacXBbNm1slA14Yi3fYtqzw6ouKVVnBq503Uh+GUBfkIb6A
	rX+1QGqeyTK1FFx5QKd5BexIN3t0A9Rg7X/8EN7UUEuzevXHHQ/1G3tTWvmYrdAS5Y3eIjLLf1w
	JqyJHyFcZgz9Ms9dVzln88mNczjErVda4skv/CSYznkVxxtigUh7r4JSz51j7lf2h3m8QfYqiCS
	V5NxnepvwT3aOlz/hFxGm8YIXHAKlAOnqgENV79DRpfw1zWd1YlfoHmLuTyO5GuiuA4ROY2utHM
	MdvMxNMF6FWU6bYpdVaA3qRJQez2j9xXGRkf9Wx9nAXsk6w9JEDU1q3mNy61knLq/mT2gIM+TGR
	nyS2z3bT/zSeHQx9/OXsB1jKKW0LsGezeQRx1fn2Wr2V4pAF9IoGlrxBSPzXCmnz16mCIX0e9Ws
	0UPzusJbETjtbOaeTbBp9lGJB0QZq/CnZ/HJadzFQboIWZFzM2w7ZnOeewKQn0DQmu+tCwY3smV
	rWpbda6TAHdpV367ts5DIgAEq/ntbITIat3+Ynh9XPw3G/TSmaPjWZAc1Ko0HiLgmmpTqN2IRIP
	VDWqzYTpRVsIWZdrRuQF3Y/HzM95pZ3vD38XSkID6mXsX59S60tweDL7mMYgBbWBLw==
X-Received: by 2002:a17:90b:3d4b:b0:3ad:eb4c:26fb with SMTP id 98e67ed59e1d1-3ae897c87acmr15846459a91.23.1793859159284;
        Wed, 04 Nov 2026 22:12:39 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:38 -0800 (PST)
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
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 1/5] powerpc/mm: make vmemmap_populate_compound_pages() static
Date: Thu,  5 Nov 2026 14:12:13 +0800
Message-ID: <20261105061217.13302-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105061217.13302-1-songmuchun@bytedance.com>
References: <20261105061217.13302-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_221240_342270_7ECF3335 
X-CRM114-Status: GOOD (  10.45  )
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
