Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BD1E67A6C
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 05:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/GSTLqL+GXQS7Ix2cgkO2qfUVABs9JOOqKjIMTVLkW8=; b=lgzbTOWZozob1/
	jT3nRdtSXAEUZy3ifmUmCwDRsfTtADR8pKJ5Bunys7anrQwZgYIZZnEly+MGL9w6oSpNfA+/fH8Lt
	sTcAOn3IOkEr2/h6DMgDVwY2F3EFJMxuukCDsPM1E7X9II9VNsSeJ6ugcauZ2OmlVvVgu7MdHn5wg
	zrhiVX/U6hpJhDZFmLUXuGhic6Ifus2F8jnh/2ovxt+SQgFhKf8S5eNPKcc2y0NcCnyclPncNC8a/
	UGf0oIJ4gG3eMAhDmqb68PSY4yw3shKn8RG35OaWDZNh1piedQMjgxAyOg79/YFdM5VN1uvXBm0Mw
	q/niV+W7cdNd8z0WtZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxILS-0000000EXfM-0FMD;
	Tue, 03 Mar 2026 05:30:58 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxILN-0000000EXcz-2VNO
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 05:30:56 +0000
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowAAHHdT9caZpAmO+CQ--.19798S5;
	Tue, 03 Mar 2026 13:30:39 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Tue, 03 Mar 2026 13:29:47 +0800
Subject: [PATCH v2 3/5] riscv: mm: Rename new_vmalloc into
 new_valid_map_cpus
MIME-Version: 1.0
Message-Id: <20260303-handle-kfence-protect-spurious-fault-v2-3-f80d8354d79d@iscas.ac.cn>
References: <20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn>
In-Reply-To: <20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Alexander Potapenko <glider@google.com>, 
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Yunhui Cui <cuiyunhui@bytedance.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, Palmer Dabbelt <palmer@rivosinc.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID: rQCowAAHHdT9caZpAmO+CQ--.19798S5
X-Coremail-Antispam: 1UD129KBjvJXoW3AF1rKFWkWw1DWrWxGrW7urg_yoW7Gryfpr
	W7Kwn8K34UZF17Z39Ivw48uF1rW3Wvg3WSk3ZIqw1fCFs8ArW7uF1kZay7XryxGFWUGr48
	Za1SyF4rC34UA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjfU55rcDUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_213054_012959_FB1294CC 
X-CRM114-Status: GOOD (  15.11  )
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

Since this mechanism is now used for the kfence pool, which comes from
the linear mapping and not vmalloc, rename new_vmalloc into
new_valid_map_cpus to avoid misleading readers.

No functional change intended.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/include/asm/cacheflush.h |  6 +++---
 arch/riscv/kernel/entry.S           | 38 ++++++++++++++++++-------------------
 arch/riscv/mm/init.c                |  2 +-
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index b1a2ac665792..8c7a0ef2635a 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -41,7 +41,7 @@ do {							\
 } while (0)
 
 #ifdef CONFIG_64BIT
-extern u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
+extern u64 new_valid_map_cpus[NR_CPUS / sizeof(u64) + 1];
 extern char _end[];
 static inline void mark_new_valid_map(void)
 {
@@ -52,8 +52,8 @@ static inline void mark_new_valid_map(void)
 	 * the only place this can happen is in handle_exception() where
 	 * an sfence.vma is emitted.
 	 */
-	for (i = 0; i < ARRAY_SIZE(new_vmalloc); ++i)
-		new_vmalloc[i] = -1ULL;
+	for (i = 0; i < ARRAY_SIZE(new_valid_map_cpus); ++i)
+		new_valid_map_cpus[i] = -1ULL;
 }
 #define flush_cache_vmap flush_cache_vmap
 static inline void flush_cache_vmap(unsigned long start, unsigned long end)
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index ced7a2b160ce..9c6acfd09141 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -20,44 +20,44 @@
 
 	.section .irqentry.text, "ax"
 
-.macro new_vmalloc_check
+.macro new_valid_map_cpus_check
 	REG_S 	a0, TASK_TI_A0(tp)
 	csrr 	a0, CSR_CAUSE
 	/* Exclude IRQs */
-	blt  	a0, zero, .Lnew_vmalloc_restore_context_a0
+	blt  	a0, zero, .Lnew_valid_map_cpus_restore_context_a0
 
 	REG_S 	a1, TASK_TI_A1(tp)
-	/* Only check new_vmalloc if we are in page/protection fault */
+	/* Only check new_valid_map_cpus if we are in page/protection fault */
 	li   	a1, EXC_LOAD_PAGE_FAULT
-	beq  	a0, a1, .Lnew_vmalloc_kernel_address
+	beq  	a0, a1, .Lnew_valid_map_cpus_kernel_address
 	li   	a1, EXC_STORE_PAGE_FAULT
-	beq  	a0, a1, .Lnew_vmalloc_kernel_address
+	beq  	a0, a1, .Lnew_valid_map_cpus_kernel_address
 	li   	a1, EXC_INST_PAGE_FAULT
-	bne  	a0, a1, .Lnew_vmalloc_restore_context_a1
+	bne  	a0, a1, .Lnew_valid_map_cpus_restore_context_a1
 
-.Lnew_vmalloc_kernel_address:
+.Lnew_valid_map_cpus_kernel_address:
 	/* Is it a kernel address? */
 	csrr 	a0, CSR_TVAL
-	bge 	a0, zero, .Lnew_vmalloc_restore_context_a1
+	bge 	a0, zero, .Lnew_valid_map_cpus_restore_context_a1
 
 	/* Check if a new vmalloc mapping appeared that could explain the trap */
 	REG_S	a2, TASK_TI_A2(tp)
 	/*
 	 * Computes:
-	 * a0 = &new_vmalloc[BIT_WORD(cpu)]
+	 * a0 = &new_valid_map_cpus[BIT_WORD(cpu)]
 	 * a1 = BIT_MASK(cpu)
 	 */
 	lw	a2, TASK_TI_CPU(tp)
 	/*
-	 * Compute the new_vmalloc element position:
+	 * Compute the new_valid_map_cpus element position:
 	 * (cpu / 64) * 8 = (cpu >> 6) << 3
 	 */
 	srli	a1, a2, 6
 	slli	a1, a1, 3
-	la	a0, new_vmalloc
+	la	a0, new_valid_map_cpus
 	add	a0, a0, a1
 	/*
-	 * Compute the bit position in the new_vmalloc element:
+	 * Compute the bit position in the new_valid_map_cpus element:
 	 * bit_pos = cpu % 64 = cpu - (cpu / 64) * 64 = cpu - (cpu >> 6) << 6
 	 * 	   = cpu - ((cpu >> 6) << 3) << 3
 	 */
@@ -67,12 +67,12 @@
 	li	a2, 1
 	sll	a1, a2, a1
 
-	/* Check the value of new_vmalloc for this cpu */
+	/* Check the value of new_valid_map_cpus for this cpu */
 	REG_L	a2, 0(a0)
 	and	a2, a2, a1
-	beq	a2, zero, .Lnew_vmalloc_restore_context
+	beq	a2, zero, .Lnew_valid_map_cpus_restore_context
 
-	/* Atomically reset the current cpu bit in new_vmalloc */
+	/* Atomically reset the current cpu bit in new_valid_map_cpus */
 	amoxor.d	a0, a1, (a0)
 
 	/* Only emit a sfence.vma if the uarch caches invalid entries */
@@ -84,11 +84,11 @@
 	csrw	CSR_SCRATCH, x0
 	sret
 
-.Lnew_vmalloc_restore_context:
+.Lnew_valid_map_cpus_restore_context:
 	REG_L 	a2, TASK_TI_A2(tp)
-.Lnew_vmalloc_restore_context_a1:
+.Lnew_valid_map_cpus_restore_context_a1:
 	REG_L 	a1, TASK_TI_A1(tp)
-.Lnew_vmalloc_restore_context_a0:
+.Lnew_valid_map_cpus_restore_context_a0:
 	REG_L	a0, TASK_TI_A0(tp)
 .endm
 
@@ -146,7 +146,7 @@ SYM_CODE_START(handle_exception)
 	 *   could "miss" the new mapping and traps: in that case, we only need
 	 *   to retry the access, no sfence.vma is required.
 	 */
-	new_vmalloc_check
+	new_valid_map_cpus_check
 #endif
 
 	REG_S sp, TASK_TI_KERNEL_SP(tp)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 811e03786c56..9922c22a2a5f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -37,7 +37,7 @@
 
 #include "../kernel/head.h"
 
-u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
+u64 new_valid_map_cpus[NR_CPUS / sizeof(u64) + 1];
 
 struct kernel_mapping kernel_map __ro_after_init;
 EXPORT_SYMBOL(kernel_map);

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
