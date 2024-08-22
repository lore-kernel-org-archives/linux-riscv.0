Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6581DC52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 13:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jVX1Ahit16+YESPMGnl+hnR2PWRVmHYdvms3QJTp7EQ=; b=wOdd3y0awYO1pShDe+Py3ZHa8k
	lrnD8h3TDJUL19HRXINqJCmPOEsJOuUruo4uCvF7PCguWz0HH5aUakNsCj9rw+2Fej7vy85JOSphu
	3XKeqhLhjdvtF6iyLsSoOQOOMgHRKsvR7UAEmDx/ghIM6h79zqYB/5lgJqwRSKUIGWUZNY1/63Xp7
	9Jd/JlAzBCRJjcKQLmS4E2mYs3wVb9fdGbNJgS1oQIoL5ylZLar9Vzt8YdQNuQ/t4DisHjeG+pgjl
	ipNtyv6FNDoA1YODGNE4JI1AzsyNMXzn0x6kJcgfxdovt1CraSiBBIor0+pV2gpgrZpL6b9yM1gyi
	nAsT/9Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh7fP-0000000Ct32-3Fsc;
	Thu, 22 Aug 2024 13:15:55 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh6bs-0000000CiUp-4AB6
	for linux-riscv@lists.infradead.org;
	Thu, 22 Aug 2024 12:08:14 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-42aa70df35eso7296405e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Aug 2024 05:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724328491; x=1724933291; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=naARk6fBMWgAYGgevIE1Y5LEGU4i3ZShVI06qtX0z80=;
        b=e/0vqrQRYzVLhThgonoFaN7M8H2qkPENNf2bhvTRPAfeqFx0FgjWJAmCkpF6+ZbNAb
         ryJs4cKFpvAa+cRslU2H3B4sm6pLgKfS8dZugpZinr48TCHMsdkYOxbWtNtZ18G2kbM+
         lOK9fp/L+VK3Sdm/r/oeGr4L2nwDTSSqZRLUmfyrzIljyB6+YxxE2cCCLtApktTo+mzv
         LmMsmkwVB/1PZDhtq7oyl3SyR4rsOODPQ9CVwAp7K6x4boz7leCa0NVJ1N3QPM1mTf1Z
         gCynv0quUdW8gxNLNvuG2nmR2fThF9lwrm6aGH1g64HsAhDg6vmZ54fUQcq03epXBFRJ
         kH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724328491; x=1724933291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=naARk6fBMWgAYGgevIE1Y5LEGU4i3ZShVI06qtX0z80=;
        b=LJtvJoVTAdYqwUq83Lt567AbNhxtX/ltIdR4QPxznhcxceDZDCkPKvaJ2+ybyTkPS2
         yZUunEJBUgrtVl6eQvmDrLFoMV5vRNqAzq5FF3va79YyNRUcInSedL1fZHbE33n0kpGA
         gjzGtWFmay23xCn1hS6hotwSQypREfiYwSmgYwwfRoerqPjayBOmrj8WfWkp6IKgAVDV
         CGqpuEHdyZNLZVrpOl4gENlVBb42yvooOY65Vsz7pPjC/WeS+FQQ3Nv2+N9t/mWHYL+h
         s6whWzaYHqT4GzT1MtAkk+2Tw2wxWwET1q3jqT0TlfRydUqXnNPh+e+CCfaOkGhdZcpb
         ItCA==
X-Forwarded-Encrypted: i=1; AJvYcCVrDv81FCFZoGvrgMYFDQZS0bxBJ6MXv8psZMWEze9HOXWu+An9LH2A6x53Ta/zIzfrd2dY9DyrCPw/aw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpynjc3phFj38rsKq9/no/0ckHQmdL2IBRFqOiSWy7Tg0MDaNm
	nek5EsOVV8FPf6t5m9VVXcpbBxL8Zc+tD9bgx6hfTTRLQEwFKdFUxOCQkdRGtfwPXd3eR5uYGX1
	2tWuIX8d775f6Hw==
X-Google-Smtp-Source: AGHT+IEyGPJXeWJysEIPI6wD0lhSnVGXUniixtIB5lAxq9kG0NFe6KvQxgYn2CVMHMVUuURWnQ4QiAiTHcwXBdk=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:6b18:b0:424:aa3f:65e1 with SMTP
 id 5b1f17b1804b1-42abd25cb5fmr849535e9.8.1724328490630; Thu, 22 Aug 2024
 05:08:10 -0700 (PDT)
Date: Thu, 22 Aug 2024 12:08:07 +0000
In-Reply-To: <20240822-tracepoint-v8-1-f0c5899e6fd3@google.com>
Mime-Version: 1.0
References: <20240822-tracepoint-v8-1-f0c5899e6fd3@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4177; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=JHM/BUkuA/+cbusgqfq0ytDzqdKx7hEHKUaGhoYxU7Y=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmxynfawVu6X01dRB20ihmTOJOPQpQJzWbIzWrx
 yL2avgJZ7OJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZscp3wAKCRAEWL7uWMY5
 RkrGEACX3xXt4E8r0VZmkmxJiePcgHdkNY7hyfphrwZfNs95eYXkmxp+QjuXTM0LYXfDn5mPC3S
 E/oNrzrrNmhqnAqx9GR4LeLrGWDCftXyo9TFd28s6kNeZABALwmwfrfaGgn2IEtGbx6muhGD+uM
 QdQ7IjC6AHU/P0fg3579y60ArAuJVybjt05kz3GYb+O/COG2BHa4TL8q/RUryS04ivLa18bR7bD
 vvlRYZe7K7+YFtluNZRBSwkNNfu22CovK5DmlX1080VXZHnAJ9ZBMlLbrfBqZ7DJ0wxLzjEOOPj
 H8xx9TM2niBJWUab6VwMaKGh7d0wWdv4J51eYAOn/xCfmyRKVqSA7Cswk28GNhTilTzxBArQKbk
 VqLyLzfjFPbfbLYbVCQ+abUwuqsipnfwgNq16Y5ogOTHHimvPfcPgddERBoeLHH6KqIVH+/+mzh
 4tVsApW1kOkX3NbbnVEJj/NqdFFwlZTN8BWue8Zy519K9x7E2sKMlw1oDCLa7KOGk9oRG4bR1xB
 yUGB957o3zZcAMFB6zJuZm1OvgF0DQ6HKNY7uO3iiNOljXoMu3JLJuSKxJ2FH7xW7piqH3CrH00
 k39MhO0Ac3up1BwikxcVKGw5Ll1ZnS3OkVLdgx0f0eGrpE/fEmrEnmopqRBlCiOGwysim5kxgyf Ys6/LRmIPw4rDQw==
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240822-tracepoint-v8-1b-f0c5899e6fd3@google.com>
Subject: [PATCH v8 1/5 alt] rust: add generic static_key_false
From: Alice Ryhl <aliceryhl@google.com>
To: aliceryhl@google.com
Cc: a.hindborg@samsung.com, ajones@ventanamicro.com, akpm@linux-foundation.org, 
	alex.gaynor@gmail.com, alexghiti@rivosinc.com, aou@eecs.berkeley.edu, 
	apatel@ventanamicro.com, ardb@kernel.org, arnd@arndb.de, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	bp@alien8.de, catalin.marinas@arm.com, chenhuacai@kernel.org, 
	conor.dooley@microchip.com, dave.hansen@linux.intel.com, gary@garyguo.net, 
	hpa@zytor.com, jbaron@akamai.com, jpoimboe@kernel.org, kernel@xen0n.name, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	maobibo@loongson.cn, mark.rutland@arm.com, mathieu.desnoyers@efficios.com, 
	maz@kernel.org, mhiramat@kernel.org, mingo@redhat.com, ojeda@kernel.org, 
	oliver.upton@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	peterz@infradead.org, rostedt@goodmis.org, rust-for-linux@vger.kernel.org, 
	ryan.roberts@arm.com, samuel.holland@sifive.com, seanjc@google.com, 
	tabba@google.com, tglx@linutronix.de, ubizjak@gmail.com, wedsonaf@gmail.com, 
	will@kernel.org, x86@kernel.org, yangtiezhu@loongson.cn, 
	zhaotianrui@loongson.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_050813_056456_67C2C37F 
X-CRM114-Status: GOOD (  21.04  )
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
This is an alternate version of patch 1 that resolves the conflict with
https://lore.kernel.org/all/20240725183325.122827-7-ojeda@kernel.org/

 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/helpers.c          |  1 +
 rust/helpers/tracepoint.c       | 18 ++++++++++++++++++
 rust/kernel/jump_label.rs       | 29 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 5 files changed, 50 insertions(+)
 create mode 100644 rust/helpers/tracepoint.c
 create mode 100644 rust/kernel/jump_label.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ae82e9c941af..e0846e7e93e6 100644
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
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 173533616c91..5b17839de43a 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -20,6 +20,7 @@
 #include "slab.c"
 #include "spinlock.c"
 #include "task.c"
+#include "tracepoint.c"
 #include "uaccess.c"
 #include "wait.c"
 #include "workqueue.c"
diff --git a/rust/helpers/tracepoint.c b/rust/helpers/tracepoint.c
new file mode 100644
index 000000000000..02aafb2b226f
--- /dev/null
+++ b/rust/helpers/tracepoint.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Helpers for tracepoints. At the moment, helpers are only needed when
+ * CONFIG_JUMP_LABEL is disabled, as `static_key_count` is only marked inline
+ * in that case.
+ *
+ * Copyright (C) 2024 Google LLC.
+ */
+
+#include <linux/jump_label.h>
+
+#ifndef CONFIG_JUMP_LABEL
+int rust_helper_static_key_count(struct static_key *key)
+{
+	return static_key_count(key);
+}
+#endif
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
