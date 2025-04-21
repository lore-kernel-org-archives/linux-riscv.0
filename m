Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48000C369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 16:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yasd6FpMM+WtKf+ze6TZCHB0GTKPLmXZX3QVX9QpePo=; b=IX7i8j8ekE58+R
	B0ZOr4ECcTXiTe4jp3Cu4Dr4U+7hYq9MaepBaGtaitMmbosAImvt0QNnWqjXBchcX5nLdrUoMutij
	OCad3hGw5hB+lfKqfZ36/2LJZ53MgwsZSyGWwbChdLuVMRTnarZog2+yw7CKAomLWXrQqwSO4Td9e
	nbk4Yj6IVIs5P04/LdCLG0vuw623tIw1QEiMnCk1eMOrwh1hX8LHHyCgDQBSPOqVvxOpCJeMo3H1+
	hct7AJbRrM8tVx1uT9kIl7+fTbP59nlQeseekWdyIKj3N+EZpfsRdPoKVSmLASIUD9xvQ9RksKpp8
	4MgZa0rQM6LwfqI4pztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uG4-00000004kZE-36Qc;
	Mon, 21 Apr 2025 16:44:36 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uEL-00000004jpS-3Dhx;
	Mon, 21 Apr 2025 16:42:51 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4769aef457bso50115071cf.2;
        Mon, 21 Apr 2025 09:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253768; x=1745858568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uMU54tdag8mXyAmWP+eFJWJLUiSas5VBnDSB0h2I5Ow=;
        b=PJe07kkSQ7uj4vzq/BYhuIWM3ZYKVbxe0cTLsEwnIYSQeDybo/ne7PvykEf+z4kJ9i
         Au4CZUPngocIrrqPrIijb217yNVKr5LEAxd6wumC8kxXtbmmUNMgEQVrE3IyfWTucUfV
         el8qqWT0fVblIKGASM/JYFBXk5JYHcQUWsm039/kJHqNz3sTiWPpC6Q+U6riZxDdQAJp
         ysadD5EEm8w+enipDBZ1AEQ0eh8IwIDncKHAgaUu+EbLJ0QUtfNdZqEuICjmNKTIK6fC
         asCnzUm65iDZvh6a7YjuEmVubcx8dCrL5PvH/CU04dOys3QidkAdgNj+ykVEBfd34YBg
         ihdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253768; x=1745858568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uMU54tdag8mXyAmWP+eFJWJLUiSas5VBnDSB0h2I5Ow=;
        b=GAba54Rhni1S5QG/DrFXPe0dbRUw3eazyeCix3aPnGxu0R8SQOR33qJNFbWHl/leT6
         dj9CcbCOxmn1p6UWiu20M7sdB6P79Wt1S0bXgDtFMUubF0XkVIRjk3l/lJNpZ6fbDbB7
         Uu1tH3uwx7ra6WX0p0KKXn8MhMYMpRXGBkbVjC2xK0dsk4moM5/DUO4tEURR+8D6qOq9
         UzsYjKpBU1vRu6fJvm3QN5u2lB20gynfptPVKL2VsqXYHG4PDerRX9o1YNJq32InQ/tY
         IF8Vrg76dgfYNpR2CavwNSDdYd7ispAeRQx6qurlHPBA6cQTVuOppMNh/AlxP6pgY8RW
         wvHA==
X-Forwarded-Encrypted: i=1; AJvYcCW+8/g2hyFJhToVXRPe1UnXd5/6JhyrxmPwQQdFEIJwzpunVsX1pc7+IOJ+Tqy762Tii3WQLuC4S1WVkcY=@lists.infradead.org, AJvYcCX5qNr3aBjz+NaZ3PrbcEZyj/HU+a4x7Zzr9A4f0B5Q51NnVNDDc3SYeC6SDlHPMwOAWTSe9FSEHwRbahrXN860@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4FR1AInXE6O5lfxUl6sokhyn7HjXazkLKeaflgsXeXUu1hPSz
	iTWPbW89Q9DUcIw3Gg4lQLR2NYs6RR8L3pODaF4aiFErX70vl1Hv
X-Gm-Gg: ASbGncuR/vdggJZ3B2Xd4kckKe8leY0VSyz9IOwbisLHh5cZ8Yj4TKPSvvMi+5BtXy+
	ugvgfgturixmuZ+65sW4j55c2fDZTVDXGGaEngQW3MjTcdtviR6nc54E1pW7fadmhk3Xg7tca9l
	ofDsC2J6xd9HwJBU1FwMcH/Wp7Klt4kC8rj2eYCLvlTXVobqoCLjTedZLKLLgb2bi/S81/mRezO
	+WWizAKDJa4202C6vWGnmtgyY8tPDgMxzVQyT6D+tTVgv3yZztBlgDS3OcV/9uECf2CMpGWJq3q
	v239ZSla+LHoiM4eX0sb4eE3K4Rl1oKZ1ZDFDWYpsl/hgQR/LDbDjuVcnf2q/XG3f8gcmWtKOkb
	rkLuO1U9krtyNflaX4/i1EUCbFNXLoT4=
X-Google-Smtp-Source: AGHT+IG8et7fC7+tUWJWdi/KRagmuQCr0geiaNfRVcQO9g1LzZ7CU4sJ8yq6iEXQfDvIr5R63Ow0QQ==
X-Received: by 2002:ac8:7e96:0:b0:477:1ee2:1260 with SMTP id d75a77b69052e-47aec351e08mr190531681cf.1.1745253768325;
        Mon, 21 Apr 2025 09:42:48 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9cf9f88sm43877931cf.72.2025.04.21.09.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:48 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 25E5B1200043;
	Mon, 21 Apr 2025 12:42:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 21 Apr 2025 12:42:47 -0400
X-ME-Sender: <xms:h3UGaG57po1eR2F88GMjW0h-xR6XvIjMQuOmAFfAEw5EzHKzOqLq5g>
    <xme:h3UGaP59JVjNaOOAy-__KTOM8TZbBUJPsHXOmFp3On8lbzbdAdHU8vJud9YAmz9OC
    1Rv-B_OQCRtH1s-Cw>
X-ME-Received: <xmr:h3UGaFcxsZjJKvlIY6eTduyY2xePqb-oBqcx10y-VQ46DbKofgllEsYOdSUD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefg
    veffieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
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
X-ME-Proxy: <xmx:h3UGaDKY3WhiLISzt8hpltmCqfJP5nrXVAkhh2O73Q7gW6cYSP8-5g>
    <xmx:h3UGaKJ9cqOrAZxyZVAPaDk5qrig4s8HEy0K2sz6tTpa0e4STiTPRA>
    <xmx:h3UGaEym3UKQtrVgcltD72BrgyPmmACBNsNZvEkPs0Y4pip0l0wqcQ>
    <xmx:h3UGaOKndUSoX8-vyscSMxNQvUOFsTXAHWfAHtCOXHfAkMrXkgascA>
    <xmx:h3UGaBZU9qNnDGOytmIDNypnA9r5h9ag_5ZvvdpIm7O75-L-X3h3K8jv>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:46 -0400 (EDT)
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
Subject: [RFC v3 10/12] rust: sync: atomic: Add arithmetic ops for Atomic<*mut T>
Date: Mon, 21 Apr 2025 09:42:19 -0700
Message-ID: <20250421164221.1121805-11-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250421164221.1121805-1-boqun.feng@gmail.com>
References: <20250421164221.1121805-1-boqun.feng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_094249_812356_65D44FA0 
X-CRM114-Status: GOOD (  15.22  )
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
index ffec46e50a06..f2dd72c531fd 100644
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
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
