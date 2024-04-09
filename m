Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65EBC67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 06:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wW5OCQgZpk1MF6UxTZh58PIp1oUcgRAYMLO9FIRIE+Y=; b=MjzodPYS8E0rcA
	WlR5OOzXrknZxH4nxO81ikU1Q9c3FLhtPoqQmt5IJGpjHKaSE7ecHeS2RVVgVZ8/NQTEeNXHwVhm4
	qfhGYjOjYrBv4x/qw4T2oAZmdl0+p6vE/Bjhsqqu3jtpNClTjA3QBlSbn6Lc6ccfSvpSpXqOFtqXB
	BWIg4fhQq7XeU1X5sA/T8PgsDxS769vF+kA4hsq38UxNc9p7BCAxvoPjT5z9dPyl6XlSOa/Nk4e7G
	cwYGyAydTA1ozKyFX1nlT8bXpDi79le3iTrFy86uZ8hD6VGmoJKi3H217638zxUBCN4nXgqSQeUm2
	/nZal0ZXzLJ4bN7dtwtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4im-00000000WDI-0Zhk;
	Tue, 09 Apr 2024 06:12:40 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iM-00000000Vqp-2tbg
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 06:12:20 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1e3cf5b171eso25670575ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 23:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643133; x=1713247933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3ZLSY0AqamfsiQrC/Hpp5SdyP3hn8vOoLAl1Aa/pao=;
        b=rXJEO0NC9sXQmD/isdRlGpRWehA/FL6yaDHaHzqTU7oO3Pj3N3G4BbFCtv7rDl2wTQ
         05d1fTBxUUUISIf8HT5p+YLsVDZAdOnfJGtQ6nD2baYjFqQzhPIgnKkJaowjDy39/zrn
         W1KIuq2FcJjZDup54AyXJzPcbWb/fGp4sS7JFXoCjEAposZS11dhSj2+U7UqdLVXjV75
         Qut21qgdYDDOwQppkRrmwNawWG2KEjUNSilRx6q/NuId0ITyCScYtbpmSjzjUu0EnxVE
         6SqS6YLBGCJjeoQz1CVL/gbKph8qvK8Y/SDzDt20lnYLc7BmPHcZmhVCruldtwAN+3dd
         mDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643133; x=1713247933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3ZLSY0AqamfsiQrC/Hpp5SdyP3hn8vOoLAl1Aa/pao=;
        b=rGMmymX1lp0inUiM89zFu3fbnYd8MvqRiCRm94Tc7omNZRS5hBUc7JyFbto9bE/Lo2
         Yq9cbv8STy/Vdz92leg+g8nWgP5yTK9tsSl+WR5bCSmT2AP66dwUW0TcHfLEJe5IPrPY
         uNRGNoPAaGwLlNCBhxZBUGWAa9n76qhSYvCoBognwV6qQ6iqaxpIG5PQrPZQg0OoeICg
         a5OHspOtzIkLxEkdCWpoEuJeWvnSHrukfQaUidSepEFUcCWUOAJ8wylWgGPZWmL5iU9D
         I22s/5bL91/Q/QR5qqkRDkeDS8+IkxjBpMP6n7Nh3W0oHR+CU0NCr8bY7Xn8A+hTtGI5
         Tm1A==
X-Gm-Message-State: AOJu0Yz2Lb4fw9UT9VpagmILyqQr6wTdKmsrB9lzMzkMWOIE9Zee4H4v
	CvHg93YCkb96+HtCbJZCJhjsrHv7w+z545ISklGGt4/UPjBfaNMCy+JYi4htuwThG6TpRMk/ZXX
	V
X-Google-Smtp-Source: AGHT+IEVGKcCJZG1Oo2doLnhCyIcfNsPsMnBa+It2mn/MhqRT0TmKqX7+hn0GAGgG+ehwQk8wcH2ow==
X-Received: by 2002:a17:902:eb8f:b0:1e2:7c71:4b92 with SMTP id q15-20020a170902eb8f00b001e27c714b92mr16619040plg.35.1712643133542;
        Mon, 08 Apr 2024 23:12:13 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:13 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH 08/12] riscv: dynamic (zicfiss) shadow call stack support
Date: Mon,  8 Apr 2024 23:10:39 -0700
Message-Id: <20240409061043.3269676-9-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_231215_613334_EF539F3D 
X-CRM114-Status: GOOD (  14.32  )
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

Adding support for dynamic shadow call stack on riscv. zicfiss ISA extn.
enables protection for shadow stack against stray writes. This patch
enables scs_* macros to use zicfiss shadow stack pointer (CSR_SSP) instead
of relying on `gp`.

Since zicfiss based shadow stack needs to have correct encoding set in PTE
init shadow stack can't be established too early. It has to be setup after
`setup_vm` is called. Thus `scs_load_init_stack` is noped out if
CONFIG_DYNAMIC_SCS is selected.

Adds `arch_scs_store` that can be used in generic scs magic store routine.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/asm.h |  2 +-
 arch/riscv/include/asm/scs.h | 47 +++++++++++++++++++++++++++++-------
 arch/riscv/kernel/entry.S    | 14 +++++------
 arch/riscv/kernel/head.S     |  4 +--
 4 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 776354895b81..0304978ea4e4 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -109,7 +109,7 @@
 	REG_L \dst, 0(\dst)
 .endm
 
-#ifdef CONFIG_SHADOW_CALL_STACK
+#if defined(CONFIG_SHADOW_CALL_STACK) && !defined(CONFIG_DYNAMIC_SCS)
 /* gp is used as the shadow call stack pointer instead */
 .macro load_global_pointer
 .endm
diff --git a/arch/riscv/include/asm/scs.h b/arch/riscv/include/asm/scs.h
index 0e45db78b24b..14ef539922c2 100644
--- a/arch/riscv/include/asm/scs.h
+++ b/arch/riscv/include/asm/scs.h
@@ -9,46 +9,75 @@
 
 /* Load init_shadow_call_stack to gp. */
 .macro scs_load_init_stack
+#ifndef CONFIG_DYNAMIC_SCS
 	la	gp, init_shadow_call_stack
 	XIP_FIXUP_OFFSET gp
+#endif
 .endm
 
 /* Load the per-CPU IRQ shadow call stack to gp. */
-.macro scs_load_irq_stack tmp
+.macro scs_load_irq_stack tmp tmp1
+#ifdef CONFIG_DYNAMIC_SCS
+	load_per_cpu \tmp1, irq_shadow_call_stack_ptr, \tmp
+	li \tmp, 4096
+	add \tmp, \tmp, \tmp1
+	csrw CSR_SSP, \tmp
+#else
 	load_per_cpu gp, irq_shadow_call_stack_ptr, \tmp
+#endif
 .endm
 
 /* Load task_scs_sp(current) to gp. */
-.macro scs_load_current
+.macro scs_load_current tmp
+#ifdef CONFIG_DYNAMIC_SCS
+	REG_L	\tmp, TASK_TI_SCS_SP(tp)
+	csrw CSR_SSP, \tmp
+#else
 	REG_L	gp, TASK_TI_SCS_SP(tp)
+#endif
 .endm
 
 /* Load task_scs_sp(current) to gp, but only if tp has changed. */
-.macro scs_load_current_if_task_changed prev
+.macro scs_load_current_if_task_changed prev tmp
 	beq	\prev, tp, _skip_scs
-	scs_load_current
+	scs_load_current \tmp
 _skip_scs:
 .endm
 
 /* Save gp to task_scs_sp(current). */
-.macro scs_save_current
+.macro scs_save_current tmp
+#ifdef CONFIG_DYNAMIC_SCS
+	csrr \tmp, CSR_SSP
+	REG_S	\tmp, TASK_TI_SCS_SP(tp)
+#else
 	REG_S	gp, TASK_TI_SCS_SP(tp)
+#endif
 .endm
 
 #else /* CONFIG_SHADOW_CALL_STACK */
 
 .macro scs_load_init_stack
 .endm
-.macro scs_load_irq_stack tmp
+.macro scs_load_irq_stack tmp tmp1
 .endm
-.macro scs_load_current
+.macro scs_load_current tmp
 .endm
-.macro scs_load_current_if_task_changed prev
+.macro scs_load_current_if_task_changed prev tmp
 .endm
-.macro scs_save_current
+.macro scs_save_current tmp
 .endm
 
 #endif /* CONFIG_SHADOW_CALL_STACK */
 #endif /* __ASSEMBLY__ */
 
+#ifdef CONFIG_DYNAMIC_SCS
+#define arch_scs_store(ss_addr, magic_val)	\
+	asm volatile ("ssamoswap.d %0, %2, %1"	\
+					: "=r" (magic_val), "+A" (*ss_addr)	\
+					: "r" (magic_val)	\
+					: "memory")
+#else
+#define arch_scs_store(ss_addr, magic_val)
+#endif
+
 #endif /* _ASM_SCS_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index a35050a3e0ea..0262b46ab064 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -81,7 +81,7 @@ SYM_CODE_START(handle_exception)
 	load_global_pointer
 
 	/* Load the kernel shadow call stack pointer if coming from userspace */
-	scs_load_current_if_task_changed s5
+	scs_load_current_if_task_changed s5 t0
 
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 	move a0, sp
@@ -135,7 +135,7 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	REG_S s0, TASK_TI_KERNEL_SP(tp)
 
 	/* Save the kernel shadow call stack pointer */
-	scs_save_current
+	scs_save_current t0
 
 	/*
 	 * Save TP into the scratch register , so we can find the kernel data
@@ -252,8 +252,8 @@ SYM_FUNC_START(call_on_irq_stack)
 	addi	s0, sp, STACKFRAME_SIZE_ON_STACK
 
 	/* Switch to the per-CPU shadow call stack */
-	scs_save_current
-	scs_load_irq_stack t0
+	scs_save_current t0
+	scs_load_irq_stack t0 t1
 
 	/* Switch to the per-CPU IRQ stack and call the handler */
 	load_per_cpu t0, irq_stack_ptr, t1
@@ -263,7 +263,7 @@ SYM_FUNC_START(call_on_irq_stack)
 	jalr	a1
 
 	/* Switch back to the thread shadow call stack */
-	scs_load_current
+	scs_load_current t0
 
 	/* Switch back to the thread stack and restore ra and s0 */
 	addi	sp, s0, -STACKFRAME_SIZE_ON_STACK
@@ -305,7 +305,7 @@ SYM_FUNC_START(__switch_to)
 	REG_S s10, TASK_THREAD_S10_RA(a3)
 	REG_S s11, TASK_THREAD_S11_RA(a3)
 	/* Save the kernel shadow call stack pointer */
-	scs_save_current
+	scs_save_current t0
 	/* Restore context from next->thread */
 	REG_L ra,  TASK_THREAD_RA_RA(a4)
 	REG_L sp,  TASK_THREAD_SP_RA(a4)
@@ -324,7 +324,7 @@ SYM_FUNC_START(__switch_to)
 	/* The offset of thread_info in task_struct is zero. */
 	move tp, a1
 	/* Switch to the next shadow call stack */
-	scs_load_current
+	scs_load_current t0
 	ret
 SYM_FUNC_END(__switch_to)
 
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 6c311517c3b5..bc248c137c90 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -164,7 +164,7 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
-	scs_load_current
+	scs_load_current t0
 	lui t2, 0x1
 	tail smp_callin
 #endif /* CONFIG_SMP */
@@ -313,7 +313,7 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
-	scs_load_current
+	scs_load_current t0
 
 #ifdef CONFIG_KASAN
 	call kasan_early_init
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
