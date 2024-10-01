Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67362CF64BE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/QhFpyXw4R9Ma6MfktxU+tZgQEn5gDqR8ZoRW1oY5e0=; b=VRWuTZukt79w8VTXTNu1ujzIz5
	HXc0SDMwz6vD6l2XJ5Pzzci19kCuHImvSsjRlcLH3I57esakFDqn4boE5VGiB/LKnQ0KIUf5aTd/h
	VdQItdPQ8HQ5TSfXNdBl0cbarFxRpPY1QJq4VRkgMsfWNkMI15BWa0Hm+CtNphOpwZ9j9k45nrV0U
	ny/s8pGmn6x0RdJXcqCUpIzTMOjKumyS/XRDsEk3puNp5Ui3W1+fzOvdtYIdCjkINQWpJakXjM8VR
	8NPXhIMMlu/U2lQDKnRZSAwfuCyxZK0SC5hhGPvQkuggocBr/Y1cfDkwKtlYkmSVndBPAs3xWQogS
	Bu3cIAHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svcxY-00000002wOy-0Obo;
	Tue, 01 Oct 2024 13:30:36 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svcxW-00000002wNh-0yu4
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 13:30:35 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-37ce6262705so895603f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 06:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727789432; x=1728394232; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6NcH/txgm4SoZvRl8jrqK6AfP/r/sFmOakhN5fEYqYs=;
        b=aSY0CXQUKAP5uBK2/9RCL4P0KOSq9K9F6yiXUW3OTD02v+iaHMagEcsoWv1a13UqCW
         9LgMTVgMSAYD52aHMZQQ66vdBc4WEtmKNFV4Zup0WTiGPNa/RdLRn5gxIbU0TKpQllUU
         ccetTAuGpeu3hfTOcce+ZWewMzXi4adw3oHMq8H7hIsuEqYbvCbzlspHHvjnxvaVOro5
         gKDW+nqYvnzLemPGMXw+6+3UMYRJ0HaZKBXnCVZvP5+aBS5VPyitnjcW5l8WKjxFB30G
         RXLEuWzyZgrJdPgcZ0VD4ic5bP5Xoc8vEpBV/Zho1FlrnFF92qJJ6bYGyAesjvj/LMwC
         Bo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727789432; x=1728394232;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6NcH/txgm4SoZvRl8jrqK6AfP/r/sFmOakhN5fEYqYs=;
        b=Enu+hzwznusWKFl1p3JKrCv/ASFf4XEqF5H1rv/Hsf8ouS660tAcZZTyrAZu2WPMEh
         roNNjxKyJx8Re0i/D74PwEpymdQAVs+3S8Vavq3/61WcDer4Zp9vcHWs/p1ZGOz5Gf4d
         UoGzK8rHmloN8g358NhWI3TYnbNM4xD3pXfbQk46JQbUXZWwrM6BLEFyKqb0KPkRMYPD
         vCON9UCM+AAqumvSYmrJ6YB8WmMokgBpUKazMXoCcfsxz6oPTJwTeWot3cln9HfXofNa
         /y06DNEFe+/TvZXkSh6EBXAWJsJKGcFzmbj7YWN/WWrs/6fEX/v+IvzQ5Yg3pDFcQ5vO
         H2oQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/l4a9riLpcUAzZsGm5ZOOJ2IQTxSGhxQ414pA/LLcXxRWX8PMoV/+UPWeUbgZM7Sbc13kWLPQXko9aA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxP7w4JPvNY0CiSy0T+sqkJe0AxCS7HaWktsboWqVIPh0e+Tz4W
	PUuCvyC6DgQuq2FghSSl/kPW4AGtSx32OnMjI+vqsLuuNSuk7S/9SjzsKMzNaKNtWi9IKIezVIe
	NPYrwhgWlODzQ/Q==
X-Google-Smtp-Source: AGHT+IHEHR04HLA0/xTKtqy65DSu4rhuHv96KunVk64O/ZW/4J8kBgg9MneRCFsC6zfzdrsaOIeGwwArA+9MwtA=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:6000:e48:b0:37c:d2ed:c51a with SMTP
 id ffacd0b85a97d-37cd5a9ee86mr8842f8f.5.1727789432081; Tue, 01 Oct 2024
 06:30:32 -0700 (PDT)
Date: Tue, 01 Oct 2024 13:29:58 +0000
In-Reply-To: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
Mime-Version: 1.0
References: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3861; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=AvPTYbgUDavV8mVnKHm16jwbLov+IgYYrRjsKEF8/Ko=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBm+/lwNcJAULBaBeL+Dr8YX6BXARPW8IdrfPDru
 oHV4BLfmr6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZvv5cAAKCRAEWL7uWMY5
 RrXoD/46qHxmQQefR6J6dxs+nMxE/PeCwUzN+iBASNF6GRFzW+qtSy6GbpoUkBk6lPtMPXIZ21+
 7vYAkFVr51pxI/ktD9Q/9G8vTic38vSwXmAw135cEzOw4quHQWf1CcMO8iaNvtmYwwX23i4p90K
 7b++yxkkUjapjpbwOMqLk33VOnYXWilNEXsK2owifqR8LngjI5Ybp5rmPx/JbOJaPnog5WGamGz
 8vcavGHdPBhs6IxJdmWGacvrmJWdrBe5a5mHtnKnPoAcwtrkGjh1K1xeimz2ARL5bdIUaNTFQeU
 g33eq/B1bfg9vw3Tn/JLEheM10xngvB1fCfiAFRbRISYHdwywqjZSpz4/RrFVCfMWajI+c0aQ2X
 Nv1IdKug4kbpyOdrRJs4ZX4KQTVfK3c/ERGMvUmb1BLYpmyyWV+pgrLZ3g5oxw8tEqL41msxdRn
 rvgFmIp86sYIGFicKbcfzS7pD7DlCREeL00e4mGdetCl2lTUHy31MDOkBY13fi5Yx+G9W9IHdBW
 OsRW4Tt7wHJlIO8mhtb/JxNTSXdLw5OlZSjC4Vvil4u101yVHeMAtrjGcr99GphInredXfMWI6V
 WCfcFx7E6cIEpP3GMqvqRWlpH4etvET/oIetiWYjQgwYiKCZl6i0zVMvIZnp49cR9RiKj+ft9Vq XJjgUh3pWF492BQ==
X-Mailer: b4 0.13.0
Message-ID: <20241001-tracepoint-v9-1-1ad3b7d78acb@google.com>
Subject: [PATCH v9 1/5] rust: add generic static_key_false
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
X-CRM114-CacheID: sfid-20241001_063034_305526_220ED7CF 
X-CRM114-Status: GOOD (  20.09  )
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

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/helpers.c          |  1 +
 rust/helpers/jump_label.c       | 15 +++++++++++++++
 rust/kernel/jump_label.rs       | 29 +++++++++++++++++++++++++++++
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
index 000000000000..0e9ed15903f6
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
+       return static_key_count(key);
+}
+EXPORT_SYMBOL_GPL(rust_helper_static_key_count);
+#endif
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
index 22a3bfa5a9e9..6dfafa69a84e 100644
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
2.46.1.824.gd892dcdcdd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
