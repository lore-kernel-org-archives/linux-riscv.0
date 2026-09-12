Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F27C79FB6
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2026 06:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5I9eRolLfKHJrBkung6wt2QsyFhMpg6dOn8vNIeUjhU=; b=SPXtlcR0y2+vaX
	9OXej2PMkQYP0wftRHEzDkG4kNm7MaEZdyR2wRLz74byN5xdrqvOwSWkpPokiMzIGFU4/G+UUM0qz
	taub0QgHbaQEqOtUZSMmjjed6eRQOiJZe7C4NAqJMSlHRUdGwWPXjdsaATx43i6EHtnoME1oYE1c+
	WFDG/laqCp+X7ar4tAuA1eZdHu1v/mDrX2hWJxTvBZuNIyOBa3pzlGXdgKr/h0MuEQBrGGKccuuKn
	w7Q0yh1c6XnkdQ/LNWi/1rnh0ZIqWj62Kr5JlF5ZxSAUxaw3FCgTnp77zxiFphpaOfU5UIlicI40x
	tMH52ktlU1l15LM0Q95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Hi3-00000000dGA-1Huh;
	Sat, 12 Sep 2026 06:59:35 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Hi1-00000000dFH-0Kat
	for linux-riscv@lists.infradead.org;
	Sat, 12 Sep 2026 06:59:34 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4bdf8abdfso217430a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 23:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789196372; x=1789801172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3JbySDrX7Qe3HLCVmAQbpZ/Bcq5FNjxxg9MbzFzoSM=;
        b=gcRfQFTaobhTeFzLX9l0XSa2HgniaEaxdC+lY+l1MljCa83Lz/CdK/jKEqg2hS0V0d
         9l1k4rqZ9m8ZP05eZf953Tk5M1/QYxyCdRgNjiAX9ihoJ1OgABCJqitxgGFILSrcc8A2
         uz4fnV8fWsrJ4dlYve4ix3uAtDl+8bVfRHZ0FEfJtRBQBoHgw1Y6D3/3HVvaU/wnPNHj
         /8lVwYYc2RNwMJn3sqsEhK/hFc6xK1PVZBWLnHsMhfp93EJfLGhWwZGdVSW6jRqmGrhL
         O6Sb0eos6mNRz/NHkIe26dvv3vidy2esVsgd5DRLg+agJyKrzXdEL5AelCok1AydrHUY
         St0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789196372; x=1789801172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G3JbySDrX7Qe3HLCVmAQbpZ/Bcq5FNjxxg9MbzFzoSM=;
        b=XFAzPpMtoGBgsfPRkgxMujqQ467BlUh/5KsKvvM/SHoCoTMMzRcNBTU6qf/KA3YuHm
         EE5rHJJ3/YC4fp5A2jH1yfDHZTgtCZcnJtHWrnM4b+XGveoN3Mcc8+KpN8kXWSBHdDah
         KaapruWKCfHCrmicjri/E4sVmOvZXSg3KKNqPgN9B60xKJ5Qp0SbNO5QAcU/8d041gFE
         jYnqLj0W2pKQ0grehMa7UpY0KkTphPsjs61UBGkuwb838vAc3dBdmGuGPNUVMOrJ6bkR
         rHWk3LGGr0g4hDyDKxH7fOYDZr47it2OSXrER/5ohyUFHwmp962MQm/HeUjG+opCXW6O
         jo7g==
X-Forwarded-Encrypted: i=1; AKwUvBwjTaL0GyFSCTOqsWQkhz1tNizQBGKzUDIJ2lnclMN6VbObQ0BOV0ppxDqT4adKVmgmAo3FNyfyO/6RnQ==@lists.infradead.org
X-Gm-Message-State: AFuF++k6G5Zeu8g9xmhg3rjBFIugcFdkGaX2ivc0veHuUmc3Hx8UNpSN
	RGDVdngMAmMsW6kFT5sa/CLcbk18hPs1oLn6pcwbhsFM8sp0K5hDqBq1
X-Gm-Gg: AYBFou1fpzlgtaNcbrz7BNRWazUgLQBnNoHpnhP5rTwalVsGj6Y9IC97CNoY0CZLAi0
	rWoeHtwj6VXV5+JVICHcNTK3LUBJ7hh8uUgp9tIp1qx4VUGJqfGcdiDfhCW4a5IF2gm9aDT1oY8
	4xWOV5ouIe0aYqZdO00FyZwIiQNPpMdTApOqn4YWTNzHv8NX2WdY2qKFJ+YblXbjr5N4I3xUSTg
	nHANfWKWaBBHSGit/YrYMv6qHm62SLZMTtEFdtvosXoqk/6FFr2wiCXgo2UZsf9fGILR6VIq9NJ
	JFJ1A9aFZDmdqxNIiHNOlOp1ozhG8FeOFTGX/IWBDHIBazMQLWqWBCM0qhCcsMy1+S2AeE7gMvA
	fH1wrEDosjLdKqKqc9G77SyNnnRsAW4adksT5eXlYuZKRI/fqvRaWKwqQ011CniD6oZCCuxQbEm
	EznWUof8bZ5fi+7NzOtE5VAieJ4UQPnUHC/fNLyJsJM6OsGfJYcr+osQaRGhHPirhq6nBfLcdww
	dfi5Id7p+lnhmXh0Rco3HMhMsR6i87SHgrylSK5vrogJg==
X-Received: by 2002:a05:6a20:cc8e:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3db0e40edbamr3056849637.17.1789196372133;
        Fri, 11 Sep 2026 23:59:32 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b78d59sm10777777c88.8.2026.09.11.23.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:59:31 -0700 (PDT)
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
	ecourtney@nvidia.com,
	joelagnelf@nvidia.com,
	fujita.tomonori@gmail.com,
	linkmauve@linkmauve.fr,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Cc: FUJITA Tomonori <tomo@flapping.org>
Subject: [PATCH v4 1/2] powerpc/bug: Add ARCH_WARN_ASM and refactor _EMIT_BUG_ENTRY for Rust support
Date: Sat, 12 Sep 2026 12:29:01 +0530
Message-ID: <20260912065902.24017-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912065902.24017-1-mkchauras@gmail.com>
References: <20260912065902.24017-1-mkchauras@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_235933_125758_A31F5FD2 
X-CRM114-Status: GOOD (  13.03  )
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

Refactor _EMIT_BUG_ENTRY to take explicit (label, file, line, flags)
string arguments via string concatenation. This removes the dependency
on asm operand numbering and makes the trap label an explicit argument,
so the caller's intent is visible at the call site and a future caller
using a different label cannot silently produce a wrong bug table entry.

Move the .org and .previous directives out of _EMIT_BUG_ENTRY and into
each call site, so BUG_ENTRY() can still pass sizeof(struct bug_entry)
as an asm operand while ARCH_WARN_ASM can supply its own size string
independently.

Add ARCH_WARN_REACHABLE as an empty define, matching the arm64
convention, indicating that no additional reachability annotation is
needed after a WARN on powerpc.

This brings powerpc into line with x86, arm64, s390, and riscv, all of
which already define ARCH_WARN_ASM and ARCH_WARN_REACHABLE.

Reported-by: FUJITA Tomonori <tomo@flapping.org>
Closes: https://lore.kernel.org/all/anG67Q6Y59kDqh-c@desktop
Fixes: 73b741adb264 ("rust: Add PowerPC support")
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/include/asm/bug.h | 36 +++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 0db48977c70c..6f0f652d9348 100644
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
+#define _EMIT_BUG_ENTRY(label, file, line, flags)	\
+	".section __bug_table,\"aw\"\n"			\
+	"2:	.4byte " #label " - .\n"		\
+	"	.4byte " file " - .\n"			\
+	"	.short " line ", " flags "\n"
 #else
-#define _EMIT_BUG_ENTRY				\
-	".section __bug_table,\"aw\"\n"		\
-	"2:	.4byte 1b - .\n"		\
-	"	.short %2\n"			\
-	".org 2b+%3\n"				\
-	".previous\n"
+#define _EMIT_BUG_ENTRY(label, file, line, flags)	\
+	".section __bug_table,\"aw\"\n"			\
+	"2:	.4byte " #label " - .\n"		\
+	"	.short " flags "\n"
 #endif
 
 #define BUG_ENTRY(cond_str, insn, flags, ...)		\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
-		_EMIT_BUG_ENTRY				\
+		_EMIT_BUG_ENTRY(1b, "%0", "%1", "%2")	\
+		".org 2b+%3\n"				\
+		".previous\n"				\
 		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
 
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+		"1:	twi 31, 0, 0\n"			\
+		_EMIT_BUG_ENTRY(1b, file, line, flags)	\
+		".org 2b+" size "\n"			\
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
