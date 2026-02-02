Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84E0E7DEF7
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmqOq/LNwQhoUX83M9L1MDrgtmmRHfTTMiCFoiq0fJ8=; b=k4HpEMM+kHoO64
	ucagxiLdawRy1u5GDjLfY9Cd+R1f40c7SZOWRH2EMCP+1DpC2jmnHrsJzWp+SzYCAiw7bnZ8lINpy
	j4CZr8WNF/q8BSOCIUN1xqAz7+wBYObl/fp5yTQOjBpMPm2jmeBQEq3SwyNG3jgvGJLsKfUdMaOyb
	q123DYtmy9Uib1ZdV27U1iILEYjpuO18aCwSd8d3P64tUTUMqgOWg2i2VaXcbxVmEsHQUWw1JsVT2
	HZFrle4VQ1y9HO++zCVjYwhs2BRI0cDbgxgjvpNrbCwEiW6T1uPgQIN36Hx06vNL9yu/bSodUBDlK
	tHRrk29oIgupOMFizcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwK7-00000005Ewp-2q7L;
	Mon, 02 Feb 2026 15:58:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwK6-00000005EvF-10fL
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Feb 2026 15:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+orHXb/F/4Jgn+yzNGiUVFTECbgQWYQLdldFXaEZhdI=; b=mvKsgB+CSVFyaPjSnQq1eR9wPh
	xM8ICMbDuaNzV+suvZ5Q6PxKRBc5fnJPiaMAD38MVIKdULbmoCNVr9SwjvAXq0c6jS1WoCJrUTdp4
	q7UlrRViJNvKUBTGUxMzygdgnZjtEBDbPQveye9PZlS5okLvwFlEz+DMvqvEyz5igtrw9A22tB3uo
	D9/GWMjPyEiP/JJzyEYJcllIGQvDrWIFJg/dI0yNq5tcldHbKCU320uZTn3bcv30Sgr0iBRPw9apW
	eK60jy9KN+MxgSknI3YbHMcwXoYvPPs5mJtYfEP6D1DYWpTXvWp5Th3xeRwklmcrBTMA3tDLF9WuI
	psrO7P/w==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwJz-0000000Em6q-2yxF
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 15:58:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56054433EF;
	Mon,  2 Feb 2026 15:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E94C116C6;
	Mon,  2 Feb 2026 15:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047918;
	bh=xBYdRN3sYZ6CyWP7NsrlACbZJA1Cw/lqNiJhnZq7FSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JUuYPjvHnLyfoerZQnpfLmN8zC5Uq4UkgI6PydwFpb+a6+d0kLTWxdeqNId5pCQ4S
	 bjHkWdhttVZ2QyojnL4HX77XPmc+hi8J4ogibnqKEWYLSEgY8cCLxBpCuaqZqzkdQu
	 ONqi06hobi0lrIc6QJaLtaTDCXpiwE8UocnZz5DUIHpR35fuMkWqrcRqpyNiQHuiBo
	 qgPiDUyFBDHPB6eYIPo3ORtKtPhz3Rkdvo3Z9ZJvMqPy1mPbkrQ9uiyGPHJnaUg8ji
	 TJQmZ82s5ONBBPon8GTJ0VkWA/7KzhbqvJdl+iF9Jr/1LJ/ANlDIdnRVleRhle+iNr
	 vzuJ1lpcQtyxQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id AD0C6F40069;
	Mon,  2 Feb 2026 10:58:36 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 02 Feb 2026 10:58:36 -0500
X-ME-Sender: <xms:rMmAaQktccmo5zRUOKfM8qYXSW_Rs-wxgg1SFe7h15zsDGggavwAug>
    <xme:rMmAaZBMoxWm4wLE7JprxWxqzoZbsnkGRt2E5KlQbYd0qc53WIFPk2PCAU1hS7QWT
    6vxfEFCYKBgqFD95iw4om0DGCo0Srf0feZPVqdSYTQP41_lGn62jeg>
X-ME-Received: <xmr:rMmAaYzavl9ROuv6CkdLxcjnWMwqNgJWmkPJ68CDY9k1itnKJESV1ejjEPl-Uw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeektdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    epmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgu
    sehrvgguhhgrthdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:rMmAadco0FpI0FoHfSbz9WDxtIqAgoR5SRUYz1MhB9fi8vU7Jd8MFw>
    <xmx:rMmAaax3Qax-1wdz_e3Zp3-zwt0OTS9Rs3_h0ouojgvViU6rbUC16A>
    <xmx:rMmAaf7_PyCQBGnNbqgj50-cs3qO-RV-5_JVF-VssC8cYdQ7ESYl1w>
    <xmx:rMmAafyay6lY5WEAMUXUUSxW5Nt9vwUjSqOOrgtE0ZLk4thNL8fzVQ>
    <xmx:rMmAaXZFRw-DkCfmrIfAw2Ct358ZDGDgKhhm_osk17roauah1yHnwk1L>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 10:58:34 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
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
Subject: [PATCHv6 14/17] mm/hugetlb: Remove hugetlb_optimize_vmemmap_key static key
Date: Mon,  2 Feb 2026 15:56:30 +0000
Message-ID: <20260202155634.650837-15-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260202155634.650837-1-kas@kernel.org>
References: <20260202155634.650837-1-kas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_155840_704960_B5072326 
X-CRM114-Status: GOOD (  11.39  )
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

The hugetlb_optimize_vmemmap_key static key was used to guard fake head
detection in compound_head() and related functions. It allowed skipping
the fake head checks entirely when HVO was not in use.

With fake heads eliminated and the detection code removed, the static
key serves no purpose. Remove its definition and all increment/decrement
calls.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 include/linux/page-flags.h |  2 --
 mm/hugetlb_vmemmap.c       | 14 ++------------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 5a8f6fab2255..1aaa604f4b9b 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -221,8 +221,6 @@ static __always_inline bool compound_info_has_mask(void)
 	return is_power_of_2(sizeof(struct page));
 }
 
-DECLARE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
-
 static __always_inline unsigned long _compound_head(const struct page *page)
 {
 	unsigned long info = READ_ONCE(page->compound_info);
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 6088fc77865c..bdb68779d7b2 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -385,9 +385,6 @@ static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
 	return vmemmap_remap_range(start, end, &walk);
 }
 
-DEFINE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
-EXPORT_SYMBOL(hugetlb_optimize_vmemmap_key);
-
 static bool vmemmap_optimize_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
 static int __init hugetlb_vmemmap_optimize_param(char *buf)
 {
@@ -419,10 +416,8 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 	 * discarded vmemmap pages must be allocated and remapping.
 	 */
 	ret = vmemmap_remap_alloc(vmemmap_start, vmemmap_end, flags);
-	if (!ret) {
+	if (!ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
-		static_branch_dec(&hugetlb_optimize_vmemmap_key);
-	}
 
 	return ret;
 }
@@ -544,8 +539,6 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	if (!vmemmap_tail)
 		return -ENOMEM;
 
-	static_branch_inc(&hugetlb_optimize_vmemmap_key);
-
 	/*
 	 * Very Subtle
 	 * If VMEMMAP_REMAP_NO_TLB_FLUSH is set, TLB flushing is not performed
@@ -581,10 +574,8 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 				 vmemmap_head, vmemmap_tail,
 				 vmemmap_pages, flags);
 out:
-	if (ret) {
-		static_branch_dec(&hugetlb_optimize_vmemmap_key);
+	if (ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
-	}
 
 	return ret;
 }
@@ -650,7 +641,6 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 			register_page_bootmem_memmap(pfn_to_section_nr(spfn),
 					&folio->page,
 					HUGETLB_VMEMMAP_RESERVE_SIZE);
-			static_branch_inc(&hugetlb_optimize_vmemmap_key);
 			continue;
 		}
 
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
