Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE8DC52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 12:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iHiOuWi1LCrCLlIWs39Rsb1iRox5iY606vEU71zx5po=; b=0kIZioRDrpgWANNXNg7K+wdd/w
	5UsC0fREzbTZKl1/lFHuKySFIbsnnkorsMbo/toVlFOw69tDOesCAbjCke38EU9vD1N022CLFSRAz
	LCtodJHQL2sfP/N2Unwncjmt3bTYY0grGFF8EpSbqbolK+N0sXYJZ3SIJVtmZNXIMrVDwUAa5C83J
	jRQRZ9LqXUg/7jEiPaHj2QoLlYCd3ByJcbJl/We7Qb18sUGBNDpIDiD/c/yBvhQKm+/Ea6rIK9D0R
	ZlvZB9BZnivVIwY9AG2IfeQ1ckZBdJqt0z3Su3gQXyr8Hug2tAN0N15GM3GL5qPkNUg3CNbIbXJJ7
	IRRvEW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh6Yq-0000000ChL2-0vZY;
	Thu, 22 Aug 2024 12:05:04 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh6Yg-0000000ChCY-2x2t
	for linux-riscv@lists.infradead.org;
	Thu, 22 Aug 2024 12:04:56 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-371881b6de3so339119f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Aug 2024 05:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724328292; x=1724933092; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m06R8rBHhIV+fNfH7++C5Q7rVR6HteIR9+x3IVgvVo0=;
        b=HHx4f3KB/+P/Tb/lWIZXs81y7gAtncjJWO28ZiQ3QntpWXDIqKDoKNARk3k41GkNDp
         XEhlmlneAA5GlDm4SUNzMdPAUyH4NSQfWmtnNy/suf7od037jCIVDZYPSUtlbM/LD9Ur
         P3g0M4irVPJKJZj+RqFNDz9cVusuI+GBWH7FMoVDh4GDAkNMfb2aSSzvKmOdd+TVbA4M
         nMLMeIRVX9wMVBD8yBHn3VPl30vgT0Y0Zpf7qzqhEpxjbAzyUtVz9zh7SOIAVMpg+stP
         dE1Dboco5RCssBIjgoq4Q9CO7X+FUEspdPq9n+IDSix1lnN7jVnu8td2Ff5biBCDo94/
         slWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724328293; x=1724933093;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m06R8rBHhIV+fNfH7++C5Q7rVR6HteIR9+x3IVgvVo0=;
        b=Ti+AAcWZNWShtvWZ8Qtk8zz6ODssclSnSb+NezaXfXS0M3qs2CyTmfvMq7veowZq/B
         DBIJm0qWFcc+OLJt//yRqCqWsAOtLYgmArdSJU8YDOFzJ4xDmY4MHSS/5SuL8qGeS0wQ
         pDK++Cje+I9HHiCyvT7TmOvNNmc9OpD94N32rqFOjbzPU7pLjrW7HVpWdYgCAXboy0Eh
         3zULzktdyR10Ez4pi8bAKNrh+hLeUNrIqnTRkoYwGT1Xtwq45XCFr6Foxia1xsDNF31a
         UTPZRYpN1twuNsi+r/91+4g7ia8HsEoNZIVrbBMBo+t0lol4FhwVWu5vZM6dM7JyoP1f
         OSUA==
X-Forwarded-Encrypted: i=1; AJvYcCUOyVbbfoJV/7zKNQaIUq/JAcAcSw94AUYf3RAY2JdKxHHd7rdepy+eiCCbzIAuHRL8bz6cm2V4w96r5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUR8jIRq+X6pi4oB/JWXtarkfVH++Apt7qlp+aCqgFVOBKKHyd
	bm0flJ3UYkD8oquGVW+PuR3bOaV5W4hTbfWSw8gYsb0mGZnd5w3NDWVbqBdgVkGqbB6etktfGke
	pdq78igr1uCOXZA==
X-Google-Smtp-Source: AGHT+IERBhVv08A2uZv+MpnM9lKKuFpvF/ldKWmNQbSwx22l+/nHv3lZyxTumbSPIvwOOIsyXNIWmCzz19pCed0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:6000:2ad:b0:371:9373:5078 with SMTP
 id ffacd0b85a97d-372fd59721cmr11543f8f.3.1724328292363; Thu, 22 Aug 2024
 05:04:52 -0700 (PDT)
Date: Thu, 22 Aug 2024 12:04:13 +0000
In-Reply-To: <20240822-tracepoint-v8-0-f0c5899e6fd3@google.com>
Mime-Version: 1.0
References: <20240822-tracepoint-v8-0-f0c5899e6fd3@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3678; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=x4Fj8n509ULmZ45N1WACwPWEQuAc2oLxAGwmKjHodr0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmxylcN8mcEXadzOJVoentM5FyVm0c7KXiYJoT5
 nryZ6UFTe2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZscpXAAKCRAEWL7uWMY5
 Rh5pEACltjdooXrOi5jfHOH3q4t2NrSAWmz0Wzo7scorn20GnCAwxRr3y/CF07ko6cGGlugqo7w
 fw59+gzaz0SDqS70pEVZt5qbsa21Mbm1GrJKocf2mXPLC9onKsU9xOyLlPXlxi+o89Ln3Lo729R
 IKu+oYEF5yDZC0nRxFTEZsX0YJ/bNKZwEMFsYem9WSrjI4ifDw7HDPifTLoRh1HRJmBRciDe9+f
 V7Tm/sST0aeMNPsFLh/eCQsQvL4Bf916kOL0jkbZGKSoSS4gJPTDf2569fmJ0PU/Z7/62qsKJaw
 paEkLJnj/MQLxgslDQ8lazmAMMDoQYH0CqrkBlIzksOwB0ftEuQI3hrV7ELD/5AnUCrup2fWscm
 jtounuZ8L6EpPLOCSAdPObnCCNgNTpIO3CcN6wt+GW8Flc7OsncgAq2qa8JDNUesF4jHVm9v9u4
 hX2UZM5ou9VSVpxvlf2oOYTmZPnNyvrL9DZu9LjXnEwwg+qXpgQKvEvDY6ufRj+kC8SedA+UB3F
 ulk9WotpkJkTv4PxvDq1h9XI4djWh4uXsdrRizqa+QZAMv/1vjm8bMkaFkElesH5gA5akc2m1NP
 sNi8Jr2dh7/sqpvIvYrOucLMAcK/bzi7/M17+DSgo1+PyKsqSqlwBJiDqkeh3uvgJJRRh7MaE3U UHQDUWgEeb5N4nQ==
X-Mailer: b4 0.13.0
Message-ID: <20240822-tracepoint-v8-1-f0c5899e6fd3@google.com>
Subject: [PATCH v8 1/5] rust: add generic static_key_false
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
X-CRM114-CacheID: sfid-20240822_050454_908568_C4A4CD4F 
X-CRM114-Status: GOOD (  20.23  )
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers.c                  |  9 +++++++++
 rust/kernel/jump_label.rs       | 29 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 4 files changed, 40 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index b940a5777330..8fd092e1b809 100644
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
diff --git a/rust/helpers.c b/rust/helpers.c
index 92d3c03ae1bd..5a9bf5209cd8 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -28,6 +28,7 @@
 #include <linux/errname.h>
 #include <linux/gfp.h>
 #include <linux/highmem.h>
+#include <linux/jump_label.h>
 #include <linux/mutex.h>
 #include <linux/refcount.h>
 #include <linux/sched/signal.h>
@@ -133,6 +134,14 @@ bool rust_helper_refcount_dec_and_test(refcount_t *r)
 }
 EXPORT_SYMBOL_GPL(rust_helper_refcount_dec_and_test);
 
+#ifndef CONFIG_JUMP_LABEL
+int rust_helper_static_key_count(struct static_key *key)
+{
+	return static_key_count(key);
+}
+EXPORT_SYMBOL_GPL(rust_helper_static_key_count);
+#endif
+
 __force void *rust_helper_ERR_PTR(long err)
 {
 	return ERR_PTR(err);
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
index 274bdc1b0a82..91af9f75d121 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -36,6 +36,7 @@
 pub mod firmware;
 pub mod init;
 pub mod ioctl;
+pub mod jump_label;
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
 #[cfg(CONFIG_NET)]

-- 
2.46.0.184.g6999bdac58-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
