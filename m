Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E8DD6B6A6
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 16:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hi8hUjDsblckbHYmz2dQQaNNtmPP/woKJ9r9mwMwxJ4=; b=Gh26sQbv724BlF69Z3DaoVVvC/
	Q7V17TW1V0KGIGRSC2Z1eBx2HKViv3zqnI6X3fjscbqN3JiX6EEW+o8zbGezMrtGg7Fgi0Conbo5o
	svMXK0643OZ/rdmEk/cj6CF5pr5Wh6vT7JIVWjTUtSzrrTyO3fuI1x461YahssEo4xkKA1NFyVZPN
	nA4EfYZItQjQWEe1U6MsiR4h2FcOYul4ib164XAu0PS5oqoJOmjQJncjd50gw3iCu2eGu8j4omqX/
	2dG34/ogc7HEc8uH3CQmGyXtBB2ADUXqBiaxanPfg9IlR3S2wJo395NWonjncMpZibv86iyyBMRjx
	IVkeLnJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BPx-000000013BE-2mLH;
	Wed, 30 Oct 2024 16:19:33 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BBs-000000010Jj-1akX
	for linux-riscv@lists.infradead.org;
	Wed, 30 Oct 2024 16:05:01 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4315544642eso48803205e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Oct 2024 09:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730304297; x=1730909097; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uZ5bBsDzzqub9ZaWqauRG4tAucTaa9wcfj1E33xP3xc=;
        b=KNB95wLedJtSaleL0yMxl0Ow+Gz8kZpaHx+/UDAJmYqF/wgGRcfcTW2/chN+DcdPqE
         Bmx8vl2fL2Sh+WjELgGC8KZlVQzpQj8pQjDNTvhWikFmxiWFaZ1gN1selKBib7UKSxbl
         VNsWNsjvt2Y9sc3BiEnhubz5DdHvh8KQLWcp92AODuOEdpLe+6HaUhYea1WR+Wgi1MjA
         dTWE9n4Qod9PEbTSYltGbmN96VvUvv6FaMPEsyVMRCyvtDsWDYPp8gdSi9ctHgOywye2
         3LPTZZSNsRrUJPap7tnwmEW9E4n8BB9qrS2H26hCm49NcsvnwkNKprJ7pUR3JwXo3zch
         tg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730304297; x=1730909097;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZ5bBsDzzqub9ZaWqauRG4tAucTaa9wcfj1E33xP3xc=;
        b=bCEHRtGbSf+5ItgFu4n1KsTMOrFFwhgW90t9elSUTF/Hg0c1vT/WA/8N0wnYwIE/49
         liSlppLWM0ef0VX7criDml5Hjbm0J6cNEufk099WzjWwx8QL1O1gSj0ylZFnwKYuVJE/
         4NlYpOAa+DxPE9Lv2syn5fZF0++JGKjPS7IEywZ8IqaSQjrpaeVGdqZzKdXxHgXFcEQQ
         CEVT0G8xKJL0u2SRFhONab2ttXrzpuSgb+3ovkXzaA8JhOOxFjfNrRGPwhfZ0rTLVPyO
         6V9aMHeKRd38rQgS1l3R+ru4TNGxgQi+z0NLNPq3dw6RbA7KLEvkG3wA0NTwTQHdKWI6
         98WA==
X-Forwarded-Encrypted: i=1; AJvYcCWVtt+jow06zuCH25c1Kra/Nt9mU5tCTIWZgsq38jzu2ofZuBV8MmwX7iBuIy1HqTbEmNNnpNJqmm/wOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgMidyyNcJwWNABTzz8Sx8FfAK6sdk3jzY2+iymlFmnvHSLMt/
	gXXpmVOsqNzau6ngbFYbtsPcv+yomuZZVkFMKIfPjvAzmwxTAbWyng2QzRia/hSi+gKudWd+9yv
	vCwYKYIc/3OLgIA==
X-Google-Smtp-Source: AGHT+IFVYJyJpHqXosREWKNk401dPodMtz/gzxt4mu2tfZOK6kHkRJP3u08JeJC4s0ELkJy7XaI8OGX/S3j3MuY=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:6a99:b0:431:4509:696a with SMTP
 id 5b1f17b1804b1-4327b6f8619mr645e9.2.1730304297194; Wed, 30 Oct 2024
 09:04:57 -0700 (PDT)
Date: Wed, 30 Oct 2024 16:04:24 +0000
In-Reply-To: <20241030-tracepoint-v12-0-eec7f0f8ad22@google.com>
Mime-Version: 1.0
References: <20241030-tracepoint-v12-0-eec7f0f8ad22@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3944; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=XID7x+7coWgnGBd5wIl/yqAS/1AzuHdHb0QK8txVMPI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnIlkhPSPbRePqgmcZkeV4PnRFaF06ORWPyb4Hd
 ZssKOLJjQqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZyJZIQAKCRAEWL7uWMY5
 RqSUD/9jfyehgB5qzKfR0aAlCXJYAKb9ZzLWaNn1EmqHjp8saPikwqUESI5omMnEt6W8h+4ok42
 pV4kX4p2S2qQqcKff9S5dttdXhdH2JZOmIXfwdu5yXJPN7oj5BpzCol3VvJux1Nx3JaScViKnG4
 4e0udKPwtlAyubQDD/+0Uk/9ayGweHYNvknT+8hoyjxsNDfCl5mTdR5pa3yXcSQMfXN4Ck+MOQh
 VD91Vo5mSBpn2DItkLSUPSKgIP9aK7q4yXIaKLf9WgPwcsdzNxuJ/Ak1+IWPdqzEjp0hiq67KkE
 hmiSAknb+A1aOfNv9gGpdRM+AuuoXsLOnhD5/yv+0utf5lP32ktyNBPq4IoJMANrT0kqkJ+nAIu
 gs5Eut6gmmuj9FgL+wjElrMboABY6QE/SENYeDZe4xLaDnxQKSqfvem36mOcMTP7j/02/GHoSYB
 RyLsXv/rPzX0s467Y++J+vePxJuIrQFgS8PVcnA/8dnKfeoU+kE4buLiFk6G/HoS4dxGyqiYbF3
 HMltLodkWAYZfs+nfTY3uUa5C7nDIZ+/QXJMyQ2VmpXgulpY7tPclpC1MxbFNAiPxW9jO1qVqOS
 GF2ERKm5fU5AwBn6KmQYgLsii6hIO/c+lfx1ndbl1K1zCZ0cC906aD5HA9HZrjMJ1EsMzzSVauC RVr59LvwW7YPQNA==
X-Mailer: b4 0.13.0
Message-ID: <20241030-tracepoint-v12-1-eec7f0f8ad22@google.com>
Subject: [PATCH v12 1/5] rust: add static_branch_unlikely for static_key_false
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
X-CRM114-CacheID: sfid-20241030_090500_446966_036D5C60 
X-CRM114-Status: GOOD (  19.80  )
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
2.47.0.163.g1226f6d8fa-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
