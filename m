Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D882CA600B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 07:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtQEmLCNbhqJT6MyrZE2OpVYK0iyqmmGvjsmJZ8lPDo=; b=pDlugQHPgEYPQv
	0mIVNFqKl0cDS9I2vQ7lGWC7hQTKAEHU+9sNbCt4JvXh2JHfO5OA30GRLBORUkR4EU1bl6DOFpFcc
	9dujQzIFZ0GP7PFwQ3H5ZNqElMaplAAVQAK2X0abG1FTjJEKWu1xBDwujbd1zjqrbIyGyLeNA8/aX
	51hSeno9Jp5Un2fmUWuE5Jn3AOWaYBbPAy2uWVUNYTSVP/XECs6P8aIRwf6QenbxWsixCc8qD1plq
	eKwokYpP3jgQkecMk2+Cz8XCTDnedOQcmwDC1ve0ajP56tCLID01h6oDU0UmtxtPiF7TuNnUjqSev
	ybVYN7BvMQgNIMmwElLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEian-00000003kqs-0dsu;
	Thu, 08 Oct 2026 07:31:05 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiak-00000003knr-1lRX
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 07:31:04 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so318514a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 00:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791444662; x=1792049462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RvkPG82zfhFkpnOg0JOtNiptSg9vrvtxMEvoINVoQXE=;
        b=UtLO6T/SEBCjQo0ABQv9+mga2EOBmqv4C5zGs3IOYs4ZOCaPPgvKmrXD9OYTerWapL
         7jM+vbTusCTSWL4Q7gefVdVPZ/i5XGqhac/UyTk/Zmz7vgUQ4UH3eaYq8MJieKYAe5Og
         ezpYeaqQqkFtItmxrXd66hnqDX8m6akEnNUcmCNXNQF7m/+x8cNRpUGDv1xWa2YJOZBT
         iLuzr408OFQ8xTOBN12T7ndssG+dDc2clW3+ClwZkxsvA8HQJ5hRJS6Ijt1+Eq5QN9Pc
         moELo35Zf6Ybo08GBLlbd8cZ0gQgPphhhQkETzJUGCGeuYUF9vFYzMdRLzUjFIPotE2N
         FwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444662; x=1792049462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RvkPG82zfhFkpnOg0JOtNiptSg9vrvtxMEvoINVoQXE=;
        b=WahuQFqKVEU6TqGOCJ6qBqIDvqdM9wdgZTq5FTlhHJsLmd+8L+Ud+sdJKviu2IOZHz
         tBRkPBKCC3DSp7P8GdcKWEYRywpq9ND8MCAjhHjMi/SEAzgCZYb8HJG8O+b0LIaUBAeH
         LwQadCpplJ/x0alm7/1uFsxq/r1VnW+lRFRMF89QULthdhiR0XzpMlHuf8gSQdsv3yJG
         uAy046z1hIa2HpzsiV+00eTC23+15CxdRre1xgzovEpWwoh1Ww0fyMoNtpqDrjGanFbF
         7+3l5KkxJu0MKURf4lblHWGkmxt/ZKcofYvlA97xq8nUICEXC8Jun/5FAH8tDpaGmdQp
         DmrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsd5/g+UNqloEkuGTWK8SC3QGWKZjiXCF5EWDAz5w/O8ItxPb+rI9sq9qs2twD4kfIuD2u5SIeQQLRag==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+A3XAxxyaLBVPeuM8o7E2B3JsWk6gW1o4eQelY9YDDPqypXRM
	0Mgt9uz2pCjSP58fe4Sm+7YzCNoZGMSK5byPpcd3xfaUUYczNZ143HOMfCmU5t+uz50=
X-Gm-Gg: AYBFou3TIICVn8r3T8qeS5tvzi7lYLkAqmEfW0RnMelPgAwDq3AbVFcl7NOQ8TYthFH
	L6vPbAu9IbT4jAT1v7Cw0ZlHNSNvz8BamHaKHRhdFuB17Uzr9tGbPKXSaBw7wdhudrkNI1f6u7z
	FY3GHkhbbzZccHdOFoF7pEo9g703K0cYEeMqfDFXtxqf7e8d235RDVGiOk9Rnp0vyH0IgJenHSN
	VxJe2dY/DZB2OAiKynoffKoCZcvUNwSkIjQ4Fs7d1CCwBLsZBdsw6BIabkTMNJzNFkR48GZd2+7
	Y5G5/oaDnOtEuv5Nf7666vu3m7kGAjz4MwZ6cApEp+Pvco/HaBCA9KcjMqCP5id4qBXqqROFg9o
	kSfZgUj7mGQY7xH4hWWgWwhWgTADoac9BoqBDOiLvvVYLgl3vwcnNIeWEnhVWQS/yBlesHgWoHn
	NVGjVShCChHKCdWgOD+u6/sBJYBLo8I+bLpcYyqbPHspX2TVTvPogBoiXlxinJC6vFOY3l3JN22
	JKBkORpBfNgpRrSwtE=
X-Received: by 2002:a17:90a:610:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3aadff48952mr575784a91.8.1791444661248;
        Thu, 08 Oct 2026 00:31:01 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a438f25dsm3114715a91.2.2026.10.08.00.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:31:00 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	stable@vger.kernel.org,
	david@kernel.org,
	osalvador@suse.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	bjorn@rivosinc.com,
	apopple@nvidia.com,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: [PATCH 4/4] arm64/mm: fix destructor for unconstructed hotplug page tables
Date: Thu,  8 Oct 2026 15:30:21 +0800
Message-ID: <20261008073021.2512665-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008073021.2512665-1-songmuchun@bytedance.com>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_003102_463512_87F84920 
X-CRM114-Status: GOOD (  10.72  )
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

Use PageTable() to run the destructor only for page-table pages whose
constructor initialized them. This keeps the arm64-created page-table
lifecycle balanced while safely freeing constructor-free vmemmap tables.

Fixes: c594b83457cc ("arm64: mm: call pagetable dtor when freeing hot-removed page tables")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/arm64/mm/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 7343ac9294f8..688b33095651 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1495,7 +1495,8 @@ static void free_hotplug_page_range(struct page *page, size_t size,
 
 static void free_hotplug_pgtable_page(struct page *page)
 {
-	pagetable_dtor(page_ptdesc(page));
+	if (PageTable(page))
+		pagetable_dtor(page_ptdesc(page));
 	free_hotplug_page_range(page, PAGE_SIZE, NULL);
 }
 
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
