Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7273FD2169C
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 13:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gfE7ZShE5ohktZ/M4YwIz7ImaV3NbvLnf2y1kLbWEX8=; b=JsAdYeznmmWxs1mC/uOsWxqr0I
	FNFnUD5GdfnTT8MeOMy55EEwI31hG0m9+1wwm8xAOWhvIXuMZi4BLTEmYC7J41bb6YapWyhl0jOSq
	7n07goTJnNkNv2WAll2lWwLv+SvOf6Z32IwOacWE5zwvwE1IB2pXbWdUOxPJ0NSQobFurymxRXMRx
	tXuC9yblcf2u460EsD6NR7ldl2RSB+VHLYMsmQyKVbnLSJkl3Yhw+PsbVH/MnB0L/yK593K24THDv
	qzJesslxRBYhM1JowKfrnT8b4woTlhovlkzhnw5XmcRwxA6Vxg4DYvVPOs5lvrArXnpRePN8csOip
	0Ku3iI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0hQ7-00000008JYI-49Ri;
	Tue, 15 Oct 2024 13:17:03 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0hOc-00000008Iua-1ImS
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 13:15:32 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e3245ed6b8so76714017b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728998129; x=1729602929; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qvgr+n6BCCNgQWUs70Ofe8Bn1gFUAza68YbSHBnfTLY=;
        b=cLbPiQM8WjQnVNS1R1QE2dQos+y8C82sAuAsNH0qzGomShc468k9gSLEcrUQbK31R7
         ke/8S8PFnFwbyd+u/Pdyee/R+Hq48a7c9EeLDz58plgxinHkc/Xgr5Q1RpD71qkvD8jJ
         N23qx5BbEU1rmCPYOZEV+OlsIlORtHab8wMn2SgPxeW4s8eEdO5TUgObRHZy3gDZP/+1
         cYG6M3AO0WYtG2Mmumk4PiEnFymV0pS1xncT2NejGJei8ljTK4JGQA6pb+z8e1CX6KBg
         IGecEI0yD9RW7APHpR/Ml4uIq2VADEBvLxBO2J+d0t0raqBTO62jhq1fuQqOKbbTtGx1
         mEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728998129; x=1729602929;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qvgr+n6BCCNgQWUs70Ofe8Bn1gFUAza68YbSHBnfTLY=;
        b=vRBePgVVxtxsu4CKTZij6XVlQrX4J97Ga0/4u9Evcpwr6WuuGKulPZcI/ASGN04R4N
         pG0sz/F8KPuyUTWg6XQ1y4QAsGSoLhM9dba0l6K7GOfuSyiya/wiZJzFZqZ107lj3d7w
         r/nviHGuYH+jPzp2r6Z9UAriyPOeBRYlAZ2c3M8u6HfRsgkLf8z7kAo49VQG/C8vnPYX
         fMw+4o+tb+imK5Qd6Gu9ts0wNJRBxw2ElU6JXKnhtwUOhx5JrNKmK63HxjYJfV8oRkgd
         g48QRcKqTEoiksdlFmw/s8z5e2QT2ECUl9xjbFj1E5cC0wY5kZWDMa6qGJcw8ZgoWa6U
         RFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyT8wC8kf8nH56DjSXgqFsfj3w81MmVvcE6L/H50+Jm8BSQkHNZC8ObJL2gdGm69eBOYQCvEqkmgs7ww==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/OHwc8fCA9zDjlvrl7WuNEACfSBMrrg2oOdSbDb2HQ7WXFQjz
	BGH9g2wcaTg9t2hpwXGAl9ipZW/0/IGdYxRYlpAFvP7JKA7zTryRax84FdMH/D80ZsZjD9iWwdc
	cMjbuTL/36fwvuA==
X-Google-Smtp-Source: AGHT+IH2aipjAuwBfMr6lWsvCGRlG0PFPRVftjjOVqprnLHjHCiydmMQVYwQADN3PA15UjoohsjIs5Ot+NwtIxo=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:d0c3:0:b0:e28:e7b0:ba89 with SMTP id
 3f1490d57ef6-e29782d5437mr91276.4.1728998128548; Tue, 15 Oct 2024 06:15:28
 -0700 (PDT)
Date: Tue, 15 Oct 2024 13:14:56 +0000
In-Reply-To: <20241015-tracepoint-v11-0-cceb65820089@google.com>
Mime-Version: 1.0
References: <20241015-tracepoint-v11-0-cceb65820089@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7835; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=GMLTcVVdmPl90l3vR60nLHEg+YV0m6WjZcRDkYDuaVU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnDmrmpScs98atPErvy3Y3eDID5B6ICKiw+WaX3
 dd0B5/EcSWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZw5q5gAKCRAEWL7uWMY5
 RnB9D/0UA1WuJngFq3RXVOyFVknNYlK5cilfOkXWXwOcoiwZMU6kVx9cPG+1OwA5DfxXhvyvCjv
 6oOSS+gaOV2wBrhGCz5bRclAN3LDMDFwjwfcDdlc7z7KUpJ44fWXi3FHcSvB6hXUDLSXzC361GB
 3rESJnwE7beWBsmzOFPkHdvjSvaXsil0sseYstVZoHs4bVFT4gVRtD/0+64P4CkyDJQ4kpxYK3Z
 he3RpQ1akkRuff0JmCbd50c3smDhO/nHhKal/J1Rx05JeSyaF9bV6+sTGuiiL+IwWyY+MSvCFTu
 GuARc5Cx9bRPG1/U7+V+09IQgApXpjHrAGWXocYntPmyRcLIhNmewXdu0SJJAOKrLqC3/o4m0wW
 UtRk9qxO5wIQs7+cBeW/kG+CVkK7H+BhoGizw/mC7a7GNCLJ+8k7t8Mw2u9ghRyQqRxXYaD8zlX
 BXJ6Z05N+pCHBpOIZGjRBXyDWXeYkbk74RTjbXM7QEYoc++5N2QaeRr+hJxTQN7+h+JxCJlGHR/
 mjvDwccIlqvEPDzuhE4mB327nc10KvLuu6+uCl18YOB5t1vXd+91vLIypq8hyEGDff2zQ29Hyg6
 vzBYqAaxefiiAWIN9sZnUDVQzrzgpqzWwKCXWjog113vaO4y4/2J/8aTDfiuP0dChPs3DuTjwkR sgK5iD1yMaqp1zw==
X-Mailer: b4 0.13.0
Message-ID: <20241015-tracepoint-v11-2-cceb65820089@google.com>
Subject: [PATCH v11 2/5] rust: add tracepoint support
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
	Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_061530_470053_5C33EA82 
X-CRM114-Status: GOOD (  27.58  )
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

Make it possible to have Rust code call into tracepoints defined by C
code. It is still required that the tracepoint is declared in a C
header, and that this header is included in the input to bindgen.

Instead of calling __DO_TRACE directly, the exported rust_do_trace_
function calls an inline helper function. This is because the `cond`
argument does not exist at the callsite of DEFINE_RUST_DO_TRACE.

__DECLARE_TRACE always emits an inline static and an extern declaration
that is only used when CREATE_RUST_TRACE_POINTS is set. These should not
end up in the final binary so it is not a problem that they sometimes
are emitted without a user.

Reviewed-by: Carlos Llamas <cmllamas@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 include/linux/tracepoint.h      | 28 ++++++++++++++++++++++-
 include/trace/define_trace.h    | 12 ++++++++++
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/lib.rs              |  1 +
 rust/kernel/tracepoint.rs       | 49 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index 0dc67fad706c..84c4924e499f 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -225,6 +225,18 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 			preempt_enable_notrace();			\
 	} while (0)
 
+/*
+ * Declare an exported function that Rust code can call to trigger this
+ * tracepoint. This function does not include the static branch; that is done
+ * in Rust to avoid a function call when the tracepoint is disabled.
+ */
+#define DEFINE_RUST_DO_TRACE(name, proto, args)
+#define __DEFINE_RUST_DO_TRACE(name, proto, args)			\
+	notrace void rust_do_trace_##name(proto)			\
+	{								\
+		__rust_do_trace_##name(args);				\
+	}
+
 /*
  * Make sure the alignment of the structure in the __tracepoints section will
  * not add unwanted padding between the beginning of the section and the
@@ -240,6 +252,7 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	extern int __traceiter_##name(data_proto);			\
 	DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);	\
 	extern struct tracepoint __tracepoint_##name;			\
+	extern void rust_do_trace_##name(proto);			\
 	static inline int						\
 	register_trace_##name(void (*probe)(data_proto), void *data)	\
 	{								\
@@ -271,6 +284,12 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 
 #define __DECLARE_TRACE(name, proto, args, cond, data_proto)		\
 	__DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), cond, PARAMS(data_proto)) \
+	static inline void __rust_do_trace_##name(proto)		\
+	{								\
+		__DO_TRACE(name,					\
+			TP_ARGS(args),					\
+			TP_CONDITION(cond), 0);				\
+	}								\
 	static inline void trace_##name(proto)				\
 	{								\
 		if (static_branch_unlikely(&__tracepoint_##name.key))	\
@@ -285,6 +304,12 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 
 #define __DECLARE_TRACE_SYSCALL(name, proto, args, cond, data_proto)	\
 	__DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), cond, PARAMS(data_proto)) \
+	static inline void __rust_do_trace_##name(proto)		\
+	{								\
+		__DO_TRACE(name,					\
+			TP_ARGS(args),					\
+			TP_CONDITION(cond), 1);				\
+	}								\
 	static inline void trace_##name(proto)				\
 	{								\
 		if (static_branch_unlikely(&__tracepoint_##name.key))	\
@@ -339,7 +364,8 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	void __probestub_##_name(void *__data, proto)			\
 	{								\
 	}								\
-	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
+	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);	\
+	DEFINE_RUST_DO_TRACE(_name, TP_PROTO(proto), TP_ARGS(args))
 
 #define DEFINE_TRACE(name, proto, args)		\
 	DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
diff --git a/include/trace/define_trace.h b/include/trace/define_trace.h
index ff5fa17a6259..0557626b6f6a 100644
--- a/include/trace/define_trace.h
+++ b/include/trace/define_trace.h
@@ -76,6 +76,13 @@
 #define DECLARE_TRACE(name, proto, args)	\
 	DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
 
+/* If requested, create helpers for calling these tracepoints from Rust. */
+#ifdef CREATE_RUST_TRACE_POINTS
+#undef DEFINE_RUST_DO_TRACE
+#define DEFINE_RUST_DO_TRACE(name, proto, args)	\
+	__DEFINE_RUST_DO_TRACE(name, PARAMS(proto), PARAMS(args))
+#endif
+
 #undef TRACE_INCLUDE
 #undef __TRACE_INCLUDE
 
@@ -134,6 +141,11 @@
 # undef UNDEF_TRACE_INCLUDE_PATH
 #endif
 
+#ifdef CREATE_RUST_TRACE_POINTS
+# undef DEFINE_RUST_DO_TRACE
+# define DEFINE_RUST_DO_TRACE(name, proto, args)
+#endif
+
 /* We may be processing more files */
 #define CREATE_TRACE_POINTS
 
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index e0846e7e93e6..752572e638a6 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -20,6 +20,7 @@
 #include <linux/refcount.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/tracepoint.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 708ff817ccc3..55f81f49024e 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -54,6 +54,7 @@
 pub mod sync;
 pub mod task;
 pub mod time;
+pub mod tracepoint;
 pub mod types;
 pub mod uaccess;
 pub mod workqueue;
diff --git a/rust/kernel/tracepoint.rs b/rust/kernel/tracepoint.rs
new file mode 100644
index 000000000000..c6e80aa99e8e
--- /dev/null
+++ b/rust/kernel/tracepoint.rs
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Logic for tracepoints.
+
+/// Declare the Rust entry point for a tracepoint.
+///
+/// This macro generates an unsafe function that calls into C, and its safety requirements will be
+/// whatever the relevant C code requires. To document these safety requirements, you may add
+/// doc-comments when invoking the macro.
+#[macro_export]
+macro_rules! declare_trace {
+    ($($(#[$attr:meta])* $pub:vis unsafe fn $name:ident($($argname:ident : $argtyp:ty),* $(,)?);)*) => {$(
+        $( #[$attr] )*
+        #[inline(always)]
+        $pub unsafe fn $name($($argname : $argtyp),*) {
+            #[cfg(CONFIG_TRACEPOINTS)]
+            {
+                // SAFETY: It's always okay to query the static key for a tracepoint.
+                let should_trace = unsafe {
+                    $crate::macros::paste! {
+                        $crate::jump_label::static_branch_unlikely!(
+                            $crate::bindings::[< __tracepoint_ $name >],
+                            $crate::bindings::tracepoint,
+                            key
+                        )
+                    }
+                };
+
+                if should_trace {
+                    $crate::macros::paste! {
+                        // SAFETY: The caller guarantees that it is okay to call this tracepoint.
+                        unsafe { $crate::bindings::[< rust_do_trace_ $name >]($($argname),*) };
+                    }
+                }
+            }
+
+            #[cfg(not(CONFIG_TRACEPOINTS))]
+            {
+                // If tracepoints are disabled, insert a trivial use of each argument
+                // to avoid unused argument warnings.
+                $( let _unused = $argname; )*
+            }
+        }
+    )*}
+}
+
+pub use declare_trace;

-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
