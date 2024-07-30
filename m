Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C129EC3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 06:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5aV5MwX8FU/+tIKY/RD+5jyksAxiq4I+tT3O51FCzi4=; b=SMCetomWts7tsA
	UunopEJqGbXwBvw8fKlH+a10rrVtfzBM3lrDmfQPYTcAitm7QaglnYqv17g8nB5uvp31UKk4Y3T+s
	Ps2J+C8J9TWJwNYI05dbwRWdoOmOaOLZAolVqGMR3fNr4flHdU32pgXFXaMyjd2sARd0Xhbw2YOo2
	X4Pnhb81QGWhPSH8aQ0xmDc1SvH/qwbKaVkl7trwjCH0ZAIk+bmEXC/Png5XG1L3LlTi13AguBLQw
	lKciKTuqFvtVGF8XqNgllG/GWKH4zP0PISqFU31G6YqybbbygDQwxJRiZUJsSGpGcwmpVuzdzwgKW
	W+flj7PgO0Knh8us0ESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYgbC-0000000DstT-2EnV;
	Tue, 30 Jul 2024 06:44:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYgb8-0000000Dsqr-1pzh;
	Tue, 30 Jul 2024 06:44:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3F38ACE0E51;
	Tue, 30 Jul 2024 06:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939DCC4AF09;
	Tue, 30 Jul 2024 06:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722321875;
	bh=ccXL2chU8a/94eL1T1pI+a3Q5/w60GPmzE5TdAMCqlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mfAajOsY0bas1KjIZ7zbi0ly7eR8srfqY9/dGjSCEZBhCcX9YS6VakfWING1fsGF9
	 W0YCBavaz4bKXWCT+t6Yhfu/nqQvhZRU8uQ4308gV21op4ifIO73UuI1kTRWXnNtuQ
	 s5Z/K60Rw4yOKEM2lNhxjV21z9g0mIa7otDskKJSUtzhlDHiE0nSamwvKeBMBIax9v
	 uECArXHvXKdVLqGvan7uo4dKgcLJgys3j/9lFLYcEfUC1FUurphSmLjUuWStQ30LeH
	 mcqLnZdVd1vSIjm4Q5ofH7j6+1Ir6OhcZ/gLzfEGTM1DHna6l6J8fJTKaOJDBS/8EQ
	 RPhVDl0tGnBTA==
From: alexs@kernel.org
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Brian Cain <bcain@quicinc.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bibo Mao <maobibo@loongson.cn>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Lance Yang <ioworker0@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Barry Song <baohua@kernel.org>,
	linux-s390@vger.kernel.org
Cc: Guo Ren <guoren@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Hugh Dickins <hughd@google.com>,
	David Hildenbrand <david@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [RFC PATCH 08/18] mm/memory: use ptdesc in __pte_alloc
Date: Tue, 30 Jul 2024 14:47:02 +0800
Message-ID: <20240730064712.3714387-9-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730064712.3714387-1-alexs@kernel.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_234438_838814_44C6D546 
X-CRM114-Status: GOOD (  12.04  )
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

From: Alex Shi <alexs@kernel.org>

Replace pgtable_t by ptdesc in function __pte_alloc.
We will remove pgtable_t from all place.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 mm/memory.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index b9f5cc0db3eb..5b01d94a0b5f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -445,13 +445,13 @@ void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte)
 
 int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
 {
-	pgtable_t new = pte_alloc_one(mm);
-	if (!new)
+	struct ptdesc *ptdesc = page_ptdesc(pte_alloc_one(mm));
+	if (!ptdesc)
 		return -ENOMEM;
 
-	pmd_install(mm, pmd, &new);
-	if (new)
-		pte_free(mm, new);
+	pmd_install(mm, pmd, (pgtable_t *)&ptdesc);
+	if (ptdesc)
+		pte_free(mm, ptdesc_page(ptdesc));
 	return 0;
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
