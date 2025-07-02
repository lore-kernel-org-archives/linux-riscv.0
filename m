Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B764DC83F05
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 16:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kzUgJSqkwV2FfseVe+uN/WUHRuPASFSoN4PNJK0MsJY=; b=0ik8YcYYE+Icdl
	o/BkToEfz622ipgu5INh/G4OmbLhrjhkxkg6k8+d/Ww+JOOxKYzPe/2oEz5Pg352RbmKVVZSLOlTS
	CN9Yv4OTM/X6z8PT/3EWl0SF++ttP5HHGp00wvN5ZLGUqegAIgGOXeZqeDNPjTQeYYnzXfx8HuZYV
	GxHeJsQPszWpIw88eeImqL9vt4WHakQn9V/EsxB3si40uW9yV2z4ArklMPbmurJ0n5Fb/Z0WKQMNU
	mP9rLsqoLXvTyEAfgdiPB4SGSwiIAQe8wLp1Ux1viznmG6msKgWmZY/MWYResVb8y++ccCVInfk9q
	E2VL3753At9+k1R88YyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzwQ-00000008t9f-077O;
	Wed, 02 Jul 2025 16:04:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWz9b-00000008kNU-2EAe
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 15:13:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D98CD5C4795;
	Wed,  2 Jul 2025 15:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A56C4CEE7;
	Wed,  2 Jul 2025 15:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751469222;
	bh=9KOpZ+d/XCXNDsoS55VxNUdTj9TN9I7t+x/Rpsw/H7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T3YKk9tcc21lKT0e8rJsMgs392Ojl6R9DEscpVgysb7rhzQEb/5aQmDusOXxbcfKN
	 HdFhz4rka4g4jIgo8bej4SSBWSJ1LcCipsCMZ2lOrA6G1tXp2arxNhF8axS6Jm85sn
	 Bi3cG2p92nnYcCrLxZwQZzZh4uasZkmOkoJrQ+gI5k75y2n+XpWsINKGqd4LAIJrzH
	 PymYC+//cYLekNyniNlYPjTQUL7FzMjAnQyC9AoNNX9E91LMFh3tCWYIkAj8pEMxX9
	 3ZI1qDtXCuFm7ac56rBTj7QbLPaQgudPU9IFUQVO0QBjnayWM5dceCsqui6wW4SAl1
	 WwXV/5Tu5oV3g==
Date: Wed, 2 Jul 2025 17:13:34 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Benno Lossin <lossin@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 3/8] rust: pwm: Add core 'Device' and 'Chip' object
 wrappers
Message-ID: <aGVMnmoepIVSS0yK@pollux>
References: <20250702-rust-next-pwm-working-fan-for-sending-v7-0-67ef39ff1d29@samsung.com>
 <CGME20250702134957eucas1p1d84f2ed3014cf98ea3a077c7fae6dea6@eucas1p1.samsung.com>
 <20250702-rust-next-pwm-working-fan-for-sending-v7-3-67ef39ff1d29@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702-rust-next-pwm-working-fan-for-sending-v7-3-67ef39ff1d29@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_081343_652231_42A6D2B7 
X-CRM114-Status: GOOD (  27.10  )
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

On Wed, Jul 02, 2025 at 03:45:31PM +0200, Michal Wilczynski wrote:
> Building on the basic data types, this commit introduces the central
> object abstractions for the PWM subsystem: Device and Chip. It also
> includes the core trait implementations that make the Chip wrapper a
> complete, safe, and managed object.
> 
> The main components of this change are:
>  - Device and Chip Structs: These structs wrap the underlying struct
>    pwm_device and struct pwm_chip C objects, providing safe, idiomatic
>    methods to access their fields.
> 
>  - High-Level `Device` API: Exposes safe wrappers for the modern
>    `waveform` API, allowing consumers to apply, read, and pre-validate
>    hardware configurations.
> 
>  - Core Trait Implementations for Chip:
>     - AlwaysRefCounted: Links the Chip's lifetime to its embedded
>       struct device reference counter. This enables automatic lifetime
>       management via ARef.
>     - Send and Sync: Marks the Chip wrapper as safe for use across
>       threads. This is sound because the C core handles all necessary
>       locking for the underlying object's state.
> 
> These wrappers and traits form a robust foundation for building PWM
> drivers in Rust.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Few more comments below, with those fixed:

	Reviewed-by: Danilo Krummrich <dakr@kernel.org>

> +/// Wrapper for a PWM device [`struct pwm_device`](srctree/include/linux/pwm.h).
> +#[repr(transparent)]
> +pub struct Device(Opaque<bindings::pwm_device>);
> +
> +impl Device {

<snip>

> +    /// Gets a reference to the parent `Chip` that this device belongs to.
> +    pub fn chip(&self) -> &Chip {
> +        // SAFETY: `self.as_raw()` provides a valid pointer. (*self.as_raw()).chip
> +        // is assumed to be a valid pointer to `pwm_chip` managed by the kernel.
> +        // Chip::as_ref's safety conditions must be met.
> +        unsafe { Chip::as_ref((*self.as_raw()).chip) }

I assume the C API does guarantee that a struct pwm_device *always* holds a
valid pointer to a struct pwm_chip?

> +
> +/// Wrapper for a PWM chip/controller ([`struct pwm_chip`](srctree/include/linux/pwm.h)).
> +#[repr(transparent)]
> +pub struct Chip(Opaque<bindings::pwm_chip>);
> +
> +impl Chip {
> +    /// Creates a reference to a [`Chip`] from a valid pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that `ptr` is valid and remains valid for the lifetime of the
> +    /// returned [`Chip`] reference.
> +    pub(crate) unsafe fn as_ref<'a>(ptr: *mut bindings::pwm_chip) -> &'a Self {
> +        // SAFETY: The safety requirements guarantee the validity of the dereference, while the
> +        // `Chip` type being transparent makes the cast ok.
> +        unsafe { &*ptr.cast::<Self>() }
> +    }
> +
> +    /// Returns a raw pointer to the underlying `pwm_chip`.
> +    pub(crate) fn as_raw(&self) -> *mut bindings::pwm_chip {
> +        self.0.get()
> +    }
> +
> +    /// Gets the number of PWM channels (hardware PWMs) on this chip.
> +    pub fn npwm(&self) -> u32 {
> +        // SAFETY: `self.as_raw()` provides a valid pointer for `self`'s lifetime.
> +        unsafe { (*self.as_raw()).npwm }
> +    }
> +
> +    /// Returns `true` if the chip supports atomic operations for configuration.
> +    pub fn is_atomic(&self) -> bool {
> +        // SAFETY: `self.as_raw()` provides a valid pointer for `self`'s lifetime.
> +        unsafe { (*self.as_raw()).atomic }
> +    }
> +
> +    /// Returns a reference to the embedded `struct device` abstraction.
> +    pub fn device(&self) -> &device::Device {
> +        // SAFETY: `self.as_raw()` provides a valid pointer to `bindings::pwm_chip`.
> +        // The `dev` field is an instance of `bindings::device` embedded within `pwm_chip`.
> +        // Taking a pointer to this embedded field is valid.
> +        // `device::Device` is `#[repr(transparent)]`.
> +        // The lifetime of the returned reference is tied to `self`.
> +        let dev_field_ptr = unsafe { core::ptr::addr_of!((*self.as_raw()).dev) };

I think you can use `&raw` instead.

> +        // SAFETY: `dev_field_ptr` is a valid pointer to `bindings::device`.
> +        // Casting and dereferencing is safe due to `repr(transparent)` and lifetime.
> +        unsafe { &*(dev_field_ptr.cast::<device::Device>()) }

Please use Device::as_ref() instead.

> +    }
> +
> +    /// Gets the *typed* driver-specific data associated with this chip's embedded device.
> +    pub fn drvdata<T: 'static>(&self) -> &T {

You need to make the whole Chip structure generic over T, i.e.
Chip<T: ForeignOwnable>.

Otherwise the API is unsafe, since the caller can pass in any T when calling
`chip.drvdata()` regardless of whether you actually stored as private data
through Chip::new().

Also, given that `T: ForeignOwnable`, you should return `T::Borrowed`.

> +        // SAFETY: `self.as_raw()` gives a valid pwm_chip pointer.
> +        // `bindings::pwmchip_get_drvdata` is the C function to retrieve driver data.
> +        let ptr = unsafe { bindings::pwmchip_get_drvdata(self.as_raw()) };
> +
> +        // SAFETY: The only way to create a chip is through Chip::new, which initializes
> +        // this pointer.
> +        unsafe { &*ptr.cast::<T>() }
> +    }
> +
> +    /// Allocates and wraps a PWM chip using `bindings::pwmchip_alloc`.
> +    ///
> +    /// Returns an [`ARef<Chip>`] managing the chip's lifetime via refcounting
> +    /// on its embedded `struct device`.
> +    pub fn new<T: 'static + ForeignOwnable>(
> +        parent_dev: &device::Device,
> +        npwm: u32,
> +        sizeof_priv: usize,
> +        drvdata: T,

As mentioned above, the whole Chip structure needs to be generic over T,
otherwise you can't guarantee that this T is the same T as the one in drvdata().

> +// SAFETY: Implements refcounting for `Chip` using the embedded `struct device`.
> +unsafe impl AlwaysRefCounted for Chip {
> +    #[inline]
> +    fn inc_ref(&self) {
> +        // SAFETY: `self.0.get()` points to a valid `pwm_chip` because `self` exists.
> +        // The embedded `dev` is valid. `get_device` increments its refcount.
> +        unsafe {
> +            bindings::get_device(core::ptr::addr_of_mut!((*self.0.get()).dev));

I think you can use `&raw mut` instead.

Also, if you move the semicolon at the end of the unsafe block, this goes in one
line.

> +        }
> +    }
> +
> +    #[inline]
> +    unsafe fn dec_ref(obj: NonNull<Chip>) {
> +        let c_chip_ptr = obj.cast::<bindings::pwm_chip>().as_ptr();
> +
> +        // SAFETY: `obj` is a valid pointer to a `Chip` (and thus `bindings::pwm_chip`)
> +        // with a non-zero refcount. `put_device` handles decrement and final release.
> +        unsafe {
> +            bindings::put_device(core::ptr::addr_of_mut!((*c_chip_ptr).dev));
> +        }

Same here.

> +    }
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
