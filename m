Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AB3606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=agZF3YrS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=YNkvTx5Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rJL5kU86wtOJj+pM1AHebTOJm2ZIJFUWPA6wZIm2RkE=; b=agZF3YrSf+YflXoPRhBEqTb4NJ
	3YzFmgriF9RW0FsV3cpFzGDSRDm+0YFucmB15WsW8QlDJhwsQBMTPggbrwq7egBEZp/g6HPWPv57J
	jCp9dCaY5boMyM3IxZeqe4Un6OveeidSszzooFMxXx4T7kUnNGbtIDfVmlDWpW3oAwStmMD43ic99
	O7OGdEVluyIPTGg5UvHrwhIFIMWuqPdUV2N30/3iA6Ztzj+gpMt0eOnGdP41bWzW7mCuvsRD47hj3
	wM17b37qBGmTFHXFVM6LlFWJvYWDmPzug7qpq3PQS5cNktX40FbpT3yrtPxQZ9FiBy21aypFTlzX/
	WaNtTXVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnHl-0000000BpaW-0Q7B;
	Fri, 30 Oct 2026 14:08:49 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnHg-0000000BpWO-01bJ
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 14:08:45 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2e9d7791b00so5432885ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2026 07:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793369322; x=1793974122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HwaJdDbl3ziEIlNq+4GJpu2/q8X3inKh6ZLd1kzHiJY=;
        b=YNkvTx5ZOjzZu2r989uUxJOVTEx56ms+Y6SbWFHRuI+M5chowtp+qtIYeGepJC1h39
         B4v003AlZVfOUqeON6vzZqp/dfOujYVJzlkzEfsZOAVC1ppLgSKVOZ+Db7LAXFvwrxAg
         1uZnVsEbHdUt0Dd0r5jnjRllbSLR/8XV8fLlFxoiUgSnfMHhBBRgILOdHH/a+uHukGDJ
         iVVyV8Q+Vrysw30ewiFTFfkxhBohDRMPpNFsvA2G18YsIWgvEyLB+5CkifbvHJBVGot1
         5CRzQKBKgPZxCXqwHmNnIKJ7VLjjFuY8+xXpETwQL4uysHhplaEwmnKk7T0IYNIUaCR/
         W7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369322; x=1793974122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HwaJdDbl3ziEIlNq+4GJpu2/q8X3inKh6ZLd1kzHiJY=;
        b=I2dXFgXsZCfMEviIg+Oe64KtBuFCQvWTz4zOULlkUwLudXNIjYrCqxBu6M8GbGddR1
         hq62qXNV0R7OUJe/NPKn1gjriP1e3osC3fPr8pG/7x41e7FkELcV7c8SvE2plu8uh6+b
         CAxlulgVilWMBPQZ8jynHkrgYF9uBp/XdlUdOdTRIXfqaN5P21GbL+lRzt/s14ub5jcs
         oQe3Av6+DEPJ0/Z+GJSK7RqSJSArabYpa0tEastRWMe0+1aPtciNRhX3US7ZUgfIB1OG
         lo6eF1tlCu3AeUBBNS1JAL2ACPLZWuxlf9JFl7DQIiwZl0q7kLWTpHnWxPljwxXtdFDt
         n95Q==
X-Forwarded-Encrypted: i=1; AKwUvBwjq47oZS/uikYdXxGa/hGsKp45tYfh9w5qoShUgHHERfAA/lYfcx6W8+mEYEY0fL85KOCEH71GSYj+zw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJwrJBUVfGz1fNY9+OkqlmD+20oUG/qJvuYII2F1GbK1It1RHu9
	enVKfNLClPro/ByhDIq83TfOs/6GSgPK/w2j9e7a7FK6vrBeB7haSrozH4FbqqMmbxuPMlYa04j
	V978iygE=
X-Gm-Gg: AYBFou3GV1gfX0BksvNh4AoyOPSAq5dJDXtXfqEp5M5Z4GNcfkwMlUyr3KE1uY6G3Kb
	AnI5Pa0wVlmiovh3rNzBGbn2EQuOV48Biw759E5s/C+qUcWZZEk0cvB1T87gSwfPRfkft+7+NSK
	IhgOBKzdKnzwFI+clhuxHRbzIwWGCePmppxwZjWqWFFQ7KHK3WuYhnWXGaikdHUEmMePOuQgehu
	rf9kB7UX87UMDAYg5FL7ltZMv/u1O5t0xXeJC8NQDmgZTSG66RYvOqYbg5SQZrzxeLSzQDrlacm
	OmbP1B6vk1X51jhQ1YgSZ6vOUw0cZ+FM6H2+qvKnkG/+9OJysiBgglw/lxiyORb8P9SvIazMzMi
	C7twMPd+kfLHmJvM00bV4VwiVkD7YCbgK5iTm8Nqgh7TJAJgzX+BrG355f+Ey3mks/h2dJymRoh
	hdBErcxhXKXDkOixlZbLte8Gn9mGWZ61bhusBnjTKePQN3gB3pFAbU4u1nUq/OqDa1vkvCEyyzT
	j/sBvbeqlOPoRy/f8thFnhiv9Ch2V2Ctu/M8Xbm+u5vyY3Q2HEKYB+dOvakefcNYiGZZkJ+BpnO
	r32VNdrpoa1koResnpp2ZKoM9aU0nNIWBqq+xpu9i5+m2KEQvBYR
X-Received: by 2002:a17:903:1a8b:b0:2e9:401f:f0f8 with SMTP id d9443c01a7336-2eb364e9f6amr24067465ad.53.1793369322301;
        Fri, 30 Oct 2026 07:08:42 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm7601795ad.62.2026.10.30.07.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:41 -0700 (PDT)
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
Subject: [PATCH 2/4] powerpc/mm: drop powerpc vmemmap_can_optimize()
Date: Fri, 30 Oct 2026 22:07:18 +0800
Message-ID: <20261030140720.1256062-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030140720.1256062-1-songmuchun@bytedance.com>
References: <20261030140720.1256062-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070844_078584_B473FA6D 
X-CRM114-Status: GOOD (  11.07  )
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

PowerPC no longer needs an architecture-specific vmemmap_can_optimize()
override for DAX vmemmap optimization.

Whether the optimized mapping can be used is now decided in the
architecture-specific vmemmap_populate() path. When PowerPC has to fall
back, such as on Hash MMU, it can simply clear the section compound order
there and disable the optimization for that section.

Drop the radix-specific vmemmap_can_optimize() override and rely on the
generic checks instead.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/powerpc/include/asm/book3s/64/radix.h |  5 -----
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 10 ----------
 arch/powerpc/mm/init_64.c                  |  1 +
 3 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 8452a2714cb1..df67209b0c5b 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -351,10 +351,5 @@ int radix__create_section_mapping(unsigned long start, unsigned long end,
 				  int nid, pgprot_t prot);
 int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #endif /* CONFIG_MEMORY_HOTPLUG */
-
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-#define vmemmap_can_optimize vmemmap_can_optimize
-bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
-#endif
 #endif /* __ASSEMBLER__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 2924604fbb38..63f369d296b4 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -978,16 +978,6 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
 	return 0;
 }
 
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
-{
-	if (radix_enabled())
-		return __vmemmap_can_optimize(altmap, pgmap);
-
-	return false;
-}
-#endif
-
 int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
 				unsigned long addr, unsigned long next)
 {
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 0e777d7dc332..509cc4190db7 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -282,6 +282,7 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		return radix__vmemmap_populate(start, end, node, altmap);
 #endif
 
+	section_set_compound_order(__pfn_to_section(page_to_pfn((struct page *)start)), 0);
 	return __vmemmap_populate(start, end, node, altmap);
 }
 
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
