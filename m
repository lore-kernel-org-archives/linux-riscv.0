Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2EDC47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 19:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=34npAimFntkF7OXXHXJCqc6F3JbIGJjUvKLjK/8jj8M=; b=jklgDbG/N43UTa
	OhyqL4zRLSVhIohnlHAL+pDAJTtLKupiD0x0rwRWI5+7GCqyGR2YzNBDkvw61LBLqy6AGMjHnYrQs
	wcLkmkD9m4ik690gRI3ZyNSMQWJC6r3CoQdg1KeoMzDe/l2UfDftbdTvAy185WrRAqfGu2Ol2pfgN
	n1UDhetbiUzVmO58Y644EPkpqIod6Ut43kSWaqbuzawHjaGpp67rsnQUtVe8bO/bD0pXbzqo8tP4c
	L5/o5gTDuNIHrdCLYbothOn9JDYNsVYZTjQQTZ8qJ7yIHoFEHf/KBk7iAQqPf5DTsWvInDyLdaPjM
	kdpAhcczEbHt8Q9t4xUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT5Su-00000001XDg-3ADC;
	Thu, 25 Jan 2024 19:32:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT5Ss-00000001XCP-0zyx
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 19:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706211161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hqBJXd3KYbSqBlyTsnJ+flUsuxWAbzNO3FAUVqkspqs=;
	b=jAVrtWBYCAiI9ueXQujfQMSc4y9xb1Iyx8dwm6JHqL3YYyLuQGs94Yok/iB+vf0oRz8Xym
	MkpOIFFV1FFqufnaLV5YkOiKQAErJiO+6thm142Z4ipzUBtnOIQ2uikJHX1aUI97V3viLv
	4SZMXIL6Xi4e4jsz0aqH0wuGfoTVDec=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-633-3eXNfPC0PWK9Jn6kjBn6xQ-1; Thu,
 25 Jan 2024 14:32:37 -0500
X-MC-Unique: 3eXNfPC0PWK9Jn6kjBn6xQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23E903C1E9D4;
	Thu, 25 Jan 2024 19:32:35 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.193.154])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24466492BC6;
	Thu, 25 Jan 2024 19:32:27 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 00/15] mm/memory: optimize fork() with PTE-mapped THP
Date: Thu, 25 Jan 2024 20:32:12 +0100
Message-ID: <20240125193227.444072-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_113242_413183_10466005 
X-CRM114-Status: GOOD (  18.59  )
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

Now that the rmap overhaul[1] is upstream that provides a clean interface
for rmap batching, let's implement PTE batching during fork when processing
PTE-mapped THPs.

This series is partially based on Ryan's previous work[2] to implement
cont-pte support on arm64, but its a complete rewrite based on [1] to
optimize all architectures independent of any such PTE bits, and to
use the new rmap batching functions that simplify the code and prepare
for further rmap accounting changes.

We collect consecutive PTEs that map consecutive pages of the same large
folio, making sure that the other PTE bits are compatible, and (a) adjust
the refcount only once per batch, (b) call rmap handling functions only
once per batch and (c) perform batch PTE setting/updates.

While this series should be beneficial for adding cont-pte support on
ARM64[2], it's one of the requirements for maintaining a total mapcount[3]
for large folios with minimal added overhead and further changes[4] that
build up on top of the total mapcount.

Independent of all that, this series results in a speedup during fork with
PTE-mapped THP, which is the default with THPs that are smaller than a PMD
(for example, 16KiB to 1024KiB mTHPs for anonymous memory[5]).

On an Intel Xeon Silver 4210R CPU, fork'ing with 1GiB of PTE-mapped folios
of the same size (stddev < 1%) results in the following runtimes
for fork() (shorter is better):

Folio Size | v6.8-rc1 |      New | Change
------------------------------------------
      4KiB | 0.014328 | 0.014035 |   - 2%
     16KiB | 0.014263 | 0.01196  |   -16%
     32KiB | 0.014334 | 0.01094  |   -24%
     64KiB | 0.014046 | 0.010444 |   -26%
    128KiB | 0.014011 | 0.010063 |   -28%
    256KiB | 0.013993 | 0.009938 |   -29%
    512KiB | 0.013983 | 0.00985  |   -30%
   1024KiB | 0.013986 | 0.00982  |   -30%
   2048KiB | 0.014305 | 0.010076 |   -30%

Note that these numbers are even better than the ones from v1 (verified
over multiple reboots), even though there were only minimal code changes.
Well, I removed a pte_mclean() call for anon folios, maybe that also
plays a role. Alternatively, either v1 or v2 is seriously buggy ;)

But my experience is that fork() is extremely sensitive to code size,
inlining, ... so I suspect we'll see on other architectures rather a change
of -20% instead of -30%, and it will be easy to "lose" some of that speedup
in the future by subtle code changes.

Next up is PTE batching when unmapping, that I'll send out next week.

Only tested on x86-64. Compile-tested on most other architectures.

v1 -> v2:
 * "arm64/mm: Make set_ptes() robust when OAs cross 48-bit boundary"
  -> Added patch from Ryan
 * "arm/pgtable: define PFN_PTE_SHIFT"
  -> Removed the arm64 bits
 * "mm/pgtable: make pte_next_pfn() independent of set_ptes()"
 * "arm/mm: use pte_next_pfn() in set_ptes()"
 * "powerpc/mm: use pte_next_pfn() in set_ptes()"
  -> Added to use pte_next_pfn() in some arch set_ptes() implementations
     I tried to make use of pte_next_pfn() also in the others, but it's
     not trivial because the other archs implement set_ptes() in their
     asm/pgtable.h. Future work.
 * "mm/memory: factor out copying the actual PTE in copy_present_pte()"
  -> Move common folio_get() out of if/else
 * "mm/memory: optimize fork() with PTE-mapped THP"
  -> Add doc for wrprotect_ptes
  -> Extend description to mention handling of pinned folios
  -> Move common folio_ref_add() out of if/else
 * "mm/memory: ignore dirty/accessed/soft-dirty bits in folio_pte_batch()"
  -> Be more conservative with dirt/soft-dirty, let the caller specify
     using flags

[1] https://lkml.kernel.org/r/20231220224504.646757-1-david@redhat.com
[2] https://lkml.kernel.org/r/20231218105100.172635-1-ryan.roberts@arm.com
[3] https://lkml.kernel.org/r/20230809083256.699513-1-david@redhat.com
[4] https://lkml.kernel.org/r/20231124132626.235350-1-david@redhat.com
[5] https://lkml.kernel.org/r/20231207161211.2374093-1-ryan.roberts@arm.com

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: sparclinux@vger.kernel.org

David Hildenbrand (14):
  arm/pgtable: define PFN_PTE_SHIFT
  nios2/pgtable: define PFN_PTE_SHIFT
  powerpc/pgtable: define PFN_PTE_SHIFT
  riscv/pgtable: define PFN_PTE_SHIFT
  s390/pgtable: define PFN_PTE_SHIFT
  sparc/pgtable: define PFN_PTE_SHIFT
  mm/pgtable: make pte_next_pfn() independent of set_ptes()
  arm/mm: use pte_next_pfn() in set_ptes()
  powerpc/mm: use pte_next_pfn() in set_ptes()
  mm/memory: factor out copying the actual PTE in copy_present_pte()
  mm/memory: pass PTE to copy_present_pte()
  mm/memory: optimize fork() with PTE-mapped THP
  mm/memory: ignore dirty/accessed/soft-dirty bits in folio_pte_batch()
  mm/memory: ignore writable bit in folio_pte_batch()

Ryan Roberts (1):
  arm64/mm: Make set_ptes() robust when OAs cross 48-bit boundary

 arch/arm/include/asm/pgtable.h      |   2 +
 arch/arm/mm/mmu.c                   |   2 +-
 arch/arm64/include/asm/pgtable.h    |  28 ++--
 arch/nios2/include/asm/pgtable.h    |   2 +
 arch/powerpc/include/asm/pgtable.h  |   2 +
 arch/powerpc/mm/pgtable.c           |   5 +-
 arch/riscv/include/asm/pgtable.h    |   2 +
 arch/s390/include/asm/pgtable.h     |   2 +
 arch/sparc/include/asm/pgtable_64.h |   2 +
 include/linux/pgtable.h             |  33 ++++-
 mm/memory.c                         | 212 ++++++++++++++++++++++------
 11 files changed, 229 insertions(+), 63 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
