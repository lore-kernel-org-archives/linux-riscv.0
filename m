Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4114EE7DEF5
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 15:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szb6ERxX3rO5XKlbWqkCZ8e+5/VBnT4QDflicVCnJzQ=; b=esQe4OsrcpJmhz
	xppX0iOU1GUPBRpAIzNeM0SXUEAIbjAT0tQJkZhvjaRWZVknDCed+RzIEjhzjC1uCvqBJH52rT5zU
	WbtnM/+Nxw2aJe270pvnZLBSr135NF7Rzc2snjbwdnW6EhO89wuVFEIRDYWy419elpjEBJc2VAVed
	LIelg+v+uC2ilK13VXKKTWn/bwHqRr9A7ZLWFgaicgTQNBbSb1oYgVwjYA38ik5suxSUHLUycmPDj
	q21gpAno0sxOsREwucs+mxg+km3/t3nwMLQTGfeRXcg9sWvaAHXBGz+NTm36T+SaDq2oOtf4ix7yb
	ZEymbIUTwbWuxhxM/U0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwKC-00000005F0G-1FSO;
	Mon, 02 Feb 2026 15:58:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwKA-00000005EyA-2FEI
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Feb 2026 15:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KVwuFng2nZHrYqkmebOjdjYfKKmOgHaN5oXs2k81MRY=; b=AjLi7La58a5pgoStnMbJXbgre2
	/fWLvdsMWMF8PjebsYmIFOIoUfr+n37QrY1tXcBwI2iGAUSSi7EbkpXQm5sea7hy/DYvO1eJ2kRCE
	voF6m3Go51hqCvcqU0xVXNGzy7ZxwLgqqttV4b9Br8OBL3Ty9MKMDqBIL4hj3Jy9ih1Vn0C2k21P/
	0yZ0HbbjgZztO+fjMLVnQ+RPA3rRp9Jk3xc/tc1n0jzGKpChuIbM56kvRMhUhWIeEJCrrIsvETf5U
	Nhu04Fzf8IMfBTUgkeddATolR6/2Sio0+6aYqGUVyKm2gXKBSWZq72DaRFkEoDGvseaJUlHhLzVSw
	voKXB6Cg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwK7-0000000Em9T-1Kao
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 15:58:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DFA4433EF;
	Mon,  2 Feb 2026 15:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E885C19425;
	Mon,  2 Feb 2026 15:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047925;
	bh=hHQLWMhahxCY/meKke54BXwjoj9QXEZAW+ce8KhMydU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ENafFWTKJrbQqnV2VDvdoxkMl8FgcSSNW4aI3Cvub+S8COIhFCL/xMwClSAk4g0/V
	 mwW9MJu7DPPLym80fXqWmDIIm1HD8ZbCe9bpyliWCGKiJG1snx3D0tMVJdWS1S4Mlc
	 daXRW2AgYFJh6hL3RgQgosfH7gI852pQPBm2YhJApY3C/+ABJ0tw9P8izRje+v+5Fp
	 JGguv1GoteQ/9qpjF3o+tFhwwmfQ0FcRAUa2+u0BUecRxtIYIZl1NVx3dSnOtl7pjR
	 Czx4A83zrUcsA66ZsfE6td9heui0F43l+/NXKoT0P8RNOkZtERLpGr4M5GkvGjLHXL
	 seBC6OdyjBipg==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 66437F40069;
	Mon,  2 Feb 2026 10:58:44 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 02 Feb 2026 10:58:44 -0500
X-ME-Sender: <xms:tMmAaT6K18Wvd0HKkaGoE4t1MKUHqKOWniKK8Slh0t0mZVSEigY1Ig>
    <xme:tMmAaSGa0mdtPyBuNth8XS5WbywiUOE954wqqOjbFveO6Fvoi-08_rQSoxGYwJk5m
    vKnhF9tlwM6cJ2z845M71_O3s263TMrXnhJeSLceZxT7LlvFqK04mB5>
X-ME-Received: <xmr:tMmAaUknPx1N-S0kFLlVg1ElOKs4Zx8dgAQ7u5mGO9mT7KqaIEdJD84TMHSW6Q>
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
X-ME-Proxy: <xmx:tMmAaVCjnvOi37sjHrH5c2YoK5qniyc88D6-zATSoj-K260C6NAz1A>
    <xmx:tMmAaTFTwBN4w2sY2x9XHsmuLbNm77XhH562heWrOazwBYQNMv7o5w>
    <xmx:tMmAaZ_1GN-puOj1MakR2gQ_GcZ8roej8ffqPxtHQcjAswIwy94giw>
    <xmx:tMmAaYnWRueQ_UyYgaOP70c45ePncAFrZZlTzvg6i4J6oDGNdMrunA>
    <xmx:tMmAaX9OPCBnH-pK8V3B8suUm7HtyXnXY7qSHuhx3EvW4oizJzdXFCOm>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 10:58:42 -0500 (EST)
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
Subject: [PATCHv6 15/17] mm: Remove the branch from compound_head()
Date: Mon,  2 Feb 2026 15:56:31 +0000
Message-ID: <20260202155634.650837-16-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260202155634.650837-1-kas@kernel.org>
References: <20260202155634.650837-1-kas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_155847_753579_19B4C785 
X-CRM114-Status: GOOD (  13.87  )
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

The compound_head() function is a hot path. For example, the zap path
calls it for every leaf page table entry.

Rewrite the helper function in a branchless manner to eliminate the risk
of CPU branch misprediction.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/page-flags.h | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 1aaa604f4b9b..16384cb6f962 100644
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
 	 * If compoun_info_has_mask() is true the rest of the info encodes
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
