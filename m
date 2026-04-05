Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89035E9D827
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 23:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=liPq3tO4ZhUkTCwC8JjT1MMGJzQ0Nfr3Zu1diSO/J+c=; b=w59LFZV6cmpE0p
	+YgadupX5CTN16SYIuGsO4dUWoDRuQL421ceRctvfTix/9FRvSC896jOSDlnI64wH+N3LHIAUmJLU
	XJhiRMHlI0KkAP0pZE5Mx++85Um3Lo3Gk9TiROL+k/f7WUznJdQxwdpuxs+6Xy204mNkLIRDkPiOw
	2gSFTseKF69Py19a3HiCay6IBfOMEvaSHAcm8fONzuATytCHhCTxkagPnsIHJTORoWFK4ZpdeNOiW
	8bA8QbJsFjnq0ZXskJkvu/tIFqOVx2T89Meegz1xVLljPxiHEjctLXsVhP5bjyNT+/ixDNnJG7gVM
	bkzwyB/RMxXZWHCPWPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XIz-00000004a8j-1Erb;
	Sun, 05 Apr 2026 23:55:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XIw-00000004a6W-1Mvx;
	Sun, 05 Apr 2026 23:54:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02E06418CE;
	Sun,  5 Apr 2026 23:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B6AC19425;
	Sun,  5 Apr 2026 23:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433297;
	bh=zEAiIku4X7Y0hc7v9DxS7dQT5lhAUdf4bcfA9WafsEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KkarVOMv/eAWnbZswNfp2WIVyzZhZOaVT1moxhBROgr7XlggS7b9KhTq1UgpP++Zx
	 Alotrr0bPvvYyo4kq6FyVc9YElH+P1TTlCs4ZJDoaQatZbjqXB+wmP3owqg14Of61w
	 QgM2JYhZrkhdKFrFlvY2f4jGUHLEFksjOsoVEnBASEJqGV2AarC0Em5BCe5CzlS47S
	 j5Wd5drcDjr9h3/HuN0p6YfhD8sEk6Y7iHcXTD8oeWf04xG4U8DAtYM0tEKntTSdCh
	 MkAPdwq8G2+AFZ7GM7tcJHA678KuZN10hpC7WsUXu2VGc3XKFcIpwDOF2q8lXJJmsT
	 bPpndWVVj+S2Q==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH v2 08/33] rust: simplify `RUSTC_VERSION` Kconfig conditions
Date: Mon,  6 Apr 2026 01:52:44 +0200
Message-ID: <20260405235309.418950-9-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_165458_401003_0BBCCB68 
X-CRM114-Status: GOOD (  11.35  )
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

With the Rust version bump in place, several Kconfig conditions based on
`RUSTC_VERSION` are always true.

Thus simplify them.

The minimum supported major LLVM version by our new Rust minimum version
is now LLVM 18, instead of LLVM 16. However, there are no possible
cleanups for `RUSTC_LLVM_VERSION`.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 arch/Kconfig       | 3 +--
 arch/arm64/Kconfig | 8 --------
 arch/riscv/Kconfig | 3 ---
 init/Kconfig       | 2 --
 4 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 102ddbd4298e..84089e80584b 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -968,10 +968,9 @@ config HAVE_CFI_ICALL_NORMALIZE_INTEGERS
 config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	def_bool y
 	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS
-	depends on RUSTC_VERSION >= 107900
 	depends on ARM64 || X86_64
 	# With GCOV/KASAN we need this fix: https://github.com/rust-lang/rust/pull/129373
-	depends on (RUSTC_LLVM_VERSION >= 190103 && RUSTC_VERSION >= 108200) || \
+	depends on RUSTC_LLVM_VERSION >= 190103 || \
 		(!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
 
 config CFI_PERMISSIVE
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 38dba5f7e4d2..c91130c7fba1 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -291,14 +291,6 @@ config ARM64
 config RUSTC_SUPPORTS_ARM64
 	def_bool y
 	depends on CPU_LITTLE_ENDIAN
-	# Shadow call stack is only supported on certain rustc versions.
-	#
-	# When using the UNWIND_PATCH_PAC_INTO_SCS option, rustc version 1.80+ is
-	# required due to use of the -Zfixed-x18 flag.
-	#
-	# Otherwise, rustc version 1.82+ is required due to use of the
-	# -Zsanitizer=shadow-call-stack flag.
-	depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108200 || RUSTC_VERSION >= 108000 && UNWIND_PATCH_PAC_INTO_SCS
 
 config CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS
 	def_bool CC_IS_CLANG
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 90c531e6abf5..ddc534402400 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -232,9 +232,6 @@ config RISCV
 config RUSTC_SUPPORTS_RISCV
 	def_bool y
 	depends on 64BIT
-	# Shadow call stack requires rustc version 1.82+ due to use of the
-	# -Zsanitizer=shadow-call-stack flag.
-	depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108200
 
 config CLANG_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_CLANG
diff --git a/init/Kconfig b/init/Kconfig
index 36d32ea44594..b8a1ab0d49d4 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2193,9 +2193,7 @@ config RUST
 	depends on !DEBUG_INFO_BTF || (PAHOLE_HAS_LANG_EXCLUDE && !LTO)
 	depends on !CFI || HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	select CFI_ICALL_NORMALIZE_INTEGERS if CFI
-	depends on !CALL_PADDING || RUSTC_VERSION >= 108100
 	depends on !KASAN_SW_TAGS
-	depends on !(MITIGATION_RETHUNK && KASAN) || RUSTC_VERSION >= 108300
 	help
 	  Enables Rust support in the kernel.
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
