Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AA5C369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 16:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQAnhE76AoypeGVUMvbxDsGOAqL2wIMz+yMkTEbG34I=; b=Ht5dfuDa/BOfOP
	EjWEXg6pDrrYr3PbxPLhLuIRrtwjIlxP3BikuKN/Pe6ceGX/Nj5+u7Nj9siqiT9cyckiVtcYhlK17
	LA7428k8sAm4WUg15ODW4FzR9IFq1WR8s4Kr+hwSqs+PjIjYE8YhKiCanZdjVNgSPdPLqOWFyKtoK
	AE/jlG3BYQylMhK6F9sFjqm37rjB4TT8/sBf2fm5d6CjXp0WYx7scbRlQtM7mtsFGkT/U2vqM6A/n
	jHVQSz2yWmg0pSs9emiPEoCr7zFabvrh9poB4WuOaddtOoAxQZa4RXXqRyxWlSj9rpX0Lt2bGBsvI
	x+i7QyH0D/jwjGcn1sRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uFt-00000004kK3-2JZ6;
	Mon, 21 Apr 2025 16:44:25 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uE9-00000004jgg-38Sk;
	Mon, 21 Apr 2025 16:42:39 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c5e39d1db2so210693285a.3;
        Mon, 21 Apr 2025 09:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253757; x=1745858557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8saFQNyFDcMMxSMO/2MuZCuMNf/4lANNbiDkrHm2aLE=;
        b=K4Gyo1Hjyqwg+7NMlvJ/05mI4yubkAQ5yB3EivSiOvZPXq+H74MAni4POKD3jHQOCT
         Yif2uYJBOsi7rWUH/Ymr7drAtGM6RBxGIscg1I+vZS29eOvGmSATPqtWCd/1aSYU57nQ
         aeZVxim7a8Q6Tb0T2YzbuT2ZELoXLbYZMMM2uI+HWuws0HXRhXmFGU9n7V2+EWLZZ3Z/
         hIXd4kiggxML5pJ0pIea/u5zIJw33z9Q28RCc5u4ySKWUHvQFf1MU/UA+jOXqcvFs6Nq
         0YFhpNwk0b5xTowSayOQ6TfQf2UAZDC/HpyDUIVIiPN5GN5cts7IxqViTiug1W0vigov
         BiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253757; x=1745858557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8saFQNyFDcMMxSMO/2MuZCuMNf/4lANNbiDkrHm2aLE=;
        b=tFdvDbZ7lUppPYon2MAjz+4h+WG4fAWamdMEoxiMA/eTAuZEb+1QToGgNzv/E59Gwn
         a0uN6QgNBjyMR7e3Y3av+YLf4rMOKKpcTtiQHIc5W6AHm4qZ4g9wpU/yr/I/fXQ8suYx
         z241zAbIMi9QNKHJsBdscJzkPTq27HodcEcL1emQFJa5qE3VzBE5a8NdsMoBasKw8caS
         AR2xPEdq2u1fyZ9M3m3G1Fgz/DUWBa4aR0IJQlV3yCWd3Bp2valJSq7Iu3fK+Wjg1pI6
         pY7p/Jb0us4kpRNcBIZWu61N7hggMI4VusAEgFsYLmc24wZIFH1t6VEzqJCHCJ5BkJIi
         DOtw==
X-Forwarded-Encrypted: i=1; AJvYcCVEGfNlr+FwBlsFVusi9MKJKbQL3OPwzTHbbQ3K4R+fiY7nK18fuGX7yZ/XzwtiUPcLep+G5EFyRHuI5m4=@lists.infradead.org, AJvYcCXzI8H4O8zyhKiaxp0ZfAnsptC6rRlFjDr8U54xqN8+HfpOu1zRLSEMwBdC4pdah7w/2esFXEu9GxHyL/iU+qW4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq424jpSlqxRQd6hTLDcVQFZLlLalbvV43e/h6tAzvob0faqnc
	Ovj26P5OwcfN4xadF1m34AlUlxTEhStT+ol+4hNzZGOE+GXJ3KVn
X-Gm-Gg: ASbGncs63lusqwJmSETaFR+hRBXXCd624fsVADBTE90H+sKWSvLOQvZiGzlqdzXUjYO
	eSJ2HwyZhaZO8Ztpguh0zGvE9I4i9eLqTTZxshPxwOmenWriuWBCK0ITtjqkGwSEVJ9Kn0ww+0q
	S6kaE/VGVkSKFmfZXPE+j9GbmT7DqXS2c3s1On+pvZ5BKAnR65smjJJfM8DgqiahWdg8yAokUMa
	GTQ8B6xjNnyd4EMot6VC3kX1XkZUC23OI64Ss33JxUd62pfqLniuy5/odimkrFKP7xWhnmKaXGf
	zTcvnnpasxOJ5ZyQ0IHCNzq20fW3fvt7D6bNrtpHFTLU8cSXRqgrnShikb0cnJtDbnQklMGE5GC
	2dnCRjCThL2UK3TI3IeyvM9l9GFJcEPo=
X-Google-Smtp-Source: AGHT+IFnTfyYLHBZmdffCGm74NenJlOIzpShFRC9OZkBB5aKvXLSHyWnfdI44qRzSfT84fBvsgrmmQ==
X-Received: by 2002:a05:620a:2408:b0:7c7:a604:d432 with SMTP id af79cd13be357-7c927f9d235mr2000884785a.30.1745253756813;
        Mon, 21 Apr 2025 09:42:36 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6e7casm437805385a.10.2025.04.21.09.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:36 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8A0CE1200043;
	Mon, 21 Apr 2025 12:42:35 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 21 Apr 2025 12:42:35 -0400
X-ME-Sender: <xms:e3UGaOJuPUX353U4Na-PAzbZ9_eIacaEv3koh8zvIRjobm3xRPCrmA>
    <xme:e3UGaGJeFSnMgyj6zNUtSMbtIJXHeuvdtwp9TAj6T_MeENHbWqAruAqQ93VDJNYWE
    vu-qbVleOnSgy5Gfw>
X-ME-Received: <xmr:e3UGaOuTnaY5XLzrDRiQ0QT2mC3CTYlTkGnq8PVRrF-eVVQVuQvC2a9yKskx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefg
    veffieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepheeipdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpd
    hrtghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohep
    ohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorh
    esghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdr
    tghomh
X-ME-Proxy: <xmx:e3UGaDaJhO8GD_lQnoToaYj26JjNilDFxNwDLQ6bNgN-qVgELxslGw>
    <xmx:e3UGaFa0wJzZsYsRDhRcsjONGl8dHJ1Y_vAU3JShAmFWyr_6wsDuQg>
    <xmx:e3UGaPCoQDQXWJ_o80upbL9_LjOk8FMLA9XPixSIf_MqBhWcY-ByXA>
    <xmx:e3UGaLYfLadt2fK-wQhq3YeZKE6J5l3QOXG4bLnDg1-jQ5REUv1FZw>
    <xmx:e3UGaFrRLNGByuGgBUjbtTf5RdPVaRb4p2ucHW6NVTdCBbgVMV8FqkiL>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:34 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev,
	lkmm@lists.linux.dev
Cc: Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
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
	linux-riscv@lists.infradead.org
Subject: [RFC v3 03/12] rust: sync: atomic: Add ordering annotation types
Date: Mon, 21 Apr 2025 09:42:12 -0700
Message-ID: <20250421164221.1121805-4-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250421164221.1121805-1-boqun.feng@gmail.com>
References: <20250421164221.1121805-1-boqun.feng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_094237_844932_1E41A392 
X-CRM114-Status: GOOD (  20.81  )
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

Preparation for atomic primitives. Instead of a suffix like _acquire, a
method parameter along with the corresponding generic parameter will be
used to specify the ordering of an atomic operations. For example,
atomic load() can be defined as:

	impl<T: ...> Atomic<T> {
	    pub fn load<O: AcquireOrRelaxed>(&self, _o: O) -> T { ... }
	}

and acquire users would do:

	let r = x.load(Acquire);

relaxed users:

	let r = x.load(Relaxed);

doing the following:

	let r = x.load(Release);

will cause a compiler error.

Compared to suffixes, it's easier to tell what ordering variants an
operation has, and it also make it easier to unify the implementation of
all ordering variants in one method via generic. The `IS_RELAXED` and
`ORDER` associate consts are for generic function to pick up the
particular implementation specified by an ordering annotation.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs          |  3 +
 rust/kernel/sync/atomic/ordering.rs | 94 +++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 rust/kernel/sync/atomic/ordering.rs

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 65e41dba97b7..9fe5d81fc2a9 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -17,3 +17,6 @@
 //! [`LKMM`]: srctree/tools/memory-mode/
 
 pub mod ops;
+pub mod ordering;
+
+pub use ordering::{Acquire, Full, Relaxed, Release};
diff --git a/rust/kernel/sync/atomic/ordering.rs b/rust/kernel/sync/atomic/ordering.rs
new file mode 100644
index 000000000000..6cf01cd276c6
--- /dev/null
+++ b/rust/kernel/sync/atomic/ordering.rs
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Memory orderings.
+//!
+//! The semantics of these orderings follows the [`LKMM`] definitions and rules.
+//!
+//! - [`Acquire`] and [`Release`] are similar to their counterpart in Rust memory model.
+//! - [`Full`] means "fully-ordered", that is:
+//!   - It provides ordering between all the preceding memory accesses and the annotated operation.
+//!   - It provides ordering between the annotated operation and all the following memory accesses.
+//!   - It provides ordering between all the preceding memory accesses and all the fllowing memory
+//!     accesses.
+//!   - All the orderings are the same strong as a full memory barrier (i.e. `smp_mb()`).
+//! - [`Relaxed`] is similar to the counterpart in Rust memory model, except that dependency
+//!   orderings are also honored in [`LKMM`]. Dependency orderings are described in "DEPENDENCY
+//!   RELATIONS" in [`LKMM`]'s [`explanation`].
+//!
+//! [`LKMM`]: srctree/tools/memory-model/
+//! [`explanation`]: srctree/tools/memory-model/Documentation/explanation.txt
+
+/// The annotation type for relaxed memory ordering.
+pub struct Relaxed;
+
+/// The annotation type for acquire memory ordering.
+pub struct Acquire;
+
+/// The annotation type for release memory ordering.
+pub struct Release;
+
+/// The annotation type for fully-order memory ordering.
+pub struct Full;
+
+/// The trait bound for operations that only support relaxed ordering.
+pub trait RelaxedOnly {}
+
+impl RelaxedOnly for Relaxed {}
+
+/// The trait bound for operations that only support acquire or relaxed ordering.
+pub trait AcquireOrRelaxed {
+    /// Describes whether an ordering is relaxed or not.
+    const IS_RELAXED: bool = false;
+}
+
+impl AcquireOrRelaxed for Acquire {}
+
+impl AcquireOrRelaxed for Relaxed {
+    const IS_RELAXED: bool = true;
+}
+
+/// The trait bound for operations that only support release or relaxed ordering.
+pub trait ReleaseOrRelaxed {
+    /// Describes whether an ordering is relaxed or not.
+    const IS_RELAXED: bool = false;
+}
+
+impl ReleaseOrRelaxed for Release {}
+
+impl ReleaseOrRelaxed for Relaxed {
+    const IS_RELAXED: bool = true;
+}
+
+/// Describes the exact memory ordering of an `impl` [`All`].
+pub enum OrderingDesc {
+    /// Relaxed ordering.
+    Relaxed,
+    /// Acquire ordering.
+    Acquire,
+    /// Release ordering.
+    Release,
+    /// Fully-ordered.
+    Full,
+}
+
+/// The trait bound for annotating operations that should support all orderings.
+pub trait All {
+    /// Describes the exact memory ordering.
+    const ORDER: OrderingDesc;
+}
+
+impl All for Relaxed {
+    const ORDER: OrderingDesc = OrderingDesc::Relaxed;
+}
+
+impl All for Acquire {
+    const ORDER: OrderingDesc = OrderingDesc::Acquire;
+}
+
+impl All for Release {
+    const ORDER: OrderingDesc = OrderingDesc::Release;
+}
+
+impl All for Full {
+    const ORDER: OrderingDesc = OrderingDesc::Full;
+}
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
