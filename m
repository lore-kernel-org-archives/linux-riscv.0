Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9D9D6B6A8
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 16:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KWSj3MNNSYIDlNGJWJfsSZtZZdh/HOaFRDSYg53voPs=; b=vrP6B4vekf1qRpVYnNSBw+GCvy
	bF6XNESJSmI6R3LQ1NpCHuzRg68fKYcgtINMLydnO08OCh18+FBVs8y0NYm0p690aVm0ZEETfHo8i
	2jIK9Ks1IStcDHdOb3I84uZhqR31VKBfpLAV5/cntEhjzdd1eHZPBh+0AqMccBoauUuBsfFnzrgg5
	2BHO6u9VXyJFgeDkeU8NgwO7MW96c1o6w/fX2BCGKi+9awwe4ztjkw/t2BbV3EUgON/St3+r7PDLE
	7KBczR/zR+KL+rxlkRG0Aw449JlcWnFnbA2vraT0ersd9Nc4jqHXAvZzJTqP18Xtd02zIQ9nf3tMP
	wiT5sYXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BQI-000000013K3-2hvm;
	Wed, 30 Oct 2024 16:19:54 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BC1-000000010PQ-1zrn
	for linux-riscv@lists.infradead.org;
	Wed, 30 Oct 2024 16:05:11 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e28fc8902e6so12240722276.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Oct 2024 09:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730304308; x=1730909108; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JqrmG66m6B1UCkhHvZIk418M17bGfpbVQcwN/mZmV/M=;
        b=BQFVKZo73IIoh3UJtMxaT6UTswNruK1lpfABZlQjmKhBvW+rYX5VilxIwdrXDDWcq/
         K4A48b2G4JhB6EElgUSYclDUhxnhWqoVfDKGsKvxitfUUB6BkRZs02MORoI5dpLuDz2o
         UP0kxwtiFuEllB2dGE62NHq+kFCW+/4GOD66++cVPyyg/j7L6nb+xe8M2MgraN4QQ5Ry
         futdfzcPUnH7f9MxggT2FNnwej5U+KMt0mJuem+Jn5xbnYvwwR2hz5BqQl7Nemv5ljLN
         4D6tnij4xHZ2G+xdLS5TKPuo6kBbBD5ejsgVp0F6o6+LANMSgUPYW+b3oHA5gahoKsWr
         hK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730304308; x=1730909108;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JqrmG66m6B1UCkhHvZIk418M17bGfpbVQcwN/mZmV/M=;
        b=MtfLnKKQPMCybj2NN39LtwJQFUOA9jPcxJXrMHf6nGhWx0b7oY8BN+16MtXt/DfjSY
         FjNte13ok96THdJLXY2vDvZUtm+ZK97vmewWv9xIp6saWjdcVO9QzLwzmm3M43bnJCgg
         VXP7Z/nNwKFw182Igas36oLRqXob+QSbnFj5HZ8w7DXLVRGQl9eRrgcMRLnBPyq/30b3
         tlBOuNDcSVLAp3NvaNEp/T4zmJSZAmZcFbA221ZiOXvlmTa8wesDQVR/sDOk+jFBYdMM
         Gnbha3iwcNKluieXLc3s5aUECtgae4/XMREVh97yZancMSgomwW4z0755dqjCSRb8hLX
         et0A==
X-Forwarded-Encrypted: i=1; AJvYcCWpHVKi33y39aAXDZnN+gO/S4FjeQIuDrVIimYtob4ybNCpcY0uN/neZuShJfltu8dH0xvqE0tH8nCdtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUjVg76+Y8GqxDrh9aYOw6pqU+gIH683fau4HTVYFHdZxGQ0iI
	3kKDBIkaELDN5ogdE69uw/fePCVokvGI3Q8zYbayZbP3cGhtqJE4VqCbra7SWi7wmRlecktNmd5
	AEWVL6gGZcXPI4Q==
X-Google-Smtp-Source: AGHT+IFi/aR3eZmVoAL9Wz4p5EtnW6YunurLPIJuDUlAryYR3kFyV0YKLO6vsDSY51xhlGqCS1gC7bq434rMmfY=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:ed07:0:b0:e1d:912e:9350 with SMTP id
 3f1490d57ef6-e3087bc765dmr51968276.6.1730304307760; Wed, 30 Oct 2024 09:05:07
 -0700 (PDT)
Date: Wed, 30 Oct 2024 16:04:28 +0000
In-Reply-To: <20241030-tracepoint-v12-0-eec7f0f8ad22@google.com>
Mime-Version: 1.0
References: <20241030-tracepoint-v12-0-eec7f0f8ad22@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7761; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=tEriRl1s5aMKzJQzUep/R+6Ah6Myzoilu5Gt/biRO6w=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnIlkj+zi/ZeCsvvjAjU6Nb9xOSl6DubI5Y/Iwy
 1JbUL9MEGmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZyJZIwAKCRAEWL7uWMY5
 RnMrD/9GOSq+2yFRe/8k8SIbCJosPtOngpcRFceZEKecE5pRUpUhsuGpdIulecGorZlT7tcfTF7
 yrDZPb5ueqeo9wHnC6xEW3CZNx87ladgXT8SQj1lNkcnP6KpD/alvOkTHSD/BnedRWQxGRVK9Li
 KHP0TINKG2hcDqPbkYkjlwdgZF7Ta5ggrweahQAMEnVTa7FcVsR1ZEVdVt+txPh8Zb9IJIsdph4
 STpTD9SIC/TLDzSC+1hjY48M72ZHuuabI5ePkc8rstSiDkDlkFgq/FUVeMEhCSlC2irnl91KtQT
 6WDkAKn7sVk30GREem94CI7KAcp9b6i7T1vMhm4XEaru6w9wPARl1Gy/6IgJ3JCGGZU+edYb1u2
 POCxtK/YUwn1oGWe7DeODIBNXcD3mtVoqOLtwiVSI6pRIRsJALNDpWY3Mvj5uMsBDtXsL8GG1nD
 QxMhI85t3tzOpDcPvQhG8+6026MCkv1TRefxTfga0067dSW1G1owYNYkV02PndF26FrhYGnXCSb
 GrG/OGiQzLTKvkgCaePQiB9/qbWor/pEW3K2kT8dTceXB70qm1u9ENXA0wkUkMF72UB0+C3Jo9n
 aAvVHTvLeIEQgUuSurrni4jzoRe+diXRQH6uSIB8H38CHj2nIVPEDbQ0y3VyGQomV5QcHr7cMuq bDnNS7IMkNetjhw==
X-Mailer: b4 0.13.0
Message-ID: <20241030-tracepoint-v12-5-eec7f0f8ad22@google.com>
Subject: [PATCH v12 5/5] rust: add arch_static_branch
From: Alice Ryhl <aliceryhl@google.com>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>
Cc: linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_090509_674309_0573076D 
X-CRM114-Status: GOOD (  25.04  )
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

To allow the Rust implementation of static_key_false to use runtime code
patching instead of the generic implementation, pull in the relevant
inline assembly from the jump_label.h header by running the C
preprocessor on a .rs.S file. Build rules are added for .rs.S files.

Since the relevant inline asm has been adjusted to export the inline asm
via the ARCH_STATIC_BRANCH_ASM macro in a consistent way, the Rust side
does not need architecture specific code to pull in the asm.

It is not possible to use the existing C implementation of
arch_static_branch via a Rust helper because it passes the argument
`key` to inline assembly as an 'i' parameter. Any attempt to add a C
helper for this function will fail to compile because the value of `key`
must be known at compile-time.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/Makefile                           |  6 +++++
 rust/kernel/.gitignore                  |  3 +++
 rust/kernel/arch_static_branch_asm.rs.S |  7 +++++
 rust/kernel/jump_label.rs               | 46 ++++++++++++++++++++++++++++++++-
 rust/kernel/lib.rs                      | 35 +++++++++++++++++++++++++
 scripts/Makefile.build                  |  9 ++++++-
 6 files changed, 104 insertions(+), 2 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index b5e0a73b78f3..bc2a9071dd29 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -36,6 +36,8 @@ always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
 
+always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/arch_static_branch_asm.rs
+
 # Avoids running `$(RUSTC)` for the sysroot when it may not be available.
 ifdef CONFIG_RUST
 
@@ -424,4 +426,8 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
     $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
+ifdef CONFIG_JUMP_LABEL
+$(obj)/kernel.o: $(obj)/kernel/arch_static_branch_asm.rs
+endif
+
 endif # CONFIG_RUST
diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
new file mode 100644
index 000000000000..d082731007c6
--- /dev/null
+++ b/rust/kernel/.gitignore
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+/arch_static_branch_asm.rs
diff --git a/rust/kernel/arch_static_branch_asm.rs.S b/rust/kernel/arch_static_branch_asm.rs.S
new file mode 100644
index 000000000000..2afb638708db
--- /dev/null
+++ b/rust/kernel/arch_static_branch_asm.rs.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/jump_label.h>
+
+// Cut here.
+
+::kernel::concat_literals!(ARCH_STATIC_BRANCH_ASM("{symb} + {off} + {branch}", "{l_yes}"))
diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
index 4b7655b2a022..2f2df03a3275 100644
--- a/rust/kernel/jump_label.rs
+++ b/rust/kernel/jump_label.rs
@@ -24,7 +24,51 @@ macro_rules! static_branch_unlikely {
         let _key: *const $crate::bindings::static_key_false = ::core::ptr::addr_of!((*_key).$field);
         let _key: *const $crate::bindings::static_key = _key.cast();
 
-        $crate::bindings::static_key_count(_key.cast_mut()) > 0
+        #[cfg(not(CONFIG_JUMP_LABEL))]
+        {
+            $crate::bindings::static_key_count(_key) > 0
+        }
+
+        #[cfg(CONFIG_JUMP_LABEL)]
+        $crate::jump_label::arch_static_branch! { $key, $keytyp, $field, false }
     }};
 }
 pub use static_branch_unlikely;
+
+/// Assert that the assembly block evaluates to a string literal.
+#[cfg(CONFIG_JUMP_LABEL)]
+const _: &str = include!(concat!(
+    env!("OBJTREE"),
+    "/rust/kernel/arch_static_branch_asm.rs"
+));
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(CONFIG_JUMP_LABEL)]
+macro_rules! arch_static_branch {
+    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
+        $crate::asm!(
+            include!(concat!(env!("OBJTREE"), "/rust/kernel/arch_static_branch_asm.rs"));
+            l_yes = label {
+                break 'my_label true;
+            },
+            symb = sym $key,
+            off = const ::core::mem::offset_of!($keytyp, $field),
+            branch = const $crate::jump_label::bool_to_int($branch),
+        );
+
+        break 'my_label false;
+    }};
+}
+
+#[cfg(CONFIG_JUMP_LABEL)]
+pub use arch_static_branch;
+
+/// A helper used by inline assembly to pass a boolean to as a `const` parameter.
+///
+/// Using this function instead of a cast lets you assert that the input is a boolean, and not some
+/// other type that can also be cast to an integer.
+#[doc(hidden)]
+pub const fn bool_to_int(b: bool) -> i32 {
+    b as i32
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 55f81f49024e..97286b99270e 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -148,3 +148,38 @@ macro_rules! container_of {
         ptr.sub(offset) as *const $type
     }}
 }
+
+/// Helper for `.rs.S` files.
+#[doc(hidden)]
+#[macro_export]
+macro_rules! concat_literals {
+    ($( $asm:literal )* ) => {
+        ::core::concat!($($asm),*)
+    };
+}
+
+/// Wrapper around `asm!` configured for use in the kernel.
+///
+/// Uses a semicolon to avoid parsing ambiguities, even though this does not match native `asm!`
+/// syntax.
+// For x86, `asm!` uses intel syntax by default, but we want to use at&t syntax in the kernel.
+#[cfg(any(target_arch = "x86", target_arch = "x86_64"))]
+#[macro_export]
+macro_rules! asm {
+    ($($asm:expr),* ; $($rest:tt)*) => {
+        ::core::arch::asm!( $($asm)*, options(att_syntax), $($rest)* )
+    };
+}
+
+/// Wrapper around `asm!` configured for use in the kernel.
+///
+/// Uses a semicolon to avoid parsing ambiguities, even though this does not match native `asm!`
+/// syntax.
+// For non-x86 arches we just pass through to `asm!`.
+#[cfg(not(any(target_arch = "x86", target_arch = "x86_64")))]
+#[macro_export]
+macro_rules! asm {
+    ($($asm:expr),* ; $($rest:tt)*) => {
+        ::core::arch::asm!( $($asm)*, $($rest)* )
+    };
+}
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 8f423a1faf50..03ee558fcd4d 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -248,12 +248,13 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 # Compile Rust sources (.rs)
 # ---------------------------------------------------------------------------
 
-rust_allowed_features := new_uninit
+rust_allowed_features := asm_const,asm_goto,new_uninit
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
 # modules case.
 rust_common_cmd = \
+	OBJTREE=$(abspath $(objtree)) \
 	RUST_MODFILE=$(modfile) $(RUSTC_OR_CLIPPY) $(rust_flags) \
 	-Zallow-features=$(rust_allowed_features) \
 	-Zcrate-attr=no_std \
@@ -303,6 +304,12 @@ quiet_cmd_rustc_ll_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
 $(obj)/%.ll: $(obj)/%.rs FORCE
 	+$(call if_changed_dep,rustc_ll_rs)
 
+quiet_cmd_rustc_rs_rs_S = RSCPP $(quiet_modtag) $@
+      cmd_rustc_rs_rs_S = $(CPP) $(c_flags) -xc -C -P $< | sed '1,/^\/\/ Cut here.$$/d' >$@
+
+$(obj)/%.rs: $(obj)/%.rs.S FORCE
+	+$(call if_changed_dep,rustc_rs_rs_S)
+
 # Compile assembler sources (.S)
 # ---------------------------------------------------------------------------
 

-- 
2.47.0.163.g1226f6d8fa-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
