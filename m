Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC52C5475B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 19:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=33FXZ6avULFwz6prB8kmftFSLlLJjB+c9RQiZrdYidQ=; b=aZ0
	cEQyZwcT01m82iRfu/NrfOmZooX5tUwFlyoRabCAMXSYUZZSZ3uYncZ8SQj5JTq6gYBtiJtfAYP19
	gB69+Mgqs0vGi3hnQ8GaZM/7a3F2hX80o/Z0KrzzbNDwMFB9q3EVaPHxZANQmrTVaok04k4+BwJh7
	rYKudfoX9MsptaSRJs2nDaK949hP5/cqlFTpvmudm+QWRgBeR5+ddcsWjYdXNQCveTWAjxYhdiJ0P
	Zs1BM+WlK+Q8/ipOB3XkWAUZx8WqDLlXCQlucISgw2YFLWFTnDF06upkBHUOdwhJ3RJYPR0C7Ho5V
	Mdgp+fT1KT+xdHx64EInLRxxVPzAG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjlNO-00000002wkz-3U7X;
	Mon, 11 Mar 2024 19:31:58 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjlNL-00000002wkT-0G5K
	for linux-riscv@lists.infradead.org;
	Mon, 11 Mar 2024 19:31:56 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6e5ef8a99c3so3081039b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 12:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710185510; x=1710790310; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cy5o6m+sWD55XX6nTI+EYS+h0yuQMLX62AkaGtKJN/Q=;
        b=ezpQG0mDmuuru7dWez4jRpT2MXvcV8j5HNIMybCZ9fRQpUqc+vstEVU6k89djI4o9Z
         HmW51r1ndDUQm/vdxNHXO0dbNziWOpQhCFBWUexiQOGvulzzRIF++gOADXvPyx0wHgSu
         H5ssqltUYEnmhdcnJ2G2dZdpz1p/iBd9ZUgOhYqY0ywM+U7yy8yVpqDKl/TFS6TQa8sZ
         4GtPsOdDrB/S5xyTC/r9/k4cYCfC5Vn+xSmrMKTgSaHQihwMHGLqUmDeiuGod2uzgYtU
         djeCpzKvBCC2SuOqdhHMpCLUN4Z98J8xAZsrcADpp+yTx1kdMOUWSykYoTZDJm4IP8NA
         awdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710185510; x=1710790310;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cy5o6m+sWD55XX6nTI+EYS+h0yuQMLX62AkaGtKJN/Q=;
        b=R+ySkyYh2ggjYD8Gsff9P/rnYOoW2L0/OmWTo5c+GPq9iA053LJb7wLhzYFb6SnxV/
         90CQMxVC6t66EMfkYC7/+e0pfUgXZjdvkLc/XL7bqGd9bigc7FHpb8kQzLvz7DqvL3pW
         NMYIm6PvbCNYWjg8EWiub8n9T5+xYSH3CayVpmatXBsc04qc1SbEsjkOdq+HeIU/ng/2
         xbdP5gIGxS7N+gV3xMNjmDQHvnphzDCGLTS4Wt24XYNGXrnvxdPa+3bueD+vWHht4VQX
         pbeyZf6WaD2hxqbMYbIj+s1XDtC5c7PGnmL4B8ViNjll7nkNCJEWkR+OxW/RZwmBPYjN
         wNyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW28B2HdvnIGYcZZhNJqkgpMG6txZGuc5zhHmKidkM1ZvP3HAeHt2I6j4r+pseXPAcV6BQYvYKhVKFcvazIeTuQ7Vhx7NjBFK4gsm+0MjvX
X-Gm-Message-State: AOJu0YwoHdNRN+/QjaUqt1JvEqQVyLExlfe28F5FSkvVHvGRUCMK01x8
	c7OIbbz3ZdRsJLOExyACeQGHXzvoIUUSBXKKdD1vSRf9F3hD53WX82gwQ9dmZPaS9b7BAxOJpz2
	ItW4Ys5tTp0y0mxRhl73VkRGRnA==
X-Google-Smtp-Source: AGHT+IFl5rL/5hZzllSQT4kNPhf7K+Mzylld0CDU7EGjFVl6h6YIMbKzhC0pm5GcEpFQvIHX+1rha7stYdM8mqFbCkQ=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6a00:2ea7:b0:6e6:4946:93e3 with
 SMTP id fd39-20020a056a002ea700b006e6494693e3mr151620pfb.3.1710185510021;
 Mon, 11 Mar 2024 12:31:50 -0700 (PDT)
Date: Mon, 11 Mar 2024 19:31:44 +0000
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5091; i=samitolvanen@google.com;
 h=from:subject; bh=P9wUwpcw3NHUEai0EY+p4WNxdtLcGXphsLbKEdtDEg4=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBl71wfJnj+5L8FG37zVyJNxfMfNJoY0VJs0yMLB
 xU3BtR6b7+JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZe9cHwAKCRBMtfaEi7xW
 7vAYC/9OQ9Z2KvfsxsRPYjStOgFF960iLZz4U2Yg1Pc04nqTJhJOjAA0LlXHVE6XdGCQ1MK2xTv
 OtI1cV6vtQnAMtpfTPLFdvIwuZ7Op/oYW6FpyU/OLXUZHYssSN6b7f06hUuWdsIDjznZtaHuKaY
 yFBq8JY8H/+aWai3ZaR8aAAUpZti8u3nbZiePGtPhrgQz/PyBjy4Qux9cHB7dCasmi01Km62Od3
 GmaGGdIVhg4OQ4LJag7l9WlxfAIqgCWAojhrslIMlDg24sTaGc6KTE7NRwOS8Jx5Op+MvJGVA9c
 C7Gmr975CCDLfX0MxbY1PmLctEXAJ77Ft9BsCg68UI1YUBgFJD8S/dBlrdbHpfFo/1UeYHIjFdz
 cs1NQ4lXP1lnxvRItHh5uODri1JStub2sD6YywSrGnF/3qkqpI0ey8ybdthU1mYp4WMWFPQwdAA d78nKkyQmeeQTFJU3AiRd6nZpO4pnRf1iCIAOPk55HAB1cx9UwVaE61BAY5z/eARLf3Oo=
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240311193143.2981310-2-samitolvanen@google.com>
Subject: [PATCH] riscv: Fix syscall wrapper for >word-size arguments
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Kees Cook <keescook@chromium.org>, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Khem Raj <raj.khem@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_123155_173564_B5E35B49 
X-CRM114-Status: GOOD (  11.66  )
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

The current syscall wrapper macros break 64-bit arguments on
rv32 because they only guarantee the first N input registers are
passed to syscalls that accept N arguments. According to the
calling convention, values twice the word size reside in register
pairs and as a result, syscall arguments don't always have a
direct register mapping on rv32.

Instead of using `__MAP(x,__SC_LONG,__VA_ARGS__)` to declare the
type of the `__se(_compat)_sys_*` functions on rv32, change the
function declarations to accept `ulong` arguments and alias them
to the actual syscall implementations, similarly to the existing
macros in include/linux/syscalls.h. This matches previous
behavior and ensures registers are passed to syscalls as-is, no
matter which argument types they expect.

Fixes: 08d0ce30e0e4 ("riscv: Implement syscall wrappers")
Reported-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/include/asm/syscall_wrapper.h | 53 +++++++++++++++++-------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/syscall_wrapper.h b/arch/riscv/include/asm/syscall_wrapper.h
index eeec04b7dae6..980094c2e976 100644
--- a/arch/riscv/include/asm/syscall_wrapper.h
+++ b/arch/riscv/include/asm/syscall_wrapper.h
@@ -12,25 +12,51 @@
 
 asmlinkage long __riscv_sys_ni_syscall(const struct pt_regs *);
 
-#define SC_RISCV_REGS_TO_ARGS(x, ...)				\
-	__MAP(x,__SC_ARGS					\
-	      ,,regs->orig_a0,,regs->a1,,regs->a2		\
+#ifdef CONFIG_64BIT
+
+#define __SYSCALL_SE_DEFINEx(x, prefix, name, ...)					\
+	static long __se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
+	static long __se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
+
+#define SC_RISCV_REGS_TO_ARGS(x, ...)							\
+	__MAP(x,__SC_ARGS								\
+	      ,,regs->orig_a0,,regs->a1,,regs->a2					\
 	      ,,regs->a3,,regs->a4,,regs->a5,,regs->a6)
 
+#else
+/*
+ * Use type aliasing to ensure registers a0-a6 are correctly passed to the syscall
+ * implementation when >word-size arguments are used.
+ */
+#define __SYSCALL_SE_DEFINEx(x, prefix, name, ...)					\
+	__diag_push();									\
+	__diag_ignore(GCC, 8, "-Wattribute-alias",					\
+			"Type aliasing is used to sanitize syscall arguments");		\
+	static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong, 	\
+					ulong)						\
+			__attribute__((alias(__stringify(___se_##prefix##name))));	\
+	__diag_pop();									\
+	static long noinline ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
+	static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
+
+#define SC_RISCV_REGS_TO_ARGS(x, ...) \
+	regs->orig_a0,regs->a1,regs->a2,regs->a3,regs->a4,regs->a5,regs->a6
+
+#endif /* CONFIG_64BIT */
+
 #ifdef CONFIG_COMPAT
 
 #define COMPAT_SYSCALL_DEFINEx(x, name, ...)						\
 	asmlinkage long __riscv_compat_sys##name(const struct pt_regs *regs);		\
 	ALLOW_ERROR_INJECTION(__riscv_compat_sys##name, ERRNO);				\
-	static long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
 	static inline long __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
-	asmlinkage long __riscv_compat_sys##name(const struct pt_regs *regs)		\
+	__SYSCALL_SE_DEFINEx(x, compat_sys, name, __VA_ARGS__)				\
 	{										\
-		return __se_compat_sys##name(SC_RISCV_REGS_TO_ARGS(x,__VA_ARGS__));	\
+		return __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_ARGS__));	\
 	}										\
-	static long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		\
+	asmlinkage long __riscv_compat_sys##name(const struct pt_regs *regs)		\
 	{										\
-		return __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_ARGS__));	\
+		return __se_compat_sys##name(SC_RISCV_REGS_TO_ARGS(x,__VA_ARGS__));	\
 	}										\
 	static inline long __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
 
@@ -51,19 +77,18 @@ asmlinkage long __riscv_sys_ni_syscall(const struct pt_regs *);
 #define __SYSCALL_DEFINEx(x, name, ...)						\
 	asmlinkage long __riscv_sys##name(const struct pt_regs *regs);		\
 	ALLOW_ERROR_INJECTION(__riscv_sys##name, ERRNO);			\
-	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
 	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
-	asmlinkage long __riscv_sys##name(const struct pt_regs *regs)		\
-	{									\
-		return __se_sys##name(SC_RISCV_REGS_TO_ARGS(x,__VA_ARGS__));	\
-	}									\
-	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		\
+	__SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)				\
 	{									\
 		long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));	\
 		__MAP(x,__SC_TEST,__VA_ARGS__);					\
 		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));		\
 		return ret;							\
 	}									\
+	asmlinkage long __riscv_sys##name(const struct pt_regs *regs)		\
+	{									\
+		return __se_sys##name(SC_RISCV_REGS_TO_ARGS(x,__VA_ARGS__));	\
+	}									\
 	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
 
 #define SYSCALL_DEFINE0(sname)							\
-- 
2.44.0.278.ge034bb2e1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
