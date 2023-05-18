Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1792C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=14OU7BhKm3HBLM+f1N1appMydlHnLW/sZ/XlI82cFnw=; b=xcE/c+S8Vvfrba
	kT4+Pa6lOpthr6aVdSd9Qmu1FSZxEJxgbFNgEdRU14hrA4K06lyb0jEsg0Ild2KhQpnSR7oc/RNMf
	WZOemlPWHQSs8DuPOuYxoF3uNF/1GB1BV3AHLtrUy4B41RuIKGcdzOrevgaMZT4SqnLeR6eZgxf+Y
	LoUoyJCcqSM0lIuroFciC1EQnPt+7Iins3PnXSttpbdW4DvtqO5zLt+AwWGuUmW6UlYoKQ+Spoz00
	cPDv2vkCZtkPumpbldEOZPGDyzMhnhm8UulpzP9fvzHk5rj8ugSjAhC08ukJ8NsXm7NiUN+ERWsK9
	Xdu/llz9Aw2r6LjbluIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdQr-00D2UL-2B;
	Thu, 18 May 2023 13:12:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdQp-00D2TC-1v
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:12:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 27B7464F5F;
	Thu, 18 May 2023 13:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BA8C433D2;
	Thu, 18 May 2023 13:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415553;
	bh=OdCg9R21eQviBmoMElf1uoCtA04hFkvb/xuB1wotl0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c1NzFB+d9XO/F7FqxVDFeI5zors7BqJYtoF1hS4l/7VjpOzY1hddMiwLSALRaRyCy
	 bYji2sLtYtbbykYoDXu9hyd9INlWbNEMJ4V1vUPYT2UHRFqoIAwf/Rzb7KlgvMbJlt
	 JnuEaddtGzO4Sqxt2eiI90JJjsyY9TlavKrt16mnNVvcjK0aG8I6NuhwrckPen9Ufp
	 4mpbNjPWww4fBjdz9v7E06eXt2nDgJmGTDLGo5xBByXJGN54gfIeKqHzLM1KOBetv1
	 8wMnKleNvdDO3UlijO7Z7lBRtD8w4cqYoVflLtJx1rPvpRBYzx3hYdLCnsxCX1wDSS
	 E6uqTqLzAYY2Q==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 09/22] riscv: s64ilp32: Introduce PTR_L and PTR_S
Date: Thu, 18 May 2023 09:10:00 -0400
Message-Id: <20230518131013.3366406-10-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061235_716012_D039C1CD 
X-CRM114-Status: GOOD (  12.52  )
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

From: Guo Ren <guoren@linux.alibaba.com>

REG_L and REG_S can't satisfy s64ilp32 situation, because its
__SIZEOF_POINTER__*8 != __riscv_xlen. So we introduce new PTR_L
and PTR_S macro to help head.S and entry.S deal with the pointer
data type and replace all REG_L/S by PTR_L/S to fit the current
algorithm in memcpy, memove, memset, strcmp, strlen and strncmp.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/asm.h |  5 +++++
 arch/riscv/kernel/entry.S    | 24 ++++++++++++------------
 arch/riscv/kernel/head.S     |  8 ++++----
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 114bbadaef41..1cf20027bdbd 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -38,6 +38,7 @@
 #define RISCV_SZPTR		"8"
 #define RISCV_LGPTR		"3"
 #endif
+#define __PTR_SEL(a, b)		__ASM_STR(a)
 #elif __SIZEOF_POINTER__ == 4
 #ifdef __ASSEMBLY__
 #define RISCV_PTR		.word
@@ -48,10 +49,14 @@
 #define RISCV_SZPTR		"4"
 #define RISCV_LGPTR		"2"
 #endif
+#define __PTR_SEL(a, b)		__ASM_STR(b)
 #else
 #error "Unexpected __SIZEOF_POINTER__"
 #endif
 
+#define PTR_L		__PTR_SEL(ld, lw)
+#define PTR_S		__PTR_SEL(sd, sw)
+
 #if (__SIZEOF_INT__ == 4)
 #define RISCV_INT		__ASM_STR(.word)
 #define RISCV_SZINT		__ASM_STR(4)
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 3fbb100bc9e4..9d8a94fec097 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -25,19 +25,19 @@ SYM_CODE_START(handle_exception)
 
 _restore_kernel_tpsp:
 	csrr tp, CSR_SCRATCH
-	REG_S sp, TASK_TI_KERNEL_SP(tp)
+	PTR_S sp, TASK_TI_KERNEL_SP(tp)
 
 #ifdef CONFIG_VMAP_STACK
 	addi sp, sp, -(PT_SIZE_ON_STACK)
 	srli sp, sp, THREAD_SHIFT
 	andi sp, sp, 0x1
 	bnez sp, handle_kernel_stack_overflow
-	REG_L sp, TASK_TI_KERNEL_SP(tp)
+	PTR_L sp, TASK_TI_KERNEL_SP(tp)
 #endif
 
 _save_context:
-	REG_S sp, TASK_TI_USER_SP(tp)
-	REG_L sp, TASK_TI_KERNEL_SP(tp)
+	PTR_S sp, TASK_TI_USER_SP(tp)
+	PTR_L sp, TASK_TI_KERNEL_SP(tp)
 	addi sp, sp, -(PT_SIZE_ON_STACK)
 	REG_S x1,  PT_RA(sp)
 	REG_S x3,  PT_GP(sp)
@@ -53,7 +53,7 @@ _save_context:
 	 */
 	li t0, SR_SUM | SR_FS
 
-	REG_L s0, TASK_TI_USER_SP(tp)
+	PTR_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
 	csrr s2, CSR_EPC
 	csrr s3, CSR_TVAL
@@ -96,7 +96,7 @@ _save_context:
 	add t0, t1, t0
 	/* Check if exception code lies within bounds */
 	bgeu t0, t2, 1f
-	REG_L t0, 0(t0)
+	PTR_L t0, 0(t0)
 	jr t0
 1:
 	tail do_trap_unknown
@@ -121,7 +121,7 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 
 	/* Save unwound kernel stack pointer in thread_info */
 	addi s0, sp, PT_SIZE_ON_STACK
-	REG_S s0, TASK_TI_KERNEL_SP(tp)
+	PTR_S s0, TASK_TI_KERNEL_SP(tp)
 
 	/*
 	 * Save TP into the scratch register , so we can find the kernel data
@@ -239,7 +239,7 @@ restore_caller_reg:
 	REG_S x5,  PT_T0(sp)
 	save_from_x6_to_x31
 
-	REG_L s0, TASK_TI_KERNEL_SP(tp)
+	PTR_L s0, TASK_TI_KERNEL_SP(tp)
 	csrr s1, CSR_STATUS
 	csrr s2, CSR_EPC
 	csrr s3, CSR_TVAL
@@ -283,8 +283,8 @@ SYM_FUNC_START(__switch_to)
 	li    a4,  TASK_THREAD_RA
 	add   a3, a0, a4
 	add   a4, a1, a4
-	REG_S ra,  TASK_THREAD_RA_RA(a3)
-	REG_S sp,  TASK_THREAD_SP_RA(a3)
+	PTR_S ra,  TASK_THREAD_RA_RA(a3)
+	PTR_S sp,  TASK_THREAD_SP_RA(a3)
 	REG_S s0,  TASK_THREAD_S0_RA(a3)
 	REG_S s1,  TASK_THREAD_S1_RA(a3)
 	REG_S s2,  TASK_THREAD_S2_RA(a3)
@@ -298,8 +298,8 @@ SYM_FUNC_START(__switch_to)
 	REG_S s10, TASK_THREAD_S10_RA(a3)
 	REG_S s11, TASK_THREAD_S11_RA(a3)
 	/* Restore context from next->thread */
-	REG_L ra,  TASK_THREAD_RA_RA(a4)
-	REG_L sp,  TASK_THREAD_SP_RA(a4)
+	PTR_L ra,  TASK_THREAD_RA_RA(a4)
+	PTR_L sp,  TASK_THREAD_SP_RA(a4)
 	REG_L s0,  TASK_THREAD_S0_RA(a4)
 	REG_L s1,  TASK_THREAD_S1_RA(a4)
 	REG_L s2,  TASK_THREAD_S2_RA(a4)
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 4bf6c449d78b..27d134ee754f 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -42,7 +42,7 @@ ENTRY(_start)
 	/* Image load offset (0MB) from start of RAM for M-mode */
 	.dword 0
 #else
-#if __riscv_xlen == 64
+#ifdef CONFIG_64BIT
 	/* Image load offset(2MB) from start of RAM */
 	.dword 0x200000
 #else
@@ -75,7 +75,7 @@ relocate_enable_mmu:
 	/* Relocate return address */
 	la a1, kernel_map
 	XIP_FIXUP_OFFSET a1
-	REG_L a1, KERNEL_MAP_VIRT_ADDR(a1)
+	PTR_L a1, KERNEL_MAP_VIRT_ADDR(a1)
 	la a2, _start
 	sub a1, a1, a2
 	add ra, ra, a1
@@ -346,8 +346,8 @@ clear_bss_done:
 	 */
 .Lwait_for_cpu_up:
 	/* FIXME: We should WFI to save some energy here. */
-	REG_L sp, (a1)
-	REG_L tp, (a2)
+	PTR_L sp, (a1)
+	PTR_L tp, (a2)
 	beqz sp, .Lwait_for_cpu_up
 	beqz tp, .Lwait_for_cpu_up
 	fence
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
