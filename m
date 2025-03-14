Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7732C35FFC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 22:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LAf6MslLH1W1Qudsmw0JxdiT7ib3uJj4Ssg/wObdBvc=; b=mNGHByxhep+Mp4
	izZpJ+N3stA82jLxMuYvUvSH46ltBAP9UMlUU7yMIaR4tN0bhZeGyqNoyhzCKnk8u9BtMo28QqqRJ
	znBNG5Bb+kfwZUs/PHdkzeqiV/KMXGs1trnCfhJcBqcjd9tZwvsoG173d7UNzNzd+rfaOc+GAR/iP
	jNNF000kNaxvoJ+7aqHkRldclk9PW9jrJCtJw7qMmqsJYT3wsWqxmY0bW2kohkoWdkgN+HfHqdI1k
	s0vTQqf1fcNEQ/HPj7aio7eyQDUAoEVkONHOffGJD9kVyUy2rmcdzrh4uWSot/QBbPnU9nVRIDfPY
	mHhIffRwHXfKrMJrz1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttDs4-0000000FSzR-3662;
	Fri, 14 Mar 2025 22:51:16 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCqO-0000000FMnC-4AdK
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:45:30 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-601b1132110so1194166eaf.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988727; x=1742593527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qihiC//CQppmEvCBgeNt37whYo0mSsmsLXBW9eHBYhI=;
        b=Cb/5G5pcE3Vfuf0/fUw6z9qC80/0IhiljDsPBFzGESPNndEbuhQy0hyvDZ8VCS9zBy
         NFOCkcYjetXSfUvqtunkD/itrwbFDnDkxnBMgkWyVnQ+vkiyRJxLlph1fRhFKcS43wkt
         HxiLq24kT3ee888jWBUpbRdxgguuJxehqfMbyJKHBU13Gcr7XUZyVz1YKvzMVAk5mz2Z
         CC8uLRwr9DV6V83jX0M5dSDURa00o4bFsuHrA2vYI5B+9Xd8Ej2I81cKKDtdNSA6zBjI
         Jzt41/iycqzw+ioRcAoOycWDx2iFBZDh+3kEh9X7c25P+Sc14FqUKRwikUqN26kVUhXA
         CbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988727; x=1742593527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qihiC//CQppmEvCBgeNt37whYo0mSsmsLXBW9eHBYhI=;
        b=NpHYAFcF1aU/eV7XENF3eCcDJx8xEWz1TnfyQrg98L86kgXYFaQuyzGHlzY+rW4iFq
         ECYbuKs/M1wpxZssCXYHugfGvp3bOL+pbXbEQM8nnrgAxJXFjEg3ThJVD/0WW2sVmx4N
         tNAsP585v8sdJSR3IzbHFRWO1AN8KMOptoWW9J+RSjV8y8nXWp9EQpAcqkg+8TXQBWxz
         qRjxzeN6UI0LyaNNrxsQ+mzkv73mq34dXFjZu60vwmUrCpQp8pZ0EaSG489GDB23sJZ5
         oa1lOLx+cdNelx9AUDVLRFAeaZfdE8k1f86foDQYj6w+0M7rsDRG0cn5xHmDrECVX4/4
         LkxA==
X-Forwarded-Encrypted: i=1; AJvYcCULOEiC1BjN9BspVyaNYHNeVuCQ6TXfNlkULxnZ0cOCPGCnJ8y09fBmXCZkwHCR6AKH6ST6QSeru9IDPA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx34RXpb1YLk9veHYkU91dDHxtMb93qXnHRK84wuFiPdBx/FQ15
	O9t5ovGyifARRORZ6IrqlNkTku1Lp+U0smr6/XuoHInYyTC74AOgNM094g4OFUD4Qn9RiKGDF08
	s
X-Gm-Gg: ASbGncs1G3+Aeqn5lDjoRXRaHatCWycMx0Mr7A9XURce+clP2+0eklKRsNwepk1uOOL
	pf6betG0anVoLBC1nPfrGvk89knGVGtrXAeQlGrYOgEDY6eg8o1cur9RUi9sdZ7MXRIzX7msKCB
	51pYG4dcHLyyR9esS/Buie+n0uXFcCTzgPEmG9MHZpwP37JCp5uwgWlj9YcYwaV13Wa/MTUr75v
	xDXNJczmJHtKRWnfY9cZH/uoWI6+NxUBjlYRQEa456RNo4a6DWDpxGN8eFgj+EumtQDx9qKm8Qh
	xKbjedsOsinqmjwOKH+5Wj4NKMZesRE50svsfHS2SX4TOWjn1yiRznfFq6MhA/PYQw==
X-Google-Smtp-Source: AGHT+IEHTIgzeGQs95nPlCKytt5z5yea/NHClPHPp1BUNubi4Uv9wCiZoYw+B2CYuOVgi1HkJrteRg==
X-Received: by 2002:a17:902:da90:b0:224:10a2:cae7 with SMTP id d9443c01a7336-225e0af9d92mr50201135ad.40.1741988417057;
        Fri, 14 Mar 2025 14:40:17 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:40:16 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:38 -0700
Subject: [PATCH v12 19/28] riscv/ptrace: riscv cfi status and state via
 ptrace and in core files
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-19-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
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
X-CRM114-CacheID: sfid-20250314_144529_027046_E82F7087 
X-CRM114-Status: GOOD (  20.98  )
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

Expose a new register type NT_RISCV_USER_CFI for risc-v cfi status and
state. Intentionally both landing pad and shadow stack status and state
are rolled into cfi state. Creating two different NT_RISCV_USER_XXX would
not be useful and wastage of a note type. Enabling or disabling of feature
is not allowed via ptrace set interface. However setting `elp` state or
setting shadow stack pointer are allowed via ptrace set interface. It is
expected `gdb` might have use to fixup `elp` state or `shadow stack`
pointer.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/ptrace.h | 18 ++++++++
 arch/riscv/kernel/ptrace.c           | 83 ++++++++++++++++++++++++++++++++++++
 include/uapi/linux/elf.h             |  1 +
 3 files changed, 102 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 659ea3af5680..e6571fba8a8a 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -131,6 +131,24 @@ struct __sc_riscv_cfi_state {
 	unsigned long ss_ptr;   /* shadow stack pointer */
 };
 
+struct __cfi_status {
+	/* indirect branch tracking state */
+	__u64 lp_en : 1;
+	__u64 lp_lock : 1;
+	__u64 elp_state : 1;
+
+	/* shadow stack status */
+	__u64 shstk_en : 1;
+	__u64 shstk_lock : 1;
+
+	__u64 rsvd : sizeof(__u64) - 5;
+};
+
+struct user_cfi_state {
+	struct __cfi_status	cfi_status;
+	__u64 shstk_ptr;
+};
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index ea67e9fb7a58..df8b7c6ab671 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -19,6 +19,7 @@
 #include <linux/regset.h>
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
+#include <asm/usercfi.h>
 
 enum riscv_regset {
 	REGSET_X,
@@ -31,6 +32,9 @@ enum riscv_regset {
 #ifdef CONFIG_RISCV_ISA_SUPM
 	REGSET_TAGGED_ADDR_CTRL,
 #endif
+#ifdef CONFIG_RISCV_USER_CFI
+	REGSET_CFI,
+#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -184,6 +188,75 @@ static int tagged_addr_ctrl_set(struct task_struct *target,
 }
 #endif
 
+#ifdef CONFIG_RISCV_USER_CFI
+static int riscv_cfi_get(struct task_struct *target,
+			 const struct user_regset *regset,
+			 struct membuf to)
+{
+	struct user_cfi_state user_cfi;
+	struct pt_regs *regs;
+
+	regs = task_pt_regs(target);
+
+	user_cfi.cfi_status.lp_en = is_indir_lp_enabled(target);
+	user_cfi.cfi_status.lp_lock = is_indir_lp_locked(target);
+	user_cfi.cfi_status.elp_state = (regs->status & SR_ELP);
+
+	user_cfi.cfi_status.shstk_en = is_shstk_enabled(target);
+	user_cfi.cfi_status.shstk_lock = is_shstk_locked(target);
+	user_cfi.shstk_ptr = get_active_shstk(target);
+
+	return membuf_write(&to, &user_cfi, sizeof(user_cfi));
+}
+
+/*
+ * Does it make sense to allowing enable / disable of cfi via ptrace?
+ * Not allowing enable / disable / locking control via ptrace for now.
+ * Setting shadow stack pointer is allowed. GDB might use it to unwind or
+ * some other fixup. Similarly gdb might want to suppress elp and may want
+ * to reset elp state.
+ */
+static int riscv_cfi_set(struct task_struct *target,
+			 const struct user_regset *regset,
+			 unsigned int pos, unsigned int count,
+			 const void *kbuf, const void __user *ubuf)
+{
+	int ret;
+	struct user_cfi_state user_cfi;
+	struct pt_regs *regs;
+
+	regs = task_pt_regs(target);
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &user_cfi, 0, -1);
+	if (ret)
+		return ret;
+
+	/*
+	 * Not allowing enabling or locking shadow stack or landing pad
+	 * There is no disabling of shadow stack or landing pad via ptrace
+	 * rsvd field should be set to zero so that if those fields are needed in future
+	 */
+	if (user_cfi.cfi_status.lp_en || user_cfi.cfi_status.lp_lock ||
+	    user_cfi.cfi_status.shstk_en || user_cfi.cfi_status.shstk_lock ||
+	    !user_cfi.cfi_status.rsvd)
+		return -EINVAL;
+
+	/* If lpad is enabled on target and ptrace requests to set / clear elp, do that */
+	if (is_indir_lp_enabled(target)) {
+		if (user_cfi.cfi_status.elp_state) /* set elp state */
+			regs->status |= SR_ELP;
+		else
+			regs->status &= ~SR_ELP; /* clear elp state */
+	}
+
+	/* If shadow stack enabled on target, set new shadow stack pointer */
+	if (is_shstk_enabled(target))
+		set_active_shstk(target, user_cfi.shstk_ptr);
+
+	return 0;
+}
+#endif
+
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
 		.core_note_type = NT_PRSTATUS,
@@ -224,6 +297,16 @@ static const struct user_regset riscv_user_regset[] = {
 		.set = tagged_addr_ctrl_set,
 	},
 #endif
+#ifdef CONFIG_RISCV_USER_CFI
+	[REGSET_CFI] = {
+		.core_note_type = NT_RISCV_USER_CFI,
+		.align = sizeof(__u64),
+		.n = sizeof(struct user_cfi_state) / sizeof(__u64),
+		.size = sizeof(__u64),
+		.regset_get = riscv_cfi_get,
+		.set = riscv_cfi_set,
+	},
+#endif
 };
 
 static const struct user_regset_view riscv_user_native_view = {
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index b44069d29cec..b9daed4ab780 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -452,6 +452,7 @@ typedef struct elf64_shdr {
 #define NT_RISCV_CSR	0x900		/* RISC-V Control and Status Registers */
 #define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
 #define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control (prctl()) */
+#define NT_RISCV_USER_CFI	0x903		/* RISC-V shadow stack state */
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
 #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
 #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
