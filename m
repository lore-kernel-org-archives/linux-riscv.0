Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8E6D7494E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 00:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Tegwsw3b7xfaBn8L7RhapXxVogfhYpGCcQfaEsz6tM=; b=y2YKoZckZl46Xx
	T8o+2QCC5VQcxrhA2cPQDVDowXA6qLuEIVmHE/Y3mo1NojQh82hi4DimZ5j+V6b0VtZ16LMoz3l3i
	gF/7dPRgElKHkLZnCvVMvZ3w8MpjizaqCczO26TllWXOOZro/JNQnhPF9EScz77NQUNqNMXTTDvHG
	N556XqamxMA9eQ6YFXSK+9z93CmznX9vt8Ev1ikL/28tONSjMQVbnpVhMc7i9i4yaLTyuPoBG7VyO
	3ix9rZQHMuY+goT+UkpdHFEm/TzYpK7sPSNfM410KtL+Qug5ID8muRowBw3EXRLNewmUjWhEHQ4jh
	FTjB4r3gBXvN/mtxK8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5wqI-0000000GMR6-2Q4O;
	Wed, 30 Oct 2024 00:45:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vtf-0000000GDuU-2Gua
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Oct 2024 23:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=KPxKGzxEi/0hgJefbaFEQhmtveG3vMbuHajNfmroGxQ=; b=LelpETy0dJ9Sho+XVV4pQHT7SR
	8pilttKv63aHwuoCoMsdTnwz4bsBYgJ6wzIc9Yea4IEArnynn0EihXG6rHyPjgvVx5mKWRkK7EHXs
	QzgiNNGHyKvlyygauLIzgF7CZwaceS4+Fj6GU2T1dvI6A1djThi8RCekL/zxAXoOvonGNl0rzoqrk
	7CBxgXRor7WS9bP8MGZ2zjlIwfI8Tj4/SvR3zGr4QH4LjJggym6CPiLWLUQiCDxyXmFG4WL0yzy2y
	VYpnI1lOTjxyWBxB9OTYF4kCbTb14rJY93Hm+S1NoQEjvR3/q3RzS+E69G1WlQX8oXCKgCK4AvUA8
	UVK+asVQ==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vtb-0000000B3S8-1v6l
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:45:10 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7205646f9ebso3787672b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245506; x=1730850306; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPxKGzxEi/0hgJefbaFEQhmtveG3vMbuHajNfmroGxQ=;
        b=YZAFkgrVApf2uijBSQViV6n1DqLcgMJTDd7mEPN5xNh95a5X9pSkwpMsAnLLCyeEjy
         N7mZnn3MATCtPD8Na6IFty+FAez7wNXotsWKkkvfdvO0vaUt8wuDSQHKdVNwoTm1w7BC
         V0iPO8XZgX3FRRMIjdKljuU6xbsTEIUUYUTuVbC6nMyX7pxndj8/jptnUuf/Sy1LBBm0
         tGjRDbRivKPxIuFngbD0uAT5IAH95D6D8colv7UinwYrF525ULQHAdgz8vyM+4ennJDx
         LxZCTYVXGnbvCkGsG0rc5FAih+VwxHL0cjrakYQjQZzykAWB4omzq4jMJN7DBD9vfomh
         +oHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245506; x=1730850306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPxKGzxEi/0hgJefbaFEQhmtveG3vMbuHajNfmroGxQ=;
        b=AmYG1QwW/YIGvNT8EhM9yWjICG3918MLzT/+SvY2G+AA7VFeXt4MN47LqJwhVsJbrg
         5EJSsXMqoyct9M8esN7PQ3ognVEFSlFnbxp1uALxv6hAIuI2avOOtVsZN4T2ETiXqaDn
         Mo1wToDzPv5+bKTcETr8r+sEMVZFq3JdpfCBly8riSPX2n7yw+jxsGgoLPgYjyZlRNOs
         OP2flRQ5D2OBMI6PeSkZugGvPUm2362wrkZ1QGibhQOWoJPoQbSV/pRNR1zW8FPrvc+/
         Fl1Qt2szrO2yAmFPUQV42/4QGJGpf3dInJF3WdWUCnJDvhMI979x/0JUPhUOm917dFGp
         FwRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDuRp3k3+G9/IaCV2lhFRxIqHsREtA/QKy2GMZFNYVNKUnfglkt0b3LU9BceclEpRfvja2daAGeZR3AQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxII32TO0owNjkMhgXn6VAkOzU8edbBnZNnhN6oSzrGlHuKDVhL
	eGQiZuPHwqtSxVUyo9IrWpOAzC1tjePfapPO4eYKUDuTUVRQbkkHNnwmZTrRf5g=
X-Google-Smtp-Source: AGHT+IEuFmVYZ1jy/33kF2WStN/il8EUrK9psJOjehX1WLShpLPHHGb9nhbp4djvoS4ETi059uFvTw==
X-Received: by 2002:a05:6a00:4610:b0:71e:7a56:3eaf with SMTP id d2e1a72fcca58-7206309376bmr19849204b3a.24.1730245505859;
        Tue, 29 Oct 2024 16:45:05 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:45:05 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:19 -0700
Subject: [PATCH v7 19/32] riscv: Implements arch agnostic indirect branch
 tracking prctls
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-19-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_234508_281165_ACBC9DCA 
X-CRM114-Status: GOOD (  20.19  )
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
PR_LOCK_INDIR_BR_LP_STATUS.

On trap entry, ELP state is recorded in sstatus image on stack and SR_ELP
in CSR_STATUS is cleared.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/usercfi.h | 16 ++++++++-
 arch/riscv/kernel/entry.S        |  2 +-
 arch/riscv/kernel/process.c      |  5 +++
 arch/riscv/kernel/usercfi.c      | 76 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index 0b3aff008c85..19ee8e7e23ee 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -16,7 +16,9 @@ struct kernel_clone_args;
 struct cfi_status {
 	unsigned long ubcfi_en : 1; /* Enable for backward cfi. */
 	unsigned long ubcfi_locked : 1;
-	unsigned long rsvd : ((sizeof(unsigned long)*8) - 2);
+	unsigned long ufcfi_en : 1; /* Enable for forward cfi. Note that ELP goes in sstatus */
+	unsigned long ufcfi_locked : 1;
+	unsigned long rsvd : ((sizeof(unsigned long)*8) - 4);
 	unsigned long user_shdw_stk; /* Current user shadow stack pointer */
 	unsigned long shdw_stk_base; /* Base address of shadow stack */
 	unsigned long shdw_stk_size; /* size of shadow stack */
@@ -33,6 +35,10 @@ bool is_shstk_locked(struct task_struct *task);
 bool is_shstk_allocated(struct task_struct *task);
 void set_shstk_lock(struct task_struct *task);
 void set_shstk_status(struct task_struct *task, bool enable);
+bool is_indir_lp_enabled(struct task_struct *task);
+bool is_indir_lp_locked(struct task_struct *task);
+void set_indir_lp_status(struct task_struct *task, bool enable);
+void set_indir_lp_lock(struct task_struct *task);
 
 #define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK (PR_SHADOW_STACK_ENABLE)
 
@@ -58,6 +64,14 @@ void set_shstk_status(struct task_struct *task, bool enable);
 
 #define set_shstk_status(task, enable)
 
+#define is_indir_lp_enabled(task) false
+
+#define is_indir_lp_locked(task) false
+
+#define set_indir_lp_status(task, enable)
+
+#define set_indir_lp_lock(task)
+
 #endif /* CONFIG_RISCV_USER_CFI */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 8f7f477517e3..a1f258fd7bbc 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -143,7 +143,7 @@ SYM_CODE_START(handle_exception)
 	 * Disable the FPU/Vector to detect illegal usage of floating point
 	 * or vector in kernel space.
 	 */
-	li t0, SR_SUM | SR_FS_VS
+	li t0, SR_SUM | SR_FS_VS | SR_ELP
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 850128427936..013bc3805afd 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -159,6 +159,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
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
index 141ef70b08a3..c5fa90711089 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -69,6 +69,32 @@ void set_shstk_lock(struct task_struct *task)
 	task->thread_info.user_cfi_state.ubcfi_locked = 1;
 }
 
+bool is_indir_lp_enabled(struct task_struct *task)
+{
+	return task->thread_info.user_cfi_state.ufcfi_en ? true : false;
+}
+
+bool is_indir_lp_locked(struct task_struct *task)
+{
+	return task->thread_info.user_cfi_state.ufcfi_locked ? true : false;
+}
+
+void set_indir_lp_status(struct task_struct *task, bool enable)
+{
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
@@ -371,3 +397,53 @@ int arch_lock_shadow_stack_status(struct task_struct *task,
 
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
+	enable_indir_lp = (status & PR_INDIR_BR_LP_ENABLE) ? true : false;
+	set_indir_lp_status(t, enable_indir_lp);
+
+	return 0;
+}
+
+int arch_lock_indir_br_lp_status(struct task_struct *task,
+				unsigned long arg)
+{
+	/*
+	 * If indirect branch tracking is not supported or not enabled on task,
+	 * nothing to lock here
+	 */
+	if (!cpu_supports_indirect_br_lp_instr() ||
+		!is_indir_lp_enabled(task) || (arg != 0))
+		return -EINVAL;
+
+	set_indir_lp_lock(task);
+
+	return 0;
+}

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
