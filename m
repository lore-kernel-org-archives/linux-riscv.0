Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F258ECA6004
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 11:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=720FwdNmI3fh1nx2s8O+qLRReW7OUAe9ReBcrQKCRAc=; b=BiiFNpUleO2feE
	FhseTcPsDdWXOyfab93fEv0FQ/9k7d0VaZ8kFBV9LUtc1tNU3Aop6c8VQRNZq2AfQKllHudSRcUmD
	G7wIMggy6dBmpg9pBOElASn6tQyFSCvx6HPZrTuUUb5hjlojc9MNoFTZiK7Dd7cOGWT2/hZB19Srf
	AzUleRCVaJTEDoIqVIA1HwdGzqZU0MjiFB8b9wZvtiujhdUVpDH92DOIxJDfJy2LkCiTUOi7iu7fe
	WqeSw2E3Uemg3PC04PJMVd7vQHMOj6dGG+zi6j1wuTD47NOCd5HgLG8DrSQ8fvYdY5Eva3sM6QnEl
	9Cx/w9rXNPq5NXg4Zb5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVDf-00000007uv4-2RaL;
	Sat, 10 Oct 2026 11:26:27 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVDd-00000007ut6-2qPV
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 11:26:26 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38759bcd877so274490a91.2
        for <linux-riscv@lists.infradead.org>; Sat, 10 Oct 2026 04:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791631585; x=1792236385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwX2V/6o0Kptw/VlXJ/4Jp9bBaiXMijAHR2YrE2LL1c=;
        b=cohJkVwvNdZG1N7z3IJlT3eGBlqqAAki52Y4/1p+ylmWxNxyprkM4LrZxytOM6n1mG
         63WVFhxSgSEo/CBATTGei2BYe7VB31sR5aSbr16YF5RRaHcx0+ZUlQU7r/U0TjoZg1+h
         nzwr6mDbf1NOCCa2Y4zO4SOQVIQ871wcocCMmr2gHJA1YgoHKBYSjZLml74j4zwzKVFy
         hC/LHhIrrsHX0ZUicZuLoBQsyp2EDT2nqMh9goeRgW0a8BprLsFusuzB/LAOOcbXrBTV
         jhse5xctu4+OsqQHl2748GGWbK8WD1yzORkR/PvHhTDebXdalHWx8IMYqfj6YmkQ3llC
         HfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631585; x=1792236385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwX2V/6o0Kptw/VlXJ/4Jp9bBaiXMijAHR2YrE2LL1c=;
        b=x7oM3B3D/JG8jlTqz1easkpSOQAMOj1lLi9VJC2FxjyyUzqdfcfGlGpvlSZMj3x3Zj
         9w1oFmvQ9HkDRpSpcDBezqnqCTtMWJfy7pQ5OHM2wErQx0l9O38m4Kj0iiAv9g7Cgnbb
         tHfOjbpD8kCHPqbGGb97tL1WuZ4I9ebRHaoEQruERyIcnNlQV6WHymLDDUA7f6VERzJD
         F7YERl7i7z5FG8q7xb/QSZR3i7E+pmx2Q562snAnCmmTb6eHeSayJTbY0YMl2IDv4c62
         h1Bphzo32UORMdZO8/w/qRel0583jUMK6WWRpytEYNdNcx/L46Ibp29W/+/IKevCh0rF
         M+9A==
X-Forwarded-Encrypted: i=1; AKwUvBx4Rjpvbq+KmJWV47QG2f9yTfuNZcIMr1IXTfBkB0YfIyr+ebffFkT8VOaCr3TIZwwM2HcXNBh8uxFnkQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLIPZrty5O1lF/FEN/hloEs69F9mCUVIZPqI4igt8A5ghI4uNCO
	uKbo1SlGajglL6X+bftL9SlmKT9pu0YKzKNIKIUHFHxfKlDArntA8LeX8Qld8sCERDg=
X-Gm-Gg: AYBFou1JRtMcjVv9SGpf0MePif5gRpKqKGWfyBFZYZh5jyA9iNv5HpeftuZucCnIj0R
	C2atisX8IY6KPzfHhQ/pQnfh0fMHuN91GIQnUEpq5Baqd5P93fX1Vxf4bu9JOKE+aDrxHwApsJt
	s1uvmu8mcmHZ7zfPCCWYiI0zglx/pB5qP6bYDuJIu1bB+r4xQe1j0IqUU399Gum9nYiVLC/B8xr
	Xq1zmNNnZaiJA/0TSgsDst0Cd7QJtgB84mzQQliCp95W/ay74nAl7FmaM0ZWf46J5vU5OIi7wom
	seLWo0n9nV/h3Lu2b31IID9EB3iT5dclgoQ66dpM4e/KkfybdOLBNrjocusW5XPJVPxIzxACY2c
	ucdXGzJsT8rc6N7DxsMPTDyUhy1aQusbF5ZxdQU0dm814Sxv1hO+zx6epOQ0vRavUH4hS7vS+AN
	4T8SIs1FQDBcEWmtOIpgA5/N+hQ6RufYpMZhaDjHqd4tpaeWOyljXhXVOgIZCTBKcXH1dTA+DLi
	UuFJjjj/Dd7O640a4eoWF6ElUOwlLF0V75cVA==
X-Received: by 2002:a17:90a:e7ce:b0:3a4:ef4a:4f12 with SMTP id 98e67ed59e1d1-3ab3b01ccf0mr3608742a91.61.1791631584895;
        Sat, 10 Oct 2026 04:26:24 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm7900233a91.0.2026.10.10.04.26.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 04:26:24 -0700 (PDT)
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
Subject: [PATCH v2 4/4] arm64/mm: fix destructor for unconstructed hotplug page tables
Date: Sat, 10 Oct 2026 19:24:57 +0800
Message-ID: <20261010112457.49485-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010112457.49485-1-songmuchun@bytedance.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_042625_723181_7E7BB47A 
X-CRM114-Status: GOOD (  12.68  )
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
---
v2:
- Free intermediate tables through pagetable_free() (suggested by David
  Hildenbrand)
- Update the commit message for the page-table freeing path
---
 arch/arm64/mm/mmu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 7343ac9294f8..26a8c665ae52 100644
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
