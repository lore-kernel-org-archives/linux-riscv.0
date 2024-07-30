Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B90C3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 06:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbqOH0yrT4uztFf6D2Sp0Xp/JgtDnAeC4c73u8gppko=; b=XHhV4WyFW7et1A
	r6gvLsJrKsQiWUnR+3thUq0inTF4Acov86lVVeQuSnP6+9hlFxZALe303A1jV6gJVYzqXDlbHmp0A
	oAaB9hC6OoUgSsNInL96eeBbNqv83SHYo3aXmsmFWKwYWupfx35gzm5Xxz4KidxgL2WV/ZZSnZoC9
	HuAzYh/MW85pCtVhrI+s6AzSPFXl8VTsIrb+qi3rdbcNJpxnLqFbCSDlFu+33hYaB7kjYhXZ4BnrG
	l3fDiXKS9gHLfKli/VELKtMWKzo+JWw+kN+Hm2Qu0SBZBeuG4VB4C+QogkJlgry94XunmCHX2n6cy
	ABvzeIVn2sCxO8dopQVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYgZf-0000000Ds2J-2A96;
	Tue, 30 Jul 2024 06:43:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYgZa-0000000Drzy-3RSi;
	Tue, 30 Jul 2024 06:43:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 87D5DCE0E11;
	Tue, 30 Jul 2024 06:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7E2C4AF10;
	Tue, 30 Jul 2024 06:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722321779;
	bh=gTArplwlUTbTCuHNeuVct9T0SiQYRSRnIpLhqPQ+rcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EMNS+x8HI+8Q08E7NcZ4WD5BkiWh9xAxJgNUSeEC7wUsbadoC1FFu91tQMZE7Hy2S
	 IUmoRLjOcThG09j1Sqjri8IS5v5L/GqTmjdQarB0bmky4bNiqAj/NZnJ7JFHJeD8eM
	 xp4GUDXu8Pgl+WLlnMHA4AQrs4fRuuLAioV9xJyUj3Qfg+O5uVNHyjdnKujlXeeMze
	 y4pE/ENss3Y27SBqOaPJvTM3lQjwDoA5fmkCORb6Q7jSG49BTJJjCdSyOBxPURAgT7
	 N7ujc9Lmfynti/YNZ3I4QClP7CXUI+TSJh/h+u7SmrhYbHOtbMTzdHI4QxlG3cF9IU
	 WbYLxc+yhe31Q==
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
Subject: [RFC PATCH 01/18] mm/pgtable: use ptdesc in pte_free_now/pte_free_defer
Date: Tue, 30 Jul 2024 14:46:55 +0800
Message-ID: <20240730064712.3714387-2-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730064712.3714387-1-alexs@kernel.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_234303_238511_B24CCBE4 
X-CRM114-Status: GOOD (  14.63  )
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

page table descriptor is splited from struct page, use it to replace struct
page in right place.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox  <willy@infradead.org>
Cc: David Hildenbrand <david@redhat.com>
---
 mm/pgtable-generic.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 13a7705df3f8..2ce714f1dd15 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -238,18 +238,17 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long address,
 #ifndef pte_free_defer
 static void pte_free_now(struct rcu_head *head)
 {
-	struct page *page;
+	struct ptdesc *ptdesc;
 
-	page = container_of(head, struct page, rcu_head);
-	pte_free(NULL /* mm not passed and not used */, (pgtable_t)page);
+	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	pte_free(NULL /* mm not passed and not used */, (pgtable_t)ptdesc);
 }
 
 void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
 {
-	struct page *page;
+	struct ptdesc *ptdesc = page_ptdesc(pgtable);
 
-	page = pgtable;
-	call_rcu(&page->rcu_head, pte_free_now);
+	call_rcu(&ptdesc->pt_rcu_head, pte_free_now);
 }
 #endif /* pte_free_defer */
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
@@ -330,7 +329,7 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
  * kmapped if necessary (when CONFIG_HIGHPTE), and locked against concurrent
  * modification by software, with a pointer to that spinlock in ptlp (in some
  * configs mm->page_table_lock, in SPLIT_PTLOCK configs a spinlock in table's
- * struct page).  pte_unmap_unlock(pte, ptl) to unlock and unmap afterwards.
+ * struct ptdesc).  pte_unmap_unlock(pte, ptl) to unlock and unmap afterwards.
  *
  * But it is unsuccessful, returning NULL with *ptlp unchanged, if there is no
  * page table at *pmd: if, for example, the page table has just been removed,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
