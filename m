Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABE0C369D9
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 16:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9YE98jcQRiETlZNVCgts/ysFfDBH4mAgPpSaAIj6bxk=; b=O2OJlpJv/aBl0m
	O9xaLWaAWqusX/WEa9Ggjw+XMWd5Z+gHeIA/kOQY3+i6YPjuXrpcyv7j1fhoHh4f33l8v6rg5r7Qq
	F94PfmTH4Gmc2jBzGFBfW8D+fVEWMSTwQ93M6XoZ87I5+np63fX+D9qyWgWVklAje9T0LyboOOEc3
	zEBIh47ULQD+tMa+cLKVZGWaeKF+ncE8rUhBQeGRsZ4w+q1P+45FzsUrTqM6e3jFd/l0RzlIWhXNo
	YUaanARpbPoK1GK202RGEkScZtK4VdhwKpF838Jd6zH9xwJd6sF/ukSbibSHmM7HwXYiUY05x+QON
	bvPDdEcxDrgM7Pl83QRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uFu-00000004kLj-3iei;
	Mon, 21 Apr 2025 16:44:26 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uEF-00000004jlA-2WhR;
	Mon, 21 Apr 2025 16:42:44 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4774d68c670so48154221cf.0;
        Mon, 21 Apr 2025 09:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253762; x=1745858562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Nnh9FhtmfBr7vF/QXBT4Oa0ku2sBn0D0ph9GeI/BdhY=;
        b=WA4qCljj2BdLgCWHXy9EaAUwBmhEIyjjNRTjOzT99dJLNpNu7aah8N+XdOjWaYYGS9
         6hlGqbRSt9aECOJD/Emu/JSUMIUIsZCQFrHHG2qcliFBMI3Ai1Kj5SsZfFf7i3cgopuh
         idrBx4+Q2jJwGbU8c6IhMBAQTrOADl/AJR01rqyKjMUuR/QJ+L3E2ZuqO7uh2rwUsV0g
         nsANirXPmvR8AsDhi6JsKo6Jyb7gXdaamZtorQwjC1WnYq0cR87Gb0rsyGT8JM1/zIEa
         Dvb20edZVECxAZjy3sOnI3hqOgLJWcrfPdVGG1YwRsDaldOdn06Y1F03M5vIYCvQZGCO
         J+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253762; x=1745858562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nnh9FhtmfBr7vF/QXBT4Oa0ku2sBn0D0ph9GeI/BdhY=;
        b=fdOsHj/Bo6iz63zcpO0V/S23mCSvOgY2wY8Gfd5TlntilVC4wIongHwrUxWWutriqQ
         v9s1+57N/CWnx4raN+kyxJs7OW1s4sVUS8Eo1SieMFy93Z8Rh4mCtPaGtF/yrw/H9SPv
         6Z0kzzSn+6taHzr4ijbR2kCLbWlhdKoREIEAHGekpXPAYrS4KHb6zUBI/h8ge1+J70st
         s+y0p434ichU6JtD0RRSWEOftPy3JxBrJvQQCDMgBDu8mbI4/GDVz6yLp20FrvZBrhfP
         07fbhyMlv6c+UNb+Oj7x3Q550RHwaN99vFzmIxYioEpO8zRSFCtzquXunIC7N9Pm/LRP
         koAA==
X-Forwarded-Encrypted: i=1; AJvYcCUpKMbzpShEmNgSqB95+4tCLORiZfdoa/akWGCuepOPCbEpFy2klf1xU5r7LVLghV4cpqXWHcXcdGue2ZE=@lists.infradead.org, AJvYcCWmcWAV2TIpX9o2hqrX6ESZoSHmwnzkh4mZkpjMv/ZJn8GyIIfpJflxi3RZyGIT2uiMAPoP/7MTu0gDXyRbjgEY@lists.infradead.org
X-Gm-Message-State: AOJu0YxVTzmXrt0R4wN93ZPEgCqW8/I0EguBsOtyXzm2z4KLKpFmJkeA
	7Leuu1aPnVGyf9KtaHHR2dSKGNrQqfQEnGTHRYZJVA3PsuH8x/6s
X-Gm-Gg: ASbGncuYLk5tLrnARuby58R8eToSxa6tUx6ye0X1PenF3/3q/5qCwSDtiWPi4syyQ6O
	xZK1/78JIiCnqMgJgrpGrJd/oo+BgXFWBWdbqq+RdmGyV3y0K9QXM9RNEBebWaeXa3DBqdPcQIq
	PBX338TLcxQ4AV+3IsNLs7USTNlJZFeUb7TSTc11WYh/Jz9Y+cTB774dlMeUZuGk00p8TWvFDJj
	mDKEaIdMiDn9xv/UTf98iNdDRAjkdOhAuzhSrFLoRNSH+wHjO+GgGSs21YAjzeNKXnh0VP7zoAq
	ECgnUqY+oA/aFlRSKt4yvWFqCBxXiUNpZ6a6yycSlVFSzsq8RJ91VQPJ32qQn5BrJaAon0sInQc
	2Lp4OiPrUpKgHKeKmlPhbOtw9aF4nSCo=
X-Google-Smtp-Source: AGHT+IHC/Dq56MCJluGVIJBeEpkDMocnnFXsmiBG2wnX8WM9F2Rlnt1zCMigH9mIoQi7juMLhqL5WA==
X-Received: by 2002:ac8:5f51:0:b0:477:6f6d:607a with SMTP id d75a77b69052e-47aec365c6dmr179026611cf.7.1745253761990;
        Mon, 21 Apr 2025 09:42:41 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c4c608sm44836131cf.41.2025.04.21.09.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:41 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id B3FC11200043;
	Mon, 21 Apr 2025 12:42:40 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 21 Apr 2025 12:42:40 -0400
X-ME-Sender: <xms:gHUGaIw4ht8I9BG7jyLTBlmvr-MLe-t9TJTlZi_VV6u-gXt5dOk8OA>
    <xme:gHUGaMT3-ZOELGT0bnZ6oxTWtJdkqQGs3X_q39W3jtpt5Tuq6yTEUf3RUIK-y9FNA
    dwQEju3TH-J7zR1dA>
X-ME-Received: <xmr:gHUGaKXuGO5wyZWbNV57LvFuEc8hUKL53NN7KW3a0_5_lnyaSZr0UyTyCPdv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefg
    veffieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpeefnecurfgrrh
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
X-ME-Proxy: <xmx:gHUGaGhGBSI7uZwKsbvOikB-hWBjMilvKK-0c8g_Jju_KWk5mFMmuQ>
    <xmx:gHUGaKAupI0L0u_yDuo_TOaX22zCZBsUY2OIZ_OQ3VQV8myykuUTpQ>
    <xmx:gHUGaHI2Mg3Q_2Hbg0J2RvbwoydBS7nRu5JM5CIs956Ef7aD495wjA>
    <xmx:gHUGaBAsATswnzCE-eMo62aGs_S82NbiQ5bx_EZT4xF9e0-HoxaDTQ>
    <xmx:gHUGaKzvhrTbtf5Rqnzg9wO9YFe8WRGwmk7jQQ0r0nnKJQD_8je7OUw0>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:39 -0400 (EDT)
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
Subject: [RFC v3 06/12] rust: sync: atomic: Add the framework of arithmetic operations
Date: Mon, 21 Apr 2025 09:42:15 -0700
Message-ID: <20250421164221.1121805-7-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250421164221.1121805-1-boqun.feng@gmail.com>
References: <20250421164221.1121805-1-boqun.feng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_094243_648362_A69858F2 
X-CRM114-Status: GOOD (  16.90  )
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

One important set of atomic operations is the arithmetic operations,
i.e. add(), sub(), fetch_add(), add_return(), etc. However it may not
make senses for all the types that `AllowAtomic` to have arithmetic
operations, for example a `Foo(u32)` may not have a reasonable add() or
sub(), plus subword types (`u8` and `u16`) currently don't have
atomic arithmetic operations even on C side and might not have them in
the future in Rust (because they are usually suboptimal on a few
architecures). Therefore add a subtrait of `AllowAtomic` describing
which types have and can do atomic arithemtic operations.

A few things about this `AllowAtomicArithmetic` trait:

* It has an associate type `Delta` instead of using
  `AllowAllowAtomic::Repr` because, a `Bar(u32)` (whose `Repr` is `i32`)
  may not wants an `add(&self, i32)`, but an `add(&self, u32)`.

* `AtomicImpl` types already implement an `AtomicHasArithmeticOps`
  trait, so add blanket implementation for them. In the future, `i8` and
  `i16` may impl `AtomicImpl` but not `AtomicHasArithmeticOps` if
  arithemtic operations are not available.

Only add() and fetch_add() are added. The rest will be added in the
future.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic/generic.rs | 102 +++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
index 73aacfac381b..2de4cdbce58e 100644
--- a/rust/kernel/sync/atomic/generic.rs
+++ b/rust/kernel/sync/atomic/generic.rs
@@ -3,6 +3,7 @@
 //! Generic atomic primitives.
 
 use super::ops::*;
+use super::ordering;
 use super::ordering::*;
 use crate::types::Opaque;
 
@@ -55,6 +56,23 @@ fn from_repr(repr: Self::Repr) -> Self {
     }
 }
 
+/// Atomics that allows arithmetic operations with an integer type.
+pub trait AllowAtomicArithmetic: AllowAtomic {
+    /// The delta types for arithmetic operations.
+    type Delta;
+
+    /// Converts [`Self::Delta`] into the representation of the atomic type.
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr;
+}
+
+impl<T: AtomicImpl + AtomicHasArithmeticOps> AllowAtomicArithmetic for T {
+    type Delta = Self;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d
+    }
+}
+
 impl<T: AllowAtomic> Atomic<T> {
     /// Creates a new atomic.
     pub const fn new(v: T) -> Self {
@@ -374,3 +392,87 @@ fn try_cmpxchg<Ordering: All>(&self, old: &mut T, new: T, _: Ordering) -> bool {
         }
     }
 }
+
+impl<T: AllowAtomicArithmetic> Atomic<T>
+where
+    T::Repr: AtomicHasArithmeticOps,
+{
+    /// Atomic add.
+    ///
+    /// The addition is a wrapping addition.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{Atomic, Relaxed};
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    ///
+    /// x.add(12, Relaxed);
+    ///
+    /// assert_eq!(54, x.load(Relaxed));
+    /// ```
+    #[inline(always)]
+    pub fn add<Ordering: RelaxedOnly>(&self, v: T::Delta, _: Ordering) {
+        let v = T::delta_into_repr(v);
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_add() function:
+        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
+        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
+        //   - per the type invariants, the following atomic operation won't cause data races.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
+        //   - atomic operations are used here.
+        unsafe {
+            T::Repr::atomic_add(a, v);
+        }
+    }
+
+    /// Atomic fetch and add.
+    ///
+    /// The addition is a wrapping addition.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{Atomic, Acquire, Full, Relaxed};
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    ///
+    /// assert_eq!(54, { x.fetch_add(12, Acquire); x.load(Relaxed) });
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    ///
+    /// assert_eq!(54, { x.fetch_add(12, Full); x.load(Relaxed) } );
+    /// ```
+    #[inline(always)]
+    pub fn fetch_add<Ordering: All>(&self, v: T::Delta, _: Ordering) -> T {
+        let v = T::delta_into_repr(v);
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_fetch_add*() function:
+        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
+        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
+        //   - per the type invariants, the following atomic operation won't cause data races.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
+        //   - atomic operations are used here.
+        let ret = unsafe {
+            match Ordering::ORDER {
+                ordering::OrderingDesc::Full => T::Repr::atomic_fetch_add(a, v),
+                ordering::OrderingDesc::Acquire => T::Repr::atomic_fetch_add_acquire(a, v),
+                ordering::OrderingDesc::Release => T::Repr::atomic_fetch_add_release(a, v),
+                ordering::OrderingDesc::Relaxed => T::Repr::atomic_fetch_add_relaxed(a, v),
+            }
+        };
+
+        T::from_repr(ret)
+    }
+}
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
