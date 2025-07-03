Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6A1C83030
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 22:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0hHS4mG37hjeeqKnlEC0RlwMvNXGXqhnar1qTQ81+eE=; b=y81JCYEIe3pA7M
	Q7B5oA87hXWHb3ZqkkHOU7mPpiwM1FUPowJ5tLVhCI33NsReQL9KsrOVl+QLH0ISoSQtztO+iLzwr
	F6+or7FPBc86WQ6ABtjhAPUN502MwEXcblAwk83VO6zaOvtu6g4GbZOJIygAIqbbjLy+WqJHjAePS
	ywKV+f0RPfWsAMu/rwUbz4+GzdxXlrs/iij8rilq/gvRu5sX3lBKU5RS5f20WILLEmL2RiKGswYcw
	i6LypulzHaoGc8RudSu3u8ZgzHtMKpKMsxlWOyc165p4dmpagsnbtDXpjWEpP//Ya3gXFMrOr6+jZ
	z+XKzCVMeAMaYUfmy4Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSaX-0000000CkU0-0Zjm;
	Thu, 03 Jul 2025 22:39:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRh4-0000000Cdkv-2CSH
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 21:42:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06CE1A53A62;
	Thu,  3 Jul 2025 21:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4300EC4CEE3;
	Thu,  3 Jul 2025 21:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751578928;
	bh=JIc216TD6Fdsg8JjBU1n2EPcafEU6cCdPeEtNvKR04c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyAaunPrYungqOwFO5XP03ITzASFwg9OJxBO9iYAYeaIT2EZXDwtB5uzaG99eC9tk
	 gQFglakosCsIV/ZfScD4paPjDopDp866pfW0YfHZskfGeZsI2HfL+8cIiJP0AoNXdv
	 u/XFzEriM0yLPnBgEbPBaalKOgzXAtWLzmtCklge3V9aVy1IzEzGjbc+axXBQLzisw
	 fjiC9v0wSDNe05v+KW5WS5/Xr9d+8vRefI0oEjJ1lDm04+/WOAanADer4wmt3UqQCC
	 3/AF1epUemQk+qACRydnAg9V3M8Xklq4hRKgORi3+g05V6aH1GAh/ztu3vtPOev4tN
	 WHk9AGCrAQ1bQ==
Date: Thu, 3 Jul 2025 23:42:00 +0200
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
Message-ID: <aGb5KNWKwTbLgteI@pollux>
References: <20250702-rust-next-pwm-working-fan-for-sending-v7-0-67ef39ff1d29@samsung.com>
 <CGME20250702134957eucas1p1d84f2ed3014cf98ea3a077c7fae6dea6@eucas1p1.samsung.com>
 <20250702-rust-next-pwm-working-fan-for-sending-v7-3-67ef39ff1d29@samsung.com>
 <aGVMnmoepIVSS0yK@pollux>
 <6d9ce601-b81e-4c2a-b9c3-4cba6fa87b8b@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d9ce601-b81e-4c2a-b9c3-4cba6fa87b8b@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_144210_727441_75995E7D 
X-CRM114-Status: GOOD (  44.90  )
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

On Thu, Jul 03, 2025 at 01:37:43PM +0200, Michal Wilczynski wrote:
> 
> 
> On 7/2/25 17:13, Danilo Krummrich wrote:
> > On Wed, Jul 02, 2025 at 03:45:31PM +0200, Michal Wilczynski wrote:
> >> Building on the basic data types, this commit introduces the central
> >> object abstractions for the PWM subsystem: Device and Chip. It also
> >> includes the core trait implementations that make the Chip wrapper a
> >> complete, safe, and managed object.
> >>
> >> The main components of this change are:
> >>  - Device and Chip Structs: These structs wrap the underlying struct
> >>    pwm_device and struct pwm_chip C objects, providing safe, idiomatic
> >>    methods to access their fields.
> >>
> >>  - High-Level `Device` API: Exposes safe wrappers for the modern
> >>    `waveform` API, allowing consumers to apply, read, and pre-validate
> >>    hardware configurations.
> >>
> >>  - Core Trait Implementations for Chip:
> >>     - AlwaysRefCounted: Links the Chip's lifetime to its embedded
> >>       struct device reference counter. This enables automatic lifetime
> >>       management via ARef.
> >>     - Send and Sync: Marks the Chip wrapper as safe for use across
> >>       threads. This is sound because the C core handles all necessary
> >>       locking for the underlying object's state.
> >>
> >> These wrappers and traits form a robust foundation for building PWM
> >> drivers in Rust.
> >>
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > 
> > Few more comments below, with those fixed:
> > 
> > 	Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> > 
> >> +/// Wrapper for a PWM device [`struct pwm_device`](srctree/include/linux/pwm.h).
> >> +#[repr(transparent)]
> >> +pub struct Device(Opaque<bindings::pwm_device>);
> >> +
> >> +impl Device {
> > 
> > <snip>
> > 
> >> +    /// Gets a reference to the parent `Chip` that this device belongs to.
> >> +    pub fn chip(&self) -> &Chip {
> >> +        // SAFETY: `self.as_raw()` provides a valid pointer. (*self.as_raw()).chip
> >> +        // is assumed to be a valid pointer to `pwm_chip` managed by the kernel.
> >> +        // Chip::as_ref's safety conditions must be met.
> >> +        unsafe { Chip::as_ref((*self.as_raw()).chip) }
> > 
> > I assume the C API does guarantee that a struct pwm_device *always* holds a
> > valid pointer to a struct pwm_chip?
> > 
> >> +
> >> +/// Wrapper for a PWM chip/controller ([`struct pwm_chip`](srctree/include/linux/pwm.h)).
> >> +#[repr(transparent)]
> >> +pub struct Chip(Opaque<bindings::pwm_chip>);
> >> +
> >> +impl Chip {
> >> +    /// Creates a reference to a [`Chip`] from a valid pointer.
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// The caller must ensure that `ptr` is valid and remains valid for the lifetime of the
> >> +    /// returned [`Chip`] reference.
> >> +    pub(crate) unsafe fn as_ref<'a>(ptr: *mut bindings::pwm_chip) -> &'a Self {
> >> +        // SAFETY: The safety requirements guarantee the validity of the dereference, while the
> >> +        // `Chip` type being transparent makes the cast ok.
> >> +        unsafe { &*ptr.cast::<Self>() }
> >> +    }
> >> +
> >> +    /// Returns a raw pointer to the underlying `pwm_chip`.
> >> +    pub(crate) fn as_raw(&self) -> *mut bindings::pwm_chip {
> >> +        self.0.get()
> >> +    }
> >> +
> >> +    /// Gets the number of PWM channels (hardware PWMs) on this chip.
> >> +    pub fn npwm(&self) -> u32 {
> >> +        // SAFETY: `self.as_raw()` provides a valid pointer for `self`'s lifetime.
> >> +        unsafe { (*self.as_raw()).npwm }
> >> +    }
> >> +
> >> +    /// Returns `true` if the chip supports atomic operations for configuration.
> >> +    pub fn is_atomic(&self) -> bool {
> >> +        // SAFETY: `self.as_raw()` provides a valid pointer for `self`'s lifetime.
> >> +        unsafe { (*self.as_raw()).atomic }
> >> +    }
> >> +
> >> +    /// Returns a reference to the embedded `struct device` abstraction.
> >> +    pub fn device(&self) -> &device::Device {
> >> +        // SAFETY: `self.as_raw()` provides a valid pointer to `bindings::pwm_chip`.
> >> +        // The `dev` field is an instance of `bindings::device` embedded within `pwm_chip`.
> >> +        // Taking a pointer to this embedded field is valid.
> >> +        // `device::Device` is `#[repr(transparent)]`.
> >> +        // The lifetime of the returned reference is tied to `self`.
> >> +        let dev_field_ptr = unsafe { core::ptr::addr_of!((*self.as_raw()).dev) };
> > 
> > I think you can use `&raw` instead.
> > 
> >> +        // SAFETY: `dev_field_ptr` is a valid pointer to `bindings::device`.
> >> +        // Casting and dereferencing is safe due to `repr(transparent)` and lifetime.
> >> +        unsafe { &*(dev_field_ptr.cast::<device::Device>()) }
> > 
> > Please use Device::as_ref() instead.
> > 
> >> +    }
> >> +
> >> +    /// Gets the *typed* driver-specific data associated with this chip's embedded device.
> >> +    pub fn drvdata<T: 'static>(&self) -> &T {
> > 
> > You need to make the whole Chip structure generic over T, i.e.
> > Chip<T: ForeignOwnable>.
> > 
> > Otherwise the API is unsafe, since the caller can pass in any T when calling
> > `chip.drvdata()` regardless of whether you actually stored as private data
> > through Chip::new().
> 
> You were right that the original drvdata<T>() method was unsafe. The
> most direct fix, making Chip generic to Chip<T>, unfortunately creates a
> significant cascade effect:
> 
> - If Chip becomes Chip<T>, then anything holding it, like ARef, must
>   become ARef<Chip<T>>.
> 
> - This in turn forces container structs like Registration to become
>   generic (Registration<T>).
> 
> - Finally, the PwmOps trait itself needs to be aware of T, which
>   complicates the trait and all driver implementations.
> 
> This chain reaction adds a lot of complexity. To avoid it, I've
> figured an alternative:
> 
> The new idea keeps Chip simple and non generic but ensures type safety
> through two main improvements to the abstraction layer:
> 
> 1. A Thread Safe DriverData Wrapper
> 
> The pwm.rs module now provides a generic pwm::DriverData<T> struct. Its
> only job is to wrap the driver's private data and provide the necessary
> unsafe impl Send + Sync.
> 
> // In `rust/kernel/pwm.rs`
> // SAFETY: The contained data is guaranteed by the kernel to have
> // synchronized access during callbacks.
> pub struct DriverData<T>(T);
> unsafe impl<T: Send> Send for DriverData<T> {}
> unsafe impl<T: Sync> Sync for DriverData<T> {}

I think you don't need to implement them explicitly, it's automatically derived
from T.

> 
> // In the driver's `probe` function
> let safe_data = pwm::DriverData::new(Th1520PwmDriverData{ });
> 
> 2. A More Ergonomic PwmOps Trait
> 
> The PwmOps trait methods now receive the driver's data directly as
> &self, which is much more intuitive. We achieve this by providing a
> default associated type for the data owner, which removes boilerplate
> from the driver.
> 
> // In `rust/kernel/pwm.rs`
> pub trait PwmOps: 'static + Sized {
>     type Owner: Deref<Target = DriverData<Self>> + ForeignOwnable =
>         Pin<KBox<DriverData<Self>>>;
>     /// For now I'm getting compiler error here: `associated type defaults are unstable`
>     /// So the driver would need to specify this for now, until this feature
>     /// is stable
> 
> 
>     // Methods now receive `&self`, making them much cleaner to implement.
>     fn round_waveform_tohw(&self, chip: &Chip, pwm: &Device, wf: &Waveform) -> Result<...>;
> }
> 
> // In the driver
> impl pwm::PwmOps for Th1520PwmDriverData {
>     type WfHw = Th1520WfHw;

Shouldn't this be:

	type Owner = Pin<KBox<DriverData<Self>>>;

> 
>     fn round_waveform_tohw(&self, chip: &pwm::Chip, ...) -> Result<...> {

If you accept any ForeignOwnable, I think this has to be Owner::Borrowed.

>         // no drvdata() call here :-)
>         let rate_hz = self.clk.rate().as_hz();
>         // ...
>     }
> }
> 
> This solution seem to address to issue you've pointed (as the user of
> the API never deals with drvdata directly at this point), while making
> it easier to develop PWM drivers in Rust.
> 
> Please let me know what you think.

In DRM [1][2] we used the approach I proposed, but at a first glance what you
propose seems like it should work as well.

Drivers having to set the Owner type seems a bit unfortunate, but otherwise it
seems like a matter of personal preference.

Although, I just notice, isn't this broken if a driver sets Owner to something
else than Self?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/drm/device.rs
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/drm/driver.rs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
