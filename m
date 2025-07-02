Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005C3C83F05
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 14:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=34jFMA3/NHUYD9uk6v+T8hFbweZrABaPAJ0NMMWs4EQ=; b=buaaIfN3fMEVqu
	aTuieqi03RprRL6vKFnmNIq1V3En4dSXvj9FME4MCZ+3zdhGWU7Je75usNRqZL+ykojZTlDHgGL+4
	ArA3zcp6nxJq51BrLOn7Yq/24TbN6wG2ooVBcE0yNV+Ehqd46SPQd9/ULw/ki6bUoBwnB8yhQYoRb
	AeMOsfzSJ8+rZAGDMcLsFgo0jQ5QBSa2+bU7lfVixGmnQdnLbV6qREcrK5gnyXCqMglmD1OgcaI+d
	QONoql+kHrLUH15IweFOwAn7BfuOR2ZWTM3xu9iCeff/EU9fYhk5JfAuQiSgxrx2TCTOY2o6Dey4/
	d4QqaqYCaHv5OgRUtOzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyox-00000008gfS-1b5m;
	Wed, 02 Jul 2025 14:52:23 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxqb-00000008WZB-3rhk
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 13:50:03 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250702134958euoutp02613e4a40b28b5da660d549ee714b39d6~Oc2i4ihVm2730527305euoutp02E
	for <linux-riscv@lists.infradead.org>; Wed,  2 Jul 2025 13:49:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250702134958euoutp02613e4a40b28b5da660d549ee714b39d6~Oc2i4ihVm2730527305euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751464198;
	bh=59LAEN4WWmrWEO5v6q9+SsrEOznztPKx23CPPnLaGNA=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=dYS4a3kzcSnMuwXga522t41aMsjTbtRNz82wWo57jj2gYAKvi0YO+ztAk3SoerebQ
	 s79C6d9zRomrGaR6ytbJxYjys2jfSxDVQwr8WzzV/Te/YKkHQ1X+Ig5gF7kxz+hLK3
	 Y2K/r2a1FUQj4W8RnmKFbQ+R0pTODPxD0BQlGjE0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250702134957eucas1p1d84f2ed3014cf98ea3a077c7fae6dea6~Oc2h5jGo02688726887eucas1p1i;
	Wed,  2 Jul 2025 13:49:57 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250702134956eusmtip27a074ad4c4b4e309c04974615c14cd23~Oc2gyheR21523215232eusmtip2I;
	Wed,  2 Jul 2025 13:49:56 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 02 Jul 2025 15:45:31 +0200
Subject: [PATCH v7 3/8] rust: pwm: Add core 'Device' and 'Chip' object
 wrappers
MIME-Version: 1.0
Message-Id: <20250702-rust-next-pwm-working-fan-for-sending-v7-3-67ef39ff1d29@samsung.com>
In-Reply-To: <20250702-rust-next-pwm-working-fan-for-sending-v7-0-67ef39ff1d29@samsung.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,  Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,  Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Benno Lossin <lossin@kernel.org>,  Michael
	Turquette <mturquette@baylibre.com>,  Drew Fustini <fustini@kernel.org>,
	Benno Lossin <lossin@kernel.org>,  Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250702134957eucas1p1d84f2ed3014cf98ea3a077c7fae6dea6
X-Msg-Generator: CA
X-RootMTR: 20250702134957eucas1p1d84f2ed3014cf98ea3a077c7fae6dea6
X-EPHeader: CA
X-CMS-RootMailID: 20250702134957eucas1p1d84f2ed3014cf98ea3a077c7fae6dea6
References: <20250702-rust-next-pwm-working-fan-for-sending-v7-0-67ef39ff1d29@samsung.com>
	<CGME20250702134957eucas1p1d84f2ed3014cf98ea3a077c7fae6dea6@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_065002_245822_4AC5F963 
X-CRM114-Status: GOOD (  23.85  )
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

Building on the basic data types, this commit introduces the central
object abstractions for the PWM subsystem: Device and Chip. It also
includes the core trait implementations that make the Chip wrapper a
complete, safe, and managed object.

The main components of this change are:
 - Device and Chip Structs: These structs wrap the underlying struct
   pwm_device and struct pwm_chip C objects, providing safe, idiomatic
   methods to access their fields.

 - High-Level `Device` API: Exposes safe wrappers for the modern
   `waveform` API, allowing consumers to apply, read, and pre-validate
   hardware configurations.

 - Core Trait Implementations for Chip:
    - AlwaysRefCounted: Links the Chip's lifetime to its embedded
      struct device reference counter. This enables automatic lifetime
      management via ARef.
    - Send and Sync: Marks the Chip wrapper as safe for use across
      threads. This is sound because the C core handles all necessary
      locking for the underlying object's state.

These wrappers and traits form a robust foundation for building PWM
drivers in Rust.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 rust/kernel/pwm.rs | 271 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 268 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index 3fad101406eac728d9b12083fad7abf7b7f89b25..3b383b66c241ac68213924c3aa7bc933a817bc46 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -7,11 +7,12 @@
 //! C header: [`include/linux/pwm.h`](srctree/include/linux/pwm.h).
 
 use crate::{
-    bindings,
+    bindings, device,
+    error::{self, to_result},
     prelude::*,
-    types::Opaque,
+    types::{ARef, AlwaysRefCounted, ForeignOwnable, Opaque},
 };
-use core::convert::TryFrom;
+use core::{convert::TryFrom, ptr::NonNull};
 
 /// PWM polarity. Mirrors [`enum pwm_polarity`](srctree/include/linux/pwm.h).
 #[derive(Copy, Clone, Debug, PartialEq, Eq)]
@@ -135,3 +136,267 @@ pub fn enabled(&self) -> bool {
         self.0.enabled
     }
 }
+
+/// Describes the outcome of a `round_waveform` operation.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub enum RoundingOutcome {
+    /// The requested waveform was achievable exactly or by rounding values down.
+    ExactOrRoundedDown,
+
+    /// The requested waveform could only be achieved by rounding up.
+    RoundedUp,
+}
+
+/// Wrapper for a PWM device [`struct pwm_device`](srctree/include/linux/pwm.h).
+#[repr(transparent)]
+pub struct Device(Opaque<bindings::pwm_device>);
+
+impl Device {
+    /// Creates a reference to a [`Device`] from a valid C pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid and remains valid for the lifetime of the
+    /// returned [`Device`] reference.
+    pub(crate) unsafe fn as_ref<'a>(ptr: *mut bindings::pwm_device) -> &'a Self {
+        // SAFETY: The safety requirements guarantee the validity of the dereference, while the
+        // `Device` type being transparent makes the cast ok.
+        unsafe { &*ptr.cast::<Self>() }
+    }
+
+    /// Returns a raw pointer to the underlying `pwm_device`.
+    fn as_raw(&self) -> *mut bindings::pwm_device {
+        self.0.get()
+    }
+
+    /// Gets the hardware PWM index for this device within its chip.
+    pub fn hwpwm(&self) -> u32 {
+        // SAFETY: `self.as_raw()` provides a valid pointer for `self`'s lifetime.
+        unsafe { (*self.as_raw()).hwpwm }
+    }
+
+    /// Gets a reference to the parent `Chip` that this device belongs to.
+    pub fn chip(&self) -> &Chip {
+        // SAFETY: `self.as_raw()` provides a valid pointer. (*self.as_raw()).chip
+        // is assumed to be a valid pointer to `pwm_chip` managed by the kernel.
+        // Chip::as_ref's safety conditions must be met.
+        unsafe { Chip::as_ref((*self.as_raw()).chip) }
+    }
+
+    /// Gets the label for this PWM device, if any.
+    pub fn label(&self) -> Option<&CStr> {
+        // SAFETY: self.as_raw() provides a valid pointer.
+        let label_ptr = unsafe { (*self.as_raw()).label };
+        if label_ptr.is_null() {
+            None
+        } else {
+            // SAFETY: label_ptr is non-null and points to a C string
+            // managed by the kernel, valid for the lifetime of the PWM device.
+            Some(unsafe { CStr::from_char_ptr(label_ptr) })
+        }
+    }
+
+    /// Gets a copy of the board-dependent arguments for this PWM device.
+    pub fn args(&self) -> Args {
+        // SAFETY: self.as_raw() gives a valid pointer to `pwm_device`.
+        // The `args` field is a valid `pwm_args` struct embedded within `pwm_device`.
+        // `Args::from_c_ptr`'s safety conditions are met by providing this pointer.
+        unsafe { Args::from_c_ptr(&(*self.as_raw()).args) }
+    }
+
+    /// Gets a copy of the current state of this PWM device.
+    pub fn state(&self) -> State {
+        // SAFETY: `self.as_raw()` gives a valid pointer. `(*self.as_raw()).state`
+        // is a valid `pwm_state` struct. `State::from_c` copies this data.
+        State::from_c(unsafe { (*self.as_raw()).state })
+    }
+
+    /// Sets the PWM waveform configuration and enables the PWM signal.
+    pub fn set_waveform(&self, wf: &Waveform, exact: bool) -> Result {
+        let c_wf = bindings::pwm_waveform::from(*wf);
+
+        // SAFETY: `self.as_raw()` provides a valid `*mut pwm_device` pointer.
+        // `&c_wf` is a valid pointer to a `pwm_waveform` struct. The C function
+        // handles all necessary internal locking.
+        let ret = unsafe { bindings::pwm_set_waveform_might_sleep(self.as_raw(), &c_wf, exact) };
+        to_result(ret)
+    }
+
+    /// Queries the hardware for the configuration it would apply for a given
+    /// request.
+    pub fn round_waveform(&self, wf: &mut Waveform) -> Result<RoundingOutcome> {
+        let mut c_wf = bindings::pwm_waveform::from(*wf);
+
+        // SAFETY: `self.as_raw()` provides a valid `*mut pwm_device` pointer.
+        // `&mut c_wf` is a valid pointer to a mutable `pwm_waveform` struct that
+        // the C function will update.
+        let ret = unsafe { bindings::pwm_round_waveform_might_sleep(self.as_raw(), &mut c_wf) };
+
+        to_result(ret)?;
+
+        *wf = Waveform::from(c_wf);
+
+        if ret == 1 {
+            Ok(RoundingOutcome::RoundedUp)
+        } else {
+            Ok(RoundingOutcome::ExactOrRoundedDown)
+        }
+    }
+
+    /// Reads the current waveform configuration directly from the hardware.
+    pub fn get_waveform(&self) -> Result<Waveform> {
+        let mut c_wf = bindings::pwm_waveform::default();
+
+        // SAFETY: `self.as_raw()` is a valid pointer. We provide a valid pointer
+        // to a stack-allocated `pwm_waveform` struct for the kernel to fill.
+        let ret = unsafe { bindings::pwm_get_waveform_might_sleep(self.as_raw(), &mut c_wf) };
+
+        to_result(ret)?;
+
+        Ok(Waveform::from(c_wf))
+    }
+}
+
+/// Wrapper for a PWM chip/controller ([`struct pwm_chip`](srctree/include/linux/pwm.h)).
+#[repr(transparent)]
+pub struct Chip(Opaque<bindings::pwm_chip>);
+
+impl Chip {
+    /// Creates a reference to a [`Chip`] from a valid pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid and remains valid for the lifetime of the
+    /// returned [`Chip`] reference.
+    pub(crate) unsafe fn as_ref<'a>(ptr: *mut bindings::pwm_chip) -> &'a Self {
+        // SAFETY: The safety requirements guarantee the validity of the dereference, while the
+        // `Chip` type being transparent makes the cast ok.
+        unsafe { &*ptr.cast::<Self>() }
+    }
+
+    /// Returns a raw pointer to the underlying `pwm_chip`.
+    pub(crate) fn as_raw(&self) -> *mut bindings::pwm_chip {
+        self.0.get()
+    }
+
+    /// Gets the number of PWM channels (hardware PWMs) on this chip.
+    pub fn npwm(&self) -> u32 {
+        // SAFETY: `self.as_raw()` provides a valid pointer for `self`'s lifetime.
+        unsafe { (*self.as_raw()).npwm }
+    }
+
+    /// Returns `true` if the chip supports atomic operations for configuration.
+    pub fn is_atomic(&self) -> bool {
+        // SAFETY: `self.as_raw()` provides a valid pointer for `self`'s lifetime.
+        unsafe { (*self.as_raw()).atomic }
+    }
+
+    /// Returns a reference to the embedded `struct device` abstraction.
+    pub fn device(&self) -> &device::Device {
+        // SAFETY: `self.as_raw()` provides a valid pointer to `bindings::pwm_chip`.
+        // The `dev` field is an instance of `bindings::device` embedded within `pwm_chip`.
+        // Taking a pointer to this embedded field is valid.
+        // `device::Device` is `#[repr(transparent)]`.
+        // The lifetime of the returned reference is tied to `self`.
+        let dev_field_ptr = unsafe { core::ptr::addr_of!((*self.as_raw()).dev) };
+        // SAFETY: `dev_field_ptr` is a valid pointer to `bindings::device`.
+        // Casting and dereferencing is safe due to `repr(transparent)` and lifetime.
+        unsafe { &*(dev_field_ptr.cast::<device::Device>()) }
+    }
+
+    /// Gets the *typed* driver-specific data associated with this chip's embedded device.
+    pub fn drvdata<T: 'static>(&self) -> &T {
+        // SAFETY: `self.as_raw()` gives a valid pwm_chip pointer.
+        // `bindings::pwmchip_get_drvdata` is the C function to retrieve driver data.
+        let ptr = unsafe { bindings::pwmchip_get_drvdata(self.as_raw()) };
+
+        // SAFETY: The only way to create a chip is through Chip::new, which initializes
+        // this pointer.
+        unsafe { &*ptr.cast::<T>() }
+    }
+
+    /// Allocates and wraps a PWM chip using `bindings::pwmchip_alloc`.
+    ///
+    /// Returns an [`ARef<Chip>`] managing the chip's lifetime via refcounting
+    /// on its embedded `struct device`.
+    pub fn new<T: 'static + ForeignOwnable>(
+        parent_dev: &device::Device,
+        npwm: u32,
+        sizeof_priv: usize,
+        drvdata: T,
+    ) -> Result<ARef<Self>> {
+        // SAFETY: `parent_device_for_dev_field.as_raw()` is valid.
+        // `bindings::pwmchip_alloc` returns a valid `*mut bindings::pwm_chip` (refcount 1)
+        // or an ERR_PTR.
+        let c_chip_ptr_raw =
+            unsafe { bindings::pwmchip_alloc(parent_dev.as_raw(), npwm, sizeof_priv) };
+
+        let c_chip_ptr: *mut bindings::pwm_chip = error::from_err_ptr(c_chip_ptr_raw)?;
+
+        // Cast the `*mut bindings::pwm_chip` to `*mut Chip`. This is valid because
+        // `Chip` is `repr(transparent)` over `Opaque<bindings::pwm_chip>`, and
+        // `Opaque<T>` is `repr(transparent)` over `T`.
+        let chip_ptr_as_self = c_chip_ptr.cast::<Self>();
+
+        // SAFETY: The pointer is valid, so we can create a temporary ref to set data.
+        let chip_ref = unsafe { &*chip_ptr_as_self };
+        // SAFETY: `chip_ref` points to a valid chip from `pwmchip_alloc` and `drvdata` is a valid,
+        // owned pointer from `ForeignOwnable` to be stored in the chip's private data.
+        unsafe { bindings::pwmchip_set_drvdata(chip_ref.as_raw(), drvdata.into_foreign().cast()) }
+
+        // SAFETY: `chip_ptr_as_self` points to a valid `Chip` (layout-compatible with
+        // `bindings::pwm_chip`) whose embedded device has refcount 1.
+        // `ARef::from_raw` takes this pointer and manages it via `AlwaysRefCounted`.
+        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(chip_ptr_as_self)) })
+    }
+
+    /// Returns a reference to the parent device of this PWM chip's device.
+    ///
+    /// # Safety
+    ///
+    /// The caller must guarantee that the parent device exists and is bound.
+    /// This is guaranteed by the PWM core during `PwmOps` callbacks.
+    unsafe fn bound_parent_device(&self) -> &device::Device<Bound> {
+        // SAFETY: Per the function's safety contract, the parent device exists.
+        let parent = unsafe { self.device().parent().unwrap_unchecked() };
+
+        // SAFETY: Per the function's safety contract, the parent device is bound.
+        // The pointer is cast from `&Device` to `&Device<Bound>`.
+        unsafe { &*core::ptr::from_ref(parent).cast::<device::Device<Bound>>() }
+    }
+}
+
+// SAFETY: Implements refcounting for `Chip` using the embedded `struct device`.
+unsafe impl AlwaysRefCounted for Chip {
+    #[inline]
+    fn inc_ref(&self) {
+        // SAFETY: `self.0.get()` points to a valid `pwm_chip` because `self` exists.
+        // The embedded `dev` is valid. `get_device` increments its refcount.
+        unsafe {
+            bindings::get_device(core::ptr::addr_of_mut!((*self.0.get()).dev));
+        }
+    }
+
+    #[inline]
+    unsafe fn dec_ref(obj: NonNull<Chip>) {
+        let c_chip_ptr = obj.cast::<bindings::pwm_chip>().as_ptr();
+
+        // SAFETY: `obj` is a valid pointer to a `Chip` (and thus `bindings::pwm_chip`)
+        // with a non-zero refcount. `put_device` handles decrement and final release.
+        unsafe {
+            bindings::put_device(core::ptr::addr_of_mut!((*c_chip_ptr).dev));
+        }
+    }
+}
+
+// SAFETY: `Chip` is a wrapper around `*mut bindings::pwm_chip`. The underlying C
+// structure's state is managed and synchronized by the kernel's device model
+// and PWM core locking mechanisms. Therefore, it is safe to move the `Chip`
+// wrapper (and the pointer it contains) across threads.
+unsafe impl Send for Chip {}
+
+// SAFETY: It is safe for multiple threads to have shared access (`&Chip`) because
+// the `Chip` data is immutable from the Rust side without holding the appropriate
+// kernel locks, which the C core is responsible for. Any interior mutability is
+// handled and synchronized by the C kernel code.
+unsafe impl Sync for Chip {}

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
