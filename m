Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F2BCA0EFA
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 15:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0AWWJyZIvhsSKhjOogczVQCSFOEYs5oDosh34Fk7+Y=; b=rMOdtUH/UGqMjU
	yWqPbEPmOHY+4FJMXt0PPjAu0YeqGNm2gAMXj8i8uomb9Fzfl7M3rXvrFNBE/7QizZ6BSP9aNHXx1
	skGdM4Dz4mZUFRa4rSfB0jSmOIn0MP6QBE4YBmXhRj9Q1aqscFB3XaDi/yd41rlQwMtcqioB+86cS
	dnwtPbBpwZDSlPB6XbwbAElqE0scMp3qEX50osyLVzzvA6yfWVAj9+t52Ys0t3URKrN0aD2y0JHPJ
	6F1QKNnXXNWZNdgJR8qD7ri3sFOVnQcpjkSM+AWNyHE+2+IZE3+EbXktMqRcluX2oxjey8IKJFfxe
	QrmcrDkOvIX2Xpc3ue2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZ9L-00000008W9n-2m1U;
	Mon, 25 Aug 2025 15:30:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqY96-00000008FP9-46Lz;
	Mon, 25 Aug 2025 14:26:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3EE985C5E4E;
	Mon, 25 Aug 2025 14:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2968C116D0;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756131963;
	bh=HivC8e+d4y482Da6cYyudQLG75+xG2H1Zq0+IirdkmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pjNfH8WK7wwlxCDAwwhjnZU752SGmoD2ubuqmodGNyfTJWeONXLewWOxmik1Y5Vls
	 Bc1dheonE3xufvqgfq7BafYodPq5cOFqWkU79VouuWmFze6QMUf8FTpcm7MJ81LJ4s
	 W5XA+St1iUJ6JGhbM6fdEezFqE0b87qoXhtrkzi5yRg4tKA6whQsgOXnOArjXjiJQm
	 7OCNj4lYaJ2wPGgePFGihoTH/pDceapGb7AkfDsDx0OgcftbRadjjunHkNT1UtDvzp
	 QxqRlRLPPuWA9WkzfjE8H9hfNUYXK6aZW9J8mlAZyQ7lprpLGwyLkXQPFGTTV2c4rC
	 B2xrp+uNa9IiA==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Kees Cook <kees@outflux.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 4/5] x86/cfi: Remove __noinitretpoline and __noretpoline
Date: Mon, 25 Aug 2025 07:25:51 -0700
Message-Id: <20250825142603.1907143-4-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825141316.work.967-kees@kernel.org>
References: <20250825141316.work.967-kees@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_072605_129859_752B5DE6 
X-CRM114-Status: GOOD (  17.31  )
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

From: Kees Cook <kees@outflux.net>

Commit 66f793099a63 ("x86/retpoline: Avoid retpolines for built-in __init
functions") disabled retpolines in __init sections (__noinitretpoline)
as a precaution against potential issues with retpolines in early boot,
but it has not been a problem in practice (i.e. see Clang below).

Commit 87358710c1fb ("x86/retpoline: Support retpoline builds with Clang")
narrowed this to only GCC, as Clang doesn't have per-function control
over retpoline emission. As such, Clang has been booting with retpolines
in __init since retpoline support was introduced.

Clang KCFI has been instrumenting __init since CFI was introduced.

With the introduction of KCFI for GCC, KCFI instrumentation with
retpolines disabled means that objtool does not construct .retpoline_sites
section entries for the non-retpoline KCFI calls. At boot, the KCFI
rehashing code, via __apply_fineibt(), misses all __init KCFI calls
(since they are not retpolines), resulting in immediate hash mismatches:
all preambles are rehashed (via .cfi_sites) and none of the __init call
sites are rehashed.

Remove __noinitretpoline since it provides no meaningful utility and
creates problems with CFI. Additionally remove __noretpoline since it
is now unused.

Alternatively, cfi_rand_callers() could walk the .kcfi_traps section which
is exactly the list of KCFI instrumentation sites. But it seems better to
have as few differences in common instruction sequences between compilers
as possible, so better to remove the special handling of retpolines in
__init for GCC.

Signed-off-by: Kees Cook <kees@outflux.net>
---
Cc: David Woodhouse <dwmw2@infradead.org>
---
 include/linux/compiler-gcc.h | 4 ----
 include/linux/init.h         | 8 --------
 2 files changed, 12 deletions(-)

diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index 5d07c469b571..5de824a0b3d7 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -35,10 +35,6 @@
 	(typeof(ptr)) (__ptr + (off));					\
 })
 
-#ifdef CONFIG_MITIGATION_RETPOLINE
-#define __noretpoline __attribute__((__indirect_branch__("keep")))
-#endif
-
 #if defined(LATENT_ENTROPY_PLUGIN) && !defined(__CHECKER__)
 #define __latent_entropy __attribute__((latent_entropy))
 #endif
diff --git a/include/linux/init.h b/include/linux/init.h
index a60d32d227ee..17c1bc712e23 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -7,13 +7,6 @@
 #include <linux/stringify.h>
 #include <linux/types.h>
 
-/* Built-in __init functions needn't be compiled with retpoline */
-#if defined(__noretpoline) && !defined(MODULE)
-#define __noinitretpoline __noretpoline
-#else
-#define __noinitretpoline
-#endif
-
 /* These macros are used to mark some functions or 
  * initialized data (doesn't apply to uninitialized data)
  * as `initialization' functions. The kernel can take this
@@ -50,7 +43,6 @@
 /* These are for everybody (although not all archs will actually
    discard it in modules) */
 #define __init		__section(".init.text") __cold __latent_entropy	\
-						__noinitretpoline	\
 						__no_kstack_erase
 #define __initdata	__section(".init.data")
 #define __initconst	__section(".init.rodata")
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
