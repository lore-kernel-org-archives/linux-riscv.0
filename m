Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB2BC369D5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 16:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKYSkps9hfOgnDH8dJsHs4qkujx3RuiIJ7fhtPIKFLU=; b=VVu1b7WvuuvHBw
	gx1/shoMwuPCAHygfxJnj9Zga9wh9wMKz+ueXiik5gu1GTX/Rpu4TI5q0EzOczAtGk0NmY1sSTIJ8
	6h4QjBp8lYkMNStA8g3SansHvNWGHLBcHyGAyKpawKN2QfX2xraXZQQSeqPrTy/JFXKlZp8HMcpxv
	04Quu5hpP2+Ni0SEIP5FZQ3gBlMesaRqxxSSTylbLOrU0OWIiD4vmvCreRh78bEDdWUJQ7hbr4kvR
	v4gXUBGC+FlZAzMpIlheJDAvxGuwWMD58OgQ3fMwxDyPKtMtuT6u/MNM22LyHnyQ4EFf6WKYOgIkG
	FVce/Q1yOiCOglN1mN2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uFx-00000004kOL-1GYm;
	Mon, 21 Apr 2025 16:44:29 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uEI-00000004jn5-1ff8;
	Mon, 21 Apr 2025 16:42:48 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6e8f254b875so42964536d6.1;
        Mon, 21 Apr 2025 09:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253765; x=1745858565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FQdpd+pohHuwKd+PplgPe0guKqarlBZhgyvqtWw2lTY=;
        b=Q6waKgBa2Dft2Sj3+JCj31kwmciCgkc6j0KSYRJIOYDoWfLxKZEhO7wwW/qPDF9HeJ
         wOFrOYIe0CGEyaV8E26rOc+AJwr6Ypd6FM+E6C/HCQCFqblGMZYIWgFRsjx8P6KlVhGK
         yTuiTCWRPQK7i/6FsvZ/OuXuS/89eYmPHuFbwjzfz09Is4csY6Hvl7nLQF2Ntpyra1nt
         +J3RuPZ7K5Rm3vXplTEubsA+5x55KUtun6nctCc4NEZaXL5y1IzPtciVCLnJuRCK0xT7
         EaxzQuf/vaSrglrQe+6tlcOzBjI6iuqqxzoM9Ga+Osws5ZjtLmt+XWHT0Qn05v70V9gH
         O70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253765; x=1745858565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQdpd+pohHuwKd+PplgPe0guKqarlBZhgyvqtWw2lTY=;
        b=hYIMNjnuPlYMmZ7H7pdOXhPpek55VKbvnEq7rznMREySLBQxgNYX4oKyKJP+ClZyAI
         IZ+ZObz/kjF2M2u4QbTQHqYElRB/iW6nQxO8st9o6Er2cHxJ+cRgY5T5ryEL26G2dt+d
         sfLt+aQTMcKxROLnm4bX5Rx6pzVZHq8p+Myh7TT9tXC2iYbi6sbAAA5pYkbVCrRLJf66
         Ool4LPpdR+aa6q748JK8p08LLFG9g4+U/xEzp19OiwCHHqxW5aR3w+huIQGJSY88YgF9
         DMP55wjA92a8sC/bg0MOf06bBbyvHMVy+skfK+aL9KHqML6NeiaNYSqVGTmlsFzXFYvf
         mfjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGEU20bgViampYTmwY+GiQdwMgF1+JTjN+Rq2CUOmsddzxANXPtpv6YS8NV4Q5IerDNoO/WvDyoBjxPAw=@lists.infradead.org, AJvYcCVpjFzTTDn5M44iIZolFysTFmYG6TefC9reuYLyB8uNS0lTQsLNteqV0sYSPACZ4B3UvLbAE46lI4TqsoDFejA0@lists.infradead.org
X-Gm-Message-State: AOJu0YzS32k9T/uRqH25F8Cb7kPHnBvbQ0yxAKuwu5dEWxdiS0voHP6M
	poZGXBR98Cl+McD+9S2tn76wcvxKVNI9XTzzV1vjBflI8BjMCP3x
X-Gm-Gg: ASbGnctlBhyDorvs1tDkgwixHdb+yrcDT2gh/NbDzw8DUEPnN4Y+PKMJYaBPt26Mcih
	Iw957jSb2vpTH5tHEiz65XRA98dGwLLzq3nBmU/8YmslqZKTDQM5pby6Zo3LRlUoRB5tSz07sA8
	oCLcM+FxsyNfuoOKQUzj07aNXNUCBlcML8Q5sUtwCTVeCzzrwm5v8JLtxLVpkeNTLlKOOgEBhJj
	WgWNyJ07VRvdcD10kApkX06P7yhYpUh4NR1oeiJTTkfxfEjUpXwzBzkZH26OFMNv3gaTSkS60Dz
	zWDXha0ngmCN0maHSekjFJQ56vNhzMVms+cf4rTaVdpBMZxIvhzeqYZabqoZ9zItKsWa2gAj9+Z
	M5xF6aRHuiiBi9ykNxVv8+JP8yagIHkQ=
X-Google-Smtp-Source: AGHT+IFludFA784TgNROMF/7dVTxI+vBbVyGDhrIYPf7p9QouCTgDRGsod3hDe4panxOUeE1Tv+cLw==
X-Received: by 2002:a05:6214:1cc3:b0:6e4:2e5f:c03b with SMTP id 6a1803df08f44-6f2c4569fefmr189839786d6.22.1745253765057;
        Mon, 21 Apr 2025 09:42:45 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfcd35sm45649936d6.69.2025.04.21.09.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:44 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id D19181200043;
	Mon, 21 Apr 2025 12:42:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 21 Apr 2025 12:42:43 -0400
X-ME-Sender: <xms:g3UGaDqM-oRY72VYfjjMMPWBvD260B0kTEAsydJZkF4gN068ia1SFw>
    <xme:g3UGaNrsF5Ku86dctP77P9l30AlPIBsgRI8mheoJ1zwGoh1aEhvWqRbi01tZqtDqV
    w-lrLPLVxP1XWVb7g>
X-ME-Received: <xmr:g3UGaAMNVA8SJrYRDpHMhbtIliU3S27SHm1GKUj-cWhLjgzbQf_Mn0IK7CxF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefg
    veffieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpeehnecurfgrrh
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
X-ME-Proxy: <xmx:g3UGaG6oIejwUk9ROXZAi4AfIt86GNmDOQtx95SfmZVDVwnImBiYnw>
    <xmx:g3UGaC5PU_lidQwNoZHsPp0xYqmuTX4yzf9_8XjK0nKJ0BJHzgnGgw>
    <xmx:g3UGaOim6mTR3MiQ5pi4rJo98ItyYarif3n-MV2yevViPc9uX9wO5A>
    <xmx:g3UGaE4SW0qcatBPuakGjhChYJB0n5Lj_GIF-9KAOwr7heV_-atzVg>
    <xmx:g3UGaBKs0Qe-XZ3HmeRKLnaez0zEWFmBrXeDFaK7kh5arXwITaODOVeO>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:43 -0400 (EDT)
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
Subject: [RFC v3 08/12] rust: sync: atomic: Add Atomic<{usize,isize}>
Date: Mon, 21 Apr 2025 09:42:17 -0700
Message-ID: <20250421164221.1121805-9-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250421164221.1121805-1-boqun.feng@gmail.com>
References: <20250421164221.1121805-1-boqun.feng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_094246_433416_0136C7F1 
X-CRM114-Status: GOOD (  13.14  )
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

Add generic atomic support for `usize` and `isize`. Note that instead of
mapping directly to `atomic_long_t`, the represention type
(`AllowAtomic::Repr`) is selected based on CONFIG_64BIT. This reduces
the necessarity of creating `atomic_long_*` helpers, which could save
the binary size of kernel if inline helpers are not available.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 71 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index d197b476e3bc..6008d65594a2 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -102,3 +102,74 @@ fn delta_into_repr(d: Self::Delta) -> Self::Repr {
         d as _
     }
 }
+
+// SAFETY: `usize` has the same size and the alignment as `i64` for 64bit and the same as `i32` for
+// 32bit.
+unsafe impl generic::AllowAtomic for usize {
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
+
+/// ```rust
+/// use kernel::sync::atomic::{Atomic, Full, Relaxed};
+///
+/// let x = Atomic::new(42usize);
+///
+/// assert_eq!(42, x.fetch_add(12, Full));
+/// assert_eq!(54, x.load(Relaxed));
+///
+/// x.add(13, Relaxed);
+///
+/// assert_eq!(67, x.load(Relaxed));
+/// ```
+impl generic::AllowAtomicArithmetic for usize {
+    type Delta = usize;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as _
+    }
+}
+
+// SAFETY: `isize` has the same size and the alignment as `i64` for 64bit and the same as `i32` for
+// 32bit.
+unsafe impl generic::AllowAtomic for isize {
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
+/// let x = Atomic::new(42isize);
+///
+/// assert_eq!(42, x.fetch_add(12, Full));
+/// assert_eq!(54, x.load(Relaxed));
+///
+/// x.add(13, Relaxed);
+///
+/// assert_eq!(67, x.load(Relaxed));
+/// ```
+impl generic::AllowAtomicArithmetic for isize {
+    type Delta = isize;
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
