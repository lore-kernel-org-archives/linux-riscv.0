Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04B6C52D71
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 17:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tSSJQa9s+3sx8TJPDRw4MwZ+K4fB1WQyB19BwkagMHA=; b=bF5oRDrYrr9e13naZFDFujCCIv
	ugKcGzlYH76m2izjB74T5RJvqojtgkfErKPdMX3z0QFGARlTaM4NkNoAefiGUdwfMry5GaeuoGA+T
	lCYGfxS3MD8FDOfjrq3oNw3dCAS6c6D1uOeG2SiBO0hw51xR3hu5RCiveWdD33OwP2YJ8ciOKdTs6
	WPhw2k3T/jD8BPlJ9M58YETJUJ4gc77mROE2dSAAs4WfVW/6ApxykGbrU5sGYpG5Oe1aXjQtj77nj
	GUkfbySCcYwzuI+kKg+e0QJGAFd3TE9vrzgmfGiNOGCLSlkb/DvRqtr3hW49yaxsXmxA84ARQRwiQ
	bAdSYqSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc6rg-000000094sh-11P9;
	Thu, 08 Aug 2024 17:23:52 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc6rc-000000094qj-47wd
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 17:23:50 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-664bc570740so36003847b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2024 10:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723137827; x=1723742627; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnVygMZX7iPHVWxzQi3pEMy3RocjC+XVhMLP7SBmGyU=;
        b=F2NFWJeOyNyirQwRsC39F2bELCL1MBO7xqJpg9pfMxrTH0Am28KYfrUrF6vbzKCOUr
         78H0N//Qe+BfCp+4jX6Tx78coYsxYpfV7+IOuZYzxweZ1vmNmgxEIJPF3N6ESk1sNvIb
         zjVfsW1vRchOwgrOrvgYIinNBtxhDEGlI4dt2z/lf3kuCMwaYW9wSZvgeqJsQ2vIwgSj
         rd0grnCJMA4gkDrUO1tGKlKQmiyAP1kS/ZgsoIfq2yct6nLn/vM3+fBFyiPIi0blvfgZ
         3ooZUQBqm2KFDNJqfuKCJ0Opo7CmZMboJ7g9VRU/QH7zsCxhmUd8s0HWHMSEV/2HinR5
         6EMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723137827; x=1723742627;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VnVygMZX7iPHVWxzQi3pEMy3RocjC+XVhMLP7SBmGyU=;
        b=DwoDvp4qJaz1yvojJOGMHMtithn9K2VgRj/WpQYEGg1ZTE8j/B8PZC76EhyRrLqW3q
         sjK5eXDxfo8M4NMN0JWMSjW9+N1gL0ctLAKtTNLVFixh/UDh7yB5grE/Z43pbm12BieI
         J1ctLVQoQKTLJFmurJmz3+ZDXtNKn/VDN/QZAyqGIHv5xJHQ6w12XIKAqC88fpfIWqhs
         vHUqfcp9tYuYgYgNLOnbsMxZ0FHlOYQF+Wdbu4lFDN5yUWqHadsH3vuIy91lKs3AuRzq
         1l4xDTTodQ6rhk3/Qp+aHm5x6c03WGK93j+205iZPTBaeZhVMHenHIH+xfW+XqG61sr6
         oVBg==
X-Forwarded-Encrypted: i=1; AJvYcCVYCZYDEMTlGDAXji7/tuSIDtLb/XkN20SEfZTxrOubjssv5Pm8C4yTOjH9C2KL0vYr4lzos2VOpIpU0l7SP3AGKD09yEXr/1OVDlhd7Mcy
X-Gm-Message-State: AOJu0YyYVG+JCe9olh47DB8vBG7T8zzmCc2aDA7Vy/xtVUz+jT5FdXqV
	1A+PQOQFDypKRMkV0qLXn+PrI4irEC07J/fAqieFrAitpKx2WDyABpRTDRa9k1kk9H6N+lZSrkL
	E7ASChmXEoJPfcw==
X-Google-Smtp-Source: AGHT+IE1OkPXGo3v1Jwf6rmliI1ru3j9uDOkh7aAdLs+PnUwiCRBZL2DxlvskxpZ8naPb0v/gtKTRQBglOOtCXA=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a0d:ff44:0:b0:68e:edf4:7b42 with SMTP id
 00721157ae682-69c0e17e20bmr1388647b3.2.1723137827230; Thu, 08 Aug 2024
 10:23:47 -0700 (PDT)
Date: Thu, 08 Aug 2024 17:23:37 +0000
In-Reply-To: <20240808-tracepoint-v6-0-a23f800f1189@google.com>
Mime-Version: 1.0
References: <20240808-tracepoint-v6-0-a23f800f1189@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4247; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=fl9wvF9CONq5vMWdv4SzydSNhjVsZ9UpCuEcpZNAscs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmtP8bRhhwaCJyZlEFRWH/ifaHtpXPI8JU5pRUZ
 oYH+YuUpwGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZrT/GwAKCRAEWL7uWMY5
 RnutD/9yGDHkP8YF6gTzwouw6B6/WVWzoRq+um+8JOY/u82V2tYU4KOFPGU3A04KAEDxitEOoVm
 qBxN3iNZRxptAZiHn7NXeDEdipseXrFIBYY8kDhhZq4W9fFVFmIHISguxkEtDYF9ZzPP2uCGnpq
 j6TOZoPRm3Gi7XCjuKowepUlbbTnfhlbpcRhhx0Qcz94qrXE9hd94neGqcsvAXDFwS/v57arGen
 aiBpAqPNmdv/Nve47F9SyD6kyajBU6/c5pvf+ZGFLOW+XzhNRwyvKwxzklcSzwEbYif46TmBTUX
 brFgrgrbJqdlOZufDZUFsFd+5mzs5lOi9d/Jq95q3hKeYdyiBDSxOT/tlId7kGEmZm0Pds07FPm
 rZ0EpOCaShADtHw6ChryxQ8zMsc2scDXck56M62bv6FmHaQtYcsAJU60F+ZTy/LvEKndq0HcauG
 BIw2/pv/KxoHPxdLwMezo29aagFCll9VO4MEj8Py4fOQgCrjltR0C9UHF+vr17+xCs4rxbBTo54
 gErPn3fhEJ7061fIaee7se2c/U9Qc2StUdQJRztLi6NvRGtbawndAqQC+rxruF041MNCaGsOblI
 bbClEkj9Ir99MDnKEx8xqD94qxmYcFiRhwjNTJSFJXlg9eKNZmg6nyYdi5ek4N9rjdKxOjhT/QE G2EWsxD4WEyjVrQ==
X-Mailer: b4 0.13.0
Message-ID: <20240808-tracepoint-v6-1-a23f800f1189@google.com>
Subject: [PATCH v6 1/5] rust: add generic static_key_false
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
X-CRM114-CacheID: sfid-20240808_102349_064045_1901EE5B 
X-CRM114-Status: GOOD (  19.74  )
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
 rust/bindings/bindings_helper.h       |  1 +
 rust/helpers.c                        |  9 +++++++++
 rust/kernel/arch_static_branch_asm.rs |  1 +
 rust/kernel/jump_label.rs             | 29 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs                    |  1 +
 5 files changed, 41 insertions(+)

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
diff --git a/rust/kernel/arch_static_branch_asm.rs b/rust/kernel/arch_static_branch_asm.rs
new file mode 100644
index 000000000000..958f1f130455
--- /dev/null
+++ b/rust/kernel/arch_static_branch_asm.rs
@@ -0,0 +1 @@
+::kernel::concat_literals!("1: jmp " "{l_yes}" " # objtool NOPs this \n\t" ".pushsection __jump_table,  \"aw\" \n\t" " " ".balign 8" " " "\n\t" ".long 1b - . \n\t" ".long " "{l_yes}" "- . \n\t" " " ".quad" " " " " "{symb} + {off} + {branch}" " - . \n\t" ".popsection \n\t")
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
2.46.0.76.ge559c4bf1a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
