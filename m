Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DC3C83030
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 12:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b7+LMFXhVNS6On+sqgi8Insn5vN+rF3f+J9QArGJUN4=; b=30nUt75Ezc0ouF
	p5TIFQ7tncIdzZRasXjRTT6Rm24vzHkN3YXlPUO8l+PGWpVtNDHJvgufndlFOUvLLjMEJNUamZJTG
	twqfFNwsospV/bw+KQYr/xwa8EU1qHtJOZd7cmno5QKoKed/m4LgbBy0B712o0hlcwq5b538jaoIx
	GZ3ITazqLBlg84h/zmvcCHKQf2uv88qJNK3DM+pdwV7lHXRIJA4ee98YpnUhONqzRuNGMbh/qV3Vl
	NCBWpOAV4wa1IGWDpUkmli3No5lDTJyQkt1COO/Z2b8WRZC5oIvKymvQQC3YjFbKypVO0PChreOgF
	kZZLep4/hTrQlSG1RTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJFh-0000000BMaW-38Sm;
	Thu, 03 Jul 2025 12:41:21 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIGE-0000000BBO6-0c3d
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 11:37:52 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250703113745euoutp0108950ef1e604e41436c9da67636213b0~OusYp4LTK0696806968euoutp01O
	for <linux-riscv@lists.infradead.org>; Thu,  3 Jul 2025 11:37:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250703113745euoutp0108950ef1e604e41436c9da67636213b0~OusYp4LTK0696806968euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751542665;
	bh=IaUSrP5vF7c7LGO5H4Eij7O+D07WlO1LwH0IQDoV9Z8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=fTHWtAb9YYu5inKO0J3HoW674ZkV25N5g2HW/kyUJ50zhaNeytdMrVsog2TjpZqdG
	 Jj0WC7gFvDyT+IEt+0PceeUd8tVS+W8U4ugRgC6jAbNCcnsF/1vOlJdsKktQ6zK0Bx
	 CrQg+OofpOOAJosMNakVfLKwYgn6YHGLQqR8QFR8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250703113744eucas1p157ec555de6855afe8b1d1280030fc06d~OusX8uDZc2942729427eucas1p1O;
	Thu,  3 Jul 2025 11:37:44 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250703113743eusmtip18065c1273aae5e6af7f4987e4c46d79b~OusW4AM3g1070910709eusmtip1C;
	Thu,  3 Jul 2025 11:37:43 +0000 (GMT)
Message-ID: <6d9ce601-b81e-4c2a-b9c3-4cba6fa87b8b@samsung.com>
Date: Thu, 3 Jul 2025 13:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/8] rust: pwm: Add core 'Device' and 'Chip' object
 wrappers
To: Danilo Krummrich <dakr@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>, Michael
	Turquette <mturquette@baylibre.com>, Drew Fustini <fustini@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <aGVMnmoepIVSS0yK@pollux>
X-CMS-MailID: 20250703113744eucas1p157ec555de6855afe8b1d1280030fc06d
X-Msg-Generator: CA
X-RootMTR: 20250702134957eucas1p1d84f2ed3014cf98ea3a077c7fae6dea6
X-EPHeader: CA
X-CMS-RootMailID: 20250702134957eucas1p1d84f2ed3014cf98ea3a077c7fae6dea6
References: <20250702-rust-next-pwm-working-fan-for-sending-v7-0-67ef39ff1d29@samsung.com>
	<CGME20250702134957eucas1p1d84f2ed3014cf98ea3a077c7fae6dea6@eucas1p1.samsung.com>
	<20250702-rust-next-pwm-working-fan-for-sending-v7-3-67ef39ff1d29@samsung.com>
	<aGVMnmoepIVSS0yK@pollux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_043750_766216_E9812A91 
X-CRM114-Status: GOOD (  29.55  )
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



On 7/2/25 17:13, Danilo Krummrich wrote:
> On Wed, Jul 02, 2025 at 03:45:31PM +0200, Michal Wilczynski wrote:
>> Building on the basic data types, this commit introduces the central
>> object abstractions for the PWM subsystem: Device and Chip. It also
>> includes the core trait implementations that make the Chip wrapper a
>> complete, safe, and managed object.
>>
>> The main components of this change are:
>>  - Device and Chip Structs: These structs wrap the underlying struct
>>    pwm_device and struct pwm_chip C objects, providing safe, idiomatic
>>    methods to access their fields.
>>
>>  - High-Level `Device` API: Exposes safe wrappers for the modern
>>    `waveform` API, allowing consumers to apply, read, and pre-validate
>>    hardware configurations.
>>
>>  - Core Trait Implementations for Chip:
>>     - AlwaysRefCounted: Links the Chip's lifetime to its embedded
>>       struct device reference counter. This enables automatic lifetime
>>       management via ARef.
>>     - Send and Sync: Marks the Chip wrapper as safe for use across
>>       threads. This is sound because the C core handles all necessary
>>       locking for the underlying object's state.
>>
>> These wrappers and traits form a robust foundation for building PWM
>> drivers in Rust.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> 
> Few more comments below, with those fixed:
> 
> 	Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> 
>> +/// Wrapper for a PWM device [`struct pwm_device`](srctree/include/linux/pwm.h).
>> +#[repr(transparent)]
>> +pub struct Device(Opaque<bindings::pwm_device>);
>> +
>> +impl Device {
> 
> <snip>
> 
>> +    /// Gets a reference to the parent `Chip` that this device belongs to.
>> +    pub fn chip(&self) -> &Chip {
>> +        // SAFETY: `self.as_raw()` provides a valid pointer. (*self.as_raw()).chip
>> +        // is assumed to be a valid pointer to `pwm_chip` managed by the kernel.
>> +        // Chip::as_ref's safety conditions must be met.
>> +        unsafe { Chip::as_ref((*self.as_raw()).chip) }
> 
> I assume the C API does guarantee that a struct pwm_device *always* holds a
> valid pointer to a struct pwm_chip?
> 
>> +
>> +/// Wrapper for a PWM chip/controller ([`struct pwm_chip`](srctree/include/linux/pwm.h)).
>> +#[repr(transparent)]
>> +pub struct Chip(Opaque<bindings::pwm_chip>);
>> +
>> +impl Chip {
>> +    /// Creates a reference to a [`Chip`] from a valid pointer.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// The caller must ensure that `ptr` is valid and remains valid for the lifetime of the
>> +    /// returned [`Chip`] reference.
>> +    pub(crate) unsafe fn as_ref<'a>(ptr: *mut bindings::pwm_chip) -> &'a Self {
>> +        // SAFETY: The safety requirements guarantee the validity of the dereference, while the
>> +        // `Chip` type being transparent makes the cast ok.
>> +        unsafe { &*ptr.cast::<Self>() }
>> +    }
>> +
>> +    /// Returns a raw pointer to the underlying `pwm_chip`.
>> +    pub(crate) fn as_raw(&self) -> *mut bindings::pwm_chip {
>> +        self.0.get()
>> +    }
>> +
>> +    /// Gets the number of PWM channels (hardware PWMs) on this chip.
>> +    pub fn npwm(&self) -> u32 {
>> +        // SAFETY: `self.as_raw()` provides a valid pointer for `self`'s lifetime.
>> +        unsafe { (*self.as_raw()).npwm }
>> +    }
>> +
>> +    /// Returns `true` if the chip supports atomic operations for configuration.
>> +    pub fn is_atomic(&self) -> bool {
>> +        // SAFETY: `self.as_raw()` provides a valid pointer for `self`'s lifetime.
>> +        unsafe { (*self.as_raw()).atomic }
>> +    }
>> +
>> +    /// Returns a reference to the embedded `struct device` abstraction.
>> +    pub fn device(&self) -> &device::Device {
>> +        // SAFETY: `self.as_raw()` provides a valid pointer to `bindings::pwm_chip`.
>> +        // The `dev` field is an instance of `bindings::device` embedded within `pwm_chip`.
>> +        // Taking a pointer to this embedded field is valid.
>> +        // `device::Device` is `#[repr(transparent)]`.
>> +        // The lifetime of the returned reference is tied to `self`.
>> +        let dev_field_ptr = unsafe { core::ptr::addr_of!((*self.as_raw()).dev) };
> 
> I think you can use `&raw` instead.
> 
>> +        // SAFETY: `dev_field_ptr` is a valid pointer to `bindings::device`.
>> +        // Casting and dereferencing is safe due to `repr(transparent)` and lifetime.
>> +        unsafe { &*(dev_field_ptr.cast::<device::Device>()) }
> 
> Please use Device::as_ref() instead.
> 
>> +    }
>> +
>> +    /// Gets the *typed* driver-specific data associated with this chip's embedded device.
>> +    pub fn drvdata<T: 'static>(&self) -> &T {
> 
> You need to make the whole Chip structure generic over T, i.e.
> Chip<T: ForeignOwnable>.
> 
> Otherwise the API is unsafe, since the caller can pass in any T when calling
> `chip.drvdata()` regardless of whether you actually stored as private data
> through Chip::new().

You were right that the original drvdata<T>() method was unsafe. The
most direct fix, making Chip generic to Chip<T>, unfortunately creates a
significant cascade effect:

- If Chip becomes Chip<T>, then anything holding it, like ARef, must
  become ARef<Chip<T>>.

- This in turn forces container structs like Registration to become
  generic (Registration<T>).

- Finally, the PwmOps trait itself needs to be aware of T, which
  complicates the trait and all driver implementations.

This chain reaction adds a lot of complexity. To avoid it, I've
figured an alternative:

The new idea keeps Chip simple and non generic but ensures type safety
through two main improvements to the abstraction layer:

1. A Thread Safe DriverData Wrapper

The pwm.rs module now provides a generic pwm::DriverData<T> struct. Its
only job is to wrap the driver's private data and provide the necessary
unsafe impl Send + Sync.

// In `rust/kernel/pwm.rs`
// SAFETY: The contained data is guaranteed by the kernel to have
// synchronized access during callbacks.
pub struct DriverData<T>(T);
unsafe impl<T: Send> Send for DriverData<T> {}
unsafe impl<T: Sync> Sync for DriverData<T> {}

// In the driver's `probe` function
let safe_data = pwm::DriverData::new(Th1520PwmDriverData{ });

2. A More Ergonomic PwmOps Trait

The PwmOps trait methods now receive the driver's data directly as
&self, which is much more intuitive. We achieve this by providing a
default associated type for the data owner, which removes boilerplate
from the driver.

// In `rust/kernel/pwm.rs`
pub trait PwmOps: 'static + Sized {
    type Owner: Deref<Target = DriverData<Self>> + ForeignOwnable =
        Pin<KBox<DriverData<Self>>>;
    /// For now I'm getting compiler error here: `associated type defaults are unstable`
    /// So the driver would need to specify this for now, until this feature
    /// is stable


    // Methods now receive `&self`, making them much cleaner to implement.
    fn round_waveform_tohw(&self, chip: &Chip, pwm: &Device, wf: &Waveform) -> Result<...>;
}

// In the driver
impl pwm::PwmOps for Th1520PwmDriverData {
    type WfHw = Th1520WfHw;

    fn round_waveform_tohw(&self, chip: &pwm::Chip, ...) -> Result<...> {
        // no drvdata() call here :-)
        let rate_hz = self.clk.rate().as_hz();
        // ...
    }
}

This solution seem to address to issue you've pointed (as the user of
the API never deals with drvdata directly at this point), while making
it easier to develop PWM drivers in Rust.

Please let me know what you think.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
