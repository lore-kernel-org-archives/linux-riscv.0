Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99025C369D5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 16:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1PR86ak4ESZULlScY0JbMlOw6v152YHdOJzOG0NFcY=; b=clEZX9sIQgQjmf
	wYOicVOP0tvWO01aHWPmKeMqcN9Gj83MHMDXIiYhiNfU7EgIZuTTfsTeQNVNGz4h2+P5FbkktMZEy
	L7zVnG3+rlRnCsYiyy9sEb1SyGfno6N097DUvPj6NjyRv9mR+1D43gkQAiNAVo8TJQ/+v5IiE2kd5
	8+EbI7i1iMnwrQGWlHE/FHknK7SSQf2So9nw3wrDFVgmW0CIICaqeyFWz+tGV/EybMFIchbKtio/0
	LR7Im2r5gFZL+FPZC3hMW46/mQIg6fPgUlPIhWzxw40HFgwYttrV82xtbsvhzQWn0FRCc3H2aFvjA
	QBZRAuHoOXG3EwlEbKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uG3-00000004kY0-3quC;
	Mon, 21 Apr 2025 16:44:35 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uEJ-00000004joG-2d6r;
	Mon, 21 Apr 2025 16:42:49 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6e8f05acc13so55461376d6.2;
        Mon, 21 Apr 2025 09:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253767; x=1745858567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CEsQWBCXRVwADjexG++NYp0pc0xQK2w2I3VkfiuwbTM=;
        b=JAf06Y9KKRh8R45/yIoaaanh+zvk5PI2hgIGnsXpAzvRy0wuqyJgB+oIbcqQ/WQMF3
         HRiGpHq9r5w9ncLRkU0cMwP20MDtFBK+WXm9YgpnLFGDOBb+wY8Ro4Nrczlb3hFXVNcY
         SIbTXqUYbzk9E0l/5rsIob3SWrUE8o1sv3Y5N7S6/ethAbhvI86cZGVWGsgku/g8etRu
         7Y71VoyOAeDJtx16JmEulO/fyWrwxfq/ykdSk6eyTyvasD+nJlubdbywNzX7JxbJ86Bj
         9Xkg2/5PNn+KPM6a+xva4gbTjI+ArEfURk9MXDmogcGGnnS7KkROzPF9RMCQ8tPv4RaE
         Q/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253767; x=1745858567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CEsQWBCXRVwADjexG++NYp0pc0xQK2w2I3VkfiuwbTM=;
        b=N7eg/r/JAVBdTjCRvGBTSq6ULieWzeMXgTcFpyp0x/WPpAQq2NchL9g3eGsnja4IaH
         GhmRD5Ka72TuSfiejsCIzMtXnONCd1J3TLjR5gMsmte390IraRD7QTp/kP3H7aBez4qB
         xZiUuVgp9mTsnskmbRL5eB04U8kaPFNm8bMtCbPR/TJb3Cod1r59BI43/ZzHB+Z0l8eP
         LKmYU2yRUXdnCu1RqAAuG0/2lcBwHYYzhEGtGEJmg9OpPWBUru5H0SwkV0wKsAUW6OpI
         FEO8jfJUeE4Su/O9lRTrQSO/FQgjbHs+5l6JEnhGjv4e/S4TyfFN5JA+zZoMcFJbSOfM
         fLzg==
X-Forwarded-Encrypted: i=1; AJvYcCVhfcOAHGm0VkUUTgsOyXeG2fzFLSbbsh+D57sEGYns0T2xEUHkRHMAO/sBZiE2M1870Ce8Mn3Kic9H4jQ=@lists.infradead.org, AJvYcCWS8+i6TxXVJyv7iRHcur3zhZszt2VnzsVLyjLxl60nypt33RiA0Tmr1lLWN8oOihsnJR3SKJagZb2pXb2+oAQl@lists.infradead.org
X-Gm-Message-State: AOJu0YzIPzj5Jv6HO4NswxjjLCrpX/dGC06Ds7p/MsHdh+PIwDj6XgrM
	emQw8eD+/r4OGFC9xMEzX9cAT8xnJfemf52n7v7GAEEvIEsqdNx1
X-Gm-Gg: ASbGncuTuFXkCEBqWW2aWUonoexgbbZ44LZO/EzJftVrCpoLkbyZNynls0Faj6ku0Bz
	WPRvK/U6FryJJFUb1YKGjyhpz11y4p/yIXsgZcTo7ET9+wmn2QMrGzYl04nKrZEdAIuDeDiF+SK
	bc/v60PvSnuDuZFHMdabbunw9ay/QR0US3+XdE7QqT6ZFHc/fOjzStevXc1mGCTuWt28IGDOhsy
	9eM9ke0bzI4MqXhuXlI4bv4Lr/8eYSpq6EmbrVizkolP1c7yT1qGVTPFf5HRVH/Eb0LLRUyGukA
	jx1Ck/PlsNi8EJcjNHx+KVCzCQFEEx4lpV2hzS4+Bt484fDxN2Ua6EJ6RxCjtb+tFJqGmv2mKmD
	xVphACch+iEBQLPC52KlLxgaQhDk1xa0=
X-Google-Smtp-Source: AGHT+IEptaSAwiiJLuteE0uVEhTA/P7R1wY+ta6JPNHF4XvUd3bJkbUnWRJFlD9rs8uaJEnM1M7arw==
X-Received: by 2002:a05:6214:daa:b0:6ea:d033:2855 with SMTP id 6a1803df08f44-6f2c4562e1bmr221565746d6.26.1745253766716;
        Mon, 21 Apr 2025 09:42:46 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c22117sm45683106d6.113.2025.04.21.09.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:46 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 72C5A1200043;
	Mon, 21 Apr 2025 12:42:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 21 Apr 2025 12:42:45 -0400
X-ME-Sender: <xms:hXUGaH-hTYWE6wtYe0q3LteNF_5Rcz00n9kbL6SwuDaXVO9TDz5bFA>
    <xme:hXUGaDv5L8xtqKg777Xum-Z2Dwt2jQbW92ZTTtJbnor9PVXJeYkgBy1Z1LKC9fY6U
    Nyac_uuTSr_cEX8_A>
X-ME-Received: <xmr:hXUGaFB4HO6U2S2D_hUmfdzJ8ZPlMsMoqD8v5aBl5UAwxUoR-ztp0iJp1iMt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefg
    veffieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedunecurfgrrh
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
X-ME-Proxy: <xmx:hXUGaDeG2oSvFcNIvyjmbjD42HjfucU9P4kdz-luNRiHaptZRgCijA>
    <xmx:hXUGaMNTmI5qMPITrwTuCOk6cM01V-X2KNgWBq_xRt19K5PQqQwJiA>
    <xmx:hXUGaFl4x2RLDr8g8sNAM8eFyyLix2RwlOi5PzBuJuhCpdRIq5_vkQ>
    <xmx:hXUGaGvFt7FETBQw2ZwhGwEgvEv2KasoE7ZinsZv6Cnw9hzZ3k1G4A>
    <xmx:hXUGaGv98ZcBwISiVQTLlVtooA2abi6Y32cKxH5Y57-7tYUBN9nA07p9>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:44 -0400 (EDT)
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
Subject: [RFC v3 09/12] rust: sync: atomic: Add Atomic<*mut T>
Date: Mon, 21 Apr 2025 09:42:18 -0700
Message-ID: <20250421164221.1121805-10-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250421164221.1121805-1-boqun.feng@gmail.com>
References: <20250421164221.1121805-1-boqun.feng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_094247_717824_ECEE947A 
X-CRM114-Status: GOOD (  16.65  )
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

Add atomic support for raw pointer values, similar to `isize` and
`usize`, the representation type is selected based on CONFIG_64BIT.

`*mut T` is not `Send`, however `Atomic<*mut T>` definitely needs to be
a `Sync`, and that's the whole point of atomics: being able to have
multiple shared references in different threads so that they can sync
with each other. As a result, a pointer value will be transferred from
one thread to another via `Atomic<*mut T>`:

	<thread 1>		<thread 2>
	x.store(p1, Relaxed);
				let p = x.load(p1, Relaxed);

This means a raw pointer value (`*mut T`) needs to be able to transfer
across thread boundaries, which is essentially `Send`.

To reflect this in the type system, and based on the fact that pointer
values can be transferred safely (only using them to dereference is
unsafe), as suggested by Alice, extend the `AllowAtomic` trait to
include a customized `Send` semantics, that is: `impl AllowAtomic` has
to be safe to be transferred across thread boundaries.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs         | 24 ++++++++++++++++++++++++
 rust/kernel/sync/atomic/generic.rs | 16 +++++++++++++---
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 6008d65594a2..ffec46e50a06 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -173,3 +173,27 @@ fn delta_into_repr(d: Self::Delta) -> Self::Repr {
         d as _
     }
 }
+
+/// ```rust
+/// use kernel::sync::atomic::{Atomic, Relaxed};
+///
+/// let x = Atomic::new(core::ptr::null_mut::<i32>());
+///
+/// assert!(x.load(Relaxed).is_null());
+/// ```
+// SAFETY: A `*mut T` has the same size and the alignment as `i64` for 64bit and the same as `i32`
+// for 32bit. And it's safe to transfer the ownership of a pointer value to another thread.
+unsafe impl<T> generic::AllowAtomic for *mut T {
+    #[cfg(CONFIG_64BIT)]
+    type Repr = i64;
+    #[cfg(not(CONFIG_64BIT))]
+    type Repr = i32;
+
+    fn into_repr(self) -> Self::Repr {
+        self as _
+    }
+
+    fn from_repr(repr: Self::Repr) -> Self {
+        repr as _
+    }
+}
diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
index 2de4cdbce58e..44cb6378367b 100644
--- a/rust/kernel/sync/atomic/generic.rs
+++ b/rust/kernel/sync/atomic/generic.rs
@@ -19,6 +19,10 @@
 #[repr(transparent)]
 pub struct Atomic<T: AllowAtomic>(Opaque<T>);
 
+// SAFETY: `Atomic<T>` is safe to send between execution contexts, because `T` is `AllowAtomic` and
+// `AllowAtomic`'s safety requirement guarantees that.
+unsafe impl<T: AllowAtomic> Send for Atomic<T> {}
+
 // SAFETY: `Atomic<T>` is safe to share among execution contexts because all accesses are atomic.
 unsafe impl<T: AllowAtomic> Sync for Atomic<T> {}
 
@@ -31,8 +35,13 @@ unsafe impl<T: AllowAtomic> Sync for Atomic<T> {}
 ///
 /// # Safety
 ///
-/// [`Self`] must have the same size and alignment as [`Self::Repr`].
-pub unsafe trait AllowAtomic: Sized + Send + Copy {
+/// - [`Self`] must have the same size and alignment as [`Self::Repr`].
+/// - The implementer must guarantee it's safe to transfer ownership from one execution context to
+///   another, this means it has to be a [`Send`], but because `*mut T` is not [`Send`] and that's
+///   the basic type needs to support atomic operations, so this safety requirement is added to
+///   [`AllowAtomic`] trait. This safety requirement is automatically satisfied if the type is a
+///   [`Send`].
+pub unsafe trait AllowAtomic: Sized + Copy {
     /// The backing atomic implementation type.
     type Repr: AtomicImpl;
 
@@ -43,7 +52,8 @@ pub unsafe trait AllowAtomic: Sized + Send + Copy {
     fn from_repr(repr: Self::Repr) -> Self;
 }
 
-// SAFETY: `T::Repr` is `Self` (i.e. `T`), so they have the same size and alignment.
+// SAFETY: `T::Repr` is `Self` (i.e. `T`), so they have the same size and alignment. And all
+// `AtomicImpl` types are `Send`.
 unsafe impl<T: AtomicImpl> AllowAtomic for T {
     type Repr = Self;
 
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
