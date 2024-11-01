Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5DBE674A8
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 07:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U4XmUcfBNt/6dWTYk7LSehJKfPeqLCx06L1PdeyateQ=; b=gchUtL1FftHZuX
	7AVsIAbwnYIUfDVkMLdtwi62yFM3deMDBc3FGFYwCoRsofQk2azLnSVSkvBWvTHniycwtiLhw7+WN
	mkTCdiP9dg3dNmILs1Loz/gMds8jsh+06ai1lcGXpKErPmluoE2NZRdGI1IOx7dSPwS+pWTFfP98B
	FP2yGc6DKwTKOVaQ16Wu02s609rhnY2+d5GoWAeKdJDBYzvgmMAIlW0JHYaOaMpzo/3LNwkNj1qso
	ZD+3HJrx7bD/BxrKqKEx689321pHjO5O0zFhGlXyRKo5Br8uGjNgsXyGgYlJ7nlOEpLKvWOGXX7Dy
	KpadlLazjd6a0zm5hOTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ls6-000000064oZ-15Zy;
	Fri, 01 Nov 2024 07:15:02 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6lgd-000000062fL-2rHr
	for linux-riscv@lists.infradead.org;
	Fri, 01 Nov 2024 07:03:13 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7b15467f383so120480785a.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 00:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730444590; x=1731049390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ez4P5E9q8FP8C4exX7QDGHDy4d36xIscVD7DfibVtng=;
        b=YxU7pKJJxg4bq/3utV+nUj0hrEKWi4/E82ena3FmxkkDwJZCbrz78WUXnQEAJCCNAZ
         yh6BpBhdDtOdigIUBPqVls7PI3H5LlPKN7/WczDAVRV+bXfC1g2napfvCp45bwCQi4Zs
         FoGYEh7OmzIPpH6fOvsvZrmV9H6HZutMl/PmBHp40mtsvAucs9xDcZijvohDWUDw7qT0
         htzBVVPCARJpzlHqNkF0KGLwx346YPn3uP1hkZsQxyjeU9kQh3jWBFXL68sY8RvOwe8a
         lGz1AVWPkhieE1auqWNOiW5P57HZdREm+7wlCQpeeg+jaFW+8Dd4FFNYm/az3dArVNSW
         wXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730444590; x=1731049390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ez4P5E9q8FP8C4exX7QDGHDy4d36xIscVD7DfibVtng=;
        b=WkNRSb9MciolZH2kgGJ/GwPEVFg8PViLF5ZjviGi+Qd2Fv9M9TjLkx9q/5qpfHpgT4
         JAXoPHPHptjfB6Lx9XCeJAzxvwuwe7feOmP7gWNnTacpzvdNn23bQQeCwMpIdZHjnSkn
         UMqzPtb+rmehlw3Pra9pDnHeuTfkOag5xisc2v39+b1NuzmaZl1mElXAUR6IV8NQ+okm
         qT6jV8Hr0v4dvf61BoFn00s3sZfRJWjrndups3YYMTLdNOWVc0xc6aYPOVgypuhN7Zuw
         3+FHfPmEeYiwPzuDKJu1ajpNIbYcEBEzXKuOf4aUS0EEYS3LUwa5W7TZNHh9fcgJMA+K
         eCMw==
X-Forwarded-Encrypted: i=1; AJvYcCVHVTlVapkO2Q684Swk5nY9/7cuIiAJnlVKqWzAKhP+tcviEQ4jWLcxtNsMaA8mQkKVuMLXGLPWrZXc8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv0YTTeLjHrQLz6HrxK3ml9MQKUqztxt5Y+y3bAxuB0hU0Vx+L
	Pw4Ce2su5+WqnrBQxLR3xPtzLfpsWTtPR0wgbWDDBELANrN6tvkX
X-Google-Smtp-Source: AGHT+IH0rscrjrMg+t7lD0iLeFxEjGlQdsQeS1+nXLqYqotMYyu+aK5hhUosI8B/jyWiWTR32tEzbQ==
X-Received: by 2002:a05:620a:19a9:b0:7b1:3754:7d83 with SMTP id af79cd13be357-7b2f24c532amr771460385a.9.1730444588979;
        Fri, 01 Nov 2024 00:03:08 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f3a6fdd9sm144415385a.86.2024.11.01.00.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 00:03:08 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 982A11200043;
	Fri,  1 Nov 2024 03:03:07 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 01 Nov 2024 03:03:07 -0400
X-ME-Sender: <xms:K30kZ8kl9dguh9P5md2cPJLSLRyZHZ28vGAdvnbOHwqyXzyDlq76nw>
    <xme:K30kZ73IlQtRIfUghCYp7Hqe0Z-yqSs5YkyIhEOYjjbayElmEdVJ78bQS_oD0L5GR
    n9YgkxXc7NuZUfjig>
X-ME-Received: <xmr:K30kZ6qevGzVMIehn3SuFU9G-5BAFNHZYkl7pdObQ0k8sA0Xrszt6c8RTd0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekkedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepgeeljeeitdehvdehgefgjeevfeejjeekgfev
    ffeiueejhfeuiefggeeuheeggefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeehiedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgtuhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhgthhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehllhhvmheslhhishhtshdrlhhinhhugidruggvvhdprh
    gtphhtthhopehlkhhmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopeho
    jhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepfigvughsohhnrghfsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:K30kZ4m2d7id-MHy0VCqfFEk73hWD-rzbmzVaOphLOYwvL0OUgy4Jw>
    <xmx:K30kZ62Sh2l7NMYMzrR5nF_FIjg8WspDd6pn4BFPAxmpRuEEWMTX5g>
    <xmx:K30kZ_t943pAvxL8JHqflDINexBQG6UobtoGy5HYThSmt-2zU5QCsA>
    <xmx:K30kZ2W3DfYr-jAWfVPwpX_isI1H9PH0s9JfvzStSS7Otd3Naa2_Rw>
    <xmx:K30kZ92gaMbO2j1L-x5tRAd-9S7mxKeJMajb157zybAXM67gmyc0m_Gt>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 03:03:07 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev,
	lkmm@lists.linux.dev
Cc: Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nicholas Piggin <npiggin@gmail.com>,	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,	kent.overstreet@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,	elver@google.com,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	torvalds@linux-foundation.org,
	linux-fsdevel@vger.kernel.org,	Trevor Gross <tmgross@umich.edu>,
	dakr@redhat.com,	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Subject: [RFC v2.1 11/13] rust: sync: Add memory barriers
Date: Fri,  1 Nov 2024 00:01:53 -0700
Message-ID: <20241101070153.1197484-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101060237.1185533-12-boqun.feng@gmail.com>
References: <20241101060237.1185533-12-boqun.feng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_000311_763075_EA1757E5 
X-CRM114-Status: GOOD (  21.19  )
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

Memory barriers are building blocks for concurrent code, hence provide
a minimal set of them.

The compiler barrier, barrier(), is implemented in inline asm instead of
using core::sync::atomic::compiler_fence() because memory models are
different: kernel's atomics are implemented in inline asm therefore the
compiler barrier should be implemented in inline asm as well.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
v2 -> v2.1: Add the missing barrier.c

 rust/helpers/barrier.c      | 18 ++++++++++
 rust/helpers/helpers.c      |  1 +
 rust/kernel/sync.rs         |  1 +
 rust/kernel/sync/barrier.rs | 67 +++++++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+)
 create mode 100644 rust/helpers/barrier.c
 create mode 100644 rust/kernel/sync/barrier.rs

diff --git a/rust/helpers/barrier.c b/rust/helpers/barrier.c
new file mode 100644
index 000000000000..cdf28ce8e511
--- /dev/null
+++ b/rust/helpers/barrier.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <asm/barrier.h>
+
+void rust_helper_smp_mb(void)
+{
+	smp_mb();
+}
+
+void rust_helper_smp_wmb(void)
+{
+	smp_wmb();
+}
+
+void rust_helper_smp_rmb(void)
+{
+	smp_rmb();
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index ab5a3f1be241..f4a94833b29d 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -8,6 +8,7 @@
  */
 
 #include "atomic.c"
+#include "barrier.c"
 #include "blk.c"
 #include "bug.c"
 #include "build_assert.c"
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 66ac3752ca71..0d0b19441ae8 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -9,6 +9,7 @@
 
 mod arc;
 pub mod atomic;
+pub mod barrier;
 mod condvar;
 pub mod lock;
 mod locked_by;
diff --git a/rust/kernel/sync/barrier.rs b/rust/kernel/sync/barrier.rs
new file mode 100644
index 000000000000..277aa09747bf
--- /dev/null
+++ b/rust/kernel/sync/barrier.rs
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Memory barriers.
+//!
+//! These primitives have the same semantics as their C counterparts: and the precise definitions of
+//! semantics can be found at [`LKMM`].
+//!
+//! [`LKMM`]: srctree/tools/memory-mode/
+
+/// A compiler barrier.
+///
+/// An explicic compiler barrier function that prevents the compiler from moving the memory
+/// accesses either side of it to the other side.
+pub fn barrier() {
+    // By default, Rust inline asms are treated as being able to access any memory or flags, hence
+    // it suffices as a compiler barrier.
+    //
+    // SAFETY: An empty asm block should be safe.
+    unsafe {
+        core::arch::asm!("");
+    }
+}
+
+/// A full memory barrier.
+///
+/// A barrier function that prevents both the compiler and the CPU from moving the memory accesses
+/// either side of it to the other side.
+pub fn smp_mb() {
+    if cfg!(CONFIG_SMP) {
+        // SAFETY: `smp_mb()` is safe to call.
+        unsafe {
+            bindings::smp_mb();
+        }
+    } else {
+        barrier();
+    }
+}
+
+/// A write-write memory barrier.
+///
+/// A barrier function that prevents both the compiler and the CPU from moving the memory write
+/// accesses either side of it to the other side.
+pub fn smp_wmb() {
+    if cfg!(CONFIG_SMP) {
+        // SAFETY: `smp_wmb()` is safe to call.
+        unsafe {
+            bindings::smp_wmb();
+        }
+    } else {
+        barrier();
+    }
+}
+
+/// A read-read memory barrier.
+///
+/// A barrier function that prevents both the compiler and the CPU from moving the memory read
+/// accesses either side of it to the other side.
+pub fn smp_rmb() {
+    if cfg!(CONFIG_SMP) {
+        // SAFETY: `smp_rmb()` is safe to call.
+        unsafe {
+            bindings::smp_rmb();
+        }
+    } else {
+        barrier();
+    }
+}
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
