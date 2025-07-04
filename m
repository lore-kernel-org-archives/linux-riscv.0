Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E73C83F0C
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 12:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/IrZZMlBuDZ7WCdqzogQc36helrJBbO5yZSADn90ANw=; b=ovwRWsuBtUNoB+
	V0wgsdiMD29UKoTwwM5TT+CqwZILTIqEYIOZSQOskI8QW0pCGeSVUM8AuKIKPs2rKZ99rX2mS+By9
	cnK8iFeFZBrf7zzhg2EyZMgr5SC4G3LLmwsTZrY5oBxIIIaMO4jnyt6v7w9ymij0yis0eVbiqGlpU
	Jh9EbS9QnF8+3093QX0bLHnNeSp0/eUVx2O94obJtQfYr1Q2uLrwyAoQJHAhdOM3ybmzHw6oJFwuO
	bUe/j/TLDm/DuycfVFahhwSwvWbSGmbAtSOdNfDPw/SFyQ8SLfPTSSUo+3L+tGCGmJn//FiblgR1h
	UTb/x8ZSzk1TRBLBk57A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXf7X-0000000ELd8-3515;
	Fri, 04 Jul 2025 12:02:23 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXf7R-0000000ELYH-3yir
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 12:02:20 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250704120214euoutp0288ed2961d8bd346d5a13994d4673cb9c~PCrDbxVLs1137311373euoutp02G
	for <linux-riscv@lists.infradead.org>; Fri,  4 Jul 2025 12:02:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250704120214euoutp0288ed2961d8bd346d5a13994d4673cb9c~PCrDbxVLs1137311373euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751630534;
	bh=0lC8UNwKQjUCle9gtS0J5+Ir+EilnRfIYbNToJD4tw0=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=YhihYnpZNkLm5Uo3D7IgSNkB/KsqZjWGCe40CyHLl9Tutfi5NV+tIAHRlXqL1Oxgg
	 YKYm9effwHgrGGjnwhI82z1qlVwIQurLdeikiJOthaDjc/vGDjetwdZa8VEIglBbOs
	 RbhbwNRJA7xNvhBPTA5h6dzpREy7nxwajI4WxNVc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250704120214eucas1p289fdeac50837379fdd59b3bc0437c2bc~PCrCt9wCl3070430704eucas1p2q;
	Fri,  4 Jul 2025 12:02:14 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250704120212eusmtip1e62d28773b51c4533bf0ab6db2f3b2ce~PCrBqYnrb0801408014eusmtip1k;
	Fri,  4 Jul 2025 12:02:12 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 04 Jul 2025 14:01:13 +0200
Subject: [PATCH v8 3/7] rust: pwm: Add driver operations trait and
 registration support
MIME-Version: 1.0
Message-Id: <20250704-rust-next-pwm-working-fan-for-sending-v8-3-951e5482c9fd@samsung.com>
In-Reply-To: <20250704-rust-next-pwm-working-fan-for-sending-v8-0-951e5482c9fd@samsung.com>
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
X-CMS-MailID: 20250704120214eucas1p289fdeac50837379fdd59b3bc0437c2bc
X-Msg-Generator: CA
X-RootMTR: 20250704120214eucas1p289fdeac50837379fdd59b3bc0437c2bc
X-EPHeader: CA
X-CMS-RootMailID: 20250704120214eucas1p289fdeac50837379fdd59b3bc0437c2bc
References: <20250704-rust-next-pwm-working-fan-for-sending-v8-0-951e5482c9fd@samsung.com>
	<CGME20250704120214eucas1p289fdeac50837379fdd59b3bc0437c2bc@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_050218_266931_D726BFB7 
X-CRM114-Status: GOOD (  19.91  )
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

Complete the PWM abstraction layer by adding the final components
required to implement and register a driver.

The main additions are:

 - PwmOps Trait: An interface that drivers can implement to provide
   their hardware specific logic. It mirrors the C pwm_ops interface,
   providing hooks for standard PWM operations like apply, request, and
   waveform handling.

 - FFI VTable and Adapter: The Adapter struct, PwmOpsVTable wrapper, and
   create_pwm_ops function are introduced. This scaffolding handles the
   unsafe FFI translation, bridging the gap between the idiomatic PwmOps
   trait and the C kernel's function-pointer-based vtable.

 - Registration Guard: A final RAII guard that uses the vtable to safely
   register a Chip with the PWM core via pwmchip_add. Its Drop
   implementation guarantees that pwmchip_remove is always called,
   preventing resource leaks.

With this patch, the PWM abstraction layer is now complete and ready to
be used for writing PWM chip drivers in Rust.

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 rust/kernel/pwm.rs | 390 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 388 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index ba2f5a0ce5b9c4ca64f2984a627324aa8ab669cc..c3865fa6fcc3d44a3c6fe80d73af8a2a4b2ea862 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -7,12 +7,14 @@
 //! C header: [`include/linux/pwm.h`](srctree/include/linux/pwm.h).
 
 use crate::{
-    bindings, device,
+    bindings,
+    device::{self, Bound},
+    devres,
     error::{self, to_result},
     prelude::*,
     types::{ARef, AlwaysRefCounted, ForeignOwnable, Opaque},
 };
-use core::{convert::TryFrom, ptr::NonNull};
+use core::{convert::TryFrom, marker::PhantomData, ptr::NonNull};
 
 /// PWM polarity. Mirrors [`enum pwm_polarity`](srctree/include/linux/pwm.h).
 #[derive(Copy, Clone, Debug, PartialEq, Eq)]
@@ -395,3 +397,387 @@ unsafe impl<T: ForeignOwnable + Send> Send for Chip<T> {}
 // kernel locks, which the C core is responsible for. Any interior mutability is
 // handled and synchronized by the C kernel code.
 unsafe impl<T: ForeignOwnable + Sync> Sync for Chip<T> {}
+
+/// A resource guard that ensures `pwmchip_remove` is called on drop.
+///
+/// This struct is intended to be managed by the `devres` framework by transferring its ownership
+/// via [`Devres::register`]. This ties the lifetime of the PWM chip registration
+/// to the lifetime of the underlying device.
+pub struct Registration<T: ForeignOwnable> {
+    chip: ARef<Chip<T>>,
+}
+
+impl<T: 'static + ForeignOwnable + Send + Sync> Registration<T> {
+    /// Registers a PWM chip with the PWM subsystem.
+    ///
+    /// Transfers its ownership to the `devres` framework, which ties its lifetime
+    /// to the parent device.
+    /// On unbind of the parent device, the `devres` entry will be dropped, automatically
+    /// calling `pwmchip_remove`. This function should be called from the driver's `probe`.
+    pub fn register(
+        dev: &device::Device<Bound>,
+        chip: ARef<Chip<T>>,
+        ops_vtable: &'static PwmOpsVTable,
+    ) -> Result {
+	let chip_parent = chip.device().parent().ok_or(EINVAL)?;
+        if dev.as_raw() != chip_parent.as_raw() {
+            return Err(EINVAL);
+        }
+
+        let c_chip_ptr = chip.as_raw();
+
+        // SAFETY: `c_chip_ptr` is valid because the `ARef<Chip>` that owns it exists.
+        // The vtable pointer is also valid. This sets the `.ops` field on the C struct.
+        unsafe {
+            (*c_chip_ptr).ops = ops_vtable.as_raw();
+        }
+
+        // SAFETY: `c_chip_ptr` points to a valid chip with its ops initialized.
+        // `__pwmchip_add` is the C function to register the chip with the PWM core.
+        unsafe {
+            to_result(bindings::__pwmchip_add(c_chip_ptr, core::ptr::null_mut()))?;
+        }
+
+        let registration = Registration { chip };
+
+        devres::register(dev, registration, GFP_KERNEL)
+    }
+}
+
+impl<T: ForeignOwnable> Drop for Registration<T> {
+    fn drop(&mut self) {
+        let chip_raw = self.chip.as_raw();
+
+        // SAFETY: `chip_raw` points to a chip that was successfully registered.
+        // `bindings::pwmchip_remove` is the correct C function to unregister it.
+        // This `drop` implementation is called automatically by `devres` on driver unbind.
+        unsafe {
+            bindings::pwmchip_remove(chip_raw);
+        }
+    }
+}
+
+/// Trait defining the operations for a PWM driver.
+pub trait PwmOps: 'static + Sized {
+    /// The type of the owned driver data (e.g., `Pin<KBox<...>>`).
+    type DrvData: 'static + ForeignOwnable;
+    /// The driver-specific hardware representation of a waveform.
+    ///
+    /// This type must be [`Copy`], [`Default`], and fit within `PWM_WFHWSIZE`.
+    type WfHw: Copy + Default;
+
+    /// Optional hook for when a PWM device is requested.
+    fn request(
+        _chip: &Chip<Self::DrvData>,
+        _pwm: &Device,
+        _parent_dev: &device::Device<Bound>,
+    ) -> Result {
+        Ok(())
+    }
+
+    /// Optional hook for when a PWM device is freed.
+    fn free(_chip: &Chip<Self::DrvData>, _pwm: &Device, _parent_dev: &device::Device<Bound>) {}
+
+    /// Optional hook for capturing a PWM signal.
+    fn capture(
+        _chip: &Chip<Self::DrvData>,
+        _pwm: &Device,
+        _result: &mut bindings::pwm_capture,
+        _timeout: usize,
+        _parent_dev: &device::Device<Bound>,
+    ) -> Result {
+        Err(ENOTSUPP)
+    }
+
+    /// Convert a generic waveform to the hardware-specific representation.
+    /// This is typically a pure calculation and does not perform I/O.
+    fn round_waveform_tohw(
+        _chip: &Chip<Self::DrvData>,
+        _pwm: &Device,
+        _wf: &Waveform,
+    ) -> Result<(c_int, Self::WfHw)> {
+        Err(ENOTSUPP)
+    }
+
+    /// Convert a hardware-specific representation back to a generic waveform.
+    /// This is typically a pure calculation and does not perform I/O.
+    fn round_waveform_fromhw(
+        _chip: &Chip<Self::DrvData>,
+        _pwm: &Device,
+        _wfhw: &Self::WfHw,
+        _wf: &mut Waveform,
+    ) -> Result<c_int> {
+        Err(ENOTSUPP)
+    }
+
+    /// Read the current hardware configuration into the hardware-specific representation.
+    fn read_waveform(
+        _chip: &Chip<Self::DrvData>,
+        _pwm: &Device,
+        _parent_dev: &device::Device<Bound>,
+    ) -> Result<Self::WfHw> {
+        Err(ENOTSUPP)
+    }
+
+    /// Write a hardware-specific waveform configuration to the hardware.
+    fn write_waveform(
+        _chip: &Chip<Self::DrvData>,
+        _pwm: &Device,
+        _wfhw: &Self::WfHw,
+        _parent_dev: &device::Device<Bound>,
+    ) -> Result {
+        Err(ENOTSUPP)
+    }
+}
+/// Bridges Rust `PwmOps` to the C `pwm_ops` vtable.
+struct Adapter<T: PwmOps> {
+    _p: PhantomData<T>,
+}
+
+impl<T: PwmOps> Adapter<T> {
+    /// # Safety
+    ///
+    /// `wfhw_ptr` must be valid for writes of `size_of::<T::WfHw>()` bytes.
+    unsafe fn serialize_wfhw(wfhw: &T::WfHw, wfhw_ptr: *mut c_void) -> Result {
+        let size = core::mem::size_of::<T::WfHw>();
+        if size > bindings::PWM_WFHWSIZE as usize {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: The caller ensures `wfhw_ptr` is valid for `size` bytes.
+        unsafe {
+            core::ptr::copy_nonoverlapping(
+                core::ptr::from_ref::<T::WfHw>(wfhw).cast::<u8>(),
+                wfhw_ptr.cast::<u8>(),
+                size,
+            );
+        }
+
+        Ok(())
+    }
+
+    /// # Safety
+    ///
+    /// `wfhw_ptr` must be valid for reads of `size_of::<T::WfHw>()` bytes.
+    unsafe fn deserialize_wfhw(wfhw_ptr: *const c_void) -> Result<T::WfHw> {
+        let size = core::mem::size_of::<T::WfHw>();
+        if size > bindings::PWM_WFHWSIZE as usize {
+            return Err(EINVAL);
+        }
+
+        let mut wfhw = T::WfHw::default();
+        // SAFETY: The caller ensures `wfhw_ptr` is valid for `size` bytes.
+        unsafe {
+            core::ptr::copy_nonoverlapping(
+                wfhw_ptr.cast::<u8>(),
+                core::ptr::from_mut::<T::WfHw>(&mut wfhw).cast::<u8>(),
+                size,
+            );
+        }
+
+        Ok(wfhw)
+    }
+
+    /// # Safety
+    ///
+    /// Pointers from C must be valid.
+    unsafe extern "C" fn request_callback(
+        c: *mut bindings::pwm_chip,
+        p: *mut bindings::pwm_device,
+    ) -> c_int {
+        // SAFETY: PWM core guarentees `c` and `p` are valid pointers.
+        let (chip, pwm) = unsafe { (Chip::<T::DrvData>::as_ref(c), Device::as_ref(p)) };
+
+        // SAFETY: The PWM core guarantees the parent device exists and is bound during callbacks.
+        let bound_parent = unsafe { chip.bound_parent_device() };
+        match T::request(chip, pwm, bound_parent) {
+            Ok(()) => 0,
+            Err(e) => e.to_errno(),
+        }
+    }
+
+    /// # Safety
+    ///
+    /// Pointers from C must be valid.
+    unsafe extern "C" fn free_callback(c: *mut bindings::pwm_chip, p: *mut bindings::pwm_device) {
+        // SAFETY: Relies on the function's contract that `c` and `p` are valid pointers.
+        let (chip, pwm) = unsafe { (Chip::<T::DrvData>::as_ref(c), Device::as_ref(p)) };
+
+        // SAFETY: The PWM core guarantees the parent device exists and is bound during callbacks.
+        let bound_parent = unsafe { chip.bound_parent_device() };
+        T::free(chip, pwm, bound_parent);
+    }
+
+    /// # Safety
+    ///
+    /// Pointers from C must be valid.
+    unsafe extern "C" fn capture_callback(
+        c: *mut bindings::pwm_chip,
+        p: *mut bindings::pwm_device,
+        res: *mut bindings::pwm_capture,
+        timeout: usize,
+    ) -> c_int {
+        // SAFETY: Relies on the function's contract that `c` and `p` are valid pointers.
+        let (chip, pwm, result) =
+            unsafe { (Chip::<T::DrvData>::as_ref(c), Device::as_ref(p), &mut *res) };
+
+        // SAFETY: The PWM core guarantees the parent device exists and is bound during callbacks.
+        let bound_parent = unsafe { chip.bound_parent_device() };
+        match T::capture(chip, pwm, result, timeout, bound_parent) {
+            Ok(()) => 0,
+            Err(e) => e.to_errno(),
+        }
+    }
+
+    /// # Safety
+    ///
+    /// Pointers from C must be valid.
+    unsafe extern "C" fn round_waveform_tohw_callback(
+        c: *mut bindings::pwm_chip,
+        p: *mut bindings::pwm_device,
+        w: *const bindings::pwm_waveform,
+        wh: *mut c_void,
+    ) -> c_int {
+        // SAFETY: Relies on the function's contract that `c` and `p` are valid pointers.
+        let (chip, pwm, wf) = unsafe {
+            (
+                Chip::<T::DrvData>::as_ref(c),
+                Device::as_ref(p),
+                Waveform::from(*w),
+            )
+        };
+        match T::round_waveform_tohw(chip, pwm, &wf) {
+            Ok((status, wfhw)) => {
+                // SAFETY: `wh` is valid per this function's safety contract.
+                if unsafe { Self::serialize_wfhw(&wfhw, wh) }.is_err() {
+                    return EINVAL.to_errno();
+                }
+                status
+            }
+            Err(e) => e.to_errno(),
+        }
+    }
+
+    /// # Safety
+    ///
+    /// Pointers from C must be valid.
+    unsafe extern "C" fn round_waveform_fromhw_callback(
+        c: *mut bindings::pwm_chip,
+        p: *mut bindings::pwm_device,
+        wh: *const c_void,
+        w: *mut bindings::pwm_waveform,
+    ) -> c_int {
+        // SAFETY: Relies on the function's contract that `c` and `p` are valid pointers.
+        let (chip, pwm) = unsafe { (Chip::<T::DrvData>::as_ref(c), Device::as_ref(p)) };
+        // SAFETY: `deserialize_wfhw`'s safety contract is met by this function's contract.
+        let wfhw = match unsafe { Self::deserialize_wfhw(wh) } {
+            Ok(v) => v,
+            Err(e) => return e.to_errno(),
+        };
+
+        let mut rust_wf = Waveform::default();
+        match T::round_waveform_fromhw(chip, pwm, &wfhw, &mut rust_wf) {
+            Ok(ret) => {
+                // SAFETY: `w` is guaranteed valid by the C caller.
+                unsafe {
+                    *w = rust_wf.into();
+                };
+                ret
+            }
+            Err(e) => e.to_errno(),
+        }
+    }
+
+    /// # Safety
+    ///
+    /// Pointers from C must be valid.
+    unsafe extern "C" fn read_waveform_callback(
+        c: *mut bindings::pwm_chip,
+        p: *mut bindings::pwm_device,
+        wh: *mut c_void,
+    ) -> c_int {
+        // SAFETY: Relies on the function's contract that `c` and `p` are valid pointers.
+        let (chip, pwm) = unsafe { (Chip::<T::DrvData>::as_ref(c), Device::as_ref(p)) };
+
+        // SAFETY: The PWM core guarantees the parent device exists and is bound during callbacks.
+        let bound_parent = unsafe { chip.bound_parent_device() };
+        match T::read_waveform(chip, pwm, bound_parent) {
+            // SAFETY: `wh` is valid per this function's safety contract.
+            Ok(wfhw) => match unsafe { Self::serialize_wfhw(&wfhw, wh) } {
+                Ok(()) => 0,
+                Err(e) => e.to_errno(),
+            },
+            Err(e) => e.to_errno(),
+        }
+    }
+
+    /// # Safety
+    ///
+    /// Pointers from C must be valid.
+    unsafe extern "C" fn write_waveform_callback(
+        c: *mut bindings::pwm_chip,
+        p: *mut bindings::pwm_device,
+        wh: *const c_void,
+    ) -> c_int {
+        // SAFETY: Relies on the function's contract that `c` and `p` are valid pointers.
+        let (chip, pwm) = unsafe { (Chip::<T::DrvData>::as_ref(c), Device::as_ref(p)) };
+
+        // SAFETY: The PWM core guarantees the parent device exists and is bound during callbacks.
+        let bound_parent = unsafe { chip.bound_parent_device() };
+
+        // SAFETY: `wh` is valid per this function's safety contract.
+        let wfhw = match unsafe { Self::deserialize_wfhw(wh) } {
+            Ok(v) => v,
+            Err(e) => return e.to_errno(),
+        };
+        match T::write_waveform(chip, pwm, &wfhw, bound_parent) {
+            Ok(()) => 0,
+            Err(e) => e.to_errno(),
+        }
+    }
+}
+
+/// VTable structure wrapper for PWM operations.
+/// Mirrors [`struct pwm_ops`](srctree/include/linux/pwm.h).
+#[repr(transparent)]
+pub struct PwmOpsVTable(Opaque<bindings::pwm_ops>);
+
+// SAFETY: PwmOpsVTable is Send. The vtable contains only function pointers
+// and a size, which are simple data types that can be safely moved across
+// threads. The thread-safety of calling these functions is handled by the
+// kernel's locking mechanisms.
+unsafe impl Send for PwmOpsVTable {}
+
+// SAFETY: PwmOpsVTable is Sync. The vtable is immutable after it is created,
+// so it can be safely referenced and accessed concurrently by multiple threads
+// e.g. to read the function pointers.
+unsafe impl Sync for PwmOpsVTable {}
+
+impl PwmOpsVTable {
+    /// Returns a raw pointer to the underlying `pwm_ops` struct.
+    pub(crate) fn as_raw(&self) -> *const bindings::pwm_ops {
+        self.0.get()
+    }
+}
+
+/// Creates a PWM operations vtable for a type `T` that implements `PwmOps`.
+///
+/// This is used to bridge Rust trait implementations to the C `struct pwm_ops`
+/// expected by the kernel.
+pub const fn create_pwm_ops<T: PwmOps>() -> PwmOpsVTable {
+    // SAFETY: `core::mem::zeroed()` is unsafe. For `pwm_ops`, all fields are
+    // `Option<extern "C" fn(...)>` or data, so a zeroed pattern (None/0) is valid initially.
+    let mut ops: bindings::pwm_ops = unsafe { core::mem::zeroed() };
+
+    ops.request = Some(Adapter::<T>::request_callback);
+    ops.free = Some(Adapter::<T>::free_callback);
+    ops.capture = Some(Adapter::<T>::capture_callback);
+
+    ops.round_waveform_tohw = Some(Adapter::<T>::round_waveform_tohw_callback);
+    ops.round_waveform_fromhw = Some(Adapter::<T>::round_waveform_fromhw_callback);
+    ops.read_waveform = Some(Adapter::<T>::read_waveform_callback);
+    ops.write_waveform = Some(Adapter::<T>::write_waveform_callback);
+    ops.sizeof_wfhw = core::mem::size_of::<T::WfHw>();
+
+    PwmOpsVTable(Opaque::new(ops))
+}

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
