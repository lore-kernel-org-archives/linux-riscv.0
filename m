Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAEEE674A7
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 06:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzYYnbQoNtWMEzZK1SpEcLVUvuCLArMoc6dFVaI0nbA=; b=T4Zo4jkXPjpxP/
	1Rtut/XDW4SRZHqkW5iELC3r05OK0LZcWpILvu7kK0jOvDwYequteDpaUrCJgsfF9ZMwCSanvfqUf
	c2H3KG5kXG+PWEZ7L/Ywp5ACNK3B0N4v0yRJ48RgtGe1eXfuOu0OgLJjIIi962dNYkhE3YGZsORIK
	KatSKJ4Tx/YTLGra+e3AbasFKPPyEr2xXWkCVIVB9w1MZR/S8N+crSpxc9gKgrS09D1B0JASjy0sy
	Mq1BtY0bGzV4zxCmqd7u4+jIhHwkIRNdIIMBDdPDfh/3wjuDyEE0Dl7TGItTSLzBw1wlubpa1XoE2
	jItyK72JD9qJ1u6sqXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6kmE-00000005uFs-1yyo;
	Fri, 01 Nov 2024 06:04:54 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6klU-00000005tfN-0wnl;
	Fri, 01 Nov 2024 06:04:12 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6cbce9e4598so9694576d6.2;
        Thu, 31 Oct 2024 23:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730441046; x=1731045846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JH7KGrs5tWNaElymjoHhwHajdPBdI1O/huzZLgMbScw=;
        b=cJCz5R35vXZEjzhl5394Jt4aTs3G130l5U5qPkzf7e6azP0orY6yQtG3KUAnySYcRL
         Em/IpHRHCg/6eG78WM3TzX4yI6kaX55j41/u/D9AAfCu/m36LsvDqYeQPhLWoxS1Z2LI
         jNGJW0aC/Cr0wldT/jI5RocohoYUEStTuZljQPnJqe4LRVkvm1W5b6NC4a3ff8EuGClu
         sLSuEvFlPWOVOKKiKt3bpZWotTjHI3YOR6jvzvLfiqSLpXbYHc/j99b834wzVak4TcVD
         PvwZGY5b8EtRX0GEAhwyDYYg1HrDhcHdE87OYJmHLfGB2nV5aGBc/9GoYrN1E9O3G6lU
         kqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730441046; x=1731045846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JH7KGrs5tWNaElymjoHhwHajdPBdI1O/huzZLgMbScw=;
        b=jC6HgE5g9xUTTJNj8nOc/YK6LCuG55Aig/0fyl2yyDzEjFYSstrzC0anp7XbuM4YyE
         XAGP8xT6l7E6KtDZaJhvGXLwaTctHf2F9sV35SU+g2bzT3/jJH5ifhaIq/EezB/5QaQH
         C6dxGBSm503kwaJJF2L/b7mJZ4Jdpg3KUig88JRSttpzJgxH796VMbJ8AGbf3MFlSnkv
         DzdFhwuF0jl0s/jJ9Fs9YnqEnOVgbN3cuehUNeVLzFTkjAsrg8tTPf7gci3wlQ+x9uP2
         ppc1rUcSb00Ud9wADkqizkVb9/jUgX6gfwKMORmWf2+kIvjIOPehkqTlDe1dAtP6Wtxj
         hpOg==
X-Forwarded-Encrypted: i=1; AJvYcCWt6vImVlyLjNC2NWuVgwCinYCKIcM7YXjh73HmZmN8rH7MSRiP+oP1nVinC6aiOpFCcJVyfmnKyO3yuA8=@lists.infradead.org, AJvYcCXCddc5eM3iJPxWXNdmTpFZvAawpSUpvLbCEWWHEBVEb7xLwTpx6j/nb2tJKDkQLd2c438kdVfFq2nX7X3OMyDO@lists.infradead.org
X-Gm-Message-State: AOJu0YyZuiWFKuWbGwtlMqCka517BQ4ERXxx8bYZ427ko5TooAwEAaIF
	z8qmfocN2TmmtP32qDl+gJZq9NaeUtLzEGoFv7AMZuznH9hVAHjW
X-Google-Smtp-Source: AGHT+IESIgPAqTkC70WxJjWwkI3tgQEnLpwNYxX5rWL6ZHem8kS8mRx17gqOxaZoRNqJiFjUt2ygsg==
X-Received: by 2002:a05:6214:2f84:b0:6cb:f510:3536 with SMTP id 6a1803df08f44-6d35c19d32cmr27592686d6.47.1730441046358;
        Thu, 31 Oct 2024 23:04:06 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3541780a0sm15671686d6.109.2024.10.31.23.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 23:04:06 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1BDFE1200043;
	Fri,  1 Nov 2024 02:04:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 01 Nov 2024 02:04:05 -0400
X-ME-Sender: <xms:VW8kZ4JO8nZn8stwnoGLwG7M1deKc8KbNIHPJ-t-u0o9MEuElGk9jQ>
    <xme:VW8kZ4JVgruJRqq1JKUsGKKcIwDvgkwxSpA-akNuWFtMm4jW9uTKZ8rav0kiN9UPC
    7cXu9Qs1PQO02IfIg>
X-ME-Received: <xmr:VW8kZ4uMiXYrNGIcNbNc7nz_UYWeVhG-ffdi7S0duLCMYPzIXJrg_wvC2iFiMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekkedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefgveff
    ieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
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
X-ME-Proxy: <xmx:VW8kZ1Yl3Wtqdbc4vWLINrvHRGgucu-InHW94wXbmn9oEj03eHgHJg>
    <xmx:VW8kZ_btP9iX2_eY7ZX7gCWN6kM-RYm5jXbwrNMNYSeuVRQYIOx1Ug>
    <xmx:VW8kZxDysbZIvVyh-7cBn73gn0lFbn9MhoxMA4RNYVDuSKqzsAiovA>
    <xmx:VW8kZ1YCnCIpgGsFdioIU29W8VySsvsgQwzUolobAmTvOMc3la-9Mg>
    <xmx:VW8kZ3oPf6rNLC6r1eYjWJOPYh-yZTsFyV93VsXrp1RC2qbxHe9z0SOP>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 02:04:04 -0400 (EDT)
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
Subject: [RFC v2 09/13] rust: sync: atomic: Add Atomic<*mut T>
Date: Thu, 31 Oct 2024 23:02:32 -0700
Message-ID: <20241101060237.1185533-10-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101060237.1185533-1-boqun.feng@gmail.com>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_230408_509402_6AC84E42 
X-CRM114-Status: GOOD (  16.56  )
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
index 4166ad48604f..e62c3cd1d3ca 100644
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
index a75c3e9f4c89..cff98469ed35 100644
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
 
@@ -30,8 +34,13 @@ unsafe impl<T: AllowAtomic> Sync for Atomic<T> {}
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
 
@@ -42,7 +51,8 @@ pub unsafe trait AllowAtomic: Sized + Send + Copy {
     fn from_repr(repr: Self::Repr) -> Self;
 }
 
-// SAFETY: `T::Repr` is `Self` (i.e. `T`), so they have the same size and alignment.
+// SAFETY: `T::Repr` is `Self` (i.e. `T`), so they have the same size and alignment. And all
+// `AtomicImpl` types are `Send`.
 unsafe impl<T: AtomicImpl> AllowAtomic for T {
     type Repr = Self;
 
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
