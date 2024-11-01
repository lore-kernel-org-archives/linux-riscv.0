Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9195EE674A7
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 06:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8e29Ow3MQkPZd5AI6hG3pqxL0DWikk9cRiEQylDNl4g=; b=vtE8XO3CVHfqls
	f+Q1uScc1qm3iqIugIgZMzltAPsaWQQbrHG4etNjtNdCHEqc14vJPNR75hcwFu9XKggM6R2Y1FXc+
	swNKMAPJBGh8SC93hC30e6hnBD5QQ2oefa0XVLBgTSxhjGEHqdvVQ3hYhRI2w3wgO3ureTVfe3dtb
	5QANmiPNgJ15eWAepgv84QJeIwtFJqfkk0PWjYKaXGPUYhJRu58xZFaw4fk7TCwZvmyUvouzzQiT1
	azD1y4fqxRzSHIytoWMIbw0YF3fGccuWZZ2Jgpp/KJHfBwviofN06e7P5eof0x57OQfIyhKNcbar4
	bpy5e4lcAldg4q4w4VoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6kln-00000005tvt-1Oh2;
	Fri, 01 Nov 2024 06:04:27 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6klO-00000005tbB-147n;
	Fri, 01 Nov 2024 06:04:04 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7b14443a71eso130453485a.1;
        Thu, 31 Oct 2024 23:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730441040; x=1731045840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ur8oT6TSfzITnezWCsfVdDRwD9KFpZB0nobhPnadT3A=;
        b=CCLjcpRw19GWEJJh6VqdX2PysvDzPfqhZBVHInwthQVJPQqOOpkxqMYOUm19mbY7N3
         objHZz5IDmebPbGl0nkhY6WsQCWDUxscZNnEyKHvbA+E4mv4MrvdUAynInk5vtsG2z9J
         WDsXCeMCrRqdot3BrRowOZF0YR44FCe3qTgnamNFuzIKaxcooiKrE6pP886ilgPPX+e3
         GmvF5fFGbP0J7yqQG+EmAwnFbnUK1DL+eW/j0gAb0TEu+J3pwMmJlRd1qJdhJTrHlPxQ
         GypK0PkTF8H6KrPTMIub+W01ySuRDIq87S/vhRrc3eyjSHwgtQ5KuXR60SlRXy0Hbkpe
         wE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730441040; x=1731045840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ur8oT6TSfzITnezWCsfVdDRwD9KFpZB0nobhPnadT3A=;
        b=uPlZy9hk7fwWHP/8gm/4zE3DGORU2aTMEwlAR0uKLirSGmvbo0LlEo4q+/jRlxEm4d
         A2MomAvutxmJaqw4lOHH/AHiVzp2isSfrGNqf2T4WNaZXQ5Fiq3Em5vMkcCUYRCsTZtN
         +mXvYbP01ioHpiArFJmFqqNqSJGOXA1TpdoO+7taAobxHqbT+3SkvQjyALA8rbeLJiD2
         EIKw0Bv9JKmvREfY6VdexKcnnovHk6aHoZTDEYRFndazUVsba176BDbdT+RWSYuKlk4V
         ypC8XmOjP04LP0TqTUtapcctvkXMZ3OnKRXdmxIsYnECWXy/azsElTH2qMTraj3QGD+J
         m55w==
X-Forwarded-Encrypted: i=1; AJvYcCWSsAklaWjFI+mDgUXx5+m/2OmLDoh7yJzVf7NTOMa+STvSxm+dOdm8b9SYTPuqzTequhDCXG7uYpHzSVR1NfHN@lists.infradead.org, AJvYcCWajnb7eil9TrNfwvpdeVXZfzjZGjnrNXj9LKKA9APliKWhzH2oukXL+4QscaZReakJNe1fk06+ei33XQU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRKQ0SqCTExAqZaM1E4ha5dA8K7j1DWEQjKKKbv0yOiShejdrn
	W/igMdxgPtRyRacKZ623/sCejy0ah36Wt0fFrI0q0g5B3dILNTkF
X-Google-Smtp-Source: AGHT+IHO2JUhplW8iilOvtM5e4INFkg7USsOlc635bnnus8LfOPdYPvJqkEhNlBqoPPv/DQBHarZ5A==
X-Received: by 2002:a05:620a:294b:b0:7b1:5424:e994 with SMTP id af79cd13be357-7b2fb97a6demr311264085a.26.1730441040331;
        Thu, 31 Oct 2024 23:04:00 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f3a6fdd9sm140671785a.86.2024.10.31.23.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 23:04:00 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 27C0D1200043;
	Fri,  1 Nov 2024 02:03:59 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 01 Nov 2024 02:03:59 -0400
X-ME-Sender: <xms:T28kZxUrv7sWy1Iy0Y_-A98MxDQopFJUyepQ6_jEtFuUO0VlQpRCAg>
    <xme:T28kZxlSbOZXry3q5AIpbFrxpi1pvn9EpRKz3XwDZzZwLq2AT5Ll-E6ahoMm4CEJN
    wuCVFJahoiGb9qucA>
X-ME-Received: <xmr:T28kZ9bCTcIRcOab_gwEVKz_ff1dAmFkGJk255WgaqbZgIORD7KnMrTpFqI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekkedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefgveff
    ieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepheejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtg
    hpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepohhj
    vggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesgh
    hmrghilhdrtghomhdprhgtphhtthhopeifvggushhonhgrfhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:T28kZ0WlUw590Gddo92AqC0vBYevx1g7hjhaVbrxIMVpD8vd_qEfHA>
    <xmx:T28kZ7kg-a1yDGNDMrtNzNRb7BDZylw9NeAtc_YBsnNfNiFL1hVFFA>
    <xmx:T28kZxfB6_9Aeir16tYOpMaviis25YyiqPeCrFK2vjQDNhO0eYxXxg>
    <xmx:T28kZ1FyrSw-QoGfmf5oClz5J2wyqQRNgVvLFoGOz60UQ_TDb-UQyA>
    <xmx:T28kZ1k_64ODe8frssnJg4tv1MW27bQbWJH7GtBp44HeMT9XwpVlDAzF>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 02:03:58 -0400 (EDT)
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
	linux-riscv@lists.infradead.org
Subject: [RFC v2 05/13] rust: sync: atomic: Add atomic {cmp,}xchg operations
Date: Thu, 31 Oct 2024 23:02:28 -0700
Message-ID: <20241101060237.1185533-6-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101060237.1185533-1-boqun.feng@gmail.com>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_230402_451541_936AFB46 
X-CRM114-Status: GOOD (  20.60  )
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

xchg() and cmpxchg() are basic operations on atomic. Provide these based
on C APIs.

Note that cmpxchg() use the similar function signature as
compare_exchange() in Rust std: returning a `Result`, `Ok(old)` means
the operation succeeds and `Err(old)` means the operation fails. With
the compiler optimization and inline helpers, it should provides the
same efficient code generation as using atomic_try_cmpxchg() or
atomic_cmpxchg() correctly.

Except it's not! Because of commit 44fe84459faf ("locking/atomic: Fix
atomic_try_cmpxchg() semantics"), the atomic_try_cmpxchg() on x86 has a
branch even if the caller doesn't care about the success of cmpxchg and
only wants to use the old value. For example, for code like:

    // Uses the latest value regardlessly, same as atomic_cmpxchg() in C.
    let latest = x.cmpxchg(42, 64, Full).unwrap_or_else(|old| old);

It will still generate code:

    movl    $0x40, %ecx
    movl    $0x34, %eax
    lock
    cmpxchgl        %ecx, 0x4(%rsp)
    jne     1f
2:
...
1:  movl    %eax, %ecx
    jmp 2b

Attempting to write an x86 try_cmpxchg_exclusive() for Rust use only,
because the Rust function takes a `&mut` for old pointer, which must be
exclusive to the function, therefore it's unsafe to use some shared
pointer. But maybe I'm missing something?

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic/generic.rs | 151 +++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
index 204da38e2691..bfccc4336c75 100644
--- a/rust/kernel/sync/atomic/generic.rs
+++ b/rust/kernel/sync/atomic/generic.rs
@@ -251,3 +251,154 @@ pub fn store<Ordering: ReleaseOrRelaxed>(&self, v: T, _: Ordering) {
         };
     }
 }
+
+impl<T: AllowAtomic> Atomic<T>
+where
+    T::Repr: AtomicHasXchgOps,
+{
+    /// Atomic exchange.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{Atomic, Acquire, Relaxed};
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// assert_eq!(42, x.xchg(52, Acquire));
+    /// assert_eq!(52, x.load(Relaxed));
+    /// ```
+    #[inline(always)]
+    pub fn xchg<Ordering: All>(&self, v: T, _: Ordering) -> T {
+        let v = T::into_repr(v);
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_xchg*() function:
+        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
+        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
+        //   - per the type invariants, the following atomic operation won't cause data races.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
+        //   - atomic operations are used here.
+        let ret = unsafe {
+            match Ordering::ORDER {
+                OrderingDesc::Full => T::Repr::atomic_xchg(a, v),
+                OrderingDesc::Acquire => T::Repr::atomic_xchg_acquire(a, v),
+                OrderingDesc::Release => T::Repr::atomic_xchg_release(a, v),
+                OrderingDesc::Relaxed => T::Repr::atomic_xchg_relaxed(a, v),
+            }
+        };
+
+        T::from_repr(ret)
+    }
+
+    /// Atomic compare and exchange.
+    ///
+    /// Compare: The comparison is done via the byte level comparison between the atomic variables
+    /// with the `old` value.
+    ///
+    /// Ordering: A failed compare and exchange does provide anything, the read part of a failed
+    /// cmpxchg should be treated as a relaxed read.
+    ///
+    /// Returns `Ok(value)` if cmpxchg succeeds, and `value` is guaranteed to be equal to `old`,
+    /// otherwise returns `Err(value)`, and `value` is the value of the atomic variable when cmpxchg
+    /// was happening.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{Atomic, Full, Relaxed};
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// // Checks whether cmpxchg succeeded.
+    /// let success = x.cmpxchg(52, 64, Relaxed).is_ok();
+    /// # assert!(!success);
+    ///
+    /// // Checks whether cmpxchg failed.
+    /// let failure = x.cmpxchg(52, 64, Relaxed).is_err();
+    /// # assert!(failure);
+    ///
+    /// // Uses the old value if failed, probably re-try cmpxchg.
+    /// match x.cmpxchg(52, 64, Relaxed) {
+    ///     Ok(_) => { },
+    ///     Err(old) => {
+    ///         // do something with `old`.
+    ///         # assert_eq!(old, 42);
+    ///     }
+    /// }
+    ///
+    /// // Uses the latest value regardlessly, same as atomic_cmpxchg() in C.
+    /// let latest = x.cmpxchg(42, 64, Full).unwrap_or_else(|old| old);
+    /// # assert_eq!(42, latest);
+    /// assert_eq!(64, x.load(Relaxed));
+    /// ```
+    #[inline(always)]
+    pub fn cmpxchg<Ordering: All>(&self, mut old: T, new: T, o: Ordering) -> Result<T, T> {
+        if self.try_cmpxchg(&mut old, new, o) {
+            Ok(old)
+        } else {
+            Err(old)
+        }
+    }
+
+    /// Atomic compare and exchange and returns whether the operation succeeds.
+    ///
+    /// "Compare" and "Ordering" part are the same as [`Atomic::cmpxchg`].
+    ///
+    /// Returns `true` means the cmpxchg succeeds otherwise returns `false` with `old` updated to
+    /// the value of the atomic variable when cmpxchg was happening.
+    #[inline(always)]
+    fn try_cmpxchg<Ordering: All>(&self, old: &mut T, new: T, _: Ordering) -> bool {
+        let old = (old as *mut T).cast::<T::Repr>();
+        let new = T::into_repr(new);
+        let a = self.0.get().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_try_cmpchg*() function:
+        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
+        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
+        //   - per the type invariants, the following atomic operation won't cause data races.
+        //   - `old` is a valid pointer to write because it comes from a mutable reference.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
+        //   - atomic operations are used here.
+        unsafe {
+            match Ordering::ORDER {
+                OrderingDesc::Full => T::Repr::atomic_try_cmpxchg(a, old, new),
+                OrderingDesc::Acquire => T::Repr::atomic_try_cmpxchg_acquire(a, old, new),
+                OrderingDesc::Release => T::Repr::atomic_try_cmpxchg_release(a, old, new),
+                OrderingDesc::Relaxed => T::Repr::atomic_try_cmpxchg_relaxed(a, old, new),
+            }
+        }
+    }
+
+    /// Atomic compare and exchange and return the [`Result`].
+    ///
+    /// "Compare" and "Ordering" part are the same as [`Atomic::cmpxchg`].
+    ///
+    /// Returns `Ok(value)` if cmpxchg succeeds, and `value` is guaranteed to be equal to `old`,
+    /// otherwise returns `Err(value)`, and `value` is the value of the atomic variable when cmpxchg
+    /// was happening.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{Atomic, Acquire, Relaxed};
+    ///
+    /// let x = Atomic::new(42i32);
+    ///
+    /// assert!(x.compare_exchange(52, 64, Acquire).is_err());
+    /// assert_eq!(42, x.load(Relaxed));
+    ///
+    /// assert!(x.compare_exchange(42, 64, Acquire).is_ok());
+    /// assert_eq!(64, x.load(Relaxed));
+    /// ```
+    #[inline(always)]
+    pub fn compare_exchange<Ordering: All>(&self, mut old: T, new: T, o: Ordering) -> Result<T, T> {
+        if self.try_cmpxchg(&mut old, new, o) {
+            Ok(old)
+        } else {
+            Err(old)
+        }
+    }
+}
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
