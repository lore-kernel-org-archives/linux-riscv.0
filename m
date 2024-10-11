Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB70DCFD316
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 10:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2TbCVOIw4jBCKGVVO9l5MMCSfWvXnVPoJrOplKCu/u0=; b=i3c9hm81qBx/kzLE9lSdHQ4oN6
	JvapxaWrVVbOjgCm0LL6/pVcbJVoPSWFQo9JxMwggPb+IbSMaroKAkwGOI3kJ5dLbP1TwpM23QtH7
	nZcaJ/m2FK0dHZ0wmPtbjlpI7mbLlEMk1W9k7POyKghC7byHsS6yyoM4v8qE/MS8H2XxDi/fW+gzT
	MR5qqioktZMfchX0YII2yCgTyOmj/UVsEt+K39dK6IAUKXkhtaK5NQgwYejeUwedsNHxASjV9hndC
	eqXQnw+GEvN775Ijst6uocy0pE1u4aFvxzL/rj2AMbpW44g4yOa1MoQKW8bbgO6po2sKl4KmAIrmW
	35rF7gfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szCf6-0000000Fvpl-3GwD;
	Fri, 11 Oct 2024 10:14:20 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szCf2-0000000FvmW-1yUd
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 10:14:19 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e347b1e29dso7087247b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 03:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728641655; x=1729246455; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jFE2ikPp0UZhCPNVJ2m/j/nsy90Mrtse7k8dbsw5+Gg=;
        b=ICG95pRnvJrPwrhUT8tbuGLN5fnXOEC0E40cgqvn30xsTKd4DAAkA+7zahTsWKEtwz
         Zr86LBALy9WcL+g6NNzbhIaqNvtf4PZRwY8qvjlbzwSegSNK9dDrKLpTX3jtx7pwYlXd
         1hA1do5U1E9XWUCLYu0CRQMkLa1ka9emEzX+5K+oPiCTzzI+ieXr7UFbS7hOuzxllWTN
         1HJD5IC/t1XXNqh9v4OERd/5FWt74J9PQSnANw5oUQXYyDr3mWk/VaaS84QtrJTaiD4d
         iO0rD0gIyuPmOFPxRYlDt2vDC+hPO8q2BMVQ2ZTvRcSmzW+Iw3j9dyY3dWU+AhDdEpNX
         Rn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728641655; x=1729246455;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jFE2ikPp0UZhCPNVJ2m/j/nsy90Mrtse7k8dbsw5+Gg=;
        b=eAZA4RH6/xbzxVvoXmBk3mXLwVSnhOB6Aq5hucnPC8IJJwy+cOrqkgXZYNbIuTBHw0
         XsGFj9QDUYqN/Fs4lU33JW/3scxDTb+KMEo6yqfNxQ9ijNR/2iKJFAne/YtOfjB1ysiN
         eyrnK2qgWCgt7eYeuiu0VtYcqnW5JMljh8LALj1t67xGPvSNb7ZBL5epHOCcsy3I6Ijl
         9tiAf0mDnbVCrCz5zHFDzIp1rNc5mkTbQS4zUx8Et0vIDuQOiC60ZkQs41fib2CXXeEd
         pOmimvd155gARumIiaVQLQ335tLMaQfoIf8eIsV860Vl1+QKRmOR2HbGoNfQoD0zvMXU
         P0cA==
X-Forwarded-Encrypted: i=1; AJvYcCXCFskRyVUR8SNDqCuSaFLJtXBdb5PDQS8XDj5Yh2aXL641gVfei4FF9GvKedEUHolNPMEWBFS19JSC5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoKGlrxzcsCA/bNSpXqf7DCs4N5Hn+nLGBuUz/8YeqdvlUjKWk
	T6x6r2VN5tlWUEAkRrnamJHMKvUFUNbiYtZC8mRdycyLjR3QmER0+z6DmF218EsdQpG0og96fsV
	ilY+vXaZe8l4ZgA==
X-Google-Smtp-Source: AGHT+IGpfJF0B5G/uIllp7xlp0AhMjEVDfZqgoGdnuBNXxme/+AG4H/P90AhJ2bPoNxKyzEqiqWw3jG98G1uYSk=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:670e:b0:6e3:19d7:382a with SMTP
 id 00721157ae682-6e3477c0764mr340997b3.1.1728641654667; Fri, 11 Oct 2024
 03:14:14 -0700 (PDT)
Date: Fri, 11 Oct 2024 10:13:34 +0000
In-Reply-To: <20241011-tracepoint-v10-0-7fbde4d6b525@google.com>
Mime-Version: 1.0
References: <20241011-tracepoint-v10-0-7fbde4d6b525@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3958; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=InIXqZbQ2UsIGkgB988EIK/mKm3HwkMiS/ZXhKi30VE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnCPpuj5sSq3+OB11ESiA6TUOR98xUjIx+kmVLm
 B2utekqr/GJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZwj6bgAKCRAEWL7uWMY5
 RqFuEACdRrTaSJ20ihG7QEIJoAxYLsT0g7NRrZJBoI6+1kRpkqFjVd8FE/gmwLxtsVfs8EkEKMp
 +IQgvMZL9CYOt4nTM2L+RUdyXtQOXWA/StEbEOLdoLLy+E6pdfIAk+7wg4BMX7XiNQ+DIJUWxyo
 OYGqW9Qjp6ba19Fgq+BPF4HIg2Pgrp31bQlUP+BpXxUWAJHdxyawZBXMDl/7/M9i+rzVq/tCGfD
 AUhIK7TOfwDe+yQbhAXA3Ksog3f2zZzoLhdBa/Qp0ik7mWePSuHa7JBRJfglFKZ8zd1qEzSdYPn
 mE3EcEiQc0uPeLjYY52A08yaf33FumomjTZXy4BxrtY5YRY+ct+4uKkLTodMnemoaSYascB4OlU
 kylUY3ZF/NxWi5PdfXLkgxTTnB6pRzWrY4K8IxTP7MLYcm+VZdLbz64YitvhDTGlq85VazXRmgj
 wsqWu5Ga51BMrDK5pISfzXczrJ81IGd/HbIh3uUU9WBs16Gw2PP41Xb0IlZKl4whWo6duj/Tm6Z
 yZsABEXNs3ZNz3lKSjboZNHHQU7nvuvm7UE+kTpEM47V4n3FVUDkY5ySlkxlLRw8Jxj7YzCL0Xh
 ySfDcoNn0fbubMA68pyNfeGr6u3fTv++KxbzqBHKRlxGd5qq+MzGlVd5wUTZDjV0sbt9/gHBa3L hbS//5X0LNyiXhA==
X-Mailer: b4 0.13.0
Message-ID: <20241011-tracepoint-v10-1-7fbde4d6b525@google.com>
Subject: [PATCH v10 1/5] rust: add static_branch_unlikely for static_key_false
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
X-CRM114-CacheID: sfid-20241011_031416_608200_1172733C 
X-CRM114-Status: GOOD (  18.71  )
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
tracepoints. Tracepoints rely on `static_branch_unlikely` with a `struct
static_key_false`, so we add the same functionality to Rust.

This patch only provides a generic implementation without code patching
(matching the one used when CONFIG_JUMP_LABEL is disabled). Later
patches add support for inline asm implementations that use runtime
patching.

When CONFIG_JUMP_LABEL is unset, `static_key_count` is a static inline
function, so a Rust helper is defined for `static_key_count` in this
case. If Rust is compiled with LTO, this call should get inlined. The
helper can be eliminated once we have the necessary inline asm to make
atomic operations from Rust.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/helpers.c          |  1 +
 rust/helpers/jump_label.c       | 15 +++++++++++++++
 rust/kernel/jump_label.rs       | 30 ++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 5 files changed, 48 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ae82e9c941af..e0846e7e93e6 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -14,6 +14,7 @@
 #include <linux/ethtool.h>
 #include <linux/firmware.h>
 #include <linux/jiffies.h>
+#include <linux/jump_label.h>
 #include <linux/mdio.h>
 #include <linux/phy.h>
 #include <linux/refcount.h>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 30f40149f3a9..17e1b60d178f 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -12,6 +12,7 @@
 #include "build_assert.c"
 #include "build_bug.c"
 #include "err.c"
+#include "jump_label.c"
 #include "kunit.c"
 #include "mutex.c"
 #include "page.c"
diff --git a/rust/helpers/jump_label.c b/rust/helpers/jump_label.c
new file mode 100644
index 000000000000..6948cae5738f
--- /dev/null
+++ b/rust/helpers/jump_label.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (C) 2024 Google LLC.
+ */
+
+#include <linux/jump_label.h>
+
+#ifndef CONFIG_JUMP_LABEL
+int rust_helper_static_key_count(struct static_key *key)
+{
+	return static_key_count(key);
+}
+EXPORT_SYMBOL_GPL(rust_helper_static_key_count);
+#endif
diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
new file mode 100644
index 000000000000..4b7655b2a022
--- /dev/null
+++ b/rust/kernel/jump_label.rs
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Logic for static keys.
+//!
+//! C header: [`include/linux/jump_label.h`](srctree/include/linux/jump_label.h).
+
+/// Branch based on a static key.
+///
+/// Takes three arguments:
+///
+/// * `key` - the path to the static variable containing the `static_key`.
+/// * `keytyp` - the type of `key`.
+/// * `field` - the name of the field of `key` that contains the `static_key`.
+///
+/// # Safety
+///
+/// The macro must be used with a real static key defined by C.
+#[macro_export]
+macro_rules! static_branch_unlikely {
+    ($key:path, $keytyp:ty, $field:ident) => {{
+        let _key: *const $keytyp = ::core::ptr::addr_of!($key);
+        let _key: *const $crate::bindings::static_key_false = ::core::ptr::addr_of!((*_key).$field);
+        let _key: *const $crate::bindings::static_key = _key.cast();
+
+        $crate::bindings::static_key_count(_key.cast_mut()) > 0
+    }};
+}
+pub use static_branch_unlikely;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index b5f4b3ce6b48..708ff817ccc3 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -36,6 +36,7 @@
 pub mod firmware;
 pub mod init;
 pub mod ioctl;
+pub mod jump_label;
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
 pub mod list;

-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
