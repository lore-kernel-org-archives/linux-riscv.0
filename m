Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB9EC79FAA
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 20:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMfrQ74qY27ytkvfYUwrHhTNtJO3W1rsZo+xmjHWcW8=; b=uf7aB6hTRf37co
	gE4bn0f4HN6TPG5cNw5EXWx0KfWM9FWFTT4JhCMktId/TD9IqqUiPqJDOtsJQoif/JyB6yydk07j/
	GxUwKwY3VLadoyfkBmn4KR9OFVvfqsnP2UP54zsl1u6U/q92yz+vmpipfVrA/9gSpdK5sUyJx/L5x
	ZbBI+dlQadOL3CRWFDPoP2r5na6e9PMbcIkbYhDqewC0rrT1qzOBO4wF1g7JPNFO7bIdVjNQV8o3F
	uz3JGDdic3eka0gvTDCIdd3DzABp2QsVwKkb4azKFYTIYPmA9VUnzzkAmjzfbsZYC/rPhKbId8ti+
	fronJYaZyyb/UWU5E1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42ur-0000000AGpR-3fOl;
	Tue, 08 Sep 2026 20:59:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42uq-0000000AGnw-1g64;
	Tue, 08 Sep 2026 20:59:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 29D77400B0;
	Tue,  8 Sep 2026 20:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A351F00A3D;
	Tue,  8 Sep 2026 20:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788901180;
	bh=RQEjHODHdWtfRLaYljXTCOiq1fIwDiQ3ymNC15jt1/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cee9VYiY+WdzxYhQHHcFgW9cEwCd2qP/qR+XgTI3WUEJ0rbaGMAwBQrVwh6V/pNQN
	 CpIE2yLM+2TfFktdZCqWhVBBUKNzujLyuCVWJCWVfEBlbUqbm8n9lWw6oPCj5dFDZU
	 M41dPGXGQ0mGZSLm33uRXCzUEFoO6y/dwB7tkN5ybxYgrObbeLwY5+JKUz/GxN4vgW
	 UcOlkNW7puN3P38kETgBuAC0BPsD68GMf6ZjU+mY2WDR9zV1NH1UEGbdkKlP9cdoO6
	 Sl9KTeFOpgl77TNi5rzqQBkJpHbm3c6JghAn0h+pyaui8GDgz6V7T0MnUM0AWIHiwb
	 zc5K3c0DyX7bw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 08 Sep 2026 21:55:22 +0100
Subject: [PATCH 22/23] kbuild: build rust crates in parallel with the rest
 of the build
MIME-Version: 1.0
Message-Id: <20260908-build-speedup-v1-22-5dc1ac01672d@kernel.org>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3754; i=ljs@kernel.org;
 h=from:subject:message-id; bh=XCvCrcK+AhcCVOOFTIEWP4r+MqSjPsV0qg7Bzqs7ge4=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLIWlFlmvzlQkJt/tI7n6rKpT/ZyLvslHZtgUDXlzhmLG
 QbK1/LyOkpZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjARPj1Ghv+RslWHyrfcvtHy
 t8lna87BP5svKogr5rrNNdNolvaaZsrwPyHOTVVg1cNbW6XLa+b/z3I8sNfvVs+U3T+agq1m+l7
 LYgQA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

When CONFIG_RUST is specified make prepare builds all of the rust
components before descending into the tree.

This means nothing can be done until all of these are compiled, resulting
in a stall at the start of every clean CONFIG_RUST build.

This also implicitly slows down every rust-capable LLVM allmodconfig build
as this enables the CONFIG_RUST option.

Fix this by allowing rust crates to be built alongside the C code.

Remove the rust build from the make prepare step, then establish a
dependency between rust code located elsewhere in the tree upon rust
components contained in rust/.

Do this by establishing a top-level list of directories containing rust
code, KBUILD_RUST_DIRS, upon which the dependency is expressed.

Finally, ensure that no rust code is located elsewhere and fail the build
if any is found to ensure that nothing is missed in future.

Care is taken to ensure the rust/ dependency is also established for any
module being built to account for external rust modules which rely upon it.

Every Rust and C object was confirmed to be byte-for-byte identical after
this change.

Whole build, 128-thread Threadripper 9980X, best of N runs:

                                         before   after     delta
                                         -------------------------------
  x86 defconfig+RUST, clean                36.5s    32.6s     -3.9s (-11%)
  x86 allmodconfig, clean                 297.0s   278.3s    -18.7s (-6%)

Assisted-by: LLM
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 Kbuild                 |  5 +++++
 Makefile               | 11 ++++++++++-
 scripts/Makefile.build |  5 ++++-
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/Kbuild b/Kbuild
index a6a0192dea08..9670556059dd 100644
--- a/Kbuild
+++ b/Kbuild
@@ -115,3 +115,8 @@ obj-$(CONFIG_NET)	+= net/
 obj-y			+= virt/
 obj-y			+= $(ARCH_DRIVERS)
 obj-$(CONFIG_DRM_HEADER_TEST)	+= include/
+
+# Rust code elsewhere in the tree depends upon rust/.
+ifdef CONFIG_RUST
+$(KBUILD_RUST_DIRS): | rust
+endif
diff --git a/Makefile b/Makefile
index 7d23d7b64be3..3805f72428cb 100644
--- a/Makefile
+++ b/Makefile
@@ -1429,11 +1429,14 @@ prepare0: archprepare
 	$(Q)$(MAKE) $(build)=. prepare
 	$(Q)$(MAKE) $(build)=scripts/mod
 
+ifdef CONFIG_RUST
+export KBUILD_RUST_DIRS := drivers lib mm samples
+endif
+
 # All the preparing..
 prepare: prepare0
 ifdef CONFIG_RUST
 	+$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust_is_available.sh
-	$(Q)$(MAKE) $(build)=rust
 endif
 
 PHONY += remove-stale-files
@@ -1760,6 +1763,12 @@ modules: modules_prepare
 # Target to prepare building external modules
 modules_prepare: prepare
 	$(Q)$(MAKE) $(build)=scripts scripts/module.lds
+ifdef CONFIG_RUST
+# Ensure rust/ is build before any external rust module which will rely upon it.
+ifeq ($(MAKECMDGOALS),modules_prepare)
+	$(Q)$(MAKE) $(build)=rust
+endif
+endif
 
 endif # CONFIG_MODULES
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index b9093b39cc2f..77351d6006fa 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -360,8 +360,11 @@ quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
 		$(cmd_ld_single)) \
 	$(cmd_objtool)
 
+rust-dir-ok = $(or $(KBUILD_EXTMOD),$(filter rust $(KBUILD_RUST_DIRS),$(firstword $(subst /, ,$@))))
+
+# Ensure that any rust code located elsewhere from rust/ is listed in KBUILD_RUST_DIRS.
 define rule_rustc_o_rs
-	$(call cmd_and_fixdep,rustc_o_rs)
+	$(if $(rust-dir-ok),,$(error $@: Rust code in a directory not listed in KBUILD_RUST_DIRS, see the top Makefile))$(call cmd_and_fixdep,rustc_o_rs)
 	$(call cmd,gen_objtooldep)
 endef
 

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
