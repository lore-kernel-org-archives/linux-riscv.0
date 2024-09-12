Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5D0EEE272
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+RHXXMo7/SK2bcg8N9V0Ka48B5+1IbEffDFiRVVWbTg=; b=KUwtpUkxqjvqOD
	d0QTUhRdLpQcY5qQ8+HwpT8aa1Pm72+/B3kBQ/ufVRHDFuRhY4YVeWcDFdTJ1j2aITOzUCkj4dVuY
	Lnf0yTM7337mKZVWR0c+arnju57t4M1DhY7XxIBupgeESm9xtrvnPidINDqXvvzoNpUVdME4CPE6g
	wBOhZ2LppMMyXVKn7KU3fYWCy122oQtr9Ml7/yu+hdn7rjEOEIYIuAXbtCyfFp0ojw2uarRVIe50R
	YaLnq1+6h+53KXWcOYpPF/w0JI7taxhqJWgdXKH4sW++5Hqx81qjcms24GyY4fhmE50c171cWXtgh
	YdD1fGSj7v/IiwQVChCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot5X-0000000ESRL-0c8z;
	Thu, 12 Sep 2024 23:18:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot5S-0000000ESM2-07IN
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Sep 2024 23:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QuNLZoEwAoxFOzNtpFEIpmCklLXVvlyHizGcnsawnko=; b=m4L/B7JvWeHkLld4ueNJiEqUF9
	rDRTxuO+4MXrNgzZIBlMMAEoT401RfcIUXovZDUAIMcgsjxiPqL6V1hhrDxlBORBsnzuH6+iuPWAc
	rLBTygdrHcqcZgtZj4vZOn5eUTHPHSpri5Su+2RSkg1aruEzQrEuJ/74OvWloX03F+pdRj4ZKk6qn
	YlAiiAG48WGYo5uI5SC/7lbUgLcz7W9CYQCurmN4i7YbARjNbfwHbOJQng/+x+JneKTnVO3onn3MR
	yE1QYlCE1mg0A19YcEWyFFleIwihaTq11Yv8OxKB26/n5r4NOiM76fOdoc4fOs7/3N5cK9Dvy70VB
	3/JBhlUQ==;
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sot5O-0000000CNR8-26do
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:18:52 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-6bce380eb96so983214a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183127; x=1726787927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuNLZoEwAoxFOzNtpFEIpmCklLXVvlyHizGcnsawnko=;
        b=ZTd7EFulv++sTdeacrrNeL+jNbMjevmmWL5zBGF/I0F1WqfWSID9+hZdPwXbAjx/Mv
         2xQi22Ct4rUvki52ditQxuc9VJKRb7ZFlh9ym9c8A67BeNBPa/X9NO0bK/Q1F985JoB6
         vPUrSgfREGrjsptxY/SLcIZndEIB2iaonE3ZAzxNSs7W/NJlyPlAtF/k3k5fvv9jhqqM
         hEgHBrIgZ/ZRGIyt9K34zAj2JePf1uWF8zOtMwgXISzN/LtONcOFX3actrx/V38X8/6t
         WD711HZsj8N8zuDKcondZJg6yWJFFNTnDGvBEq3fjMxQCEqRke/4cBGHxdAXQU41h7Lb
         uvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183127; x=1726787927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QuNLZoEwAoxFOzNtpFEIpmCklLXVvlyHizGcnsawnko=;
        b=vAnDhq6xz7aXB4ltN66xXBmDJb7MgBQjOFpVf2rebUR70Vm0FXW09amMrAOCz4mnNJ
         Pcw/NnBAqCWu6OnE6UPaTXT2ADamDZTmdkBsdhy5E6wv6qW9uwaXmPDtE4grWUvSL5K5
         negbm6JCGxWWHjlRwabhvM1t2ErcR0VmXoM58WveW7ud527Brlq8neBTBjHstTCejeLd
         CF/68CcD9GQaHytWJYKNN63ZYg65GIS34JhrRbe+ISIwcdJFdQe1lWBy71Zf0ZkaUil+
         73vxAfcfeRwbzvVe0GN6pUf1vITyORf/sOmkyhg7lGuOMk8rvSJFYK+VGadq5jeKFR2G
         QgKA==
X-Forwarded-Encrypted: i=1; AJvYcCVIN/oso83fI09E69Ivj7YUm/C6k25bStqyCupPMJVp87HwCsCAamAfpyhErkk5VKOHvayaFJvf8DTOmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE4M/6/Wa+6iw1GllNO52ZyF6+etsrBqejxu+8DVg1Mh2WQuDJ
	fSCI9nqekRA+fhraBl/TXSv92kK0hh/Tjo1j4mCUZbdfTKRXzoQXy90yi1tdW5w=
X-Google-Smtp-Source: AGHT+IFe2b+wfH4HddVQdWnBa2Cv1PojGiau8/JID+xbbETXDST/X3AAL06qD2zWAK34gSRESgSPDg==
X-Received: by 2002:a17:90a:4b82:b0:2c9:8105:483 with SMTP id 98e67ed59e1d1-2db9ffca8a1mr4592061a91.14.1726183126845;
        Thu, 12 Sep 2024 16:18:46 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:18:46 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 23/30] riscv signal: save and restore of shadow stack for signal
Date: Thu, 12 Sep 2024 16:16:42 -0700
Message-ID: <20240912231650.3740732-24-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_001850_620493_ECD4AFFF 
X-CRM114-Status: GOOD (  19.02  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Save shadow stack pointer in sigcontext structure while delivering signal.
Restore shadow stack pointer from sigcontext on sigreturn.

As part of save operation, kernel uses `ssamoswap` to save snapshot of
current shadow stack on shadow stack itself (can be called as a save
token). During restore on sigreturn, kernel retrieves token from top of
shadow stack and validates it. This allows that user mode can't arbitrary
pivot to any shadow stack address without having a token and thus provide
strong security assurance between signaly delivery and sigreturn window.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Suggested-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/usercfi.h | 19 ++++++++++
 arch/riscv/kernel/signal.c       | 62 +++++++++++++++++++++++++++++++-
 arch/riscv/kernel/usercfi.c      | 57 +++++++++++++++++++++++++++++
 3 files changed, 137 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index 20a9102cce51..d5050a5df26c 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -8,6 +8,7 @@
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
 #include <linux/prctl.h>
+#include <linux/errno.h>
 
 struct task_struct;
 struct kernel_clone_args;
@@ -35,6 +36,9 @@ bool is_shstk_locked(struct task_struct *task);
 bool is_shstk_allocated(struct task_struct *task);
 void set_shstk_lock(struct task_struct *task);
 void set_shstk_status(struct task_struct *task, bool enable);
+unsigned long get_active_shstk(struct task_struct *task);
+int restore_user_shstk(struct task_struct *tsk, unsigned long shstk_ptr);
+int save_user_shstk(struct task_struct *tsk, unsigned long *saved_shstk_ptr);
 bool is_indir_lp_enabled(struct task_struct *task);
 bool is_indir_lp_locked(struct task_struct *task);
 void set_indir_lp_status(struct task_struct *task, bool enable);
@@ -96,6 +100,21 @@ static inline void set_shstk_status(struct task_struct *task, bool enable)
 
 }
 
+static inline int restore_user_shstk(struct task_struct *tsk, unsigned long shstk_ptr)
+{
+	return -EINVAL;
+}
+
+static inline int save_user_shstk(struct task_struct *tsk, unsigned long *saved_shstk_ptr)
+{
+	return -EINVAL;
+}
+
+static inline unsigned long get_active_shstk(struct task_struct *task)
+{
+	return 0;
+}
+
 static inline bool is_indir_lp_enabled(struct task_struct *task)
 {
 	return false;
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index dcd282419456..7d5c1825650f 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -22,6 +22,7 @@
 #include <asm/vector.h>
 #include <asm/csr.h>
 #include <asm/cacheflush.h>
+#include <asm/usercfi.h>
 
 unsigned long signal_minsigstksz __ro_after_init;
 
@@ -153,6 +154,16 @@ static long restore_sigcontext(struct pt_regs *regs,
 	void __user *sc_ext_ptr = &sc->sc_extdesc.hdr;
 	__u32 rsvd;
 	long err;
+	unsigned long ss_ptr = 0;
+	struct __sc_riscv_cfi_state __user *sc_cfi = NULL;
+
+	sc_cfi = (struct __sc_riscv_cfi_state *)
+		 ((unsigned long) sc_ext_ptr + sizeof(struct __riscv_ctx_hdr));
+
+	if (has_vector() && riscv_v_vstate_query(regs))
+		sc_cfi = (struct __sc_riscv_cfi_state *)
+			 ((unsigned long) sc_cfi + riscv_v_sc_size);
+
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
 	if (unlikely(err))
@@ -172,6 +183,24 @@ static long restore_sigcontext(struct pt_regs *regs,
 	if (unlikely(rsvd))
 		return -EINVAL;
 
+	/*
+	 * Restore shadow stack as a form of token stored on shadow stack itself as a safe
+	 * way to restore.
+	 * A token on shadow gives following properties
+	 *	- Safe save and restore for shadow stack switching. Any save of shadow stack
+	 *	  must have had saved a token on shadow stack. Similarly any restore of shadow
+	 *	  stack must check the token before restore. Since writing to shadow stack with
+	 *	  address of shadow stack itself is not easily allowed. A restore without a save
+	 *	  is quite difficult for an attacker to perform.
+	 *	- A natural break. A token in shadow stack provides a natural break in shadow stack
+	 *	  So a single linear range can be bucketed into different shadow stack segments.
+	 *	  sspopchk will detect the condition and fault to kernel as sw check exception.
+	 */
+	if (is_shstk_enabled(current)) {
+		err |= __copy_from_user(&ss_ptr, &sc_cfi->ss_ptr, sizeof(unsigned long));
+		err |= restore_user_shstk(current, ss_ptr);
+	}
+
 	while (!err) {
 		__u32 magic, size;
 		struct __riscv_ctx_hdr __user *head = sc_ext_ptr;
@@ -215,6 +244,10 @@ static size_t get_rt_frame_size(bool cal_all)
 		if (cal_all || riscv_v_vstate_query(task_pt_regs(current)))
 			total_context_size += riscv_v_sc_size;
 	}
+
+	if (is_shstk_enabled(current))
+		total_context_size += sizeof(struct __sc_riscv_cfi_state);
+
 	/*
 	 * Preserved a __riscv_ctx_hdr for END signal context header if an
 	 * extension uses __riscv_extra_ext_header
@@ -276,18 +309,40 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 {
 	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
 	struct __riscv_ctx_hdr __user *sc_ext_ptr = &sc->sc_extdesc.hdr;
+	unsigned long ss_ptr = 0;
+	struct __sc_riscv_cfi_state __user *sc_cfi = NULL;
 	long err;
 
+	sc_cfi = (struct __sc_riscv_cfi_state *) (sc_ext_ptr + 1);
+
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
 	/* Save the floating-point state. */
 	if (has_fpu())
 		err |= save_fp_state(regs, &sc->sc_fpregs);
 	/* Save the vector state. */
-	if (has_vector() && riscv_v_vstate_query(regs))
+	if (has_vector() && riscv_v_vstate_query(regs)) {
 		err |= save_v_state(regs, (void __user **)&sc_ext_ptr);
+		sc_cfi = (struct __sc_riscv_cfi_state *) ((unsigned long) sc_cfi + riscv_v_sc_size);
+	}
 	/* Write zero to fp-reserved space and check it on restore_sigcontext */
 	err |= __put_user(0, &sc->sc_extdesc.reserved);
+	/*
+	 * Save a pointer to shadow stack itself on shadow stack as a form of token.
+	 * A token on shadow gives following properties
+	 *	- Safe save and restore for shadow stack switching. Any save of shadow stack
+	 *	  must have had saved a token on shadow stack. Similarly any restore of shadow
+	 *	  stack must check the token before restore. Since writing to shadow stack with
+	 *	  address of shadow stack itself is not easily allowed. A restore without a save
+	 *	  is quite difficult for an attacker to perform.
+	 *	- A natural break. A token in shadow stack provides a natural break in shadow stack
+	 *	  So a single linear range can be bucketed into different shadow stack segments. Any
+	 *	  sspopchk will detect the condition and fault to kernel as sw check exception.
+	 */
+	if (is_shstk_enabled(current)) {
+		err |= save_user_shstk(current, &ss_ptr);
+		err |= __put_user(ss_ptr, &sc_cfi->ss_ptr);
+	}
 	/* And put END __riscv_ctx_hdr at the end. */
 	err |= __put_user(END_MAGIC, &sc_ext_ptr->magic);
 	err |= __put_user(END_HDR_SIZE, &sc_ext_ptr->size);
@@ -345,6 +400,11 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 #ifdef CONFIG_MMU
 	regs->ra = (unsigned long)VDSO_SYMBOL(
 		current->mm->context.vdso, rt_sigreturn);
+
+	/* if bcfi is enabled x1 (ra) and x5 (t0) must match. not sure if we need this? */
+	if (is_shstk_enabled(current))
+		regs->t0 = regs->ra;
+
 #else
 	/*
 	 * For the nommu case we don't have a VDSO.  Instead we push two
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 8da509afdbe9..40c32258b6ec 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -52,6 +52,11 @@ void set_active_shstk(struct task_struct *task, unsigned long shstk_addr)
 	task->thread_info.user_cfi_state.user_shdw_stk = shstk_addr;
 }
 
+unsigned long get_active_shstk(struct task_struct *task)
+{
+	return task->thread_info.user_cfi_state.user_shdw_stk;
+}
+
 void set_shstk_status(struct task_struct *task, bool enable)
 {
 	task->thread_info.user_cfi_state.ubcfi_en = enable ? 1 : 0;
@@ -164,6 +169,58 @@ static int create_rstor_token(unsigned long ssp, unsigned long *token_addr)
 	return 0;
 }
 
+/*
+ * Save user shadow stack pointer on shadow stack itself and return pointer to saved location
+ * returns -EFAULT if operation was unsuccessful
+ */
+int save_user_shstk(struct task_struct *tsk, unsigned long *saved_shstk_ptr)
+{
+	unsigned long ss_ptr = 0;
+	unsigned long token_loc = 0;
+	int ret = 0;
+
+	if (saved_shstk_ptr == NULL)
+		return -EINVAL;
+
+	ss_ptr = get_active_shstk(tsk);
+	ret = create_rstor_token(ss_ptr, &token_loc);
+
+	if (!ret) {
+		*saved_shstk_ptr = token_loc;
+		set_active_shstk(tsk, token_loc);
+	}
+
+	return ret;
+}
+
+/*
+ * Restores user shadow stack pointer from token on shadow stack for task `tsk`
+ * returns -EFAULT if operation was unsuccessful
+ */
+int restore_user_shstk(struct task_struct *tsk, unsigned long shstk_ptr)
+{
+	unsigned long token = 0;
+
+	token = amo_user_shstk((unsigned long __user *)shstk_ptr, 0);
+
+	if (token == -1)
+		return -EFAULT;
+
+	/* invalid token, return EINVAL */
+	if ((token - shstk_ptr) != SHSTK_ENTRY_SIZE) {
+		pr_info_ratelimited(
+				"%s[%d]: bad restore token in %s: pc=%p sp=%p, token=%p, shstk_ptr=%p\n",
+				tsk->comm, task_pid_nr(tsk), __func__,
+				(void *)(task_pt_regs(tsk)->epc), (void *)(task_pt_regs(tsk)->sp),
+				(void *)token, (void *)shstk_ptr);
+		return -EINVAL;
+	}
+
+	/* all checks passed, set active shstk and return success */
+	set_active_shstk(tsk, token);
+	return 0;
+}
+
 static unsigned long allocate_shadow_stack(unsigned long addr, unsigned long size,
 				unsigned long token_offset,
 				bool set_tok)
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
