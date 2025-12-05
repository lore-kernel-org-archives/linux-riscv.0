Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06B9D339B5
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 18:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dj/VrM6Zmu65NFIK92nPmjA7Hj4bqpaZy8TTlBGBATY=; b=ORGvjFj/VrvwG/
	W4NorxpcEO/8rxhSW2+aAi4YOtljdiS558zVscLsvsyenkno+Bh3yZWODLH73leblEkv93Cq8Im02
	EBKImtjXqBQOvI2/kOlMa4V6KOlETraA1rIuNf6VhwuLeZnWZJ3HixAw682v4m8IfvWFIjuFzt2DU
	6Dt5VgatLnD/X26Og0aezwtvig2W8M0Ksu1ubgPT3TW25Pjhoob9XCH75adA/9jJOx44MwJo1Pl3+
	F0HNtvgaYyjWRyQuHPAbyhYf8CZ2XGhkr1IRCzhdY48cW3C+tR9/Z0URKxNnnOEi/Qs4mKY2IzA46
	Z7m9Arn9Gux6Hxtgj6GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRagA-00000009pNp-0Psy;
	Fri, 05 Dec 2025 18:37:18 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRag6-00000009pJX-3HGN
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 18:37:16 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-bc0d7255434so1367476a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 10:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764959834; x=1765564634; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAn4eyifcNxkK4OJtkwndj7H0VvpEsY65F3VIiHjxfM=;
        b=SDWTUAZx7DZ4XHW71zFQUDXKaCd7W6BgwwKeodCwulYeGYdvat7aKT0q+hFWzi/+KT
         Ihp6cMf2FVs9GYgEH1rGO3CqwxXV100KXPZ0CBN4fxI/97ABSSzxlBA2Ff1bKc53obA4
         5l4Lgmll74+Y1MePSmgxUQjL5Dx7t8EsjmTzDLdX+QmivFr0k1opUsjMyBqOFZkncDcK
         ohd0xJZVCgQVud7qq/G5ZiCD8knF1/IJq983/wh/olZSY1fUs5mue60SnJYv9Vp3FlTw
         Pvlqsih1y4GFgQWbvc+k6929o+fNx25A9/tYBUXNihGX7nvMLoW/L3ufpkvvfukBsN7z
         s8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959834; x=1765564634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sAn4eyifcNxkK4OJtkwndj7H0VvpEsY65F3VIiHjxfM=;
        b=LY9bxN3eisKPtpPXX2HQva27SKJBia8ZGQm4OGEKK1wFTZpK8G7lG3//3nrS4ir6FQ
         CuONl7JHPexpG4JbgVCF5prVIUQFfmmhB3Hpo6zbcV3AODoMVDTu9gY31CyqrJwLPWsT
         LGjMK/sejrhDQXksTLZSmMi9XKRAWbcNClb2JMQ7RXw2O93Zt0cvF1Ct8ByoqmZP0zo1
         nh9j+UisY9bewk7BTiZqHXuMMFrHnQLtKmoOByPSXEKgpCmTeT3o+ulg8TNwNyv6HXzq
         x5jlFC+i8CL1OEAWSZYCpLA5AV46qufFIueXmfANWfOljhLPQo+97dZhVfXxU/bPlkYI
         surg==
X-Forwarded-Encrypted: i=1; AJvYcCWOmET3rHigKeP4Q0R4emgMc2PKXu+9drgzChqnZRq26zFpPVmwRHqD4HcG0wJpVMO1LGmagLD4aUHEKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYuVd/fbbpoQuMAfjeL8LR19fp56IQ4mN99K87oq9ejzDSt0ri
	ZXdqHkuHXY6ZRLkYcyHeiyrs/cdehs23IZipmXJX5Ld2uSVToEu6X7pjmmliFFPKtPk=
X-Gm-Gg: ASbGncuEuLXiwtLVBi2SKV3vDS+3S6RPuxnFJqBcp9L+faaddtmnMkVQC5WtbwJ4rmu
	QDxfaz8ckr7p3BORN/D7xkOBaKZHbMtJS3GcXnn68DjMv5cPLVIJ4/6/DdqSd2yusiTI/f3oAPB
	80vG3z10CLZq3X+I906g54Yp08UYH1qBgL+X2TL9JBCdsMq6v1cCNDYBwhu9oefoTbELA9Bxvlr
	tc18JLAOqnvWEAAT2pnNA0ZhAaCyTBITkwHIrzYfbqxls5XiKVTDHm/VipkTfiZqHvZddKMsQsu
	QDtqE6JX5j0nTXyIZvydYcSutiBEDP4suTwwVsCMyFmnc/0yvBw+RqFHvtrH8SDj7hGYcTLAqVf
	3/mKxiEOIICyRiWU87xLnsi2LozpJ2QEgcvJxjeiJ0H7tgQHwMkSZku5akTa2PDzP+fTgQ4n0Ax
	B0ftWRZXbS208foJL+EJll
X-Google-Smtp-Source: AGHT+IG64Acxde938dcxABEZbefcI0gMEZLWKp4sV8uSZlEc78JPa42NKhLAawHgjmfRVmwABlx/2g==
X-Received: by 2002:a05:7300:680b:b0:2a4:3593:4678 with SMTP id 5a478bee46e88-2abc72014d8mr94602eec.20.1764959833888;
        Fri, 05 Dec 2025 10:37:13 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm23933342eec.1.2025.12.05.10.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:37:13 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 05 Dec 2025 10:36:58 -0800
Subject: [PATCH v25 12/28] riscv: Implements arch agnostic shadow stack
 prctls
MIME-Version: 1.0
Message-Id: <20251205-v5_user_cfi_series-v25-12-8a3570c3e145@rivosinc.com>
References: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
In-Reply-To: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, 
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764959808; l=7555;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=UB7DB8iQ68E73LowKHzcTBS0aUXVgW818RL3xhZs1m8=;
 b=jY0Ye8tXm1M4GhO/ew1+Un49NiTb6fE7NaK3Ij5c8XKnBwpoNcxgCErmIAEWbbf2epzEabR5p
 7GGuUVjsjyWDNVTDVqywxntigfck96T1EyVj/8Rjqko1kY7v6dZv7XA
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_103714_894880_16E2AEEE 
X-CRM114-Status: GOOD (  22.68  )
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

Implement architecture agnostic prctls() interface for setting and getting
shadow stack status.

prctls implemented are PR_GET_SHADOW_STACK_STATUS,
PR_SET_SHADOW_STACK_STATUS and PR_LOCK_SHADOW_STACK_STATUS.

As part of PR_SET_SHADOW_STACK_STATUS/PR_GET_SHADOW_STACK_STATUS, only
PR_SHADOW_STACK_ENABLE is implemented because RISCV allows each mode to
write to their own shadow stack using `sspush` or `ssamoswap`.

PR_LOCK_SHADOW_STACK_STATUS locks current configuration of shadow stack
enabling.

Reviewed-by: Zong Li <zong.li@sifive.com>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/usercfi.h |  16 ++++++
 arch/riscv/kernel/process.c      |   8 +++
 arch/riscv/kernel/usercfi.c      | 110 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 134 insertions(+)

diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index a16a5dff8b0e..d71093f414df 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -7,6 +7,7 @@
 
 #ifndef __ASSEMBLER__
 #include <linux/types.h>
+#include <linux/prctl.h>
 
 struct task_struct;
 struct kernel_clone_args;
@@ -14,6 +15,7 @@ struct kernel_clone_args;
 #ifdef CONFIG_RISCV_USER_CFI
 struct cfi_state {
 	unsigned long ubcfi_en : 1; /* Enable for backward cfi. */
+	unsigned long ubcfi_locked : 1;
 	unsigned long user_shdw_stk; /* Current user shadow stack pointer */
 	unsigned long shdw_stk_base; /* Base address of shadow stack */
 	unsigned long shdw_stk_size; /* size of shadow stack */
@@ -26,6 +28,12 @@ void set_shstk_base(struct task_struct *task, unsigned long shstk_addr, unsigned
 unsigned long get_shstk_base(struct task_struct *task, unsigned long *size);
 void set_active_shstk(struct task_struct *task, unsigned long shstk_addr);
 bool is_shstk_enabled(struct task_struct *task);
+bool is_shstk_locked(struct task_struct *task);
+bool is_shstk_allocated(struct task_struct *task);
+void set_shstk_lock(struct task_struct *task);
+void set_shstk_status(struct task_struct *task, bool enable);
+
+#define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK (PR_SHADOW_STACK_ENABLE)
 
 #else
 
@@ -41,6 +49,14 @@ bool is_shstk_enabled(struct task_struct *task);
 
 #define is_shstk_enabled(task) false
 
+#define is_shstk_locked(task) false
+
+#define is_shstk_allocated(task) false
+
+#define set_shstk_lock(task) do {} while (0)
+
+#define set_shstk_status(task, enable) do {} while (0)
+
 #endif /* CONFIG_RISCV_USER_CFI */
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 72d35adc6e0e..a137d3483646 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -156,6 +156,14 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	regs->epc = pc;
 	regs->sp = sp;
 
+	/*
+	 * clear shadow stack state on exec.
+	 * libc will set it later via prctl.
+	 */
+	set_shstk_status(current, false);
+	set_shstk_base(current, 0, 0);
+	set_active_shstk(current, 0);
+
 #ifdef CONFIG_64BIT
 	regs->status &= ~SR_UXL;
 
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 872e0c52e034..0b77b812e4d7 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -24,6 +24,16 @@ bool is_shstk_enabled(struct task_struct *task)
 	return task->thread_info.user_cfi_state.ubcfi_en;
 }
 
+bool is_shstk_allocated(struct task_struct *task)
+{
+	return task->thread_info.user_cfi_state.shdw_stk_base;
+}
+
+bool is_shstk_locked(struct task_struct *task)
+{
+	return task->thread_info.user_cfi_state.ubcfi_locked;
+}
+
 void set_shstk_base(struct task_struct *task, unsigned long shstk_addr, unsigned long size)
 {
 	task->thread_info.user_cfi_state.shdw_stk_base = shstk_addr;
@@ -42,6 +52,26 @@ void set_active_shstk(struct task_struct *task, unsigned long shstk_addr)
 	task->thread_info.user_cfi_state.user_shdw_stk = shstk_addr;
 }
 
+void set_shstk_status(struct task_struct *task, bool enable)
+{
+	if (!cpu_supports_shadow_stack())
+		return;
+
+	task->thread_info.user_cfi_state.ubcfi_en = enable ? 1 : 0;
+
+	if (enable)
+		task->thread.envcfg |= ENVCFG_SSE;
+	else
+		task->thread.envcfg &= ~ENVCFG_SSE;
+
+	csr_write(CSR_ENVCFG, task->thread.envcfg);
+}
+
+void set_shstk_lock(struct task_struct *task)
+{
+	task->thread_info.user_cfi_state.ubcfi_locked = 1;
+}
+
 /*
  * If size is 0, then to be compatible with regular stack we want it to be as big as
  * regular stack. Else PAGE_ALIGN it and return back
@@ -260,3 +290,83 @@ void shstk_release(struct task_struct *tsk)
 	vm_munmap(base, size);
 	set_shstk_base(tsk, 0, 0);
 }
+
+int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
+{
+	unsigned long bcfi_status = 0;
+
+	if (!cpu_supports_shadow_stack())
+		return -EINVAL;
+
+	/* this means shadow stack is enabled on the task */
+	bcfi_status |= (is_shstk_enabled(t) ? PR_SHADOW_STACK_ENABLE : 0);
+
+	return copy_to_user(status, &bcfi_status, sizeof(bcfi_status)) ? -EFAULT : 0;
+}
+
+int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
+{
+	unsigned long size = 0, addr = 0;
+	bool enable_shstk = false;
+
+	if (!cpu_supports_shadow_stack())
+		return -EINVAL;
+
+	/* Reject unknown flags */
+	if (status & ~PR_SHADOW_STACK_SUPPORTED_STATUS_MASK)
+		return -EINVAL;
+
+	/* bcfi status is locked and further can't be modified by user */
+	if (is_shstk_locked(t))
+		return -EINVAL;
+
+	enable_shstk = status & PR_SHADOW_STACK_ENABLE;
+	/* Request is to enable shadow stack and shadow stack is not enabled already */
+	if (enable_shstk && !is_shstk_enabled(t)) {
+		/* shadow stack was allocated and enable request again
+		 * no need to support such usecase and return EINVAL.
+		 */
+		if (is_shstk_allocated(t))
+			return -EINVAL;
+
+		size = calc_shstk_size(0);
+		addr = allocate_shadow_stack(0, size, 0, false);
+		if (IS_ERR_VALUE(addr))
+			return -ENOMEM;
+		set_shstk_base(t, addr, size);
+		set_active_shstk(t, addr + size);
+	}
+
+	/*
+	 * If a request to disable shadow stack happens, let's go ahead and release it
+	 * Although, if CLONE_VFORKed child did this, then in that case we will end up
+	 * not releasing the shadow stack (because it might be needed in parent). Although
+	 * we will disable it for VFORKed child. And if VFORKed child tries to enable again
+	 * then in that case, it'll get entirely new shadow stack because following condition
+	 * are true
+	 *  - shadow stack was not enabled for vforked child
+	 *  - shadow stack base was anyways pointing to 0
+	 * This shouldn't be a big issue because we want parent to have availability of shadow
+	 * stack whenever VFORKed child releases resources via exit or exec but at the same
+	 * time we want VFORKed child to break away and establish new shadow stack if it desires
+	 *
+	 */
+	if (!enable_shstk)
+		shstk_release(t);
+
+	set_shstk_status(t, enable_shstk);
+	return 0;
+}
+
+int arch_lock_shadow_stack_status(struct task_struct *task,
+				  unsigned long arg)
+{
+	/* If shtstk not supported or not enabled on task, nothing to lock here */
+	if (!cpu_supports_shadow_stack() ||
+	    !is_shstk_enabled(task) || arg != 0)
+		return -EINVAL;
+
+	set_shstk_lock(task);
+
+	return 0;
+}

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
