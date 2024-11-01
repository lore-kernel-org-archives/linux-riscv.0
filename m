Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3B9E674A6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 06:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NxRorZd6+bM78NLHMSJ5dotfXVDmwRl2hM23V5JtU2M=; b=1pOzgeZiaDpn1q
	xmHvMAdJSxz+zGjK0LE0ifsP8WZoHOafVdHPqJJwEajsGLQfms18ZhgY2cjn3nOwCsxVHed6yBDsW
	VQXEUAJbrIP6gCHvZh6iwXXq0kjcG3XD6hDyzWHZYBGik6ciB7Gh0m9eYajCuFYwX/ff/qykzrhgE
	dLun1ZLCdHC7xlknsyTAvr0RkRv1jvrXbfyBX7+/9nOFpxZhK8+MjiQVTtsvYSRl+ECJcc4wQm1F1
	+z25/QpjaVqypmZ9wnioTSjXArCDdgXjgsDtZrCh3AgDbUvvXvjsnvVE6PlcOHgLzScZzoHnibKwS
	2LN80DqcFMY+PcDL61Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6klw-00000005u1N-11gn;
	Fri, 01 Nov 2024 06:04:36 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6klR-00000005tcl-14Gp;
	Fri, 01 Nov 2024 06:04:07 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7b1511697a5so113533885a.2;
        Thu, 31 Oct 2024 23:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730441043; x=1731045843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6aL27TUodcAdd+uJ8RiXbRTkzdjD0lB6w2v/luzePnk=;
        b=OtmHcKFVBi1xcqXUTyivZtbUP4ulZjMR8c/32eVYn1+HnndOsH1bS3c29gcIpcNQsx
         S0UdYohBs9gix4JWu6lcIyYwKIufPuCj1WUHu1NVhS+5kk0CNPCYgPWFCuESxNO2H2xw
         U0QI23MTeH4Gt3d4ov+hSOwYGXmiAUW0nngdL1ZsRcimXkyFpEKC3wRwor71Pr29tR1l
         lCeRebTuB5tYZWOwMk/Eu5USM5ga2UyVLOULkWdryNtrS9FMnuJeqAbjFRHg2IZhVu1b
         mdoeMS1ei0mDG0fTCg4Ob8E7hYCRjRSJAQjIYTzepzTHl69Mgz44+/qN1bM+H0ZmmFbc
         RO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730441043; x=1731045843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6aL27TUodcAdd+uJ8RiXbRTkzdjD0lB6w2v/luzePnk=;
        b=rhsP5w13NKI3HzWw6Yl7jCgoP35o7mrUm1xIR3+n+eQuooW+1kLuDBww4yJ7TMJyOB
         AMTgH7SduQtpkK1j4VYIfdg7xWfTY4mdmpgvqWOt9HNMgQE+e0+SuL3wyBLpPMhXSjo8
         3pCNmKds1cKoq4PZOg8mYwGviFZTbA0HwJzEA2jfiUQkiTER5/vyrJj1QW1IG6ewl/yY
         a/NkPV4/p/j0Ntim617R9IgygIAwqRozFnvEzaz4PRMTYfv1LUS0y5fe8M1wc5MPurWl
         wR/2SaLpAMVZAKrof2ItqinTrtUm4k3+OTwbKbSqO6bxEoNaLNCScsuLtB6YhBiySBwQ
         qaww==
X-Forwarded-Encrypted: i=1; AJvYcCU1sv/lr8lD/IBPNxzTGI0eND3eUaO8XJGHxDeCHfTjrnpmbqR2mDMTml5AU7e1X/HDlEkdh+J7YqdWgQc=@lists.infradead.org, AJvYcCWv+HT/l5O0BMIaBXnHDR9dPbyinYjOq0khSo3L6fNV79XGDIL/6K1MKaum6FNwxLLENtPBYOAcD4PLSfrAu+6x@lists.infradead.org
X-Gm-Message-State: AOJu0YzQXxYdxH4uab7+C8DfQLB8i9OodG5+pGlp0CAQyw6/TqfrZJ/Z
	CNe0iidGxi59lIrjgN5ewEf016C9hNYIllne8tCWG4iVKN3Igy6l
X-Google-Smtp-Source: AGHT+IEBsIeTKPMFVd18zq3m0TbNuXedTa+kxiUVC1B4NUnt+dZIvvMRhm1ETl2jJ5UPhxkWU8o/Gg==
X-Received: by 2002:a05:620a:4554:b0:7b1:7d5c:8f9a with SMTP id af79cd13be357-7b193efe4c8mr2648481885a.28.1730441043401;
        Thu, 31 Oct 2024 23:04:03 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f39e9b54sm141659585a.5.2024.10.31.23.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 23:04:03 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 36BE21200043;
	Fri,  1 Nov 2024 02:04:02 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Fri, 01 Nov 2024 02:04:02 -0400
X-ME-Sender: <xms:Um8kZ78rYvgtGQNRIz9FXaznnWxEMTH4ZNoK7rFf0t4SGfyaRBeZsg>
    <xme:Um8kZ3tWJDPoAFZEDjR38L_nnGPIGx0ZONWcJ9i7iL4mZTjbVgScBgLyzeveDj-bk
    GCl_07T8Q1A6RRugQ>
X-ME-Received: <xmr:Um8kZ5Cs78brre0AKFYvtLROzAI8e9BLMy-EAU4fXeFV6SSqvD6ReRNmSVKg3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekkedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefgveff
    ieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmh
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
X-ME-Proxy: <xmx:Um8kZ3dFuUJ_LsZ43tDz_a34qYVrx_8alQQ1-aKyCdVHRdUCWbnRPw>
    <xmx:Um8kZwNCQ1W14NHd5xyHAkMP0uthoHYmNCC9vaIyRNBp5V8kCq7xcA>
    <xmx:Um8kZ5lpnLCjUS9S7xcMG-Y_jMn6ecNBqoFExHiOLbIE6_wPRVtK2g>
    <xmx:Um8kZ6v9ITMPGv2iDAegTY1OREf7shkA9Pg02bs0kYkFBx_PHCCv0g>
    <xmx:Um8kZ6twtXsgjI5mkQE7RNkDKDO1HpSi4RmwBl5t23RkZxBAkq7iBTsk>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 02:04:01 -0400 (EDT)
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
Subject: [RFC v2 07/13] rust: sync: atomic: Add Atomic<u{32,64}>
Date: Thu, 31 Oct 2024 23:02:30 -0700
Message-ID: <20241101060237.1185533-8-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101060237.1185533-1-boqun.feng@gmail.com>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_230405_421191_D0AE5634 
X-CRM114-Status: GOOD (  10.92  )
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

Add generic atomic support for basic unsigned types that have an
`AtomicIpml` with the same size and alignment.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 80 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index b791abc59b61..b2e81e22c105 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -22,3 +22,83 @@
 
 pub use generic::Atomic;
 pub use ordering::{Acquire, Full, Relaxed, Release};
+
+/// ```rust
+/// use kernel::sync::atomic::{Atomic, Relaxed};
+///
+/// let x = Atomic::new(42u64);
+///
+/// assert_eq!(42, x.load(Relaxed));
+/// ```
+// SAFETY: `u64` and `i64` has the same size and alignment.
+unsafe impl generic::AllowAtomic for u64 {
+    type Repr = i64;
+
+    fn into_repr(self) -> Self::Repr {
+        self as _
+    }
+
+    fn from_repr(repr: Self::Repr) -> Self {
+        repr as _
+    }
+}
+
+/// ```rust
+/// use kernel::sync::atomic::{Atomic, Full, Relaxed};
+///
+/// let x = Atomic::new(42u64);
+///
+/// assert_eq!(42, x.fetch_add(12, Full));
+/// assert_eq!(54, x.load(Relaxed));
+///
+/// x.add(13, Relaxed);
+///
+/// assert_eq!(67, x.load(Relaxed));
+/// ```
+impl generic::AllowAtomicArithmetic for u64 {
+    type Delta = u64;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as _
+    }
+}
+
+/// ```rust
+/// use kernel::sync::atomic::{Atomic, Relaxed};
+///
+/// let x = Atomic::new(42u32);
+///
+/// assert_eq!(42, x.load(Relaxed));
+/// ```
+// SAFETY: `u32` and `i32` has the same size and alignment.
+unsafe impl generic::AllowAtomic for u32 {
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
+
+/// ```rust
+/// use kernel::sync::atomic::{Atomic, Full, Relaxed};
+///
+/// let x = Atomic::new(42u32);
+///
+/// assert_eq!(42, x.fetch_add(12, Full));
+/// assert_eq!(54, x.load(Relaxed));
+///
+/// x.add(13, Relaxed);
+///
+/// assert_eq!(67, x.load(Relaxed));
+/// ```
+impl generic::AllowAtomicArithmetic for u32 {
+    type Delta = u32;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as _
+    }
+}
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
