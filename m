Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAE4FD7F93
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 19:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8ik//seXtJa78xkbsSU8aQDt645DuJnNNOwvpU4Ewc=; b=ytoITYfxeaAl5S
	Ax8NQRkYwAxJBXXHhRp/tq7Al7OsUUeGZIcdhtyUUeShd1Xjs8sideu7E/5CQHRyhIZvQkSYZu9BE
	ZzOqq7BQhuc3EKQyElpH1ntWgyrGGYY6NtHDkU/mJK8/SLTCnaEBzN0ecjfBuPo8kAoFRKzGb+fDa
	MYXFW5i4IFGttD27opn9BSkczlpaSRPhogeCmA/EMIgNfcJoio3GZcrbqLk1zqvL2zlmIEpgtPW2j
	tLx7TFjw8BauG0GuZdw5Ch8gQdBkz9i6WbGq0Oyt1P0Bi8e/3hVTTdBwmACZ4AfCywWfKniwk8X0n
	cWISnzeLW9KmIsO1miGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3Y1-00000008zzB-08bU;
	Fri, 27 Feb 2026 19:30:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3Xy-00000008zxg-340U
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 19:30:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21E9D61344;
	Fri, 27 Feb 2026 19:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAAEC2BC86;
	Fri, 27 Feb 2026 19:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772220645;
	bh=qL/9y03XAUyVqo5OQVqiOiCFnXGU+LUEF5AtRX0sSeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZsBQD2tzfYu543gNy+ACr4mi/Hv5Dnqoq/PeZts1R4OKNurck7yK4gOrQR/nFQjMm
	 hWBaCghcemVHSnCF/kS7zj2+r59Yv9uGvXh+naJt00XKpnXR0PHc25yH/TaoOXypBz
	 SJt5rzdy3A0FH7awE1RXRyFpP1BbC2zMa6U8j1krzTjTm9sC81a+1S8d/y7uLMjbP9
	 LsjjlJU23KJn+4EvJRgIWsIv0uOoYv0LRexOd3LMi0xgsL528phqKPLF7YwL9i52p/
	 2SkigM4SOXN1uGF1QIf0QSF6Q80eitzQhvVeqdjYATuSWuvIQMLD0aTFNk5VFLp8Bx
	 MOFN3wVcKGG0g==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 730AAF4006A;
	Fri, 27 Feb 2026 14:30:44 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 27 Feb 2026 14:30:44 -0500
X-ME-Sender: <xms:5PChaeHNa8uVhrct1Uccqzjua5E_GWwmn_J752P2PkczmrKtz4tnIw>
    <xme:5PChaYjY-7BOCgcSVKQWUsXepNil9-KkDwWWdS6Bn0BnBWAbxgg4LrnYxoxnMG7MA
    qwF_iErrwHY4jVtptQh6_68gVyRNkqBJsaMUCTQmGzNjTspkUJMcDU>
X-ME-Received: <xmr:5PChaSRD0ypMJx_QyALMeHtwordrV1grw2N1MA7VShVI6akoZKJtEcVy0iCF0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeehucetufdoteggodetrf
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
    thhtohepuggrvhhiugesrhgvughhrghtrdgtohhmpdhrtghpthhtohepfihilhhlhiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhm
    rghilhdrtghomhdprhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:5PChaY9BmWQg0N4t0rzE-4IKm0tjs6EPE_Nj0ERt1N_DiQcfcz7Cvg>
    <xmx:5PChaQROttwJrfc81Bs1Rq957unyIflFHFYtq9M3jwSv4ng3GUoMww>
    <xmx:5PChaXZTsqMmtCvmJ0mwH7ZMzmoqNEDYBRWQ2rSVM6-WfuL8VOzh4Q>
    <xmx:5PChaRT1Fluji9nz_lXyK0nSTBpaEPTqNVl8x7Rxz4FPF1d4KQrdag>
    <xmx:5PChaa4xbh2w2LQwUWkm8sxVKxAiXwicQ1as3hoBcQL3yMwYU6ufDbh9>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:30:43 -0500 (EST)
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
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCHv7 08/18] mm/sparse: Check memmap alignment for compound_info_has_mask()
Date: Fri, 27 Feb 2026 19:30:09 +0000
Message-ID: <20260227193030.272078-8-kas@kernel.org>
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
