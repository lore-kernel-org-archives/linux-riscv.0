Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490C8C35FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 06:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jxxWcSP6QLM9/2HKpoBqMydpY3mT1ka0zMJ+uiSR2a8=; b=ijpODM9wBKBWpu
	69dQz2n4tT3svxlihd6Qkbb2xijbmaFgKuQnvsYQK5eavhGAKdUlVbPgQwnHYUxt/HVZL7VGz03qE
	dHLU9RVTfEnwElNi0JzL6tOiYtgRM0ZfwJCJVqyGhM9mUhZ0he110nJmEQEgQWOUecVujy+fjHnPa
	GbIJSR1hQaNJ73KG1EveUzM+HDl2f4Pi1o9n4zjmRk6VobIQtQyZDjRRnjm2oCgX+oPNzHJPpthrL
	YcQDDRmM+v8clMLiy540ReDsIgqQIjXSp3FU4WkttJI507mT8fUcbM37Xf2sdUU5vZH+2DusaFLHe
	6z2EL74k5qLiPRXFNEUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu3pi-00000001NCt-0YEy;
	Mon, 17 Mar 2025 06:20:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu3o0-00000001Mjo-1KM6;
	Mon, 17 Mar 2025 06:18:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2595E13D5;
	Sun, 16 Mar 2025 23:18:39 -0700 (PDT)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A6203F673;
	Sun, 16 Mar 2025 23:18:23 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH 0/2] mm/ptdump: Drop assumption that pxd_val() is u64
Date: Mon, 17 Mar 2025 11:48:16 +0530
Message-Id: <20250317061818.16244-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_231832_446750_A65DDB9A 
X-CRM114-Status: GOOD (  11.82  )
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

Last argument passed down in note_page() is u64 assuming pxd_val() returned
value (all page table levels) is 64 bit - which might not be the case going
ahead when D128 page tables is enabled on arm64 platform. Besides pxd_val()
is very platform specific and its type should not be assumed in generic MM.

This series splits note_page() into individual page table level specific
callbacks which accepts corresponding pxd_t page table entry as an argument
instead and later all subscribing platforms could derive pxd_val() from the
entries as required and proceed as before.

Page table entry's value, mask and protection are represented with pteval_t
not u64 that has been assumed while dumping the page table entries on arm64
platform. Replace such u64 instances with pteval_t instead as expected.

This series has been tested on arm64 platform but it does build on other
relevant platforms (v6.14-rc7).

Changes in V1:

- Added note_page_flush() callback and implemented the same on all
  subscribing platforms
- Moved note_page() argument change from u64 to pteval_t on arm64 platform
  from second patch to the first patch instead

Changes in RFC:

https://lore.kernel.org/all/20250310095902.390664-1-anshuman.khandual@arm.com/

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-mm@kvack.org

Anshuman Khandual (2):
  mm/ptdump: Split note_page() into level specific callbacks
  arm64/ptdump: Replace u64 with pteval_t

 arch/arm64/include/asm/ptdump.h | 24 ++++++++++++----
 arch/arm64/mm/ptdump.c          | 50 ++++++++++++++++++++++++++++++---
 arch/powerpc/mm/ptdump/ptdump.c | 46 ++++++++++++++++++++++++++++--
 arch/riscv/mm/ptdump.c          | 46 ++++++++++++++++++++++++++++--
 arch/s390/mm/dump_pagetables.c  | 46 ++++++++++++++++++++++++++++--
 arch/x86/mm/dump_pagetables.c   | 39 ++++++++++++++++++++++++-
 include/linux/ptdump.h          |  9 ++++--
 mm/ptdump.c                     | 42 ++++++++++++++++++++-------
 8 files changed, 272 insertions(+), 30 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
