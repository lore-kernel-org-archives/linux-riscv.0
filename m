Return-Path: <SRS0=kUFi=CZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC16C35257
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 07:36:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96E3420684
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 07:36:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MtS20yh6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0SOTHNC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96E3420684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bvaeq3vLZRITgdPh+7d3nKa2TgFRk7SFQzQp9mkneS8=; b=MtS20yh6Cq7Neh2CeyZeCyR47
	/Ke4yrDhmm4Ih3DRobrIQkg72Y7PhkEU6Z0hC46YfFMeve8Zck7GN6uiFmNsgPjYaPKw6uQyeOoez
	dpaJwJcrM40ZRhr22O9KYxobrlgL6ZZCj64XKKAoJfEDhNlwUP2KUNXvWFgYR32wMckROQEOXweVC
	T+DB1SSTkBs/QXiqwFHVzoswXnsbtjqF6nB2IBOJDUSOpCCe58w8dvWu4Xt6wjRSq3m81HvU0fDvi
	3cHuSSYb60l6BCmqLIESnPo7uM91OVEqp5E4c297iiqhA5qqa4fKgPwRgqUsfWKjxUl/FU24cypmZ
	I67hbg6cQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIRzK-0000TK-Ib; Wed, 16 Sep 2020 07:36:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIRzB-0000Op-BY; Wed, 16 Sep 2020 07:36:14 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A30DC21D1B;
 Wed, 16 Sep 2020 07:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600241772;
 bh=myvdsYeTVwfevSA9o3DuyixsLzfxCR/KChSuKW5WQjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R0SOTHNCE0m6BH0/ZaBpzddz5BwXTJmu2prbD7R0pgGNmfNd3d8jZFVDCn+X0CY8f
 EzsD0svKFO2rYc1nH0gRXZuNfM6SPVdaOdDs5t7uyLxWSZd01L33sWUQF0nSDBvlTw
 vsCZF6Evbl7MSzrx2fX1V0GNfKJ8KE5TOHpyH0+U=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 2/5] mmap: make mlock_future_check() global
Date: Wed, 16 Sep 2020 10:35:36 +0300
Message-Id: <20200916073539.3552-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916073539.3552-1-rppt@kernel.org>
References: <20200916073539.3552-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_033613_561518_CCC30E3D 
X-CRM114-Status: GOOD (  16.61  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

It will be used by the upcoming secret memory implementation.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 mm/internal.h | 3 +++
 mm/mmap.c     | 5 ++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 10c677655912..40544fbf49c9 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -350,6 +350,9 @@ static inline void munlock_vma_pages_all(struct vm_area_struct *vma)
 extern void mlock_vma_page(struct page *page);
 extern unsigned int munlock_vma_page(struct page *page);
 
+extern int mlock_future_check(struct mm_struct *mm, unsigned long flags,
+			      unsigned long len);
+
 /*
  * Clear the page's PageMlocked().  This can be useful in a situation where
  * we want to unconditionally remove a page from the pagecache -- e.g.,
diff --git a/mm/mmap.c b/mm/mmap.c
index 40248d84ad5f..190761920142 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1310,9 +1310,8 @@ static inline unsigned long round_hint_to_min(unsigned long hint)
 	return hint;
 }
 
-static inline int mlock_future_check(struct mm_struct *mm,
-				     unsigned long flags,
-				     unsigned long len)
+int mlock_future_check(struct mm_struct *mm, unsigned long flags,
+		       unsigned long len)
 {
 	unsigned long locked, lock_limit;
 
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
