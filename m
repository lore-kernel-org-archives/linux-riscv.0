Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350C9C369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVkB4yskycKlQAidafK2kA5ihdMlyFQLhfUEhf4St7I=; b=RaXnOTMgsfBdOM
	3SOgg/w6GIvmlzndQRoQ0YXgoBKXOYUk3mRts4EXL2Ks/zkcjew06Pf2eF0JwjS7ZwVnmrR9GC1XX
	NeFHRVc8WFoOffliqkvuA1dv8eo4AvHq35S3u8dtfr/HdLfUOoF2YrcG3RcLhLz47auLlVxU7V1GG
	OyZvPfPDGUXLYE6ydWWzgXl5lua3mgEjtHQcfgbXF7cc4mAYikAY2RI0/s717QmOppeO3bQ1+7gLU
	r3rwGjmubcegZbW/zRIvjbVuRs68woQOZ977OE0pdBMi8kLczTeg/xJ4moZ1GaKSIMWmaGl46Vhtu
	3Rk6Yrx/F8Vc66b+DraA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uFw-00000004kND-22G5;
	Mon, 21 Apr 2025 16:44:28 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uEH-00000004jm9-1WR3;
	Mon, 21 Apr 2025 16:42:46 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-47691d82bfbso81913301cf.0;
        Mon, 21 Apr 2025 09:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253764; x=1745858564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2I8XAztJEZn+vwuO6dwvyeow7+5UV1o92z9+NI6bSFY=;
        b=gQPf7z0wAPcK+qghhExqXiSKr2akSHxNO9XexM8wT3fv/kdwTuIYcp40nXJHXC0Xdu
         H1sRemo1fDz+Dspy+jHeLq3M61BlfX3G30j9oRRluZ7YHwmgutTXmr7M3oIuQAIiyzUW
         UxGKcTOoRjw2V29e9ixtSFamUeOTGVgb8OA6C6zDqE7onWv8nb5B8fSWJPnXJyqTAY0/
         VOnV3hVplewdjsbWUT8ggG4Prc9uLNG3W1y/tkUyHQgyVxclZ4/83RsKGn6/VOFw6foj
         Nd4DHJodojGDFydhTJLmuCT5VQ0Dug0Z2MWl8SZHRH0UBmBWG4QAcz0ErkaZSpTAm/ua
         Zakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253764; x=1745858564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2I8XAztJEZn+vwuO6dwvyeow7+5UV1o92z9+NI6bSFY=;
        b=sbbW3ZWmVDGM73nj5S2NTJ/l3Q08hbgSicopA4aPXNhchZBvhNFS9MtX9i0sXifP9b
         3dsSft5Ad7Y0WE6nRba/VUIDyFyW08gly19HDRXG/O8fzjSL/2SPEVZk1WzxgUTeJ48H
         8A3EfX/KBlOzQzEoZMY9BWOU7tKB3Us+bsk38HKTB3ZHDfjWh1CDOk0UPWDaTtibdxfJ
         ugWjef1pAhR3ncOm48KkbcwooZ/yU3rWWF5LSqQUb/lwBPSc7waRWW+Dvu1bPvkJjkGQ
         Du364wrADNPjQYfydrUMXy19qxGeHPqpoJGV4F/xDVmYjymZ/nl5SB/a7jft4oe3gkTm
         DCQg==
X-Forwarded-Encrypted: i=1; AJvYcCUr3A/1TbL1TAcu+C166JFmxqrYhOnex0V5KgbTlQt4OZjIg1Fypw/9LkI5QCzgHyHf2bku00GWQNojEU8=@lists.infradead.org, AJvYcCVEGk2hU6hmwGBnx1oTPgCIiDTwUzlsZsFerL4OuFSmNmeUjkNnMthzOOfypy9RnYRrP0VLj3rv8jlTpJ4lGo0F@lists.infradead.org
X-Gm-Message-State: AOJu0YwnmoIWw58gZnROgCERAU2sW1wAo/sJ596awebJ79BCrqL7a6jT
	fXoCyiWtLkmWTDCUFZGRW+i2+AhGFWM2vFHqD7Su265m75gg7KoQ
X-Gm-Gg: ASbGncsRMwZhYB+iMb1p02CLdhfWTxOUwho3e8JerZhGJux3y7mmNlQRbyynMTxdmD9
	fyHuvQ4MWEDqqpXR9KVE+z/2XjXD+S6oUKE8ng+DXkkcmLZkX1KylxhhD3EWgZPauZ/Lr9mUaL3
	YFB2EFKTSM3lL+WdPT+7IBGef5QtvDiQUG7uv/OUm/stXVryJnIR1HK4bKWI+hB+zixd860Wvmt
	lSaUIqfbBK1ws7Hxww7i0YebkIQfX6/6Nrg2YmqBzAV4C0uFFtmFbKhx9RULW/06Se5SnZZzc9z
	pxXWFxdLkAJ5mo5dLvSAjq55x10k+I9yYk8cJzS5S0mtlkPey52BFKvW8Fs7K0eByVbz5wrvSde
	Plchs/yaVcHWpXwZTFhP3z5m/wL9SHcM=
X-Google-Smtp-Source: AGHT+IFd/Wxg44JU728h1hWeDdpS9Yy+TAr9cZlv3SjHXeKAtBsZmm+TR6rvWZvEGlTOSe4yrtV6Ng==
X-Received: by 2002:a05:622a:2c1:b0:476:8a1d:f18e with SMTP id d75a77b69052e-47aec49fef3mr208625081cf.36.1745253763580;
        Mon, 21 Apr 2025 09:42:43 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9d19dd7sm44498381cf.81.2025.04.21.09.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:43 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 504631200066;
	Mon, 21 Apr 2025 12:42:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 21 Apr 2025 12:42:42 -0400
X-ME-Sender: <xms:gnUGaH2s-0N1_cS70v5IhHVJTw7PJUZBjRYITApQbHzUDi-crzM3cA>
    <xme:gnUGaGHbUsAUlFpu8ky0_NMJHtbvEWFGIor_iv_8K9UE6kz72lo6LmkRqOSiyFU47
    c4J7kPDeQG1ivT6Ug>
X-ME-Received: <xmr:gnUGaH7mLKey1kd1QVA2JL0Bi-4nvDOBiLw5FOmK1Pk0l67zlovjAZToRsJi>
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
X-ME-Proxy: <xmx:gnUGaM3DPoqdouy69KxmnQ3YF2i7VYwe0K0m_DYo7qDq80U_zmliAg>
    <xmx:gnUGaKFQ48PVzlYFvrkZWY5t4EOFmz1dgv5UdBGxAaIL5ntshUt0hw>
    <xmx:gnUGaN-WjBXSOBMKw7brrtnQgUxKSi5i1QWGzAEAHlsu8BKVugAd2Q>
    <xmx:gnUGaHkommaXzJJH-EScrY2Sb9BDOBp64rRMxz-3elc4ZleW7HSxIQ>
    <xmx:gnUGaGG-PHY8ZSs9qHKXy0dG6ul3m-5avOINGkSuqe5DXSu70cs3sjWV>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:41 -0400 (EDT)
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
Subject: [RFC v3 07/12] rust: sync: atomic: Add Atomic<u{32,64}>
Date: Mon, 21 Apr 2025 09:42:16 -0700
Message-ID: <20250421164221.1121805-8-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250421164221.1121805-1-boqun.feng@gmail.com>
References: <20250421164221.1121805-1-boqun.feng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_094245_395336_357DD3F6 
X-CRM114-Status: GOOD (  10.99  )
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
`AtomicImpl` with the same size and alignment.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 80 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index a01e44eec380..d197b476e3bc 100644
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
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
