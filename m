Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC7DCA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6SmOB/7O+5vUXWCMqwc2Fk+MzvwAJmMKyS8xbdcRQc=; b=XKOSAGRtl1hYt+
	/VQ5bUlB5f/BywXf/WWcU1qZGl4ZFWj6lsYRFWfz48rObVqxbt1LDfkvJSuvSRlhRNhJPWfL9P2A8
	db6fuwFmvogDT3c1k7Q5UXNs2nPTAUW/6gv0Tz99as3JXn2wZnSGAwmk0kMALlSXTTfD6E5ILdUhF
	5OE1IxCfidBBGdez3kinFP2eV34XNfhUuxaohvd7JQUVop2KR7TK6/4UIikI4rIjdcTzDGTtDb/ai
	1Vxf5aK4EDj13jQbYhpzKdeutI4auqnfwNwfcF5p5V9WarIeTijIB/I3vooeoMkOyu9gYuUvS729Q
	heDKzW+nhwu8jGgQaLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojw6-0000000E6mg-3h72;
	Wed, 20 Aug 2025 14:37:10 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoj7Z-0000000DsQY-2HsG
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 13:44:59 +0000
Received: from [127.0.0.2] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowABHN6tT0aVogOTBDQ--.24665S4;
	Wed, 20 Aug 2025 21:44:52 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 20 Aug 2025 21:44:46 +0800
Subject: [PATCH 2/6] riscv: pgtable: Convert to use_alternative_unlikely
MIME-Version: 1.0
Message-Id: <20250820-riscv-altn-helper-wip-v1-2-c3c626c1f7e6@iscas.ac.cn>
References: <20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn>
In-Reply-To: <20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Vivian Wang <uwu@dram.page>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowABHN6tT0aVogOTBDQ--.24665S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJFWUKFWUWrWxtFyftF1xGrg_yoW5CFy5pr
	Z3CasxXFWrGw1I9rZayr4Uur45Z39ag3Z8tr1S93ZYyr4akrWavFnxJ3WSvry8Ja97X34x
	KF4Ykr45Gw1ayr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUbH5lUUUUUU==
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_064457_986519_FFDF78EE 
X-CRM114-Status: GOOD (  12.90  )
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

Use use_alternative_unlikely() to check for RISCV_ISA_EXT_SVVPTC,
replacing the use of asm goto with ALTERNATIVE.

The "unlikely" variant is used to match the behavior of the original
implementation using ALTERNATIVE("nop", "j %l[svvptc]", ...).

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/include/asm/pgtable.h | 15 +++++++--------
 arch/riscv/mm/pgtable.c          | 22 ++++++++++------------
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 91697fbf1f9013005800f713797e4b6b1fc8d312..81eb386da837f064c7372530e2f2227575a703d3 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -495,8 +495,13 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 		struct vm_area_struct *vma, unsigned long address,
 		pte_t *ptep, unsigned int nr)
 {
-	asm goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA_EXT_SVVPTC, 1)
-		 : : : : svvptc);
+	/*
+	 * Svvptc guarantees that the new valid pte will be visible within
+	 * a bounded timeframe, so when the uarch does not cache invalid
+	 * entries, we don't have to do anything.
+	 */
+	if (use_alternative_unlikely(0, RISCV_ISA_EXT_SVVPTC))
+		return;
 
 	/*
 	 * The kernel assumes that TLBs don't cache invalid entries, but
@@ -508,12 +513,6 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 	while (nr--)
 		local_flush_tlb_page(address + nr * PAGE_SIZE);
 
-svvptc:;
-	/*
-	 * Svvptc guarantees that the new valid pte will be visible within
-	 * a bounded timeframe, so when the uarch does not cache invalid
-	 * entries, we don't have to do anything.
-	 */
 }
 #define update_mmu_cache(vma, addr, ptep) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 8b6c0a112a8db4e91de54c3bd3bd527a605a6197..e0c414fa0d433fdc39c80ec390c467ca59a9a334 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -9,8 +9,16 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
 			  unsigned long address, pte_t *ptep,
 			  pte_t entry, int dirty)
 {
-	asm goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA_EXT_SVVPTC, 1)
-		 : : : : svvptc);
+	if (use_alternative_unlikely(0, RISCV_ISA_EXT_SVVPTC)) {
+		if (!pte_same(ptep_get(ptep), entry)) {
+			__set_pte_at(vma->vm_mm, ptep, entry);
+			/* Here only not svadu is impacted */
+			flush_tlb_page(vma, address);
+			return true;
+		}
+
+		return false;
+	}
 
 	if (!pte_same(ptep_get(ptep), entry))
 		__set_pte_at(vma->vm_mm, ptep, entry);
@@ -19,16 +27,6 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
 	 * the case that the PTE changed and the spurious fault case.
 	 */
 	return true;
-
-svvptc:
-	if (!pte_same(ptep_get(ptep), entry)) {
-		__set_pte_at(vma->vm_mm, ptep, entry);
-		/* Here only not svadu is impacted */
-		flush_tlb_page(vma, address);
-		return true;
-	}
-
-	return false;
 }
 
 int ptep_test_and_clear_young(struct vm_area_struct *vma,

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
