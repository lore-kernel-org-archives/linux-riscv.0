Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276E7CCD185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdYBtQj2NnGakXVl/KexEL4yDrKN2aGFIVpNVRpHd/A=; b=DL3CoZ7EwZZEbO
	sSkAIlaU50glvy8rL10g0lmedbWVHWvYbBOa/CxmRhF5tKMfFN55Ef9VmAHuKExzFVNrIjnsCp5w+
	u9W09sS5D5glyXKSlEY/isKblft7H1qN+OX+oXwXjb/usxMqmskd0263R842Wgw1COJ3oRup06gvu
	bkiUR0PODiUsRGMhYeQwb/qQPT2qT5urMO7CuCh+0tchPC5zha4rtP1nxjLvZG+cSkZzNCUMi3sXb
	uNHLUruxd00KQvwGVnQ15euo+tNcdiavmVCXu2di9FeyO8GegvVOdCrofkfw2l4m19CY606EbIQsP
	2/4hThCM6SqfRl0dd6xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9613-00000002XWl-1A8B;
	Wed, 15 Oct 2025 18:14:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9610-00000002XRH-2u3h
	for linux-riscv@bombadil.infradead.org;
	Wed, 15 Oct 2025 18:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hPN39yC27jDQNku8S8KBbMUIjGDGL61HkDgx51sdOyA=; b=qnLBGGRWumwVSs/wEznFV3Qmcq
	mw2DIcKphWJ1nIsx3AIblo+J6A8KLzX3uBkCqMiRc0QQJmTatri3VPyjGmypUFrv0oHQoAr0ydPnY
	EbMIv+d7xvWolMTmZwuS50yK37K61RkRwW7TpNwgn0ipV6E5jCCLvMEtGhre3dhwjP7vSJSMiI4RQ
	Rf0iL5lBNH2pQHCO6X38QoqRpo9g00CtI6t52W/pRsI6shdGqpDp8ymGMnO5K+qNsviE44hfSV8oT
	PP4lscLEHke0GWYg1TgzcFn2XYAwjeEwvUMEvGT5QZH3BsQOneus220BZKf54T7Phw+imNnV3GSqL
	5LNPq23g==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960w-000000066ET-0G3N
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:14:21 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-77f343231fcso4384534b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 11:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552056; x=1761156856; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPN39yC27jDQNku8S8KBbMUIjGDGL61HkDgx51sdOyA=;
        b=bigyE6M0BYPGBlVgVl+JXT2qHwtu6NR3M0+ROWyEOMaMuWTGck9mGdn3Zhc0XVMhgj
         jcWvNjEiwIyjLZuCbxn4Yg4vDA5b74EgEjxjJnG0z3ULQekRLv+xdC3tIPrenGJD+ZZx
         KdnZpAO4JUH7L8vaNPUujGlayHsb7nTOij/s5eZ7noAhwXy5zYcAAba7xNxzV0DufuxK
         jbBAqKF4mAqqthyrUcqCn49qFKEGUQy66RzbA79l1LlaLYrq27tvQT/uwfhmmfg1vota
         FYi3OTvsK2dqg+rBMfkNFtBoZvSR1SIzcrt4ccR9H5CMXP2K5oZVFx1jxzDOP1wayFZV
         MMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552056; x=1761156856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPN39yC27jDQNku8S8KBbMUIjGDGL61HkDgx51sdOyA=;
        b=dQMIhQqSdAMBSoltv9e688SpNT3C3Y87718X8Vklpy7l49pPhoyFUIP8EfNk97Wfct
         ppmFj1lYhVUzUZg5xGz+D1ExFsAKI9GikJTjqzQzpt4M5rsL4iv4GRHr4y7tQsSNwDDW
         H8UBFjM84xzPpz26qT/4JUs0ML2/3zx3Ah+R67VJ4HFQL1uAK981ViqQi/LmIkMq5HV1
         Q5wO/QgKXeOmLIXRKoR6xj2rD2A+6jSodOMSXkN5gtQYeUP2OCvOgm469IVrhU7KEEjq
         nnB+lRD//WZQryYuNHGv1c8SkiIIhlX72BurKBHpY0Hs1aSN8cy2QCpcIaU2PGiaxguv
         Zfew==
X-Forwarded-Encrypted: i=1; AJvYcCUTc547SVbL/LxlANpTnrtvg88qc/ZbRF69weYcpWcTWPF55ROTTaXLzf75G9mritdGafwlD4fw7lT1NQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMlWeM+MeWjMfAM195d2DjmQZDVk4A+Lg729FJxs+zMNdUN+GA
	LvFdWatl703vh9MDg3i5fjMJbafnhm3aL7YGO1aAYmYH0xgJKVlO2BAj7JgxKzBxf9M=
X-Gm-Gg: ASbGnct+YL9OlAc5z0bPP3FbT/BpQjH6Ird6sBRY8SrIDMSIEbqyCpvOL7vC2tA86qv
	xNhqJgMS0nLgmtTg8dlP/UhJz/No/UB2XEJgNuFDIGwLQFVcrUYZGrjDMlF6eys2PibY0SR7r7n
	h3px/lrCSJFlASqSb1AaeIeePgbYCQMiPQG0f++sNgjCdlC9SvKzFm29yW3ScoLVvRwGj8AN5Ya
	XncFCvFgALhkk6j8uBVXEkHYwwzfqm9zPRLFqswG5fTn0XHhagX/H/sHhUCxqav3ipER5E9Gqv1
	zsk+8yJAWO1Sspug/1s7kp9kXUTnb+IdX6tyLENTB8GaYSjhOB7NZEPODGKBmt+xnapOeBFmXC8
	CzM8s99FdtP4zN7OUFXGxxvH7n5JWfQVzvKqe1R7yoY5l5BBqijyrWt0oyNWDnT4Fq5Zh9WXnUj
	NSFzvv8SJchViP5Sl04hzZ
X-Google-Smtp-Source: AGHT+IG4LjfUDohZLnLSo7lCYfj2WTS2/5mQ4d3B6uwh0g3AMw9ydijD1oq4L6QlSNqNyXKLM/ozHg==
X-Received: by 2002:a17:903:247:b0:266:3098:666 with SMTP id d9443c01a7336-290273449c5mr307286085ad.32.1760552055799;
        Wed, 15 Oct 2025 11:14:15 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:14:15 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:46 -0700
Subject: [PATCH v21 14/28] riscv: Implements arch agnostic indirect branch
 tracking prctls
MIME-Version: 1.0
Message-Id: <20251015-v5_user_cfi_series-v21-14-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
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
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
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
X-CRM114-CacheID: sfid-20251015_191418_710536_03CF6DBF 
X-CRM114-Status: GOOD (  18.14  )
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

prctls implemented are:
PR_SET_INDIR_BR_LP_STATUS, PR_GET_INDIR_BR_LP_STATUS and
PR_LOCK_INDIR_BR_LP_STATUS

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/usercfi.h | 14 +++++++
 arch/riscv/kernel/entry.S        |  4 ++
 arch/riscv/kernel/process.c      |  5 +++
 arch/riscv/kernel/usercfi.c      | 79 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+)

diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index d71093f414df..4501d741a609 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -16,6 +16,8 @@ struct kernel_clone_args;
 struct cfi_state {
 	unsigned long ubcfi_en : 1; /* Enable for backward cfi. */
 	unsigned long ubcfi_locked : 1;
+	unsigned long ufcfi_en : 1; /* Enable for forward cfi. Note that ELP goes in sstatus */
+	unsigned long ufcfi_locked : 1;
 	unsigned long user_shdw_stk; /* Current user shadow stack pointer */
 	unsigned long shdw_stk_base; /* Base address of shadow stack */
 	unsigned long shdw_stk_size; /* size of shadow stack */
@@ -32,6 +34,10 @@ bool is_shstk_locked(struct task_struct *task);
 bool is_shstk_allocated(struct task_struct *task);
 void set_shstk_lock(struct task_struct *task);
 void set_shstk_status(struct task_struct *task, bool enable);
+bool is_indir_lp_enabled(struct task_struct *task);
+bool is_indir_lp_locked(struct task_struct *task);
+void set_indir_lp_status(struct task_struct *task, bool enable);
+void set_indir_lp_lock(struct task_struct *task);
 
 #define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK (PR_SHADOW_STACK_ENABLE)
 
@@ -57,6 +63,14 @@ void set_shstk_status(struct task_struct *task, bool enable);
 
 #define set_shstk_status(task, enable) do {} while (0)
 
+#define is_indir_lp_enabled(task) false
+
+#define is_indir_lp_locked(task) false
+
+#define set_indir_lp_status(task, enable) do {} while (0)
+
+#define set_indir_lp_lock(task) do {} while (0)
+
 #endif /* CONFIG_RISCV_USER_CFI */
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 8410850953d6..036a6ca7641f 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -174,6 +174,10 @@ SYM_CODE_START(handle_exception)
 	 * or vector in kernel space.
 	 */
 	li t0, SR_SUM | SR_FS_VS
+#ifdef CONFIG_64BIT
+	li t1, SR_ELP
+	or t0, t0, t1
+#endif
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index a137d3483646..49f527e3acfd 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -163,6 +163,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	set_shstk_status(current, false);
 	set_shstk_base(current, 0, 0);
 	set_active_shstk(current, 0);
+	/*
+	 * disable indirect branch tracking on exec.
+	 * libc will enable it later via prctl.
+	 */
+	set_indir_lp_status(current, false);
 
 #ifdef CONFIG_64BIT
 	regs->status &= ~SR_UXL;
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 08620bdae696..2ebe789caa6b 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -72,6 +72,35 @@ void set_shstk_lock(struct task_struct *task)
 	task->thread_info.user_cfi_state.ubcfi_locked = 1;
 }
 
+bool is_indir_lp_enabled(struct task_struct *task)
+{
+	return task->thread_info.user_cfi_state.ufcfi_en;
+}
+
+bool is_indir_lp_locked(struct task_struct *task)
+{
+	return task->thread_info.user_cfi_state.ufcfi_locked;
+}
+
+void set_indir_lp_status(struct task_struct *task, bool enable)
+{
+	if (!cpu_supports_indirect_br_lp_instr())
+		return;
+
+	task->thread_info.user_cfi_state.ufcfi_en = enable ? 1 : 0;
+
+	if (enable)
+		task->thread.envcfg |= ENVCFG_LPE;
+	else
+		task->thread.envcfg &= ~ENVCFG_LPE;
+
+	csr_write(CSR_ENVCFG, task->thread.envcfg);
+}
+
+void set_indir_lp_lock(struct task_struct *task)
+{
+	task->thread_info.user_cfi_state.ufcfi_locked = 1;
+}
 /*
  * If size is 0, then to be compatible with regular stack we want it to be as big as
  * regular stack. Else PAGE_ALIGN it and return back
@@ -371,3 +400,53 @@ int arch_lock_shadow_stack_status(struct task_struct *task,
 
 	return 0;
 }
+
+int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+{
+	unsigned long fcfi_status = 0;
+
+	if (!cpu_supports_indirect_br_lp_instr())
+		return -EINVAL;
+
+	/* indirect branch tracking is enabled on the task or not */
+	fcfi_status |= (is_indir_lp_enabled(t) ? PR_INDIR_BR_LP_ENABLE : 0);
+
+	return copy_to_user(status, &fcfi_status, sizeof(fcfi_status)) ? -EFAULT : 0;
+}
+
+int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
+{
+	bool enable_indir_lp = false;
+
+	if (!cpu_supports_indirect_br_lp_instr())
+		return -EINVAL;
+
+	/* indirect branch tracking is locked and further can't be modified by user */
+	if (is_indir_lp_locked(t))
+		return -EINVAL;
+
+	/* Reject unknown flags */
+	if (status & ~PR_INDIR_BR_LP_ENABLE)
+		return -EINVAL;
+
+	enable_indir_lp = (status & PR_INDIR_BR_LP_ENABLE);
+	set_indir_lp_status(t, enable_indir_lp);
+
+	return 0;
+}
+
+int arch_lock_indir_br_lp_status(struct task_struct *task,
+				 unsigned long arg)
+{
+	/*
+	 * If indirect branch tracking is not supported or not enabled on task,
+	 * nothing to lock here
+	 */
+	if (!cpu_supports_indirect_br_lp_instr() ||
+	    !is_indir_lp_enabled(task) || arg != 0)
+		return -EINVAL;
+
+	set_indir_lp_lock(task);
+
+	return 0;
+}

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
