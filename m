Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA4ED216A3
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 13:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fvWLJDL4H9a1U9tTpIBXALeOXBxFcs1MlgGGeXypH0o=; b=wGUiNkQSe7VsF98oH8pbv+3l7j
	3Sol+jdo2bBEFkqTjhJtTJn45+kgfqMVSnTrTvovp2LB4ojZfeZ/ggUhXM/zw/dBXmKLHiruAh8Cg
	iWhrxOIU4gWix20d0n/ZEnU6HG1BbwHIi0xDAtwW/cLegrfbHSuK8Duxh0IH5/DDIX5JFwIEGtuNH
	HVG8jjCzROxc7FJHPmUX8Zu076TNUG1ouMEbiBd3NF3eiQdadDKO80lOgqqy9b95yXN6tP42TRy+e
	9eVn0RJZlgo/NF7yy6/ca+cIR1ftvUAWiPfLZIhsGt8R/0no9mKkBgDpCgiWBfMwBIQ7/U/dCANiN
	KI/5oI5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0hQ8-00000008JYs-41CB;
	Tue, 15 Oct 2024 13:17:04 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0hOf-00000008Iwb-1wqc
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 13:15:38 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e165fc5d94fso8602121276.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 06:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728998131; x=1729602931; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UZneAmtjYaP5W4qvsAgvZmY0+FlDJmT5YgM1QOUVihI=;
        b=ID9Yh+fPgVCpqyq8Fhiu3mUwE4amWR9dypuILPFHLjbo5W8B2Tr0mcfDr1n8wX7oRR
         sCV3AqQj/VynPF8vRdmoTO8WlHC3B1dKIRYA48NaT0b3GOrpTeVnUfv7UIUvsDN3eYDK
         oYZz+ZuBan1Dp0svy2woIkY56rY4eyzAt3dhFyI98rMC7iR5AAmZWMiVdyqQkx5/MVJT
         QecpKpDqd/KkCuwCmroUT1eoxmz7MR4RV1QAusy9ETOn2aPlsKOG/vjPTa3jHhUPWAtd
         j0Niz6Bmpc/yYbCYRqAh9JHtzTAMizwVuWdKS99WvZUHw4o8DakNZODzquVotAsFAM2B
         59Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728998131; x=1729602931;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZneAmtjYaP5W4qvsAgvZmY0+FlDJmT5YgM1QOUVihI=;
        b=n9hD2dkqTxL5SupnL7xOzOFELk1a9K6gOupsXUQPBdQfz/F2ojl7ZcjLhL8QEFIMEK
         0vHbQG6E/8sm9oCrxGZ+FuCUU73qyvkZ4YPrBJwI6U7LGw2yK3FBYgJC4TmZY4zQrYvz
         CmDv60LpWsl3Sqak5rfI+/Okx3kv/k0rprJUXvAAG98lSt+/yG/IUH3C3+yO1truGIQ/
         WDlrkVRmIMF0fVHpb948phIcx8oocFI1G9MzGX2tDHuCwIDO4lwerA6ZkMpcjJZuFpKb
         b4DyZHMCtTtddkHKwpSUuIUSu/KkjG5lgFxCCfO7r96wuf0CU+kWTQMQtKk0p8AsZRfp
         HXbA==
X-Forwarded-Encrypted: i=1; AJvYcCVdI/SoagTmP9Frp71jlEpHedsLwm0iHvUP5e6sdfkAGg3w9bCVOhaSkLdsU3L6/2Q9903mSImHlI7GJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOmmCLif6SVPVIuvvOBI6ycofYvovEhsAwUEJAW3N5GSNabfmT
	Nxstb5RKxQzuF1qcGdVuwwFuXcXv6xhIF5pKUwF0T3h3PsgHzP7AyPS0Ygi3OZYzQ8M29yjypJm
	y5xV7+ZsFhzOf2Q==
X-Google-Smtp-Source: AGHT+IEzL6yBZNlDa979UyqaKi9F1PyvGo7lYn8YswH0l3PcfVNksqbLlmaMvQMZzFMWKz7gTAN4h9OzzLcAOhY=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:ed0d:0:b0:e11:5da7:337 with SMTP id
 3f1490d57ef6-e29782e7f49mr153276.3.1728998131411; Tue, 15 Oct 2024 06:15:31
 -0700 (PDT)
Date: Tue, 15 Oct 2024 13:14:57 +0000
In-Reply-To: <20241015-tracepoint-v11-0-cceb65820089@google.com>
Mime-Version: 1.0
References: <20241015-tracepoint-v11-0-cceb65820089@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4321; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=wthozKz61nBwTqsdkL/dd5IHBHSbPc3jb7JMQXND02Q=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnDmrnVE+FoIcfCQnaz9Z/nNlTaNIkQb/bJaHvv
 wlL8YA9NLeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZw5q5wAKCRAEWL7uWMY5
 RtqND/4qpfG1RTZIbjGjCAjBRTqE/qdqMEFHvsouDl288HuGkKkplByjrXDUNDoEHNOYlJD1+9L
 WLQReVgBvvMuxrju4XEqD4hSSOQodect6dsVeKL1A0EqLjCKRUx0IJ7rxMGnfkYPHMrgzue5Cjd
 5Kr9dkif5IABz7/bYcKaYqNCUnvXexQyMR5ADH7G/SQX0ZbznIvDDi2kMjS60zYxH/6s73/8Zej
 WQussULMf/kVrPqQeIRA68F+DDaTMAFZw6FUYVKcqnLrBDPtObsH4A13fp5yZ2REjajAcVHD0Tg
 OcgmE6d4YmEILkSLiCvaTU2Q0XKEiBEvT4YUQ0Po3HRlMMHngRr3gpX9isQE89xTxyFyPDrOEkO
 vUhW3ioHS4u/B+e8uxovfsgtdVOtRzofmUbQQ7eGmpdMk8SEmvhY8OV4g5uxDjMcNnwMLqGgTnZ
 /LjS741b7nmcXXktia2Q903daEcfxsHbVM8hanld0A0A7Zg+n6mtnD9vY+dMLgMAby8+DCij8k9
 NxocILc/Lzu3LKDraG6IP6WymRrrX3XufsItDQpytfyFoTSRK5hWyHh5n0AywPiuDQ1kr5tfJw0
 T6N/zussmON/rM04BBqllIU46HDRtdol8edsiKo2sMso/VvxB4XzBblyDXV7OWJgyP583WnGwZV oXb3CAvdBW2ur6g==
X-Mailer: b4 0.13.0
Message-ID: <20241015-tracepoint-v11-3-cceb65820089@google.com>
Subject: [PATCH v11 3/5] rust: samples: add tracepoint to Rust sample
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
X-CRM114-CacheID: sfid-20241015_061533_733641_72E2FA48 
X-CRM114-Status: GOOD (  18.37  )
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
index a097afd76ded..a9b71411d77a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20223,6 +20223,7 @@ C:	zulip://rust-for-linux.zulipchat.com
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
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
