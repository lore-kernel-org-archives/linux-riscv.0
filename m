Return-Path: <SRS0=eKgb=H4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC6AC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 16:12:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14E4864EF3
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 16:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14E4864EF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uvfw1VEYAEgBRTofEhad66MtaecK2DI1qcZKgh0oYUI=; b=TecmVgElWts5KspGMLtQUl3MZe
	T/alCS2mB6+hI3rgaqMxnw+xhwHUfoGHNjxJXcYe0RDF+FSgvojlEwklgNmzuEEoljKteU+RYzyXB
	DsGZyj5DtW4PBG+h9B6SMR0aoXYnBZ4I1nmtMG5SW0s+JFpoedzva/z4q2L+JNbFpfxTsUsE7FUDX
	WQBt/nXBoAXD/8vOVTXz/zRSTpWG93ccq+wa4YBUZx5gqPhwhZ/8JhFfOqm0g/o4PYbkzUAnDgHBC
	Izwtmn7I+DCOKizHr+1oiW3y/amQ5KAVtW0t0VakryYAnZjVd9kuYz7XnBi0iTqnVYyRZnMyR3asc
	ArRkrqKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFfj1-0000g2-KP; Fri, 26 Feb 2021 16:12:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFfiy-0000fK-VY
 for linux-riscv@lists.infradead.org; Fri, 26 Feb 2021 16:12:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7822664EBA;
 Fri, 26 Feb 2021 16:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614355936;
 bh=C3YYYvLVQ2aWy1CSZtnNQUvgD7cCZHBGlr/W3FNNMxs=;
 h=From:To:Cc:Subject:Date:From;
 b=DP9nkO3oybnEAnHFCqYU6CdF/AbL2T+K3usNFtsn/N9/Yn70o/rliMJOb8/WaWYBA
 d57EoBBjnNAhow4GofagZQCF1EjMWeh2qtYWxT7Q2/aOxtXITbSMYBB3lw4CWilLYg
 Zexl3Qov2U8PKzyAAXLUD/zU1Bkty2FB87MLC4ViEz8Ff/mRR7+Pe6ZmhkIzEwTcNd
 SqEsb2UDI2IDem/YpMq+qDnEMYGzGJllqU1MqPodlUlmY/Sqw6vZybTE6YpgStqCWX
 zj09D3CS2CWUt9S2GaQg4mUKko6HBLUIkmvjstoN4N6dRN1g6k1IEc53f669FkOFBz
 oIlZmTXT7qF5Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] [v2] linux/compiler-clang.h: define HAVE_BUILTIN_BSWAP*
Date: Fri, 26 Feb 2021 17:11:12 +0100
Message-Id: <20210226161151.2629097-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_111217_180441_907198CC 
X-CRM114-Status: GOOD (  13.60  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Arvind Sankar <nivedita@alum.mit.edu>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 linux-csky@vger.kernel.org, clang-built-linux@googlegroups.com,
 Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Marco Elver <elver@google.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Nathan Chancellor <nathan@kernel.org>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nick Hu <nickhu@andestech.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

Separating compiler-clang.h from compiler-gcc.h inadventently dropped the
definitions of the three HAVE_BUILTIN_BSWAP macros, which requires falling
back to the open-coded version and hoping that the compiler detects it.

Since all versions of clang support the __builtin_bswap interfaces,
add back the flags and have the headers pick these up automatically.

This results in a 4% improvement of compilation speed for arm defconfig.

Note: it might also be worth revisiting which architectures set
CONFIG_ARCH_USE_BUILTIN_BSWAP for one compiler or the other, today
this is set on six architectures (arm32, csky, mips, powerpc, s390,
x86), while another ten architectures define custom helpers (alpha,
arc, ia64, m68k, mips, nios2, parisc, sh, sparc, xtensa), and the rest
(arm64, h8300, hexagon, microblaze, nds32, openrisc, riscv) just get
the unoptimized version and rely on the compiler to detect it.

A long time ago, the compiler builtins were architecture specific, but
nowadays, all compilers that are able to build the kernel have correct
implementations of them, though some may not be as optimized as
the inline asm versions.

The patch that dropped the optimization landed in v4.19, so as discussed
it would be fairly safe to backport this revert to stable kernels to
the 4.19/5.4/5.10 stable kernels, but there is a remaining risk for
regressions, and it has no known side-effects besides compile speed.

Fixes: 815f0ddb346c ("include/linux/compiler*.h: make compiler-*.h mutually exclusive")
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Acked-by: Nick Desaulniers <ndesaulniers@google.com>
Link: https://lore.kernel.org/lkml/20210225164513.3667778-1-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
 - drop exception for sparse
 - expand changelog text
---
 include/linux/compiler-clang.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
index 6478bff6fcc2..917f7f88cef0 100644
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@ -33,6 +33,12 @@
 #define __no_sanitize_thread
 #endif
 
+#if defined(CONFIG_ARCH_USE_BUILTIN_BSWAP)
+#define __HAVE_BUILTIN_BSWAP32__
+#define __HAVE_BUILTIN_BSWAP64__
+#define __HAVE_BUILTIN_BSWAP16__
+#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
+
 #if __has_feature(undefined_behavior_sanitizer)
 /* GCC does not have __SANITIZE_UNDEFINED__ */
 #define __no_sanitize_undefined \
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
