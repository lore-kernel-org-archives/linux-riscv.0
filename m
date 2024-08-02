Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC7FC3DA49
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 10:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=x9G6nsY+8s1NV7lK9R0/ztx2otk3MlgoA1LAWFLL3GU=; b=z30XW4kPShR0zNgymd3APADax8
	cMyQbrVVcnT1S4GJKqOgr/9tq3FrCrHmEOg6jQHqTt35po+iZ9XjGqEKRedEcdZs/fx08umEY95j6
	dAVwZdqPseEkwN1ESt/OhTN72HyUMLrXXsvrrs9snLLAXcSv7YtP/eC/uFEz1d6PcgeE4mYCusUuR
	kzAdxBLNMqgr+ylun9rR+Bbqws6q5NpdzGbAi2h+oDJxDtuVCIi0mPszTq3ldXW662uHJrdiguers
	/Fe2kBEyRMtp+4mLTZx2QtuWai9fd1xhNRZY0d6srLDWiEQh4tSBbTNemYkMZQ9c/HIKxIJKpmhJ+
	u+bY9TGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZpnn-00000008Wua-2CGI;
	Fri, 02 Aug 2024 10:46:27 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZodi-00000008Hz6-106P
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 09:32:54 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4281b7196bbso44324925e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 02:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722591116; x=1723195916; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zM3m99O4n2Twerz/pRePjo08eZkhu0+8AKwEfgAtGt4=;
        b=4eHp3O7XmXRO+GZo9qXOFHQ4xjxGJ2wX58vjhAOY2UoYRz5IIHgihmjO/e81+7x4Jn
         sfXhaZ2VBDOxcFC6cmia8QwKgovz8PmUjsTDdocTk/fy0xTPKqLTmlYt4nnHW0s/2dFW
         CirM00VSuXGkVa5jn++iIhu3HoRtZW+zt8Idr1jaFJchrrEOiYnvv8UMWl7m6Ngff8p2
         exVVgoRVW0BC9AvOBj+KMozuDEtqr4HoXHH3yYuzkAzVEnzspRpsDShtEtBi8Hj31jQu
         yBWUYR6oSXx9PAIpkjrTfVdU7n6eS2h+4zQvr6EUefxP6kJqb/Pb+AY+PaoG4D7pAXBH
         BkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722591116; x=1723195916;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zM3m99O4n2Twerz/pRePjo08eZkhu0+8AKwEfgAtGt4=;
        b=IoqrY3Ats1bPMY4n+WXd52Yv0rAYIgaqrOedv5QWGHOBXXsG4/oS8DplAelOsdle/Z
         NbxL+W/qaJHF6AT1KPnaZGXVsKRim3h+S4mFjCXWWZsLTBV2hjQq7oCG6R4HsvmqiW2L
         Nh2f0o0KlpwHlzrPBz+h18piWbIK0PyJMxsUJe+HsNeGEr7iAewfBuFrqKuJ8bVjCjEC
         3yPXFd8P5mUqBqFaQHUAHRwQDyvyRbJOoJ/el+QhX+RQtuJsuNi93SCc3znqWx6mE/Q7
         +WOGS248VaeXjxcmsAIbxyJmdEbJLg5JQcrRyixcfLEgr8jdOr0Kv0W1Uk4BbOMY3ujZ
         9mtA==
X-Forwarded-Encrypted: i=1; AJvYcCX2zYElZYbYkajKRznOaNDAoQP7lyMgG7xvXyzcMwLU0BMqepRmpA9QrUPaMI8atU/47rF+0nCogJtCSPhAklBDO7Coqcg1Skw3eofw4CNQ
X-Gm-Message-State: AOJu0Yw+UJt//ZSOnMp+YZHD9LKmt5lnvejw95nxZVgNj+UDbCnpILUO
	NGK+fyN/oxpRprE+Tot2LjdUZcfj+VeJhaMZ/NZDeHtclVA0RA+gRgq7qI+mYWzhrW8uvjHOaWl
	1FM24gAPy1URnGw==
X-Google-Smtp-Source: AGHT+IGMwI2YnvVh4aGkdHdRdkDWhv9czkPaDnRb/Uza5JtnVfSJQ4udLbGj6xPxnvjb20c9CZd5v/WeuhtigQo=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:35d5:b0:427:f3e7:74b3 with SMTP
 id 5b1f17b1804b1-428e6bd2627mr143685e9.8.1722591115777; Fri, 02 Aug 2024
 02:31:55 -0700 (PDT)
Date: Fri, 02 Aug 2024 09:31:27 +0000
In-Reply-To: <20240802-tracepoint-v5-0-faa164494dcb@google.com>
Mime-Version: 1.0
References: <20240802-tracepoint-v5-0-faa164494dcb@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=12299; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=7zro+hPhl5wrxpTL44cbCe4yhTwxThOX6UYpA0jGmoA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmrKeFDK4q+HH+F1GSMYL//MT9vvFarwSK1yZp/
 rgxD45Fb+6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZqynhQAKCRAEWL7uWMY5
 RtwpEACbosVh3ZJ9Iia3xEGZYklzxgaB9+kJC7YAaEsNZjbxiLet9o1tpFzfLiZ5T/0O57Ilajc
 XQbCAi54t8z0X+pEVVGWSfwcm3QFQilL5/pb4XKQYqAKQodPbgMcZqGM/X74EJvnDgD+A2oxgNp
 ivz++i4G1o1Dv7tB/tqfVRSxJB8H1N4GthNDizDWyZUEIOKAvMp69+obVCOjY999bj7rjZAKVjL
 TbQ61vK5ymEEp0GiKUAqz+HxRo0cNvnyUwS0DIAgFAzmqSc6VxcyhqxyA7YpRFhcnPAcLG/ypS3
 in0ja2tT/dJtfldbOBD4dnoy8h8CFxlDSAeVhD4m9SWmDoXkzR4HlBD/ulKNP4FVLFzCFCgAmop
 /q8XxkXp2MFv9waE2fzp4lq+nWPK4CG5GZ0aY7FlKb/v8feK34QvscdQn4ueN8gNXZKyvPdmLF8
 9fU+tD0DX1c4FqI59DFlWqes0oo6YBKzu22nhyvVGF9CPBSXueplzNQMrLKOLEC2rgm4A7Q6155
 4orIOtdfBvN2DhPyTxTpiSIUWjKy4l7Whncg930/yqIjhuyOLXuVG148GK+NUaYtDvAKaxXEEig
 CwWlFOu4xY0joOMJLCGfrraHtdHYIoYCuN2sIGOVsvAFjsjzlDDkQimsEJfBFLAyrDMQPi88Ck4 dckxc98uVp0g72Q==
X-Mailer: b4 0.13.0
Message-ID: <20240802-tracepoint-v5-1-faa164494dcb@google.com>
Subject: [PATCH v5 1/2] rust: add static_key_false
From: Alice Ryhl <aliceryhl@google.com>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>
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
	Alice Ryhl <aliceryhl@google.com>, WANG Rui <wangrui@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_023158_312271_0C450732 
X-CRM114-Status: GOOD (  24.49  )
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

Add just enough support for static key so that we can use it from
tracepoints. Tracepoints rely on `static_key_false` even though it is
deprecated, so we add the same functionality to Rust.

It is not possible to use the existing C implementation of
arch_static_branch because it passes the argument `key` to inline
assembly as an 'i' parameter, so any attempt to add a C helper for this
function will fail to compile because the value of `key` must be known
at compile-time.

One disadvantage of this patch is that it introduces a fair amount of
duplicated inline assembly. However, this is a limited and temporary
situation:

1. Most inline assembly has no reason to be duplicated like this. It is
   only needed here due to the use of 'i' parameters.

2. Alice will submit a patch along the lines of [1] that removes the
   duplication. This will happen as a follow-up to this patch series.

Comments are added to the C side as a reminder to change the asm on the
Rust side in case the C side is changed. For simplicity, the x86 asm
uses the forced 5 byte version. This will be fixed together with the
upcoming removal of the duplication.

Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: WANG Rui <wangrui@loongson.cn>
Link: https://lore.kernel.org/rust-for-linux/20240801102804.GQ33588@noisy.programming.kicks-ass.net/ [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 arch/arm64/include/asm/jump_label.h      |  1 +
 arch/loongarch/include/asm/jump_label.h  |  1 +
 arch/riscv/include/asm/jump_label.h      |  1 +
 arch/x86/include/asm/jump_label.h        |  1 +
 rust/kernel/arch/arm64/jump_label.rs     | 34 ++++++++++++++++++++++++++++
 rust/kernel/arch/loongarch/jump_label.rs | 35 +++++++++++++++++++++++++++++
 rust/kernel/arch/mod.rs                  | 24 ++++++++++++++++++++
 rust/kernel/arch/riscv/jump_label.rs     | 38 ++++++++++++++++++++++++++++++++
 rust/kernel/arch/x86/jump_label.rs       | 35 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs                       |  2 ++
 rust/kernel/static_key.rs                | 32 +++++++++++++++++++++++++++
 scripts/Makefile.build                   |  2 +-
 12 files changed, 205 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/jump_label.h b/arch/arm64/include/asm/jump_label.h
index 4e753908b801..56c106669f99 100644
--- a/arch/arm64/include/asm/jump_label.h
+++ b/arch/arm64/include/asm/jump_label.h
@@ -15,6 +15,7 @@
 
 #define JUMP_LABEL_NOP_SIZE		AARCH64_INSN_SIZE
 
+/* Changes to this asm must be reflected in `rust/kernel/arch/arm64/jump_label.rs` */
 #define JUMP_TABLE_ENTRY(key, label)			\
 	".pushsection	__jump_table, \"aw\"\n\t"	\
 	".align		3\n\t"				\
diff --git a/arch/loongarch/include/asm/jump_label.h b/arch/loongarch/include/asm/jump_label.h
index 29acfe3de3fa..3bdf0d834e8c 100644
--- a/arch/loongarch/include/asm/jump_label.h
+++ b/arch/loongarch/include/asm/jump_label.h
@@ -13,6 +13,7 @@
 
 #define JUMP_LABEL_NOP_SIZE	4
 
+/* Changes to this asm must be reflected in `rust/kernel/arch/loongarch/jump_label.rs` */
 #define JUMP_TABLE_ENTRY				\
 	 ".pushsection	__jump_table, \"aw\"	\n\t"	\
 	 ".align	3			\n\t"	\
diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
index 1c768d02bd0c..8ed63f588243 100644
--- a/arch/riscv/include/asm/jump_label.h
+++ b/arch/riscv/include/asm/jump_label.h
@@ -16,6 +16,7 @@
 
 #define JUMP_LABEL_NOP_SIZE 4
 
+/* Changes to this asm must be reflected in `rust/kernel/arch/riscv/jump_label.rs` */
 static __always_inline bool arch_static_branch(struct static_key * const key,
 					       const bool branch)
 {
diff --git a/arch/x86/include/asm/jump_label.h b/arch/x86/include/asm/jump_label.h
index cbbef32517f0..687fff131afe 100644
--- a/arch/x86/include/asm/jump_label.h
+++ b/arch/x86/include/asm/jump_label.h
@@ -12,6 +12,7 @@
 #include <linux/stringify.h>
 #include <linux/types.h>
 
+/* Changes to this asm must be reflected in `rust/kernel/arch/x86/jump_label.rs` */
 #define JUMP_TABLE_ENTRY				\
 	".pushsection __jump_table,  \"aw\" \n\t"	\
 	_ASM_ALIGN "\n\t"				\
diff --git a/rust/kernel/arch/arm64/jump_label.rs b/rust/kernel/arch/arm64/jump_label.rs
new file mode 100644
index 000000000000..5eede2245718
--- /dev/null
+++ b/rust/kernel/arch/arm64/jump_label.rs
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Arm64 Rust implementation of jump_label.h
+
+/// arm64 implementation of arch_static_branch
+#[macro_export]
+#[cfg(target_arch = "aarch64")]
+macro_rules! arch_static_branch {
+    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
+        core::arch::asm!(
+            r#"
+            1: nop
+
+            .pushsection __jump_table,  "aw"
+            .align 3
+            .long 1b - ., {0} - .
+            .quad {1} + {2} + {3} - .
+            .popsection
+            "#,
+            label {
+                break 'my_label true;
+            },
+            sym $key,
+            const ::core::mem::offset_of!($keytyp, $field),
+            const $crate::arch::bool_to_int($branch),
+        );
+
+        break 'my_label false;
+    }};
+}
+
+pub use arch_static_branch;
diff --git a/rust/kernel/arch/loongarch/jump_label.rs b/rust/kernel/arch/loongarch/jump_label.rs
new file mode 100644
index 000000000000..8d31318aeb11
--- /dev/null
+++ b/rust/kernel/arch/loongarch/jump_label.rs
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Loongarch Rust implementation of jump_label.h
+
+/// loongarch implementation of arch_static_branch
+#[doc(hidden)]
+#[macro_export]
+#[cfg(target_arch = "loongarch64")]
+macro_rules! arch_static_branch {
+    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
+        core::arch::asm!(
+            r#"
+            1: nop
+
+            .pushsection __jump_table,  "aw"
+            .align 3
+            .long 1b - ., {0} - .
+            .quad {1} + {2} + {3} - .
+            .popsection
+            "#,
+            label {
+                break 'my_label true;
+            },
+            sym $key,
+            const ::core::mem::offset_of!($keytyp, $field),
+            const $crate::arch::bool_to_int($branch),
+        );
+
+        break 'my_label false;
+    }};
+}
+
+pub use arch_static_branch;
diff --git a/rust/kernel/arch/mod.rs b/rust/kernel/arch/mod.rs
new file mode 100644
index 000000000000..14271d2530e9
--- /dev/null
+++ b/rust/kernel/arch/mod.rs
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Architecture specific code.
+
+#[cfg_attr(target_arch = "aarch64", path = "arm64")]
+#[cfg_attr(target_arch = "x86_64", path = "x86")]
+#[cfg_attr(target_arch = "loongarch64", path = "loongarch")]
+#[cfg_attr(target_arch = "riscv64", path = "riscv")]
+mod inner {
+    pub mod jump_label;
+}
+
+pub use self::inner::*;
+
+/// A helper used by inline assembly to pass a boolean to as a `const` parameter.
+///
+/// Using this function instead of a cast lets you assert that the input is a boolean, rather than
+/// some other type that can be cast to an integer.
+#[doc(hidden)]
+pub const fn bool_to_int(b: bool) -> i32 {
+    b as i32
+}
diff --git a/rust/kernel/arch/riscv/jump_label.rs b/rust/kernel/arch/riscv/jump_label.rs
new file mode 100644
index 000000000000..2672e0c6f033
--- /dev/null
+++ b/rust/kernel/arch/riscv/jump_label.rs
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! RiscV Rust implementation of jump_label.h
+
+/// riscv implementation of arch_static_branch
+#[macro_export]
+#[cfg(target_arch = "riscv64")]
+macro_rules! arch_static_branch {
+    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
+        core::arch::asm!(
+            r#"
+            .align  2
+            .option push
+            .option norelax
+            .option norvc
+            1: nop
+            .option pop
+            .pushsection __jump_table,  "aw"
+            .align 3
+            .long 1b - ., {0} - .
+            .dword {1} + {2} + {3} - .
+            .popsection
+            "#,
+            label {
+                break 'my_label true;
+            },
+            sym $key,
+            const ::core::mem::offset_of!($keytyp, $field),
+            const $crate::arch::bool_to_int($branch),
+        );
+
+        break 'my_label false;
+    }};
+}
+
+pub use arch_static_branch;
diff --git a/rust/kernel/arch/x86/jump_label.rs b/rust/kernel/arch/x86/jump_label.rs
new file mode 100644
index 000000000000..383bed273c50
--- /dev/null
+++ b/rust/kernel/arch/x86/jump_label.rs
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! X86 Rust implementation of jump_label.h
+
+/// x86 implementation of arch_static_branch
+#[macro_export]
+#[cfg(target_arch = "x86_64")]
+macro_rules! arch_static_branch {
+    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
+        core::arch::asm!(
+            r#"
+            1: .byte 0x0f,0x1f,0x44,0x00,0x00
+
+            .pushsection __jump_table,  "aw"
+            .balign 8
+            .long 1b - .
+            .long {0} - .
+            .quad {1} + {2} + {3} - .
+            .popsection
+            "#,
+            label {
+                break 'my_label true;
+            },
+            sym $key,
+            const ::core::mem::offset_of!($keytyp, $field),
+            const $crate::arch::bool_to_int($branch),
+        );
+
+        break 'my_label false;
+    }};
+}
+
+pub use arch_static_branch;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 274bdc1b0a82..da1f69868d0d 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -27,6 +27,7 @@
 extern crate self as kernel;
 
 pub mod alloc;
+pub mod arch;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
 mod build_assert;
@@ -44,6 +45,7 @@
 pub mod prelude;
 pub mod print;
 mod static_assert;
+pub mod static_key;
 #[doc(hidden)]
 pub mod std_vendor;
 pub mod str;
diff --git a/rust/kernel/static_key.rs b/rust/kernel/static_key.rs
new file mode 100644
index 000000000000..32cf027ef091
--- /dev/null
+++ b/rust/kernel/static_key.rs
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Logic for static keys.
+
+use crate::bindings::*;
+
+/// Branch based on a static key.
+///
+/// Takes three arguments:
+///
+/// * `key` - the path to the static variable containing the `static_key`.
+/// * `keytyp` - the type of `key`.
+/// * `field` - the name of the field of `key` that contains the `static_key`.
+#[macro_export]
+macro_rules! static_key_false {
+    ($key:path, $keytyp:ty, $field:ident) => {{
+        // Assert that `$key` has type `$keytyp` and that `$key.$field` has type `static_key`.
+        //
+        // SAFETY: We know that `$key` is a static because otherwise the inline assembly will not
+        // compile. The raw pointers created in this block are in-bounds of `$key`.
+        static _TY_ASSERT: () = unsafe {
+            let key: *const $keytyp = ::core::ptr::addr_of!($key);
+            let _: *const $crate::bindings::static_key = ::core::ptr::addr_of!((*key).$field);
+        };
+
+        $crate::arch::jump_label::arch_static_branch! { $key, $keytyp, $field, false }
+    }};
+}
+
+pub use static_key_false;
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index efacca63c897..60197c1c063f 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -263,7 +263,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 # Compile Rust sources (.rs)
 # ---------------------------------------------------------------------------
 
-rust_allowed_features := new_uninit
+rust_allowed_features := asm_const,asm_goto,new_uninit
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

-- 
2.46.0.rc2.264.g509ed76dc8-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
