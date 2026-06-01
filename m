Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E13CD5BD1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myGvkEfhyrN7KRLhTZ1mVuoDvrJ7ReS3qShY0wa9iwQ=; b=45Ly+hRnxJ4Nts
	+YXUftTssSsNb3pGKADHCBovO/K30ulmV4V13dCYdvo86afGxadjiP8JhpKzY8StfRQ03wA6jXseH
	A50SxTOwvsYfwf0kqX8I3FFCohsGtDYilSu/V6ecpWdziAQDYSmFciJ24wYhFDQMsO2wq0ZToH9bE
	5qm7G6y0ANuZrKfui89K+q17MCOwRElsBWKRSYDOLtpzTZiGsqlv0N0DJYGz+bqklOZluntRvFB+X
	Cgd1WeZlIqIZJwkHrsCrSXw8VGTKFN958RW9n0IQNYmEJYa8q/WXbJCkJ2GwhuC1dP04twaX1dsIy
	oc94fHSUbGilPTVz1dmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKp-0000000AQ0f-2oOM;
	Mon, 01 Jun 2026 08:49:23 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKn-0000000APx0-2zRj
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:49:22 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8423f626a65so351201b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303761; x=1780908561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=myBbZVt9pZizoKTbw79TdKlIez+dzWm6VMZTcEDpjws=;
        b=Bx2N/e37QAwA4jDjjbsJf/uihN512KrJ/A+YU1ZDnmZgjQPYcw3S/9yTydtUZWAbEA
         IuqKgjDGkYG9gTQurFkzdHDyEfbOcmVpwBhqO6KDRGhrhjH6m0yCqJBp+9CcWsGJ31MR
         BDFyYDPAIh2Y7pYmlc3hP9iKsggsIYd2H2LzDDOfWh+adnfb0sQ1ESOh70vzMd8Sxd2h
         lHyJuy4M+N8MLdsb0jyymjaVYTijlqmHShvwqM+2hD+U4EVTl0HrBRvpp4HfG0+eW7Xa
         VeyWF9LYxeSpWxe79OSiyCdMcbyGwZ4Tc0lrG5Kc74Ru3gd6f+l/BJrRY3BDRs8m+YqB
         LEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303761; x=1780908561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=myBbZVt9pZizoKTbw79TdKlIez+dzWm6VMZTcEDpjws=;
        b=s+/CCnZfiiS/B8uUt3FZYo1prREHI158ZigKB3hdDCQGkyYxEmWtkLSv2li9J3X1TA
         ICogNmEydyjm1QbY7MEKtFFSUSCNJOF6gyq4uNRAjGikR4O4ccVP2/tu6ucspjpykYZu
         z8z3qES4kAdjyoNhELJwA0NeG1EKTRuZp4rQNhCxV4E83FVM3sS0xwUEb+YVy6pC2fGL
         0LdPGJrNz4YDvQdloPPOJyx+YGlfbd5o9eadd+0y9MX7doxhmBboIARmL8XcvLM8p0UC
         0oqUzv2Wqv32J0GQ2iIiwuV0lRFXoNPOLGOZhXTya9iQF5OZ5yJuYlHyb4sHpM0FCc+h
         0jiA==
X-Forwarded-Encrypted: i=1; AFNElJ8BmO4g6WWg/8zDbQ1lJ1QZBFNgBRrrNjZAB8nMKzKNkHyHMo1na9/dO8eK0j+Q2Z+35jJrSDWSHGCUkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwErzFE5su4hX+73cLjARwtd9ZlVT8lhW8a+wUx82PpcRdNTghu
	Q+dUPanZF2ZFwXR4Vz7hE+GSoRgsLSfhpJVKJuggvp0hD008HkLVx46sGXE3L4cVZY0=
X-Gm-Gg: Acq92OGo6NyTey2gUxkktIHvJrcRJwyk4y9+Sjd5HlTNhU6Ib5A4G2kYWxebiR3Z7sh
	7f5P7fU4MsxOfQwyc7RfVYswrafXQbO7SQUQvwvEI3zBgor8H3yHSCwg1jhDXGj4SggpbV9DjzP
	bCRZA1LHUACU/WscvT0GKI0wlROPq1geXylDLFYdlWqoHbt1Ni9V4VpsNO6gcyUGeN7aig0LbAq
	0yA3TffWu6cCaziRZOGcLLrMwIMVPqgttVqenWm3nJXCKwLMXYrPe9GQ8qfghzlf2Z5iLVf21au
	xevlTATk1M9srhYZKzsCrwHnPxMJ45kEgPFp72SdhIRV+fiWgniOSEkQskgPcEA7mfb0nBlhVZC
	yp/xn2iTvlrCJjTqCweYM5XJhUUNMX+fpZrN0jSlJrRCYKb2A8VcuGQ2kgAW3vekkFgq6aOXkj8
	o+BMCrRGi9nUEPYBCqRIE842+dYsTUOjVRjgda9QAFfWqGQAfYbHhhHw==
X-Received: by 2002:a05:6a00:3a0e:b0:838:29b3:9ed1 with SMTP id d2e1a72fcca58-842255c8233mr8977076b3a.41.1780303760714;
        Mon, 01 Jun 2026 01:49:20 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:49:20 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	WANG Xuerui <kernel@xen0n.name>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v3 4/5] loongarch/mm: drop vmemmap_check_pmd helper and use generic code
Date: Mon,  1 Jun 2026 16:48:43 +0800
Message-ID: <20260601084845.3792171-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084845.3792171-1-songmuchun@bytedance.com>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014921_757264_807C41EE 
X-CRM114-Status: UNSURE (   8.56  )
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

The generic implementations now suffice; remove the loongarch copies.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/loongarch/mm/init.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 687980b6e91f..3407030f3e7a 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -140,17 +140,6 @@ void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 	set_pmd_at(&init_mm, addr, pmd, entry);
 }
 
-int __meminit vmemmap_check_pmd(pmd_t *pmd, int node,
-				unsigned long addr, unsigned long next)
-{
-	int huge = pmd_val(pmdp_get(pmd)) & _PAGE_HUGE;
-
-	if (huge)
-		vmemmap_verify((pte_t *)pmd, node, addr, next);
-
-	return huge;
-}
-
 int __meminit vmemmap_populate(unsigned long start, unsigned long end,
 			       int node, struct vmem_altmap *altmap)
 {
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
