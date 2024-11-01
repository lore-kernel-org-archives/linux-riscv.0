Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32279E674A7
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 06:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ayMO4nFslI9B7lqsRLZCBC3bbenuAR8Fusxywst5YeQ=; b=kRiabTCTfm43yV
	rjw8fFqKaEYCUCRKF/B2Y+CCldgD/7PWVbrRsMWrdx/b0QofHZ4TqH9S8wdfDEct6YtijKvPJhDuk
	hcT7Wdu7CCNUiwQI+FQ+nojWKP0SJyAFYZfPXn7WJluF4f/U4jLr1VKxuEnpclftfuio/GnwvnBng
	K/pYS7DsbNpYhO90vLm5ETQhIe0jogbyyC4MhA5ooI+aVbQaPCVwVXDVC9uUngMmPwc+ucHd8IZoW
	gdmTy9drVTzDxUvFhSNBCVitqBf82mbUFoD0W/1IFWNSnxOPEtROYQADCdjJHq3Zm4/BdX1K6/lnX
	tGLsr2wuvlbn9wuiyjpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6kmB-00000005uDb-1K2K;
	Fri, 01 Nov 2024 06:04:51 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6klV-00000005thJ-2hfq;
	Fri, 01 Nov 2024 06:04:14 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7b1b224f6c6so114264185a.3;
        Thu, 31 Oct 2024 23:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730441048; x=1731045848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HedkcmZuTLLzFJb9CZIBHRUYnKPqPD+H8D+47bw5J50=;
        b=lG4e6zUuDl9edFy9SBo7OEmZtsPBb5vY+VwCJEyd7HezAVMI8DGIRH3TB5ZpqLQ04y
         Cc5OBpY/zLUSpcAIU0h9c4U2lIhqzIdM4k7uT5Z0iy2aVqqg7mbrIhJBVv8Db2aaja+p
         M1qp+8H1bXBczlYDfOWb/qpZtQDCL6xrRqUR5flAvnW+oMs8KfoD7OVqh/O+QGCDrS1R
         a1smpJxnCURnV9R0KICmWbRULuZKS9xPwt0PZzFJlrro962XoBPh9s1zf44ewUwuf5PZ
         SL/C+pjgLc0C4GK4p7z9E51CKxYPhWwQctI59ti0FJaz46KvfkTYYWyT45mpJeA2rQwo
         6CXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730441048; x=1731045848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HedkcmZuTLLzFJb9CZIBHRUYnKPqPD+H8D+47bw5J50=;
        b=IqWyyPkpL30d8X8zEscNVGsaruADYx+2GBwDqBKc6k9o5ZWJZkArEa/wBm9DFHAMu+
         GPe5HkpRp3cDeyI9Mn6aDR6hVeQl7bi2FCAfWGrpG8jv8TxFcQWY6tNuDYhXhP3iwloV
         HdZR6kT9ekb4OLJWbyYlkYEprhZtL9SK3MZmaDILqLftqBWFVQsan7niNCmYxBDGFvXa
         RU2Sg6FklD3nlEgT/upPB2M67AMTcimVe7ux07Zjb5JUh9xIeqSYcoChK1Cwbo6Izdaq
         Ye4C7Wc4BjDho3jNWbna3dQ44bpRax8MAas9ZW5Nx4ULx51DVv9vL3Atx4mDKDRiOnOz
         nvfA==
X-Forwarded-Encrypted: i=1; AJvYcCUh0DnfC1vQPQrRuIpnJ9rPbQtWeoJHFkmhsdgtJeBoXv/sNMf5BFe8LJan9vo+JsLGlPzIhWJnTzNJ2TXnYX5a@lists.infradead.org, AJvYcCV7YDkUPhJYQwjsa/0bptjU3gLBbleWtlef+tIQIK8uIP2f5Cr5PoHdu8bpuE0/BU5Eb4iLiwhjSktpp/U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr2O8ej3zyqZi1HkHZ0pwjeVFHqdRpJ9mBOvJYF6l7niu/Iowi
	NgFE5MvPgb/35APg85sWlPjoQic+8xvzzjWzguY/hwI53C2hxYeq
X-Google-Smtp-Source: AGHT+IFjNsIlEurpXPjF8KNlWfgLlf1NKfyfrV0QuV/GBtGTbA0qW3F/s1nZzTSXWMiWahQF6/N9wQ==
X-Received: by 2002:a05:620a:444c:b0:7ab:3ec9:f4c7 with SMTP id af79cd13be357-7b2fb982785mr233693885a.35.1730441047663;
        Thu, 31 Oct 2024 23:04:07 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f39e9dd6sm142079785a.1.2024.10.31.23.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 23:04:07 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8C55F1200043;
	Fri,  1 Nov 2024 02:04:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 01 Nov 2024 02:04:06 -0400
X-ME-Sender: <xms:Vm8kZ8cNSO-S9POofHLm4Zmnu0qOwabKxgMKGWVd_SBj8gtYw76ElQ>
    <xme:Vm8kZ-PDeCtaO29ac6kuBMMFzcH1-uoD2s8JBJSjRf4y_lH2h_WXYYY77kdkkw7kV
    NALLz84yjAkv_PbXg>
X-ME-Received: <xmr:Vm8kZ9ixDWk-mW1YSb_nxXIrQVx2QIcF9H3SENmC9oap1rbE2614R627wVA>
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
X-ME-Proxy: <xmx:Vm8kZx81oJCz2H1FajZFY8CI_4MBm31Nqj-UuZ_MwL0pvSGuClClJQ>
    <xmx:Vm8kZ4s8yJr9iRwTBo_G5mzHxs1dxnXzXak5YD1yt2BU0pnddpgObw>
    <xmx:Vm8kZ4FFsag_4jiBTRLMh8DHCgSUGAwjfKuORlWZc1OsT4pVO9EpcQ>
    <xmx:Vm8kZ3MPdnviiNJ7g44k53kHADVIEwVsv0I9f0cSmj1HAMjhOCB02w>
    <xmx:Vm8kZ9Oy2qM5_VsiogkpsGZ1u4TP4xsVaf6eSzs-Y_9Rcyzvata9LSOs>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 02:04:05 -0400 (EDT)
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
Subject: [RFC v2 10/13] rust: sync: atomic: Add arithmetic ops for Atomic<*mut T>
Date: Thu, 31 Oct 2024 23:02:33 -0700
Message-ID: <20241101060237.1185533-11-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101060237.1185533-1-boqun.feng@gmail.com>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_230409_823952_A56B0151 
X-CRM114-Status: GOOD (  14.63  )
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

(This is more an RFC)

Add arithmetic operations support for `Atomic<*mut T>`. Currently the
semantics of arithmetic atomic operation is the same as pointer
arithmetic, that is, e.g. `Atomic<*mut u64>::add(1)` is adding 8
(`size_of::<u64>`) to the pointer value.

In Rust std library, there are two sets of pointer arithmetic for
`AtomicPtr`:

* ptr_add() and ptr_sub(), which is the same as Atomic<*mut T>::add(),
  pointer arithmetic.

* byte_add() and byte_sub(), which use the input as byte offset to
  change the pointer value, e.g. byte_add(1) means adding 1 to the
  pointer value.

We can either take the approach in the current patch and add byte_add()
later on if needed, or start with ptr_add() and byte_add() naming.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index e62c3cd1d3ca..cbe5d40d9e36 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -197,3 +197,32 @@ fn from_repr(repr: Self::Repr) -> Self {
         repr as _
     }
 }
+
+/// ```rust
+/// use kernel::sync::atomic::{Atomic, Relaxed};
+///
+/// let s: &mut [i32] = &mut [1, 3, 2, 4];
+///
+/// let x = Atomic::new(s.as_mut_ptr());
+///
+/// x.add(1, Relaxed);
+///
+/// let ptr = x.fetch_add(1, Relaxed); // points to the 2nd element.
+/// let ptr2 = x.load(Relaxed); // points to the 3rd element.
+///
+/// // SAFETY: `ptr` and `ptr2` are valid pointers to the 2nd and 3rd elements of `s` with writing
+/// // provenance, and no other thread is accessing these elements.
+/// unsafe { core::ptr::swap(ptr, ptr2); }
+///
+/// assert_eq!(s, &mut [1, 2, 3, 4]);
+/// ```
+impl<T> generic::AllowAtomicArithmetic for *mut T {
+    type Delta = isize;
+
+    /// The behavior of arithmetic operations
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        // Since atomic arithmetic operations are wrapping, so a wrapping_mul() here suffices even
+        // if overflow may happen.
+        d.wrapping_mul(core::mem::size_of::<T>() as _) as _
+    }
+}
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
