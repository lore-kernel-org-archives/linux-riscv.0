Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B652BCD11DC
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 21:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9v3Bt0Fzls8swId5mt3M+G2tw3nIlSxxhL6YENVRjZ4=; b=fUOKn5CNneYUqO
	p1gy8WmSAPPVcNywdcs8yTP1D6tpqbq1LtagRaF1gUYZs9xl8bOpZ8ppzD6Wol8TRn4s+zRqR8Sw7
	1j/OFkzbM1eMXNdIZ7Fn5AXdL1RAkzmxZE6g8KVddz89Bd+CNxEeY2xoWV/x9XiMpd2oiHRfLXnHf
	Iv9OLfMJJOyVnFJAZZ/R8ddsNTsHKh5jmnJDtTDzyppgH+tc+iZyDGkDGJxV53H1ctJcsaFbJ60x7
	FwJl3sYKdN7C713X9ZJVcA/zNO8hHm6kivkHMcmjlMzCxJcHFqZeIcAdq79+xdTQBST5hT0Btr2E0
	LUQxq8yF92CN2LAvGYLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUh-0000000EMpQ-3TVB;
	Tue, 19 Mar 2024 21:59:39 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUW-0000000EMh1-3jwE
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 21:59:31 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e782e955adso75013b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 14:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710885567; x=1711490367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//J7AYtv61iHxtKJQn3MiSxiIHpG2s0TTUnDmfuJahA=;
        b=Q96xe04TSIkUCqTY5Tl684ziyNkoAV/4lkGkFwj/qbQFttHvcODkYu7bg3EajeOQHo
         1WO/BkdEmAIxJFGNTjj2hYPzYVSACOC8vFToRoLu5CsdT7h8XK7BZLk1gAu6D+YrUS8l
         tuFMsqUyp5gwJQvjaw0am5ZBoN+9eAzWqfldyY5DmHQCZ9Ipgqg3EN24UH2cFhAbfzMT
         vWmKpKNPFGyLeLHJvyLg/Ar/Yql6XdHkkI5QXtXi9PsCB2wUFAG3zvIg75sNYnjVQTiK
         Ig7EbiLqtfespaIiv4LCx21hCHUOYFv7NRQLFHqeMVDMWKi3raGNd/wofEsfPO7dsIWG
         FusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710885567; x=1711490367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//J7AYtv61iHxtKJQn3MiSxiIHpG2s0TTUnDmfuJahA=;
        b=EYzhGlCIfpzPuzsxforG9YzVqqMFD88p16Dsx9ntTsMMJvAFFOiNSQwLiQfJvhnkqQ
         V5Wm8LTlo6FBHhvZmab+W7wzC3HD7404cMX1+M+cwbkEVFiJ4tBt3o3V8HYlWh+YvEAV
         DPnzZykNxyilMIOret93pW7eCGJkvBhSbjqEIoV6C6Dhk2eCx6e6G3MtNmcQ0OREwKxm
         zYVaTooE1KgszJ1PyXBNdwy3cEyhEqDFU5rQ0DAYWPHeTppPUZ+cxZIsV8WbM+NsTEa5
         1pTtu7fmpSv1pwZQTEVheEXkv5bvUMVw3tYmnE5JfuS3gD5eL+MwIj7fVOvOIGczXPiQ
         hH4w==
X-Forwarded-Encrypted: i=1; AJvYcCVrR0DAh/AB7EjS+nMvZ9wF1dc42JYB3kBY2NuvWhwsHcn4aHytIPPT64Dbtwe9XoTq1p5+ffPxG2Ei5VOejJVS6PWvQeuLlUaGTEHKaZHq
X-Gm-Message-State: AOJu0YzKVjO88mmZTmaZ7SX8c1MjpwwT+/h3MPVNpN+LlQdi+JSXhVwU
	XD+VkSomZIkO8XPx9ergnMwVw9t3g4S/DZbaXRcdLu5MzM7x3JJEk9kUFGCjoY4=
X-Google-Smtp-Source: AGHT+IFBtKPHZqAeY1IySQ3pzoH0nMl2mX+/T7GPlQacqCenBzo0xWbZizuV66Z+QSEH8NLBCD7ebQ==
X-Received: by 2002:a05:6a00:2447:b0:6e6:aae6:acfe with SMTP id d7-20020a056a00244700b006e6aae6acfemr19345714pfj.23.1710885565732;
        Tue, 19 Mar 2024 14:59:25 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id z25-20020aa785d9000000b006e6c61b264bsm10273892pfn.32.2024.03.19.14.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 14:59:25 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	tech-j-ext@lists.risc-v.org,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greentime Hu <greentime.hu@sifive.com>
Subject: [RFC PATCH 7/9] riscv: Add support for the tagged address ABI
Date: Tue, 19 Mar 2024 14:58:33 -0700
Message-ID: <20240319215915.832127-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240319215915.832127-1-samuel.holland@sifive.com>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_145929_392748_67D3F959 
X-CRM114-Status: GOOD (  24.31  )
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
software untagging in the uaccess routines is required because U-mode
and S-mode have entirely separate pointer masking configurations.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/processor.h |  1 +
 arch/riscv/include/asm/uaccess.h   | 40 +++++++++++++++++++++---
 arch/riscv/kernel/process.c        | 49 +++++++++++++++++++++++++++++-
 3 files changed, 84 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 64b34e839802..cdc8569b2118 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -124,6 +124,7 @@ struct thread_struct {
 	struct __riscv_v_ext_state vstate;
 	unsigned long align_ctl;
 	struct __riscv_v_ext_state kernel_vstate;
+	u8 pmlen;
 };
 
 /* Whitelist the fstate from the task_struct for hardened usercopy */
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index ec0cab9fbddd..ed282dcf9a6d 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -9,8 +9,38 @@
 #define _ASM_RISCV_UACCESS_H
 
 #include <asm/asm-extable.h>
+#include <asm/cpufeature.h>
 #include <asm/pgtable.h>		/* for TASK_SIZE */
 
+#ifdef CONFIG_RISCV_ISA_POINTER_MASKING
+static inline unsigned long __untagged_addr(unsigned long addr)
+{
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SxNPM)) {
+		u8 shift = current->thread.pmlen;
+
+		/*
+		 * Virtual addresses are sign-extended, while
+		 * physical addresses are zero-extended.
+		 */
+		if (IS_ENABLED(CONFIG_MMU))
+			return (long)(addr << shift) >> shift;
+		else
+			return (addr << shift) >> shift;
+	}
+
+	return addr;
+}
+
+#define untagged_addr(addr) ({					\
+	unsigned long __addr = (__force unsigned long)(addr);	\
+	(__force __typeof__(addr))__untagged_addr(__addr);	\
+})
+
+#define access_ok(addr, size) likely(__access_ok(untagged_addr(addr), size))
+#else
+#define untagged_addr(addr) addr
+#endif
+
 /*
  * User space memory access functions
  */
@@ -130,7 +160,7 @@ do {								\
  */
 #define __get_user(x, ptr)					\
 ({								\
-	const __typeof__(*(ptr)) __user *__gu_ptr = (ptr);	\
+	const __typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
 	long __gu_err = 0;					\
 								\
 	__chk_user_ptr(__gu_ptr);				\
@@ -246,7 +276,7 @@ do {								\
  */
 #define __put_user(x, ptr)					\
 ({								\
-	__typeof__(*(ptr)) __user *__gu_ptr = (ptr);		\
+	__typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
 	__typeof__(*__gu_ptr) __val = (x);			\
 	long __pu_err = 0;					\
 								\
@@ -293,13 +323,13 @@ unsigned long __must_check __asm_copy_from_user(void *to,
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
@@ -314,7 +344,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
 {
 	might_fault();
 	return access_ok(to, n) ?
-		__clear_user(to, n) : n;
+		__clear_user(untagged_addr(to), n) : n;
 }
 
 #define __get_kernel_nofault(dst, src, type, err_label)			\
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 3578e75f4aa4..36129040b7bd 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -162,6 +162,7 @@ static void flush_tagged_addr_state(void)
 		return;
 
 	current->thread.envcfg &= ~ENVCFG_PMM;
+	current->thread.pmlen = 0;
 
 	sync_envcfg(current);
 #endif
@@ -255,9 +256,14 @@ void __init arch_task_cache_init(void)
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
 	u8 pmlen;
 
@@ -288,12 +294,25 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
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
 	task->thread.envcfg &= ~ENVCFG_PMM;
 	if (pmlen == 7)
 		task->thread.envcfg |= ENVCFG_PMM_PMLEN_7;
 	else if (pmlen == 16)
 		task->thread.envcfg |= ENVCFG_PMM_PMLEN_16;
 
+	if (arg & PR_TAGGED_ADDR_ENABLE)
+		task->thread.pmlen = pmlen;
+	else
+		task->thread.pmlen = 0;
+
 	if (task == current)
 		sync_envcfg(current);
 
@@ -308,6 +327,13 @@ long get_tagged_addr_ctrl(struct task_struct *task)
 	if (is_compat_thread(ti))
 		return -EINVAL;
 
+	if (task->thread.pmlen)
+		ret = PR_TAGGED_ADDR_ENABLE;
+
+	/*
+	 * The task's pmlen is only set if the tagged address ABI is enabled,
+	 * so the effective PMLEN must be extracted from envcfg.PMM.
+	 */
 	switch (task->thread.envcfg & ENVCFG_PMM) {
 	case ENVCFG_PMM_PMLEN_7:
 		ret |= FIELD_PREP(PR_PMLEN_MASK, 7);
@@ -326,6 +352,24 @@ static bool try_to_set_pmm(unsigned long value)
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
 	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SxNPM))
@@ -339,6 +383,9 @@ static int __init tagged_addr_init(void)
 	have_user_pmlen_7 = try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
 	have_user_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
 
+	if (!register_sysctl("abi", tagged_addr_sysctl_table))
+		return -EINVAL;
+
 	return 0;
 }
 core_initcall(tagged_addr_init);
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
