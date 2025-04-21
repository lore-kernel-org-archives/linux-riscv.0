Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337CBC369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qFpIXTbgh/J75hinsaoqMlktMJ3HVZBJH9rDbBiOvZw=; b=TUpwvRJaONWGmm
	fdTwNyG9sOz0Eyw1ubOgdbZ9EEXxNoDP1T5v6akpk5pNKj2opwgwR4YHqFItHACuIj64Bhw/DHZZx
	c5tBwOKoDYyrYOdPNp7hsMUmVH6wDxYLdv536FzFRAQDt9/+lOxJJt0xkUroTsmsGWV9cuAdZ4GAy
	lfi3vPyR2U3kMNPzpzXnNyEMlTagDHLE1rQQVAUjFW7zJlty+ZlZM+DzO7ZT/QppRWa6fLl5ycLBe
	O25c2aVxN3dzz+tgxq0/asGcXmp4ILeH/ajbCFmZ3TlLuY/NO9+acB5c2je1y9G0t4Nt6sZJtTj0T
	6MsG0gCgGIWGRSWyONdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uFr-00000004kJQ-3EwA;
	Mon, 21 Apr 2025 16:44:23 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uE5-00000004jdd-1Qvx;
	Mon, 21 Apr 2025 16:42:35 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7c5ba363f1aso558916285a.0;
        Mon, 21 Apr 2025 09:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253752; x=1745858552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ODIKSAWOegt1B2HFm8l018++oeGfbMZqnIZ7rWaQ3pQ=;
        b=Ap6yA8+xXGoDW82MbMTXCDUVgw3B0JXEwhtMffeHTsNvMT2wsXD904BXXNjN8nCxY4
         05kDP/2rRnFjQADZ79neePNOHnHtT4XYXuJH2aCMD0GFJIwyeL9RBX4oLd+n10bKm9mK
         3qBksW3bqPL4k6yzJ1THgAy0iNyVUPfSnL8nNkV1VmU8j2fKAjrnW96D7QcnJ0aj0Whh
         lMZ9W8XO9SCGUQy0/o4YwBYcBZndQ9Q8vecLRQSQVaCM8kDcpYCeswr9zdf8qybTMlJx
         cdaA63rgC1cBO4V8FKJQoHeKYiXahZJCBN9Gg9QCqeWgQitRU9Z5flr2tOCTEC6H3gM9
         ixfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253752; x=1745858552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODIKSAWOegt1B2HFm8l018++oeGfbMZqnIZ7rWaQ3pQ=;
        b=GucCOzJhScIKl0Bcqtp2Z27Q20z9jhSfrdIZflKvXMHOCYCeg6XZ8P3jmxMHQrZfeP
         /cBpMTUmU1Ep3TyYA9uD9ik3FlmGoZokBgjfW2ImOWZAtWz4QrXgOE+hF3RlJd4yRuoM
         C1sxHkpcJBKJC0k740nlFawn+GQtRMQEROlmNnGCEVdF47NbSoIDgCAyRwlvwJ+2YLib
         DksLFUUpkT2fPrgxbBS++n01RtptSyLiir4cdC/tqETvlgTjAP0fU88b5oXHq+GzTcZY
         4bQshf34dmRwTvkea/kjIRGJWYQUCbbmSWOIe0RwR6fztlRSQ39v0kbjx2mcq5l/v+zK
         3mIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzwr6aNsqhNHcLTmREF0nNLSsThKci5PLCDGlbA50yhngKg3Cd6DGtTsIOKfaVCJZFXCYmlBs4zSk3+SA=@lists.infradead.org, AJvYcCX2lDWsyA7T3MINnSOjlCnxUtNtaaLD+UkpQR4Q4M6l+Wn1IjNs1HAdnPqPTdUB82WMih8GfrPgwnJMZVIVhpyg@lists.infradead.org
X-Gm-Message-State: AOJu0YxOUoKL8b/+ewXdifGefZE8IYrbx6qKdDRL7RPWVT4aLHVhMrUk
	wWYgaHUJ3LLw29RVE0FDNPGinnnT3JG/AZjfdiQaDX3JwMq0yrqa
X-Gm-Gg: ASbGnctwSQtY4EvG4GwDxRWBy5303jK1FFZwqMkSSbJjuMM+dYDVkXtjaDfmjMxnfoD
	8EwzET4StvjSIEB35ycaC35xSCSpNU+1lH4+u5KLFM/Z12fo+EE5UKna/z+iqbbLRDSpes8vd7x
	zXF5kM61i9GBXTj7I6/gAwKMywwMOdHZCw8A1w8VYecgjYc7fPjfJsL3u/CpA5wITRtCieyXl1s
	ZTQ4/YmGn38pVARn4xmXLT8yAJykkFkxUipX4UFAIFG8UPayqYUPsOyC8/kiUEKJhD/3IvTrCZD
	UTe5b8ur2mTsupRbu7VZoSy5L3qZAtHE5RXo8Wh5rhF2M7QezwekDKXuS5TXeS1hbHmLdAwumwN
	vwwp+u82i4FjUK5ArfUqZ9lapd08Qd+w=
X-Google-Smtp-Source: AGHT+IFJetgkWwTl7QWatfMt6xsWv4F3kEqSbz8SmtOibvoHeVRXwSntbQPnFHig2vufQ6eYaDtCsg==
X-Received: by 2002:a05:620a:f0b:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7c92804d010mr2247007985a.53.1745253751825;
        Mon, 21 Apr 2025 09:42:31 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b5f83esm435258585a.90.2025.04.21.09.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:31 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6DE101200043;
	Mon, 21 Apr 2025 12:42:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 21 Apr 2025 12:42:30 -0400
X-ME-Sender: <xms:dnUGaKTlJuxHgt-ByEfqqq6pKkOsT2AMOAdV6wfAPxVU2GN-bFZOAQ>
    <xme:dnUGaPw6B7IAIOuPN4fLcyjSfzr8w_sKGNmhsFvjy6Ezg8Nhk9t-LZlkZOfVJT2xr
    ZPsDvtm1yJDkpUZig>
X-ME-Received: <xmr:dnUGaH3dwis-2V2wO2u33k0Li-fk7BirGRV2xY89LN1lsk-HFPl6qKP11___>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeeggeeukeeghfevudektdevjeehhfekffevueef
    udeivdelteeltdekheejgfeiveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeehiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheprhgtuhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdgrrhgthhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehllhhvmh
    eslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlkhhmmheslhhishhtshdr
    lhhinhhugidruggvvhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    sghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:dnUGaGAIFo9hXK_--fPBdFYreTLGmzR7mN6l8OZDIpoiWnL3BrHWeQ>
    <xmx:dnUGaDiVq-wZpzKikenr_WqjGgjUzfS-Yxejaa7b1Nse-klFgRUpYw>
    <xmx:dnUGaCp1pY3eVeNPRNWYeXo-KJwlKGUjqmFt_YeVcnQfng5DOM-V3A>
    <xmx:dnUGaGgwDNiiaWtfhYyD9JPrJgt7jwz6tyJvo-QoMFT_ZTthuHpDbg>
    <xmx:dnUGaCTZPsnD4RyR99O6Hg_vj72roA5JlZAcikFvF4b6LTZNHnqdt3E_>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:29 -0400 (EDT)
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
Subject: [RFC v3 00/12] LKMM generic atomics in Rust
Date: Mon, 21 Apr 2025 09:42:09 -0700
Message-ID: <20250421164221.1121805-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_094233_383922_975F9C4F 
X-CRM114-Status: GOOD (  13.66  )
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

v3 for LKMM atomics in Rust, you can find the previous versions:

v2: https://lore.kernel.org/rust-for-linux/20241101060237.1185533-1-boqun.feng@gmail.com/
v1: https://lore.kernel.org/rust-for-linux/20240612223025.1158537-1-boqun.feng@gmail.com/
wip: https://lore.kernel.org/rust-for-linux/20240322233838.868874-1-boqun.feng@gmail.com/

Changes since v2:

*	Drop the temporary RCU binding since they are already in
	mainline.

*	Fix a few "Ipml" typos in previous versions per feedback from
	Alice Ryhl.

*	Documentation improvement per feedback from Alice Ryhl.

I'm hoping to at least get the first 8 patches (atomic operations on
normal integer) in a good shape so that we can have them in v6.16.
Thanks!

Regards,
Boqun

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

 MAINTAINERS                               |    4 +-
 rust/helpers/atomic.c                     | 1038 +++++++++++++++++++++
 rust/helpers/barrier.c                    |   18 +
 rust/helpers/helpers.c                    |    2 +
 rust/kernel/sync.rs                       |    2 +
 rust/kernel/sync/atomic.rs                |  228 +++++
 rust/kernel/sync/atomic/generic.rs        |  488 ++++++++++
 rust/kernel/sync/atomic/ops.rs            |  199 ++++
 rust/kernel/sync/atomic/ordering.rs       |   94 ++
 rust/kernel/sync/barrier.rs               |   67 ++
 rust/kernel/sync/rcu.rs                   |  275 +++++-
 scripts/atomic/gen-atomics.sh             |    1 +
 scripts/atomic/gen-rust-atomic-helpers.sh |   65 ++
 13 files changed, 2479 insertions(+), 2 deletions(-)
 create mode 100644 rust/helpers/atomic.c
 create mode 100644 rust/helpers/barrier.c
 create mode 100644 rust/kernel/sync/atomic.rs
 create mode 100644 rust/kernel/sync/atomic/generic.rs
 create mode 100644 rust/kernel/sync/atomic/ops.rs
 create mode 100644 rust/kernel/sync/atomic/ordering.rs
 create mode 100644 rust/kernel/sync/barrier.rs
 create mode 100755 scripts/atomic/gen-rust-atomic-helpers.sh

-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
