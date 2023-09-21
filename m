Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9F4E71094
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 16:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVnWfb0veYgLCywlGsSGwVSryoYIZGqgR8OwCYxy3j0=; b=HPXXDvGpAapQrD
	Bo3hae/LBpZ3YECSaHF3kJxjUmjkxK76BYrJ0BzIRSlh0LCgbE6yVncmEOk6mQaQ2hNyPcnEVx9XW
	RWu0YpJgZq63TV5iz3299SY5m/LoUtTJNPygQAhotO0ops7KJrdoJVOygTH5VnaDuC7wHlcQrLVKj
	pal7q8j4tjlQ9bxvkku08o1R96lnuuOCzjvuaWzJlSbM9Y/zelZLpK0x4c3QaPM09GFFU6rWK0+18
	e+2ZZEG5DABgjCTAWMcGOM4/Ze0nW0MZcg9XZt6t+y0qoty7uCIxaZ/urvnlu4vhEna9sXWyjfbG/
	dg7l+r6nnTfcoClRHjZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjMQB-006UjM-05;
	Thu, 21 Sep 2023 16:20:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjMPz-006UgA-1k;
	Thu, 21 Sep 2023 16:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qHCXosr3PvEhIv4wRyQYcPxGRzmyaFYWZMq7sEiKto0=; b=qL/dWMroN1yHW3xsDU7ooB0weE
	JrVd8ozRQS9imZwSmT5Kfgv1vMLKs/a76FHzmcNfEzQROL7mxFn/fLTfeIFUcHSJmpA3qAC5RB9Cr
	sNd8jbGBntSsLE1MPqRTD2PMAIzv8wiO8X7M1/tY/ayx0+/GdgoDeI9D8R7uWPfTwB1eRV+TaRK7W
	GfgKMY9xLGUve+by678cyjBeJ0itP6chSXZntP6e+bRka5/VoifboQUMVjkgfwnpVKFzvs4eWwQb8
	Z+FDvCeMAsyGilDz3FQH7lwPEpAo+1vwsFOajNCUzuRIv7HLowf7ej8lpeFD9cdMGeQfeD3kVbykA
	QVGtIEmw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjMPu-00FUej-0c;
	Thu, 21 Sep 2023 16:20:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE7B51758;
	Thu, 21 Sep 2023 09:21:14 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82D213F59C;
	Thu, 21 Sep 2023 09:20:33 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Peter Xu <peterx@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: [PATCH v1 3/8] riscv: hugetlb: Convert set_huge_pte_at() to take vma
Date: Thu, 21 Sep 2023 17:20:02 +0100
Message-Id: <20230921162007.1630149-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921162007.1630149-1-ryan.roberts@arm.com>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_172039_875007_679913F7 
X-CRM114-Status: GOOD (  12.41  )
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

In order to fix a bug, arm64 needs access to the vma inside it's
implementation of set_huge_pte_at(). Provide for this by converting the
mm parameter to be a vma. Any implementations that require the mm can
access it via vma->vm_mm.

This commit makes the required riscv modifications. Separate commits
update the other arches and core code, before the actual bug is fixed in
arm64.

No behavioral changes intended.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/riscv/include/asm/hugetlb.h | 2 +-
 arch/riscv/mm/hugetlbpage.c      | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 34e24f078cc1..be1ac8582bc2 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -17,7 +17,7 @@ void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 		    pte_t *ptep, unsigned long sz);
 
 #define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
-void set_huge_pte_at(struct mm_struct *mm,
+void set_huge_pte_at(struct vm_area_struct *vma,
 		     unsigned long addr, pte_t *ptep, pte_t pte);
 
 #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 96225a8533ad..7cdbf0960772 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -177,11 +177,12 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-void set_huge_pte_at(struct mm_struct *mm,
+void set_huge_pte_at(struct vm_area_struct *vma,
 		     unsigned long addr,
 		     pte_t *ptep,
 		     pte_t pte)
 {
+	struct mm_struct *mm = vma->vm_mm;
 	int i, pte_num;
 
 	if (!pte_napot(pte)) {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
