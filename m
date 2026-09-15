Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1972C88E73
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pv/uatvypKsdDPfYQV3LzohjxQSLi3SaD6wbsu5zaE=; b=WeL+SN9CRKd7jb
	yrPjxECzXn5w6tpNBgjOhKSHqWZseSRbbTkMmUt+mhBzdmz0Ba/B6wlq6vfKbQER96UAc4W/x8ui7
	GlCbsiHuawbdFxBxStO/+6E9Qb4wMFco/7iVKyXehoOdM2cOQu675g7p1cszEoK60y6wmPI4Z+m+/
	QmzNl8zthX6aYDoyHr/gD/tiSsJr9CuoVTrkLf7bkkhdlj+fmlw586pIfJ2qiPI95zGc4jVPzxPmc
	XqmS5uzNCTf5VLkcnYw6ykbMKZA5zl3GCt0L7FRf57xVJKKgnuRzBaPGDBXnfoYdELxW4/kuoDI+U
	wNvQoKyeS2ZZRlz0EXmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P6T-00000005jmo-0cdE;
	Tue, 15 Sep 2026 09:05:25 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P6Q-00000005jlH-0jyR
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 09:05:23 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so1678648a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 02:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789463121; x=1790067921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRlgQjCaKIy4dVemjk8uAj0nWBn95cwji7bMZ4jS6zE=;
        b=X5Uk1waL4JwHLwGGY2qJsBgWGOiBy88szQLvyJvWnpQe+S4E7suyE+6PBL4KdFz+JL
         YFVPIf4kq7MLdUz75L9al7h6MJDg8su+i/DPhpyfmAzGdOq7uDnZy2r8FDOmpSaqFRCR
         7Cz4dnaH/tFJAPcIof63jI0OVm5a3jcas2GzSXdv8FMzBr5tY9h5Ztt0Hf/sox5gCn0f
         +zemEzV75AeUfXFOgIPNEbUzr/cL6loODqLUL7f3RpXDP5tIjUdYVeoO8ZyHu8o5LPar
         v1x13sFbkLPRGSq/Xxh7hd3cViwLL0rxiXhY5TBpt9VDbbG4tYxmzzMJrV0dZeAqGJlX
         sS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463121; x=1790067921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dRlgQjCaKIy4dVemjk8uAj0nWBn95cwji7bMZ4jS6zE=;
        b=DcopEqztgkErOdcwXGlDqWzRsx4RX1ue0P3v+suye7jhvwHZltjR840SeOREzPjUDo
         fhlqIRbS2f64dGHqCEoylYWSgtKAuzvtWg6Ja5GREse+ZHnF4Di7XN739/WFYGsbszcX
         oxuShM4xXnr5lCeOgZKyPJdMjEuStP8GxREaabfq58YSKO6GdrIQ5f+C53YwiwPn5tMp
         diS3PNn3c00HLmWTPyItHIyg5EPO8FizBuMZe62YWa1U4DIhrnYhBDbiNFSe+9WdThK7
         HCeGt3w5iruNxYW8uf9zdltUhDNfqgl94xgXHllyzObx4NFF17WAsWqNcl9hRtWJl2Le
         djgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvVRn/7W+SOLmSxJD8+KxiWAtqKosXvzMWox1ADceUAjr7CltV4cB9zcaHAFr5T14NHlM6xi0YG6kUhQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kXoVa7znfaXWXnmrNetC4eUh5dnlQMOdY8XuAQUkz6+Apw03dJ
	6dg6wJ7vUWAW72VUdtYbL+NKCad99Ago07bWE1JfR7u+zyfAtaPtzpHu
X-Gm-Gg: AYBFou01rHoj5ZjXKmFDgXtGiZTQbjKuNhfwwEIKwHcpwI63dYjmq5v//+NtqBZazwn
	rCASyMeqjkoDwfY1inzumvCqkshqBwsn7tkipTDxDhAROLMplxNdTU3WDn4zXS8VjKj0NBsBMV9
	blEbg92Mk3TzkLI4kdoPeYyrfNno9k4Tg86Ahn9GZ12OGSOT0m0THzb+6q1kZXqFQoRlS/teKcr
	L/b7v/ttbN9dvqoYMwC7BF5SGv/GCL8kW59VNgJFJv3QkwyGq9fAs7MPIYEmrlTHyHN60C+pZi+
	fjWRF/zCHU3ebmAzo0zj7y7ckyWb7gyeXUpfbEQVkKCJtSY+W1UtOCopiORjUmc79n1JuaP0wd0
	FPdFS+Dh9nSj/+mEK9BoPnia5t7wnMpy2KKMMMl4Ac5+gfGIujJPyGigFz4UbsZUquqfug2hvna
	Tz2UJzOkTMIK6NlKtAjk9mD3SY30fstSQnxeUGf11Ih2XdIKMGoHHIjZ0ETxuKUcIO0YAhk8Dok
	VXUOwUISjAHutxECHn9XYcj+kH8v5wS7PP+e/zk1prc4R6KG6dWeg==
X-Received: by 2002:a05:6a20:430e:b0:3d3:ad3c:49a6 with SMTP id adf61e73a8af0-3db4061f449mr14643678637.20.1789463121439;
        Tue, 15 Sep 2026 02:05:21 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65a8120sm6495512a12.30.2026.09.15.02.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:05:21 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	mkchauras@gmail.com,
	ynorov@nvidia.com,
	david@davidgow.net,
	joelagnelf@nvidia.com,
	fujita.tomonori@gmail.com,
	linkmauve@linkmauve.fr,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Cc: FUJITA Tomonori <tomo@flapping.org>
Subject: [PATCH V5 1/2] powerpc/bug: Add ARCH_WARN_ASM and refactor _EMIT_BUG_ENTRY for Rust support
Date: Tue, 15 Sep 2026 14:34:52 +0530
Message-ID: <20260915090453.1227034-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915090453.1227034-1-mkchauras@gmail.com>
References: <20260915090453.1227034-1-mkchauras@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_020522_220311_99DE7D2F 
X-CRM114-Status: GOOD (  13.14  )
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

The Rust kernel infrastructure generates inline asm for WARN() via
ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
arch-specific asm template string for use in Rust's core::arch macros.

powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
Rust builds to fail on powerpc with
```
error: no rules expected `ARCH_WARN_ASM`
   --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
    |
  1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
    |                            ^^^^^^^^^^^^^ no rules expected this token in macro call
    |
   ::: ../rust/kernel/lib.rs:279:1
    |
279 | macro_rules! concat_literals {
    | ---------------------------- when calling this macro
    |
    = note: while trying to match sequence start

error: no rules expected `ARCH_WARN_REACHABLE`
   --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_reachable_asm.rs:1:28
    |
  1 | ::kernel::concat_literals!(ARCH_WARN_REACHABLE)
    |                            ^^^^^^^^^^^^^^^^^^^ no rules expected this token in macro call
    |
   ::: ../rust/kernel/lib.rs:279:1
    |
279 | macro_rules! concat_literals {
    | ---------------------------- when calling this macro
    |
    = note: while trying to match sequence start

error: aborting due to 2 previous errors
```

To add ARCH_WARN_ASM, _EMIT_BUG_ENTRY first needs to be refactored.
The old definition was a bare macro with no parameters, relying on
positional asm operand references (%0-%3), hardcoding the backward
reference to local label 1b, and including .org/.previous directives
inline. That made it impossible to compose as a plain string outside of
an asm operand context, and left an invisible contract that callers must
always emit their trap at label 1:.

Refactor _EMIT_BUG_ENTRY to take explicit (bug_entry, trap, file, line, flags)
string arguments via string concatenation. This removes the dependency
on asm operand numbering and makes the labels an explicit argument,
so the caller's intent is visible at the call site and a future caller
using a different label cannot silently produce a wrong bug table entry.

Move the .org and .previous directives out of _EMIT_BUG_ENTRY and into
each call site, so BUG_ENTRY() can still pass sizeof(struct bug_entry)
as an asm operand while ARCH_WARN_ASM can supply its own size string
independently.

Add ARCH_WARN_REACHABLE as an empty define, matching the arm64
convention, indicating that no additional reachability annotation is
needed after a WARN on powerpc.

Reported-by: FUJITA Tomonori <tomo@flapping.org>
Closes: https://lore.kernel.org/all/anG67Q6Y59kDqh-c@desktop
Fixes: 73b741adb264 ("rust: Add PowerPC support")
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/include/asm/bug.h | 46 ++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 0db48977c70c..bf31ee1e902a 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -32,34 +32,38 @@
 #endif /* verbose */
 
 #else /* !__ASSEMBLER__ */
-/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
-   sizeof(struct bug_entry), respectively */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define _EMIT_BUG_ENTRY				\
-	".section __bug_table,\"aw\"\n"		\
-	"2:	.4byte 1b - .\n"		\
-	"	.4byte %0 - .\n"		\
-	"	.short %1, %2\n"		\
-	".org 2b+%3\n"				\
-	".previous\n"
+#define _EMIT_BUG_ENTRY(bug_entry, trap, file, line, flags)	\
+	".section __bug_table,\"aw\"\n"				\
+	#bug_entry ":	.4byte " #trap " - .\n"			\
+	"		.4byte " file " - .\n"			\
+	"		.short " line ", " flags "\n"
 #else
-#define _EMIT_BUG_ENTRY				\
-	".section __bug_table,\"aw\"\n"		\
-	"2:	.4byte 1b - .\n"		\
-	"	.short %2\n"			\
-	".org 2b+%3\n"				\
-	".previous\n"
+#define _EMIT_BUG_ENTRY(bug_entry, trap, file, line, flags)	\
+	".section __bug_table,\"aw\"\n"				\
+	#bug_entry ":	.4byte " #trap " - .\n"			\
+	"		.short " flags "\n"
 #endif
 
-#define BUG_ENTRY(cond_str, insn, flags, ...)		\
-	__asm__ __volatile__(				\
-		"1:	" insn "\n"			\
-		_EMIT_BUG_ENTRY				\
+#define BUG_ENTRY(cond_str, insn, flags, ...)			\
+	__asm__ __volatile__(					\
+		"1:	" insn "\n"				\
+		_EMIT_BUG_ENTRY(2, 1b, "%0", "%1", "%2")	\
+		".org 2b+%3\n"					\
+		".previous\n"					\
 		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
-		  "i" (flags),				\
-		  "i" (sizeof(struct bug_entry)),	\
+		  "i" (flags),					\
+		  "i" (sizeof(struct bug_entry)),		\
 		  ##__VA_ARGS__)
 
+#define ARCH_WARN_ASM(file, line, flags, size)			\
+		"1:	twi 31, 0, 0\n"				\
+		_EMIT_BUG_ENTRY(2, 1b, file, line, flags)	\
+		".org 2b+" size "\n"				\
+		".previous\n"
+
+#define ARCH_WARN_REACHABLE
+
 /*
  * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
  * optimisations. However depending on the complexity of the condition
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
