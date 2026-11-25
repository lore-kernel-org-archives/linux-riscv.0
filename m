Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6ED606D6F9
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 06:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZojK1aYB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o7Tt+62p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=OVuAKfTnhe9Kc608mi/Cm4K82a+5Ly+57J3xdBJGZN8=; b=ZojK1aYBmaet05mL2QWs8UbCth
	dT7ElLxNBZASJuQ+7khLcpvY2vUa0rdn+qVwuzVqFOPqGmBBpAK5csZTiMgTDYcSlpZBgVckWp3kG
	5AsbBCbOJwjPT+/K9np9IpJoLnP2ZE4htDqT9lyAgYBqmaY3ghMk0GEWSVBFWSXvMBHLpHFT4WGqg
	lXDta/2CvX27FgZsMC7IPE6y+ZkAkkziOhU34IsC/+wMkBsm31sjSOLw97gEChIqxObfxiWl12hUk
	ilXKhEqx+MrtSNUH3vVLUK0j4D/k5hFFo7jXH6S4xP41nsk8BFrIABuO/QDEiObhXlAclo5ui8Cd7
	rpJB5Eqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6J1-00000008YxX-0WJD;
	Wed, 25 Nov 2026 06:16:35 +0000
Received: from mail-dy1-x1348.google.com ([2607:f8b0:4864:20::1348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6IX-00000008YTn-2ud9
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 06:16:14 +0000
Received: by mail-dy1-x1348.google.com with SMTP id 5a478bee46e88-386c3309469so1559856eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 22:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587365; x=1796192165; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tq8mjhDcSofx5kxw5eKn8LOnbaPk4exl2xG2U8WBwwQ=;
        b=o7Tt+62pF0ZlUypLwPNCvs2wp7KwBef2a8qUut1Qs2kw4PF6NNckHvqOg2xgn2WyYn
         dx08T1MDgtekSHyZjH6nbdndz3/gSG/KEL1FZSDMMERLOu/rSfj+7Pm0EbUa0U2AF/fn
         8BreTZ70Gk00arlTTPWbNxY0xuINlwn+0Y3+E7ynsWlpq6YPiTwpRpIjHrTSjCPJeINp
         6GrrnzzIz3HY/qJes4sEDKy+d3AzQop/EiGEemMWEeEjF/uvX2QLkKJyWkx/kVFdRgx0
         MbfN5de9L/u9pQPYWBObCNUzLlBXJ4xafjnzxKK5f1yX8KsQUxLY+SGbpTSC6mUSf2Sw
         +IrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587365; x=1796192165;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tq8mjhDcSofx5kxw5eKn8LOnbaPk4exl2xG2U8WBwwQ=;
        b=N6AZtDQ4sAWHjHlaQBvOjnM9iYV7EZ/nxQTwpqqR1Rxhe/NkvlTB7neC8t/IapqhsU
         9Csx6YGtlCiIlaYfiQRdk9w557FvACqD93LFAX+jVOvZlVhZEQdobdFQZRm9BrQtJf9Z
         w3GlIvPs5r8MKlrXMB0z012IeMTnpfvgmbf3WnkNr2bAOpa6PTbq21G8vSR15ewATuSW
         16RpWCe3FTrw8U6d/hZImsKWhc8iKEy4dBV8Q9NjQG1DeF512KCGoMkITCbG0D7qLfkv
         J1vb57ZIv+UjKpaq2q9FudfozHwgz6QyDOt6+iD+HITNXIqpU9e8CkXV3w7USQtA9Slh
         kTzQ==
X-Forwarded-Encrypted: i=1; AL+hErH/XyBPCDjMcAbmdP91aQTMALwvohbok0kuN7DFP4qXNxdVq0/hvrRdG2V4O44Ua7fnZJjn7jjw58IArg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+UCJ0PxazpyTNMn/rQUqWUWLPBw+tReV/6oIyMpBynx1ke/12E
	CAyeGqBUl4eIR0XSMuc0PnAsQmNhNkB03pLb8gwz22pvWnoh0QslCLKh6oFY6uoqe052kBeDQ4U
	23U/6/AJTkA==
X-Received: from dyckx5.prod.google.com ([2002:a05:7300:c7c5:b0:386:c57e:ee36])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:4201:b0:385:b8f4:755d
 with SMTP id 5a478bee46e88-385b8f47ad3mr17347048eec.20.1795587364179; Tue, 24
 Nov 2026 22:16:04 -0800 (PST)
Date: Tue, 24 Nov 2026 22:14:57 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-5-irogers@google.com>
Subject: [RFC PATCH v2 04/30] x86: unwind_user: Support Minimal DWARF CFI user unwinding
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_221605_856045_DE464F07 
X-CRM114-Status: GOOD (  13.23  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Provide unwind_user_cfi_arch() in arch/x86/include/asm/unwind_user.h for
both 64-bit x86-64 (%rsp=7, %rbp=6, %rip=16) and 32-bit IA-32 compat
(%esp=4, %ebp=5, %eip=8) user tasks, and select HAVE_UNWIND_USER_CFI on
X86_64.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/x86/Kconfig                   |  1 +
 arch/x86/include/asm/unwind_user.h | 47 ++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 58dce0b66179..c8096cf66c38 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -300,6 +300,7 @@ config X86
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UACCESS_VALIDATION		if HAVE_OBJTOOL
 	select HAVE_UNSTABLE_SCHED_CLOCK
+	select HAVE_UNWIND_USER_CFI		if X86_64
 	select HAVE_UNWIND_USER_FP		if X86_64
 	select HAVE_USER_RETURN_NOTIFIER
 	select VDSO_GETRANDOM			if X86_64
diff --git a/arch/x86/include/asm/unwind_user.h b/arch/x86/include/asm/unwind_user.h
index 6e469044e4de..1a6be08968c3 100644
--- a/arch/x86/include/asm/unwind_user.h
+++ b/arch/x86/include/asm/unwind_user.h
@@ -4,9 +4,17 @@
 
 #ifdef CONFIG_UNWIND_USER
 
+#include <linux/unwind_dwarf_cfi.h>
 #include <asm/ptrace.h>
 #include <asm/uprobes.h>
 
+/**
+ * unwind_user_word_size() - Return the user-space word size in bytes on x86
+ * @regs: User-mode register state.
+ *
+ * Return: 8 for 64-bit user mode, 4 for 32-bit IA-32/compat mode, or 0 for
+ * VM86 mode stacks which cannot be unwound.
+ */
 static inline int unwind_user_word_size(struct pt_regs *regs)
 {
 	/* We can't unwind VM86 stacks */
@@ -15,22 +23,61 @@ static inline int unwind_user_word_size(struct pt_regs *regs)
 	return user_64bit_mode(regs) ? 8 : 4;
 }
 
+/**
+ * unwind_user_cfi_arch() - Populate x86/x86-64 DWARF register numbers
+ * @ws: User word size in bytes (8 for x86-64, 4 for i386).
+ * @arch: Output DWARF CFI architecture descriptor.
+ *
+ * Return: true if @ws is 4 or 8, false otherwise.
+ */
+static inline bool unwind_user_cfi_arch(unsigned int ws,
+					struct dwarf_cfi_arch *arch)
+{
+	if (ws == 8) {
+		*arch = (struct dwarf_cfi_arch){
+			.ws	= 8,
+			.sp_reg	= 7,	/* %rsp */
+			.fp_reg	= 6,	/* %rbp */
+			.ra_reg	= 16,	/* %rip */
+		};
+		return true;
+	}
+	if (ws == 4) {
+		*arch = (struct dwarf_cfi_arch){
+			.ws	= 4,
+			.sp_reg	= 4,	/* %esp */
+			.fp_reg	= 5,	/* %ebp */
+			.ra_reg	= 8,	/* %eip */
+		};
+		return true;
+	}
+	return false;
+}
+
 #endif /* CONFIG_UNWIND_USER */
 
 #ifdef CONFIG_HAVE_UNWIND_USER_FP
 
+/* Standard x86 frame record: {saved_bp, ret_addr} at [bp, bp + 2 * ws). */
 #define ARCH_INIT_USER_FP_FRAME(ws)			\
 	.cfa_off	=  2*(ws),			\
 	.ra_off		= -1*(ws),			\
 	.fp_off		= -2*(ws),			\
 	.use_fp		= true,
 
+/* At function entry before push %rbp: return address is at [sp, sp + ws). */
 #define ARCH_INIT_USER_FP_ENTRY_FRAME(ws)		\
 	.cfa_off	=  1*(ws),			\
 	.ra_off		= -1*(ws),			\
 	.fp_off		= 0,				\
 	.use_fp		= false,
 
+/**
+ * unwind_user_at_function_start() - Check if @regs is at a function entry point
+ * @regs: User-mode register state.
+ *
+ * Return: true if stopped on an entry uprobe before the frame prologue ran.
+ */
 static inline bool unwind_user_at_function_start(struct pt_regs *regs)
 {
 	return is_uprobe_at_func_entry(regs);
-- 
2.56.1.831.g720f3f5937-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
