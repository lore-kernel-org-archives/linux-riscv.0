Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19352C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 12:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ghclI3fHXITnMCImyDIU1aDDMP71kKHki5NVww3XDXU=; b=e2mBIjXoZsy8Ohnl/rejDJ64qC
	RqfJ4Mf1iO1JSYedtSu3lfUIbSDqxnEgZp2VGdsOFG+vbPtKMn91qI+JloRmyRqEclm8VjlL96dqy
	4ZwiZXLJfu2A7edyN02SfY9NVHkuNtVv8u7C5OsASsIatG6KKlUSS3ZnHWa3T1RJ8z6xH4AU/UsHZ
	LgOwi+gMhnea7cxpGL4hJU1FM7fnTRCjFx+DxHS+oew/ani9bNL7PYpBPF+ELck9PjU1LwMA/WU1C
	OT8hHIPcymaWJrnlSwrQO0mVLKBfrzW0wIERojqvzVUGTRLBawt5dwWWmNOUm1ZsHM4HT/17Xcazc
	xx5y2f3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh6Z0-0000000ChSD-1W6u;
	Thu, 22 Aug 2024 12:05:14 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh6Yl-0000000ChG5-0FA9
	for linux-riscv@lists.infradead.org;
	Thu, 22 Aug 2024 12:05:03 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e0353b731b8so1223644276.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Aug 2024 05:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724328298; x=1724933098; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8WXJYVeFW+jGG7DCrz93gCg6JPKvPQ2Wf4cfjKgCwaM=;
        b=DpDOSouPmqG2MxIEXrw6V8qN30B3czTtInvVPBgdYzVW4ezh3bU+gJPEreGjWL1gwB
         tIC/mMEnlvteAACIuJenJ2qbCYyecQKExXDkc2H6adkq3yrQZrn4GJazBpcgOxc5JqY2
         IdTKq3gYTCfQ2ge/3X5RkcNA/YvS4mGowiolqC8g/KaENOvbpRSt1zU/F+SAmhxqRDqP
         U/HH4yCdASkLcH/FhtzK4/6n/DQgL31nsa836KqiaodEbgM15RVoU5tKy3ymAw4R6bax
         sAtXcYWA9C5ji0s2ICFFJlxnUJbFcIRKKFWfWdyoQWS6lnu2oIR9SR8TmPe3mnHvNtJg
         i9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724328298; x=1724933098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8WXJYVeFW+jGG7DCrz93gCg6JPKvPQ2Wf4cfjKgCwaM=;
        b=KtxheNDGTgaUXpD9o714dmxf6h+tOmW8Yj7J2dUwHhozKkd8IRWJeFImux/MKP1MiZ
         ApeVEWpKGS4sh8GboJpnIu/Fs18v29H/AK4CQD+112iSWZBLCjtVHNi/is77Ds1gpzTw
         twavp3AP8Ho0DzVqH7+a/eymyH/c+8DAFl9IQh5bWWMzI8tZt3mm/ZMF8UiAdUUGeoTt
         fxEZiIhduO7AJRfZEwH9vsLfOsjDPmVaXllcLqvxhImEphE3g6U5e8oqK1K+t3M9hQB7
         5uHGUDRiPuzv1avxLKxQqKV9mAyhwT046ZutjZFDxm/9IraHY15hw+oow8xqKFmQvKb6
         aNyg==
X-Forwarded-Encrypted: i=1; AJvYcCWyIHWctifUYiHFJF+1Xd1MaSat2N90GGqKSpJQkWxFP8MA3BpngRpb3VzvV5TfPN0OMCDUxucpy9GQgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtMA70++aMJX4tfdxJ5rTJqYSjAEFLaYpMkEotaiwp1dMJjDIt
	FWWnB52ITfZYeeQMSSQpE0Hrk/q+AsJaf7Ru4Ma09OTzd/VWuSK/W57E6Wkm1qopntFO9KmZJmN
	43m7Qhz2ZotbyNQ==
X-Google-Smtp-Source: AGHT+IHOwQ7F4WwpIwCYP14vLZEMvblPZGwmqHarUMkdlvedNsRunUgeqjgc8IGJA2wVHg86ug/U3YKoS2Z6kS8=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:7483:0:b0:e11:44fb:af26 with SMTP id
 3f1490d57ef6-e166540e1eamr8764276.2.1724328297474; Thu, 22 Aug 2024 05:04:57
 -0700 (PDT)
Date: Thu, 22 Aug 2024 12:04:15 +0000
In-Reply-To: <20240822-tracepoint-v8-0-f0c5899e6fd3@google.com>
Mime-Version: 1.0
References: <20240822-tracepoint-v8-0-f0c5899e6fd3@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4269; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=FjpJXotW1KGtmig+hIm0KQivxPyDztMFhKa3lXhpNM0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmxyldDFylo0W2FYUlH9zPLgV0aNf5JfdXWxC+k
 EV6BXx+qxOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZscpXQAKCRAEWL7uWMY5
 RmwSD/9lb6aazG/rJFEouodeNF6AgBtP/doqXucmQsYP5lsbpIKM6wD/RrdAfk8KvahqhtiKNZo
 M80qvgsWx6kR60U8/3k8BpYVdbSLtWq8iy7kDwbqPsW7/lbh6lSSN7po7WTvUGkLxdy55aBL7Sn
 pxvZeuKi80CsU5j1xBKwqA64hnBiiXrCmIbUYWMsfWCV1QC7IB3G4FGcWnkuPdSj/Sec7odVug3
 UGVoS0jRtXoInadAPmAvJimKkQGrM9XN/1U3Y//9PfoOiMapFuQ1CRn8NPVS3wLdpTesPhUn9u7
 eexLr2wbBy043Lp3azw2EeBu0AAzJ5FYxBnV7XKV7V+5VISDYLTQky2gSjsC+RTTVAW0ZxL4ExJ
 7tcK/uSNtex2S3P2p73VyR46otDTS3YeIjA7K6J8Cw537m+mpFL257yU0gdDeWj4RBhhIEH6JzO
 Y+Fi1fjq/r5jug7WVznXBOO0L9iN+HL/NGCTv/tRN5iexYDGVO0utnbT5kTx9B3ePtHUT0FmpGN
 DxAq0+0gRNwsVdxm4jY7ARuozjUBGvHfrKfTKGfwBzWN+t8wjR5lnxyPtKMfDczcG0A9Ii5xWdu
 wOQZQ3zt/bMwGS3BgCox0QdlxbK6m1+NaZgBJECLHrZEBYyYJo/0uQgI8Kd415KJtvBEaMpr5xh HbPkWR325Lp7a5w==
X-Mailer: b4 0.13.0
Message-ID: <20240822-tracepoint-v8-3-f0c5899e6fd3@google.com>
Subject: [PATCH v8 3/5] rust: samples: add tracepoint to Rust sample
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
X-CRM114-CacheID: sfid-20240822_050459_372024_2A3729CB 
X-CRM114-Status: GOOD (  18.74  )
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
index f328373463b0..1acf5bfddfc4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19922,6 +19922,7 @@ C:	zulip://rust-for-linux.zulipchat.com
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
2.46.0.184.g6999bdac58-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
