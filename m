Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C46606A335
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 00:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rZIGfmh+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dQTUiuJf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uoW8n0viZhVpD+jb7WwzfQkJsx7wHKTT6aCS524pbAQ=; b=rZIGfmh+6R8bhl1hK6oSQIexw5
	r3sSeB3+LNJGnOAyAIHiXOZjfozsxIqz/vn6FWA359Hf9oO3HFU94k5RjugRkScmdHVSomnK0731M
	SNdpdYk+ph+ehSHrUAY3fj0Ip4JMS4XbTpikXmuXoDlr3JntSYpdtiXr1oXHnvcjVSZpnyGvEICkD
	cwjpa9Q33SxDoa9gd1t5z/4ypkO16S0+vsB9fTiDMpLLpLKoDQkXJEh1lY1GEGe10HdTH61o4t+HW
	FyreOKsxt5jXB1rXUotN2nC+xPyu9puJ54Fnq1AFN38DXvpsTGlb4k2c8RYwPvV41N0ya4yQEDPT9
	WMVCNHQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJ3O-00000008HmV-3sJy;
	Thu, 12 Nov 2026 00:52:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJ3O-00000008Hlv-0zk4
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 00:52:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ABFB062FF9;
	Thu, 12 Nov 2026 00:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C921F00A06;
	Thu, 12 Nov 2026 00:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794444757;
	bh=bYcr9YAu4elj14HSG2RihmlFTMnciZd6zAktJzPVO8A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dQTUiuJfWsmyjtPd6PfUTpsxMMMdEhzeu4Tai0hFQIb4Plepq0zYbNNT9Vj63Hd9u
	 J0hT/WaVqDvSnT0U+RBhZv/nM++7PfkLhE/AqDFex+e4P7ln5cfgAh+ylNIkNFsz2k
	 CHDd2DeVBxiBxAM7t4WAGQpnBnzpd9/icWFnxQ3Bom1iEKlnlrcWLM9I+Mh2KWkFBs
	 VVPId0l9/2wkNU6pnmcxxHQMaLK3DMAjOcICb7DPKI9jdFSzjonYl6wa3CLe88x5nX
	 LjyuUMIJwiXH+p4z0MHq/vjdYUJyhxZazMknEFA04TZ+QBpVxtxHWzCittHR9t0017
	 CA38FTVznZuRQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 11 Nov 2026 17:52:07 -0700
Subject: [PATCH v2 5/6] Eliminate CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-kconfig-toolchain-updates-v2-5-b2d9415c1757@kernel.org>
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
In-Reply-To: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, Linus Torvalds <torvalds@linuxfoundation.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6902; i=nathan@kernel.org;
 h=from:subject:message-id; bh=bW5KxTW+9OHxQgzWmPo5TtmY1egR4+hUkTkjVgF1xis=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlfefe/6ttz6tfhHBbtvu/HN6lZFQf71/XXz8rRs3x75
 N4Ud/X8jlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjARcw5Ghns2mq07vvPNldm2
 uKXN4tTRnMs3FCI+aM6XTb/it3YTgxojwyuNIjeu82+PyHIyi9sZnOjzbrm7k21af7FsgoePRVE
 FDwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 1aa0e8b144b6 ("Kconfig: Add option for asm goto w/ tied outputs
to workaround clang-13 bug") added CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT to
avoid a bug in clang's asm goto with outputs support when a tied output
was used. The fix in clang was to match GCC's documented behavior.

Now that the minimum supported version of clang has long been bumped
past the version where the fix landed (clang-14), any compiler that
satisfies the dependencies of CONFIG_CC_HAS_ASM_GOTO_OUTPUT will support
tied outputs properly. Eliminate CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT in
favor of just checking for CONFIG_CC_HAS_ASM_GOTO_OUTPUT directly.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/lib/csum.c          |  4 +--
 arch/x86/include/asm/uaccess.h | 82 ++++++++++++++++++++----------------------
 scripts/Kconfig.toolchain      |  5 ---
 3 files changed, 41 insertions(+), 50 deletions(-)

diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index c2b8986a0d39..cd461a7b61a5 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -142,7 +142,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 	end = (const unsigned long *)(buff + len);
 	csum = do_csum_common(ptr, end, data);
 
-#ifdef CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT
+#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
 	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
 	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
@@ -186,7 +186,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 		return csum >> 16;
 	}
 
-#endif /* CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT */
+#endif /* CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
 #ifndef CONFIG_32BIT
 	csum += ror64(csum, 32);
 	csum >>= 32;
diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index f4700ad6b5ec..64b648e59df0 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -248,6 +248,44 @@ do {									\
 		     : [umem] "m" (__m(addr))				\
 		     : : label)
 
+#define __try_cmpxchg_user_asm(itype, ltype, _ptr, _pold, _new, label)	({ \
+	bool success;							\
+	__typeof__(_ptr) _old = (__typeof__(_ptr))(_pold);		\
+	__typeof__(*(_ptr)) __old = *_old;				\
+	__typeof__(*(_ptr)) __new = (_new);				\
+	asm_goto_output("\n"						\
+		     "1: " LOCK_PREFIX "cmpxchg"itype" %[new], %[ptr]\n"\
+		     _ASM_EXTABLE_UA(1b, %l[label])			\
+		     : "=@ccz" (success),				\
+		       [ptr] "+m" (*_ptr),				\
+		       [old] "+a" (__old)				\
+		     : [new] ltype (__new)				\
+		     : "memory"						\
+		     : label);						\
+	if (unlikely(!success))						\
+		*_old = __old;						\
+	likely(success);					})
+
+#ifdef CONFIG_X86_32
+#define __try_cmpxchg64_user_asm(_ptr, _pold, _new, label)	({	\
+	bool success;							\
+	__typeof__(_ptr) _old = (__typeof__(_ptr))(_pold);		\
+	__typeof__(*(_ptr)) __old = *_old;				\
+	__typeof__(*(_ptr)) __new = (_new);				\
+	asm_goto_output("\n"						\
+		     "1: " LOCK_PREFIX "cmpxchg8b %[ptr]\n"		\
+		     _ASM_EXTABLE_UA(1b, %l[label])			\
+		     : "=@ccz" (success),				\
+		       "+A" (__old),					\
+		       [ptr] "+m" (*_ptr)				\
+		     : "b" ((u32)__new),				\
+		       "c" ((u32)((u64)__new >> 32))			\
+		     : "memory"						\
+		     : label);						\
+	if (unlikely(!success))						\
+		*_old = __old;						\
+	likely(success);					})
+#endif // CONFIG_X86_32
 #else // !CONFIG_CC_HAS_ASM_GOTO_OUTPUT
 
 #ifdef CONFIG_X86_32
@@ -313,48 +351,6 @@ do {									\
 		     : [umem] "m" (__m(addr)),				\
 		       "0" (err))
 
-#endif // CONFIG_CC_HAS_ASM_GOTO_OUTPUT
-
-#ifdef CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT
-#define __try_cmpxchg_user_asm(itype, ltype, _ptr, _pold, _new, label)	({ \
-	bool success;							\
-	__typeof__(_ptr) _old = (__typeof__(_ptr))(_pold);		\
-	__typeof__(*(_ptr)) __old = *_old;				\
-	__typeof__(*(_ptr)) __new = (_new);				\
-	asm_goto_output("\n"						\
-		     "1: " LOCK_PREFIX "cmpxchg"itype" %[new], %[ptr]\n"\
-		     _ASM_EXTABLE_UA(1b, %l[label])			\
-		     : "=@ccz" (success),				\
-		       [ptr] "+m" (*_ptr),				\
-		       [old] "+a" (__old)				\
-		     : [new] ltype (__new)				\
-		     : "memory"						\
-		     : label);						\
-	if (unlikely(!success))						\
-		*_old = __old;						\
-	likely(success);					})
-
-#ifdef CONFIG_X86_32
-#define __try_cmpxchg64_user_asm(_ptr, _pold, _new, label)	({	\
-	bool success;							\
-	__typeof__(_ptr) _old = (__typeof__(_ptr))(_pold);		\
-	__typeof__(*(_ptr)) __old = *_old;				\
-	__typeof__(*(_ptr)) __new = (_new);				\
-	asm_goto_output("\n"						\
-		     "1: " LOCK_PREFIX "cmpxchg8b %[ptr]\n"		\
-		     _ASM_EXTABLE_UA(1b, %l[label])			\
-		     : "=@ccz" (success),				\
-		       "+A" (__old),					\
-		       [ptr] "+m" (*_ptr)				\
-		     : "b" ((u32)__new),				\
-		       "c" ((u32)((u64)__new >> 32))			\
-		     : "memory"						\
-		     : label);						\
-	if (unlikely(!success))						\
-		*_old = __old;						\
-	likely(success);					})
-#endif // CONFIG_X86_32
-#else  // !CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT
 #define __try_cmpxchg_user_asm(itype, ltype, _ptr, _pold, _new, label)	({ \
 	int __err = 0;							\
 	bool success;							\
@@ -410,7 +406,7 @@ do {									\
 		*_old = __old;						\
 	likely(__result);					})
 #endif // CONFIG_X86_32
-#endif // CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT
+#endif // CONFIG_CC_HAS_ASM_GOTO_OUTPUT
 
 /* FIXME: this hack is definitely wrong -AK */
 struct __large_struct { unsigned long buf[100]; };
diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index 6520a06a9103..9454ef5294d5 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -120,11 +120,6 @@ config CC_HAS_ASM_GOTO_OUTPUT
 	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
 	depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
 
-config CC_HAS_ASM_GOTO_TIED_OUTPUT
-	depends on CC_HAS_ASM_GOTO_OUTPUT
-	# Detect buggy gcc and clang, fixed in gcc-11 clang-14.
-	def_bool $(success,echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .": "+m"(*x) ::: bar); return *x; bar: return 0; }' | $CC -x c - -c -o /dev/null)
-
 config TOOLS_SUPPORT_RELR
 	def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "NM=$(NM)" "OBJCOPY=$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
 

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
