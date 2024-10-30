Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B529CD6B6A7
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 16:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/BZnWbIWPH1vqHXJEo+yIPmFc4y2/epBcqSkJzwND0M=; b=njEPteBBpxBss3Zsaor+F1sxFv
	Kaf6v0ExlJ9OroGvt4E2Cm3miJnFN3a6ohtw7Bf64xH8qK/P2ldKqulAsM1oMnSIS/mH8kOn/qROk
	U8lRXoQZb00VKTgHqYpBHm1WIm/uocMKK6LAH17rWiFrQweHEgV/LQZxqWuicvtnMD5PVoAS5zhBw
	HEmKzzKJVt35QALgt+0IZYOIiufA5T8QC1A1wugTdqbUcwidRB3PQWVvuOzBGiVDHfkQhuZbno/zI
	YJFv86Ns1uP8kYnmzuGf3Nc8LV/AHXg3VEZSSuSN2rqgE2cICP9ORHFYDpn0nHZey8Gyp/mjT4RJx
	W7Hy90nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BPz-000000013BW-1hoS;
	Wed, 30 Oct 2024 16:19:35 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BBw-000000010MG-3FS2
	for linux-riscv@lists.infradead.org;
	Wed, 30 Oct 2024 16:05:06 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e02fff66a83so11159062276.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Oct 2024 09:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730304303; x=1730909103; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=54C00wXILAP4wDE2WJebdXFCv98gErGHm0LgpmOmMWo=;
        b=wmTQg7PQflnr6dkXAcpe9RKGmTkp8ArLhxNweId2ClEv/hmlwvoEIL2DZccxHoYITq
         ZOu0mMYhEs4KpfZRhscxhG9YDDTwbvHguySmYaxl+JRScoTx3F8fRkjNEUjrq/fZQxFM
         7Qh8A4eVLFMqTv1XQQYkbsPF/RXhrfIbOpxc11sGihL2KbbxVGPmGdRbw4Pn70FgRaCp
         QZ+dDptQWl4Ib1P3WXBywM6svVULy1yfXDZv1KYU3N26gs8Jc3Wsu0CWgPyVLqNraEKy
         T4JO9UDy7PJoXC2rvcMxNSbG+884ketKWPF+VZ9V72WeLqtgD5pcfqz32FTmI2s9DTf6
         J2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730304303; x=1730909103;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54C00wXILAP4wDE2WJebdXFCv98gErGHm0LgpmOmMWo=;
        b=k8cy37AkgSAXCaZRi165iHtd50uH32IoBdSAvGe41oI2o+vhaFF80mk6vA3yYKqtK7
         1UZMUCVIQ4l5Q+ZgRtVY0dBQWKrGUjp6Lf514fPiNyT1ky5bMDb4UMLC8bRgWvxYSxDN
         xdH9UWE15zP7TDLpBRwejNkSwLcutTIHRiImaqEOrNizc168e/KeDLwqItFJJikwoqnF
         CnH8sQCGTu+NI9/4h+j6e4KLCqcHJDXdOqzmZ9iy37pZ6V8xKXQ+mpQPDIeK0bCvWoP3
         SLJ+0LnqIo2Bi2Q2lqJ7OYRnjrozpE7Q6eDKXclfHWxW4L5iBl+4nzTb3HQ+a2X3aLku
         W27g==
X-Forwarded-Encrypted: i=1; AJvYcCWOgROOa6fZWbCQwE/x5LtN0Nac+CBq+jtkazyftA4250Wg0TFxk0+K7ecoqBomcwBhVjJAgt853sqL5g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs/Xa5bT3Q/vIFxx26O0JOVPrRaSN2KPRq5zMVaT9BN9GZEyxN
	sQzdeRzjSqJEmKvK2cY5GilJiYbE2oG5iOd7CVSIKLMFKiujNzo6x382sZcOT4E8/HKmXooFsV1
	E8aFI12whzRC+fg==
X-Google-Smtp-Source: AGHT+IH02CpxvtSPol89CK83WsKKG+/9Mwolu1CUUBZ+Whn8Inwxg2VMatkn1IVi7GLj+0ruemL1utAOuG8/YqM=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:7481:0:b0:e2e:3031:3f0c with SMTP id
 3f1490d57ef6-e3087bc8ca5mr10454276.7.1730304302410; Wed, 30 Oct 2024 09:05:02
 -0700 (PDT)
Date: Wed, 30 Oct 2024 16:04:26 +0000
In-Reply-To: <20241030-tracepoint-v12-0-eec7f0f8ad22@google.com>
Mime-Version: 1.0
References: <20241030-tracepoint-v12-0-eec7f0f8ad22@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4317; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=6E1WLLql+lELSHgkVX0zcOXTthdmIBZjrDBlYLHV8VE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnIlkij9ArugE0ISxftxYGap6R5sPzZ34MTem3X
 YAfJWcND5GJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZyJZIgAKCRAEWL7uWMY5
 RtyHEACM0N0SSCrGkN7dCmCzwyY3cCJ5+/ZS8EiisT++meOQqOellWnDP/PWSwMYNbKLQj01avU
 DJklGMUi2rgWkgWLWUw3GrMRK/18oqPSId9Yq7MRtYctCEBNv4faTk2F5MMNKzh2HAbp896wyn/
 +OUeotpRorcYeqS+fhvGRpZUsOt1I4hRqeCODknNXG7YJfnveRdyeX19Nqoc5Nmrr/Uxd/dfeSt
 +izMRDn9xRkm4BNbNX1yq7vxHnxw03+3+w2BuTdWsH+PLbA+jLAlxlYckKuVq3d81QH7/gRF5yo
 7Bmw48EA4n5UMfHLSMXW6eu6yyNK/4rXD98UpVyaC0tmhhzevjQCifkvST3x0kK43p1ik/cpkal
 MSJn+2cTR1oSj+CjlBikD10FZecb3FGmhyvrlttp71kJqGbsuhJeKmPlg+/CLdw3SVqr8fxyI1U
 8AokMAWfRmWN/BaLCLAHONLfPeoaVdg79U5+cIJeaAipIbx41O8Zan7uEfKAwyK8BTa/ialGsSi
 UvFlK8LwyS8au0VyyKicDxE7Tswji9RMwtfM4BmxSauM4ltVnXcRWuSQpV3V2W7tJkLqtZu77EN
 Kyr2CONG7Heet1+fPXd8k35lT0KGZoZdqTppbnog7dJLj1eDulTzDBYyiVEbnrBibgMGBS/dBZA Bfq3ja4N4Z6u9OQ==
X-Mailer: b4 0.13.0
Message-ID: <20241030-tracepoint-v12-3-eec7f0f8ad22@google.com>
Subject: [PATCH v12 3/5] rust: samples: add tracepoint to Rust sample
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
X-CRM114-CacheID: sfid-20241030_090504_845040_83E35A88 
X-CRM114-Status: GOOD (  18.20  )
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
2.47.0.163.g1226f6d8fa-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
