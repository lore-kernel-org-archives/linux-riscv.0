Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D017C3ABB6
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 23:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usVvj4vnwawzIzEJKKN3Hdd5qSOJ6VM5e10jjcHB8iQ=; b=AqYbzD7Qtl3RCj
	HlmIzGV/4t5n4xlwcgpviNftyOiVV/wBhoPFs2RXJLw9TI+IaYe01W67rrekHpJFeB14mmGor9Wxx
	iAsHlHhlHDkxsJsMSXEzr7nKqQVvl+rqjvxFVZAShIfR5gdXpi0Q8DXxtS4Kz0HzbMMkBY+PpG+U/
	3GRt/6OUFngE3mC6/FVXPtVVXl5g06i5PMFJXgtdEyjzifMIdoQ3cc8OUAR0BQrZ8QzeyZDBo4NbR
	+B6CBs4F8e6dTzdZ57TdrKhS4CwUtLBTMQt4bcbH4l+NxHnW7rjT/+rWweWoH6hS0poax+r6MUAby
	MG6U29or4hFFk8th79ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzqf-00000003Ejj-3yJI;
	Fri, 02 May 2025 23:31:17 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzqc-00000003Ee4-2Ja8
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 23:31:15 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22c33677183so31468505ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 16:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746228674; x=1746833474; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZxLHlD3l8KQyqfBm0pNowD5Eu+jDmaJ7iNXDIvukjQ=;
        b=kMV+fSc+W+/GhKUIi3eNmwq9bTbV+sJ3ppNf1oKDApgR4Lz0NHch1uLz/mZyRmZASO
         g6bFVSuNfydeqHAjA8oB4d0UEtI+Ph5Cl63QPq3/r6n6ARg9KEZLfCDMoz2RF9lcAIk9
         gYHUNx1qpp/juEyluLEl80Uy+opzOZfO7ceXEwbdleHQLsfakn3OQWvEdWVPGwxeH6zT
         1pKzJpiZI2yHewZSugYpm4rXsV/bEj+dc8l6h5wLUMxTRTEIn6daNSQYG/l/boj9AweG
         hCH/lKUpAJCOVL9xOFezI0xVZGvGSi073/TUhCsLS70G3/ZDPZd8jFLDNF+KORsM95np
         zVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746228674; x=1746833474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZxLHlD3l8KQyqfBm0pNowD5Eu+jDmaJ7iNXDIvukjQ=;
        b=tLvYnCVWDjJtcV0thKqWz1uKa5DvzdQQCHKnL04ffws6tTpdF/fJRirFeS6kh+JWWF
         GlotfMHk668uugJng2gwslzFoPdp38ybJaHBqfMaMaqc2WDOUUuAM5jODFsaXxU70Xbt
         G8eDknxqDXPv4oa8X9QGCFU2j3dEGH1oS19HQ/qi9pPZmwWZqMt1mbBhpTGVPAdl3KXH
         zK6qa12VNaWcqCRulvMrDnMFmb3/wUFMNqnC1fP+8hBrS4lLzj4LIzi09j4XDxN6S/jD
         R/oahsDvSBa8RGb0KxSl/XEv5a+vLcafx/i+nI68Kx1zOF4/mBzijHWfq3/daq1f6XhH
         Gjqw==
X-Forwarded-Encrypted: i=1; AJvYcCXVutm4l79uz5uK2g9TDwJv4VSF3OhGVEqra4ANk+UibkK029KHHMIING8L9zGj4EeTLrJ4LIIrINHABg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPGQ6e4iUsSpOTWLTqqFfmm3NoTVh+tipAL6mEMkOfNx27/apW
	TbxLRBh2j4uRNL+v+bhiT6oFa0hkfKNS6j2jlNzuptQwEPSRrDKDc37JctEqct4=
X-Gm-Gg: ASbGnctGN+qAMWvwR1QnVW9leD4uc8Z/F0Q4mJvruQSe0/vDGRwJ4JJTUWhkGqjljtH
	4DiKu9VXxxVeogNVE11khUROsSQxHcVFUUHT6DBlr1Nory8w9N8jUgVjT+iStFsxkGBzbV9SCaB
	5Yo4KEDJwyWr/zkKu+vL4TS6icbjj1R+tDAg1v7sUpAuc89DTPqQMJ5DvusRe0yYaoc/A/UZG56
	TeXfjwSRUDVP0h6Fkyptm8RfewHUzUSNw1khvKNSghSdNqURSDmv0ROuGz5AdAgH3VCfEGpa1Ty
	9YzBIptRuux6T795Rsp+zxDzbGPO+MR6E/veMPSVxdW+Qmiqy0Q=
X-Google-Smtp-Source: AGHT+IH6Yx91iuhur92AN2GOlMEPIHJ9ZcMog1MRjdlhEHD4xYMUjwVSvl1TETNNJMsOBZCBhk/Zgw==
X-Received: by 2002:a17:902:f60a:b0:220:ca08:8986 with SMTP id d9443c01a7336-22e103698e4mr83436295ad.22.1746228673946;
        Fri, 02 May 2025 16:31:13 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:31:13 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:42 -0700
Subject: [PATCH v15 11/27] riscv/shstk: If needed allocate a new shadow
 stack on clone
MIME-Version: 1.0
Message-Id: <20250502-v5_user_cfi_series-v15-11-914966471885@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_163114_606953_371BE75C 
X-CRM114-Status: GOOD (  29.87  )
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

Userspace specifies CLONE_VM to share address space and spawn new thread.
`clone` allow userspace to specify a new stack for new thread. However
there is no way to specify new shadow stack base address without changing
API. This patch allocates a new shadow stack whenever CLONE_VM is given.

In case of CLONE_VFORK, parent is suspended until child finishes and thus
can child use parent shadow stack. In case of !CLONE_VM, COW kicks in
because entire address space is copied from parent to child.

`clone3` is extensible and can provide mechanisms using which shadow stack
as an input parameter can be provided. This is not settled yet and being
extensively discussed on mailing list. Once that's settled, this commit
will adapt to that.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/mmu_context.h |   7 ++
 arch/riscv/include/asm/usercfi.h     |  25 ++++++++
 arch/riscv/kernel/process.c          |   9 +++
 arch/riscv/kernel/usercfi.c          | 120 +++++++++++++++++++++++++++++++++++
 4 files changed, 161 insertions(+)

diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index 8c4bc49a3a0f..dbf27a78df6c 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -48,6 +48,13 @@ static inline unsigned long mm_untag_mask(struct mm_struct *mm)
 }
 #endif
 
+#define deactivate_mm deactivate_mm
+static inline void deactivate_mm(struct task_struct *tsk,
+				 struct mm_struct *mm)
+{
+	shstk_release(tsk);
+}
+
 #include <asm-generic/mmu_context.h>
 
 #endif /* _ASM_RISCV_MMU_CONTEXT_H */
diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index 94b214c295c0..0581587490c2 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -8,6 +8,9 @@
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
 
+struct task_struct;
+struct kernel_clone_args;
+
 #ifdef CONFIG_RISCV_USER_CFI
 struct cfi_state {
 	unsigned long ubcfi_en : 1; /* Enable for backward cfi. */
@@ -16,6 +19,28 @@ struct cfi_state {
 	unsigned long shdw_stk_size; /* size of shadow stack */
 };
 
+unsigned long shstk_alloc_thread_stack(struct task_struct *tsk,
+				       const struct kernel_clone_args *args);
+void shstk_release(struct task_struct *tsk);
+void set_shstk_base(struct task_struct *task, unsigned long shstk_addr, unsigned long size);
+unsigned long get_shstk_base(struct task_struct *task, unsigned long *size);
+void set_active_shstk(struct task_struct *task, unsigned long shstk_addr);
+bool is_shstk_enabled(struct task_struct *task);
+
+#else
+
+#define shstk_alloc_thread_stack(tsk, args) 0
+
+#define shstk_release(tsk)
+
+#define get_shstk_base(task, size) 0UL
+
+#define set_shstk_base(task, shstk_addr, size)
+
+#define set_active_shstk(task, shstk_addr)
+
+#define is_shstk_enabled(task) false
+
 #endif /* CONFIG_RISCV_USER_CFI */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 7c244de77180..99acb6342a37 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -29,6 +29,7 @@
 #include <asm/vector.h>
 #include <asm/cpufeature.h>
 #include <asm/exec.h>
+#include <asm/usercfi.h>
 
 #if defined(CONFIG_STACKPROTECTOR) && !defined(CONFIG_STACKPROTECTOR_PER_TASK)
 #include <linux/stackprotector.h>
@@ -211,6 +212,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	unsigned long clone_flags = args->flags;
 	unsigned long usp = args->stack;
 	unsigned long tls = args->tls;
+	unsigned long ssp = 0;
 	struct pt_regs *childregs = task_pt_regs(p);
 
 	/* Ensure all threads in this mm have the same pointer masking mode. */
@@ -229,11 +231,18 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
 	} else {
+		/* allocate new shadow stack if needed. In case of CLONE_VM we have to */
+		ssp = shstk_alloc_thread_stack(p, args);
+		if (IS_ERR_VALUE(ssp))
+			return PTR_ERR((void *)ssp);
+
 		*childregs = *(current_pt_regs());
 		/* Turn off status.VS */
 		riscv_v_vstate_off(childregs);
 		if (usp) /* User fork */
 			childregs->sp = usp;
+		/* if needed, set new ssp */
+		ssp ? set_active_shstk(p, ssp) : 0;
 		if (clone_flags & CLONE_SETTLS)
 			childregs->tp = tls;
 		childregs->a0 = 0; /* Return value of fork() */
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 0b3bbb41490a..ec3d78efd6f3 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -19,6 +19,41 @@
 
 #define SHSTK_ENTRY_SIZE sizeof(void *)
 
+bool is_shstk_enabled(struct task_struct *task)
+{
+	return task->thread_info.user_cfi_state.ubcfi_en;
+}
+
+void set_shstk_base(struct task_struct *task, unsigned long shstk_addr, unsigned long size)
+{
+	task->thread_info.user_cfi_state.shdw_stk_base = shstk_addr;
+	task->thread_info.user_cfi_state.shdw_stk_size = size;
+}
+
+unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
+{
+	if (size)
+		*size = task->thread_info.user_cfi_state.shdw_stk_size;
+	return task->thread_info.user_cfi_state.shdw_stk_base;
+}
+
+void set_active_shstk(struct task_struct *task, unsigned long shstk_addr)
+{
+	task->thread_info.user_cfi_state.user_shdw_stk = shstk_addr;
+}
+
+/*
+ * If size is 0, then to be compatible with regular stack we want it to be as big as
+ * regular stack. Else PAGE_ALIGN it and return back
+ */
+static unsigned long calc_shstk_size(unsigned long size)
+{
+	if (size)
+		return PAGE_ALIGN(size);
+
+	return PAGE_ALIGN(min_t(unsigned long long, rlimit(RLIMIT_STACK), SZ_4G));
+}
+
 /*
  * Writes on shadow stack can either be `sspush` or `ssamoswap`. `sspush` can happen
  * implicitly on current shadow stack pointed to by CSR_SSP. `ssamoswap` takes pointer to
@@ -141,3 +176,88 @@ SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsi
 
 	return allocate_shadow_stack(addr, aligned_size, size, set_tok);
 }
+
+/*
+ * This gets called during clone/clone3/fork. And is needed to allocate a shadow stack for
+ * cases where CLONE_VM is specified and thus a different stack is specified by user. We
+ * thus need a separate shadow stack too. How does separate shadow stack is specified by
+ * user is still being debated. Once that's settled, remove this part of the comment.
+ * This function simply returns 0 if shadow stack are not supported or if separate shadow
+ * stack allocation is not needed (like in case of !CLONE_VM)
+ */
+unsigned long shstk_alloc_thread_stack(struct task_struct *tsk,
+				       const struct kernel_clone_args *args)
+{
+	unsigned long addr, size;
+
+	/* If shadow stack is not supported, return 0 */
+	if (!cpu_supports_shadow_stack())
+		return 0;
+
+	/*
+	 * If shadow stack is not enabled on the new thread, skip any
+	 * switch to a new shadow stack.
+	 */
+	if (!is_shstk_enabled(tsk))
+		return 0;
+
+	/*
+	 * For CLONE_VFORK the child will share the parents shadow stack.
+	 * Set base = 0 and size = 0, this is special means to track this state
+	 * so the freeing logic run for child knows to leave it alone.
+	 */
+	if (args->flags & CLONE_VFORK) {
+		set_shstk_base(tsk, 0, 0);
+		return 0;
+	}
+
+	/*
+	 * For !CLONE_VM the child will use a copy of the parents shadow
+	 * stack.
+	 */
+	if (!(args->flags & CLONE_VM))
+		return 0;
+
+	/*
+	 * reaching here means, CLONE_VM was specified and thus a separate shadow
+	 * stack is needed for new cloned thread. Note: below allocation is happening
+	 * using current mm.
+	 */
+	size = calc_shstk_size(args->stack_size);
+	addr = allocate_shadow_stack(0, size, 0, false);
+	if (IS_ERR_VALUE(addr))
+		return addr;
+
+	set_shstk_base(tsk, addr, size);
+
+	return addr + size;
+}
+
+void shstk_release(struct task_struct *tsk)
+{
+	unsigned long base = 0, size = 0;
+	/* If shadow stack is not supported or not enabled, nothing to release */
+	if (!cpu_supports_shadow_stack() || !is_shstk_enabled(tsk))
+		return;
+
+	/*
+	 * When fork() with CLONE_VM fails, the child (tsk) already has a
+	 * shadow stack allocated, and exit_thread() calls this function to
+	 * free it.  In this case the parent (current) and the child share
+	 * the same mm struct. Move forward only when they're same.
+	 */
+	if (!tsk->mm || tsk->mm != current->mm)
+		return;
+
+	/*
+	 * We know shadow stack is enabled but if base is NULL, then
+	 * this task is not managing its own shadow stack (CLONE_VFORK). So
+	 * skip freeing it.
+	 */
+	base = get_shstk_base(tsk, &size);
+	if (!base)
+		return;
+
+	vm_munmap(base, size);
+	set_shstk_base(tsk, 0, 0);
+}

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
