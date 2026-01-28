Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067F9D25B7E
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4ulQqxgn3SSFGWgo1fKe+hJPYO4I4bcD3hNyNal0nk=; b=kR5V3DkdljxVNq
	VV0FZmHSWULkR0jjRAoYKoZzlt3phC1SuxRZV/QjTS8120YjIwTH8coodFC5LswPYsGvflCl/PpXn
	6d1t0oQxfqdSiJz2FvmWxVhp8JMLoHYM3/94mE74m0OQo3f8mm6+VIy3L4XgTvCzE6Jo7aUTrulay
	YMwMQzwzpF/ZU9L2EJeReSGtU4QiPvDbBAWE2kPDKp73A+xN7ixVhAW/Eu9qbh6Pg8HiudfIg6/aB
	ythGP6ZaYs6d15zYEsvQjWSNCgXcnHb4xOkCHWqVLK+1sTxmpWx+PPjYb6M/tkldo//a5upDvljnh
	qe00xdkYG2SWu0qAS7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl61H-0000000G6mw-1CBL;
	Wed, 28 Jan 2026 13:55:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl61E-0000000G6ld-2fG9
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 13:55:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A33C8443AC;
	Wed, 28 Jan 2026 13:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA01C4CEF7;
	Wed, 28 Jan 2026 13:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769608539;
	bh=IBF8LKGHv8lxiBFV8UfHPvSAlGIc6Qys2WBMHwwJVg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lwZ+0z+/i5xQoJMB983l91A7Kll5RJy1TYPjokSHydMfqlYRjYa8uT5FKuIk8lmu9
	 9UXLk7z1cmvFGJeU08A2MSYK+rfeCmHBXxuch5ksF8gjdzaaVxM3DHwIC78aZweytY
	 FP+Hac8WyFQeXQM5BCh4vX1FiRCcrgwVgSGyZ+dlaeFKru2NYXvo/BEN/G+oQkosGI
	 KG/FCpf24V30FR316SXjzZjJVtEdsihznqVYmzllaPTn15rYFoh6JAEH+xRi+ECFSz
	 la6ifJHC/P0Id6UiegeCaE99t4L5RTW9EDbZg4Bgfay10RCDGhsPifP9nsKBI8NL3a
	 Bjj8ez8I1r5qQ==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id B4365F40069;
	Wed, 28 Jan 2026 08:55:37 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 28 Jan 2026 08:55:37 -0500
X-ME-Sender: <xms:WRV6aSXv8CSFA6WCH3D4DEChzoz6HoLF_6S_vfGHGygBGxB1euPOqQ>
    <xme:WRV6af3xOruikHOYovDZVSzFskejsJ4AljrJ30hL7Erdwo2dnvk3wp8ywXmwDXjwx
    cgYcbS7OjZdnhnZm-yFAlRB5YE-ViiHFoQ7YbkNErMozp7soDuG>
X-ME-Received: <xmr:WRV6afSp4WVW_ZDTqck30b7ngET2eCpWVySAFUxj-uv5QzLc79KcqKANRJCbyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieefheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
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
X-ME-Proxy: <xmx:WRV6aQV_cUmC4MSZO44zEnu8dMXvBlUNtCwN_qTewd4GuJqDMmTn9Q>
    <xmx:WRV6aeMWWSgXAk6owIEpXJnCsZNO9vUOTgBGkhJ5IgHKnrO34HDFRQ>
    <xmx:WRV6aX0YKFjtUwnU4zz1m5YA5uCXFx0ivqZTJP3OW5OJJ6VhKpPrsQ>
    <xmx:WRV6aWObVvbcyJpgECa9hUTkZvHWXABVIVXMgWj92inmzGaDb-9qOA>
    <xmx:WRV6aVt5lcbOFVXC_cAUMKfZqf66sv_VwYTKn1LVoasd0ELvPTK0GV3u>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 08:55:34 -0500 (EST)
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
Subject: [PATCHv5 04/17] mm: Move set/clear_compound_head() next to compound_head()
Date: Wed, 28 Jan 2026 13:54:45 +0000
Message-ID: <20260128135500.22121-5-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260128135500.22121-1-kas@kernel.org>
References: <20260128135500.22121-1-kas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_055540_720401_1288BD46 
X-CRM114-Status: UNSURE (   9.53  )
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

Move set_compound_head() and clear_compound_head() to be adjacent to the
compound_head() function in page-flags.h.

These functions encode and decode the same compound_info field, so
keeping them together makes it easier to verify their logic is
consistent, especially when the encoding changes.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/page-flags.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index aa46d49e82f7..d14a17ffb55b 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -290,6 +290,18 @@ static __always_inline unsigned long _compound_head(const struct page *page)
 
 #define compound_head(page)	((typeof(page))_compound_head(page))
 
+static __always_inline void set_compound_head(struct page *page,
+					      const struct page *head,
+					      unsigned int order)
+{
+	WRITE_ONCE(page->compound_info, (unsigned long)head + 1);
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
@@ -865,18 +877,6 @@ static inline bool folio_test_large(const struct folio *folio)
 	return folio_test_head(folio);
 }
 
-static __always_inline void set_compound_head(struct page *page,
-					      const struct page *head,
-					      unsigned int order)
-{
-	WRITE_ONCE(page->compound_info, (unsigned long)head + 1);
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
