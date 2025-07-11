Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E685C83F22
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 20:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggOUB8KvGt0Svfx664qZkvOVepWJJChxBQRWUeHocY0=; b=nKk9U09bOC6fjC
	r6L576FvXemjfMnZSPHRhznq+KKY0lGxUjHroug5CEC0JszsGIjd6zXwMyuKS9eKnBvX2nfE8p9xp
	1KJVmaaEj0kuH6qE3nIpqGDB4mNaaUApRQ+gCTS4R14s3jCXBj/JC5HHexoxyFFqicP6kNDcNO2hD
	LYHe+vVBxW0ANE3d3BDh5Kibh1Ck3yit9OoDn9Beq2PTRYAktCbbVTs7ck26bW8l65q0LL8JGCHzm
	Ey1oVHxqx5ibNDMUfqTrSiBXsqQ6citK/ipUF++FWKM03L76sN9W5uFtlQPmqkY7+W+TYY2o7SMQG
	f1llq12TS1SmfpW56zwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKeY-0000000FoXB-076h;
	Fri, 11 Jul 2025 20:47:30 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJiC-0000000Fgey-3nHN
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 19:47:14 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7494999de5cso1706163b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 12:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752263232; x=1752868032; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vv1pncyaii0eRn94le4SC/ImUZxnyr5HEUraE6PoZM=;
        b=lbGsazMwcnls8BcubKlwb7648GtqCmoc5NtKRahXS0FtJym+ra5uKLDGCBvyjbo7U3
         HiIKlhQKKHo8k9JBSsooivLeI22ro51XXEQDuNae18cHqFXazeysJ/onjGV9v+pdeEbH
         UZ2Pm+Z/V2GlMTJ/ZH9VcekcGZa817ah3/Q7WQOWE2h97i/A6hm7IApmPzYe1RxgaWE9
         NXqVFYGkPixiG/n3JraO4lHTRAryftrmaMPGritHjd58xbX13AUsi+6CUr+FOvdEHhlD
         DEG2TYBEXuyg2jnxLyKPa2S4JK3LfZaldaFSX9Z/La/Vi2sIwhDTH5cXnhiuH9cF21rZ
         eQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263232; x=1752868032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vv1pncyaii0eRn94le4SC/ImUZxnyr5HEUraE6PoZM=;
        b=sPHNzLhsVi7R+KdI5F3IxH4HvX7O7zKPeFx8QnxSUTUJaa7A+JnXvZQuCW7uVQhZxR
         1kBbC3PpYMkWwyzVjZXzs1tPMp26iR7XwlHAdHnyrKX9o8bAaAXGhzIhVZwQIGJvKSBR
         F9gZxvLXp1DNPx7bTh/luVE6c/X/WZjbZPqjhM6fVwX4Zz6mnrORp3wqhICwCkuweOXe
         8YvrvRA5pYrAMbZsrOS/EuvITIA/HLOVB6I1tCsb/ZU6wKUes/hPRLu8u8FShUllvoeU
         o5LGEODUL289lBTmFdsl9DrGuLR3UUMRtrVfVAPlOdCEnrOYRHjxnjlnwzaqzjQK2t5R
         FWsw==
X-Forwarded-Encrypted: i=1; AJvYcCVSmFJa5K0aMxTCMG7AMwT3RFZGz1HQVuI00EELz24fgDsvY+0O0TTW/+eMC9NUH0ELJnhO1nXD5TNZ4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3bCmGXMpGD+o21chs2mNPcDgnxk0olCcofSqHtspzhJuCCv5X
	/46jLUzqmC6WM/i0bmVP4jrUJUe45Yyq3aRcyQDKqM4Mhgmq5+EgCZNHkxR3h+kGYbs=
X-Gm-Gg: ASbGncsAaqwfkRKdh3RPUKrAZo13EvE//eJ76s5d9w1G86aWqRlHhdlqAtGDHz2zbE8
	kzbD02NMvOC2Crdm7SIjPvCZ+9anRViSO5Bn1Z/w6iC3lZufQ/zTDEh/fE7XAkyHcEmF6+hfX8H
	S2lj9MhLd13trliO8MXU4h++7ipGlB4Sc0iXmEsbjtG2J2nbHuyyTn727CnynEQWdFKbCSWKKDS
	2yYmeOuKXOkyrNhpJubpO+zhASs1MqBYq14rr1qRBLd6X6W+z0+7EPaKzP+N73heAQEqzsc929m
	D4B8iPhgFqEfPIe928QErssJdll3tbspXKueSx8uZraIvFp8fONsUb9tOmANO/Swh1hrkDGw+GJ
	QTsi/8Vs3ZhyQCBuU6zshPFASVWWlrg9m
X-Google-Smtp-Source: AGHT+IHxaaovUNC5axOtuYOHPp45qGCVIVxiaqBlmZipN/E7m5xjECHr0HievVkM4yrRuDF9OMtt7w==
X-Received: by 2002:a05:6a00:2da3:b0:748:2fa4:14c0 with SMTP id d2e1a72fcca58-74edd9409f9mr6037924b3a.0.1752263232209;
        Fri, 11 Jul 2025 12:47:12 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06995sm5840977b3a.38.2025.07.11.12.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:47:11 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 11 Jul 2025 12:46:24 -0700
Subject: [PATCH v18 19/27] riscv/ptrace: riscv cfi status and state via
 ptrace and in core files
MIME-Version: 1.0
Message-Id: <20250711-v5_user_cfi_series-v18-19-a8ee62f9f38e@rivosinc.com>
References: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
In-Reply-To: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
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
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_124712_953246_B1A479C5 
X-CRM114-Status: GOOD (  22.07  )
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
not be useful and wastage of a note type. Enabling, disabling and locking
of feature is not allowed via ptrace set interface. However setting `elp`
state or setting shadow stack pointer are allowed via ptrace set interface
. It is expected `gdb` might have use to fixup `elp` state or `shadow
stack` pointer.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/ptrace.h | 30 ++++++++++++
 arch/riscv/kernel/ptrace.c           | 95 ++++++++++++++++++++++++++++++++++++
 include/uapi/linux/elf.h             |  2 +
 3 files changed, 127 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 659ea3af5680..63e18ee2e050 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -131,6 +131,36 @@ struct __sc_riscv_cfi_state {
 	unsigned long ss_ptr;   /* shadow stack pointer */
 };
 
+#define PTRACE_CFI_LP_EN_BIT	0
+#define PTRACE_CFI_LP_LOCK_BIT	1
+#define PTRACE_CFI_ELP_BIT	2
+#define PTRACE_CFI_SS_EN_BIT	3
+#define PTRACE_CFI_SS_LOCK_BIT	4
+#define PTRACE_CFI_SS_PTR_BIT	5
+
+#define PTRACE_CFI_LP_EN_STATE		(1 << PTRACE_CFI_LP_EN_BIT)
+#define PTRACE_CFI_LP_LOCK_STATE	(1 << PTRACE_CFI_LP_LOCK_BIT)
+#define PTRACE_CFI_ELP_STATE		(1 << PTRACE_CFI_ELP_BIT)
+#define PTRACE_CFI_SS_EN_STATE		(1 << PTRACE_CFI_SS_EN_BIT)
+#define PTRACE_CFI_SS_LOCK_STATE	(1 << PTRACE_CFI_SS_LOCK_BIT)
+#define PTRACE_CFI_SS_PTR_STATE	(1 << PTRACE_CFI_SS_PTR_BIT)
+
+#define PRACE_CFI_STATE_INVALID_MASK	~(PTRACE_CFI_LP_EN_STATE | \
+					  PTRACE_CFI_LP_LOCK_STATE | \
+					  PTRACE_CFI_ELP_STATE | \
+					  PTRACE_CFI_SS_EN_STATE | \
+					  PTRACE_CFI_SS_LOCK_STATE | \
+					  PTRACE_CFI_SS_PTR_STATE)
+
+struct __cfi_status {
+	__u64 cfi_state;
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
index ea67e9fb7a58..933a3d26d33c 100644
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
@@ -184,6 +188,87 @@ static int tagged_addr_ctrl_set(struct task_struct *target,
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
+	memset(&user_cfi, 0, sizeof(user_cfi));
+	regs = task_pt_regs(target);
+
+	if (is_indir_lp_enabled(target)) {
+		user_cfi.cfi_status.cfi_state |= PTRACE_CFI_LP_EN_STATE;
+		user_cfi.cfi_status.cfi_state |= is_indir_lp_locked(target) ?
+						 PTRACE_CFI_LP_LOCK_STATE : 0;
+		user_cfi.cfi_status.cfi_state |= (regs->status & SR_ELP) ?
+						PTRACE_CFI_ELP_STATE : 0;
+	}
+
+	if (is_shstk_enabled(target)) {
+		user_cfi.cfi_status.cfi_state |= (PTRACE_CFI_SS_EN_STATE |
+						  PTRACE_CFI_SS_PTR_STATE);
+		user_cfi.cfi_status.cfi_state |= is_shstk_locked(target) ?
+						 PTRACE_CFI_SS_LOCK_STATE : 0;
+		user_cfi.shstk_ptr = get_active_shstk(target);
+	}
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
+	if ((user_cfi.cfi_status.cfi_state &
+	     (PTRACE_CFI_LP_EN_STATE | PTRACE_CFI_LP_LOCK_STATE |
+	      PTRACE_CFI_SS_EN_STATE | PTRACE_CFI_SS_LOCK_STATE)) ||
+	     (user_cfi.cfi_status.cfi_state & PRACE_CFI_STATE_INVALID_MASK))
+		return -EINVAL;
+
+	/* If lpad is enabled on target and ptrace requests to set / clear elp, do that */
+	if (is_indir_lp_enabled(target)) {
+		if (user_cfi.cfi_status.cfi_state &
+		    PTRACE_CFI_ELP_STATE) /* set elp state */
+			regs->status |= SR_ELP;
+		else
+			regs->status &= ~SR_ELP; /* clear elp state */
+	}
+
+	/* If shadow stack enabled on target, set new shadow stack pointer */
+	if (is_shstk_enabled(target) &&
+	    (user_cfi.cfi_status.cfi_state & PTRACE_CFI_SS_PTR_STATE))
+		set_active_shstk(target, user_cfi.shstk_ptr);
+
+	return 0;
+}
+#endif
+
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
 		.core_note_type = NT_PRSTATUS,
@@ -224,6 +309,16 @@ static const struct user_regset riscv_user_regset[] = {
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
index 819ded2d39de..ee30dcd80901 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -545,6 +545,8 @@ typedef struct elf64_shdr {
 #define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
 #define NN_RISCV_TAGGED_ADDR_CTRL "LINUX"
 #define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control (prctl()) */
+#define NN_RISCV_USER_CFI	"LINUX"
+#define NT_RISCV_USER_CFI	0x903		/* RISC-V shadow stack state */
 #define NN_LOONGARCH_CPUCFG	"LINUX"
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
 #define NN_LOONGARCH_CSR	"LINUX"

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
