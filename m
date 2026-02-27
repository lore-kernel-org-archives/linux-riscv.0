Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3021FD8FFD
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 19:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ml2GJYNX3UvhQsfFxf8pEg00gS89t6OyzP2gTQ9FsHY=; b=aCzv9vbHWbI/pY
	DnHX05pPKI4LdNAqXSCcvPT3jBmELSrIFi7o87TilDHNNsBEoTisqV8MqNeJ9vf5DAl4tmlEyDRb4
	CQjUPnmxCoCd63OhLDMcmkPr+ihXstthN4LIllY+BnlZG2V8pOxlD5KQbuOF8gk2MRyOFWsuRGArE
	PKyCIrk+kOYEUe9s5pWxV5HEm0gAkwmm5qylEabhBKoCLiCBvqVAqepfgXTkodZ+6XV93QwL9XhMC
	oCtg/5bQsguVJRfh4dwiUz3xuykx2BXteqJ6FOAI4XfRqXKCxM8TG3wJswr9kNjs7jxT7MC9PXZom
	lG9nzwiXGbxEJR7YLx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3k8-000000092fo-1q5l;
	Fri, 27 Feb 2026 19:43:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3k6-000000092e5-38YS
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 19:43:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 07D9F44581;
	Fri, 27 Feb 2026 19:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25694C19421;
	Fri, 27 Feb 2026 19:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772221397;
	bh=SAMYtAvGiq2l3siqpeP/HjyvgvsrRuVBB1mTlVx3THc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tcY8+B1pcBpmKdlfCS0uOZ512/5KyplcwQlwEN0riGqHbwjNQAx0jMfCuPwb+j7bo
	 QTo7Hn26jsaBCD6x8+xZ3LAkO1InTpbihOC/cpljfElycYpd4ueewY83LtTyrULyhF
	 9Vifg2QibBztU8orJDKm/LDbPjRiW0JDGXR9CADTTGwsi+b3bnNy9+xloQpsq2VNVb
	 1lNLBIhny6cu8Zx0eNxyKG3ykqDSkVFU1KTYiOJVWtmg4Xg7LQcV0d3VC4ikEi6tOM
	 Uv3/BD6OOJdE9kIOm7lAIi5l1pzPT5a/OVOxeLMKCzChMJ1RL0yIYWxctoc1mXy4Jx
	 yVj1KvyY/leoA==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 509F8F40068;
	Fri, 27 Feb 2026 14:43:16 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 27 Feb 2026 14:43:16 -0500
X-ME-Sender: <xms:1POhaTPYYIx41emnSltkSPqXLs7Hw07GkH2erO2UVreMOcH7aRHXNQ>
    <xme:1POhaXLpLqC3CgEIU3xtszaBhGEElS7OpjSlH1TW8K67YmRAAYihChJIThB26_OZD
    ghRVBh0nz2xziQRiabzH7hwp5sJSk1yvDsYP1IEgYQTv0FZpoNYRjA>
X-ME-Received: <xmr:1POhacaye2j0k2NKv4CmZ5wSqYbQ02TxqLESpFRdQFKAPO59yh6ikDXxZP1KVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfmihhrhihl
    ucfuhhhuthhsvghmrghuucdlofgvthgrmddfuceokhgrsheskhgvrhhnvghlrdhorhhgqe
    enucggtffrrghtthgvrhhnpefhudejfedvgeekffefvdekheekkeeuveeftdelheegteel
    gfefveevueekhfdtteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrih
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
X-ME-Proxy: <xmx:1POhaYlV9F7FZhkhPP5UR7LfiXU6yPyJrPGzwTL6WRDORp1W2i3PAg>
    <xmx:1POhaXZr6H8m-b0joZT-p1OXlbwkGQzpcQX-LIjAPoH-NN7_Jkf5IA>
    <xmx:1POhaQBJlSdzCZ0oSCNa2A_5TTgq1iBBuH7YThh5LrfhqqRLl3vkBA>
    <xmx:1POhadZ8i3JjbDQAlPlYfQHZOXHq8w7pPx_dv5VK1_lw6zxR2VRcIQ>
    <xmx:1POhaUhL3C6uixSlUoBGYAj6w1gryeKqIB1jiI6nvwKAdmF3xLrwUeIM>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:43:15 -0500 (EST)
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
Subject: [PATCHv7 04/18] mm: Move set/clear_compound_head() next to compound_head()
Date: Fri, 27 Feb 2026 19:42:42 +0000
Message-ID: <20260227194302.274384-5-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227194302.274384-1-kas@kernel.org>
References: <20260227194302.274384-1-kas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_114318_826916_BA05D5F8 
X-CRM114-Status: UNSURE (   9.93  )
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

Move set_compound_head() and clear_compound_head() to be adjacent to the
compound_head() function in page-flags.h.

These functions encode and decode the same compound_info field, so
keeping them together makes it easier to verify their logic is
consistent, especially when the encoding changes.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Acked-by: David Hildenbrand (arm) <david@kernel.org>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/page-flags.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 70c4e43f2d9a..42bf8ed02a29 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -290,6 +290,17 @@ static __always_inline unsigned long _compound_head(const struct page *page)
 
 #define compound_head(page)	((typeof(page))_compound_head(page))
 
+static __always_inline void set_compound_head(struct page *tail,
+		const struct page *head, unsigned int order)
+{
+	WRITE_ONCE(tail->compound_info, (unsigned long)head + 1);
+}
+
+static __always_inline void clear_compound_head(struct page *page)
+{
+	WRITE_ONCE(page->compound_info, 0);
+}
+
 /**
  * page_folio - Converts from page to folio.
  * @p: The page.
@@ -865,17 +876,6 @@ static inline bool folio_test_large(const struct folio *folio)
 	return folio_test_head(folio);
 }
 
-static __always_inline void set_compound_head(struct page *tail,
-		const struct page *head, unsigned int order)
-{
-	WRITE_ONCE(tail->compound_info, (unsigned long)head + 1);
-}
-
-static __always_inline void clear_compound_head(struct page *page)
-{
-	WRITE_ONCE(page->compound_info, 0);
-}
-
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static inline void ClearPageCompound(struct page *page)
 {
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
