Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCD6FD7F9C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 19:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEO8fU8ew90hhYqyjcwknptHrL1uxDbjzmApVxzNsI0=; b=Fcg4KZ3I9uGutr
	gCA26Tac9XGYAfhr1gYg67njDuFlZVBvg1PB3lsBHPGj5PiqWyJ+0eEg+ji6qfiXAJMNtzArFYPVM
	h41qb3lBJFF3uo3DZa+B5EToX5UCeVUHCCVZBj+bzua+c7fmqpAvA7US9ZGpkWItrd04QGfOS70u0
	Tg90xaWcblaz19q0jqIoid3fbfLnV70QLa4K5K5CDNOGFgxW8KhQBJOwXUhpXi+Mu5kkgbLn3iEuO
	nwKdT4jqRPNvgoJEGFMmPJBa3RET1yDM9VGwzvuFo2QczMBRlVsNzZstQZ2OCZMVYSwuWZ2QP75kf
	KsaL0s3wdXLg2ualRVbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3Xx-00000008zx7-1Zfe;
	Fri, 27 Feb 2026 19:30:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3Xv-00000008zw4-3G6W
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 19:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D26AA6013A;
	Fri, 27 Feb 2026 19:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D488EC2BC86;
	Fri, 27 Feb 2026 19:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772220642;
	bh=dDlhIg1ZurYJ03ybCvzQ/8rd/HYYP+ChnQ3pTqezzmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pWOmVfG9L1PtXAFwh7t0U0BJevImZgOUekUjPRBveHQm1Ghl6kiM0Ae/FhsqRUS1l
	 Bjd53tMFDTSjxZKYlqjn4zL0+O+UwSFNVaEo0IRmNlD1O8KZJmJHgmT5bMf0sWlQUn
	 LEUfhJGDUKu51//iSReNCY4a0eXjRKwOzpxWPDyAJY2sFxJ/kF4CEhPAkAMOsn3107
	 yTzgRjlPyCrh21e8rpAdKlXd8wHWbreCujlA/9OSfgXqd/5LkcBbtoj+ODwr7mxXLD
	 RbFQnDCy2MZpvM8oIgHvuQyKtPEqrwjUcQ2Tnr/AJ0vpqsQzRa/pKMe1bKpzPmLByW
	 6LTVG7oRXhbiw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 096E4F40069;
	Fri, 27 Feb 2026 14:30:41 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 14:30:41 -0500
X-ME-Sender: <xms:4PChaaxF05G3PS4ruFPeqrl4CfZBDukTsDkjkkX0ww5r7pPTOXtreg>
    <xme:4PChafc7zpnA3mTUcYsZf0M1R0ABoQtFC3Akvt5C_MlNYimapFQHKrZpXU17zhl0L
    43RiYrUFQsj-jA3NDZZe9NOLp6j6iTQerxzCNCzcikoWNkbmdo3mgk>
X-ME-Received: <xmr:4PChaWdTET4SMgY7Fn96q5cb-3D2uHdS4l2nsNBKTYt7P_ggbH4zNLPqeXiuPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfmihhrhihl
    ucfuhhhuthhsvghmrghuucdlofgvthgrmddfuceokhgrsheskhgvrhhnvghlrdhorhhgqe
    enucggtffrrghtthgvrhhnpefhudejfedvgeekffefvdekheekkeeuveeftdelheegteel
    gfefveevueekhfdtteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehkihhrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidq
    udeiudduiedvieehhedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgse
    hshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtthhopedvkedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdroh
    hrghdprhgtphhtthhopehmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghp
    thhtohepuggrvhhiugesrhgvughhrghtrdgtohhmpdhrtghpthhtohepfihilhhlhiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhm
    rghilhdrtghomhdprhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:4PChaRZgZnAwpi58ZHawdb4qKlrjpKRC6V7XXsAcelIEKiye7y6Yhw>
    <xmx:4fChaX-X7WJRg904CQZJbtYqA_MlWebh8fOZoMW9hk7EdNhukRDNgA>
    <xmx:4fChadUepdxhwwpMA1572Y0TOfn8qc8d1l5mY5Nj5I9TTNuu1g03eQ>
    <xmx:4fChaYfmwppmk5aKQ8HiqnXf2GjRxuenBMHD3ghASM7TR4WX0SMCzQ>
    <xmx:4fChaaVRlQQyQl5KbWzB3Xuju6bQ3miKkNTSW-EQlpIJpfyJHls2M4hY>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:30:40 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>,
	Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCHv7 06/18] LoongArch/mm: Align vmemmap to maximal folio size
Date: Fri, 27 Feb 2026 19:30:07 +0000
Message-ID: <20260227193030.272078-6-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260202155634.650837-1-kas@kernel.org>
References: <20260202155634.650837-1-kas@kernel.org>
MIME-Version: 1.0
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

From: Kiryl Shutsemau <kas@kernel.org>

The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
struct pages of the head page to be naturally aligned with regard to the
folio size.

Align vmemmap to MAX_FOLIO_VMEMMAP_ALIGN.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 arch/loongarch/include/asm/pgtable.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index c33b3bcb733e..ea6c09eed2e7 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -113,7 +113,8 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 	 min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE * PAGE_SIZE, (1UL << cpu_vabits) / 2) - PMD_SIZE - VMEMMAP_SIZE - KFENCE_AREA_SIZE)
 #endif
 
-#define vmemmap		((struct page *)((VMALLOC_END + PMD_SIZE) & PMD_MASK))
+#define VMEMMAP_ALIGN	max(PMD_SIZE, MAX_FOLIO_VMEMMAP_ALIGN)
+#define vmemmap		((struct page *)(ALIGN(VMALLOC_END, VMEMMAP_ALIGN)))
 #define VMEMMAP_END	((unsigned long)vmemmap + VMEMMAP_SIZE - 1)
 
 #define KFENCE_AREA_START	(VMEMMAP_END + 1)
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
