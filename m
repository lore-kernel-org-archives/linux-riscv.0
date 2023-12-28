Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B57C3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 08:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D822qa3ZLntZgmm5MZyRpDWD7NpC4pyMIAh5i05Ne9Y=; b=cPTnn548idVfuN
	GeLps0Po4HKSkvm3/PUrO4NttAZaShPtkG5Te1SqJUiJyMeu3aX+/BBTSzpbUvQ5GGye5Ad0TMAtI
	7ckJWn5tNs8Vp4LpGy+CViTVxwQb/CznudksULjwiqvu/RF3GrGs4+zdbSBIpyRLv0NkXoapPsydy
	0I94v6JuaBlkBhnYf4IiFjeVn4dqlc95OO8DyV9xCqfZkyPFB930NpyBOXy4Iofy0Na3EiQw1jYV3
	wOI+5nTqZCtYQkZOsz4WlfKJDdi8osSDH/B7b49HLfo/2+2iDJL7n0o32yOqgADMm/0kiQIUftuA0
	DB5M0PKDpzj0UCcCjD3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rImEl-00GReY-02;
	Thu, 28 Dec 2023 08:59:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rImEh-00GRcR-1o;
	Thu, 28 Dec 2023 08:59:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2AAAFB80B87;
	Thu, 28 Dec 2023 08:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CAFC433C8;
	Thu, 28 Dec 2023 08:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703753962;
	bh=qac361aQfUYlqbOE3Dx+WRTyiGe1M4tfZJDFMVM+Hlg=;
	h=From:To:Cc:Subject:Date:From;
	b=qX3ZXIVuIgqjmnWmLCGIeKFAzN5+ULWtyxoREOb6AT0bMQ9Fv9tUR0fPxd8bAQHoU
	 pyRvZh1oPfse8PUJCM7z9M/EPig3JCXg5znojjv37eq8A99ej39yt2FqtXM73KRciy
	 avt6nUxBjQe9F0Fy2qvg/ZyG+AJ4OGJRBIEnwlsS2/+tQpM+f9yXIkxHmtqC4nQIqP
	 vpwoUfR6TqZYM7Gk+VnYRKZBB475H5QW685Li+FYw3NEwltzrVrIbEr2FBzR4qCMyf
	 A5tkjpJLm3yxEUSP4SUB76u3vF72cxxZocQLLoKcdZ3I8w+KuzZlATfEj535SChZ4I
	 O9W6YEYkQ7hDw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] riscv: tlb: avoid tlb flushing on exit & execve
Date: Thu, 28 Dec 2023 16:46:40 +0800
Message-Id: <20231228084642.1765-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_005927_774874_1D337DA9 
X-CRM114-Status: UNSURE (   9.90  )
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

The mmu_gather code sets fullmm=1 when tearing down the entire address
space for an mm_struct on exit or execve. So if the underlying platform
supports ASID, the tlb flushing can be avoided because the ASID
allocator will never re-allocate a dirty ASID.

But currently, the tlb_finish_mmu() sets fullmm, when in fact it wants
to say that the TLB should be fully flushed.

So patch1 takes one of Nadav's patch from [1] to fix fullmm semantics.
Compared with original patch from[1], the differences are:
a. fixes the fullmm semantics in arm64 too
b. bring back the fullmm optimization back on arm64.

patch2 does the optimization on riscv.

Use the performance of Process creation in unixbench on T-HEAD TH1520
platform is improved by about 4%.

Link: https://lore.kernel.org/linux-mm/20210131001132.3368247-2-namit@vmware.com/ [1]

Jisheng Zhang (1):
  riscv: tlb: avoid tlb flushing if fullmm == 1

Nadav Amit (1):
  mm/tlb: fix fullmm semantics

 arch/arm64/include/asm/tlb.h | 5 ++++-
 arch/riscv/include/asm/tlb.h | 9 +++++++++
 include/asm-generic/tlb.h    | 2 +-
 mm/mmu_gather.c              | 2 +-
 4 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
