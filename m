Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6068EC3065B
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 13:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GyBWTrmuIigZeDwciNH+DfgBR5tDRsf2t/yJ8TZxxFc=; b=gCAOwY5ee2JPN7GQaEkkXGgIMD
	htcBHgDO8Stxh9bRRtu9JpxcJUgC7/pHsrBVEmW68tXssiXz5FKBzse1GgHxBEFHlk63FTzMvTbtu
	Bqej59Lcy4mRHoHS3K6sYW/4T0Q3ZWo+6qAuPtK/Iwztbpx7BGUPx37BJxBVPK+odCHB+S68Kf80p
	EMYYL7MSd20JgezY/Hen9ThJntRubwOuys+7FOp+DtsaN4ptHSqYkzglLyEElGpt2RIo+ux6vdJdd
	7BySXCFMhGKv8eIiMFxNQXwqv0+m73Ihejq7chgkKGv110H9N7fT94lSGsxF2rhzYufumQRP01p56
	NnmnKQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNBaL-0000000Do9g-3GEY;
	Fri, 28 Jun 2024 13:24:17 +0000
Received: from mail-lf1-x149.google.com ([2a00:1450:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNBaH-0000000Do6F-461t
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 13:24:15 +0000
Received: by mail-lf1-x149.google.com with SMTP id 2adb3069b0e04-52cd90d8da1so699416e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 06:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719581051; x=1720185851; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=969O3CWF12Jm+ipcoNEWf7U/TfwGyBpHNp6wtcZC710=;
        b=KAktD8q50xXy7EIay7bPzsfex4mDJ107zI77eM4Eb3h0uPpoMqPl6eTzTC/GcQPMFo
         /+GYEgSjbaT4oQqJfttIMLqxbSuyUGYqdCNls3iIAgMs5RsI0QhtgqFrTVVv7U3vmDnA
         mMBZq+KswB3XL+crcIa66WmY85d2vjFWe1v43mAdZGjMN8vAgM5jlhrTDDh455A+f06m
         GTNyHrCF/jBHVCvE6lLpbJmIInaYRKoUVrW0uPwfp10PuLXJJ7TtdzQocAtg1w2EM0gY
         GX837H1VPIumwknfPB9ET2jpVP2efFiubTuA0l1O7rf6MN0d1oW3+tlHyvvjHUIcoV9G
         Kphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719581051; x=1720185851;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=969O3CWF12Jm+ipcoNEWf7U/TfwGyBpHNp6wtcZC710=;
        b=C1pxYcYu6Mz92ySSOpeesUPy+lGZa99wxg/eE8D8oVg4DsR7mnYSKMjVaUG6a6vGWJ
         xqUkZ+CccgO+wqZs/gmEB4n1/qCduP7BzCFZREt2Jic9nKzZQIWjjqrEGGws7Z4XyhYq
         6fLm3BpgMJXyayqHSv5jybgHyR4c2V0kCn4fGteH/UK5FvonyL+LzBT6xl7Ngmf5sYiw
         ZO6E+LKe8QBqPtxbeWPqInCuUu/bM2sDaRR3fIggUrNVE/8xhv4nOcqtOqEnYz8ZT7aE
         Y9pKlPdyGYTvL/Wfu5X8TB5WWYwg5upIwaKSPxqi8DM9lnhyb1rHAR2lqgpdY5wWQEg0
         tK1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhZVq6shXSHFavgrS+qT3My+kvT1Rui/e01DVYN3bPvwjvkdScTTH9vnTjoUbsPXIKwZLfJZnPCXWF76/gKVcj/hHU+t9OS4+TE82AFPG7
X-Gm-Message-State: AOJu0YwdpdwOpzQdyhetN9We7TOhoaQLuv+HLfu4715wael34gyE7Qa2
	Qg9fg1ZaQ2xHO9vkkbnwnlkR85nCAeoL8z9/lSSBSO2k/GLEheBU7w1+sYNPUJC0wd76wehx3NT
	/eeMzHBp7S+GpoQ==
X-Google-Smtp-Source: AGHT+IHOuhMH8lCZyqgPZo0IUCZguSKcNbXCdaWjj3cdEvBVq1Q+0LN7WSNqoq7E7NvkH+V+nQUqXL0VRBCHifE=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6512:3e28:b0:52c:7f96:81d1 with SMTP
 id 2adb3069b0e04-52ce061ab41mr20614e87.6.1719581050857; Fri, 28 Jun 2024
 06:24:10 -0700 (PDT)
Date: Fri, 28 Jun 2024 13:23:32 +0000
In-Reply-To: <20240628-tracepoint-v4-0-353d523a9c15@google.com>
Mime-Version: 1.0
References: <20240628-tracepoint-v4-0-353d523a9c15@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5954; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=v/CwpANb/enEE59VpWuqO+vG2Bs6iq8UapwpRJZ9hQA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmfrlxFoRsS4nKuM5f791HMS0zaizWUN/GuWPSF
 5DmAsQIie+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZn65cQAKCRAEWL7uWMY5
 Rnn4D/9tLGOpO3gm1Mdg7+V3aBKPndVvoDIfPVKiSkD+ATgpOSjsralpHwXujxhx1IqP3lYgOdz
 F4tE/qK42GPiG2qOTjpSpJDaMSQfw1d9ndqFJp3KG71VnpHJGL3k4nwnKr4SGu5BoznL6eyv+wX
 GMjXIqpL1Aml+w5cF+MMfEs4FjjCVM/HRlpM4z5A/gCBUEAQqixk+LexC5R/qvVJJYOxiqTALFu
 idNa0gDOJwenzkvtOUM8hu1iBrNFC9/7BtwnCQ6dY14wy+j1zXRNORSmO4KK7TqxLuqtVRpBRm+
 +ZFo3ePJ2Cv3ppirCqmoxPx2ntkTkPSMtU32nFAWBumNIIUDyH+gG/XFzLYK3nFLghDsB8WjPpZ
 FpJDBtbmHzuGz4yQU3sNeN6piB8QumLbHKi3cHoLdujMGDkno25gVUSRCXe7h70q0g1x2RlEmjg
 sFElazH5qpsztWiLuPlFMNPJo7W6iijAV0RGTCLtTYg+NNrInG+xze+KV4I/vuK6GiZkTbR4X21
 YDrhSxVEt4S5Kv0bycWgW7FOOGIlWo7tDcn61JvMW8f9acRFHeVsKElIdbwzOnt1ThoUpvUbw7I
 HwsSEBS9BKACnoLcUCP1aDFTlZqDkmUTMcefFdHWM/6jPz92m7LbDPq2vWSCFmM2u/rum1QCrjY 6gmxPd34WQQHtZA==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240628-tracepoint-v4-2-353d523a9c15@google.com>
Subject: [PATCH v4 2/2] rust: add tracepoint support
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
	"H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)" <peterz@infradaed.org>, 
	Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
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
X-CRM114-CacheID: sfid-20240628_062414_027991_9A0B8CB7 
X-CRM114-Status: GOOD (  23.85  )
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 include/linux/tracepoint.h      | 18 +++++++++++++++-
 include/trace/define_trace.h    | 12 +++++++++++
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/lib.rs              |  1 +
 rust/kernel/tracepoint.rs       | 47 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index 689b6d71590e..d82af4d77c9f 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -238,6 +238,20 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 #define __DECLARE_TRACE_RCU(name, proto, args, cond)
 #endif
 
+/*
+ * Declare an exported function that Rust code can call to trigger this
+ * tracepoint. This function does not include the static branch; that is done
+ * in Rust to avoid a function call when the tracepoint is disabled.
+ */
+#define DEFINE_RUST_DO_TRACE(name, proto, args)
+#define DEFINE_RUST_DO_TRACE_REAL(name, proto, args)			\
+	notrace void rust_do_trace_##name(proto)			\
+	{								\
+		__DO_TRACE(name,					\
+			TP_ARGS(args),					\
+			cpu_online(raw_smp_processor_id()), 0);		\
+	}
+
 /*
  * Make sure the alignment of the structure in the __tracepoints section will
  * not add unwanted padding between the beginning of the section and the
@@ -253,6 +267,7 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	extern int __traceiter_##name(data_proto);			\
 	DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);	\
 	extern struct tracepoint __tracepoint_##name;			\
+	extern void rust_do_trace_##name(proto);			\
 	static inline void trace_##name(proto)				\
 	{								\
 		if (static_key_false(&__tracepoint_##name.key))		\
@@ -337,7 +352,8 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	void __probestub_##_name(void *__data, proto)			\
 	{								\
 	}								\
-	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
+	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);	\
+	DEFINE_RUST_DO_TRACE(_name, TP_PROTO(proto), TP_ARGS(args))
 
 #define DEFINE_TRACE(name, proto, args)		\
 	DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
diff --git a/include/trace/define_trace.h b/include/trace/define_trace.h
index 00723935dcc7..08ed5ce63a96 100644
--- a/include/trace/define_trace.h
+++ b/include/trace/define_trace.h
@@ -72,6 +72,13 @@
 #define DECLARE_TRACE(name, proto, args)	\
 	DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
 
+/* If requested, create helpers for calling these tracepoints from Rust. */
+#ifdef CREATE_RUST_TRACE_POINTS
+#undef DEFINE_RUST_DO_TRACE
+#define DEFINE_RUST_DO_TRACE(name, proto, args)	\
+	DEFINE_RUST_DO_TRACE_REAL(name, PARAMS(proto), PARAMS(args))
+#endif
+
 #undef TRACE_INCLUDE
 #undef __TRACE_INCLUDE
 
@@ -129,6 +136,11 @@
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
index ddb5644d4fd9..d442f9ccfc2c 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -15,6 +15,7 @@
 #include <linux/refcount.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/tracepoint.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index fffd4e1dd1c1..9ae90eb69020 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -46,6 +46,7 @@
 pub mod sync;
 pub mod task;
 pub mod time;
+pub mod tracepoint;
 pub mod types;
 pub mod workqueue;
 
diff --git a/rust/kernel/tracepoint.rs b/rust/kernel/tracepoint.rs
new file mode 100644
index 000000000000..1005f09e0330
--- /dev/null
+++ b/rust/kernel/tracepoint.rs
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Logic for tracepoints.
+
+/// Declare the Rust entry point for a tracepoint.
+#[macro_export]
+macro_rules! declare_trace {
+    ($($(#[$attr:meta])* $pub:vis fn $name:ident($($argname:ident : $argtyp:ty),* $(,)?);)*) => {$(
+        $( #[$attr] )*
+        #[inline(always)]
+        $pub unsafe fn $name($($argname : $argtyp),*) {
+            #[cfg(CONFIG_TRACEPOINTS)]
+            {
+                use $crate::bindings::*;
+
+                // SAFETY: It's always okay to query the static key for a tracepoint.
+                let should_trace = unsafe {
+                    $crate::macros::paste! {
+                        $crate::static_key::static_key_false!(
+                            [< __tracepoint_ $name >],
+                            $crate::bindings::tracepoint,
+                            key
+                        )
+                    }
+                };
+
+                if should_trace {
+                    $crate::macros::paste! {
+                        // SAFETY: The caller guarantees that it is okay to call this tracepoint.
+                        unsafe { [< rust_do_trace_ $name >]($($argname),*) };
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
2.45.2.803.g4e1b14247a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
