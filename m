Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC0DD216A2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 13:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SpJJ3F6MFZtZMv00N13r/q9bTKzJ8NwDFRmeWxsuOVk=; b=v3rJqc2PcAL2Ri7UCzOXLS6CMO
	RyRukfx9qS9CDKm7NANHsdj3SeMue3xdblHhFz/zzHb6tgCFob2fROak9zeYFM/wm0IaYctm+jH++
	rbMbtMbFHJhEA4L88i96tBr2uC91tnZgLNuhLGwiDynTkuvReg8UdK2PeGXK9vMc/vKgUJwpcMh7u
	wU8CBBPkkZQFdDXw60iA03tGqF1SETSSwvV3VDCkXjmgbeC9tjeVX1PHiwb29xD+BX5c1tJxbbccw
	SygKE+SOUvfI6IUl+zJI5cjYu3w4yYGJtukUSim10iBGj1qAsoYH+d7Szw9W3MVu/ils7ydRoJo0C
	Iv4aWfWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0hQ7-00000008JXy-0tc1;
	Tue, 15 Oct 2024 13:17:03 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0hOb-00000008It9-20hu
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 13:15:31 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e3705b2883so36808377b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 06:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728998126; x=1729602926; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u88YC+HCUxUWsmDhhJzv+FDTM9B6f4PIf50qF6/YsME=;
        b=fpbSLd2uiwgqM5AIDXrfsep/ggg+wzrHOZ7dzlrcJHDCe/X/dzvCo2FLK081LWMgfR
         FJ/1krA0sqkmzGSWWCkt2VA+nMXLc404dl98FSLRXQbHELPWGh1ou43oSonDsPaBwRes
         CkBICFyWAcgXkEVn3qyaeWmcvJXp0DIrzMyhA7+gOWjocAyRp6zOn7JFhHUUCWa4vrUh
         9hUi2XnBSJl6GWtbg+a8w6ABxDYCImSGiPd3KCOJeQFYjBMDMPI08Cgpeavwx1JiocGq
         h5nFhEPo3VxH9gUuRpO2c52EGpLEADqj5jSfaB9I+GHL7pv8WZSzMkzzB4OjDoidq4Y4
         UDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728998126; x=1729602926;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u88YC+HCUxUWsmDhhJzv+FDTM9B6f4PIf50qF6/YsME=;
        b=SMiLGBxPKkTglY6uAWAE3fuCfV4zn0mU3jAvQ3YsM+5SI4wba83DAqR7naBbCDQO1F
         aVMaEwI9lItZLUcpM6T12jLiNVrcd6F+qqqEw3KvoK64EpIvRXQQv6frfkmix2klCS1P
         khq6qPIbsl65l+4zV8eFH0bk2Oiua/CM/VNo6N9awN7NagUe6rYuPqhOALIPuEXsTSgd
         FIpJgNpgqeSjSPSW5G9LEB665w5fe40K8x4cCAIKtuITIdEmESaHQhsjlqz6nL398qcy
         fYV/gHGKB4fOPtcEHGJSQy0Dcp6MUm2hmpmF1+LGKPR8sRHCbk0ouz9D1nqFAbxeJFe6
         I27w==
X-Forwarded-Encrypted: i=1; AJvYcCXfDV0392SUfWV6mUJgG74//KQ9pStwrnP0Kd0y90EUjE90ravoSlxLfGMiStrYYXWkyitDKSoqcyvukw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCsXhJFEVKRSVwKebJDqAN8yXb9w2vVaFmUL/5QI4vPq254xMK
	DPjTdy6H1u/EcQmfiNLgi39+EXtauI4bJuscDywtAM8SypP8tI0iAxj/g4acB3g1jJECv8QUlxC
	7eqt64QFTiKM5hw==
X-Google-Smtp-Source: AGHT+IE4zub7wJu93X96Jlwuq2gB7BqQ9VZQMzbObcPdfJYRyYWGnR7sC3n9RszpByxiydfMX++uZvml6S+7iH0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:4447:b0:6e3:189a:ad66 with SMTP
 id 00721157ae682-6e3d41c59camr45117b3.5.1728998126076; Tue, 15 Oct 2024
 06:15:26 -0700 (PDT)
Date: Tue, 15 Oct 2024 13:14:55 +0000
In-Reply-To: <20241015-tracepoint-v11-0-cceb65820089@google.com>
Mime-Version: 1.0
References: <20241015-tracepoint-v11-0-cceb65820089@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3948; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=WmlS9ruybdrhRlaID/2lHfheMmCjKvPhIBuh/AhhcO0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnDmrmE/iEkUSJVfKvPvKYIgmZrgzDGpoY3SBMI
 +DDHm4J4paJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZw5q5gAKCRAEWL7uWMY5
 Ru07D/90RnN4RcIrVzabl6QI81OsSJoCo6zq7NOIuJ+OciuqqlV90O//XrOJs+KsGYD+LZYM86w
 qEvM3RrHzXGhhMH4gcgfyg+kElp+aETc7eOLVfkWKqrRY3B2zCbjXrpwL7hHkyk0zPChq26bRtj
 BCCrpflbMr6ik0H++KIv8chFwz7XCwhnKmg4kaxAa+f1gHFcreTKCeIDC5mntcjL7iqpFJKPKpo
 JhPRylwhU4wEypAteXU6LGBEX7qQu1GoOS4YE8jA5sM9JPv4e83oUW0Q8BPjjLNzp2gB2+mgB5z
 F/Mw6u5XJmGDv87TVRfMD9Upr7U4G37rIYzTLYfwmRiD8IjjR0STuik1BWICYqlyWoi7a16iKZa
 jKtwKNI2hVGut0P4LjnQyqwVOqDRoFavLMuVyvPOhc6K0xpJl5ZRYMPIoPNuqSDKD0ObE7gQzKf
 Ly67ib70h3KKZrctRwAIcJn3u7Os6i15dEUCs5hXQeOZQOEjUrcswKFaSKLHy7Tj07jVauXV9kG
 lrujRTXo1UTGQaNnzAWcEk4PdbwgbbISpoX4ryPEgSe377NXOPIxEGed35rpdLwxAZ7BiQNa+36
 O6HABmLzc8XIvLWJoiIXrF3lvjIrrh+Xt/VgOkz0y+tKcFeeSDGLmS96O483iooq9sV3TqcTOcC ev/Y1GyjFnqcc1Q==
X-Mailer: b4 0.13.0
Message-ID: <20241015-tracepoint-v11-1-cceb65820089@google.com>
Subject: [PATCH v11 1/5] rust: add static_branch_unlikely for static_key_false
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
X-CRM114-CacheID: sfid-20241015_061529_618130_C3BC5936 
X-CRM114-Status: GOOD (  19.99  )
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
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/helpers.c          |  1 +
 rust/helpers/jump_label.c       | 14 ++++++++++++++
 rust/kernel/jump_label.rs       | 30 ++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 5 files changed, 47 insertions(+)

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
index 000000000000..fc1f1e0df08e
--- /dev/null
+++ b/rust/helpers/jump_label.c
@@ -0,0 +1,14 @@
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
