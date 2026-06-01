Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCE3CD6E4C
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p5iUTcfJSldyyKqUOzU0Q409E14BOBGijnRHcuv7SXE=; b=C9MLmCTxW+HIE3
	4j6UM06SC5qZDg72FPuiwAfc4fKWVhQb0QGfmCbTYsP/weq6KDHtQZ76MZxnvRhOj+a5y2x0fa7C2
	2++esexzrc382q6GGTgd72vaQE6+bwowolPkO75jAxPczoRjO8z3tOdoiOcn1CeAHK+GX2Va5pfa3
	XJrpsz6jT++LQ5IIQK8U3yx04RSiCfjqkoqvv6HspOdJ7bO0iIPdlZmH6HvqhUPUcro+eVuDl2BbY
	YTvtDZfqS1XoQDf6SG19dpA4pY8fX8gXcIhhfjjWtlGCdh0O7Y0F9Iy7O+CMIby6SwYU47kiFOcjQ
	e3Og4M6y/T3qTUsyrE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKa-0000000APo0-0C1D;
	Mon, 01 Jun 2026 08:49:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKY-0000000APm5-07IP
	for linux-riscv@bombadil.infradead.org;
	Mon, 01 Jun 2026 08:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8iZQN+oxehRhbRDFp2Djf7RG6EvHlnyDB08mWf0NvrQ=; b=UIYCJn0yZqA46vUy2vlTXT/jPi
	LDk/sJmVYd43rsfPZCfY2fWgp0/dvrTqN0EREkVpmfshfniSfELUtmr5UbGqJw+hPx5v6LAq/6evH
	D/KEPJ34Oq4f3CdZCvKS3f6q8AbCu9StYzhOKhJ+NIdyalUmRFkkZBKxmENWMXpkSC/eEw/2oDBbU
	9XgjSKp+5AvaQnmLaoUatlh95ZO1dIEtAbaUYtj+mDGaXYDkPx0JlnzMaFOR6TJKRGN30l3e6L6Zs
	/fbupH5IU6MPweyqeKZbioi2SB1ZNGNCZZcNmoy4z0wMpyufut9IPDxuamzCXOySNhrt4q/aVj+UU
	YGjfNKiA==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKU-000000067cL-3NL0
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:49:04 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8422524cb38so470773b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303741; x=1780908541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iZQN+oxehRhbRDFp2Djf7RG6EvHlnyDB08mWf0NvrQ=;
        b=CAohNwVT3FgCYvmkTgvtbsvTn7ogfms7JZaqbS0o/B2cRw1QhKWTc94iWPJjoNBmS3
         6jqtrEPJbGlcDAormnUJW19PGjuALnAjLGSBA0TE3Rm2inRivAkUVykjO3n9ikzNW8b3
         oRRsfLjrJhSnKGIK1eDWMuSIN4MCTN45wic44B2mpY1kN7tlxg157nQoqrrFhoDHmUrY
         LRO0CmqP8EZBqi3eDfgUqmNj4Tu0Du6qkT6y87NHV/FaEt44Dsfu3K9m2v3u08slmaZq
         pHbbwZUQp+nw+y5RwEPW+uFq4GjfRggXb1usuHLD6EuVIadOOmsyeSgJL0AGOY4LMWLa
         tlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303741; x=1780908541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8iZQN+oxehRhbRDFp2Djf7RG6EvHlnyDB08mWf0NvrQ=;
        b=fkWM+XrIuBw2pCJRDgPkicSamxX2HTfqlPqK5enMVCFiKx4GJ5HjbBShcz+M9jppW9
         IHWEkA3w+ct6ui4LegDWjx2bUg1S/aUn0KY+V9pgKOrKFxFSSOGRqDJqDJfWAGV7Phm7
         9COYZKDd3fMofS2eAbrvFNQj/46Ul2brvljjXIfc1U1qCMMMUumhbxgxVNsSYryulTug
         W4fsixSXpHqYFscFqtbyHN7ID2eFP80t2nR9gwgDWmiqy7rdHJArzahSgzKAHytjOp7n
         ar4cWhjmHwFhvHgjxPLa0n3Qt99qOnaeN19sHwBTdT6ecHCLZl8b3868Ys2iwTA/rOr/
         eXkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OxpAbO8xRMYCbO003AsXJGW945i0vudkM7tAvpLjLRC2A7/GtQ/f4u3ghQqaUXfWCB85SUibqBc+9pg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyL5NKWCyxchj9H3DUZu+qkMRU4m82lIrd7lNMkxtyeaZ1nVDWW
	rXc9aBjupYPIFZV5ZeyyBB4r9ewm2Ao6b3RjF/Kz/tKy/ilknkThwqewDyD8nsgiMq8=
X-Gm-Gg: Acq92OH2jjxBsuNk/U4MFHdqQ2gtM3fb+JJlOp/xQNRvvRM7/svWkGg6vx4Xjji40tZ
	0Oe9BM0G5oDK8g2S/8F8jHhDkwclljqE0SiZm8tX1CJC/5WoR1WBtVVOJeB4My9Wk1FSH5fh0Bi
	kLoBbdPsVczMSL4s6BenyQ+I5aozXXygNvGmu8T9FX7M/cVc6t22H61hYXcV8ihgupXYKmQW0e8
	DnBrzUQdJ/w7XZkZNNS1MaM5UxEepR4XnR2X1zCO9hoUmMqMFNy1HeUJBh2cYD92iKMBoj19N/V
	HjURjiREmCJw13ZUg/BES+a/3HxP6UNgME0eEk8pM0U43Z6qiAwH9gMIh2hSfl1LoN9rPJ8nNtP
	fTUU3D6IeCooJ6RTmq4HW/zdgnrNBxo4hdO20Hn/G6skVqXr3x/mYkYjV559I+xdLvQjTZM0FYT
	DyVjXAcvnDWTwaudYlO0we/1HCFsLW0C2LwGHOxC6C+r+s4K9mIbUGwA==
X-Received: by 2002:aa7:9a86:0:b0:83c:928:6e5a with SMTP id d2e1a72fcca58-84225376b00mr9579300b3a.13.1780303741104;
        Mon, 01 Jun 2026 01:49:01 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:49:00 -0700 (PDT)
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
Subject: [PATCH v3 1/5] mm/sparse-vmemmap: provide generic vmemmap_set_pmd() and vmemmap_check_pmd()
Date: Mon,  1 Jun 2026 16:48:40 +0800
Message-ID: <20260601084845.3792171-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084845.3792171-1-songmuchun@bytedance.com>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_094903_473413_6553D2D0 
X-CRM114-Status: GOOD (  10.94  )
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

The two weak functions are currently no-ops on every architecture,
forcing each platform that needs them to duplicate the same handful
of lines.  Provide a generic implementation:

- vmemmap_set_pmd() simply sets a huge PMD with PAGE_KERNEL protection.

- vmemmap_check_pmd() verifies that the PMD is present and leaf,
  then calls the existing vmemmap_verify() helper.

Architectures that need special handling can continue to override the
weak symbols; everyone else gets the standard version for free.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2->v3:
- Replace BUG_ON() with WARN_ON_ONCE() in vmemmap_set_pmd()
---
 mm/sparse-vmemmap.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 112ccf9c71ca..99e2be39671b 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -386,12 +386,17 @@ int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
 void __weak __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 				      unsigned long addr, unsigned long next)
 {
+	WARN_ON_ONCE(!pmd_set_huge(pmd, virt_to_phys(p), PAGE_KERNEL));
 }
 
 int __weak __meminit vmemmap_check_pmd(pmd_t *pmd, int node,
 				       unsigned long addr, unsigned long next)
 {
-	return 0;
+	if (!pmd_leaf(pmdp_get(pmd)))
+		return 0;
+	vmemmap_verify((pte_t *)pmd, node, addr, next);
+
+	return 1;
 }
 
 int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
