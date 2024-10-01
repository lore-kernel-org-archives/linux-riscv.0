Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0898ACF64BE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 13:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eNm+N3SMGh9JTBn145rB8eL+W7pS9ghCEeF/Zz5ZTnc=; b=a/f5tHFQgQ5UYC7+FICFtKcr34
	wuaBvJi3kzx5k8N1C5wZKuSeSBIGZPow/8/SaXCoViFJkK7vmGohhA4SMOgZ5Vzb8+3a7xvhan4a8
	gMWqqN1iE6mk3JCdkUB3o8KoPOUUZoewNAIVA4fQzT/mm+BQUIHvEw+hh3/jwn3aTcKz5W9Vhg+OV
	IZpdl9CwpOaML3mD33ENKecZA4ghMxza8QE7qUduai+N7IoS22mcbXHzrbpQPSb0+xPEoV0+kWZK4
	Ivh9ooYEQ/qjeApjGw8I3BKFGUosIKLiZzF8I7AIUtFQKTC7iAmmNbqeps38a5x8UXohg6wK4+v++
	bNfRWUIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svcxg-00000002wV6-2J6s;
	Tue, 01 Oct 2024 13:30:44 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svcxc-00000002wRK-2uRU
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 13:30:43 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e0b3d35ccfbso7489704276.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 06:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727789438; x=1728394238; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uK9Ua6p4XY0W7oFZP1bhbr5r14FIpD3VJc8sLYS+srQ=;
        b=lyZ/3LyyDH/vWKrssW1AO8nkCVnHfQyvevYcZB+nnPEjvD9bMJht4E9YNYWus30o/u
         L4vJczrOZxyIJZJg+FjxUPCXEKLOUUCl5yn6dIwRNlNKUd/wGXdBzuMQh3JhtyIIxzWi
         oJ7907cc7s43zCIvTOVXzoxnhSrsLJ3vdbLWRicDBK7s0WeAPU8OE+8jVHczz0lm56t6
         F9xLpZ75kO8ZU0i9TrzgVg9KFI94zHSZrG9kT/vYRyVSk7P9ximuM8guFa7casc7t3dv
         cjDDxtpgACXynJJRM5WD6NWkYB0L6HXH1ypEnRQFnwFn9x5hZSvSruBGlbJyyMNaB3nH
         y0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727789438; x=1728394238;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uK9Ua6p4XY0W7oFZP1bhbr5r14FIpD3VJc8sLYS+srQ=;
        b=ZPUiDPQr2/ZfHEea237Mjsi3jc7tjY7HkaY1DU4OkDaKyHrHcX+7coyp6yLjapL8cl
         VoXPzkvk7Ed28A719i0PjgpLaD6NUt21tryZiWDGXGNfk3tknyyztbZa02xA3/lWRFqg
         Jvv24KW3FPAs+MPRpFXD8rufxCk4ikH9vRwT7XXA8+y9n5aaud5ssUNparkm8Mto78DY
         OH6YaVwZa3b9n8qdtasP8oPmC5HrsNm7Yy2nX2PzIrXePxFm/4CUqNuara56SSg2SzM9
         aUYT7nneuOn6Bw8hW3TdlSvxlgtABEmpgrrw4HdyYMCii4ankeUhv6O8oN2/+ySsCwCR
         UCIg==
X-Forwarded-Encrypted: i=1; AJvYcCUO7LGfLLOpAOCbL9BqVyoYiXscRxWecKKarh5COOp9zwrkGQ1DVWxPGET1oX8Oo/YiCBzy76WHkvLdng==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJVLV0iC71iFSeiAUnna1Dsr+F+STbpjaHzDMs+cSPkhuzy2RJ
	YRWTP/PjtycsI51XbXp+3yXqSVoIVmk+fCUXDHYHHCTkN89FxBxfEkudO1B2XNLUDWc8FKgnaT+
	xjsE5Eh+LwSuUFA==
X-Google-Smtp-Source: AGHT+IErH97ZXlD4tIoKA3thsCdHJH2G2pNUVlIr0AE5dq7niJnu55wTopZT9tfYYM/zS3Eb67ZCaVjEjZLfD4o=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:904:0:b0:e1a:97f7:3715 with SMTP id
 3f1490d57ef6-e2604b6eea6mr13252276.6.1727789438182; Tue, 01 Oct 2024 06:30:38
 -0700 (PDT)
Date: Tue, 01 Oct 2024 13:30:00 +0000
In-Reply-To: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
Mime-Version: 1.0
References: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4317; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=tevkgj09OalAKZgQaXHqxVyJ12UyDG/afaB9IjNpmbE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBm+/lxOJBJv7omOMsbp/Xd4tFgRoa50P5L5jXEg
 q/9H5708lmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZvv5cQAKCRAEWL7uWMY5
 RqSlEACEKv5QTIw+nAQSvSSW6Kpws6OZ6oAyOuZA+duoWU53yOedIOmcS616kIBLvLOJqQ5VR/3
 t4iFWYZkPFMl1gYEfQk9J6jbd20WdIip/QV0Zj/iqarYpZKWZZdfZ7xuhRBngrHVjpQyp+G//Cu
 2flzn3x0yol5SxeMSw/zPDCImqoSDJxf5qO0ug0WcHdWK72vOf0U9UkUeTbB5/CbWT6JWP8xmH5
 aSMWpJqml1bePjZEtR9hRE01LRD6DAYU55A6cwnsSVizAdgHrlIdcCUtNevexZPbfngWgSN5iIB
 lpclIa0KNxZO6XCIph0o/bWhuRxd8Y8z01nFoKbQFccYvcB5heYSMtcr1OOG32qkexg0I5cCmwd
 d9et3EwVRnUGnejQJcanzeN8ta+L/Vy/Ev8lyzRv23CKT94QfUac+Lkm+oOZHISIa6jAIfV+Dz2
 Mf8xnV1UzrsouZ30D13Cs2rPafyQ7nIybwbxL5+zKuVzpYMw6zcJ+u7JIUVSt1krIjmIH3dKNZZ
 sSAQSapkweJqcjTOxOM4hVN4lc8A8pnWqQxUamYrkBQGa5tIlGwbhuLhM87svgn8rqwLfcLp7mQ
 6itQZyogV0FJpRi7cRTONJ/G2htBlFNSSE00b9KRUppypTgwTZUn+yCGkTrq1/PhW0om84OGrWz a3fyXEthwW96hSg==
X-Mailer: b4 0.13.0
Message-ID: <20241001-tracepoint-v9-3-1ad3b7d78acb@google.com>
Subject: [PATCH v9 3/5] rust: samples: add tracepoint to Rust sample
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
X-CRM114-CacheID: sfid-20241001_063040_872914_B0E65D11 
X-CRM114-Status: GOOD (  18.46  )
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

This updates the Rust printing sample to invoke a tracepoint. This
ensures that we have a user in-tree from the get-go even though the
patch is being merged before its real user.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 MAINTAINERS                        |  1 +
 include/trace/events/rust_sample.h | 31 +++++++++++++++++++++++++++++++
 rust/bindings/bindings_helper.h    |  1 +
 samples/rust/Makefile              |  3 ++-
 samples/rust/rust_print.rs         | 18 ++++++++++++++++++
 samples/rust/rust_print_events.c   |  8 ++++++++
 6 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c27f3190737f..5995a8982130 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20219,6 +20219,7 @@ C:	zulip://rust-for-linux.zulipchat.com
 P:	https://rust-for-linux.com/contributing
 T:	git https://github.com/Rust-for-Linux/linux.git rust-next
 F:	Documentation/rust/
+F:	include/trace/events/rust_sample.h
 F:	rust/
 F:	samples/rust/
 F:	scripts/*rust*
diff --git a/include/trace/events/rust_sample.h b/include/trace/events/rust_sample.h
new file mode 100644
index 000000000000..dbc80ca2e465
--- /dev/null
+++ b/include/trace/events/rust_sample.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Tracepoints for `samples/rust/rust_print.rs`.
+ *
+ * Copyright (C) 2024 Google, Inc.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM rust_sample
+
+#if !defined(_RUST_SAMPLE_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _RUST_SAMPLE_TRACE_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(rust_sample_loaded,
+	TP_PROTO(int magic_number),
+	TP_ARGS(magic_number),
+	TP_STRUCT__entry(
+		__field(int, magic_number)
+	),
+	TP_fast_assign(
+		__entry->magic_number = magic_number;
+	),
+	TP_printk("magic=%d", __entry->magic_number)
+);
+
+#endif /* _RUST_SAMPLE_TRACE_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 752572e638a6..b072c197ce9e 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -23,6 +23,7 @@
 #include <linux/tracepoint.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
+#include <trace/events/rust_sample.h>
 
 /* `bindgen` gets confused at certain things. */
 const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 03086dabbea4..f29280ec4820 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+ccflags-y += -I$(src)				# needed for trace events
 
 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
-obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
+obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o rust_print_events.o
 
 subdir-$(CONFIG_SAMPLE_RUST_HOSTPROGS)		+= hostprogs
diff --git a/samples/rust/rust_print.rs b/samples/rust/rust_print.rs
index 6eabb0d79ea3..6d14b08cac1c 100644
--- a/samples/rust/rust_print.rs
+++ b/samples/rust/rust_print.rs
@@ -69,6 +69,8 @@ fn init(_module: &'static ThisModule) -> Result<Self> {
 
         arc_print()?;
 
+        trace::trace_rust_sample_loaded(42);
+
         Ok(RustPrint)
     }
 }
@@ -78,3 +80,19 @@ fn drop(&mut self) {
         pr_info!("Rust printing macros sample (exit)\n");
     }
 }
+
+mod trace {
+    use core::ffi::c_int;
+
+    kernel::declare_trace! {
+        /// # Safety
+        ///
+        /// Always safe to call.
+        unsafe fn rust_sample_loaded(magic: c_int);
+    }
+
+    pub(crate) fn trace_rust_sample_loaded(magic: i32) {
+        // SAFETY: Always safe to call.
+        unsafe { rust_sample_loaded(magic as c_int) }
+    }
+}
diff --git a/samples/rust/rust_print_events.c b/samples/rust/rust_print_events.c
new file mode 100644
index 000000000000..a9169ff0edf1
--- /dev/null
+++ b/samples/rust/rust_print_events.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2024 Google LLC
+ */
+
+#define CREATE_TRACE_POINTS
+#define CREATE_RUST_TRACE_POINTS
+#include <trace/events/rust_sample.h>

-- 
2.46.1.824.gd892dcdcdd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
