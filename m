Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362E6FD530A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 19:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nC2pzUXuyqDXxxRO2RW9Zz+EYOhfvG2mceyTyeHihEc=; b=1qixkn7S8cDEJt
	ZStO2iGGv7fPY4LtOYtiWlxBB43Nu6KwkeXp50r8LI7g8Loqj+Fbv20/mZCq1WtgA/OdRJmgaAUcU
	6seKZKa8gTD++//V3KUEOLOQvWBLJi+PwwOeCFqy7V26o0uVoRLOF1A7AxP4m8EcyRGFhz9Aokup3
	+AoBm/1yvO/bPMZlVyADiTwo2n+57Sj5GI2/p+3nSCTCFNTWVmjLOxzolQQbeU5wWPV6iVQqVIkQ2
	ltVAhgXMlsl+o8fCVLECpaLEOGyR+g3HyzciNp5dZjpflKSVzlI6HqeiWHNzvrK/+WxJM2HAzcg5K
	1nNhVf+RYhCAlGaHyUMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3Xo-00000008zta-3Tmb;
	Fri, 27 Feb 2026 19:30:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3Xn-00000008ztP-2jLv
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 19:30:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 890136013F;
	Fri, 27 Feb 2026 19:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C2AC4AF09;
	Fri, 27 Feb 2026 19:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772220634;
	bh=Y1gOIVTqDUoFIuPraJvRHSm3XRXvUUXuo2VeFUmVaTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GfTopM/FhZ5VP9VNdyT2qNcb1FactWxr+NX8w/TMapj8UkWMzPTsh68rC1Wk9kC5j
	 d63Zk+r5cHGa31JMvay8jYszIcnzvWzHo0e9TMTWgAeOOugetfWm4teEeepImg3pni
	 tB0rfJsQZicMlrSb7VZMNXRfMI+LQXuoC6P17nQU0RhsTRwmJuGuq4jZbgqEhXAbQw
	 AKEmsX9g0YcU9DL5VLDzVfJnm/8isQVnP5knrLC8SWaTXB4WG9s7VTesJjNA4sBFFr
	 q4YY+m/i4FuPUMWw+d7uJGxbdKuJL6OyKqz7FR62QmGSEF/Ji4SWbDc/bawQuy1Bk+
	 3lp9G15LOI1YQ==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id AF351F40068;
	Fri, 27 Feb 2026 14:30:32 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 27 Feb 2026 14:30:32 -0500
X-ME-Sender: <xms:2PChaU2h8_5QEA7jdUgzFYTChomOT4Lzughlj5JsPxn5p2Chfjtf4w>
    <xme:2PChafO7qldM6m4VbF5Uiy-w7xVBXWNJGPxIy-j0A8ZA95XQGT5-L5kiXKsXeOLyu
    JB_4Xxfw_lIlP3F4uVsoGKY0bbsmruswyGDI7DriBRu50X3-i2cmAzK>
X-ME-Received: <xmr:2PChaau2aLEQvFwHljJ0DzebfpjGrgYh4t-0yx4YbS1SKKHGvrlFXzdGgu5gow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfmihhrhihl
    ucfuhhhuthhsvghmrghuucdlofgvthgrmddfuceokhgrsheskhgvrhhnvghlrdhorhhgqe
    enucggtffrrghtthgvrhhnpefhudejfedvgeekffefvdekheekkeeuveeftdelheegteel
    gfefveevueekhfdtteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehkihhrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidq
    udeiudduiedvieehhedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgse
    hshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtthhopedvledpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdroh
    hrghdprhgtphhtthhopehmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghp
    thhtohepuggrvhhiugesrhgvughhrghtrdgtohhmpdhrtghpthhtohepfihilhhlhiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhm
    rghilhdrtghomhdprhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:2PChaSGoTOEn_ukMBqSi1-nbJ0kUxOOtYuTxZx9KvhKghro_Crjx1A>
    <xmx:2PChaVTqNsNAK_0fOc4z6SlbHsZaA7WoyaUJXdyhlyud77tvIHNTkw>
    <xmx:2PChaWgx3wGNTOEwaoM-8cCQ2FVNRdNkalgw7lCYfIZEfMPI7-vxaQ>
    <xmx:2PChaZafvfFp9mFJKcqhnz1-FKhysjuHp0b-783uN0FtouwTkxIdyg>
    <xmx:2PChaXW4-Ha1ka29tijT4W3s1xNhV3OqgkB0fBUAScKPiUk91Eq33gx0>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:30:31 -0500 (EST)
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
	Kiryl Shutsemau <kas@kernel.org>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>
Subject: [PATCHv7 01/18] mm: Move MAX_FOLIO_ORDER definition to mmzone.h
Date: Fri, 27 Feb 2026 19:30:02 +0000
Message-ID: <20260227193030.272078-1-kas@kernel.org>
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

Move MAX_FOLIO_ORDER definition from mm.h to mmzone.h.

This is preparation for adding the vmemmap_tails array to struct
zone, which requires MAX_FOLIO_ORDER to be available in mmzone.h.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Acked-by: Zi Yan <ziy@nvidia.com>
Acked-by: Muchun Song <muchun.song@linux.dev>
Acked-by: Usama Arif <usamaarif642@gmail.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/mm.h     | 31 -------------------------------
 include/linux/mmzone.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5be3d8a8f806..7f4dbbb9d783 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -27,7 +27,6 @@
 #include <linux/page-flags.h>
 #include <linux/page_ref.h>
 #include <linux/overflow.h>
-#include <linux/sizes.h>
 #include <linux/sched.h>
 #include <linux/pgtable.h>
 #include <linux/kasan.h>
@@ -2479,36 +2478,6 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
 	return folio_large_nr_pages(folio);
 }
 
-#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
-/*
- * We don't expect any folios that exceed buddy sizes (and consequently
- * memory sections).
- */
-#define MAX_FOLIO_ORDER		MAX_PAGE_ORDER
-#elif defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
-/*
- * Only pages within a single memory section are guaranteed to be
- * contiguous. By limiting folios to a single memory section, all folio
- * pages are guaranteed to be contiguous.
- */
-#define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
-#elif defined(CONFIG_HUGETLB_PAGE)
-/*
- * There is no real limit on the folio size. We limit them to the maximum we
- * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
- * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
- */
-#define MAX_FOLIO_ORDER		get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
-#else
-/*
- * Without hugetlb, gigantic folios that are bigger than a single PUD are
- * currently impossible.
- */
-#define MAX_FOLIO_ORDER		PUD_ORDER
-#endif
-
-#define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
-
 /*
  * compound_nr() returns the number of pages in this potentially compound
  * page.  compound_nr() can be called on a tail page, and is defined to
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 3e51190a55e4..be8ce40b5638 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -23,6 +23,7 @@
 #include <linux/page-flags.h>
 #include <linux/local_lock.h>
 #include <linux/zswap.h>
+#include <linux/sizes.h>
 #include <asm/page.h>
 
 /* Free memory management - zoned buddy allocator.  */
@@ -61,6 +62,36 @@
  */
 #define PAGE_ALLOC_COSTLY_ORDER 3
 
+#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
+/*
+ * We don't expect any folios that exceed buddy sizes (and consequently
+ * memory sections).
+ */
+#define MAX_FOLIO_ORDER		MAX_PAGE_ORDER
+#elif defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
+/*
+ * Only pages within a single memory section are guaranteed to be
+ * contiguous. By limiting folios to a single memory section, all folio
+ * pages are guaranteed to be contiguous.
+ */
+#define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
+#elif defined(CONFIG_HUGETLB_PAGE)
+/*
+ * There is no real limit on the folio size. We limit them to the maximum we
+ * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
+ * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
+ */
+#define MAX_FOLIO_ORDER		get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
+#else
+/*
+ * Without hugetlb, gigantic folios that are bigger than a single PUD are
+ * currently impossible.
+ */
+#define MAX_FOLIO_ORDER		PUD_ORDER
+#endif
+
+#define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
+
 enum migratetype {
 	MIGRATE_UNMOVABLE,
 	MIGRATE_MOVABLE,
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
