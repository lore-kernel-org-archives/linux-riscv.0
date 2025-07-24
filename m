Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098E2C87FCA
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 23:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjyyBc+OgRs7iHohKKB+tYDZ64I0nOoSZ8t8aLrrJVE=; b=HGu0by+1RrM5Oa
	l2BLFz+oqu1I8mQg5jYzNjUHx2x1ekg1Z/KKEy/VHq+qyWT7w3QdnsEJAQYOGyTMptSYJomuYtWvE
	cpBmx3cTtensPR8zKzLr7Dq14D4TantwF0dTAfQmxy3QBQipxZDuUI+2JdO7+LwaFX9bhJ5nX03k5
	dMFDSFGIE5frbDWXrejMolliZYvYwiBTk+k3sNsYJRUXBnLuGPlyIpfPLQyhneDuJaUBdBVTMX8j9
	buxPpJukKP6kCTaT6wyVxvn4qOimqdZBHdQwneg8g+2P40NVmzwCdIQJ3+Jbh+h0VCARmQTtQUzPo
	BE5c1rdsRRM7brPstjjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5f8-00000008iEr-3JNj;
	Thu, 24 Jul 2025 23:47:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5VC-00000008h5k-3viO
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Jul 2025 23:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cR/QY88sdxyw3B/3rrgSlLa8+7hhea91nQDWrYR/AlU=; b=IVk9EhIUthM/6kkoQZ3vnf+yC/
	HJWd6gIi8ItUMUE6Y5HKq5LCf1JFI+9GH6qWn8QzR/JHB2z96+1+BG8JU103NqsvbSLeK0o1TA2Lt
	wrZnzXEIAb1sQDghGTBTx9F6vHjmNCWwes87P88DXCuv1bm+xAICHPI21dOJkGxKc9/FVh+1L8zw6
	OQqRi996XVpe77Z6CXaGtJiO++0EVPjhXKDr24cfAHKIj7sSd6eJuvyRbJcvSH/nI7+KaYRGb1ykh
	68QFJ6mA0OMGuj6WRwjl1L3h/yExGooLRQAi7ca0X+jkHWeaTBplYQVc0Ju9hSdDNDO+8Z2YZu9nb
	TI8Osj1Q==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5V9-0000000BipQ-3Ogz
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 23:37:29 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2363616a1a6so12511135ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 16:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400246; x=1754005046; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cR/QY88sdxyw3B/3rrgSlLa8+7hhea91nQDWrYR/AlU=;
        b=b+UGILFZmlR+8VaiG/Wxp0x0bvu/BGDTIsrWW3Oq9ohLLUokuVXOIuMYm6XWGYkJHa
         ZFrT7s8MhlPVUKi09pRygcIFx0XqAl+M2n3XWOXlfaCOd109wc0H2l51Z6fE4gEzFdkB
         jYEJEsIAvDij8PxCmysLme9STlG9rVxaZBZEL03O1YEPCZtyuKRTWLXXd6Zwxwa+LZvM
         FZbAPNIsIgA1dT+oX4oei3fE3kI4/SplS3qRam/Llcoks8lEd8afRCgNZDky+e4ttYNy
         vOccQDZGfNToizExxiZqHkaCBWt3OKbmH1jNo6ku0xKfJLsGiVafmNebzBNqi6z2hpWY
         Adaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400246; x=1754005046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cR/QY88sdxyw3B/3rrgSlLa8+7hhea91nQDWrYR/AlU=;
        b=GTbyRL+zXa4E5NiujEw4+2kQYZRjQsbyyxQT1ODOKCL6jZOp3I8QeTV+o6Qt5mvdTX
         GComAJxqVOs+X+f93VU8E+vB3wGIlA5EQD3J1OetM4oNbexs6SeA/gvrH9sMBOj1LAfB
         9x4Wnk+hnD12MSBygQOR1o0F48tTi+fADTzRlqXYlNfggDutmqmbZyS13ohSkIah7BEa
         PwuT+dsqCri0v0vOkMFhsyasGgbC4mzyvGCwKcxfvILu2+kRgxzTZZ5n4jqmOh1AGCkT
         4WqlgXOk2qFmUXvocVzCz5XCrlTf24fboacA1nSXU56aXYzD8E9a34rG3VPCYd8M6OD5
         LOdQ==
X-Gm-Message-State: AOJu0Yzv7d1f0Ni2kZBsEQJYDoOLPmeFx8W27ReqbHFKnjsT7UIasuix
	EbRvBhriJSrBPYWF/7Ki3VNREy9ADLTnWBQVh1oK+3R0Z85EX6Z2wh9UnZqVe+5bCUE=
X-Gm-Gg: ASbGnctStZuqDtvKI+mzeJNlN/UQiti6c4cMI2CpcB4i7SQgsRCD1BllsbMKvGMbXgn
	vbeEq83AvZi/zp8U1pPESGHWJKTmv3s065ZM2WDVcdfehlJ4fVYPQ2mGevh/SU270/wpoFwY+9Q
	28nDrCyKISuZUs9e0Pt3ZotYlBlhN7Rqy7b4NUVT3LCdY9B/+RrcCZjBNTeRxhzLbNUrAPa++Ig
	iV6sMp6AkyfVgz9swBYd0NuQzyudQhLAGg3/exoSYzlsR8ycfP+7EX73ibZEFJomWn8UJKbAmdE
	O5vvqeS06OsVV3dvH9+EeXVlVrxa6mo/7tUyT+coITDS8eX/iOrEcZmlxKQXoyqPfmuTcyACm4a
	djzfwdZswRRd0AitJ5CN6tKgo/pykyQsr
X-Google-Smtp-Source: AGHT+IFpPmZfsrgw5MGLmfyvQ9TeyCoMqEZ9ePbdOyQJB+JX01/i58SgR22VLSNFSyWsuZBztHnwLA==
X-Received: by 2002:a17:902:ce01:b0:235:1706:2002 with SMTP id d9443c01a7336-23f98083375mr117426355ad.0.1753400245784;
        Thu, 24 Jul 2025 16:37:25 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:25 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:37:02 -0700
Subject: [PATCH 09/11] riscv: scs: add hardware shadow stack support to scs
MIME-Version: 1.0
Message-Id: <20250724-riscv_kcfi-v1-9-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_003728_343889_E52D2FA2 
X-CRM114-Status: GOOD (  15.28  )
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

Adding support for hardware support for shadow call stack on riscv. This
patch enables scs_* macros to use zicfiss shadow stack pointer (CSR_SSP)
instead of relying on `gp`.

Since zicfiss based shadow stack needs to have correct encoding set in PTE
init shadow stack can't be established too early. It has to be setup after
`setup_vm` is called. Thus `scs_load_init_stack` is noped out if
CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK is not selected.

Adds `arch_scs_store` that can be used in generic scs magic store routine.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/asm.h |  2 +-
 arch/riscv/include/asm/scs.h | 48 +++++++++++++++++++++++++++++++++++---------
 arch/riscv/kernel/entry.S    | 14 ++++++-------
 arch/riscv/kernel/head.S     |  4 ++--
 4 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index a8a2af6dfe9d..256aff523dd4 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -110,7 +110,7 @@
 	REG_L \dst, 0(\dst)
 .endm
 
-#ifdef CONFIG_SHADOW_CALL_STACK
+#if defined(CONFIG_SHADOW_CALL_STACK) && !defined(CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK)
 /* gp is used as the shadow call stack pointer instead */
 .macro load_global_pointer
 .endm
diff --git a/arch/riscv/include/asm/scs.h b/arch/riscv/include/asm/scs.h
index 0e45db78b24b..e70e6ef14bc5 100644
--- a/arch/riscv/include/asm/scs.h
+++ b/arch/riscv/include/asm/scs.h
@@ -9,46 +9,76 @@
 
 /* Load init_shadow_call_stack to gp. */
 .macro scs_load_init_stack
+#ifndef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
 	la	gp, init_shadow_call_stack
 	XIP_FIXUP_OFFSET gp
+#endif
 .endm
 
 /* Load the per-CPU IRQ shadow call stack to gp. */
-.macro scs_load_irq_stack tmp
+.macro scs_load_irq_stack tmp tmp1
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
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
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
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
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
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
 
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+#define arch_scs_store(ss_addr, magic_val)	do {				\
+	asm volatile ("ssamoswap.d %0, %2, %1"					\
+					: "=r" (magic_val), "+A" (*ss_addr)	\
+					: "r" (magic_val)			\
+					: "memory");				\
+	} while (0)
+#else
+#define arch_scs_store(ss_addr, magic_val) do {} while (0)
+#endif
+
 #endif /* _ASM_SCS_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 3f0890b9c0b9..800a5ab763af 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -199,7 +199,7 @@ SYM_CODE_START(handle_exception)
 	load_global_pointer
 
 	/* Load the kernel shadow call stack pointer if coming from userspace */
-	scs_load_current_if_task_changed s5
+	scs_load_current_if_task_changed s5 t0
 
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 	move a0, sp
@@ -260,7 +260,7 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	REG_S s0, TASK_TI_KERNEL_SP(tp)
 
 	/* Save the kernel shadow call stack pointer */
-	scs_save_current
+	scs_save_current t0
 
 	/*
 	 * Save TP into the scratch register , so we can find the kernel data
@@ -382,8 +382,8 @@ SYM_FUNC_START(call_on_irq_stack)
 	addi	s0, sp, STACKFRAME_SIZE_ON_STACK
 
 	/* Switch to the per-CPU shadow call stack */
-	scs_save_current
-	scs_load_irq_stack t0
+	scs_save_current t0
+	scs_load_irq_stack t0 t1
 
 	/* Switch to the per-CPU IRQ stack and call the handler */
 	load_per_cpu t0, irq_stack_ptr, t1
@@ -393,7 +393,7 @@ SYM_FUNC_START(call_on_irq_stack)
 	jalr	a1
 
 	/* Switch back to the thread shadow call stack */
-	scs_load_current
+	scs_load_current t0
 
 	/* Switch back to the thread stack and restore ra and s0 */
 	addi	sp, s0, -STACKFRAME_SIZE_ON_STACK
@@ -440,7 +440,7 @@ SYM_FUNC_START(__switch_to)
 	REG_S s0, TASK_THREAD_SUM_RA(a3)
 
 	/* Save the kernel shadow call stack pointer */
-	scs_save_current
+	scs_save_current t0
 	/* Restore context from next->thread */
 	REG_L s0,  TASK_THREAD_SUM_RA(a4)
 	li    s1,  SR_SUM
@@ -463,7 +463,7 @@ SYM_FUNC_START(__switch_to)
 	/* The offset of thread_info in task_struct is zero. */
 	move tp, a1
 	/* Switch to the next shadow call stack */
-	scs_load_current
+	scs_load_current t0
 	ret
 SYM_FUNC_END(__switch_to)
 
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 59af044bf85c..366e15a9280a 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -184,7 +184,7 @@ secondary_start_sbi:
 	REG_S a0, (a1)
 1:
 #endif
-	scs_load_current
+	scs_load_current t0
 
 #if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
 	li a7, SBI_EXT_FWFT
@@ -367,7 +367,7 @@ SYM_CODE_START(_start_kernel)
 	REG_S a0, (a1)
 1:
 #endif
-	scs_load_current
+	scs_load_current t0
 
 #if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
 	li a7, SBI_EXT_FWFT

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
