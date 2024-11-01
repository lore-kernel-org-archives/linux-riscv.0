Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91F7E674A6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 06:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FH/xQVnaps1I20hXiPXtOr2lriZQsdneO0z40MMDKVc=; b=y+k/3C909JvP/U
	JcAaT0ZjGAgiDRQmj48ygKZzaltA29xGVRxWuodWzUuPuuPThxcVw05XwEuNrrjLxgrBZP2mXQKGT
	ez1vOdoXq/xZ7majpvf586NOFB4cRvuJJq47xAsILXJ49U+yAbGVeTLg3Sj/OgNtPZfQM29USn/cZ
	3vmUCIvtkgZITU5OOypU6J5VIEGrR7t5GLFsbGGgTVOiGhRV3n8+zvxnUZWDNT5lyvUiwrsg9ayEA
	X30J2Vw+y7eSA4XMG1vPRzsUiyP10VRgUFPvfOzgUMcwU2QQLE91elxYOs1NVenJIcMjlUGfDl4Kg
	4QV/KJTZvcpINaECFBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6klL-00000005ta6-2EVm;
	Fri, 01 Nov 2024 06:03:59 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6klH-00000005tXv-1vLn;
	Fri, 01 Nov 2024 06:03:57 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7b15467f383so117935985a.3;
        Thu, 31 Oct 2024 23:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730441033; x=1731045833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+2bTlN8noZ5lv/9FDkrA2vDRY8BOyZCwzPzl7RAkqKk=;
        b=dbs9FIvAa7PSGdTcmQsEg9lIBl/sypTOj9Dm8kWmLPsol41l6L16sGI/Wi7rzKo78t
         4IZWC404wgCIPK57gDv9lGjXmRtpRqjmx4vhwhihd+QxFju9vWbsz34NMiILLUZH3Lqi
         C4Y3/BxQZ/zfCxSBTmgXwZvvwVs+lqOjZoP+e/9b+lFMqqn7MPppMBAJN3fGF9LYOzb/
         W0FejgEyEjz0fNQgo7L1ydMKWyuRKkIkIAMyLy3oNuS+MD00r51MDs/PB/xaUgIWTSFc
         SfriXxVMIlwb7JMmIxJRHxpMID2ruLz++8adR2JbCinxztQUH9ck0ecj0JV9D2GA5F/q
         g06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730441033; x=1731045833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2bTlN8noZ5lv/9FDkrA2vDRY8BOyZCwzPzl7RAkqKk=;
        b=HLtkRk5G65DYm5zB086Y99ssn9KfIlUuimFr7fjaH4wLRFR6nwH2s93TDzJgKnh6oH
         SZsx3M2Rj2zEQk40u+kS28LNBAPyAWq6ofW2KbrhIkyEkepn3BO+nXROnAvOuo1waTwz
         Z3t2NRzhBVQ/W5plX7EZ8J8L1ikFJYZVH6rWMskUwIuwTrlGeMg0bYa5nG6QfeE0XC4R
         oH11TIdsBwdZD/h1W/kdHtpPRSqgVtOD3ZPrrqDAEd1xZCoYPpUoWl+wy9jRVYVCjbKf
         A9EnWILvWPTtXPwRYc56JQjzHDiZjrZEnIgY6d+X1Efyr2LTkIURDkUFbkhnSQyCVDr4
         Q89g==
X-Forwarded-Encrypted: i=1; AJvYcCXIZr8NtsH6o92oLhWJZ0bK67ydvT4h0+1Tgd5/SWlnwnQuSyi0jUo0m6g69bAiqQ/LG1/vpEYvUvm7PwQ=@lists.infradead.org, AJvYcCXhPyiePbUI1Cd634IpGV/J/swUcMVCSn7ZSjoNQMZxBDpRcBGBWeR3zJdxoYLD5LresYFgS8q4+9lX3Fsdsaz9@lists.infradead.org
X-Gm-Message-State: AOJu0YwFavf5cz714V62t8Mo1Hg4LueuazGU69qwjdsFiNCRZMeYtx47
	1mSS85UxNhQetrChmOMvTG8Sl/VN8RHWFuT8J2V/XBMwxxxSsDdA
X-Google-Smtp-Source: AGHT+IE8dH3BMdlvbypwg4VmYirLppGtFcZ5cwJKd05k9wHF2J90IIvTu1h69hU5sjknpTNd+rMr+A==
X-Received: by 2002:a05:620a:4608:b0:7b1:4d3b:d618 with SMTP id af79cd13be357-7b2f25529e5mr678702585a.57.1730441033290;
        Thu, 31 Oct 2024 23:03:53 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f3a11765sm141084285a.69.2024.10.31.23.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 23:03:52 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id A3CA61200043;
	Fri,  1 Nov 2024 02:03:51 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 01 Nov 2024 02:03:51 -0400
X-ME-Sender: <xms:R28kZ4bb_Sk9J7zt3qFeaT1qzW6GSFona-Ra0vzADvi51JvP6gzrQQ>
    <xme:R28kZzb4zs_rSb-O8-rH8VXmtXSrpKNxo7HIHRx2zWFOWZ3pXa68xln8EoyBgBAMD
    PArbQDyATWXi5hP_A>
X-ME-Received: <xmr:R28kZy-LSAufwW1a7ygeoPoU8ypYEhDJatfOJM4Th7Lng_ghYTxruzelpVo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekkedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
    rhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeeuieehffeijeelkeevheegleeifeevfeetkeehhfei
    ieevfeegvdelleekvdejleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhlfihnrd
    hnvghtpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlh
    hithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehg
    mhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepheejpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhr
    tghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepoh
    hjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhes
    ghhmrghilhdrtghomhdprhgtphhtthhopeifvggushhonhgrfhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:R28kZyrpJlHIvsTTJ-WuleSP96_mG-FkZdVedW5NiQjlaAFO600eMA>
    <xmx:R28kZzrHCB4ir-wAjZX332RHKJMwzKCinWtCmTJyWN4LWycSAWm01A>
    <xmx:R28kZwSMGSNzLcJp6OHMEq-daBCDG1v6e6QenIan8b8GxF-TNgRoLg>
    <xmx:R28kZzrH-eNwVcajJdcHii_fV9T-A03iQvTXjfsIV6uAIxC4E0YxjQ>
    <xmx:R28kZ468gHgU7LKmhLnh3uBi9E8DEdQyIqYPQ4y0FNHt4kMBxSX6Xsq9>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 02:03:51 -0400 (EDT)
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
Subject: [RFC v2 00/13] LKMM *generic* atomics in Rust
Date: Thu, 31 Oct 2024 23:02:23 -0700
Message-ID: <20241101060237.1185533-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_230355_525607_63CE69D7 
X-CRM114-Status: GOOD (  19.36  )
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

Hi,

This is another RFC version of LKMM atomics in Rust, you can find the
previous versions:

v1: https://lore.kernel.org/rust-for-linux/20240612223025.1158537-1-boqun.feng@gmail.com/
wip: https://lore.kernel.org/rust-for-linux/20240322233838.868874-1-boqun.feng@gmail.com/

I add a few more people Cced this time, so if you're curious about why
we choose to implement LKMM atomics instead of using the Rust ones, you
can find some explanation:

* In my Kangrejos talk: https://lwn.net/Articles/993785/
* In Linus' email: https://lore.kernel.org/rust-for-linux/CAHk-=whkQk=zq5XiMcaU3xj4v69+jyoP-y6Sywhq-TvxSSvfEA@mail.gmail.com/

This time, I try implementing a generic atomic type `Atomic<T>`, since
Benno and Gary suggested last time, and also Rust standard library is
also going to that direction [1].

Honestly, a generic atomic type is still not quite necessary for myself,
but here are a few reasons that it's useful:

*	It's useful for type alias, for example, if you have:

	type c_long = isize;

	Then `Atomic<c_clong>` and `Atomic<isize>` is the same type,
	this may make FFI code (mapping a C type to a Rust type or vice
	versa) more readable.

*	In kernel, we sometimes switch atomic to percpu for better
	scalabity, percpu is naturally a generic type, because it can
	have data that is larger than machine word size. Making atomic
	generic ease the potential switching/refactoring.

*	Generic atomics provide all the functionalities that non-generic
	atomics could have.

That said, currently "generic" is limited to a few types: the type must
be the same size as atomic_t or atomic64_t, other than basic types, only
#[repr(<basic types>)] struct can be used in a `Atomic<T>`.

Also this is not a full feature set patchset, things like different
arithmetic operations and bit operations are still missing, they can be
either future work or for future versions.

I included an RCU pointer implementation as one example of the usage, so
a patch from Danilo is added, but I will drop it once his patch merged.

This is based on today's rust-next, and I've run all kunit tests from
the doc test on x86, arm64 and riscv.

Feedbacks and comments are welcome! Thanks.

Regards,
Boqun

[1]: https://github.com/rust-lang/rust/issues/130539

Boqun Feng (12):
  rust: Introduce atomic API helpers
  rust: sync: Add basic atomic operation mapping framework
  rust: sync: atomic: Add ordering annotation types
  rust: sync: atomic: Add generic atomics
  rust: sync: atomic: Add atomic {cmp,}xchg operations
  rust: sync: atomic: Add the framework of arithmetic operations
  rust: sync: atomic: Add Atomic<u{32,64}>
  rust: sync: atomic: Add Atomic<{usize,isize}>
  rust: sync: atomic: Add Atomic<*mut T>
  rust: sync: atomic: Add arithmetic ops for Atomic<*mut T>
  rust: sync: Add memory barriers
  rust: sync: rcu: Add RCU protected pointer

Wedson Almeida Filho (1):
  rust: add rcu abstraction

 MAINTAINERS                               |    4 +-
 rust/helpers/atomic.c                     | 1038 +++++++++++++++++++++
 rust/helpers/helpers.c                    |    3 +
 rust/helpers/rcu.c                        |   13 +
 rust/kernel/sync.rs                       |    3 +
 rust/kernel/sync/atomic.rs                |  228 +++++
 rust/kernel/sync/atomic/generic.rs        |  516 ++++++++++
 rust/kernel/sync/atomic/ops.rs            |  199 ++++
 rust/kernel/sync/atomic/ordering.rs       |   94 ++
 rust/kernel/sync/barrier.rs               |   67 ++
 rust/kernel/sync/rcu.rs                   |  319 +++++++
 scripts/atomic/gen-atomics.sh             |    1 +
 scripts/atomic/gen-rust-atomic-helpers.sh |   65 ++
 13 files changed, 2549 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/atomic.c
 create mode 100644 rust/helpers/rcu.c
 create mode 100644 rust/kernel/sync/atomic.rs
 create mode 100644 rust/kernel/sync/atomic/generic.rs
 create mode 100644 rust/kernel/sync/atomic/ops.rs
 create mode 100644 rust/kernel/sync/atomic/ordering.rs
 create mode 100644 rust/kernel/sync/barrier.rs
 create mode 100644 rust/kernel/sync/rcu.rs
 create mode 100755 scripts/atomic/gen-rust-atomic-helpers.sh

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
