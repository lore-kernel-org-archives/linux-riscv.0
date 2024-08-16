Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F021FC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 11:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ghclI3fHXITnMCImyDIU1aDDMP71kKHki5NVww3XDXU=; b=Q0ZFYNbaa1AqP2A5jBwMzgnUMx
	EWpD+M8bz9hAOSSE9eZrWkRyBc7fhELsyhsr+3h6JLkPA0Ur0WPWHha7rCjuj+uUDoYbhDWMm6/GJ
	k0WFs52n+cc5vkZumPs0KN3XIEpxRv3atsM3qpmUcSyvr1g5ArbfEwj/Hn98+QmdnI6Em0JOhjQvN
	nrjpcOfprEMwjNYcMxlsW9QDZRHtq0uIZW6eZXHu15kOxAnkTJvlCWSTijwD4qxBqHAbrpvAyRLhV
	K+lIKO6RE34w+WTzwGcFYawAkt0rlDzDT0IEBlqOTLCiBKWBDXv3ZO/bHDYAmb3nS4k7P3rTffEko
	eDerXkyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seuow-0000000ChXq-3DJm;
	Fri, 16 Aug 2024 11:08:38 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seuol-0000000ChPs-3L9x
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 11:08:30 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-688777c95c4so32911077b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 04:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723806506; x=1724411306; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8WXJYVeFW+jGG7DCrz93gCg6JPKvPQ2Wf4cfjKgCwaM=;
        b=ICCuxCbMUmxW3469sytsdoJFtOpFIqmKOj41ECJ1ycgNGSkE0798DLNZcXxW2RTfIU
         Per687C6rYckzsvitS93Wj9DgmCoWZGJSd+VlxHgfqnWcOcGZer7x7vYsrvSfJhHG0kx
         N3FI6NZuc60ynwvFmLEu+yW91pA82oD2Yz3CSkQzhAgltY8w+Nxe/1uyqQJ5Ou5l9h8T
         VcPiUZbsj0UplfNBk5XP+8vTAaIRhSPHLyGeGPoEd5pCaJ2idnUhJUb54q6y3bDMLlzX
         dpqasNAgcOrYCzf1JeYUBwNP1ewVK10Pz77NTAwW4mUlD4EAdip7bQGr1oPpOQXTjEeT
         YjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723806506; x=1724411306;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8WXJYVeFW+jGG7DCrz93gCg6JPKvPQ2Wf4cfjKgCwaM=;
        b=WZq4zkVpCC/9359aRQhACctv/AtyB17kN7XwU4acMGiyiXp964nWWxT3tQWVJConoB
         9fvpqvQQyjq4sPbsFcSmALzDiZ3oIVh05Bmp7plQZe4eZLW1s4OhOflY3EdM73B9c/Bk
         ho5wXSbGhXAIhvMhyP4C0cAn6CZAhsVcdiRC/KiOnfsHFtFlYU9E6vrcruj1zckddOjW
         RV7nyRhQ4Cs0Jh05Svw7Xl7o8gZNtL+s4MlbbBRD/zicw+laOXE4jyE59Jy4ryAn+Zx3
         1TAMsoUX4I271F1RzNQsmXLevqdvRKaWunyhcrYXfGSVF+tPx+uEdRNS9FGTzFTjxzh5
         NImQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZJpQFZIzmMuv/90JLuDCEYUP29+L8ionYq22nVvhLaZPr//3L33WjFrqvH+4bzuHc18SUuWfiiqNvAxNVNVryMxSUms4+7a/FgDBI8+Z/
X-Gm-Message-State: AOJu0YwVT+UwfexGswz26sefvIxjojTLZrKnNH3dk/Ax6c9gR8mdILTL
	c0xIpkKbfdiBJcXvIEi8y0u9N+4Nhlk04KWeFKPuz0e5ykBTlMl3knTCjFBVK1zCocaB0WU/O3h
	aW8x/+CJuyoWqsg==
X-Google-Smtp-Source: AGHT+IENG8RvWSbnEeZa76M5drDjzlxFaYucbJgX93Ypeu6LtXaRbJkU27vCvNm78s5etIFQTr+h0LBDYQvkbbw=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:4e0e:b0:64a:d1b0:4f24 with SMTP
 id 00721157ae682-6b1bba55dd5mr529587b3.7.1723806506396; Fri, 16 Aug 2024
 04:08:26 -0700 (PDT)
Date: Fri, 16 Aug 2024 11:07:40 +0000
In-Reply-To: <20240816-tracepoint-v7-0-d609b916b819@google.com>
Mime-Version: 1.0
References: <20240816-tracepoint-v7-0-d609b916b819@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4269; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=FjpJXotW1KGtmig+hIm0KQivxPyDztMFhKa3lXhpNM0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmvzMepbhDiFvqOK4lVK+lVeXqMrqKeLQKfNtLv
 1maxl+EY8uJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZr8zHgAKCRAEWL7uWMY5
 RgtbEACRpT0zGevx2T2ZuevbMSrvHY8O+PkNODEE08LSGG6WrPSPMPM2z/eaZ4RcWU9QghWVt/A
 cY4ra+pbs5Izub0iUjuugm6FfriqtZ9xUmHCZKhSeIL7y3DBrSxO/RnogBPL3KyvFwLLDnQ8Vpe
 CqZN0JqAvxpLZ1CNPm+vh+gWVWZzuGXwl38dN1qn0yX1YUQ1i486KKeERY1HmMm2f7qWeH825sY
 UGmW4o6uJaZizSTb9FaFfOm66S0PTyiDmsq3cYgiIWd/oaQ5+5B99xFdqFzbVyj9UOhIQ8JwNl6
 zr8b++dJNwpvKjSGVuoheFxbe369/u+zPY7qthE6SfSBojC8uwxa6VocZBcQan2FQlFF5Kp/IZk
 /bHiHjf+VK5xXsr0FzZ7xzq7xnTpBEVAGVcaDEp3fmvSjpJh0UtRpHIDdIPrDztCVyiXh046iaJ
 q6XzfRbm4hV8O3fE94OIUytGTKS+ty8M+E00WtiGsxHKfp74TlxWFYG/Wp62CQIAstKFA7XD3Ko
 7UVtAvx4fVKSIp8x2vfqomxv9NuD28vjvx7o8/bSQQXbs0C00zek4wn/s8ZJisBKgL3ZkyYV1p3
 dGpVxCf4EHopYVdJKvCih5BjJP7tWaRUzAdRiF2Yv6vey7++L3JHtkX+D24D48UIfCzhGC1W94m H0gt3NMLaXB1Yrg==
X-Mailer: b4 0.13.0
Message-ID: <20240816-tracepoint-v7-3-d609b916b819@google.com>
Subject: [PATCH v7 3/5] rust: samples: add tracepoint to Rust sample
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
X-CRM114-CacheID: sfid-20240816_040827_915179_26602B90 
X-CRM114-Status: GOOD (  18.14  )
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
