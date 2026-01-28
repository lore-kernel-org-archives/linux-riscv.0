Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A640D2F009
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 13:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlsZnuo3WOtVeGqiWRJccRGMyn6ymT4t8h6Ij8tr4cE=; b=DAq5YhzQESqZkp
	nJ//CWmFw4EkZB8TukHXVMUfePza+Nu1VO9ulIroFRzrbiwdC70DEBgriaxeHppnZxB3D5jXwbC03
	P6VxD+7IDO6AfYfW6cIY5HIYPE2MU/2/LTVTEzVRYCyev7X/HcZedepbL7d/D5Ri8ZJmSMUknudIu
	i/vCOhcH1OWZzle3QZgdXDsCg1HoQd5VtK/Bqw8TU0fbW0i+2eqwuatZXujCDEyv8Kvm5gW7iy1oM
	CAKGCGir2tST/VZ+nFN1fhbMQVxqec4PYeTVrUWymwol3HhLrQKbFsyvdcMMC0EUmwW1C9HgikZLv
	FZDcSbub0J28rixUWsuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl635-0000000G7mO-1c8A;
	Wed, 28 Jan 2026 13:57:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl634-0000000G7l4-0dtZ
	for linux-riscv@bombadil.infradead.org;
	Wed, 28 Jan 2026 13:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=n2pnQO0FL3JmnvperC8nJTusQu+LDYD5aKc2nDrZEuU=; b=n/DUyrqElQ2a9Oo9nt7ar1E5Kr
	Vkjk8loNtVRKyvWcJ7nigcFQmLZ35UI3IoZp/ZglTzceCORp0NCkiH9eDF2yRM9URKp2S6q4pwy5x
	2v6Yv9HK+fgHMq+7kBeddtFl0s5dZdpPMa9Er7B1NmVdfy1ABZ+f7WCb8qi29LC/cV/wYaFHFngTk
	YgUeRO7Jtn1RhluTSKfsArG/Iyoz2sEbj57l91AvBovqoUbtF9Yu/RdRexz+J8xOeY9gzkNAKHpIW
	9i24uYqQu6Ic5CS5JdwpSSz7yNSZOaElsXzeHoc59lMikyH0o/GiYNhFdGcPton8jwWQVX4xWYhOn
	CVvxr4Vg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl630-00000008eUu-35ql
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 13:57:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F8A241959;
	Wed, 28 Jan 2026 13:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B259C4CEF1;
	Wed, 28 Jan 2026 13:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769608649;
	bh=R91tSPgHS8R3tSxlyTHy32NvxCdn2aqL9vpLNdIzhxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hA1vG5Tz6vOVAQiU0YsGs+1zGfO17BHvJRxameN2GBjn9V92QPbeegKchTpfhn1wC
	 Rf/lIoX5DrS8lm7/aAYd1+fTblvcPwJVOb7SFqsX7UQ09dLICjbFfveEGh7QQ388pN
	 iZus3O9W8W1MxsTDGmpmJCzaVtENyyLlsg9HKDZjqCYu4gboBsvGiNJUFmgdZP4C5/
	 kAqzRtLpe/PLkDqyxLZJ4UZ4+5eh9Uh2z6qvS/ip3G11UQ3+95QNFa/4u2F6wqqfge
	 GNlwDAjZgRMyOfLRHdCjOkeMvUhhJZTaD8SbeSzDY2EEI8HRG6V3GWx9BwWEjfQI5o
	 FyMbIf3TLKELQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 52CD3F40068;
	Wed, 28 Jan 2026 08:57:27 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 28 Jan 2026 08:57:27 -0500
X-ME-Sender: <xms:xxV6abXja8uVpWVH8OPOn0bReKc4sZFVsrpuoX6H0zMzRmSKTuYgVQ>
    <xme:xxV6acybEbyYlxjxYdDgTfhcijwH_NNskGsGOZL6We2-zsu6mWiBLLiRK8kpcSQFo
    np91_264AOcPAJXsufw5uQUsGu0UUYO1Y01oUv6EprH6UZ3Oio7bgQ>
X-ME-Received: <xmr:xxV6aRh_NmufiJL65oK1gGKIwXbKAD3IbTDDdMqt87_Hr8eQA-ZLPutaB42evw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieefheehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:xxV6aXMAp9NMowzB4AXQTB_2v0ux-svSrTKQXS7ZDjpGcos7ugSkeQ>
    <xmx:xxV6aRhtQTFsqhlRbGI08wv7MUaROZDojecGBB8QxgS9HLHZgWy-iQ>
    <xmx:xxV6afqGSp8mgCnWnp--rEgjKV2lViniL8HYVojnEP68AtsvSRaGIw>
    <xmx:xxV6aUh83S4nqs2ZuXUz5Q7CYJoc_KPMZBxJkdkIqWs3OnASe6wEtw>
    <xmx:xxV6adJ6XmKpm6pXNVnSYhSUzjUz0ZvVBtmSflrUQUwi_77g1YyGLy9E>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 08:57:25 -0500 (EST)
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
Subject: [PATCHv5 17/17] mm/slab: Use compound_head() in page_slab()
Date: Wed, 28 Jan 2026 13:54:58 +0000
Message-ID: <20260128135500.22121-18-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260128135500.22121-1-kas@kernel.org>
References: <20260128135500.22121-1-kas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_135731_180006_D023AA7D 
X-CRM114-Status: GOOD (  11.40  )
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

page_slab() contained an open-coded implementation of compound_head().

Replace the duplicated code with a direct call to compound_head().

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>

---

I am not sure if this open-coded version is intentional and required for
memdesc transition. Drop the patch if it is.
---
 mm/slab.h | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/mm/slab.h b/mm/slab.h
index f68c3ac8126f..970a13ac5b8e 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -137,19 +137,7 @@ static_assert(IS_ALIGNED(offsetof(struct slab, freelist), sizeof(struct freelist
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
