Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65581099B3B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 22:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTwKecINKVJIkMVTmQutjqSx2fBnrUjbRojAHtBVojg=; b=pdi/h0hfH3J7uN
	c/7UnykGjdq70nfskwl9xKNkoiZj+YmHTBEGkOCFTXei8v0MtqRK/B6Jleg/d4NROgwrWiXoZuNXX
	2+9QN13l7GV0G6+ueplh5vuVpnPnjgxBE1JaRXicZUzf1YAPSD8bN+nFD1yQUhEk1fC5hOgI3U8yO
	ocA/qBr/nM5Wuv9Sf3CP114Mg5ARix23GK1BhuOqXhrnlHqNUP9Xiwjgom4tM6t5yqPwG3wHfAico
	QQB0o62PmJOw9KcjVs8CV34QaM81wo8ToH5v8YFtvPWWf0pijEc+U5zDUP0kW6UD/fehZgG8hjloV
	RKLVCpVUYX0H1dVmxlLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6S-0000000DfN7-0OAJ;
	Fri, 20 Mar 2026 22:14:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6Q-0000000DfMC-1YTX
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 22:13:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0DC0441BF;
	Fri, 20 Mar 2026 22:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E915EC2BC87;
	Fri, 20 Mar 2026 22:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774044836;
	bh=qGQ4S0Dk5OWFFlnh6q01L6aeYnQdqeH7CkkASIBS58U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ax+3vlpIZDyDFxIGzU4ohpjnZ07lb6mXpCmB5SmtxOCikYKHnwhZR+rhhZ3Ots9Bn
	 vHSVkAjBM3wfALykYjhp/MkzWzNvKTEd9sUM3Tw4byVmrY6/sDQ9Ob/KzLPVV38hHy
	 ivcccHnThBm+RNKbO79irp0quB1fH4ydlStXcOe0Wg8BDnojiIJshFcUy5lL2kBMkJ
	 ItQMpEA4sP1pRzpMZBjhJ9DCJmiw+MmjRupYS7CRNoQxTOeMI+PVLfKqkHhVNAvBZe
	 WYFhpaCfdn1jTQT6GaVjgORf7rnYt4myxTj3ldG0Zr25VPkt2/Jzbu6xvGk8fc9FDq
	 WP0dgVm9VXsdA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 20 Mar 2026 23:13:35 +0100
Subject: [PATCH v2 03/15] mm/sparse: remove WARN_ONs from
 (online|offline)_mem_sections()
MIME-Version: 1.0
Message-Id: <20260320-sparsemem_cleanups-v2-3-096addc8800d@kernel.org>
References: <20260320-sparsemem_cleanups-v2-0-096addc8800d@kernel.org>
In-Reply-To: <20260320-sparsemem_cleanups-v2-0-096addc8800d@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Oscar Salvador <osalvador@suse.de>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Sidhartha Kumar <sidhartha.kumar@oracle.com>, linux-mm@kvack.org, 
 linux-cxl@vger.kernel.org, linux-riscv@lists.infradead.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_151358_437042_EC16DC5D 
X-CRM114-Status: GOOD (  10.71  )
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

We do not allow offlining of memory with memory holes, and always
hotplug memory without holes.

Consequently, we cannot end up onlining or offlining memory sections that
have holes (including invalid sections). That's also why these
WARN_ONs never fired.

Let's remove the WARN_ONs along with the TODO regarding double-checking.
Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/sparse.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/mm/sparse.c b/mm/sparse.c
index dfabe554adf8..93252112860e 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -638,13 +638,8 @@ void online_mem_sections(unsigned long start_pfn, unsigned long end_pfn)
 
 	for (pfn = start_pfn; pfn < end_pfn; pfn += PAGES_PER_SECTION) {
 		unsigned long section_nr = pfn_to_section_nr(pfn);
-		struct mem_section *ms;
-
-		/* onlining code should never touch invalid ranges */
-		if (WARN_ON(!valid_section_nr(section_nr)))
-			continue;
+		struct mem_section *ms = __nr_to_section(section_nr);
 
-		ms = __nr_to_section(section_nr);
 		ms->section_mem_map |= SECTION_IS_ONLINE;
 	}
 }
@@ -656,16 +651,8 @@ void offline_mem_sections(unsigned long start_pfn, unsigned long end_pfn)
 
 	for (pfn = start_pfn; pfn < end_pfn; pfn += PAGES_PER_SECTION) {
 		unsigned long section_nr = pfn_to_section_nr(pfn);
-		struct mem_section *ms;
+		struct mem_section *ms = __nr_to_section(section_nr);
 
-		/*
-		 * TODO this needs some double checking. Offlining code makes
-		 * sure to check pfn_valid but those checks might be just bogus
-		 */
-		if (WARN_ON(!valid_section_nr(section_nr)))
-			continue;
-
-		ms = __nr_to_section(section_nr);
 		ms->section_mem_map &= ~SECTION_IS_ONLINE;
 	}
 }

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
