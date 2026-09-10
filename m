Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1E2C79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 07:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5CoSdkDdwVOjUVbc2kAT33KVcaJZG+IpA7RUe06l8yY=; b=nktGs8M7XrHbXC
	09w/LaP8fiir6MrAj64ewvPdUbZa/kGoWL8J3uZwbyrQbCfxQgVoIA6eXMLUAvXeqUsUOoKxEFJos
	ybJCe1wfnxj44GdxCNocUCsG0bE3C+XHCqZZ8AMwowcfl4xtmJ6urneTtTDvsuXz3kMjJieAoFvqa
	x6R1Lkp1oGPAVgC4fR5tf2ylONl2cE+azHxdcPLXUZCJLvswk9Gp6+EzmrmJgMucUGJIL0ZLfOqvX
	CB4YUFxMosFjX7fATlLXA7bikN4EJpR6ZXwPpdqfgH2Cc8SNB+fhrqhnk0ZGHa4jnhiuqzk8BxZ5/
	oIKBDq6AG+iTLNTHiK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YyH-0000000Db5p-2bki;
	Thu, 10 Sep 2026 07:13:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YyG-0000000Db4f-1QeP
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Sep 2026 07:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=2oXTxVfBODKLGSc/9HbMzKqtFz+JtlQq+nSqeCi24+U=; b=MgADIzB/d4d84Ecyoa04UUqlDt
	uIINkk+gzJ5eDDnj5zRmXcdsHOiKjjWyFT9sgAEUX2tQLlIAestZJeJ/V6U64kKQL8ix1uHa7s9Nl
	pgkP6Tm41cXNnO9t4l+xzT0CNh3oXeRr4hhd1rWuVDyua+27yretykdJjr2UGu7TRj9sgsBAi3JK/
	kLKpBJIXYmERDLv3OmI6MkKLwV180vAZ8xjmVzpJ4g+m2TYx2jY4lOyQHjD+TuS7wZSTZAS0LRlqj
	KlKTEDXx8oCllYYC0uzfh5qD3TSwXhtKk1gUaa3l9JKh7Tk9Wt1ItrSW7Y6y1Wdg98sXLDvalVVOu
	MbskeNZQ==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4YyD-000000027MI-0bLo
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 07:13:19 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ed9866so10749905ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 00:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789024395; x=1789629195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2oXTxVfBODKLGSc/9HbMzKqtFz+JtlQq+nSqeCi24+U=;
        b=KFFcE+L4NFyki92gICRAwyBW+STwb+OngWPJPyhi6/ZC4mbZNYsOJECxtHb711PKzi
         mXbikD13o8jkgrGrZGDLUAlfFsQ6O2lXxATSdAbaifdhJQlbUiSe2DiXBV/xDbSy2vqR
         sEk0pWm8xKhsEds+t9ufwZJ9vIxnLiOuk0FpdcaopbDz13BkP6WZ79I4uapWEjFwPjTB
         Sg6WqenucieIf3TV4w9xcanHTLMuY2pt1BTiubTC62kA0apLYWZvdw5oA81n4eV0/V9Q
         muBH2u75u0qUWgOhHy49h/4ABeMxAO4IBO/PhNCb1k4MOEr8QbLg2EwB4inm5uV+5vS/
         xOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024395; x=1789629195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2oXTxVfBODKLGSc/9HbMzKqtFz+JtlQq+nSqeCi24+U=;
        b=o/T7P9dMP19XReLU2W14GGQDTgD8l8TV+lO3VTWqbuwQyj8lel09jYRLta+OE6yyMq
         huP0t4Hq6dZyW4O2ctxqRGK1QslrS71S5fpdMChetKflMkT9ExSFwIMVkRvht5zd9rTS
         +1Zwlp1kyv+BqaxF8TIcf9ENZ6xbXrcJavsfCsCr8yZTHTG5I9tuNjnWSz9fmlBGUdJn
         O56kdy+nFwbGrEDEs4LLl9cHRlZOsa3ylZetpZVMSMQRI2ELCHW7yn3XiDwP5qkfDO/w
         8oT9nW+FP7D4dK0BEif6vyFPxzD5ztuHCaPkCEw0yTaYIw6vL+G+yErycZ/0JT/wy4LI
         OCiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwYfoUuCB2UX19qF2GQKnxCGDXCwZkMMoZ4BVU4Pppged2BgXZGlHjDFWCvS8ct3duNBLh4Q9PO1xKzg==@lists.infradead.org
X-Gm-Message-State: AFuF++myqCXZoH1e+Fd0WMcoMxFdEeZGRhfhX+zw4Y89sUE6cZN+f2Oj
	RdOvKpqutX+pcKBqDSxO3U82MHw8CeM8zxi9mWZGaaL+vNFH3sTCqPP0
X-Gm-Gg: AYBFou3/aU5kOyDV/diODC5m4Mp9DhF9x11s3rz+r/cAsL/7I3Q8JOYTtHnvStq4ATi
	vhbhbPSOdNI+s1xXrrxRCnOP+Z9TMfLAhvF4i5CzjRVBT4gMGiSyQLtigWrhZpsuTdBA/bL1HZL
	J8etEacUTT2obdXQHXCrOUYrpp9H5VlSkSd9rVr6y7mWoOmCo3hsNl21NseEpDb4+IRwf0Os8Ir
	q3U4AVlPYDR7r+FugvVrFATgn3+GgTyLOMaCxTskhaExUEqNGqN8NZtGR2SJgfgirgydYnG+qg+
	Au29NdSGzLIMnxUI7qwHDfo0HGzz85Hzq/9OYJyFYefZFibxG9GUuAgEHylFfZEbb3cImT80KRu
	qYYSxRe+nJAr6S4Fz9nUcfuQzc+0Z95DCj8CTH3SWv76Qb3R3B/iMimrm5N5kjr52ne0zaQ6QVp
	i3S5He/coem4Q8lAShI/FXULNIyHMhnJXgbPBO9YJBepmflDhvoltDpD6Vc1o7hfCHGss0Wtl+3
	jiOdnpQHXZecjS4/nyOZCQh+j7+LuZtFVuvZg93TEJ1sANPTk8pXQ==
X-Received: by 2002:a17:903:17cc:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd07cb17dbmr88797695ad.21.1789024394747;
        Thu, 10 Sep 2026 00:13:14 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae8af3sm82366995ad.80.2026.09.10.00.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:13:14 -0700 (PDT)
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
Subject: [PATCH V2] powerpc/bug: Add ARCH_WARN_ASM and refactor _EMIT_BUG_ENTRY for Rust support
Date: Thu, 10 Sep 2026 12:42:53 +0530
Message-ID: <20260910071252.1950488-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_081317_458804_35EEF27C 
X-CRM114-Status: GOOD (  12.30  )
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

Refactor _EMIT_BUG_ENTRY to accept explicit (file, line, flags) string
arguments rather than relying on positional asm operand references
(%0, %1, %2, %3). This allows the macro to be composed as a plain
string concatenation, which is required for ARCH_WARN_ASM where no asm
operand context exists.

Move the .org and .previous directives out of _EMIT_BUG_ENTRY and into
the BUG_ENTRY() call site to preserve existing behaviour while enabling
ARCH_WARN_ASM to supply its own size operand independently.

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
V1 -> V2:
- commit message now has error, fixes tag and closes tag

 arch/powerpc/include/asm/bug.h | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 0db48977c70c..8aba39e0cf26 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -32,34 +32,38 @@
 #endif /* verbose */
 
 #else /* !__ASSEMBLER__ */
-/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
-   sizeof(struct bug_entry), respectively */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define _EMIT_BUG_ENTRY				\
+#define _EMIT_BUG_ENTRY(file, line, flags)	\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
-	"	.4byte %0 - .\n"		\
-	"	.short %1, %2\n"		\
-	".org 2b+%3\n"				\
-	".previous\n"
+	"	.4byte " file " - .\n"		\
+	"	.short " line ", " flags "\n"
 #else
-#define _EMIT_BUG_ENTRY				\
+#define _EMIT_BUG_ENTRY(file, line, flags)	\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
-	"	.short %2\n"			\
-	".org 2b+%3\n"				\
-	".previous\n"
+	"	.short " flags "\n"
 #endif
 
 #define BUG_ENTRY(cond_str, insn, flags, ...)		\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
-		_EMIT_BUG_ENTRY				\
+		_EMIT_BUG_ENTRY("%0", "%1", "%2")	\
+		".org 2b+%3\n"				\
+		".previous\n"				\
 		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
 
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+		"1:	twi 31, 0, 0\n"			\
+		_EMIT_BUG_ENTRY(file, line, flags)	\
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
