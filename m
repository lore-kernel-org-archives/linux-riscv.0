Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA8DC369D5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+2cRbD/VJmN9IVEGoP03iGKQd3Us1zqiE9U6eAC2Nw4=; b=OouWF1Rt4Klx+k
	V0EqAqktsPNuS/fU4etnA4chrG2CPCABNQ/Fx8SW3SnCDe8F6tEFPN/jnGXZLgd7yc7ljTS6JAN2t
	deG75GDVlOJl65chwm/pv7ru+NsWIX2VMsUh9VuZwQC7sLDisOj8BnwIHwa6WWkQwyoY0M4uHTCUM
	0Py+e/OMDuoHoUVAKoAxm7cR+ShXo8zor2hBtXQ7TdYIFkBu5Hee4Xjl9lVYfk5jbOzgnGSc4lPUF
	og55FBmTGzHoBu3wXg+rXpTwf9LBsQZBwoIi5R2XReOzPTAHC5O7Ekc40ZB7YUUdZc+paaD80q/MY
	UA2IN03CoR9aLhvF+yIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uFu-00000004kL1-14ZF;
	Mon, 21 Apr 2025 16:44:26 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uEC-00000004jiW-1RDN;
	Mon, 21 Apr 2025 16:42:41 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-476ac73c76fso44288281cf.0;
        Mon, 21 Apr 2025 09:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253759; x=1745858559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mtEl5+XBMA+ykf0aS94gSaUF58JxAYctve/OxyPQc2g=;
        b=hROkSdSk+z67+aYPDgOHyI07+oF5MkXLUnwaoCbRZ62C98ApLPnv3LJiDMXqzioB+y
         LoG8UJQ6gfIpdmsbCvSwmu7QpiC9KOUykbUxhuiVHEiskbHwkkbLSr9y+QLYqF6WiUPG
         WhUZEdthsehcMiuVUSsWqCEiKYe876XYrFfuIdadSwjafQm+lzzfNeQWNo9D9dFs7rLp
         q6rjNdfyfJ0AIskwCMuR6BwJ9Wo3SKwrDiolgVWzZ3vKd6QXk6f2/lkRv1kCFi7YWHxO
         4DHpj0XqRHSq+C6l72HpISbjkjC5jatSTaSsZAT6A4FwrMvwwSs8F6O0JwV1hWC0LB0O
         Ro/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253759; x=1745858559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mtEl5+XBMA+ykf0aS94gSaUF58JxAYctve/OxyPQc2g=;
        b=ZLyiZGdNcMRNJR1k7DLKlpbAtt6Y4RVzmIG+9dEoKyiRDqBFRR8a4xGpqMf/WtxQ6q
         nBRmTzv0lf8CRZ/cmzTl/FoTcawGuR4fiDkrs/yF4JDgW7IVroXZ1PaHi9eCEQSD+I1k
         xy1YCdH7LZElsD4QC2VSZCx7V4jaCFJMdLWOF3Owl2wT4MkGqmikHNNodTG1aJGbQX0L
         ZfZsYx9mjBL5+JJhRNdJZ28D2kbJAghoFWGmsr8MdhjRua1JaZuBFxhNFGPyjRL9eXD1
         PWKGCy7PDqY4uAaIk1CpeqkD6Ny3TM9pCHZdYVT/0YKoiHTyLnh2PrPOzqgC+sjwZ++7
         dsUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgDBxTMvT2Tn4hKMqicpBBfA6XoTsxeDw/ec7ydR9u5uzFzZ7rcYqx2MuHOYBDzAU7YFxCJBGfqf8voyK9KJof@lists.infradead.org, AJvYcCWSK44Mpr2gSOZL4jgrffHlXyW5/epgep6hW9Im2KPknLhhHDFtWTV7buedBufXFklNcbgme7jDXwWYM64=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHdIsiWb+v+vps8iLky8cJzh6heyPUaHhkuEkDUbomVSyxLh8i
	WAPr4yNLzhNNlphM63Yl6m510tUj1Xt6G3RvOWaCnJPUVc1pYKoi
X-Gm-Gg: ASbGncuzpKR/S/9uZdafAqr9OC1RNqnI6AitCNkPT11kwfZLlDzXY+jQIuUgVB7DkCc
	lJYcL6n9ASVgWgNbhpImVpwOhat7re/3Xwjr0x7Fs09S2ZkmjcZDRhuaLWYKDHmrYuDDIz2boaa
	hyuPd/btxDvFGsVpRBeFzu09yICByUcEoOn0essRkQgcu5hC7bgHArhFNooEYRFoDBI2QjsxmIg
	0758OkgYCtvhlaXgpUlAAijuw32pw3tbzlTBdNeavGjQfT1zOsmwsuotllo8d97ZKJPnDNE4nt4
	vd0BMbYvCDm5t1tq6Ees7Ug+CZENYSkqrLiPNZHQ5SEDBaTlwGu+I/RNELFQOsiCj9Nd973ZTjB
	ddOWKOMRooqhKilugE7C5h99xbfjrGjw=
X-Google-Smtp-Source: AGHT+IGNPFDQnaYsAPrrB+ZHJHPhfIvmVtPL73QKtSw6wt4BJSgxiNoGFDXdF3V6ATBBFg5JyjSiRg==
X-Received: by 2002:ac8:584b:0:b0:476:9180:6c27 with SMTP id d75a77b69052e-47aec39237bmr224683501cf.13.1745253758702;
        Mon, 21 Apr 2025 09:42:38 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c3b0d0sm43749231cf.31.2025.04.21.09.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:38 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5C9F31200043;
	Mon, 21 Apr 2025 12:42:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Mon, 21 Apr 2025 12:42:37 -0400
X-ME-Sender: <xms:fXUGaOgeUTbOSeG6-rL8BR66MukOcH7dgFzfqaJ1kU-TMbPqS0NcWA>
    <xme:fXUGaPC0JPithm7ku-MTuE8SYqZO0qj8lH2ELNT894XaAtdNT7eyjqqfCFVv5tBXR
    lmB_z5GfD-O4EC2aw>
X-ME-Received: <xmr:fXUGaGEC0YaTEstUWd6Py6YmCAZ5eECDr8Pw2ywE1KT_chvNTvJoNlCHRQmb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufeehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:fXUGaHSVcMMOKEX5eHUe_L9xUQs3c4yn8dRmXrVh-VkFKptxfXwq4Q>
    <xmx:fXUGaLyeafgXaQDiIGRrxuhN3-Cp5l-YSmv3NWSj95Arpa6fx3nWiw>
    <xmx:fXUGaF4azIdFjAaJaFdqxGKbtaXglcgfQI88uvyA7vr0fs5mB1L2aQ>
    <xmx:fXUGaIw_3XbVpMFDJydXTxDeAbviRUJk_6vS0_CldfLa2xbINaIlOQ>
    <xmx:fXUGaHijDGk-MM9CToJDmhs_nJC5r9ZIz1cr5232kAJHfh06jQhL-_bX>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:36 -0400 (EDT)
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
Subject: [RFC v3 04/12] rust: sync: atomic: Add generic atomics
Date: Mon, 21 Apr 2025 09:42:13 -0700
Message-ID: <20250421164221.1121805-5-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250421164221.1121805-1-boqun.feng@gmail.com>
References: <20250421164221.1121805-1-boqun.feng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_094240_385520_E3390761 
X-CRM114-Status: GOOD (  25.31  )
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

To provide using LKMM atomics for Rust code, a generic `Atomic<T>` is
added, currently `T` needs to be Send + Copy because these are the
straightforward usages and all basic types support this. The trait
`AllowAtomic` should be only implemented inside atomic mod until the
generic atomic framework is mature enough (unless the implementer is a
`#[repr(transparent)]` new type).

`AtomicImpl` types are automatically `AllowAtomic`, and so far only
basic operations load() and store() are introduced.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs         |   2 +
 rust/kernel/sync/atomic/generic.rs | 254 +++++++++++++++++++++++++++++
 2 files changed, 256 insertions(+)
 create mode 100644 rust/kernel/sync/atomic/generic.rs

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 9fe5d81fc2a9..a01e44eec380 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -16,7 +16,9 @@
 //!
 //! [`LKMM`]: srctree/tools/memory-mode/
 
+pub mod generic;
 pub mod ops;
 pub mod ordering;
 
+pub use generic::Atomic;
 pub use ordering::{Acquire, Full, Relaxed, Release};
diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
new file mode 100644
index 000000000000..5d8bbaaf108e
--- /dev/null
+++ b/rust/kernel/sync/atomic/generic.rs
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic atomic primitives.
+
+use super::ops::*;
+use super::ordering::*;
+use crate::types::Opaque;
+
+/// A generic atomic variable.
+///
+/// `T` must impl [`AllowAtomic`], that is, an [`AtomicImpl`] has to be chosen.
+///
+/// # Invariants
+///
+/// Doing an atomic operation while holding a reference of [`Self`] won't cause a data race, this
+/// is guaranteed by the safety requirement of [`Self::from_ptr`] and the extra safety requirement
+/// of the usage on pointers returned by [`Self::as_ptr`].
+#[repr(transparent)]
+pub struct Atomic<T: AllowAtomic>(Opaque<T>);
+
+// SAFETY: `Atomic<T>` is safe to share among execution contexts because all accesses are atomic.
+unsafe impl<T: AllowAtomic> Sync for Atomic<T> {}
+
+/// Atomics that support basic atomic operations.
+///
+/// TODO: Currently the [`AllowAtomic`] types are restricted within basic integer types (and their
+/// transparent new types). In the future, we could extend the scope to more data types when there
+/// is a clear and meaningful usage, but for now, [`AllowAtomic`] should only be implemented inside
+/// atomic mod for the restricted types mentioned above.
+///
+/// # Safety
+///
+/// [`Self`] must have the same size and alignment as [`Self::Repr`].
+pub unsafe trait AllowAtomic: Sized + Send + Copy {
+    /// The backing atomic implementation type.
+    type Repr: AtomicImpl;
+
+    /// Converts into a [`Self::Repr`].
+    fn into_repr(self) -> Self::Repr;
+
+    /// Converts from a [`Self::Repr`].
+    fn from_repr(repr: Self::Repr) -> Self;
+}
+
+// SAFETY: `T::Repr` is `Self` (i.e. `T`), so they have the same size and alignment.
+unsafe impl<T: AtomicImpl> AllowAtomic for T {
+    type Repr = Self;
+
+    fn into_repr(self) -> Self::Repr {
+        self
+    }
+
+    fn from_repr(repr: Self::Repr) -> Self {
+        repr
+    }
+}
+
+impl<T: AllowAtomic> Atomic<T> {
+    /// Creates a new atomic.
+    pub const fn new(v: T) -> Self {
+        Self(Opaque::new(v))
+    }
+
+    /// Creates a reference to [`Self`] from a pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` has to be a valid pointer.
+    /// - `ptr` has to be valid for both reads and writes for the whole lifetime `'a`.
+    /// - For the whole lifetime of '`a`, other accesses to the object cannot cause data races
+    ///   (defined by [`LKMM`]) against atomic operations on the returned reference.
+    ///
+    /// [`LKMM`]: srctree/tools/memory-model
+    ///
+    /// # Examples
+    ///
+    /// Using [`Atomic::from_ptr()`] combined with [`Atomic::load()`] or [`Atomic::store()`] can
+    /// achieve the same functionality as `READ_ONCE()`/`smp_load_acquire()` or
+    /// `WRITE_ONCE()`/`smp_store_release()` in C side:
+    ///
+    /// ```rust
+    /// # use kernel::types::Opaque;
+    /// use kernel::sync::atomic::{Atomic, Relaxed, Release};
+    ///
+    /// // Assume there is a C struct `Foo`.
+    /// mod cbindings {
+    ///     #[repr(C)]
+    ///     pub(crate) struct foo { pub(crate) a: i32, pub(crate) b: i32 }
+    /// }
+    ///
+    /// let tmp = Opaque::new(cbindings::foo { a: 1, b: 2});
+    ///
+    /// // struct foo *foo_ptr = ..;
+    /// let foo_ptr = tmp.get();
+    ///
+    /// // SAFETY: `foo_ptr` is a valid pointer, and `.a` is inbound.
+    /// let foo_a_ptr = unsafe { core::ptr::addr_of_mut!((*foo_ptr).a) };
+    ///
+    /// // a = READ_ONCE(foo_ptr->a);
+    /// //
+    /// // SAFETY: `foo_a_ptr` is a valid pointer for read, and all accesses on it is atomic, so no
+    /// // data race.
+    /// let a = unsafe { Atomic::from_ptr(foo_a_ptr) }.load(Relaxed);
+    /// # assert_eq!(a, 1);
+    ///
+    /// // smp_store_release(&foo_ptr->a, 2);
+    /// //
+    /// // SAFETY: `foo_a_ptr` is a valid pointer for write, and all accesses on it is atomic, so no
+    /// // data race.
+    /// unsafe { Atomic::from_ptr(foo_a_ptr) }.store(2, Release);
+    /// ```
+    ///
+    /// However, this should be only used when communicating with C side or manipulating a C struct.
+    pub unsafe fn from_ptr<'a>(ptr: *mut T) -> &'a Self
+    where
+        T: Sync,
+    {
+        // CAST: `T` is transparent to `Atomic<T>`.
+        // SAFETY: Per function safety requirement, `ptr` is a valid pointer and the object will
+        // live long enough. It's safe to return a `&Atomic<T>` because function safety requirement
+        // guarantees other accesses won't cause data races.
+        unsafe { &*ptr.cast::<Self>() }
+    }
+
+    /// Returns a pointer to the underlying atomic variable.
+    ///
+    /// Extra safety requirement on using the return pointer: the operations done via the pointer
+    /// cannot cause data races defined by [`LKMM`].
+    ///
+    /// [`LKMM`]: srctree/tools/memory-model
+    pub const fn as_ptr(&self) -> *mut T {
+        self.0.get()
+    }
+
+    /// Returns a mutable reference to the underlying atomic variable.
+    ///
+    /// This is safe because the mutable reference of the atomic variable guarantees the exclusive
+    /// access.
+    pub fn get_mut(&mut self) -> &mut T {
+        // SAFETY: `self.as_ptr()` is a valid pointer to `T`, and the object has already been
+        // initialized. `&mut self` guarantees the exclusive access, so it's safe to reborrow
+        // mutably.
+        unsafe { &mut *self.as_ptr() }
+    }
+}
+
+impl<T: AllowAtomic> Atomic<T>
+where
+    T::Repr: AtomicHasBasicOps,
+{
+    /// Loads the value from the atomic variable.
+    ///
+    /// # Examples
+    ///
+    /// Simple usages:
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{Atomic, Relaxed};
+    ///
+    /// let x = Atomic::new(42i32);
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    ///
+    /// let x = Atomic::new(42i64);
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    /// ```
+    ///
+    /// Customized new types in [`Atomic`]:
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{generic::AllowAtomic, Atomic, Relaxed};
+    ///
+    /// #[derive(Clone, Copy)]
+    /// #[repr(transparent)]
+    /// struct NewType(u32);
+    ///
+    /// // SAFETY: `NewType` is transparent to `u32`, which has the same size and alignment as
+    /// // `i32`.
+    /// unsafe impl AllowAtomic for NewType {
+    ///     type Repr = i32;
+    ///
+    ///     fn into_repr(self) -> Self::Repr {
+    ///         self.0 as i32
+    ///     }
+    ///
+    ///     fn from_repr(repr: Self::Repr) -> Self {
+    ///         NewType(repr as u32)
+    ///     }
+    /// }
+    ///
+    /// let n = Atomic::new(NewType(0));
+    ///
+    /// assert_eq!(0, n.load(Relaxed).0);
+    /// ```
+    #[inline(always)]
+    pub fn load<Ordering: AcquireOrRelaxed>(&self, _: Ordering) -> T {
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_read*() function:
+        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
+        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
+        //   - per the type invariants, the following atomic operation won't cause data races.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
+        //   - atomic operations are used here.
+        let v = unsafe {
+            if Ordering::IS_RELAXED {
+                T::Repr::atomic_read(a)
+            } else {
+                T::Repr::atomic_read_acquire(a)
+            }
+        };
+
+        T::from_repr(v)
+    }
+
+    /// Stores a value to the atomic variable.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{Atomic, Relaxed};
+    ///
+    /// let x = Atomic::new(42i32);
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    ///
+    /// x.store(43, Relaxed);
+    ///
+    /// assert_eq!(43, x.load(Relaxed));
+    /// ```
+    ///
+    #[inline(always)]
+    pub fn store<Ordering: ReleaseOrRelaxed>(&self, v: T, _: Ordering) {
+        let v = T::into_repr(v);
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_set*() function:
+        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
+        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
+        //   - per the type invariants, the following atomic operation won't cause data races.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
+        //   - atomic operations are used here.
+        unsafe {
+            if Ordering::IS_RELAXED {
+                T::Repr::atomic_set(a, v)
+            } else {
+                T::Repr::atomic_set_release(a, v)
+            }
+        };
+    }
+}
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
