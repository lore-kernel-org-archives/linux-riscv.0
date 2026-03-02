Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCF9D58E47
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 02:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6u1R4pKzW/+r/YxJ6c4xb19LwzAb3Qi4LqmazZh30E=; b=Cc+hmTVi1yZdwc
	l4x7N+ARo2gIkplffFMfM8BYsTyolKRUi9ciGNWTKKt+khDcn/XT/6Y1IOaRjtXY/8tf5zF9R0+c7
	kMVMrFka9OFQcn1VjMlvT9KvM4CGVf0wP5S3NIUClyLBCbGag0sM7bqAFzgduoAvAuS8J1Tp0gOot
	QeqNT0Ae2kLvVB/R4xPmUpHMQmibqC9EYNgw0NufZlTqitC/tOVXAuZtV5oXKRhFNlQe2f77aMpTW
	4psGEqPcyb/mrhYbwu26Z+w1WO5vhHeyLS9qClLJ+LdPnpnYNVhpxufG8tY/kw7sxxUQTbnTpGJaL
	Wh3MJiUF8257bYlFGplA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsv2-0000000C78N-2FYD;
	Mon, 02 Mar 2026 02:22:00 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsux-0000000C76t-15Na
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 02:21:58 +0000
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowAD3E9s39KRp6CWmCQ--.11902S3;
	Mon, 02 Mar 2026 10:21:43 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Mon, 02 Mar 2026 10:21:30 +0800
Subject: [PATCH 1/3] riscv: mm: Rename new_vmalloc into new_valid_map_cpus
MIME-Version: 1.0
Message-Id: <20260302-handle-kfence-protect-spurious-fault-v1-1-25c82c879d9c@iscas.ac.cn>
References: <20260302-handle-kfence-protect-spurious-fault-v1-0-25c82c879d9c@iscas.ac.cn>
In-Reply-To: <20260302-handle-kfence-protect-spurious-fault-v1-0-25c82c879d9c@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, Palmer Dabbelt <palmer@rivosinc.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID: rQCowAD3E9s39KRp6CWmCQ--.11902S3
X-Coremail-Antispam: 1UD129KBjvJXoW3AF1rKFWkWw1DWrWxGrW7urg_yoW7GFWrpr
	W7Kwn8K34UZFy7A39Ivw48ur1rW3WkW3WSk3ZIqw1fCan8Jry7CFykZa9rXryxJayUGr4f
	Za1ayF4rC34UAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8
	JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjb_-JUUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_182155_705023_9853165F 
X-CRM114-Status: GOOD (  14.35  )
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

In preparation of a future patch using this mechanism for non-vmalloc
mappings, rename new_vmalloc into new_valid_map_cpus to avoid misleading
readers.

No functional change intended.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/include/asm/cacheflush.h |  6 +++---
 arch/riscv/kernel/entry.S           | 38 ++++++++++++++++++-------------------
 arch/riscv/mm/init.c                |  2 +-
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 0092513c3376..b6d1a5eb7564 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -41,7 +41,7 @@ do {							\
 } while (0)
 
 #ifdef CONFIG_64BIT
-extern u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
+extern u64 new_valid_map_cpus[NR_CPUS / sizeof(u64) + 1];
 extern char _end[];
 #define flush_cache_vmap flush_cache_vmap
 static inline void flush_cache_vmap(unsigned long start, unsigned long end)
@@ -54,8 +54,8 @@ static inline void flush_cache_vmap(unsigned long start, unsigned long end)
 		 * the only place this can happen is in handle_exception() where
 		 * an sfence.vma is emitted.
 		 */
-		for (i = 0; i < ARRAY_SIZE(new_vmalloc); ++i)
-			new_vmalloc[i] = -1ULL;
+		for (i = 0; i < ARRAY_SIZE(new_valid_map_cpus); ++i)
+			new_valid_map_cpus[i] = -1ULL;
 	}
 }
 #define flush_cache_vmap_early(start, end)	local_flush_tlb_kernel_range(start, end)
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 60eb221296a6..e57a0f550860 100644
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
 
@@ -144,7 +144,7 @@ SYM_CODE_START(handle_exception)
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
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
