Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330C0FD530A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 19:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZT374lJg36y3F+hVGcDh+AfpnfpV1/MhofMMEpExmLc=; b=JFt7nkEaCScmcx
	VYTAUgfD66PxrCVQZYovbN2myLhNZs/Uaqev0iPWKfXKBXWGJ7SWBW1D+sEzWi7r7b2WHHK0+UMgU
	wyCtSNboSWRMRdTpcLTyZNm2cj0jh1sawCPFa5coXrWshbF6wVPgLv9skKv8JHsMS8VwjNV2ycBBG
	L7YKS6qEl+CE8em+iiBznEpMDtcY9RNv3mFrGEs6aEaqFGiw5S8e2RWneAYEfnqqIioEu6DgmCkPY
	Q2A0h0fXVhmHkG3rMG827NbbID6P2fGGwGD2dPqxBqSJyhUa/4CUv2CnJ3PA5J6kgKzR6d61zy26W
	1ryrsircxJKjwI7qD+hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3Y5-00000009037-05Eu;
	Fri, 27 Feb 2026 19:30:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3Y4-0000000901F-0OnC
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 19:30:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8576360137;
	Fri, 27 Feb 2026 19:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C20C4AF0B;
	Fri, 27 Feb 2026 19:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772220651;
	bh=gud3FwwIClhEmyWoGuFCwJEp0m9beXo/gim58y+k7v0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D2PrcHfHu81LLdvhF2D6BNjZNEN6oX7/vLb3AFtE0rdIBwPRr1cAJcisrxqldZWr4
	 AaskkHQKIklK3uoczNhujVHA8/8Eg8Itne8r8+dEOFSYtGjMiRBo0SCict04Jp2JGg
	 z5PIPpftkSm2PJg92fp3ksmB0ubET+yfph8E+urwz56P+unmkzEAT2dONlGmt9JLEs
	 KlABChkJcOVugXeM5CKPgPGfYiBdXhjTIQETz/7jlhtgu498MVYE5429fTUNVnVGE8
	 zS6sGTdNGYgQml/mRhSUTGro3ssGjwTAUEJcwpa8YFIKnETITxNIUK8aAYVNcXnKcV
	 mAjlfhI5OBg3Q==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id C9154F40068;
	Fri, 27 Feb 2026 14:30:49 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 27 Feb 2026 14:30:49 -0500
X-ME-Sender: <xms:6fChabRUFQq3Ypr_PkCHaCbpZdRSKDiOWq8pszP4RvCyE5QxGfLLCw>
    <xme:6fChaV_Sz_JSjwhBgjw5BWEK7yiXz_eARxlJ0UyhoU3Kiko-5GBRc7fcR_GSajBz0
    sckZLrV1CuJja23j3X1bwcl8iKQM7__atfoFR4cmlGq0uxcvQIo_eBJ>
X-ME-Received: <xmr:6fChaa_Nv2g_2U2H1GMo861YVGU189Yy0Jrc8soePIfx7M-WKsHamNTVkcC6SA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeegucetufdoteggodetrf
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
    thhtohepuggrvhhiugesrhgvughhrghtrdgtohhmpdhrtghpthhtohepfihilhhlhiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhm
    rghilhdrtghomhdprhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:6fChab4g7Yje_eHZGXGNW-NZ-ZJGpPNZbUu5T0-OTRpfJwu9ZPHoPw>
    <xmx:6fChaQePRDBqGYrrhloEWgOn861tpvm-jb4BwZWFyN3symrjnjCRfA>
    <xmx:6fChab2zcI6nTV3cIF4uhIBjnrYqtsjnWNphABGtpHe08D3NDZDTYg>
    <xmx:6fChaU-9Gaz9eY2QGG-jf1vq6tXkJ6rp8wOzX23l5pt7XnEzZ7tgaQ>
    <xmx:6fChac105tt_OixP0u-CokecW25fJ7NhpZ18ZMUUm6P8p1zlbwlNmXsq>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:30:49 -0500 (EST)
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
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCHv7 11/18] x86/vdso: Undefine CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP for vdso32
Date: Fri, 27 Feb 2026 19:30:12 +0000
Message-ID: <20260227193030.272078-11-kas@kernel.org>
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

The 32-bit VDSO build on x86_64 uses fake_32bit_build.h to undefine
various kernel configuration options that are not suitable for the
VDSO context or may cause build issues when including kernel headers.

Undefine CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP in fake_32bit_build.h to
prepare for change in  HugeTLB Vmemmap Optimization.

Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 arch/x86/entry/vdso/vdso32/fake_32bit_build.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
index db1b15f686e3..bc3e549795c3 100644
--- a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
+++ b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
@@ -11,6 +11,7 @@
 #undef CONFIG_PGTABLE_LEVELS
 #undef CONFIG_ILLEGAL_POINTER_VALUE
 #undef CONFIG_SPARSEMEM_VMEMMAP
+#undef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 #undef CONFIG_NR_CPUS
 #undef CONFIG_PARAVIRT_XXL
 
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
