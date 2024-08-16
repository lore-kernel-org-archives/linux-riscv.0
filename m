Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B48C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 11:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iHiOuWi1LCrCLlIWs39Rsb1iRox5iY606vEU71zx5po=; b=mjYWU+z7eBLVIFqkPcCDZhaorq
	LC7GpnkNBG+faPPOVsNtcMC9h+TZ7UvurHVu717UZTeF7YXhbmhJ5xRGZJQaKc9jBMjbC7KmaySdn
	e4esE02Skv3x8EaJrhTh4+8e74V4fFr5cO00G+TJEGV0WNvNqeMzrdN92OLr5zIyGB+XuLfxc25bo
	rIDqbE1Eo3FZuQWAvosqqcZp2kPzkgVI3OJuWrUq7td08VAmwfEg9IT5Cg7oa02CnbJBkDH/aveXB
	l2fjRrQyCt9Wd0sD6XnSZqklUmKkcYFDAZlXdcWghICWyBHFNgzm7wmEQJFRVbeqwJ+bmYEtAOHe8
	492n5NgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seuon-0000000ChRR-2GrN;
	Fri, 16 Aug 2024 11:08:29 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seuoh-0000000ChMy-3o1P
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 11:08:25 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-42809eb7b99so10391625e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 04:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723806501; x=1724411301; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m06R8rBHhIV+fNfH7++C5Q7rVR6HteIR9+x3IVgvVo0=;
        b=cF5+ZT3lKR3VTNs8fAfUhRYY+amYJ+jvS+TsXhWS3MH+aFhP94lZEmlikagxundKxC
         LtrtqJ7V49CeJ3AFWgoFLBKuOrQor/DpVofZkFFE/ozc9EGklFRUJ6SIjloQeLoklxvm
         LxXJ3E+/QXAyQBe6I+B2nIk7scqh8tbLAoeHSEI7E1QVFUjwZdHTD1PXgNjv3z5joMJ8
         v6EhEtgfH6cc4PyftPct5BcjQaQyPVepiQ2oAIT+60zpugtaTgUfD/3kRRWY7/1rNwXf
         oa3ZZyyW81n6/0WMGi0AbYnAyCUmvlFnp4CbhcjmrV00qUqUITxyEsRZKRGockd5q9W8
         fjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723806501; x=1724411301;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m06R8rBHhIV+fNfH7++C5Q7rVR6HteIR9+x3IVgvVo0=;
        b=DjJqStg1B5jQk0pl+kdvZaaAKk7fJUDFsf5/p7LbR7jTDf5l33wCTuzOH8FBu52WUU
         A0XRT74tR/bnhvY7GoPtcnT5mYqV8sOvfudlCLChUscDNWYKuug6T6AOmrpPDPbW08A0
         340QZ4q1UOuU7W+crxi3/QusNfc7UJfgmqk13ZIgEaJ4e7kGLEu8pI52roK/dUR6uwOB
         3sJIP0XZYIu2/71Q6vLTxGwruRWPR0UCst1c08bnse4HHr+SMOHzPaZF8vx9Yeh4iYvW
         g7NYpD8lENTgPyl9qPtOKuzB+KJjQVmOjm5BHXszq/5+Auu7qGZpzfj/ZXOMZJ9ijCuB
         Xdwg==
X-Forwarded-Encrypted: i=1; AJvYcCXIQhwJXIZiQO0GZvdLrZo0qdxKcQTq9vhkXRlnj+P3+M9vgeIF0LsEZtl8hhL0OSNCVbGh1RZ2yoLIIKdVljdWDHMvppK0vI/vVLYl04AV
X-Gm-Message-State: AOJu0YxgR6cJeT9WJ+UXk+cHTtYf8P3BB8Jsnme6c6ZJRnV0fqItrkxT
	A2F756ny1sGyuYgqdTb1IKGAf0cYnCiHrbQPaPN/nNthrvuHoDfNgTUCkOnt35cw9RVTaYmCphh
	y/SrnDmh4h3M6Kw==
X-Google-Smtp-Source: AGHT+IH+VAsKwfNCiHHe99AmivtojPl8jd65icHQdCeMvqDYGyRGiGAODBeHQJKgR08V8df12KeTAxMnbdJAq0U=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:4798:b0:429:c788:c218 with SMTP
 id 5b1f17b1804b1-429e23a6fdbmr962585e9.2.1723806500805; Fri, 16 Aug 2024
 04:08:20 -0700 (PDT)
Date: Fri, 16 Aug 2024 11:07:38 +0000
In-Reply-To: <20240816-tracepoint-v7-0-d609b916b819@google.com>
Mime-Version: 1.0
References: <20240816-tracepoint-v7-0-d609b916b819@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3678; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=x4Fj8n509ULmZ45N1WACwPWEQuAc2oLxAGwmKjHodr0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmvzMdVneCXly8cWWe5Iu4uc6nbYralCN4y+TmV
 wOYf3kDVPyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZr8zHQAKCRAEWL7uWMY5
 Ri7iD/9j1byicYermmm/i5dPcFPGgulMHHWVSSxshMFGTPr69xesZ5H+/l90d3CEP5L9ih8x7ht
 QrRslTqFF8Yp9ivd8uuelOk1xaXEFPw8P5vRGIUU9b4I4WMxlcb9g7ckF8zrV1qdeFG1PZqDxsZ
 xf1pWqvqszr401XhR+fj7kNQVKbyFT0uPFGKXT3Sb9yrKuFQ5X/hMCfqLBrVhD29P8iiuEQoj62
 Okn2MG+8n0fmnixuWv0j/lp/bG/b3vBJNckorv3W41tf3YW4Sj0kLi2Idk95pBqhlIYisy+dRKb
 MOc2IfnPfQElbeKsEDjMpHy0oQY7LRmRHYv9dX9RsRfQsymv6hB/b9lfSF9M5MTn4jLFWTOQRBQ
 /k+2/1Nqk8i+cA5WE5loHeBrozeYvSmBfJATXTrTjh6yj/dVhAs4nZeqcn6hfSOux836gJFmke6
 Ahf59c/QmBydmV3fW9FO9HENgUanrfI0q3OCvmvwtDyHjA+ZZHCcpN7ZZGOkkPLIty1bxlL2P3W
 8xKYvJqNhw8XQdYqohiOX5Y62t/TPJ+aev1v9H3X1cbjvpKylN1KIjeIwoeRJZEdKSGV2ODqCWs
 RY8tY+QqDcfw9StVvP3jwp5XFJ2EYVh48XZ+qL8U8sgg7kYI0soQk/bI+WslYVmSP2/0f7BRhDZ NICGotH/M88i+uA==
X-Mailer: b4 0.13.0
Message-ID: <20240816-tracepoint-v7-1-d609b916b819@google.com>
Subject: [PATCH v7 1/5] rust: add generic static_key_false
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
	Alice Ryhl <aliceryhl@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_040824_077289_CD70A30A 
X-CRM114-Status: GOOD (  19.63  )
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

This patch only provides a generic implementation without code patching
(matching the one used when CONFIG_JUMP_LABEL is disabled). Later
patches add support for inline asm implementations that use runtime
patching.

When CONFIG_JUMP_LABEL is unset, `static_key_count` is a static inline
function, so a Rust helper is defined for `static_key_count` in this
case. If Rust is compiled with LTO, this call should get inlined. The
helper can be eliminated once we have the necessary inline asm to make
atomic operations from Rust.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers.c                  |  9 +++++++++
 rust/kernel/jump_label.rs       | 29 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 4 files changed, 40 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index b940a5777330..8fd092e1b809 100644
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
diff --git a/rust/helpers.c b/rust/helpers.c
index 92d3c03ae1bd..5a9bf5209cd8 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -28,6 +28,7 @@
 #include <linux/errname.h>
 #include <linux/gfp.h>
 #include <linux/highmem.h>
+#include <linux/jump_label.h>
 #include <linux/mutex.h>
 #include <linux/refcount.h>
 #include <linux/sched/signal.h>
@@ -133,6 +134,14 @@ bool rust_helper_refcount_dec_and_test(refcount_t *r)
 }
 EXPORT_SYMBOL_GPL(rust_helper_refcount_dec_and_test);
 
+#ifndef CONFIG_JUMP_LABEL
+int rust_helper_static_key_count(struct static_key *key)
+{
+	return static_key_count(key);
+}
+EXPORT_SYMBOL_GPL(rust_helper_static_key_count);
+#endif
+
 __force void *rust_helper_ERR_PTR(long err)
 {
 	return ERR_PTR(err);
diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
new file mode 100644
index 000000000000..011e1fc1d19a
--- /dev/null
+++ b/rust/kernel/jump_label.rs
@@ -0,0 +1,29 @@
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
+macro_rules! static_key_false {
+    ($key:path, $keytyp:ty, $field:ident) => {{
+        let _key: *const $keytyp = ::core::ptr::addr_of!($key);
+        let _key: *const $crate::bindings::static_key = ::core::ptr::addr_of!((*_key).$field);
+
+        $crate::bindings::static_key_count(_key.cast_mut()) > 0
+    }};
+}
+pub use static_key_false;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 274bdc1b0a82..91af9f75d121 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -36,6 +36,7 @@
 pub mod firmware;
 pub mod init;
 pub mod ioctl;
+pub mod jump_label;
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
 #[cfg(CONFIG_NET)]

-- 
2.46.0.184.g6999bdac58-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
