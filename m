Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979C81039880
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 19:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8ik//seXtJa78xkbsSU8aQDt645DuJnNNOwvpU4Ewc=; b=h9URoRx5TFuU+m
	+m9leTgSXMpbDp5cZWBwv+o3e9jBd5CJAe6vhMrBqIJ2DovxXryGPjhcRNyyDn1vljMSocxcYP5Zg
	8BfbMo+YMJagaFj9fl6aSEZ5HIf22hE6zE2Yi3HMVdAzv/h8trXzqP/Zt1JuPzIH+oiYtKAf9ai0r
	6tywZa0nmxD5nNTW22GQ7PZu1BHyTZVGuuoO9dxNZ9d1TuuZiwdoKG465j553EN/tWJnEBGYVTZGf
	XWQU9NM4fqn1LKM/jzWgFJ9CqHJnA13LFo5DqAwy+iUePX2ecfBOmYDn7JpawGPtLN7Bw20FHRcuS
	st/JwZ02ObiYxOSgQt+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3kK-000000092q9-2wOZ;
	Fri, 27 Feb 2026 19:43:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3kI-000000092mg-3vij
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Feb 2026 19:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=psX1/RN4D7tc0hPQm6iUSxbTVKqJFYhFZ0jsRV8hStY=; b=TSsoTsNl27ZQbkon+iELLlsdRj
	ZXRvcVt8MshEUSPcPMzGS7RRdM3/ai5pSoewiJAoVCg/I5272Seg5LOXE8ORnEIJzUcI/65Qv/OSE
	U+Ia11hQL1SYTnylhDrEdyl5bFmNIJ/00w0yRWUIcHb0anuXO/min5umDbJvw6tAqXHVIqIOa8i0J
	xrX4VwD3JLi9ix9c48+BmttgPlUIB/TzxzEkTL0Zfp4sRJEOocclHOIUs6kXguCZtoC8wGd4yBw3w
	wTHyVEVTe1qhSGIojNafG0Yx9risxPwnTjtVSxKEHVd2D4TSMaU8+lN2Dd1oG9FXrY4FQrBc35onw
	Jfig6Fzw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3kE-0000000Dndr-2MQJ
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 19:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED7A2441FB;
	Fri, 27 Feb 2026 19:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D40C2BCAF;
	Fri, 27 Feb 2026 19:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772221404;
	bh=qL/9y03XAUyVqo5OQVqiOiCFnXGU+LUEF5AtRX0sSeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WsF21CnoBKn/lu9boe37TDd991flEHr2mvygK8jdP/xwI8tdRmQVyjCZER9cJ77bd
	 a+xKo9EPLTjaUm02KQbN48MIsPjUB0Bqbwc0v+DXSO8dcdiUEazkFFCvOQf7XGoD9T
	 qwc5r9YRPYTdMSGLsROHXn4Ya/jVx/CMYC7MR1I2r8h26pOMTbx0dRysIp6ErSeTHp
	 PN9tBPIfquvjX4bVSXx3fiJRgHkZKGpc0qcfEoRNzy9TAxyu7yHtoT4AWqxZRAKRpT
	 0uFnRKPN+6Zl8QErCy47zLpFS5GtwgNb8Pob4rFxCkirfbypkjwvX/q+6qB1hQKlI8
	 HqVy0HE/zUghw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id D98C7F40068;
	Fri, 27 Feb 2026 14:43:22 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 27 Feb 2026 14:43:22 -0500
X-ME-Sender: <xms:2vOhadyXya4yLvxIDvteB3YJYYeoMaYCq9g6E25uN0uh7yKbZoZuBQ>
    <xme:2vOhaegxw06N82H9lXQ43oKiaJudI9bL7m1bafOf5Z23YvIWdZngQwsuSrCcQb1x9
    HQHhsQZMt6JGQVDOBhsS2d-IEC418amrnc2eAhYKLCeS2WDtes8Cl4>
X-ME-Received: <xmr:2vOhaQMD9laGwgWVQMSP9q5ubihdvEbhHlXEE6v4dCIlZNnTSwq-N13i1l6pCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfmihhrhihl
    ucfuhhhuthhsvghmrghuucdlofgvthgrmddfuceokhgrsheskhgvrhhnvghlrdhorhhgqe
    enucggtffrrghtthgvrhhnpefhudejfedvgeekffefvdekheekkeeuveeftdelheegteel
    gfefveevueekhfdtteenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrih
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
X-ME-Proxy: <xmx:2vOhaWjk8lIr33h1293jPn5y6LMc3miT2U3bnD367YgKMKLx7RkndQ>
    <xmx:2vOhaQo0zMbDHINM1yEBg-pnfKaI1Mb2MqjWOK6EjD2ObcuFzGVtIQ>
    <xmx:2vOhaRiMUO1exAmM-IDCvqOhvN83Oj8h2KxUo766kyL0izRu4wwRGg>
    <xmx:2vOhaWIWUc1NsaavpYvwG39l8_Q_GI0r6oI2iHag_LZH2QpiaoDLqg>
    <xmx:2vOhae7x0N6Zdq1yCXZsP0Dh-1T8GeChfX4W3ZJwOmL57Lnp3nY0yskN>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:43:22 -0500 (EST)
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
Subject: [PATCHv7 08/18] mm/sparse: Check memmap alignment for compound_info_has_mask()
Date: Fri, 27 Feb 2026 19:42:46 +0000
Message-ID: <20260227194302.274384-9-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227194302.274384-1-kas@kernel.org>
References: <20260227194302.274384-1-kas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_194326_949645_80AC946C 
X-CRM114-Status: UNSURE (   8.15  )
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

If page->compound_info encodes a mask, it is expected that vmemmap to be
naturally aligned to the maximum folio size.

Add a VM_WARN_ON_ONCE() to check the alignment.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Acked-by: Zi Yan <ziy@nvidia.com>
---
 mm/sparse.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/sparse.c b/mm/sparse.c
index b5b2b6f7041b..dfabe554adf8 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -600,6 +600,11 @@ void __init sparse_init(void)
 	BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
 	memblocks_present();
 
+	if (compound_info_has_mask()) {
+		VM_WARN_ON_ONCE(!IS_ALIGNED((unsigned long) pfn_to_page(0),
+				    MAX_FOLIO_VMEMMAP_ALIGN));
+	}
+
 	pnum_begin = first_present_section_nr();
 	nid_begin = sparse_early_nid(__nr_to_section(pnum_begin));
 
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
