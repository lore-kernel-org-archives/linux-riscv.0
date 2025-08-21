Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359B7CA0EF8
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 12:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYzqeWqHjyr28GbTkryWKRD5L1Lilpw/TfhrPg6fDB8=; b=CFbrzZ9M2sEXHp
	z8x0nHvhkBT5m3+HA6obyqMB7+6OAL16cyuyNXcoyvF9EGp0r/7uQabxXMBO5gAw6aBqyiffUEl1f
	5vY5GnqvCxn+hPOTAFZJgLcEarHThVv6XET9uL2pW1JLUlGRv2Z7NEeoquoKIVbbd+o+MZNoRDeFw
	0Fbq7QWjlOkY6av4fXiyXR3ILTC6LAQ5jcAsHHWOKcDkq7GwC4qcHc4OP/VEGw0k5GdG8EpWWCc99
	qBplfRLirO7rU2H/jn3g+7opkKYG2Epdwk5nm02YZAhIVbBKqNH9xlYjoyknWzCC/X6Err3sauo2k
	9QcR7Tgl4pNQLNksNUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4B0-0000000Grty-1NCD;
	Thu, 21 Aug 2025 12:13:54 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1PW-0000000GN3L-2POQ
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 09:16:46 +0000
Received: from [127.0.0.2] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowADXAqfv46ZovXADDg--.14435S3;
	Thu, 21 Aug 2025 17:16:31 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Thu, 21 Aug 2025 17:16:31 +0800
Subject: [PATCH v2 1/5] riscv: pgtable: Use __riscv_has_extension_unlikely
MIME-Version: 1.0
Message-Id: <20250821-riscv-altn-helper-wip-v2-1-9586fa702f78@iscas.ac.cn>
References: <20250821-riscv-altn-helper-wip-v2-0-9586fa702f78@iscas.ac.cn>
In-Reply-To: <20250821-riscv-altn-helper-wip-v2-0-9586fa702f78@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Charlie Jenkins <charlie@rivosinc.com>, 
 Xiao Wang <xiao.w.wang@intel.com>, 
 =?utf-8?q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Vivian Wang <uwu@dram.page>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowADXAqfv46ZovXADDg--.14435S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJFWUKFWfCw1DuFy7GFy5CFg_yoW5Cw1Upr
	Z3Cas8W3yrCw1IyrZ2yr4Uur45Z39ag3ZxKr1S93WFyr4akw42vrnxJa1Syry8JayxX34x
	KF4Ykr45Gw13Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUjrHUDUUUUU==
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_021643_014628_609F32E7 
X-CRM114-Status: GOOD (  13.38  )
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

Use __riscv_has_extension_unlikely() to check for RISCV_ISA_EXT_SVVPTC,
replacing the use of asm goto with ALTERNATIVE.

The "unlikely" variant is used to match the behavior of the original
implementation using ALTERNATIVE("nop", "j %l[svvptc]", ...).

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/include/asm/pgtable.h | 15 +++++++--------
 arch/riscv/mm/pgtable.c          | 22 ++++++++++------------
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 91697fbf1f9013005800f713797e4b6b1fc8d312..f37a0c3dab8a8c19e21743be743759724bb5fffd 100644
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
+	if (__riscv_has_extension_unlikely(0, RISCV_ISA_EXT_SVVPTC))
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
index 8b6c0a112a8db4e91de54c3bd3bd527a605a6197..289ca6fa6b4de80d42287d28e266a0a8d3848cff 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -9,8 +9,16 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
 			  unsigned long address, pte_t *ptep,
 			  pte_t entry, int dirty)
 {
-	asm goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA_EXT_SVVPTC, 1)
-		 : : : : svvptc);
+	if (__riscv_has_extension_unlikely(0, RISCV_ISA_EXT_SVVPTC)) {
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
