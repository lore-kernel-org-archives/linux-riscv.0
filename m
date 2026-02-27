Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112361039881
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 19:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCgGlOP0msiocxfjhtwSTASRMDmYgjPEkYK7RqwDa2w=; b=LlriSx76CCJLnX
	ydWMzYWkl4T5IS9RSRHJPHka8t/D2oRt1C0TvMht2bhryv8sErrGTEhaH1YzmIQvyW8KQclqP6pLl
	PRakw4FxKRnanLC0VUqt/rxFdMCGB0ALi258LfrlSyaUxOcZqOTzgcg18fTcHU71Pd/wiHo4cttGa
	oNB7Tl9LktGL6QUXN4RGfetw22a/XNHpdgiO6lpPYl/XFGJKNHVAC0upTE3FPWYhUpVvEp6KL1WtP
	9I247zDIik6thdSR2BHjpZ/H3dJOzKUFbtplerWZfrpMvGBkrKGlbDbPoi/A2Q+WhcZBXHi/MfLuC
	0naLJlV5gR0wFxGmY7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3kW-00000009391-36Xl;
	Fri, 27 Feb 2026 19:43:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3kT-0000000933a-3m29
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 19:43:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3691460126;
	Fri, 27 Feb 2026 19:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C300BC4AF09;
	Fri, 27 Feb 2026 19:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772221420;
	bh=ZAx3R9GqRsOU9srbTUp+FvCts3Vk9aVQHLhkmRYHaUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PC0m/CgatqGb61BR32ksOciiVWsh9kabYVfM4sb2/RkMf4uKu8sUINuIQ7YKsorvS
	 X8meq6NX5tAjFYkJAMAc+U2k+i4eTGfCfbcG9qiUSR98uL66OKdBu2ZbkS7YGkr3nr
	 SuVMPjXdhknEHPlp2uncDkaHD6hGh68Q2shP4C4O+bdyrQc93QztUAdoWdQJgpSWLO
	 1u5BiZy+Da2laUwcso8n56StTGi1Kffc9Hdzym29pU9S1xsgQ7VKYCxtwMPHwAGeOM
	 1bE4y5mtV6gJA4o97riwF48Al8mcaiN1rb+cXwo/XjnDN3KOVZmElpaA3kcNbpZ75c
	 /6Ar4HIxZ1vow==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id DF990F40068;
	Fri, 27 Feb 2026 14:43:38 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 27 Feb 2026 14:43:38 -0500
X-ME-Sender: <xms:6vOhaXubggs39m_iHxkE19Eq9hu-qDTewGwNs2J3KvicJ-8TDyBY0A>
    <xme:6vOhaRq_YY0wM3gUjaruqNPflidLhEMMOlSsW87SO-UNQOtFLRMnAncA9UKz6GDf9
    TmJcSe5URH__nx-T8DX7sb2rTQ6V6z4j07ieih5o7LZsT64IKEw-iA>
X-ME-Received: <xmr:6vOhaU6b9bnfnO44Wsvs220hFH-nJgEtidc-Hcsc3LY2D-quMFF2K9Y39TNI8w>
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
X-ME-Proxy: <xmx:6vOhaXGHJuS7PtiXmnSE6B-g_1FNPKMXgA8MRdODV_MXJvFT7JCUDw>
    <xmx:6vOhaT4b_oBjocIw7sF9fc9YXDuSrFTXQQJZEQz1hkGsuV9uuzIXJw>
    <xmx:6vOhaSjRHpYcTP_XbTmXXQX_gvMAqbFdMtZrz1Mk9NHU5Kc7_4CDow>
    <xmx:6vOhad5lTkgJplK5FXgb-XJWPKapPepvuL0R5_dW7i3dk-y58KJUQg>
    <xmx:6vOhabCzlhPSJWpu803PVqtD4DFwGJAsyhQ7UGlxPIkg8I456R9GWqHZ>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:43:38 -0500 (EST)
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
Subject: [PATCHv7 18/18] mm/slab: Use compound_head() in page_slab()
Date: Fri, 27 Feb 2026 19:42:56 +0000
Message-ID: <20260227194302.274384-19-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227194302.274384-1-kas@kernel.org>
References: <20260227194302.274384-1-kas@kernel.org>
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

page_slab() contained an open-coded implementation of compound_head().

Replace the duplicated code with a direct call to compound_head().

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/slab.h | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/mm/slab.h b/mm/slab.h
index 1a1b3758df05..7d3b929019ae 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -131,19 +131,7 @@ static_assert(IS_ALIGNED(offsetof(struct slab, freelist), sizeof(struct freelist
  */
 static inline struct slab *page_slab(const struct page *page)
 {
-	unsigned long info;
-
-	info = READ_ONCE(page->compound_info);
-	if (info & 1) {
-		/* See compound_head() */
-		if (compound_info_has_mask()) {
-			unsigned long p = (unsigned long)page;
-			page = (struct page *)(p & info);
-		} else {
-			page = (struct page *)(info - 1);
-		}
-	}
-
+	page = compound_head(page);
 	if (data_race(page->page_type >> 24) != PGTY_slab)
 		page = NULL;
 
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
