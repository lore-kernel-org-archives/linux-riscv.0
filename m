Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94023C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 09:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zu0ARSIe8FaNL7GJAdHMjuL3QtLwhkkmt6ew+fUQAv0=; b=4iaaMKGLwZBCTz
	Ou8747yJ9Z3ScOoaUnsdmDdfYHDKKJvDFBpw6bw/fLAQh4QWR8R/65DeHlSu//A7LGmxzF2bBHWbf
	U+AG1O+gm7vOIV/GUI4PG/snR0VYWtM92nqhrZtHtP6DRUMuX0xFOuczifQLs6DKs467fLYqk6Vjn
	gXmvA5E+Ku1U15gTxl41Q1Lkg/3yXBB0vshIVsbve9kYLy88bMHWGlOwBqp7xrFgeR+VPkEofBaZu
	LcaJ5tVx591Ge1Rg7ym67pEcR9Qb/WjCodloJVV0p9+4it8UwwRfVEZa5pXdcjA4cVQcDgTp+RNaB
	BzyyQGNATXVg3r/LLIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Fe-0000000E9uR-29FH;
	Mon, 29 Jun 2026 09:26:02 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Fa-0000000E9t5-1zDg
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 09:26:01 +0000
Received: from [127.0.0.2] (unknown [123.118.218.239])
	by APP-01 (Coremail) with SMTP id qwCowADnh9AdOkJqTqbgAw--.45536S2;
	Mon, 29 Jun 2026 17:25:49 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Mon, 29 Jun 2026 17:25:45 +0800
Subject: [PATCH] riscv: mm: Fix concurrency in mark_new_valid_map()
MIME-Version: 1.0
Message-Id: <20260629-riscv-mm-new-valid-map-ordering-v1-1-60d8c10c6292@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIABg6QmoC/yXNTQ6CMBBA4auQWTtJaQ3+XMW4KO2AY2whM1pJC
 He36vJtvreCkjApnJsVhAorT7lGu2sg3HweCTnWBmtsZzp7QmENBVPCTG8s/sERk59xklihPKI
 xh8G74751zkJVZqGBl9/hcv23vvo7heeXhW37ABsdAzCDAAAA
X-Change-ID: 20260629-riscv-mm-new-valid-map-ordering-007fa3841332
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yaxing Guo <guoyaxing@bosc.ac.cn>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.15.2
X-CM-TRANSID: qwCowADnh9AdOkJqTqbgAw--.45536S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF4kCFW7Xr1DKrWUCw4Uurg_yoWrJF1Dpr
	Wjkwn5KrWrur1fX3y2vw1UuayrWw1kWa1rKa4Fkw1rZanxAF4xJrWvvFW7JryUXFykWF4U
	Ca13u3sY9ryUAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbSfO7UUUU
	U==
X-Originating-IP: [123.118.218.239]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_022558_889059_6A607E57 
X-CRM114-Status: GOOD (  14.06  )
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

Turns out, the concurrency concerns [1] were justified - BOSC reported a
spurious fault in KFENCE that still triggers despite previous fixes,
which KFENCE reports as a false-positive.

Fix the concurrency problems in mark_new_valid_map():

- Add smp_wmb() before filling the bitmap, to make sure page table
  writes are "received".
- Use WRITE_ONCE() to fill the bitmap.

This fixes the KFENCE false positives in internal testing.

Also update comments in the assembly exception handler code to match.

Fixes: 26c171fc4853 ("riscv: mm: Use the bitmap API for new_valid_map_cpus")
Reported-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Link: https://lore.kernel.org/linux-riscv/da19ffcf-8042-4f96-9c2d-649468dc6a0a@kernel.org/ # [1]
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/include/asm/cacheflush.h | 15 ++++++++++++++-
 arch/riscv/kernel/entry.S           | 11 ++++-------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 8cfe59483a8f..1f191cf801a2 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -6,7 +6,9 @@
 #ifndef _ASM_RISCV_CACHEFLUSH_H
 #define _ASM_RISCV_CACHEFLUSH_H
 
+#include <linux/array_size.h>
 #include <linux/mm.h>
+#include <asm/barrier.h>
 
 static inline void local_flush_icache_all(void)
 {
@@ -46,12 +48,23 @@ extern DECLARE_BITMAP(new_valid_map_cpus, NR_CPUS);
 extern char _end[];
 static inline void mark_new_valid_map(void)
 {
+	/*
+	 * Orders any previous page table writes before setting bits in
+	 * new_valid_map_cpus. Pairs with the sfence.vma in
+	 * new_valid_map_cpus_check.
+	 */
+	smp_wmb();
+
 	/*
 	 * We don't care if concurrently a cpu resets this value since
 	 * the only place this can happen is in handle_exception() where
 	 * an sfence.vma is emitted.
+	 *
+	 * Not memset() or bitmap_fill() to avoid any possible compiler
+	 * shenanigans.
 	 */
-	bitmap_fill(new_valid_map_cpus, NR_CPUS);
+	for (size_t i = 0; i < ARRAY_SIZE(new_valid_map_cpus); i++)
+		WRITE_ONCE(new_valid_map_cpus[i], -1UL);
 }
 #define flush_cache_vmap flush_cache_vmap
 static inline void flush_cache_vmap(unsigned long start, unsigned long end)
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index c6988983cdf7..092f408edb7d 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -76,6 +76,8 @@
 	amoxor.d	a0, a1, (a0)
 
 	/*
+	 * Pairs with the smp_wmb() in mark_new_valid_map()
+	 *
 	 * A sfence.vma is required here. Even if we had Svvptc, there's no
 	 * guarantee that after returning we wouldn't just fault again.
 	 */
@@ -141,13 +143,8 @@ SYM_CODE_START(handle_exception)
 	/*
 	 * The RISC-V kernel does not flush TLBs on all CPUS after each new
 	 * vmalloc mapping or kfence_unprotect(), which may result in
-	 * exceptions:
-	 *
-	 * - if the uarch caches invalid entries, the new mapping would not be
-	 *   observed by the page table walker and an invalidation is needed.
-	 * - if the uarch does not cache invalid entries, a reordered access
-	 *   could "miss" the new mapping and traps: in that case, we only need
-	 *   to retry the access, no sfence.vma is required.
+	 * exceptions. In that case, we need to sfence.vma to "receive" the new
+	 * mappings and retry, whether or not we have Svvptc.
 	 */
 	new_valid_map_cpus_check
 #endif

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-riscv-mm-new-valid-map-ordering-007fa3841332

Best regards,
--  
Vivian Wang <wangruikang@iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
