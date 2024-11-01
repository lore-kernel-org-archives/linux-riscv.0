Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3100CE674A6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 06:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAfKqLVd+joSmHNyQS6/FGumifXLk4fYDzxWFM0ON1Y=; b=2t57K6yo0DMX7B
	4hGsevzfXBqfj4f+oPSqgxlrDIcUYCbbNRzmeryApbwIM6Ld4CwKNumuAkMBv7AF1nS4QEtUlilUb
	NTbieQz/DZptipLRfZ/78nDrnrrgEhlH3ABEFNBZIuq4mmcIXEaov2ao+i7B99BQPNC3Qicg8mgQe
	suJ4RIpcvjzTcz6+VQh/ZagfJiy4GWjwG5yUqLAwCTtoFPgR8qq4iG9uj+5J/lWGCbPm7ND0cfVsd
	EiV0l/uGhbgKgO7B+hyI2DZPyLQvMzvk+OdP5wkGJ35kHA5WMAgzAh6kDUibXONncFGDUcjLki3Py
	D3Aibas2g7EhxfFF/S5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6klz-00000005u3i-1bkP;
	Fri, 01 Nov 2024 06:04:39 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6klS-00000005teQ-3axr;
	Fri, 01 Nov 2024 06:04:10 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6d18dff41cdso10906396d6.0;
        Thu, 31 Oct 2024 23:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730441045; x=1731045845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A6tG39HqwvxlfRrBPWElR6isULD+PRgdHmRoN4FVkag=;
        b=CuuveHPVtkJWMuag0Af/A+Ncp0xFE/6x/M2YsezAsqF/o/noHg1udtip6Ny6P+WkaW
         He4p1XR3vPJyVJXIgrilpu9VW8qmBUjDBWeeLtXbABIBnb6vGu3jhTa/qstdaUkIZCAb
         4riQv/2Sb7+clXRd+ooAd2O2nmrLvNOvh4ePHLe0TnjYCed6HmIgI5Yss8oXgSIKAbun
         FkpNyJsF/3VZ4cEWGgETUjnYZ0kn+lDf0z1HmInjXjqzRJQCTiFXK0GWMLEAOHQ4UZhK
         CdaAhJgg7RQ6CB6m9Z5dFtXfTKBK+/x/vzFDzg94dBe+bz3d+hiCJqOaF5UiRYseBhKn
         h87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730441045; x=1731045845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6tG39HqwvxlfRrBPWElR6isULD+PRgdHmRoN4FVkag=;
        b=AXc6JuU1b7+nfbDZ3CLK0LMG0snHXPu864EDxYmv59CAbtnosfv3eVR9B6AmKx4Zhx
         d6jzulC49T5bNAmvIKXYzooohb3D7V/1vlabMjLh5j9RA+btPI0eYvJsFi5EV3Gb8kc7
         d5QqE39u9PbFTEfoA4cE/5MTsOjxCNv1zuwQLQIXSgluGtSSo9WZcWa32X9og4ADyWF7
         2vfqunsBHEwaKTwhzYNll4y1e2mQMOU4q31EmhULVvcXDhoR9O30JuIi6XkE2G1CRp+q
         DrR8rsgbU+fKNLSJ9BVBAcElkLOOxVFM+9g6lGcUyvBHufxedis0SkU1kvjSnU7UHsDj
         iGXg==
X-Forwarded-Encrypted: i=1; AJvYcCV9q5vDmj1RyfWfNvsA92fqEZ+o3x6wOcPmxPhJMVTjeNSbc5afdaPUuelG+1akrM500J4Qt9uS1j0VGSc=@lists.infradead.org, AJvYcCVh5CHzCXSXxEKno3XWxM4aoYapuOqmg5mtmec832NLEUpnd1VYxEs+GFIU60RV5zF5BYksRmd52HMcW/p4uxYc@lists.infradead.org
X-Gm-Message-State: AOJu0YwenSwhB+Ka3dxPfSq7nevjFToYEhQtkhqL/RMctEq4mXBFjVlr
	BuLBOVHIWhW8MhGDh1zgEA7AJ8i3eOtnfjegPyXuLwzNLP8ei+I+
X-Google-Smtp-Source: AGHT+IFtPDQpnEfGDYf1MmQMy0Ftb/LAJarvVqvfSwx3qBw/GVNSOA1uCeVT60t5HopFhvrmJymKdw==
X-Received: by 2002:a05:6214:5348:b0:6d3:4992:f585 with SMTP id 6a1803df08f44-6d34992f616mr104514016d6.49.1730441044801;
        Thu, 31 Oct 2024 23:04:04 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f3a7045bsm140747785a.73.2024.10.31.23.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 23:04:04 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id A2B0D1200043;
	Fri,  1 Nov 2024 02:04:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 01 Nov 2024 02:04:03 -0400
X-ME-Sender: <xms:U28kZ4ja5LWAoU3yfdto9YffBnntil7uUTgczdBRrUYZKEv2btRd8g>
    <xme:U28kZxBYHbxlZdQi9ryR9nVcf3Dt1GVAl3wOeehcX1LNRUuyoQ09TQMXk_ZjoSHfg
    mEmu5J42uBN4wHzQg>
X-ME-Received: <xmr:U28kZwE3vXuFtU6mK7fc1-Lvj8OilcmMDSlV9ABGW3CfHcTMX1TEKiPgpt-UzQ>
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
X-ME-Proxy: <xmx:U28kZ5S9yoZIs7IW9AC7EnrOMNOqs8HEN3ixerhOZkN5FxVuQwmcLA>
    <xmx:U28kZ1x0WeOFpLKtfjJf3QxURbgBdAQD-QZzqlYqUc4c9UxD8aDGIA>
    <xmx:U28kZ37PV7nEHBhCjP5is95pa1QT1aCTegkWgEoSyzwvIT4fJKVsqg>
    <xmx:U28kZywelM1bn0bGZrshBPINCbhspnqfODCvXGwpbjTGAK-ZyI1TYA>
    <xmx:U28kZ5gtbZyUKsexuxYAueAlEkJOtr4eKxBDt8MK-SSvoYd1I4pADr7w>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 02:04:03 -0400 (EDT)
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
Subject: [RFC v2 08/13] rust: sync: atomic: Add Atomic<{usize,isize}>
Date: Thu, 31 Oct 2024 23:02:31 -0700
Message-ID: <20241101060237.1185533-9-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101060237.1185533-1-boqun.feng@gmail.com>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_230406_997987_C0ED6091 
X-CRM114-Status: GOOD (  13.08  )
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
index b2e81e22c105..4166ad48604f 100644
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
