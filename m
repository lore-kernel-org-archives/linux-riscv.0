Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A846DC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 09:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/pcLjyfO8EIjNOMRGQt21w9fm5e7uMUV+ZzzIvuPenM=; b=HuG7Pp4nTT1U08Lc6FEnl+irE9
	GWDRDCeuIf4lEL/ULxYFRAJQlMDk7sf1EzuHCxmuZbP1sdbou+aIo34e8cAcXTaz1GdjbkmXuHeAd
	jovHBbpx8wjuMsW4XosOjKC6s5QcIUOUvduBK3ABzIAPmgRLAlo8pM5fMFQoMOm9stJm6uaPy8Bc0
	NkNa/IKa61jpqqxin+eHJoM4I35mt1GyeqakBuxF088uqwq9oCVXBv2TXxeSTlQq83iSoCya8O+4r
	L2QDzhKUYcKHYnrkiQ8l7OllD3cAnAy7pxRWmiZvs5MQAkTkhmO+8PQch8fuzF3WFIqC/o1iTNY3c
	2WdOrGPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZodu-00000008I3a-3HEe;
	Fri, 02 Aug 2024 09:32:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZodt-00000008I2b-0owI
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 Aug 2024 09:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pFX002WF5KycYvj+q55NDLygad2v8oW7DNGZypmpcz0=; b=mQaaKKj56KcTBVXNQxW9eVDJmL
	ZMGdl+43i+iqWHdUPIxL8CPNmQHyleG4Ib1J/5yPZ/hCUsb55qkfp77Z62OQbRoFkJpuvZuZ6gxOd
	MuedZ9yXec6Cz3CzlA2vm6pquwjYLCci7XM1iUplJwGleIoWpd0PMscMN9qJCW293lKjBAxH7aTVf
	nISJUjAkXasKCrjLUZAsXqMw3NjqzztWLfNxVw6lOM65GQi8fVXfk9RFsk+2aMdoDFoF6RVlVY5BJ
	U1jtUhQAIPvI0AlmlSC2zQm/GraU5orKMoKnpULeZy++WNTm9GiMNcu9GpypaMewieZf+mShyoB3E
	hN0pZ/Sg==;
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZodo-00000005fat-3fe3
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 09:32:07 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3685a5a765fso3691793f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 02:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722591119; x=1723195919; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pFX002WF5KycYvj+q55NDLygad2v8oW7DNGZypmpcz0=;
        b=I3BfnGir4sV+GklfetIFltQ1BYvhSPHe2hL5p4/CHp37MTzeAzaNJ7+D+AbgfS8MMn
         MrXtMTWgZN+zDKyD4IkVFP8GJoC09Nv5og5wHkweqzgDl4lNFAtGYQg+En1DdDxWDw2N
         tVMX7rkloJDX+Dyq7s9KhuLJPWAwr0PQR1AHfxK3hQrbZf5m6gsovSlke4Z5fv1hia/l
         aS8Tj+h2bhPSU8GTeqggqJBcNbU7sa8X1VVg1L6YZjsTOazRmd4CODIoZ2hR95nJ/Q34
         qStlOqTywVnGqigSdVeoclREYrl9oGtkAuQPjlENYjApyco76gBIAJQytttkzoxfqyfc
         z++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722591119; x=1723195919;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pFX002WF5KycYvj+q55NDLygad2v8oW7DNGZypmpcz0=;
        b=R+tEyDLuXij0yoSyu/flA2Iv3QiP1KycJfRZx1MJoEQ8Huou0Q9rkec+rvPef81+ku
         x3mjQA7S1dULXPupMQVMkyJXvTMKJtGGX2IcnrekY+nhG+CO//KMGzR9EYvUaW53Dr3z
         9XrJKZTqISpWNCQXSSVbb+cMrZxNjQCx+aCzDu8dc+dDZ3k2HS1Po35vX9KI2FVbsryV
         rKQcrPFRhxgfIO3yskZ/o2JcxmkJhwADObSxyHUdc/HDIXIRWV1IRv5eKxbiSz5qul8I
         sDJ0H6CYCqeMIs38X/8/jY6gYYYX37EYiD20MAWSLH1BkEAkIYyHnmrfaCVxFzsxNtlC
         Rccg==
X-Forwarded-Encrypted: i=1; AJvYcCXK0M28MVG3kA5+vKHPczMSbRodt3e72NdxSDiytfuz2yO242NrnXtnJ87ZpXxkgJFPrX1E+o7//hTw31jspqqxE0xvoDV7NmYhOFfNZqme
X-Gm-Message-State: AOJu0YwDtlxTCE+tbkq2HNDKsBiRo1TlXYw1p6g0NO+0GORyXZKEpPp5
	1hvUILYol7YQfIFe+5mOaumYPSGsvuQVbKS3teSAUFba+YVKAfehrGksu0loJEzf1YVAKs/KX7V
	zSRf+p8NPyn3UZQ==
X-Google-Smtp-Source: AGHT+IF6TeSE4s9eo+99KIz96YHlhNQA6ZSJ6aPAHp3y6TccqHauRJLpWLajZIVv2ZcexsnAul3c4G3kS9jn4ac=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a5d:4a49:0:b0:367:8f81:2086 with SMTP id
 ffacd0b85a97d-36bbc0c268dmr3057f8f.3.1722591118384; Fri, 02 Aug 2024 02:31:58
 -0700 (PDT)
Date: Fri, 02 Aug 2024 09:31:28 +0000
In-Reply-To: <20240802-tracepoint-v5-0-faa164494dcb@google.com>
Mime-Version: 1.0
References: <20240802-tracepoint-v5-0-faa164494dcb@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6821; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=w0kjkNp9tXlUo73XWRVbps/1uhcBH0l+7rWOWIsb964=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmrKeGhEkip34Q57vcFdE7eAZCn8m33EEqxM86s
 0iQvqOQFKGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZqynhgAKCRAEWL7uWMY5
 RnLNEACz4FN/ONZ7Vt9T1opNcvYM0M1wnNDNzPcCJVfPGUgOOXaPaqXXozfu2ApS6kqEaBAAIw2
 jmFl+Luvdm/Dc+ITPOn9yqJdJ2lNZU9voXBpEssxVH+3TOlfNRn+9/MA8s4qzx1kEpzpX9TPZfR
 LsxFJQrNmp7EFcr/AS+esS8K89ZItQezsxbMNeVeIivkqs5juoxhLg06cvOTp488pwN9KIcIwNr
 M7KTeOVqZETJOZrScjCWw8WQ9udaxlHY5w8XcCF6+Kgw5gXMMCulYgxyVigHok6zIK8WpeRONdN
 Lj2yBJB7eiPyQ27XrASFlSz3SjqzeK55VfDJlAAu36xQHhXy94+KlZkkthdV7dxAJy6fFF0bkL2
 O6KYmORTKz8V7vehTZ0c36Iq0euccI1UtxBmR2rCMMoqV/oI/wTNwTwXRDTjMAXKE4up5znQFlb
 6Ysqrc9uXVAiKGPZDaPwXYPX6exhQo1Q/JRMFRUoejHXYPyQ9XhDlfp8568aFNP+cd+Jt+Mbpsz
 0uKE3uQyWMyrpU3lwlDL3hbFxNbh8RpVDNfW6L9T8PqbHE7j1eBq5k2VG7lGyQwq4y6Mev1FRuv
 XTFGZ+Ejy0DS7DWzMIsPa8Wvmv7PvdN0BRrBpmu4LePqlgzIN2wktBWcKnfhmuRkzjpiXbRKagC vcc8t+dAXUfcPRQ==
X-Mailer: b4 0.13.0
Message-ID: <20240802-tracepoint-v5-2-faa164494dcb@google.com>
Subject: [PATCH v5 2/2] rust: add tracepoint support
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
	Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_103205_577340_B24F45CE 
X-CRM114-Status: GOOD (  27.12  )
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
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 include/linux/tracepoint.h      | 22 +++++++++++++++++-
 include/trace/define_trace.h    | 12 ++++++++++
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/lib.rs              |  1 +
 rust/kernel/tracepoint.rs       | 49 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index 6be396bb4297..5042ca588e41 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -237,6 +237,18 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 #define __DECLARE_TRACE_RCU(name, proto, args, cond)
 #endif
 
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
@@ -252,6 +264,13 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	extern int __traceiter_##name(data_proto);			\
 	DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);	\
 	extern struct tracepoint __tracepoint_##name;			\
+	extern void rust_do_trace_##name(proto);			\
+	static inline void __rust_do_trace_##name(proto)		\
+	{								\
+		__DO_TRACE(name,					\
+			TP_ARGS(args),					\
+			TP_CONDITION(cond), 0);				\
+	}								\
 	static inline void trace_##name(proto)				\
 	{								\
 		if (static_key_false(&__tracepoint_##name.key))		\
@@ -336,7 +355,8 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	void __probestub_##_name(void *__data, proto)			\
 	{								\
 	}								\
-	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
+	DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);	\
+	DEFINE_RUST_DO_TRACE(_name, TP_PROTO(proto), TP_ARGS(args))
 
 #define DEFINE_TRACE(name, proto, args)		\
 	DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
diff --git a/include/trace/define_trace.h b/include/trace/define_trace.h
index 00723935dcc7..8159294c2041 100644
--- a/include/trace/define_trace.h
+++ b/include/trace/define_trace.h
@@ -72,6 +72,13 @@
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
index b940a5777330..142ee71ae7c4 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -19,6 +19,7 @@
 #include <linux/refcount.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/tracepoint.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index da1f69868d0d..64f2b09920e3 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -52,6 +52,7 @@
 pub mod sync;
 pub mod task;
 pub mod time;
+pub mod tracepoint;
 pub mod types;
 pub mod uaccess;
 pub mod workqueue;
diff --git a/rust/kernel/tracepoint.rs b/rust/kernel/tracepoint.rs
new file mode 100644
index 000000000000..69dafdb8bfe8
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
+    ($($(#[$attr:meta])* $pub:vis fn $name:ident($($argname:ident : $argtyp:ty),* $(,)?);)*) => {$(
+        $( #[$attr] )*
+        #[inline(always)]
+        $pub unsafe fn $name($($argname : $argtyp),*) {
+            #[cfg(CONFIG_TRACEPOINTS)]
+            {
+                // SAFETY: It's always okay to query the static key for a tracepoint.
+                let should_trace = unsafe {
+                    $crate::macros::paste! {
+                        $crate::static_key::static_key_false!(
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
2.46.0.rc2.264.g509ed76dc8-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
