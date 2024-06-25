Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFE7C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 21:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vqlO6jknj/srd8yX1otAM0bQXCz0V2tFVztA0Oujo3E=; b=pSlyH8YY+KX2EH
	9rxcU58RvXlpbR9ddzolj0tKkPs8lG6f1Ct/zeY2YbBYZTB5eKpu6xOwWYe+TF8iAuyGpgp1+kw6m
	4z5B5zJ0h4HZwgD0FnIAGJfQvSFUiIJlzEqB+WgdNdntlTnIUXWXHtw9xq5r3DGO2ilsMEDB7dqKS
	eCQLHh8B9PUzFq3KG1myGSlj4VEF/h7SYmb0dJFI8Dr9AZPMBE6RkUOkDhm15qNuVH4OairtFeIoy
	dmQkZKKqtk89V2aU6fSdx8ZqWotUaPqwKFmkNqEhnXrxZaNvqqaQ+fgVbMikPqdi7+13KY5l7BvzC
	0qM8OKF69K492Fr/EvZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQI-00000004VBs-0HDX;
	Tue, 25 Jun 2024 21:09:54 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQA-00000004V5k-056G
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 21:09:47 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1fa2ea1c443so24278775ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 14:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719349785; x=1719954585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Icm6uA8wnqdys37A8Kzf4AV1ey+zBIexi2g5XJMtDfE=;
        b=BugkdMD37lNKM40LR6LISp5Gmqxp8h052PR1l+w2pjE4M1jPAdx/zaSo19eiR1OxB0
         3Q1Cwx1CPKWpUi0bUytjiEjXBDxTI1rKCTlHpcAhDdZHw9ryCc4COJAzYYq4yNGeWkM7
         CbIREqybD3EwQKlOyf1oCdSsFPMlz5GpyPIqPdalSq4f+jsM35+2ekMf8M56w3io4EES
         9woFolr456RSTPBoDHeVoqfYI5I1nqOHYq0xEotu344dB6CrqDO4/3VzekWqHJ3mgXGM
         2t0JMnL5YeMOAeXXV/S1+azsn/Kb5pANB6ws9uI7NKQUIwJyDIyl6Xxf+F9gYy4QPk9W
         aguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719349785; x=1719954585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Icm6uA8wnqdys37A8Kzf4AV1ey+zBIexi2g5XJMtDfE=;
        b=nqjhpO8OFmJdkX4LXX3PA9TNrzDaRnoH4ovwXcatpLKgA9TVenLCIPogPht9m9ltgl
         GePqTmIUPhVYilYkDY2AkRrooSIj1iPYx5yhAyisHoD+zBLwxNu5vTbxY1h+8nmQPCXu
         HHipEEDAiwblu1l8eWGD/dGZyq32Dnqt0+p7glKHZ80NHuwvYERmCsZ8khOpkovbKapE
         w35TI2NiWb/3Oz90dMvkG2+q7acLea01fZjekdbd8lDlI3ETtp5j9Rd3WxJKnAE9CHaU
         a/zX3YMY5SIyXUQzhaft0jFsikEVSwE7opO+WtBj2S8MBSYvltfMPTGGAxffUbbuxgO4
         Yu0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFaElLr4zYQu3EktWlDzV0JnaHZW2Bg1X9Ev1kM74cpVYW2t5jOBz442N6sTfjVF5kEAtmBO1QcV9Me/so0zhGqBQYUOY+ubFt708Srizd
X-Gm-Message-State: AOJu0YxKfTeA8ZUyzE/wQbROMiDB7qR9iZ4jfawbZVD0TD8xDWNqbDYJ
	JtQZQbSmzfQuccHDBnouZFD3vqp+Jw56rtf9kF1s0AYL4ugxxqfjfDR4/GOyKX4=
X-Google-Smtp-Source: AGHT+IHthtdLPOXBG6B10DrZ39vkgS4mJz07lhPLTxOAb1nTigmUhpXbFgrxYa8MQ6WsjtQ9WbY67w==
X-Received: by 2002:a17:903:32ce:b0:1fa:643:f424 with SMTP id d9443c01a7336-1fa238e46ddmr113134855ad.14.1719349784670;
        Tue, 25 Jun 2024 14:09:44 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb328f57sm85873455ad.110.2024.06.25.14.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 14:09:44 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 05/10] riscv: Add support for the tagged address ABI
Date: Tue, 25 Jun 2024 14:09:16 -0700
Message-ID: <20240625210933.1620802-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240625210933.1620802-1-samuel.holland@sifive.com>
References: <20240625210933.1620802-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_140946_148956_3A1A8FBE 
X-CRM114-Status: GOOD (  30.10  )
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

When pointer masking is enabled for userspace, the kernel can accept
tagged pointers as arguments to some system calls. Allow this by
untagging the pointers in access_ok() and the uaccess routines. The
uaccess routines must peform untagging in software because U-mode and
S-mode have entirely separate pointer masking configurations. In fact,
hardware may not even implement pointer masking for S-mode.

Since the number of tag bits is variable, untagged_addr_remote() needs
to know what PMLEN to use for the remote mm. Therefore, the pointer
masking mode must be the same for all threads sharing an mm. Enforce
this with a lock flag in the mm context, as x86 does for LAM. The flag
gets reset in init_new_context() during fork(), as the new mm is no
longer multithreaded.

Unlike x86, untagged_addr() gets pmlen from struct thread_info instead
of a percpu variable, as this both avoids context switch overhead and
loads the value more efficiently.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Implement untagged_addr_remote()
 - Restrict PMLEN changes once a process is multithreaded

 arch/riscv/include/asm/mmu.h         |  7 +++
 arch/riscv/include/asm/mmu_context.h |  6 +++
 arch/riscv/include/asm/thread_info.h |  3 ++
 arch/riscv/include/asm/uaccess.h     | 58 +++++++++++++++++++++--
 arch/riscv/kernel/process.c          | 69 +++++++++++++++++++++++++++-
 5 files changed, 136 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index 947fd60f9051..361a9623f8c8 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -26,8 +26,15 @@ typedef struct {
 	unsigned long exec_fdpic_loadmap;
 	unsigned long interp_fdpic_loadmap;
 #endif
+#ifdef CONFIG_RISCV_ISA_POINTER_MASKING
+	unsigned long flags;
+	u8 pmlen;
+#endif
 } mm_context_t;
 
+/* Lock the pointer masking mode because this mm is multithreaded */
+#define MM_CONTEXT_LOCK_PMLEN	0
+
 #define cntx2asid(cntx)		((cntx) & SATP_ASID_MASK)
 #define cntx2version(cntx)	((cntx) & ~SATP_ASID_MASK)
 
diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index 7030837adc1a..62a9f76cf257 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -20,6 +20,9 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 static inline void activate_mm(struct mm_struct *prev,
 			       struct mm_struct *next)
 {
+#ifdef CONFIG_RISCV_ISA_POINTER_MASKING
+	next->context.pmlen = 0;
+#endif
 	switch_mm(prev, next, NULL);
 }
 
@@ -29,6 +32,9 @@ static inline int init_new_context(struct task_struct *tsk,
 {
 #ifdef CONFIG_MMU
 	atomic_long_set(&mm->context.id, 0);
+#endif
+#ifdef CONFIG_RISCV_ISA_POINTER_MASKING
+	clear_bit(MM_CONTEXT_LOCK_PMLEN, &mm->context.flags);
 #endif
 	return 0;
 }
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 5d473343634b..cd355f8a550f 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -60,6 +60,9 @@ struct thread_info {
 	void			*scs_base;
 	void			*scs_sp;
 #endif
+#ifdef CONFIG_RISCV_ISA_POINTER_MASKING
+	u8			pmlen;
+#endif
 };
 
 #ifdef CONFIG_SHADOW_CALL_STACK
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 72ec1d9bd3f3..153495997bc1 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -9,8 +9,56 @@
 #define _ASM_RISCV_UACCESS_H
 
 #include <asm/asm-extable.h>
+#include <asm/cpufeature.h>
 #include <asm/pgtable.h>		/* for TASK_SIZE */
 
+#ifdef CONFIG_RISCV_ISA_POINTER_MASKING
+static inline unsigned long __untagged_addr(unsigned long addr)
+{
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM)) {
+		u8 pmlen = current->thread_info.pmlen;
+
+		/* Virtual addresses are sign-extended; physical addresses are zero-extended. */
+		if (IS_ENABLED(CONFIG_MMU))
+			return (long)(addr << pmlen) >> pmlen;
+		else
+			return (addr << pmlen) >> pmlen;
+	}
+
+	return addr;
+}
+
+#define untagged_addr(addr) ({						\
+	unsigned long __addr = (__force unsigned long)(addr);		\
+	(__force __typeof__(addr))__untagged_addr(__addr);		\
+})
+
+static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigned long addr)
+{
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM)) {
+		u8 pmlen = mm->context.pmlen;
+
+		/* Virtual addresses are sign-extended; physical addresses are zero-extended. */
+		if (IS_ENABLED(CONFIG_MMU))
+			return (long)(addr << pmlen) >> pmlen;
+		else
+			return (addr << pmlen) >> pmlen;
+	}
+
+	return addr;
+}
+
+#define untagged_addr_remote(mm, addr) ({				\
+	unsigned long __addr = (__force unsigned long)(addr);		\
+	mmap_assert_locked(mm);						\
+	(__force __typeof__(addr))__untagged_addr_remote(mm, __addr);	\
+})
+
+#define access_ok(addr, size) likely(__access_ok(untagged_addr(addr), size))
+#else
+#define untagged_addr(addr) (addr)
+#endif
+
 /*
  * User space memory access functions
  */
@@ -130,7 +178,7 @@ do {								\
  */
 #define __get_user(x, ptr)					\
 ({								\
-	const __typeof__(*(ptr)) __user *__gu_ptr = (ptr);	\
+	const __typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
 	long __gu_err = 0;					\
 								\
 	__chk_user_ptr(__gu_ptr);				\
@@ -246,7 +294,7 @@ do {								\
  */
 #define __put_user(x, ptr)					\
 ({								\
-	__typeof__(*(ptr)) __user *__gu_ptr = (ptr);		\
+	__typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
 	__typeof__(*__gu_ptr) __val = (x);			\
 	long __pu_err = 0;					\
 								\
@@ -293,13 +341,13 @@ unsigned long __must_check __asm_copy_from_user(void *to,
 static inline unsigned long
 raw_copy_from_user(void *to, const void __user *from, unsigned long n)
 {
-	return __asm_copy_from_user(to, from, n);
+	return __asm_copy_from_user(to, untagged_addr(from), n);
 }
 
 static inline unsigned long
 raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
-	return __asm_copy_to_user(to, from, n);
+	return __asm_copy_to_user(untagged_addr(to), from, n);
 }
 
 extern long strncpy_from_user(char *dest, const char __user *src, long count);
@@ -314,7 +362,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
 {
 	might_fault();
 	return access_ok(to, n) ?
-		__clear_user(to, n) : n;
+		__clear_user(untagged_addr(to), n) : n;
 }
 
 #define __get_kernel_nofault(dst, src, type, err_label)			\
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index dec5ccc44697..7bd445dade92 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -173,8 +173,10 @@ void flush_thread(void)
 	clear_tsk_thread_flag(current, TIF_RISCV_V_DEFER_RESTORE);
 #endif
 #ifdef CONFIG_RISCV_ISA_POINTER_MASKING
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM)) {
 		envcfg_update_bits(current, ENVCFG_PMM, ENVCFG_PMM_PMLEN_0);
+		current->thread_info.pmlen = 0;
+	}
 #endif
 }
 
@@ -204,6 +206,12 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	unsigned long tls = args->tls;
 	struct pt_regs *childregs = task_pt_regs(p);
 
+#ifdef CONFIG_RISCV_ISA_POINTER_MASKING
+	/* Ensure all threads in this mm have the same pointer masking mode. */
+	if (p->mm && (clone_flags & CLONE_VM))
+		set_bit(MM_CONTEXT_LOCK_PMLEN, &p->mm->context.flags);
+#endif
+
 	memset(&p->thread.s, 0, sizeof(p->thread.s));
 
 	/* p->thread holds context to be restored by __switch_to() */
@@ -243,10 +251,16 @@ void __init arch_task_cache_init(void)
 static bool have_user_pmlen_7;
 static bool have_user_pmlen_16;
 
+/*
+ * Control the relaxed ABI allowing tagged user addresses into the kernel.
+ */
+static unsigned int tagged_addr_disabled;
+
 long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
 {
-	unsigned long valid_mask = PR_PMLEN_MASK;
+	unsigned long valid_mask = PR_PMLEN_MASK | PR_TAGGED_ADDR_ENABLE;
 	struct thread_info *ti = task_thread_info(task);
+	struct mm_struct *mm = task->mm;
 	unsigned long pmm;
 	u8 pmlen;
 
@@ -277,6 +291,14 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
 			return -EINVAL;
 	}
 
+	/*
+	 * Do not allow the enabling of the tagged address ABI if globally
+	 * disabled via sysctl abi.tagged_addr_disabled, if pointer masking
+	 * is disabled for userspace.
+	 */
+	if (arg & PR_TAGGED_ADDR_ENABLE && (tagged_addr_disabled || !pmlen))
+		return -EINVAL;
+
 	if (pmlen == 7)
 		pmm = ENVCFG_PMM_PMLEN_7;
 	else if (pmlen == 16)
@@ -284,7 +306,22 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
 	else
 		pmm = ENVCFG_PMM_PMLEN_0;
 
+	if (!(arg & PR_TAGGED_ADDR_ENABLE))
+		pmlen = 0;
+
+	if (mmap_write_lock_killable(mm))
+		return -EINTR;
+
+	if (test_bit(MM_CONTEXT_LOCK_PMLEN, &mm->context.flags) && mm->context.pmlen != pmlen) {
+		mmap_write_unlock(mm);
+		return -EBUSY;
+	}
+
 	envcfg_update_bits(task, ENVCFG_PMM, pmm);
+	task->mm->context.pmlen = pmlen;
+	task->thread_info.pmlen = pmlen;
+
+	mmap_write_unlock(mm);
 
 	return 0;
 }
@@ -297,6 +334,13 @@ long get_tagged_addr_ctrl(struct task_struct *task)
 	if (is_compat_thread(ti))
 		return -EINVAL;
 
+	if (task->thread_info.pmlen)
+		ret = PR_TAGGED_ADDR_ENABLE;
+
+	/*
+	 * The task's pmlen is only set if the tagged address ABI is enabled,
+	 * so the effective PMLEN must be extracted from envcfg.PMM.
+	 */
 	switch (task->thread.envcfg & ENVCFG_PMM) {
 	case ENVCFG_PMM_PMLEN_7:
 		ret |= FIELD_PREP(PR_PMLEN_MASK, 7);
@@ -315,6 +359,24 @@ static bool try_to_set_pmm(unsigned long value)
 	return (csr_read_clear(CSR_ENVCFG, ENVCFG_PMM) & ENVCFG_PMM) == value;
 }
 
+/*
+ * Global sysctl to disable the tagged user addresses support. This control
+ * only prevents the tagged address ABI enabling via prctl() and does not
+ * disable it for tasks that already opted in to the relaxed ABI.
+ */
+
+static struct ctl_table tagged_addr_sysctl_table[] = {
+	{
+		.procname	= "tagged_addr_disabled",
+		.mode		= 0644,
+		.data		= &tagged_addr_disabled,
+		.maxlen		= sizeof(int),
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
+};
+
 static int __init tagged_addr_init(void)
 {
 	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
@@ -328,6 +390,9 @@ static int __init tagged_addr_init(void)
 	have_user_pmlen_7 = try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
 	have_user_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
 
+	if (!register_sysctl("abi", tagged_addr_sysctl_table))
+		return -EINVAL;
+
 	return 0;
 }
 core_initcall(tagged_addr_init);
-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
