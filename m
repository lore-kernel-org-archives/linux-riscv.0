Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6662606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 06:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qBI18Ktl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=PbGUmReo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1Rfb4Ufy4P3s9FhI+odaIGratw5ZdV9SP718vGYNWrA=; b=qBI18KtlgVk0R8SUB/r97OF2RK
	fRcjxNDXeShM687pgIVslVgkodjcLQ34pIwKoU2O49DrgsbZ6SMPqs1KvUuWJsCb4jAGR7DfHDqCS
	Zc/IvxKRPoBgjW378XV+s/FNO7xQ/Ot9S0680A7CmPwlUFLavGnfU3trLajY+gqMKNolUF8HoHWEL
	Xingnb2eeEWhG0QbMJEOR7lhpXDZ8eh0+Dwrd4qZv83C6aDRHQPOVh78JUNqZzVJDz4AFSrcTejlQ
	e/U20B3mWYm2coJHHwMhW7AKmO2HWQF3VJDOwF0f3UGX3hmiIldGDdUQssvE6rZ9Cacn9x9cAia/9
	plxF1mqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8rp-0000000Fa7Z-00nu;
	Fri, 23 Oct 2026 06:35:05 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8rm-0000000Fa4i-2Bss
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 06:35:03 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so487631a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 23:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792737302; x=1793342102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dMWdlBhmxnvLIraZEDjRljS62kPMNDcGFS9KF9CUDaQ=;
        b=PbGUmReon+/HxWj7SJZ/6MZhik3xFI4ODg0kfSAl8MMWObyI8CWMOkwijQegcjtEKB
         G6hRZHtx0YZ8A4eNXYr5yBWdCIW5Qm67AETrflbM2YkoMmBLL64dl6S8Mmqjutb7OJlU
         sLKWqxhWOuc0VcEGmRbUN9dJVH6PfvNyRRFb10kxaZ5Dpkr6MJ9JiMfXclc9h8zxOrMO
         JuFrld5cyn+1qlRQPKKR/JysuikKyMKvYhu/rWPdgl3Y8oSCvRGxn9uHeFc7wY6qWp8y
         VPyBUsxwpqhbEauifGmlevRUqxuokYNHr6eidMxc39xltEEF9TKzD3HV+8LsGn2IqdsH
         qfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737302; x=1793342102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dMWdlBhmxnvLIraZEDjRljS62kPMNDcGFS9KF9CUDaQ=;
        b=Y5tOxquban+GYe+YvlFLQZmllE1gXlmPXAn6DEXLH/EnDy/FU4+PV1QXFc+IGZQpRa
         rJlSRh/Y/ECYysnRsrYHlIJeUcQAtTjov2XYpHLOslZPtwF3nrTfGtVNsGVQx41zwPG0
         saksXZTB2l9XaI1b8OHNnjZqpZ6DMSStUdjEbBSTFeFD+cJYVXJ9PN5W//R9Qapc/1rk
         mLyQHaQRIdBgDFuPSxXMFncpiscnYJr1kPwW/IECU4lZZg4VtVDklSJlslsV4ERuEhmo
         6tT651fWTV+H5J8PMqsKIbea2tJxpaUtOXn6mw4XN/O9jTU9J7BKZLm4oAyqVTo2bK35
         w+WA==
X-Forwarded-Encrypted: i=1; AKwUvBzlzVSko+PtqPbhE0tUSKhps+9N5XxkKyhNF4Dtp3z4gAhRBfh62zvx6wD0Mc9ZW5XIKKJG1z9rfvACYQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ3Uyu0ntT/BE2wyTEe1eMGF5AcjWg8hjkUQF1PHQfXh27yzaCX
	OhM+dkU8HP8CJoDgn2zpLRMZrqYnKpi8dTRkQ8oOq8weRINPhr8tJBKhqtT8n3Zqr6U=
X-Gm-Gg: AYBFou0pD3T4NvuLTnfsvgPNVGJQtKg2cb7dqa4zcTa1s6YkqvjsqUmEFlyIsaQnW/P
	KNlGCJpdYm3T5K7R9pLvDVPIzDgLQ860RQSRdJL2OGvqg6Fbsx/NyLQJvgfRG8C7IAkHnG+nVXE
	+P7h7yIhm4Od6QMZe6RLwiVhNyBAWn/eg0WEZ9g5QuCG0h5hbVrduvwbzkeXlOI3ddS3yT3AqcW
	xd+zy+ib94a8u3nMF8RRlYsDpRVZfurEai4PzkDm6Btdf2bhQ+Y7JI13EovgUxNfI9YoVb1TRA/
	4LwKPyYWMhs+smU+gSHsewk0adQDJJolgA4YahE6Qo+IGSWcLFdZ+wtAkceNM981kRq5m4FqwNF
	qfUYrPaBjGyiQU3cwqz0qWQYxw1p2jdU/9W2N7T+tMOvC2hLWn67I4QFioN7Z7zWwxpmWnCAnLi
	va2FOjtI9V9VkGoHSmZ43PGAjSvNZra5Hm29wFltOx7tVmlZOsIdxVTwX1Sgd/mfAZ9fweR6URk
	fN2jnZKF+K3svN/691iSTBsu9cBGBDCg/5ZZOOvnLsoNG3FHjm0afkE9uujc/Z0wBaQ/hvJY/SM
	uA/hkfq+b2EEMbFvWhcR4Qo=
X-Received: by 2002:a17:90b:33cc:b0:3ac:7556:8eec with SMTP id 98e67ed59e1d1-3adce0ce647mr1174819a91.39.1792737301360;
        Thu, 22 Oct 2026 23:35:01 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add246f308sm575202a91.0.2026.10.22.23.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:35:00 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 4/4] arm64/mm: fix destructor for unconstructed hotplug page tables
Date: Fri, 23 Oct 2026 14:34:28 +0800
Message-ID: <20261023063428.3658761-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023063428.3658761-1-songmuchun@bytedance.com>
References: <20261023063428.3658761-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_233502_568806_A74F4C6F 
X-CRM114-Status: GOOD (  12.78  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit c594b83457cc ("arm64: mm: call pagetable dtor when freeing
hot-removed page tables") made free_hotplug_pgtable_page()
unconditionally run the page-table destructor. This matches page tables
allocated by the arm64 mapping code, which runs the corresponding
constructors.

However, arm64 also uses the generic sparse-vmemmap population code.
Runtime intermediate page tables allocated by that code do not run a
page-table constructor. Freeing one during memory hot-remove therefore
runs a destructor without a matching constructor and corrupts
NR_PAGETABLE accounting.

Free intermediate page-table pages through pagetable_free(). It runs the
destructor only for constructor-backed pages and then releases the page
through the page-table freeing path.

Fixes: c594b83457cc ("arm64: mm: call pagetable dtor when freeing hot-removed page tables")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v3:
- Collect Acked-by from David Hildenbrand
- Collect Reviewed-by from Kevin Brodsky

v2:
- Free intermediate tables through pagetable_free() (suggested by David
  Hildenbrand)
- Update the commit message for the page-table freeing path
---
 arch/arm64/mm/mmu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5d..4dce8fa227c3 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1495,8 +1495,7 @@ static void free_hotplug_page_range(struct page *page, size_t size,
 
 static void free_hotplug_pgtable_page(struct page *page)
 {
-	pagetable_dtor(page_ptdesc(page));
-	free_hotplug_page_range(page, PAGE_SIZE, NULL);
+	pagetable_free(page_ptdesc(page));
 }
 
 static bool pgtable_range_aligned(unsigned long start, unsigned long end,
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
