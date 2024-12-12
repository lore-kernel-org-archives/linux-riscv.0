Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F68E7717F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 17:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Mrfo3sASzHprRkHF6y2Afi4uSocII16TUn8PqXIqnE=; b=fKxWv+o+Ihomsr
	KKyVN6r/RJJPpqpOe3qr7EvehK+fLVyweCLillT8bGs80bUZkzlI1aYPCT6VOnR1ChL2d7R7mNQiy
	KvOscyvwDhRVP+X5tuEqIfx2j/Nr1+/xzLx8T2RTM4B4NF0b2CgcjVEc7UVOlTNmxUkncnGvbiIwv
	SYh/RvthMsdxOmIQDGumz6hepIlxAXSvaKgVmp2dcD++ld4UY0BF8la3KJGmzM4OyejCyFHsM0qUR
	6i4K+bxUPu2DUPRjGy4m3IDqOWNCkj/4Gjui2aU/y6VLH09rDP1puETXauoHFy6GPSKdSUbpfOB35
	MhZSGRZ99pBhG7h4mCbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnFW-00000001Fo2-2KCD;
	Thu, 12 Dec 2024 17:45:18 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLn5A-00000001CY6-2iLj;
	Thu, 12 Dec 2024 17:34:37 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6d8f75b31bfso7766006d6.3;
        Thu, 12 Dec 2024 09:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734024875; x=1734629675; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3/1jIZKtHxkm/cGWT/Dd1ikZO2f9RQMcjfDBKaiBpA=;
        b=R2Xy5cy5tmaRhfHSD7FYdGi0lQfsqIvqTYwTvaa/kUQtNvk8yJKJEhR2RIc1WAjrVN
         o6armFVlStoz2jIXYaz9jSFzk6i4WUgL5yb0+iE2hKGLLu2yl3In//z3RSvvdUxCA7W0
         r9F60AS+W0u+Dqo7pzCAtaq8xdFwVRe4qw0mvryhwu7YiKCpxHNvUBEerEZOecVsgRU5
         vGBar/bPnoOwSA+h8w3AsYORcK/ZI94F8ut0PJtjvdKn4EVYoxE2sCJ+ajylFloc/vwf
         3x+Qkp/rJpTkDz3NJB132yHfWEcLn4leVWAmYHL7DDDLnviJSptv2PNTkuFiLnyoyUS6
         B+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734024875; x=1734629675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3/1jIZKtHxkm/cGWT/Dd1ikZO2f9RQMcjfDBKaiBpA=;
        b=oE3suAWIRQexAQLbVtINPRate62W8RHcoR7EUDvCzAnWmpsbXUHEuZzvnNNt1xK/m+
         TiJF3FwJgYz8/+gtyxo62llqc9wnNLdxxQ9PXe7HxnlUDFC4UZ5C/lcpoQUpRjObHIGv
         thbPP3Z7KZVvncnjabHpTAW0btCsX9+rPABJSInsUBRAo/e/n5OEPHED94QtPwDrb/vz
         JhZqlgmLV5jSUad03OYFcSbBuXR+qNVTye0lfhz4OKqfWEkfUCw7M3131mE72WVcE6Di
         qLwZbaReMEctrnzps32htq49SLIG+FwNvof7plWdOQL7b4YY5/OKitCX3tdBHwKXxeo0
         vcgA==
X-Forwarded-Encrypted: i=1; AJvYcCUvFanGcFZwhlJkTEowWVCXZVddJth+tGEtLXPgT2Vca3N7OANNRuBTA4szdKj2IwoBYIuOsYDZnUcsrn8=@lists.infradead.org, AJvYcCWFIG/1YlBOwklLot/c2DBLifLtHxFMrdgv8+zNqLUA2MVn4/KA2DVm/ajM/tr7qH85N6SpSXIkqxPLNUGDHMdt@lists.infradead.org
X-Gm-Message-State: AOJu0Yyak7N07o+y34Qr5WmXVNtlo4k0NBz4SAPAMTFp+zSWMgApcX4v
	ouwGnTgvW7ffkst/aWZEdEMJsaGdCTy5Otrhp4Iy7Ro9/hnTiq8F
X-Gm-Gg: ASbGnctGhoczLgr5AAGKtrSqLkhBc3Z4qpdB3q3aO+KLjRWCWT8xD2iWZYfVDUVlv54
	K3rBaJ0S1gpvplvbrwpwuNEFM17EoD8DZNWV/a2d6xok/CtWv3dWMDpcJfGWiUXYyXez/9BYB/y
	99U8H8AbiN2FTpPwry3CDPiGJJARj2MWb5CITaZSW+yGRO5ZB8L31wGKf+ZW8G/DAq/2nDo9W1e
	F3oKtQh2AJFPd0Jf8wQjVCo73AssFXHs/Ex7h/e1RK0aPeY8GamibA0MFRiusb9Sf2yjAbKYZpX
	hWUqq7lGwN2W070tU+9esKaFKimyDtYHGwJzQfJncqTExK4=
X-Google-Smtp-Source: AGHT+IE5zv947yt3MBj29XLMztCN2YlUN5/liDh+kTLh1tUmGaIc6VdyCAsfmo1jFdhT3+P8K6mJjA==
X-Received: by 2002:a05:6214:dc6:b0:6d8:7d63:f424 with SMTP id 6a1803df08f44-6db0f733e4bmr19338056d6.12.1734024875063;
        Thu, 12 Dec 2024 09:34:35 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d91d51d4aesm37527536d6.109.2024.12.12.09.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 09:34:34 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id B5B041200043;
	Thu, 12 Dec 2024 12:34:33 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 12 Dec 2024 12:34:33 -0500
X-ME-Sender: <xms:qR5bZ8rQmH5HlBgal5KCMcLMPNM0c9WwYK4RcEmShiEELrRriR3phw>
    <xme:qR5bZyp-1CDP1ezNhIcf-AboRcNQgzJx5cG2WIfq5obQuXsfmnvP0zYpXR_bj8K0r
    np7U1vnOMzv8jRdpA>
X-ME-Received: <xmr:qR5bZxPM65XbNd3V2U7qp4c-Z2m0DWIrNKysoweSEoe3P-_YaD6umEH-oDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeehgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepheejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtg
    homhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhk
    mhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtgho
    mh
X-ME-Proxy: <xmx:qR5bZz5iJo99zVXbDfLq2gYMYHTvcM8e8yhX8tc8eRwv3O2rW3kokg>
    <xmx:qR5bZ75MBwGz4vohHoZy3M12yZFmK16Pb8Xt6BscOcS0H-ak76ZGfQ>
    <xmx:qR5bZzj9HAMVrXr0OAXKoT5DED2Dc2x55wEIujEusXR1-szfEBrj9Q>
    <xmx:qR5bZ16yFdGY3ywA4r7dDDktArno_s_6uirKPEx6ge9bi6fBgCYMFA>
    <xmx:qR5bZ-Iy1n_kOmvC6i4tnGfUKx_lwM1swk8YTX9W3bJloHZ3THH1asMk>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Dec 2024 12:34:31 -0500 (EST)
Date: Thu, 12 Dec 2024 09:34:26 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, lkmm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,	Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
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
Subject: Re: [RFC v2 04/13] rust: sync: atomic: Add generic atomics
Message-ID: <Z1seogLmy5H8-hXn@boqun-archlinux>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
 <20241101060237.1185533-5-boqun.feng@gmail.com>
 <CAH5fLgjhQouU=kqVx7LET2yeWt6sKt-VO5PR5SnQ8doaG4ihuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH5fLgjhQouU=kqVx7LET2yeWt6sKt-VO5PR5SnQ8doaG4ihuQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_093436_706332_4D704BFC 
X-CRM114-Status: GOOD (  36.69  )
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

On Thu, Dec 12, 2024 at 11:57:07AM +0100, Alice Ryhl wrote:
[...]
> > diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
> > new file mode 100644
> > index 000000000000..204da38e2691
> > --- /dev/null
> > +++ b/rust/kernel/sync/atomic/generic.rs
> > @@ -0,0 +1,253 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Generic atomic primitives.
> > +
> > +use super::ops::*;
> > +use super::ordering::*;
> > +use crate::types::Opaque;
> > +
> > +/// A generic atomic variable.
> > +///
> > +/// `T` must impl [`AllowAtomic`], that is, an [`AtomicImpl`] has to be chosen.
> > +///
> > +/// # Invariants
> > +///
> > +/// Doing an atomic operation while holding a reference of [`Self`] won't cause a data race, this
> > +/// is guaranteed by the safety requirement of [`Self::from_ptr`] and the extra safety requirement
> > +/// of the usage on pointers returned by [`Self::as_ptr`].
> > +#[repr(transparent)]
> > +pub struct Atomic<T: AllowAtomic>(Opaque<T>);
> > +
> > +// SAFETY: `Atomic<T>` is safe to share among execution contexts because all accesses are atomic.
> > +unsafe impl<T: AllowAtomic> Sync for Atomic<T> {}
> 
> Surely it should also be Send?
> 

It's `Send` here because `Opaque<T>` is `Send` when `T` is `Send`. And
in patch #9, I changed the definition of `AllowAtomic`, which is not a
subtrait of `Send` anymore, and an `impl Send` block was added there.

> > +/// Atomics that support basic atomic operations.
> > +///
> > +/// TODO: Unless the `impl` is a `#[repr(transparet)]` new type of an existing [`AllowAtomic`], the
> > +/// impl block should be only done in atomic mod. And currently only basic integer types can
> > +/// implement this trait in atomic mod.
> 
> What's up with this TODO? Can't you just write an appropriate safety
> requirement?
> 

Because the limited scope of types that allows atomic is an artificial
choice, i.e. we want to start with a limited number of types and make
forward progress, and the types that we don't want to support atomics
for now are not because of safety reasons, but more of a lack of
users/motivations. So I don't think this is something we should use
safety requirement to describe.

> > +/// # Safety
> > +///
> > +/// [`Self`] must have the same size and alignment as [`Self::Repr`].
> > +pub unsafe trait AllowAtomic: Sized + Send + Copy {
> > +    /// The backing atomic implementation type.
> > +    type Repr: AtomicImpl;
> > +
> > +    /// Converts into a [`Self::Repr`].
> > +    fn into_repr(self) -> Self::Repr;
> > +
> > +    /// Converts from a [`Self::Repr`].
> > +    fn from_repr(repr: Self::Repr) -> Self;
> 
> What do you need these methods for?
> 

Converting a `AtomicImpl` value (currently only `i32` and `i64`) to a
`AllowAtomic` value without using transmute in `impl` block of
`Atomic<T>`. Any better idea?

Regards,
Boqun

> > +}
> > +
> > +// SAFETY: `T::Repr` is `Self` (i.e. `T`), so they have the same size and alignment.
> > +unsafe impl<T: AtomicImpl> AllowAtomic for T {
> > +    type Repr = Self;
> > +
> > +    fn into_repr(self) -> Self::Repr {
> > +        self
> > +    }
> > +
> > +    fn from_repr(repr: Self::Repr) -> Self {
> > +        repr
> > +    }
> > +}
> > +
> > +impl<T: AllowAtomic> Atomic<T> {
> > +    /// Creates a new atomic.
> > +    pub const fn new(v: T) -> Self {
> > +        Self(Opaque::new(v))
> > +    }
> > +
> > +    /// Creates a reference to [`Self`] from a pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// - `ptr` has to be a valid pointer.
> > +    /// - `ptr` has to be valid for both reads and writes for the whole lifetime `'a`.
> > +    /// - For the whole lifetime of '`a`, other accesses to the object cannot cause data races
> > +    ///   (defined by [`LKMM`]) against atomic operations on the returned reference.
> > +    ///
> > +    /// [`LKMM`]: srctree/tools/memory-model
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// Using [`Atomic::from_ptr()`] combined with [`Atomic::load()`] or [`Atomic::store()`] can
> > +    /// achieve the same functionality as `READ_ONCE()`/`smp_load_acquire()` or
> > +    /// `WRITE_ONCE()`/`smp_store_release()` in C side:
> > +    ///
> > +    /// ```rust
> > +    /// # use kernel::types::Opaque;
> > +    /// use kernel::sync::atomic::{Atomic, Relaxed, Release};
> > +    ///
> > +    /// // Assume there is a C struct `Foo`.
> > +    /// mod cbindings {
> > +    ///     #[repr(C)]
> > +    ///     pub(crate) struct foo { pub(crate) a: i32, pub(crate) b: i32 }
> > +    /// }
> > +    ///
> > +    /// let tmp = Opaque::new(cbindings::foo { a: 1, b: 2});
> > +    ///
> > +    /// // struct foo *foo_ptr = ..;
> > +    /// let foo_ptr = tmp.get();
> > +    ///
> > +    /// // SAFETY: `foo_ptr` is a valid pointer, and `.a` is inbound.
> > +    /// let foo_a_ptr = unsafe { core::ptr::addr_of_mut!((*foo_ptr).a) };
> > +    ///
> > +    /// // a = READ_ONCE(foo_ptr->a);
> > +    /// //
> > +    /// // SAFETY: `foo_a_ptr` is a valid pointer for read, and all accesses on it is atomic, so no
> > +    /// // data race.
> > +    /// let a = unsafe { Atomic::from_ptr(foo_a_ptr) }.load(Relaxed);
> > +    /// # assert_eq!(a, 1);
> > +    ///
> > +    /// // smp_store_release(&foo_ptr->a, 2);
> > +    /// //
> > +    /// // SAFETY: `foo_a_ptr` is a valid pointer for write, and all accesses on it is atomic, so no
> > +    /// // data race.
> > +    /// unsafe { Atomic::from_ptr(foo_a_ptr) }.store(2, Release);
> > +    /// ```
> > +    ///
> > +    /// However, this should be only used when communicating with C side or manipulating a C struct.
> > +    pub unsafe fn from_ptr<'a>(ptr: *mut T) -> &'a Self
> > +    where
> > +        T: Sync,
> > +    {
> > +        // CAST: `T` is transparent to `Atomic<T>`.
> > +        // SAFETY: Per function safety requirement, `ptr` is a valid pointer and the object will
> > +        // live long enough. It's safe to return a `&Atomic<T>` because function safety requirement
> > +        // guarantees other accesses won't cause data races.
> > +        unsafe { &*ptr.cast::<Self>() }
> > +    }
> > +
> > +    /// Returns a pointer to the underlying atomic variable.
> > +    ///
> > +    /// Extra safety requirement on using the return pointer: the operations done via the pointer
> > +    /// cannot cause data races defined by [`LKMM`].
> > +    ///
> > +    /// [`LKMM`]: srctree/tools/memory-model
> > +    pub const fn as_ptr(&self) -> *mut T {
> > +        self.0.get()
> > +    }
> > +
> > +    /// Returns a mutable reference to the underlying atomic variable.
> > +    ///
> > +    /// This is safe because the mutable reference of the atomic variable guarantees the exclusive
> > +    /// access.
> > +    pub fn get_mut(&mut self) -> &mut T {
> > +        // SAFETY: `self.as_ptr()` is a valid pointer to `T`, and the object has already been
> > +        // initialized. `&mut self` guarantees the exclusive access, so it's safe to reborrow
> > +        // mutably.
> > +        unsafe { &mut *self.as_ptr() }
> > +    }
> > +}
> > +
> > +impl<T: AllowAtomic> Atomic<T>
> > +where
> > +    T::Repr: AtomicHasBasicOps,
> > +{
> > +    /// Loads the value from the atomic variable.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// Simple usages:
> > +    ///
> > +    /// ```rust
> > +    /// use kernel::sync::atomic::{Atomic, Relaxed};
> > +    ///
> > +    /// let x = Atomic::new(42i32);
> > +    ///
> > +    /// assert_eq!(42, x.load(Relaxed));
> > +    ///
> > +    /// let x = Atomic::new(42i64);
> > +    ///
> > +    /// assert_eq!(42, x.load(Relaxed));
> > +    /// ```
> > +    ///
> > +    /// Customized new types in [`Atomic`]:
> > +    ///
> > +    /// ```rust
> > +    /// use kernel::sync::atomic::{generic::AllowAtomic, Atomic, Relaxed};
> > +    ///
> > +    /// #[derive(Clone, Copy)]
> > +    /// #[repr(transparent)]
> > +    /// struct NewType(u32);
> > +    ///
> > +    /// // SAFETY: `NewType` is transparent to `u32`, which has the same size and alignment as
> > +    /// // `i32`.
> > +    /// unsafe impl AllowAtomic for NewType {
> > +    ///     type Repr = i32;
> > +    ///
> > +    ///     fn into_repr(self) -> Self::Repr {
> > +    ///         self.0 as i32
> > +    ///     }
> > +    ///
> > +    ///     fn from_repr(repr: Self::Repr) -> Self {
> > +    ///         NewType(repr as u32)
> > +    ///     }
> > +    /// }
> > +    ///
> > +    /// let n = Atomic::new(NewType(0));
> > +    ///
> > +    /// assert_eq!(0, n.load(Relaxed).0);
> > +    /// ```
> > +    #[inline(always)]
> > +    pub fn load<Ordering: AcquireOrRelaxed>(&self, _: Ordering) -> T {
> > +        let a = self.as_ptr().cast::<T::Repr>();
> > +
> > +        // SAFETY:
> > +        // - For calling the atomic_read*() function:
> > +        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
> > +        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
> > +        //   - per the type invariants, the following atomic operation won't cause data races.
> > +        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
> > +        //   - atomic operations are used here.
> > +        let v = unsafe {
> > +            if Ordering::IS_RELAXED {
> > +                T::Repr::atomic_read(a)
> > +            } else {
> > +                T::Repr::atomic_read_acquire(a)
> > +            }
> > +        };
> > +
> > +        T::from_repr(v)
> > +    }
> > +
> > +    /// Stores a value to the atomic variable.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```rust
> > +    /// use kernel::sync::atomic::{Atomic, Relaxed};
> > +    ///
> > +    /// let x = Atomic::new(42i32);
> > +    ///
> > +    /// assert_eq!(42, x.load(Relaxed));
> > +    ///
> > +    /// x.store(43, Relaxed);
> > +    ///
> > +    /// assert_eq!(43, x.load(Relaxed));
> > +    /// ```
> > +    ///
> > +    #[inline(always)]
> > +    pub fn store<Ordering: ReleaseOrRelaxed>(&self, v: T, _: Ordering) {
> > +        let v = T::into_repr(v);
> > +        let a = self.as_ptr().cast::<T::Repr>();
> > +
> > +        // SAFETY:
> > +        // - For calling the atomic_set*() function:
> > +        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
> > +        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
> > +        //   - per the type invariants, the following atomic operation won't cause data races.
> > +        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
> > +        //   - atomic operations are used here.
> > +        unsafe {
> > +            if Ordering::IS_RELAXED {
> > +                T::Repr::atomic_set(a, v)
> > +            } else {
> > +                T::Repr::atomic_set_release(a, v)
> > +            }
> > +        };
> > +    }
> > +}
> > --
> > 2.45.2
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
