Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181F9C54ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 05:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oioQODVroBwpDjqxifxg+sqwl/oSV/Uq8ZjK8hASHeE=; b=l+imV+ruTeLpo/
	chXFbkNWgml7shXFnUnR5UKMVOBpTwGd54qg/MwQ0U0ovMqL3mRE8er8jIWEZz5WzFY5BNvn1GYDL
	EH4gimmSCm9oV8K09OAcqVmNRN1XF6GKQFRlvoZLyVRtidD1rX3g4wKQamZIbqVoQsyb0mXGmEe4z
	bsoNAdlQXAm4IUwH9OXzbyJxF3euaIOqKqZBu6Xbcy49Q+JVdwdLZzIzB+G8sXJJSDfq7uYHi0hs7
	wyMCXBuGvuH0P2vLGUUgWXhxH6BE3bIttj7c8W6it8RSXhxUF/jjxQNO/Iiz25Z98gXdJS7UiSFZJ
	c4W+pxQQtoWB8oHjT3/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL0u-000000030LK-2uRU;
	Fri, 23 May 2025 05:32:12 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL0r-000000030Ij-3Z7Q
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:32:11 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-74264d1832eso10787858b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 22:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978329; x=1748583129; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5J/5mZxT+k+LmAKU7G8MkVD/8s7ODhQZCUl5WVjl9l4=;
        b=D+lk/a5i8Dg4EBj6BbjNt19DJXbtRWq4XOOM2WRlCK2IGiJv7S29Htkls3A2lOY/YI
         aJRbg0C3DtQeKEUg/biAWVjkG9Hrb2zgxWLTGiiD1aDFBazBOni2Q2vpQB9h8n7PmDRe
         bT75f6cUKSSfTOCNs7UaOHybDvohFI3AUaNn9/+EAU8XxKNGRIoeWvCprqD4rUIXhVsv
         +8lFgWKZocEX3IWe4ZkiIlMm+7yf+1kmyZnG3Ws8yk6eNtgIOX+1rpTbGt5LgO6PZ8HK
         rofE63WRODvLbBZ0RZ7in+yns0gkHUJThDl6Po0jlugrZEepzprFFLgN0hNLVGjQk1cU
         o/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978329; x=1748583129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5J/5mZxT+k+LmAKU7G8MkVD/8s7ODhQZCUl5WVjl9l4=;
        b=WcenSD0f2hNCblqqSNU2QteLxc3gMQCDyyuXSrBKRQtce1COXiEoJxMxjcXvI+KXy9
         81lxeF1pjRIj4j6/KsKQG8PKZNa6YFedJgEGvGTSFNqn5kv2hV6XoerPvUjMpmvL5eiJ
         Sf1hWaiBKgZ72K4qwYd3utmW+rTqC8yv16eoVNptc+LsneV21wddAY1XCDI02XOCTS5c
         WEIMxXfBWXkEmdWTjQxTNzPmBwoyB/4wAz+B6enggRmxdixMHUSfLaIV6CfGbreSgIFL
         RINYgm6/fsY1k3UShZHFw1RCjcFYfv+Bo+u/yf9xUFq07ZHqVPWqu0tb8ol+eKklAlju
         KXOg==
X-Forwarded-Encrypted: i=1; AJvYcCX7itP/O64qitxAUtfc6mDT9XB5z8MMzYRQMnFzROdENnmG2mbcvujOzOVmersYrgiB3EmbQaeG0w8hnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9Sx/FdX+zZpuiG4FK0toe6zi2/2C09JBmNLUXPcX4OqyhL96o
	Li9k9IXC3F1qsP7akUTfgkPCQBAKvfMLG6ZtsNpV+vXkf9ky5SheF1Ru3xgsxuqwRlc=
X-Gm-Gg: ASbGncuaqEpZVKYVXqNqa3msn9fcdjvkuq1gzSahhZEr6xzDMb1RrdxB8o9SGmTW2OE
	pTobYnwYE/JfZsiE84C6mf1tDcuiWN6d1aH20xP1j4erEFr59tX7HbPsUkMa4bAY/zv33dOGnRT
	plLOc3fC6gPsv5McR9GQsJBbhD0DcL2iKF0LH3t1KrNOc/5jNRPiBdd1/i8+dAD3enYzGGRZ7a6
	vkx/8Rwlxuk6vltuiMC/brUq+S7g6fj5dnRJ08WCqmJK8ESAVj84SDXcNLDNjQrRx6X+7nDyBMA
	gX5YMxGvUVL0DoKlSRZJhNh8QNiKTJ6RT7+MWN9L+y+UUd0tCEL1ZFnMSup2Sw==
X-Google-Smtp-Source: AGHT+IFyQuepg0hzZeCt1JntR2Wsb/feeKyMOrKezkULGdABKI1cAeVktT5QjCly+fai6r+PK6/nKw==
X-Received: by 2002:a05:6a00:92a3:b0:742:a02e:dd8f with SMTP id d2e1a72fcca58-745ed9090f2mr2099941b3a.22.1747978329098;
        Thu, 22 May 2025 22:32:09 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:32:08 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:20 -0700
Subject: [PATCH v16 17/27] riscv/signal: save and restore of shadow stack
 for signal
MIME-Version: 1.0
Message-Id: <20250522-v5_user_cfi_series-v16-17-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
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
 Deepak Gupta <debug@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_223210_050985_070F2B5C 
X-CRM114-Status: GOOD (  24.55  )
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
 arch/riscv/kernel/signal.c               | 86 ++++++++++++++++++++++++++++++++
 arch/riscv/kernel/usercfi.c              | 56 +++++++++++++++++++++
 5 files changed, 157 insertions(+)

diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index cea7908cdb3a..68da5b7b79fd 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -8,6 +8,7 @@
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
 #include <linux/prctl.h>
+#include <linux/errno.h>
 
 struct task_struct;
 struct kernel_clone_args;
@@ -34,6 +35,9 @@ bool is_shstk_locked(struct task_struct *task);
 bool is_shstk_allocated(struct task_struct *task);
 void set_shstk_lock(struct task_struct *task);
 void set_shstk_status(struct task_struct *task, bool enable);
+unsigned long get_active_shstk(struct task_struct *task);
+int restore_user_shstk(struct task_struct *tsk, unsigned long shstk_ptr);
+int save_user_shstk(struct task_struct *tsk, unsigned long *saved_shstk_ptr);
 bool is_indir_lp_enabled(struct task_struct *task);
 bool is_indir_lp_locked(struct task_struct *task);
 void set_indir_lp_status(struct task_struct *task, bool enable);
@@ -71,6 +75,12 @@ void set_indir_lp_lock(struct task_struct *task);
 
 #define set_indir_lp_lock(task)
 
+#define restore_user_shstk(tsk, shstk_ptr) -EINVAL
+
+#define save_user_shstk(tsk, saved_shstk_ptr) -EINVAL
+
+#define get_active_shstk(task) 0UL
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
index a5e3d54fe54b..1bcda11e0680 100644
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
 
@@ -140,6 +142,62 @@ static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
 	return copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
 }
 
+static long save_cfiss_state(struct pt_regs *regs, void __user *sc_cfi)
+{
+	struct __sc_riscv_cfi_state __user *state = sc_cfi;
+	unsigned long ss_ptr = 0;
+	long err = 0;
+
+	if (!is_shstk_enabled(current))
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
@@ -150,6 +208,10 @@ struct arch_ext_priv arch_ext_list[] = {
 		.magic = RISCV_V_MAGIC,
 		.save = &save_v_state,
 	},
+	{
+		.magic = RISCV_ZICFISS_MAGIC,
+		.save = &save_cfiss_state,
+	},
 };
 
 const size_t nr_arch_exts = ARRAY_SIZE(arch_ext_list);
@@ -202,6 +264,12 @@ static long restore_sigcontext(struct pt_regs *regs,
 
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
@@ -223,6 +291,16 @@ static size_t get_rt_frame_size(bool cal_all)
 			total_context_size += riscv_v_sc_size;
 	}
 
+	if (is_shstk_enabled(current))
+		total_context_size += riscv_zicfiss_sc_size;
+
+	/*
+	 * Preserved a __riscv_ctx_hdr for END signal context header if an
+	 * extension uses __riscv_extra_ext_header
+	 */
+	if (total_context_size)
+		total_context_size += sizeof(struct __riscv_ctx_hdr);
+
 	frame_size += total_context_size;
 
 	frame_size = round_up(frame_size, 16);
@@ -359,6 +437,11 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
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
@@ -487,6 +570,9 @@ void __init init_rt_signal_env(void)
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
index 2ebe789caa6b..8bc3e1e3f712 100644
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
 	if (!cpu_supports_shadow_stack())
@@ -169,6 +174,57 @@ static int create_rstor_token(unsigned long ssp, unsigned long *token_addr)
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
+			"%s[%d]: bad restore token in %s: pc=%p sp=%p, token=%p, shstk_ptr=%p\n",
+			tsk->comm, task_pid_nr(tsk), __func__, (void *)(task_pt_regs(tsk)->epc),
+			(void *)(task_pt_regs(tsk)->sp), (void *)token, (void *)shstk_ptr);
+		return -EINVAL;
+	}
+
+	/* all checks passed, set active shstk and return success */
+	set_active_shstk(tsk, token);
+	return 0;
+}
+
 static unsigned long allocate_shadow_stack(unsigned long addr, unsigned long size,
 					   unsigned long token_offset, bool set_tok)
 {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
