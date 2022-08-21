Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746B0C25B08
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Aug 2022 01:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MtprPSs9LPOwsUt8c5nv6eWPWkqIsXy4w5NeKKQnGps=; b=nWxPWGBSt0t1c0
	DRzxHXm1Piay/vCoATLC+FXA5nYQoM0H5f2sirjMImifzZnUTMFgJg8KVWGYOk/arI1K5PFqGC9/U
	VGubDTTMGa+1D4mxyz/ReR4fLhhKmFmwg28mM6VSwr266Q9To5O3idA4RN1B1Dut8bgrdmlwqE4EG
	26WM9oZPM5UriEc4I53mKmgL7Iu901kUYGqF7lc6AZp3YMBNBv9oWWHBT9f/kitQDN9KT3UVXl/rP
	QRlRuMLBnf7uMmneGrW23SU5/OegzI1zSc6Ear1Tbx2v4lQzaxlBcVY7U3s/N63ESRWoqC8f7RyrL
	66HGxfIaItkJBPuifxqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPZwr-00GV34-6j; Sun, 21 Aug 2022 01:40:21 +0000
Received: from m12-14.163.com ([220.181.12.14])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPZwn-00GUp2-Lc
	for linux-riscv@lists.infradead.org; Sun, 21 Aug 2022 01:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=VBrnM
	6CuTzIPpHE+rhpaLE/CGSehyrDcRVlK4nUbzIE=; b=Mb9kOg0kJpdQYOePnhJGp
	UlEbwdcMer7mb3X3KIODhbIv7XCGkeSF+eMTjYlQqteZZ3IYsh6b9QIYhQ9MrRxy
	84QFZy/cFtdqgNhl4YGuRIrpWJaUVIxpyKGneRcI2/Q2fESloPXD4pkxdzrf11lW
	KQR+tiD+ueIgNyIOBEjVP0=
Received: from whoami-VirtualBox.. (unknown [223.72.91.40])
	by smtp10 (Coremail) with SMTP id DsCowAAHhNjQjAFj1eUbCw--.40452S2;
	Sun, 21 Aug 2022 09:39:29 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexandre.ghiti@canonical.com,
	guoren@kernel.org,
	akpm@linux-foundation.org,
	heiko@sntech.de,
	panqinglin2020@iscas.ac.cn,
	unnanyong@huawei.com,
	tongtiangen@huawei.com,
	anshuman.khandual@arm.com,
	anup@brainfault.org
Cc: atishp@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	falcon@tinylab.org,
	Jinyu Tang <tjytimi@163.com>
Subject: [RFC PATCH v1] riscv: make update_mmu_cache to support asid
Date: Sun, 21 Aug 2022 09:39:26 +0800
Message-Id: <20220821013926.8968-1-tjytimi@163.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CM-TRANSID: DsCowAAHhNjQjAFj1eUbCw--.40452S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFyxGrW8AFyxtr48ZF1UWrg_yoW5Aw4kpF
	srCws5K3yfGrn3Gry2vrZrur1aqw1vg3WSyFWav390qrsIgFyjgF9xK340vr1rJFyrWFWS
	kayayr15u3yYv3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zM6wunUUUUU=
X-Originating-IP: [223.72.91.40]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/1tbiYxFkeFaEKrCgNAAAsy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_184018_100984_307923FA 
X-CRM114-Status: GOOD (  11.76  )
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
even if processor support asid. So add a new function
`flush_tlb_local_one_page` to flush local one page whether processor
supports asid or not. If asid is supported, this function will use it.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
---
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
index 37ed760d007c..a2634ce55626 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -64,6 +64,17 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
 	put_cpu();
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
 void flush_tlb_mm(struct mm_struct *mm)
 {
 	__sbi_tlb_flush_range(mm, 0, -1, PAGE_SIZE);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
