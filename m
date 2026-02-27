Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B96FD9E2C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 19:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEO8fU8ew90hhYqyjcwknptHrL1uxDbjzmApVxzNsI0=; b=K5iMU1OC9jr8uL
	3JpSlAByFfC8gzMOcKTey7f4kNAY6pf7XH8U1f7hfb4vucO7XPA/116uOUeOczwT+iLY8/d0Kade5
	hcTYQ+cWTQq5pj4KBkVa6sJITys7nucDEAhNoy6F3p9+cDK2d1KZI8LTR88iK4XlwFRDvody7XqoJ
	FlISC5t60Al6xdjOkHZBYOpmUmC6323CgwLyq3nHeIEdg8OVTyfl1JwnY0TsNqVbIA5eV1sjEBQRF
	9HJe18hCYveKvWKoZjes4GAOLE4+6UKPf5l1ka2XsuGff2rOFHjWnKANR/OdgHGF/nNTWSl7ZOZWM
	lxR8NvcS7A/hFCkwSwjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3kG-000000092ln-1eQk;
	Fri, 27 Feb 2026 19:43:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3kF-000000092kG-2KGK
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Feb 2026 19:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=grL/itXWHHkK/vIJd6j96dBmaq0HO10oPmtPqnoJYhw=; b=ehM4sTg9WF9+uT3xiYXa8P5B1t
	5LwcUf2UGpUlPML0Pibe1AraRxDN1LMTJ+dNVvf9zWY6fsj1HrBnhMVB0Kvqwx2bsO5S8tM27ydr5
	1EWLhTtse13XQJkc/4/aIaRCkCm9eV3fpn0KcefdbmR5Caah1j+bcwiLRejuJQDZ+Uh4UVh2Xi/T2
	a+RrjWg6SVh7zuF/NxTrATTDNVs+oKBs1Ib5fOwtA9wu0TVY69zNkcMHwASKyvTzD5R/TPOTLGsxu
	GxkDRJJgUvIcXwnjQFTrm4K9x4nE//paUBCD9KTeLxG0WXgcYsaKlLH086+rIMBuyVCxSqOOd1TDa
	PIpB1TNg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3kA-0000000DnbS-3I24
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 19:43:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FF7C445A7;
	Fri, 27 Feb 2026 19:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEBEC19423;
	Fri, 27 Feb 2026 19:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772221401;
	bh=dDlhIg1ZurYJ03ybCvzQ/8rd/HYYP+ChnQ3pTqezzmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IZEn3CfYySJZGovC4vlaxPB3NGKdzK4+qhUkwHQsXqtdKtDp1jKJKJk5eWrgLnfPN
	 0IQmtBctXrgxdAKCwcd0vfhBmfFsLhf0bnwz4P6X0OGvMaRVbOAnuES08WK108aBvN
	 7ivHob/OdIeAxsjuAkTZ538lKFXcbm5VQZ5LgMEcJp7QZF84YwjgD1Obmoevivsgnn
	 5cJBYdM6rTM2qZsmZx6aEjs6KxqQp9YS/9TG9agDbVWs0y9wok7oLd4mowRA04Yj40
	 Uod4rqvakpYgr8DG6eSJHU6hAt92Ea6OltOQ3r5YhOuJhQrqx0X3Ifr+mKMjj+VS/R
	 mAjDhOOHiGOEQ==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9FE40F40068;
	Fri, 27 Feb 2026 14:43:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 27 Feb 2026 14:43:19 -0500
X-ME-Sender: <xms:1_OhaRPXUM6uHC6-8JSTmW2LGRPmB3J2vh9PEUOyJ-gO2y7bKfxa6A>
    <xme:1_OhaVOG2DbkytU37ZM3MFun2NppW0vI57Y-oJtduP2SLgjrFD019Qbw6eYOmTHEM
    KZQLs7DNhlL_rWdrxGYeVLmOfU6pQGx_bTIwgMCTYNot9tneUeg7u-C>
X-ME-Received: <xmr:1_OhaZIWh-6Dgf5OGz2a7QMtZ7DP5BxvO8_H5Rpir0oDBMunxxDxSWBS3MKLbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeejucetufdoteggodetrf
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
    thhtohepuggrvhhiugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhm
    rghilhdrtghomhdprhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:1_OhaUuyHj0uktem_Qy4Rv3xLvqDvP0Et7PmVpH6YrtlxG55VEaJ9Q>
    <xmx:1_OhabHPsH1nxKzqwO_9f4pN9emiZR0PmAQtS5SG-Nh46TnpGH1JTA>
    <xmx:1_OhaTPccoA7PJ2IVYn_eQY9CS8RQTMMoVUrJU8xNOEJw_cl8tJBNQ>
    <xmx:1_OhaeFzyYlI2_8HqwvUL95FggnLcWjVMJaqwL9zVzAsspl38sOQ7A>
    <xmx:1_OhaQHbJJWNI6fzoZiRO6KTyVyl8wRCv-YCrxTNmsqZJ1Eo-TgQ8DHT>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:43:19 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
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
Date: Fri, 27 Feb 2026 19:42:44 +0000
Message-ID: <20260227194302.274384-7-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227194302.274384-1-kas@kernel.org>
References: <20260227194302.274384-1-kas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_194323_179861_E7D7FF24 
X-CRM114-Status: UNSURE (   8.29  )
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
