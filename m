Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F787C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 10:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GAZ4GO43x/DFa122oNf0geZ+1OW+UElIOiYsQ3dAGwY=; b=hwhYO0Lb1n/8DN
	g2MRAz9LfWtBFYpnX85aYO2pYaatvFqwf5bF6/hlC35MVeDDmBjXphcCfzd8AlSv5aV/a2vOZ5cBs
	CvKW9tWPYNPZ0deo1dTckSyAfVj2E6hCY91FTSB0BmDY7Jfw36AUhsE2dqOBE99c7my8NneFQkUuq
	geZyPmryDQO4wfLxXDNOTJKwXZzHowCpatj+EG48NEuV1AnvnB7soWxfBWrZ7QpWFyw0BVq5hI63V
	2rKH9+AHOAuDINS+Q4wT5Y+sy3ffA1WjjogYBHg3/tVul1BW3TbF6a3RKxTz8P3RCv9JWM3jtPB3C
	QlqSVg7KPSkkGoPC5FGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bio-0000000E0MH-2h2l;
	Thu, 10 Sep 2026 10:09:34 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bil-0000000E0LT-1sKa
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 10:09:32 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so138944a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 03:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789034970; x=1789639770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5leu8y8+SZGo99Bk+YLh7ZmObofNLoxXT8B8pxE/vs=;
        b=Oyo4NWrSZGPVCqp/ymoli6mKRw542X4O9YeJGJIydPfS4qwkSUGjDEMBedVWuIE2Vo
         eP6/PvxGtuqE4OOlo663SYW5EhFDf/8st9n3Utv/0gTA7w0DZfzN13brEgUSMryfF4w2
         yf/4OrFAGijuI/JEQxmwNGesqYWdJv7JguQPsJS7sG2hHMj/KWG/nd38nBBYhGTLpsu1
         9M2aEIzrMdHg/3LVGJp4agEUvPswbUZcYsBO7TzZLR/cb8gaKwD0RC+BiFVRwqRulgVO
         fBP39k3oMVsnE+0eij5ZCUuMwXf8gVYDAxlfcth9sDEFDdLu0i3HIgSUebL2xCEvNijG
         A8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789034970; x=1789639770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5leu8y8+SZGo99Bk+YLh7ZmObofNLoxXT8B8pxE/vs=;
        b=ZiTBONJh5P6d1cKucp+UkSSvrignBvULBQET60nhO7TezuA6xBIZdpyzC5I6ZZOkfA
         F0ineQIc7vltv0UPna9P/+bowP9EX2r/18vgs9ovD4dasvNkNZPSt2LbQVq3cKEY4FFn
         UZ2XLau9eiJmnEPs27t8UBhd9a6W/zevOfMZKszhyjOlKlMg0CO2NFITOnIJ+I5FJy6n
         73dVTpr1pzXZDiow4/CvByLWGwH24cieGIgMSeP86UH+8DR+jcKKQpYlB8mrGSjIEloJ
         w+4jCZuXLzhXmpy0d+Bizw6tJoi9lmNzhBLhU89rRpMFYAUElNVK8KOCaZ+pAGjMD96X
         y4Hg==
X-Forwarded-Encrypted: i=1; AKwUvBwdk2GeEm4wN/olSi7rd6iOzvon8L5thhkBDBzyqECyRZblr8bskI6DSGhW1XjuqvmmsYJR0JohdXKcpQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kqmOwnDsi78kQjpDsmyXceUALmQSuOrxWjhgW80r1KadWRL8lj
	TAe7V4QrfJMNmDpakSMTK071RlHiyAYMEhg4/n6dWC5zyZtjZ+NS3YcT
X-Gm-Gg: AYBFou1n/S5JGK4nAtiTQgSOqFpubKb/fnZUygHTF6/04pmIyls14ojnaqDQBAqm61+
	hjwTtEkWDlMhsArBhlbNkCVc0LKnXvKtUwYSTvsoCmdqWB5vIH1DBro9JFQoYAy+NGV8SCedoKt
	5eIulhRF+H7PKfu0G7Vh4bW5rsyOdfGdrih1N9qk1rz4FYlgqTOotsLYAw9B1kbCo4xQa898QL9
	cu3APiR9RDc18LpD8Kj6/lBNXWEzStrtvuQHxlnyCFEPmYxFBcPHmtEF2p445lsUVNpb0Cit7O3
	sgEW9/wVTrWvoTFcmt7Slu1X8+XH4OByN/inH+QqKN1yGks4CkM6rgtEbSQ8jVwY7XR/vJIuLGk
	i8k2w0c0S8TQl9VmqXnYThptESvuT/g/wXk4y80a8+VBlUg81UBdEM98LEICEljZyiG//r9mNFL
	ZZJKShdDi9ThjhYAh9UBKinPDsZ49XyF5QgVzF/g1cxEcWjsgmZJw3PxsfSUsnE+fu1iRNS2i0B
	ie5uYmWcQXAbsj9cC7rOtdEoGC/Qy5DssT+z9RnykGPO20xn/8qjqZC8y2oEFRV
X-Received: by 2002:a17:90b:33c1:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39b262dfa81mr56515343a91.21.1789034970472;
        Thu, 10 Sep 2026 03:09:30 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39bae60b23csm3460207a91.0.2026.09.10.03.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:09:29 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
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
	mkchauras@gmail.com,
	linkmauve@linkmauve.fr,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	rust-for-linux@vger.kernel.org
Cc: FUJITA Tomonori <tomo@flapping.org>
Subject: [PATCH V3] powerpc/bug: Add ARCH_WARN_ASM and refactor _EMIT_BUG_ENTRY for Rust support
Date: Thu, 10 Sep 2026 15:38:02 +0530
Message-ID: <20260910100801.2159785-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_030931_492970_A3AC8518 
X-CRM114-Status: GOOD (  13.02  )
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
Changelog:
V2 -> V3:
 - Add label argument in _EMIT_BUG_ENTRY
V2: https://lore.kernel.org/all/20260910071252.1950488-2-mkchauras@gmail.com

V1 -> V2:
- commit message now has error, fixes tag and closes tag
V1: https://lore.kernel.org/all/20260819084825.969116-1-mkchauras@gmail.com

 arch/powerpc/include/asm/bug.h | 36 +++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 0db48977c70c..df2183c35945 100644
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
+	"2:	.4byte " label "b - .\n"		\
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
+	"2:	.4byte " label "b - .\n"		\
+	"	.short " flags "\n"
 #endif
 
 #define BUG_ENTRY(cond_str, insn, flags, ...)		\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
-		_EMIT_BUG_ENTRY				\
+		_EMIT_BUG_ENTRY("1", "%0", "%1", "%2")	\
+		".org 2b+%3\n"				\
+		".previous\n"				\
 		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
 
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+		"1:	twi 31, 0, 0\n"			\
+		_EMIT_BUG_ENTRY("1", file, line, flags)	\
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
