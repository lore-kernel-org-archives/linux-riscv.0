Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF763ECAAD3
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jYTg7BZ9woPxP5+JIKKw/rZsKULmi8d7L6TZL7Wt4po=; b=GxvSs6dUBk3z8p
	otsHtHOm8gl2lJ3FEMxbvxEz57IbyUiEBdW3KYEy7hEV8QdKxLDp8Ru9qmFBLFibziCTwCQXaEEJw
	eW70IdjgRqAAynDJSv+k1k+3XHBQMx9QuPv49O1phH+3+sNUgLR5qzgYx7yIeMC+qHpaoyopfLVZM
	Grp5rQJytuCZcRBPDxPHFmqFjzzakq1ukziA/8baeWsJRI7jBGaO+e2/vjhBl4b/5f65dBRqUBAgU
	HIUjTSJV96Dxbu/iScYOHIJocREdIced6ZNz/yJmJMBp+fHoIM7wWBYsyF4xicPQwiwmmhjJLw4FI
	dLprM2pdyt+Fr7OaxT5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUpqq-006Tlo-4v; Sun, 04 Sep 2022 13:39:52 +0000
Received: from m12-18.163.com ([220.181.12.18])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUpqm-006TeM-WD
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 13:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=tF31H
	YNBq9FEgUfHe2lhN7dhYzjH0fiHkuXz0eoXuZc=; b=FWYyyObcnG3BL8OQd43pV
	20mqhI0KQw6TqAeeoTpa88KP0GpMcxr9Ey6TfU4o4nO4LnZxNbYkmAxdW3thnDy+
	YI+8moT+PGWYUhynl1UDtfgYY9bsTOtQZjuUvukOy2s9W5VH+jPM/4vIm7LH5V0c
	ofBE9WHLHwYkOqcD8kuB5o=
Received: from whoami-VirtualBox.. (unknown [223.72.91.155])
	by smtp14 (Coremail) with SMTP id EsCowAAHgf8IqhRjP+7qDg--.32759S2;
	Sun, 04 Sep 2022 21:37:12 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexandre.ghiti@canonical.com,
	guoren@kernel.org,
	heiko@sntech.de,
	akpm@linux-foundation.org,
	panqinglin2020@iscas.ac.cn,
	tongtiangen@huawei.com,
	sunnanyong@huawei.com,
	anshuman.khandual@arm.com,
	atishp@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	falcon@tinylab.org,
	tjytimi@163.com
Subject: [PATCH v2] riscv: make update_mmu_cache to support asid
Date: Sun,  4 Sep 2022 21:37:10 +0800
Message-Id: <20220904133710.117263-1-tjytimi@163.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CM-TRANSID: EsCowAAHgf8IqhRjP+7qDg--.32759S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFy7Cw1rtrWUWr47tw1xGrg_yoW5ZryUpF
	srCws5K3yfGrn3Gry7Zr9I9r13Xw4qg3WayFWav3yYqrsIgFyjgr9xK340vr1rJFyrWFWS
	kayayr15u3yYywUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pKLvugUUUUU=
X-Originating-IP: [223.72.91.155]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/1tbiYwhyeFaEK+FoogAAsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_063949_581356_061A5946 
X-CRM114-Status: GOOD (  11.32  )
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

The `update_mmu_cache` function in riscv flush tlb cache without asid
information now, which will flush tlbs in other tasks' address space
even if processor supports asid. So add a new function
`flush_tlb_local_one_page` to flush local one page whether processor
supports asid or not,for cases that need to flush local one page like
function `update_mmu_cache`.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
---
RFC V1 -> V2 : 
1.Rebased on PATCH9 of IPI imporvement series as Anup Patel
suggestion. 
2.Make commit log more clear.

 arch/riscv/include/asm/pgtable.h  |  2 +-
 arch/riscv/include/asm/tlbflush.h |  2 ++
 arch/riscv/mm/tlbflush.c          | 11 +++++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 7ec936910a96..09ccefa6b6c7 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -415,7 +415,7 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 	 * Relying on flush_tlb_fix_spurious_fault would suffice, but
 	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
 	 */
-	local_flush_tlb_page(address);
+	flush_tlb_local_one_page(vma, address);
 }
 
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 801019381dea..120aeb1c6ecf 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -30,6 +30,7 @@ static inline void local_flush_tlb_page(unsigned long addr)
 #if defined(CONFIG_SMP) && defined(CONFIG_MMU)
 void flush_tlb_all(void);
 void flush_tlb_mm(struct mm_struct *mm);
+void flush_tlb_local_one_page(struct vm_area_struct *vma, unsigned long addr);
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end);
@@ -42,6 +43,7 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 
 #define flush_tlb_all() local_flush_tlb_all()
 #define flush_tlb_page(vma, addr) local_flush_tlb_page(addr)
+#define flush_tlb_local_one_page(vma, addr) local_flush_tlb_page(addr)
 
 static inline void flush_tlb_range(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end)
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 27a7db8eb2c4..0843e1baaf34 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -41,6 +41,17 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
 		local_flush_tlb_all_asid(asid);
 }
 
+void flush_tlb_local_one_page(struct vm_area_struct *vma, unsigned long addr)
+{
+	if (static_branch_unlikely(&use_asid_allocator)) {
+		unsigned long asid = atomic_long_read(&vma->vm_mm->context.id);
+
+		local_flush_tlb_page_asid(addr, asid);
+	} else {
+		local_flush_tlb_page(addr);
+	}
+}
+
 static void __ipi_flush_tlb_all(void *info)
 {
 	local_flush_tlb_all();
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
