Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFE6CD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 10:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AoGCteorw+JAcxtAoUpTE0/9R42Cu07CGxkecp5EQxs=; b=CElkS09mEEG9m2
	meuObRqlpiD0yAoWYrYdu9YS06IG+MqpK9dx43LTg26VIqzT8TI5Yr7M7CI4kyE0bQiiSK7nrLqT7
	iDUbhFyCwWp9A7XFCE+v7TJNbR5n2L+qsWe7UpX28QmCxk7Z1qtyZQfCU+bxYth5jrFGeE4iaZlW7
	lVCzqJUP5TdRcsDBNySFMGOfE3tj6rs7SOvIRXepzYVbJsNwEvQFyHKXXoe1jxuKQWeJsNovk6ipR
	pgJwFZEaj4obzhh8BWKrzjHK35siUkLpf/7vaw2OVRL9U7NSQ6fmcThUfq0MnCLLyKBFy3mShKVNt
	hLnj34xfcIw4qwnSc+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNptG-00000008488-0s90;
	Fri, 15 May 2026 10:35:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNptE-0000000847n-2uIy
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 10:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF11260008;
	Fri, 15 May 2026 10:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2948AC2BCB0;
	Fri, 15 May 2026 10:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778841331;
	bh=xHT782td4/pqewKHklx9mvORJH5xH6wMrIYOffPUzP0=;
	h=From:Date:Subject:To:Cc:From;
	b=B89axjR2weA87MJnC1wmVawwfwIuJ4aLnuDMf8Ks0YLp3LAnAOcmXuE2NImN0ogDx
	 6CokhxxD31U7vOHOp30HkLILoefD5ge7528YpHnd8R3Qroey67aggOWvVWi0Crsk0L
	 GfcOicAYIGMUoaSLEe+hcAVC0NlG6ybV+d/lBl12OlfuzIBrRqPODEFuZVFgqiCQtu
	 dfNSvaPPYTuq4qMosYquIwpJrKw+uzd2AIjaf/uFyTFeY0pX3gIzLRw7+GiBh1v4Rr
	 +fFictysr4XQDfLCLmtFmkkiObLPD7H8F+h0RiC6bM8ntoTHrWKulAdEZke/icHivU
	 jy83f9o3RD8kA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 15 May 2026 19:35:18 +0900
Subject: [PATCH] Disable -Wattribute-alias for clang-23 and newer
MIME-Version: 1.0
Message-Id: <20260515-syscall-disable-attribute-alias-for-clang-v1-1-9a9d95d41df6@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ7CMAwEv1L5jKWkairgK4iDk7pgZLUoTitQ1
 b8T4LZz2JkNjLOwwbnZIPMqJvNUwR8aSHeabowyVIbWtb0LvkN7WyJVHMQoKiOVkiUupS4VMhz
 njEnrE4P3XYjx5Nyxh+p7Zh7l9Wtdrn+2JT44lW8A9v0DVn7HnY0AAAA=
X-Change-ID: 20260514-syscall-disable-attribute-alias-for-clang-51145bb90086
To: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5348; i=nathan@kernel.org;
 h=from:subject:message-id; bh=xHT782td4/pqewKHklx9mvORJH5xH6wMrIYOffPUzP0=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFls3z4se8c2s25jzbRshcI5P/atWNhSYBF9ZNcpHh4mu
 fCnXvnyHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiqaGMDKeUKxR2MbpsDGKP
 YErz31G0WM/kZNJqUbfdIpzN6QEfTzP8L5uZIW1THuDGI3hdY8nU5NbXDbsCdlVIWXKUZpYfXav
 LCAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

Clang recently added support for -Wattribute-alias [1], which results in
the same warnings that necessitated commit bee20031772a ("disable
-Wattribute-alias warning for SYSCALL_DEFINEx()") for GCC.

  kernel/time/itimer.c:325:1: error: alias and aliasee have different types 'long (unsigned int)' and 'long (typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long)') [-Werror,-Wattribute-alias]
    325 | SYSCALL_DEFINE1(alarm, unsigned int, seconds)
        | ^
  include/linux/syscalls.h:225:36: note: expanded from macro 'SYSCALL_DEFINE1'
    225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
        |                                    ^
  include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
    236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
        |         ^
  include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DEFINEx'
    251 |                 __attribute__((alias(__stringify(__se_sys##name))));    \
        |                                ^
  kernel/time/itimer.c:325:1: note: aliasee is declared here
  include/linux/syscalls.h:225:36: note: expanded from macro 'SYSCALL_DEFINE1'
    225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
        |                                    ^
  include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFINEx'
    236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
        |         ^
  include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DEFINEx'
    255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))  \
        |                         ^
  <scratch space>:16:1: note: expanded from here
     16 | __se_sys_alarm
        | ^

Disable the warnings in the same way for clang-23 and newer.

Cc: stable@vger.kernel.org
Closes: https://github.com/ClangBuiltLinux/linux/issues/2163
Link: https://github.com/llvm/llvm-project/commit/40da6920a0d71d49dfa2392b09153600b0759f5e [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
I plan to take this via my clang-fixes tree for 7.1.
---
 arch/riscv/include/asm/syscall_wrapper.h | 2 ++
 include/linux/compat.h                   | 2 ++
 include/linux/compiler-clang.h           | 6 ++++++
 include/linux/syscalls.h                 | 2 ++
 4 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/syscall_wrapper.h b/arch/riscv/include/asm/syscall_wrapper.h
index ac80216549ff..366a5354caa5 100644
--- a/arch/riscv/include/asm/syscall_wrapper.h
+++ b/arch/riscv/include/asm/syscall_wrapper.h
@@ -32,6 +32,8 @@ asmlinkage long __riscv_sys_ni_syscall(const struct pt_regs *);
 	__diag_push();									\
 	__diag_ignore(GCC, 8, "-Wattribute-alias",					\
 			"Type aliasing is used to sanitize syscall arguments");		\
+	__diag_ignore(clang, 23, "-Wattribute-alias",					\
+			"Type aliasing is used to sanitize syscall arguments");		\
 	static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong, 	\
 					ulong)						\
 			__attribute__((alias(__stringify(___se_##prefix##name))));	\
diff --git a/include/linux/compat.h b/include/linux/compat.h
index 56cebaff0c91..a1ce6d559db9 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -72,6 +72,8 @@
 	__diag_push();								\
 	__diag_ignore(GCC, 8, "-Wattribute-alias",				\
 		      "Type aliasing is used to sanitize syscall arguments");\
+	__diag_ignore(clang, 23, "-Wattribute-alias",				\
+		      "Type aliasing is used to sanitize syscall arguments");\
 	asmlinkage long compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
 		__attribute__((alias(__stringify(__se_compat_sys##name))));	\
 	ALLOW_ERROR_INJECTION(compat_sys##name, ERRNO);				\
diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
index e1123dd28486..527e4e136020 100644
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@ -131,6 +131,12 @@
 #define __diag_str(s)		__diag_str1(s)
 #define __diag(s)		_Pragma(__diag_str(clang diagnostic s))
 
+#if CONFIG_CLANG_VERSION >= 230000
+#define __diag_clang_23(s)	__diag(s)
+#else
+#define __diag_clang_23(s)
+#endif
+
 #define __diag_clang_13(s)	__diag(s)
 
 #define __diag_ignore_all(option, comment) \
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index f5639d5ac331..97e3411b49d2 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -247,6 +247,8 @@ static inline int is_syscall_trace_event(struct trace_event_call *tp_event)
 	__diag_push();							\
 	__diag_ignore(GCC, 8, "-Wattribute-alias",			\
 		      "Type aliasing is used to sanitize syscall arguments");\
+	__diag_ignore(clang, 23, "-Wattribute-alias",			\
+		      "Type aliasing is used to sanitize syscall arguments");\
 	asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
 		__attribute__((alias(__stringify(__se_sys##name))));	\
 	ALLOW_ERROR_INJECTION(sys##name, ERRNO);			\

---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260514-syscall-disable-attribute-alias-for-clang-51145bb90086

Best regards,
--  
Cheers,
Nathan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
