Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B38C52D71
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 17:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sf4fGZVv1ovaxCHRgHXJ19nYE3YfVfaqMjDXqjlT78U=; b=jUVc4MTJg/fMIv9+YHIeuH8eJL
	P6CzNyR4gp3ma2kN5mWxbe3sd03UBE++OC4H3NbI0TXXDFlR7v4pocMRsmn03NT698RSPvYjTAbLz
	VORpf9CH6yN+rhcUjAFanT0SKDfULGrjBrP5nkE45/28guN/YNOtoJTtbWy6wLb9R2J5My8Mjt/l8
	B5huMPS6JJi0jCRcYimzRcw16NMOZCzKHvVxMxrGQpWeFFWgOT8FGRcbec+R6OA3DWslok+GgoJaI
	uvK7xFycj+KNO7EHYPRlaakiYAMS9KqKslYY7YA0yyBxjcL0yj8IDZ6gUBqlEy4GWD7J3dZFgBQT1
	wLJnGxyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc6rm-000000094ws-2i6F;
	Thu, 08 Aug 2024 17:23:58 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc6rh-000000094tT-3w9X
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 17:23:55 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-68f95e37bbfso28187867b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2024 10:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723137832; x=1723742632; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aUmFxerdq8msU7sn8fhzQ+jzd0whlPoW2gAO6N3eFHc=;
        b=pSvJvDR70mR7v7b2rS2E8v4OqyhXd7VNaFc98Ycss+673SWGPHVBmmowmJ+DJlKPF6
         sQtPjbZZtRdzS92xBf/YRIIlsXgcvh/wrwBTF7lGKf90jDEMPyG6yFdBlu3Mna8l9ASI
         DIL3LuU2fzL/WVpWcTD8n3wIcBJWM4lAmoo6wSHgulFaHWmDng+xdVm4p3pfWZSmT1NW
         vfUoY4ERYoZTlC/hucZ0GQViwuKFLqnLZ0QoR0avgi8+Lv3mhzu+Atkmf3DV6OwBbmoX
         M8+h49hFAqEViKKEx/2yJprb93P/+EoWc1th3gTP00/BVG8fhABSU4VHbSbynWGQ3EP3
         URBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723137832; x=1723742632;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUmFxerdq8msU7sn8fhzQ+jzd0whlPoW2gAO6N3eFHc=;
        b=WhiFlNhAAMqKExQ0i0oka7UcnX/b9i8bswxOUZ7pwrcBEtxJYD7ljOjKSW9BG6Yxg4
         b0UK4qjtGC0jOzb6jsCAVtIDua6T7PNr5NpKKd9j0YR9n8TL/msUcW57h0lf21B5Nd/W
         CkwgfZ6fpExVnj2c4iPje/841wsyudo8vKKVc1oOYciCpGhpdMrdzhE2YEcyQgdk2jHl
         A4bX6Gjw820q+goTz46Ge9xFGaQorHi4uXqQThW1nbKOB7d+d8Y7AVpkA8821caGZwZR
         1BklhV+kwv0cBJ0oP2doOa4Wt5w2nuxKRRXDuZ6LxgiyAXmxtcAiUG5DNpV/gRWV5qTb
         VE7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbnEGZGzLXE6RDcyxDVcHKo2MPGgbq8GRctfXMAJhjqq2m5EvmCOwUUOY2JMhlpthO6uj5+WCOGkQP1yhg3Hgo2/D4/HDjtqts3T9tX1JQ
X-Gm-Message-State: AOJu0YylPY0e6hyTi9pEZ7Yl/4Mhs3+wRWmu+qCU5veluWhmWO5CpiUZ
	WgIaG1+CCUe2HLc1qaYFnh24RxrRcIXxIm+dQJ++SB6bG/EKC/I8i7veC4i97t3r1aDQ+fc5sTn
	G0nKt05XucS298w==
X-Google-Smtp-Source: AGHT+IGRqP7+DFeFNUnQ+V7Y+ipYll5RSViPN5CwU5FJh7fsHlrB6rfBlkvk18OzYnFeixJyiadrP8GgdZMTzno=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:7d07:0:b0:e03:3f26:b758 with SMTP id
 3f1490d57ef6-e0e9da86a35mr8901276.4.1723137832230; Thu, 08 Aug 2024 10:23:52
 -0700 (PDT)
Date: Thu, 08 Aug 2024 17:23:39 +0000
In-Reply-To: <20240808-tracepoint-v6-0-a23f800f1189@google.com>
Mime-Version: 1.0
References: <20240808-tracepoint-v6-0-a23f800f1189@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4268; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=n5W5/8RuyQx5yRzRzRXuMwfWxOkJ6c4vZC3cV5tM17g=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmtP8cCdKeVKp3Gx4bDIXcskOAFpC0nPFgKpZbG
 ZYZHDxjpLmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZrT/HAAKCRAEWL7uWMY5
 Rl9+D/9EFS92/jNIGRd8sGCRkwHTYcuzvvQRMT0VkgQ/FV5v0gR1hJhLi+6rGq1AR1PNPNz7Yfg
 N99rpjYoveK8RqLqkkhJhZ06BIuqtWbMWarRJnalN5AVq/E0GZskbX8qQIbcWI0nEwtZB+Y2I8m
 UvMTKqpRjhFxVuLM6oT/ZLKvXOZ+1g3iE9FWpuwRbcbWwHD9tluTttD9FUTz0/xvBslxbuT1CIl
 iueN5KGjHWQN3OU8KsOWmERvd+5dhftUlATl+2h9yaAAjsGxBEtOOyfO3QdD/1M4IJoPVCkmwjH
 fE41mm2u/8qrybC0f4//dRzk5hrYBYVZLe7gJrDR4923g/mfKCvTqmrbFGcLwXB1/CQOvZ1aybu
 /7TSu6CFSBmhqBLEoSOz9RCWRhETSy8YFZZHSwFQcZJ6aPaFfGaFt2qPjOWsA9FHu+qfqocQ2gt
 vQOnCSsdi+j5EbcxhOI8Ue4A6oRI2jKCl6Avkx95Yh6lQbfBTUAEks2EEzsPK+s+C8vQknuZ5e/
 j7gzC6PlhQCdrD5AmdT0kDMB1Vlwyec9ACveUXEDePzk8ntFGDt8gCsBiKg4tcVgbIM9Dgbrl6c
 CsDRDnp5Q7ZeyYfbsqhNr3xpc+as3Oqc/wiV2IdRdCxfKAR1G2jUTmvhWSi4q2xdN95TBaKPGkf PVWzZTdNrDuvmSg==
X-Mailer: b4 0.13.0
Message-ID: <20240808-tracepoint-v6-3-a23f800f1189@google.com>
Subject: [PATCH v6 3/5] rust: samples: add tracepoint to Rust sample
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
X-CRM114-CacheID: sfid-20240808_102353_995235_6DF90E09 
X-CRM114-Status: GOOD (  18.42  )
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
index 8766f3e5e87e..465ca809ced4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19920,6 +19920,7 @@ C:	zulip://rust-for-linux.zulipchat.com
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
index fc6f94729789..fe97256afe65 100644
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
2.46.0.76.ge559c4bf1a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
