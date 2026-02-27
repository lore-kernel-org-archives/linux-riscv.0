Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0673FD8FFD
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 19:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQ6vW45BH3yTBfIqyIWcnSs8Wx+cPCx7q/JF5r80kdw=; b=o1xdeA0NXM1SyW
	Gl78/UuQOt/+/JUnGHcNWKtlYHUyKp+pZfL6NtUqMKyAy3+U+o5c1kuG/quPEK+SD+qkVfsh8JWOb
	dyL/Z/0qpe+Pc+u149rI7NaxWyDMD0KMDrs6aZYuUSV0Ljsk1G9lZ1AhoqlX9YNzKeO2m6dqqGSuQ
	qakP34TWVYEQaT1jNNjy77pn97HEqsse/CRMwUn3S6mkP15aLYmxHZ7hg0UBt30fkvEatou3UImoW
	xYlU8n6Vbgjf/QBbJRkh+yzdjaXbPTbC9KMpNkikMKNUmRUB2O215EJt3IAZqGykRiBVyZr/UZkMI
	chQ25EfGuPSsj8USdHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3kT-0000000933e-2BFv;
	Fri, 27 Feb 2026 19:43:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3kP-000000092wp-2aJa
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 19:43:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 493A444429;
	Fri, 27 Feb 2026 19:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BCFC19421;
	Fri, 27 Feb 2026 19:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772221417;
	bh=c529vercbwstG5TFH+F+kzdVCfYFyALt69KitoOnUEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kA8aKy4Kn143Gq4Amdg/csY+DbnufchyYi4D8R6rED90uBMhWcgFiqNMtIZ+9PI5H
	 IId4Kw0dzSPKMOIOGyXWaPoxS16y90un0Vf22MiL/PxjRznltwkNK0iB6VKbPdAMCl
	 6E7UfYELjwwk1dMx+K2r7Y1kAQV1tJs8gNvXHli62XNWsep6Js1h81GN4hKJoFY+i2
	 6KZn59luBqpNFzHWFx5s2crBWpxJ/syucq4uu/w1trTvxa4MwIFcZzMx1kB1pbmikA
	 NExpLH5gqiYo2E9a9m/03gHrMxrYqcZG8XHcKaX4h91s+USRN8CDBEyhp24feUcUKF
	 NEbVxRWWqkkVA==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8CC92F40068;
	Fri, 27 Feb 2026 14:43:35 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 27 Feb 2026 14:43:35 -0500
X-ME-Sender: <xms:5_OhafekAPt-AIlYFOSJBCUnEbCk8VwCH28zjf1j284W-aqnAfGudg>
    <xme:5_OhaeYw4QguEhBl_mwvB_1OeoNVUzO8DH5vHdMAsBWAZyVrf6OTgPHPnKFpBIg8b
    3OSBv_UCQ6qfOIldpFJ7FMxbKCpam2PwZx23AooL5w6jB2ZDvGvf4k>
X-ME-Received: <xmr:5_OhaSpXhp-jqJVaHB23ObgaEVvqG3HfA1v28vqqcuzRHy4BTtbKH81ue6q6yg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfmihhrhihl
    ucfuhhhuthhsvghmrghuucdlofgvthgrmddfuceokhgrsheskhgvrhhnvghlrdhorhhgqe
    enucggtffrrghtthgvrhhnpefhudejfedvgeekffefvdekheekkeeuveeftdelheegteel
    gfefveevueekhfdtteenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrih
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
X-ME-Proxy: <xmx:5_OhaR0sXqKph5_rw0WuRMyzH5slOQbP7_HOu0RzVuSPrjcjtYIu2A>
    <xmx:5_OhaXrAMXNhRdBv-XJ2UTzY8trTieotBx7KU-tmHo5A9y9nseNW4A>
    <xmx:5_OhabQT4Hf_vRdMH0-qZJfxZQemlC05MvyWyWo647pBJ07JHyvJHg>
    <xmx:5_OhaXqDccoIPKwed1xo-y98V_Nr9hElYCasSjezJIruJ8q_V6r7UA>
    <xmx:5_OhaRx39Jw7lS-g7t_7V_1fLFMMkZlwkHMHOUvdxICj2rPvEBXVbJLA>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:43:35 -0500 (EST)
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
Subject: [PATCHv7 16/18] mm: Remove the branch from compound_head()
Date: Fri, 27 Feb 2026 19:42:54 +0000
Message-ID: <20260227194302.274384-17-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227194302.274384-1-kas@kernel.org>
References: <20260227194302.274384-1-kas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_114337_735248_387B6BDF 
X-CRM114-Status: GOOD (  13.59  )
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

The compound_head() function is a hot path. For example, the zap path
calls it for every leaf page table entry.

Rewrite the helper function in a branchless manner to eliminate the risk
of CPU branch misprediction.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/page-flags.h | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 8716a27ef347..9ef2c3b28e07 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -224,25 +224,32 @@ static __always_inline bool compound_info_has_mask(void)
 static __always_inline unsigned long _compound_head(const struct page *page)
 {
 	unsigned long info = READ_ONCE(page->compound_info);
+	unsigned long mask;
+
+	if (!compound_info_has_mask()) {
+		/* Bit 0 encodes PageTail() */
+		if (info & 1)
+			return info - 1;
 
-	/* Bit 0 encodes PageTail() */
-	if (!(info & 1))
 		return (unsigned long)page;
-
-	/*
-	 * If compound_info_has_mask() is false, the rest of compound_info is
-	 * the pointer to the head page.
-	 */
-	if (!compound_info_has_mask())
-		return info - 1;
+	}
 
 	/*
 	 * If compound_info_has_mask() is true the rest of the info encodes
 	 * the mask that converts the address of the tail page to the head page.
 	 *
 	 * No need to clear bit 0 in the mask as 'page' always has it clear.
+	 *
+	 * Let's do it in a branchless manner.
 	 */
-	return (unsigned long)page & info;
+
+	/* Non-tail: -1UL, Tail: 0 */
+	mask = (info & 1) - 1;
+
+	/* Non-tail: -1UL, Tail: info */
+	mask |= info;
+
+	return (unsigned long)page & mask;
 }
 
 #define compound_head(page)	((typeof(page))_compound_head(page))
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
