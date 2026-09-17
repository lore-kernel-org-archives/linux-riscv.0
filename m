Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674F6C88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 16:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OqoyukBYpUWxCgnyEQLhuMAbDRa57hfV+ZAFu/zOVbY=; b=M3FjAwLbrsIIdy
	lsqVOzMYDX49trB6RQ2uQ87aBLCwJGOHbRWrESkLE4PmDPvHrnuF3w1NVzStkpaTa1qAILuCceir2
	f/2xN+MTjamTobeQsywVqk81mNjlR2s8eu68xxvNri8a2vkRJUzxzPhx9wjli0Zan3jD9B2VadVXz
	HJ5U8golXdMMzHD7nCLtNwjAWLiMX2RBcmdUfcNEWkqq0onb5uzu9lBgK13y4Kzc7agTf1o8mlpb8
	5woVJczPLQlnIvk2bTkk2DjRJvQQkioX2RMwKFMc23S3YwcqtGz7rAk2/s1J7WGccHInbh8lW4i60
	vLvnh7UY3bpslXQKUNuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EhG-0000000Bqx5-3OJ1;
	Thu, 17 Sep 2026 16:10:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EhF-0000000Bqw3-1oQY;
	Thu, 17 Sep 2026 16:10:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D78C3601EF;
	Thu, 17 Sep 2026 16:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C57B1F00893;
	Thu, 17 Sep 2026 16:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789661448;
	bh=R/dI7mlJ74lyeS1TaG8sZDLjKTD6N4MtXCnU+NQQZlI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=THLOBEP8cD0Prz+aYzKFLFiDAaCtSLcp3z2JIKOlETzeJSQAq2yTCrFCM1M/MmeGF
	 KTKc7QJcFU+PfZ+3IllL04QD7xucC6NKS5c3A2G3i1CHq6CNQX3HD1BQSCMFQ6QatW
	 6GQeGTKLZvgUsz8oJxGD4RFahsBVfnBU8fYI5kPV0C8CnqF+k35P1xz3gxJf3QX62o
	 78XEx6aZB7HqanYAwR5KzWbKp7yGZohBCnNIihCFc4l3NskPz2uU/MLPu/+kwebmcN
	 rfN+PSrh/J8ohhK1Gu6aRJv9yVlWvc+e6Nuh3b2xlEsLGSY62t4dyhQiYcXvz8MYjP
	 AlKfjqdUL5suw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Thu, 17 Sep 2026 17:06:29 +0100
Subject: [PATCH v3 19/20] kbuild: build rust crates in parallel with the
 rest of the build
MIME-Version: 1.0
Message-Id: <20260917-build-speedup-v3-19-9ecf4163ff36@kernel.org>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
In-Reply-To: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
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
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
 linux-hardening@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4034; i=ljs@kernel.org;
 h=from:subject:message-id; bh=ed2Yyw/iZdlR8zsOttNJurPt1jD2t74hXGroQgbemrM=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLWCDA8Kut9aPJ82zKWj9qnUzwcVLxWrrjtosDK/TXL6
 oY/+y+zjlIWBjEuBlkxRZbnX8T3B4mEzeu84O8GM4eVCWQIAxenAEzE7xgjw8p7mrobDqbxhIYd
 i21InSK/3H6d38Ggejaje3LcKjIhCQz/87etZFm/NNik7erMlzuWrG8IW7FTVr835seijNivKx/
 94QcA
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
module being built to account for external rust modules which rely upon it,
and that only one rust/ build will be performed at any one time.

External rust modules builds are unaffected - make modules_prepare ...
(where ... are other goals) will build rust/ first.

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
 Makefile               | 13 ++++++++++++-
 scripts/Makefile.build |  5 ++++-
 3 files changed, 21 insertions(+), 2 deletions(-)

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
index 8263fc8a86b3..ede9cfeffd56 100644
--- a/Makefile
+++ b/Makefile
@@ -1425,11 +1425,14 @@ prepare0: archprepare
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
@@ -1756,6 +1759,14 @@ modules: modules_prepare
 # Target to prepare building external modules
 modules_prepare: prepare
 	$(Q)$(MAKE) $(build)=scripts scripts/module.lds
+ifdef CONFIG_RUST
+# Avoid two instances of rust/ being built at any one time.
+ifneq ($(filter modules_prepare,$(MAKECMDGOALS)),)
+ifeq ($(filter all vmlinux modules %Image% dtbs rustdoc rusttest,$(MAKECMDGOALS)),)
+	$(Q)$(MAKE) $(build)=rust
+endif
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
