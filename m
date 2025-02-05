Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE032C02199
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 02:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tWZuXcpoiQvWKJxlIra5S65tkHcJk+ZXShwOiX/68E=; b=ULeeo1r4g6cgp+
	T3HHbuh0bkjKfLdmTgEnyS6uywQXZWRrtv2AdGW4Rn8fh82oFKfLd3E2PRUygP1Ko1zlWyL2YcHxe
	S3vKnZGWY6h+cB+002IbJw/fqROiEuS3zhxKbsnCgkDxg0tQ3Dn9EDhO/yiYJAD7aDP+f12LtjU4j
	NMy1sxgto/z3f6vsBowwg8SAaFK7hzanuKYf4P+WN3wJ7WCp7TOM/tPM5iGqT0oxoqeIAvE1OqxI1
	t8lY7+L4HNkHATE+bjy3b9TsGfJOw7D3+qhzaar4DnOHxXp6uZFmA7pynIO/DvPS3XsGoa0/xEOTs
	nhqWBEwFXw9utn5dNiCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVBx-000000028Ub-35uz;
	Wed, 05 Feb 2025 02:31:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7V-000000021WI-0NZc
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 01:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Zfw9OtoVzzM7Z5oL2c+Ej/yDm51xyr1WNtqXJN3fx8s=; b=e5RQWjDzaauNdGShFvl+yMGYz4
	jazPJRtFr4fThctDMHdgMB5slwAJV3glpOVgjEO40VhH2ecWQf2gAdSlinhpPwjL/FWpTUPIItoKT
	hgxZE3+E4ZAGyuodwhJD/MPjlrv+QvtqV3u+Zd8GzSf0VOQuZC8wOxQBVcx/ewVadejbooM9hvCeH
	WptUkXpQzEZc1QIWGgiksFhJKm7vqxEJqMHQE+ZIZfrOBtbmGjp00EesnCwgo0L14PmDz1X68+C1A
	B8AGz01cU7YrjaPmI3xCjQPCxP6QnMOh15n+E3h8h+riaiArJXDUlmdHVFTicagTisyKvEi9AnGY+
	iyFJXd3w==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7R-00000003c5P-1OEO
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:22:23 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so8250689a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718537; x=1739323337; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zfw9OtoVzzM7Z5oL2c+Ej/yDm51xyr1WNtqXJN3fx8s=;
        b=ieeYk2v/Wh99Kc0oR4aCaGJ4qa0YZ1Z7HNTZ5jUasR0pweXJR4Xr3DT+11wqxZ/mdA
         nuehCofK9O3+7t3wfiYP+hGdJLewKtnOC7Fqfr/rjjchU+JYD+bzqHMih80ubGnZomkZ
         zwp8OZETTL3c0S4XE0DYClz7A4krJdDYkguNzxygps6CxS7tzgqo2PrPC1d3a1rLCwWx
         wWNG08DVXXJhIb8UeaI/KIY4zCMnpubXvuI6ZRmPmuxEtJlTy7SIqlefxWJ3TC8fo1++
         KRaj0WiFjJaO8XoFgIBKDW4WZEph9t+eQUObwAjj0hpz69tWP4i7QobQY0i6JSTxyoP2
         Zr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718537; x=1739323337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zfw9OtoVzzM7Z5oL2c+Ej/yDm51xyr1WNtqXJN3fx8s=;
        b=vJz2bxLgrQQXvRZoONzrkTKbwBiprZq78MvAg+H05IOSJ5G57GWEyVP7owVYU1wuT2
         ZEX01BDN4LXls1X79XQSBG92xxX+rc+fuZHnIMelU9o493bgg/yMWNxmCQsr3bJFTZvA
         xAjkwFJMpZS14R+PNRVFR3ETyGDXqO9fVSC89usf+YqyAizbw0YVo26FASJSXludcjwx
         vyxmJDAVQYkxR1TTPMlcfXFdr6Hrhip4ZJfCNkKwB8yGRHXQyaDgd4w833BB9H96i5zz
         TzcLb4bjcbi9vMTuxiOU2yrlmI9Sh5yPoacU8HWsZMABrXybqMVGdEaavajnlYylbjuT
         vJpw==
X-Forwarded-Encrypted: i=1; AJvYcCVlJiYeyhB/SEpc53jkZlQZcc3PTfkzKD/52J8SgVtG4jA24AvvTKZnU46Br3eTYCpvdC4GmZ9mtTqPnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwG+YIFiemROjme6Iqm2gojmDAt5lAbz2vioEL8Dn198OD9V6kN
	Llya8J4ONaIF/a9632D6kw3DqnmQWUODhvQcp833Zl7dE+b0gN9LraLfx10zAjnkk4LrLqYmqeN
	M
X-Gm-Gg: ASbGncuu6uAYBA2cNyX3rZC7o1ZaHSovFsZO4Ap1wtp95Te2VpNQuxzOKpr1N0e4srf
	hG6j0b1KqKmxvt7mmIl19cF2N1hzXriK9DYXBPJp7SBT00mmtivnYusCYXIgFosH2u2yuaWv0Fs
	51C6fz48F2BU2WPxyW3RIRLq5nVO7jbIsrtzP87OWcOppJErrPmihAx+oWP28HTaUyj+OoWB2Hz
	mxGmp7qGVL9ixpH5/ndEf5PyX++5RCTHhd9k2XQAeLbAHrPtBWzPUrkGK4DAgRR5e10PaJV2rox
	G4op3Nj7isMi3bitlCwIBJxrbA==
X-Google-Smtp-Source: AGHT+IEV2JRI/u7jJ+DMFTPXNcstQgsHVFgvv9cPCm1RBElDa+SvGAhtxoxPORcsFm2xZuy3PMKfmQ==
X-Received: by 2002:a05:6a00:3991:b0:728:e2cc:bfd6 with SMTP id d2e1a72fcca58-730351dd5d3mr1505033b3a.18.1738718536922;
        Tue, 04 Feb 2025 17:22:16 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:16 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:21:59 -0800
Subject: [PATCH v9 12/26] riscv: Implements arch agnostic shadow stack
 prctls
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-12-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_012221_386301_537CB37B 
X-CRM114-Status: GOOD (  24.85  )
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/usercfi.h |  18 ++++++-
 arch/riscv/kernel/process.c      |   8 +++
 arch/riscv/kernel/usercfi.c      | 107 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index 82d28ac98d76..c4dcd256f19a 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -7,6 +7,7 @@
 
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
+#include <linux/prctl.h>
 
 struct task_struct;
 struct kernel_clone_args;
@@ -14,7 +15,8 @@ struct kernel_clone_args;
 #ifdef CONFIG_RISCV_USER_CFI
 struct cfi_status {
 	unsigned long ubcfi_en : 1; /* Enable for backward cfi. */
-	unsigned long rsvd : ((sizeof(unsigned long) * 8) - 1);
+	unsigned long ubcfi_locked : 1;
+	unsigned long rsvd : ((sizeof(unsigned long) * 8) - 2);
 	unsigned long user_shdw_stk; /* Current user shadow stack pointer */
 	unsigned long shdw_stk_base; /* Base address of shadow stack */
 	unsigned long shdw_stk_size; /* size of shadow stack */
@@ -27,6 +29,12 @@ void set_shstk_base(struct task_struct *task, unsigned long shstk_addr, unsigned
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
 
@@ -42,6 +50,14 @@ bool is_shstk_enabled(struct task_struct *task);
 
 #define is_shstk_enabled(task) false
 
+#define is_shstk_locked(task) false
+
+#define is_shstk_allocated(task) false
+
+#define set_shstk_lock(task)
+
+#define set_shstk_status(task, enable)
+
 #endif /* CONFIG_RISCV_USER_CFI */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 99acb6342a37..cd11667593fe 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -153,6 +153,14 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
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
index 73cf87dab186..37d6fb8144e7 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -24,6 +24,16 @@ bool is_shstk_enabled(struct task_struct *task)
 	return task->thread_info.user_cfi_state.ubcfi_en ? true : false;
 }
 
+bool is_shstk_allocated(struct task_struct *task)
+{
+	return task->thread_info.user_cfi_state.shdw_stk_base ? true : false;
+}
+
+bool is_shstk_locked(struct task_struct *task)
+{
+	return task->thread_info.user_cfi_state.ubcfi_locked ? true : false;
+}
+
 void set_shstk_base(struct task_struct *task, unsigned long shstk_addr, unsigned long size)
 {
 	task->thread_info.user_cfi_state.shdw_stk_base = shstk_addr;
@@ -42,6 +52,23 @@ void set_active_shstk(struct task_struct *task, unsigned long shstk_addr)
 	task->thread_info.user_cfi_state.user_shdw_stk = shstk_addr;
 }
 
+void set_shstk_status(struct task_struct *task, bool enable)
+{
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
@@ -262,3 +289,83 @@ void shstk_release(struct task_struct *tsk)
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
