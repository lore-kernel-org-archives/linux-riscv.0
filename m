Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACC0CEACE7
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 16:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avL7dF6gxjCWKaGzhSoWJfdVyYx5uXR7wOLfNgCBjwU=; b=NOveE42QvWvlq0
	Dv2U8p8pYf/Ip48sxppqO5AcyJ1ZleMnC+ie4b/sZ2eXPlxKGdfYdQMS6iocyu7LSD1vJyjBtCsCs
	T+pggfgjH9ziCxQBJdYgRZPFQ57oAYl3gXBD+uIOysXuITiE4ZmRCI+h6bX5tI9G+9J07pEcRCjrf
	o3i/C17YqbuHUTEnCbBJNGekYYY7ctIYUaWcxpYvElHQ0XchfRuocAogqdBvDGfKlfaB+mLw1YCRD
	SGLm1RY71gZfZhYfGRFD/IwaI+lcMzHKK7olJAeqp/sP/UZSh+hJCwDD+nD+AC3pJ+jTRbBjQwdtO
	porxi1YT4zkv7ZXS8VCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svfcV-00000003WEe-0H9G;
	Tue, 01 Oct 2024 16:21:03 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfPu-00000003RQI-1WCq
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:08:04 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e0a5088777so4603241a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798882; x=1728403682; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+G1XK3MHKXlBhc4hyV2PeDHRcaRFAax+LShRB7DUPhc=;
        b=SuvgfHEO9DEWFKJuR1WyP5O/klvuS5kCUQjyw7ujRow9ar0Ak68fP5uWN1/YDA9uWf
         ZSq6piE4oPUklgNOeGtOrNZNPgehnkKGcb6GywJMl+aECIU+u12wP+Rdq7eF7H3Cknns
         BQheH4BlUF53/XvlDDLHQB5ee81kYSrvhoALTAm12OdancKCPUbZsPhfK1i+KnR63gHM
         SVzv6x9CdDCytoRZA2gu9UeZUZd4svNFIVLpjb0fc/dBm0aC1JQx8lOzOwJFhqsaPOli
         uGfJIDdi8j1NeuyXva+TBfL5Z+BZ9OZWYUYOIApwQt3OaYwcGQI1ypK1zmNOpj1OsmxU
         C0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798882; x=1728403682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+G1XK3MHKXlBhc4hyV2PeDHRcaRFAax+LShRB7DUPhc=;
        b=jnWXmv5nfU/MufORLR3YAtJXDfRUt0qPpH811g4+LNdaS5mXjdYEGwczAcbuwwkqsJ
         pPbW3wm9duaOQF9Ot/Ydy6yBqf/DZHSXchZKIQtCdOPH8hryQ2qtyIVlDRnwjTfY8G6n
         xlid9ZfLmobcMdJ/O3jYyuugvaZ/do5DakPvLd1kruyQYtUdNl4F1qfGBlfi7i5av9Yt
         AhrsEVcT/pxG5joAU4j/hWMrK2GMRXfmrk9MykkIhl17fr6h8Z0vhexJGdmgbNOsUMNF
         gCPHsKBF4GfwuBT/i/lCT47dcxqAXLF07q81rRqOgp+53PeHXeoEg3uWwwGBQmpdQTSf
         uMdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCFbSskoikecN59+C6ViO1nFBFwiKkM7/AbsrrB8MUjirBfMvcFMgvbTtkYPOISfzy1tCeNWL+eph/OQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpVUcNBLR607wfoEAjG5dXhXPdIu0MbcQzKCjhrWgnE3Y6hvq0
	JxgMeiOP+CB0QYFpuOIzuqjdFx+7pjJZALyIacg2XdXGZa9ju8oTusLFf4xwIqc=
X-Google-Smtp-Source: AGHT+IFARBw2lTsbhF1oMGXW610myopo0JWTdAHeJibzs9AwXoyAUkWlmPqGSF8c2i+fbKrUSAgh9Q==
X-Received: by 2002:a17:90a:77c4:b0:2da:95ea:da99 with SMTP id 98e67ed59e1d1-2e18456ecd1mr236432a91.7.1727798881658;
        Tue, 01 Oct 2024 09:08:01 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:08:01 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:28 -0700
Subject: [PATCH 23/33] riscv signal: save and restore of shadow stack for
 signal
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-23-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
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
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_090802_463433_96E95131 
X-CRM114-Status: GOOD (  25.29  )
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

Save shadow stack pointer in sigcontext structure while delivering signal.
Restore shadow stack pointer from sigcontext on sigreturn.

As part of save operation, kernel uses `ssamoswap` to save snapshot of
current shadow stack on shadow stack itself (can be called as a save
token). During restore on sigreturn, kernel retrieves token from top of
shadow stack and validates it. This allows that user mode can't arbitrary
pivot to any shadow stack address without having a token and thus provide
strong security assurance between signaly delivery and sigreturn window.

Use ABI compatible way of saving/restoring shadow stack pointer into
signal stack. This follows what Vector extension, where extra registers
are placed in a form of extension header + extension body in the stack.
The extension header indicates the size of the extra architectural
states plus the size of header itself, and a magic identifier of the
extension. Then, the extensions body contains the new architectural
states in the form defined by uapi.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/usercfi.h         | 10 ++++
 arch/riscv/include/uapi/asm/ptrace.h     |  4 ++
 arch/riscv/include/uapi/asm/sigcontext.h |  1 +
 arch/riscv/kernel/signal.c               | 80 ++++++++++++++++++++++++++++++++
 arch/riscv/kernel/usercfi.c              | 57 +++++++++++++++++++++++
 5 files changed, 152 insertions(+)

diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index 099204d0cd4a..8da61b005d0a 100644
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
@@ -72,6 +76,12 @@ void set_indir_lp_lock(struct task_struct *task);
 
 #define set_indir_lp_lock(task)
 
+#define restore_user_shstk(tsk, shstk_ptr) -EINVAL
+
+#define save_user_shstk(tsk, saved_shstk_ptr) -EINVAL
+
+#define get_active_shstk(task) 0
+
 #endif /* CONFIG_RISCV_USER_CFI */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index a38268b19c3d..659ea3af5680 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -127,6 +127,10 @@ struct __riscv_v_regset_state {
  */
 #define RISCV_MAX_VLENB (8192)
 
+struct __sc_riscv_cfi_state {
+	unsigned long ss_ptr;   /* shadow stack pointer */
+};
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/include/uapi/asm/sigcontext.h b/arch/riscv/include/uapi/asm/sigcontext.h
index cd4f175dc837..f37e4beffe03 100644
--- a/arch/riscv/include/uapi/asm/sigcontext.h
+++ b/arch/riscv/include/uapi/asm/sigcontext.h
@@ -10,6 +10,7 @@
 
 /* The Magic number for signal context frame header. */
 #define RISCV_V_MAGIC	0x53465457
+#define RISCV_ZICFISS_MAGIC		0x9487
 #define END_MAGIC	0x0
 
 /* The size of END signal context header. */
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 014ac1024b85..77cbc4a01e49 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -22,11 +22,13 @@
 #include <asm/vector.h>
 #include <asm/csr.h>
 #include <asm/cacheflush.h>
+#include <asm/usercfi.h>
 
 unsigned long signal_minsigstksz __ro_after_init;
 
 extern u32 __user_rt_sigreturn[2];
 static size_t riscv_v_sc_size __ro_after_init;
+static size_t riscv_zicfiss_sc_size __ro_after_init;
 
 #define DEBUG_SIG 0
 
@@ -139,6 +141,62 @@ static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
 	return copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
 }
 
+static long save_cfiss_state(struct pt_regs *regs, void __user *sc_cfi)
+{
+	struct __sc_riscv_cfi_state __user *state = sc_cfi;
+	unsigned long ss_ptr = 0;
+	long err = 0;
+
+	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI) || !is_shstk_enabled(current))
+		return 0;
+
+	/*
+	 * Save a pointer to shadow stack itself on shadow stack as a form of token.
+	 * A token on shadow gives following properties
+	 * - Safe save and restore for shadow stack switching. Any save of shadow stack
+	 *   must have had saved a token on shadow stack. Similarly any restore of shadow
+	 *   stack must check the token before restore. Since writing to shadow stack with
+	 *   address of shadow stack itself is not easily allowed. A restore without a save
+	 *   is quite difficult for an attacker to perform.
+	 * - A natural break. A token in shadow stack provides a natural break in shadow stack
+	 *   So a single linear range can be bucketed into different shadow stack segments. Any
+	 *   sspopchk will detect the condition and fault to kernel as sw check exception.
+	 */
+	err |= save_user_shstk(current, &ss_ptr);
+	err |= __put_user(ss_ptr, &state->ss_ptr);
+	if (unlikely(err))
+		return -EFAULT;
+
+	return riscv_zicfiss_sc_size;
+}
+
+static long __restore_cfiss_state(struct pt_regs *regs, void __user *sc_cfi)
+{
+	struct __sc_riscv_cfi_state __user *state = sc_cfi;
+	unsigned long ss_ptr = 0;
+	long err;
+
+	/*
+	 * Restore shadow stack as a form of token stored on shadow stack itself as a safe
+	 * way to restore.
+	 * A token on shadow gives following properties
+	 * - Safe save and restore for shadow stack switching. Any save of shadow stack
+	 *   must have had saved a token on shadow stack. Similarly any restore of shadow
+	 *   stack must check the token before restore. Since writing to shadow stack with
+	 *   address of shadow stack itself is not easily allowed. A restore without a save
+	 *   is quite difficult for an attacker to perform.
+	 * - A natural break. A token in shadow stack provides a natural break in shadow stack
+	 *   So a single linear range can be bucketed into different shadow stack segments.
+	 *   sspopchk will detect the condition and fault to kernel as sw check exception.
+	 */
+	err = __copy_from_user(&ss_ptr, &state->ss_ptr, sizeof(unsigned long));
+
+	if (unlikely(err))
+		return err;
+
+	return restore_user_shstk(current, ss_ptr);
+}
+
 struct arch_ext_priv {
 	__u32 magic;
 	long (*save)(struct pt_regs *regs, void __user *sc_vec);
@@ -149,6 +207,10 @@ struct arch_ext_priv arch_ext_list[] = {
 		.magic = RISCV_V_MAGIC,
 		.save = &save_v_state,
 	},
+	{
+		.magic = RISCV_ZICFISS_MAGIC,
+		.save = &save_cfiss_state,
+	},
 };
 const size_t nr_arch_exts = ARRAY_SIZE(arch_ext_list);
 
@@ -200,6 +262,12 @@ static long restore_sigcontext(struct pt_regs *regs,
 
 			err = __restore_v_state(regs, sc_ext_ptr);
 			break;
+		case RISCV_ZICFISS_MAGIC:
+			if (!is_shstk_enabled(current) || size != riscv_zicfiss_sc_size)
+				return -EINVAL;
+
+			err = __restore_cfiss_state(regs, sc_ext_ptr);
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -220,6 +288,10 @@ static size_t get_rt_frame_size(bool cal_all)
 		if (cal_all || riscv_v_vstate_query(task_pt_regs(current)))
 			total_context_size += riscv_v_sc_size;
 	}
+
+	if (is_shstk_enabled(current))
+		total_context_size += riscv_zicfiss_sc_size;
+
 	/*
 	 * Preserved a __riscv_ctx_hdr for END signal context header if an
 	 * extension uses __riscv_extra_ext_header
@@ -363,6 +435,11 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
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
@@ -491,6 +568,9 @@ void __init init_rt_signal_env(void)
 {
 	riscv_v_sc_size = sizeof(struct __riscv_ctx_hdr) +
 			  sizeof(struct __sc_riscv_v_state) + riscv_v_vsize;
+
+	riscv_zicfiss_sc_size = sizeof(struct __riscv_ctx_hdr) +
+			  sizeof(struct __sc_riscv_cfi_state);
 	/*
 	 * Determine the stack space required for guaranteed signal delivery.
 	 * The signal_minsigstksz will be populated into the AT_MINSIGSTKSZ entry
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
