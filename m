Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A8BCF64BE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 13:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vJbCNV6JL2N8lZRYI3qfW+ik/+ykbw2jcFG8LBYvQLM=; b=AhSck0sfe6u+ggkDjU/Hia9ktf
	ANcLS+QVMgBljwL3IKGLV2wrz7YrUcwlSDCDm0tuHpha+Ttz60mfhqt7xuNMmkQKuc937pxzzg5Bi
	V5vftaBo/swlg6o8UXXlRDOBzoxFYPZnPTYNix/pnHK0ekIBe/jz0eZ12lhNacYVNtJbcCq4Fd+p+
	H6XGortZ6IWuVpH0pe9frrnvugUpNpX6RPcjdDkqmxJOeYU177VuHrqyPb++vjn4WGDy7FJmLtbyO
	id1+Lx2SS07WfbS1rWhuIQ0lrK2WnmKNPlLZuugOhAL5urWGf3XbXrCC5prB0ywlBuKizSU6pT525
	wOXkhrCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svcxp-00000002wct-2C6k;
	Tue, 01 Oct 2024 13:30:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svcxn-00000002wa9-17E0
	for linux-riscv@bombadil.infradead.org;
	Tue, 01 Oct 2024 13:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fkhFbvRkdz/oOfeYJrLg9+G9M/Uj0+RwqIl1/SZKHXU=; b=WHm+hBRmhmnvF0qD9BaPaV+wgh
	lPipD+KpjZ4DoqYcaylT7iVYyfG4sPonD9ugZbEugV+7AECt1MXo1s17AnZfa65RlPx/mZg2DBXAD
	YTcL/Su36Ct39EEZdGxjyRtZvd8+ecI3isIQLCupmLAJdgFoddsCxsuy9ypPPksnYRLDM5ZnwVhAt
	KBFuQJX68Ay+4hEa8s+7/1xpoEn9lGHrEkmz0IfVrFLYZP2yKg1IuWm4acSzdDm7xq3K9a7Gg0L/t
	+ecqvQl/71bBd1tntn6CjY5tqXON8ySUvoWvGyuZl3zP7hRQ35tlnTVoWQhj1B23Vwk2glX3fAmdK
	Sdn9j5eA==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svcxk-000000036bt-0MUF
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 13:30:50 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e2555d3d0eso59426087b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 06:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727789444; x=1728394244; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fkhFbvRkdz/oOfeYJrLg9+G9M/Uj0+RwqIl1/SZKHXU=;
        b=ADF2HaTiFU0JneBoMnNmAM5QmgDQikGHqctS6W1/X/kr12KfsL4v8UomHjzbU3yVsN
         HBwLZXvbqrrsbHer1lAX9d3HF+0oZ5Q2kz8hvJ82IXe0oWvU2cj1utY5x2y8Ouel64f3
         jy/avn8tFYC92EPqYppILqo0lazKmzX0pB02QgrKWGAwiOfppj9vNatKd9ycXBw+YcF4
         ysQD9YjCukG5wbva7UEzHEonPM0LPdHhzVHLroUuCqz1uMjMxFe6r2BKBIDyE88xXNyV
         EHtfA0iXNfTtaAvgB7P8O0L4lB8BKPCj3+ajzEMqKDfk/w6/BeOCIetdg9/DAGM79C1b
         Xugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727789444; x=1728394244;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkhFbvRkdz/oOfeYJrLg9+G9M/Uj0+RwqIl1/SZKHXU=;
        b=HtWr3ycpfhzANiGfZU/eGd+AorkR2tVCNRHJ5CM80fDxe8y2nSPOWIqDQS70fi09MS
         5LnyQT9T3SDxYVBpHy8otvKLBIG1VI9eIcqgyTod04achC1kO+cYnxJTvwtQyoiO8Rn7
         XXpIRqEeXnU5ZCxVxmjQuWKtJ4bEwvTCE4fNOGvz3T0JV6JLcIJIAzQ8188SCuqWF8NY
         DJrhIyB6beZSovuTvasOOO2LdF7kNZIPr4xeWaHF01Nw3PRibqd/rZh3IaUp8zTHKev4
         nZzvIraskRV57PY1qdGrQPS5kLjKuWEpdsrfuU3RSHy9GQSTu1FTOFhqjUjmTa1g2HAu
         DO9A==
X-Forwarded-Encrypted: i=1; AJvYcCUj6wWcU1SPEPRbhWHEHrYpg01zhddVHJgM2rSkH9TvQWft7aB7A9LWPdB3L4T4nH+zTMv0OBUZ2lv7Ug==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRvwvMVtpzeka7U2Mu/qLrExi7jQqIWONkeQOAmMihAk2UCcDh
	Kra+4mivzXeQ/o4oeqp8E5cgvUqybo2xmiTqwevnJJ3IhDRMxgIFBgcXn4lwQjvGx7dH1BUkR/9
	SxW7rnh4OBJjbzw==
X-Google-Smtp-Source: AGHT+IHx8WYLlRQ85MZlmXhOzStV8hphkC3W/SA4f78hZMUVqK+AieUKfwBlCdSzSifKonxye2KCvb5tQYoxE/A=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:8304:0:b0:e1a:a29d:33f6 with SMTP id
 3f1490d57ef6-e2604b2bbd3mr134063276.3.1727789444352; Tue, 01 Oct 2024
 06:30:44 -0700 (PDT)
Date: Tue, 01 Oct 2024 13:30:02 +0000
In-Reply-To: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
Mime-Version: 1.0
References: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8506; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=B20XPkbS2BldO1VNXORVIshLvelvNfCPEDgTJEytqJk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBm+/lyTWXV0qt+2jySV7mW4g92htG/ndvQ8HqpA
 dk6PB1Bf0yJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZvv5cgAKCRAEWL7uWMY5
 RkGpEACtKcH0XvxL+nqPbUO1qDZYBp7bMUnck3VQWyZKLA989Zc7bnXqY74U0cmqeyfj/XoMJ5Z
 lnQ5jogYpeKqs3goYSkOH+M4p4ej9Ie95XbXHIMRYWpPojVgq4djGHfYMtRJrD3hjvEO6RlaQMc
 AeL+nbrCeI1NUFAMheXguFI4z5YgMNFrkdJ3LujbqXfax5LKBopJpR9sIf+2zmz5cC56fRIAyop
 p2Br8NEWvvZd37qk9WAK8Bb8SQTqhS5MslcMU6ATBjPTChXJVV9Zw0Yu9EVkparyOh+lILISo6l
 nj3W1hFE4wA765Q6mxAlnKubwjV5oWtEyPu5Ju6wnL0gXlHvr+c7DmEA0wnBLV37vuy0Vp/6Kpt
 hF041c9wo0ehSoZObI95FnGdJsjNLcm3CdNagGhlWLDqT/juXtplimiVk4Yru1uEtsAKIncI0Kh
 2vBc9thKTWi4uiKDUgoR80YNDNo/khAorOcLybKN7XOXe6XWuZvSsb/Q9vJwO3Rz6PJjFK1/szN
 VWquccbjzSPl3/zsb1gR1lEcyEUuJg9/oIAi7qCT9l7ArCrWTOwyeReOGled4NdKqDou3bXF3fL
 1CoH3B2NyClyJ50UDrVa4jHNW/AwmSHJp8dqwKeIqLeYIpyIxb72ihi3ukO1m3EOe7JWuBRc626 8ofGkmyjOxUAWFQ==
X-Mailer: b4 0.13.0
Message-ID: <20241001-tracepoint-v9-5-1ad3b7d78acb@google.com>
Subject: [PATCH v9 5/5] rust: add arch_static_branch
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
X-CRM114-CacheID: sfid-20241001_143048_265563_0BC54B8C 
X-CRM114-Status: GOOD (  24.72  )
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
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/Makefile                           |  5 ++-
 rust/kernel/.gitignore                  |  3 ++
 rust/kernel/arch_static_branch_asm.rs.S |  7 ++++
 rust/kernel/jump_label.rs               | 64 ++++++++++++++++++++++++++++++++-
 rust/kernel/lib.rs                      | 35 ++++++++++++++++++
 scripts/Makefile.build                  |  9 ++++-
 6 files changed, 120 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index b5e0a73b78f3..09ea07cc4001 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -36,6 +36,8 @@ always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
 
+always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/arch_static_branch_asm.rs
+
 # Avoids running `$(RUSTC)` for the sysroot when it may not be available.
 ifdef CONFIG_RUST
 
@@ -421,7 +423,8 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
 $(obj)/kernel.o: private rustc_target_flags = --extern alloc \
     --extern build_error --extern macros --extern bindings --extern uapi
 $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
-    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
+    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o \
+	$(obj)/kernel/arch_static_branch_asm.rs FORCE
 	+$(call if_changed_rule,rustc_library)
 
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
index 000000000000..9e373d4f7567
--- /dev/null
+++ b/rust/kernel/arch_static_branch_asm.rs.S
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/jump_label.h>
+
+// Cut here.
+
+::kernel::concat_literals!(ARCH_STATIC_BRANCH_ASM("{symb} + {off} + {branch}", "{l_yes}"))
diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
index 011e1fc1d19a..ccfd20589c21 100644
--- a/rust/kernel/jump_label.rs
+++ b/rust/kernel/jump_label.rs
@@ -23,7 +23,69 @@ macro_rules! static_key_false {
         let _key: *const $keytyp = ::core::ptr::addr_of!($key);
         let _key: *const $crate::bindings::static_key = ::core::ptr::addr_of!((*_key).$field);
 
-        $crate::bindings::static_key_count(_key.cast_mut()) > 0
+        #[cfg(not(CONFIG_JUMP_LABEL))]
+        {
+            $crate::bindings::static_key_count(_key.cast_mut()) > 0
+        }
+
+        #[cfg(CONFIG_JUMP_LABEL)]
+        $crate::jump_label::arch_static_branch! { $key, $keytyp, $field, false }
     }};
 }
 pub use static_key_false;
+
+/// Assert that the assembly block evaluates to a string literal.
+#[cfg(CONFIG_JUMP_LABEL)]
+const _: &str = include!(concat!(env!("OBJTREE"), "/rust/kernel/arch_static_branch_asm.rs"));
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(CONFIG_JUMP_LABEL)]
+#[cfg(not(CONFIG_HAVE_JUMP_LABEL_HACK))]
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
+#[macro_export]
+#[doc(hidden)]
+#[cfg(CONFIG_JUMP_LABEL)]
+#[cfg(CONFIG_HAVE_JUMP_LABEL_HACK)]
+macro_rules! arch_static_branch {
+    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
+        $crate::asm!(
+            include!(concat!(env!("OBJTREE"), "/rust/kernel/arch_static_branch_asm.rs"));
+            l_yes = label {
+                break 'my_label true;
+            },
+            symb = sym $key,
+            off = const ::core::mem::offset_of!($keytyp, $field),
+            branch = const 2 | $crate::jump_label::bool_to_int($branch),
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
index 77610e19df96..448af0880785 100644
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
+#[cfg(target_arch = "x86_64")]
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
+#[cfg(not(target_arch = "x86_64"))]
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
2.46.1.824.gd892dcdcdd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
