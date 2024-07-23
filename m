Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F7EC3DA63
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 06:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7KqUZxbi01ygqRJEYZyY8BZllSVYsq/Bniq5lVzC70=; b=aTYAz2uz6Vun5J
	hcFZ39xWG6+KdbILbZvbunnY0ssvWCC2SCCvzGXXTfXYyNJH8YmDTu+mh67X2q13lHIRKQaGWWB9g
	R8tkZM80LRIH+080dGNVhia3v+143MWtghoWfjJVhL5M6AmnfukubnB+myzf2Nb4a/q5T1p78IlKF
	BP7E1gdrFNBJgox3MU7i68pAFGRl0yuQmpcwJmAdyNiKhfiLlNnQOkFArZMg97LtIdpKRwh4fg+X9
	nXJotPzGqIBoMHOd7t3b6NB3AGSOzDHsukAYTV71vmvHwxjlZCUHoLtQSluuDaPEsNUr8khOd7qzR
	bjfJh1UxkJG/2q/qZt4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9Oc-0000000BchF-1VSe;
	Tue, 23 Jul 2024 06:53:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9IC-0000000BYsk-028S;
	Tue, 23 Jul 2024 06:46:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5B0A6CE0E07;
	Tue, 23 Jul 2024 06:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E983C4AF14;
	Tue, 23 Jul 2024 06:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721717193;
	bh=zVDs6WKjT/YvUD2GuaqovEFQsz1PVdi+2wlgjwoVKBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GdtNpb5fUIpXsX9U29NSh04YZWODgndxZxjste8kTAvvVKauwF6UNM6S9Dr3BCKEs
	 yzF3a95E4FDYjaodsPNzYMUIiAFluD4W6BzfRkWMXJaN5mJiDqA0nbhJUlVN8YBreY
	 N8Lfe55rcuYatNFvDLpb1o/ai1cq2a87KFY1vXc2G3PokM+pzDBZiGx1YYc0JvUIwd
	 hD+FxT+d7coc5Nv4te6g48WPgLLOAIBVm7uSHK4G4+cw6nfe/xZpmv2v/wDAZjLxfx
	 maJJGo9Hlb/cksHiz+XhQBIYl3hu/DniwedBxjLUcBhi+OlRUy+RXddlr9a1o66hWz
	 zfdJosOcK+iJA==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	nvdimm@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 22/25] mm: numa_memblks: use memblock_{start,end}_of_DRAM() when sanitizing meminfo
Date: Tue, 23 Jul 2024 09:41:53 +0300
Message-ID: <20240723064156.4009477-23-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240723064156.4009477-1-rppt@kernel.org>
References: <20240723064156.4009477-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_234636_569829_73793B5C 
X-CRM114-Status: GOOD (  11.90  )
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

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

numa_cleanup_meminfo() moves blocks outside system RAM to
numa_reserved_meminfo and it uses 0 and PFN_PHYS(max_pfn) to determine
the memory boundaries.

Replace the memory range boundaries with more portable
memblock_start_of_DRAM() and memblock_end_of_DRAM().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/numa_memblks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
index e97665a5e8ce..e4358ad92233 100644
--- a/mm/numa_memblks.c
+++ b/mm/numa_memblks.c
@@ -212,8 +212,8 @@ int __init numa_add_memblk(int nid, u64 start, u64 end)
  */
 int __init numa_cleanup_meminfo(struct numa_meminfo *mi)
 {
-	const u64 low = 0;
-	const u64 high = PFN_PHYS(max_pfn);
+	const u64 low = memblock_start_of_DRAM();
+	const u64 high = memblock_end_of_DRAM();
 	int i, j, k;
 
 	/* first, trim all entries */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
