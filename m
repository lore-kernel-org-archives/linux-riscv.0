Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98453E674AB
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 07:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HResYXjKTLqmKlGUJhKSIY3eoitxwI7ga12bafQEOBg=; b=LFtMcL8lUaON46
	pMapxel3+cldBMTS7w5UONXcCdOVUjRBf59u++FWG8UxZhInRhXBlqQRm3cSOIAps3lT5nzmur7uE
	MlvXmxSUy8T0nGHUM/Py4OpPArNLRarTui/mwMi3EsD7NEkfvXYP5rDz0LIjbORn2XgErm1IBLg7b
	Oeeh+EjbcBSYwfWAXXy8vZKWJ1wzdq3Ol3idfki2k0x920qsITExf21mvinBYUVfpZ5a56RR7EuL7
	NOpbH4YExui/Q2K5cf9M80hec713dSARwX/swpGUXjE2NFcUjvi+hfiaaxGXDEgjlmwnrpJgMJwkR
	fU8kbYojD3FPRfr5EFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ltF-000000065AG-0d2R;
	Fri, 01 Nov 2024 07:16:13 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6klY-00000005tkB-2Nap;
	Fri, 01 Nov 2024 06:04:17 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-460963d6233so10055161cf.2;
        Thu, 31 Oct 2024 23:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730441051; x=1731045851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qb/auzzRSYdGnLFU8kbv5LWllGUHO0oSi9IMia1ivTQ=;
        b=dBQfgIzgeIH4Xjhn54GfCubq7cE23gQTi6s8y8VRtGyHwYSR3T4dipFnCBxu04T6R9
         eqCAKGjClF8bYFp+x6syHCNGfOfmZgLa5o43MXBduEDU9v0Y4odTj+oSW0G8q1hqRkew
         dhrSeQ9k5/2w3MvjcwGy1XUfKsI1pHjAUW9V/Wtnls7AK6EqcQ4tOucjLhfPVDqxFE9u
         doEIEPIWDYM7CGAZJ8Ccm0Wi0GJeCZMECFuDULlE4DrKLQ6M9D7QKLzKA39de3oID0cq
         5Io7434hkGHsIa6JgI+TrtEsttB1NqcUsfO6D3Jpfz1FCwaxSZ/SLFPv66JfmXuF2Df/
         DThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730441051; x=1731045851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qb/auzzRSYdGnLFU8kbv5LWllGUHO0oSi9IMia1ivTQ=;
        b=ZoniAdR8iKJatnGJHL078cSX5U+WfdVQ6r9TzftVt40ved6XaoxHEVhMXcl0It9TbG
         92tRYL7wVlrfnRggOBxcGq9bdYmxKqkDY6dscYax33WwpfEX8kPgmp66YYfWHmeJc5m3
         kIA9/01ITkzHl5FoGW9SNBYpWI0fcBEZjt81wEuctLF14cn8etoCNaIs+NkcD8GWTDEu
         oEekG7ofSPD3h/9yWWp554+DrgVmZ0cIloYQhCAAV86MyM0s/OuxThgs6mH5OabdPCBI
         NCfnZtvXuv/NyhfWK9WU91tUoGYT2lvfhYbegm9OX84WT74CY+mLjmFrNW/zEvGbfmQ+
         I+gA==
X-Forwarded-Encrypted: i=1; AJvYcCW5lyrR/Gh4vxPH4Wc2jalbibXG1VB5g75yoXO6GnONWRoYBuERKFFRifKsno4oabCwaEYs6SdPZ0ZUnCg=@lists.infradead.org, AJvYcCWvdAXIg8nsLcWs8ZrCbBnhYJX3Py6GI1DJQpO1iM0jaqJOIiSDSKfNHp3SEJ7EKXb/Te+/7i2ZpoqQdA8r/PPE@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ49SqsFCH66XgxZLCsZaZgE/L1t41d7Vsav8yQUjwRsUs92L9
	MbVUJciIo4zJWcQ1BBENPn+PX6JlX4SSKxEvLOKI4b4KwGyxNztE
X-Google-Smtp-Source: AGHT+IHS6b6//DorDylLbtgJ5bxng2h5LRkBucc4foDz3VRtnJmrGN2L8AFAqOvdv2cV+zLm68lbuQ==
X-Received: by 2002:a05:622a:1444:b0:461:22f1:dd17 with SMTP id d75a77b69052e-462ab2ea97dmr71679421cf.41.1730441050686;
        Thu, 31 Oct 2024 23:04:10 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ad0c72efsm15253151cf.50.2024.10.31.23.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 23:04:10 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7765D1200043;
	Fri,  1 Nov 2024 02:04:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 01 Nov 2024 02:04:09 -0400
X-ME-Sender: <xms:WW8kZx0yl-DRTkHXgY5jQzLrSNLLDkudwnu3ix9eYqdnkqUvZ2vaFQ>
    <xme:WW8kZ4GAGBgNAFrGfSe_PmlOpNQS083UDL__1doSYVQt8I7x_mlbfkwoSAgmiOm7U
    f7mPUFIaSg6LD7WVA>
X-ME-Received: <xmr:WW8kZx71LpKc2GUqMRy7CHTRuN8FLMJnTGleLLenuwxnBiBXKus9KcGDA5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekkedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefgveff
    ieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepheekpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtg
    hpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepohhj
    vggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesgh
    hmrghilhdrtghomhdprhgtphhtthhopeifvggushhonhgrfhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:WW8kZ-29wq7-RXn3oPRa3Y1O9DboG82y8qrZ4Nu_564zR-VGr9Je9w>
    <xmx:WW8kZ0GQTTjyggH4cJg4Kav483-SKdWycoefukMQLMkjdNu8_8xqLA>
    <xmx:WW8kZ_9tc4N_PFWXmN3eG7Mgh6RDJkpm5HMIl7ULoIc2rMMwFm2T9g>
    <xmx:WW8kZxmBqqgJhcI1oZvJD2FHr29b8lEUC-0xrNxQI8LK_ZcZbCb1mg>
    <xmx:WW8kZ4E6Urq48alTAcEzXU4Kswskc70SKXQV7Gr_3kb4bg0jhLSpFv4_>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 02:04:08 -0400 (EDT)
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
	linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org,
	Trevor Gross <tmgross@umich.edu>,	dakr@redhat.com,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,	Danilo Krummrich <dakr@kernel.org>
Subject: [RFC v2 12/13] rust: add rcu abstraction
Date: Thu, 31 Oct 2024 23:02:35 -0700
Message-ID: <20241101060237.1185533-13-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101060237.1185533-1-boqun.feng@gmail.com>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_230412_869509_456D8AA6 
X-CRM114-Status: GOOD (  17.76  )
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

From: Wedson Almeida Filho <wedsonaf@gmail.com>

Add a simple abstraction to guard critical code sections with an rcu
read lock.

Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/helpers/helpers.c  |  1 +
 rust/helpers/rcu.c      | 13 +++++++++++
 rust/kernel/sync.rs     |  1 +
 rust/kernel/sync/rcu.rs | 52 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 67 insertions(+)
 create mode 100644 rust/helpers/rcu.c
 create mode 100644 rust/kernel/sync/rcu.rs

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index f4a94833b29d..65951245879f 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -18,6 +18,7 @@
 #include "mutex.c"
 #include "page.c"
 #include "rbtree.c"
+#include "rcu.c"
 #include "refcount.c"
 #include "signal.c"
 #include "slab.c"
diff --git a/rust/helpers/rcu.c b/rust/helpers/rcu.c
new file mode 100644
index 000000000000..f1cec6583513
--- /dev/null
+++ b/rust/helpers/rcu.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/rcupdate.h>
+
+void rust_helper_rcu_read_lock(void)
+{
+	rcu_read_lock();
+}
+
+void rust_helper_rcu_read_unlock(void)
+{
+	rcu_read_unlock();
+}
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 0d0b19441ae8..f5a413e1ce30 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -13,6 +13,7 @@
 mod condvar;
 pub mod lock;
 mod locked_by;
+pub mod rcu;
 
 pub use arc::{Arc, ArcBorrow, UniqueArc};
 pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs
new file mode 100644
index 000000000000..5a35495f69a4
--- /dev/null
+++ b/rust/kernel/sync/rcu.rs
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! RCU support.
+//!
+//! C header: [`include/linux/rcupdate.h`](srctree/include/linux/rcupdate.h)
+
+use crate::bindings;
+use core::marker::PhantomData;
+
+/// Evidence that the RCU read side lock is held on the current thread/CPU.
+///
+/// The type is explicitly not `Send` because this property is per-thread/CPU.
+///
+/// # Invariants
+///
+/// The RCU read side lock is actually held while instances of this guard exist.
+pub struct Guard {
+    _not_send: PhantomData<*mut ()>,
+}
+
+impl Guard {
+    /// Acquires the RCU read side lock and returns a guard.
+    pub fn new() -> Self {
+        // SAFETY: An FFI call with no additional requirements.
+        unsafe { bindings::rcu_read_lock() };
+        // INVARIANT: The RCU read side lock was just acquired above.
+        Self {
+            _not_send: PhantomData,
+        }
+    }
+
+    /// Explicitly releases the RCU read side lock.
+    pub fn unlock(self) {}
+}
+
+impl Default for Guard {
+    fn default() -> Self {
+        Self::new()
+    }
+}
+
+impl Drop for Guard {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariants, the rcu read side is locked, so it is ok to unlock it.
+        unsafe { bindings::rcu_read_unlock() };
+    }
+}
+
+/// Acquires the RCU read side lock.
+pub fn read_lock() -> Guard {
+    Guard::new()
+}
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
