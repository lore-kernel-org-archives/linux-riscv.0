Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07940CFD376
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Nov 2025 22:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsTgH3hYsgFt+0tJZYyu/iB9RXV8DPl56zf3mJAqi3Y=; b=utipK440r65hgn
	WhbHbPZhQ7mPmE87RHNSdDfAKBU9kk6ScWxZUh0s5LTsQ9LkdEF5HfIUGG5acLFZ2Ix+fs+o2mXfp
	QENuOIdNTo5j6eBKJLg52eYNLtnH6l2cUUTOs/d6CHIMXdCOoJkAD3Dx4en+UVQ1kkNE34/QUX+l+
	khg55WstsbcyBYZLitV+aIc6+VRS7xkd5fMSt0JNC2SeL6sO1wkXCVPtBDzgqtORlycZguA9PUhte
	8AbaZsKw3EkPiyEUK+98aOEfjbCwFsJtdJ8w+1wP7VcdAo0/OKVVNsqOcOUiOaMGinO60W8SvsGsE
	w+jlW8UqwzzW2vqiuoew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPpfi-00000002cBf-17gv;
	Sun, 30 Nov 2025 22:13:34 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPpfc-00000002cBL-2gVv
	for linux-riscv@lists.infradead.org;
	Sun, 30 Nov 2025 22:13:32 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251130221324euoutp0203a8e2a6ad585d6a18d442fb66a2b34a~86IM2xky71853318533euoutp02B
	for <linux-riscv@lists.infradead.org>; Sun, 30 Nov 2025 22:13:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251130221324euoutp0203a8e2a6ad585d6a18d442fb66a2b34a~86IM2xky71853318533euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764540804;
	bh=4OsLgv/4/Kf3LZJYEQIvCogYjuXNU2BKQiAZmiyor6o=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=PlFJiBDHJet2fbjVBhK/w57tjjMasx4JVQ1n875y6C8DJpBP5IHz2mByiTbcFMuG7
	 VoHft7zm38qb1xgYg73L/shvH5sUqa2GDNiytR22TWwuuLPh4lGW+deaPTIqQhlFTM
	 +dVswwHe6taKa/OTysuioyrgCftr6l1PM5QiGb9c=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251130221323eucas1p1194eb8ea8564946329033f14941c2794~86IL8XB7l2038820388eucas1p1o;
	Sun, 30 Nov 2025 22:13:23 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251130221321eusmtip1f3821b65e9b95e4c544d8f094b4d7175~86IKt2aHw2338123381eusmtip1d;
	Sun, 30 Nov 2025 22:13:21 +0000 (GMT)
Message-ID: <9394dd00-a8a2-4ffd-98bd-a4d512e80591@samsung.com>
Date: Sun, 30 Nov 2025 23:13:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Move pwm registration into pwm::Chip::new
To: Markus Probst <markus.probst@posteo.de>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Drew Fustini
	<fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
	<dakr@kernel.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20251127-pwm_safe_register-v1-1-d22d0ed068ac@posteo.de>
X-CMS-MailID: 20251130221323eucas1p1194eb8ea8564946329033f14941c2794
X-Msg-Generator: CA
X-RootMTR: 20251127171512eucas1p2eded6a14bdcba1e4dbeb15cc29b7860d
X-EPHeader: CA
X-CMS-RootMailID: 20251127171512eucas1p2eded6a14bdcba1e4dbeb15cc29b7860d
References: <CGME20251127171512eucas1p2eded6a14bdcba1e4dbeb15cc29b7860d@eucas1p2.samsung.com>
	<20251127-pwm_safe_register-v1-1-d22d0ed068ac@posteo.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_141329_302898_CC756C39 
X-CRM114-Status: GOOD (  34.09  )
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


Hi Markus,
On 11/27/25 18:15, Markus Probst wrote:
> The `pwm::Registration::register` function provides no guarantee that the
> function isn't called twice with the same pwm chip, which is considered
> unsafe.
> 
> Add the code responsible for the registration into `pwm::Chip::new`. The
> registration will happen before the driver gets access to the refcounted
> pwm chip and can therefore guarantee that the registration isn't called
> twice on the same pwm chip.

I agree that the double registration safety issue needs to be fixed.

However, merging the allocation and registration steps into Chip::new
restricts the API significantly.

There is a specific reason the C API separates pwmchip_alloc and
pwmchip_add. Drivers might need to configure the chip e.g. setting the
atomic flag, or acquire resources that require a pointer to the chip
(like requesting an IRQ) after allocation but before the device is
registered and visible to the subsystem.

I suggest we solve this using the Builder Pattern instead. This would
allow us to allocate, configure, and finally register the chip in
distinct safe steps.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
> This patch provides the additional guarantee that the pwm chip doesn't
> get registered twice.
> 
> The following changes were made:
> - change the visibility of `pwm::Registration` to private
> - remove the `pwm::Registration::register` function
> - add code for registering the pwm chip in `pwm::Chip::new`
> - add Send + Sync bounds to `PwmOps`
> 
> Note that I wasn't able to test this patch, due to the lack of hardware.
> ---
>  drivers/pwm/pwm_th1520.rs |  4 +---
>  rust/kernel/pwm.rs        | 53 ++++++++++++++++++-----------------------------
>  2 files changed, 21 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> index 955c359b07fb..1919b5a1f69e 100644
> --- a/drivers/pwm/pwm_th1520.rs
> +++ b/drivers/pwm/pwm_th1520.rs
> @@ -363,7 +363,7 @@ fn probe(
>              return Err(EINVAL);
>          }
>  
> -        let chip = pwm::Chip::new(
> +        pwm::Chip::new(
>              dev,
>              TH1520_MAX_PWM_NUM,
>              try_pin_init!(Th1520PwmDriverData {
> @@ -372,8 +372,6 @@ fn probe(
>              }),
>          )?;
>  
> -        pwm::Registration::register(dev, chip)?;
> -
>          Ok(KBox::new(Th1520PwmPlatformDriver, GFP_KERNEL)?.into())
>      }
>  }
> diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
> index cb00f8a8765c..c5d03ee8bc95 100644
> --- a/rust/kernel/pwm.rs
> +++ b/rust/kernel/pwm.rs
> @@ -173,7 +173,7 @@ pub struct RoundedWaveform<WfHw> {
>  }
>  
>  /// Trait defining the operations for a PWM driver.
> -pub trait PwmOps: 'static + Sized {
> +pub trait PwmOps: 'static + Send + Sync + Sized {
>      /// The driver-specific hardware representation of a waveform.
>      ///
>      /// This type must be [`Copy`], [`Default`], and fit within `PWM_WFHWSIZE`.
> @@ -585,7 +585,7 @@ unsafe fn bound_parent_device(&self) -> &device::Device<Bound> {
>      /// Returns an [`ARef<Chip>`] managing the chip's lifetime via refcounting
>      /// on its embedded `struct device`.
>      pub fn new(
> -        parent_dev: &device::Device,
> +        parent_dev: &device::Device<Bound>,
>          num_channels: u32,
>          data: impl pin_init::PinInit<T, Error>,
>      ) -> Result<ARef<Self>> {
> @@ -623,7 +623,21 @@ pub fn new(
>          // SAFETY: `chip_ptr_as_self` points to a valid `Chip` (layout-compatible with
>          // `bindings::pwm_chip`) whose embedded device has refcount 1.
>          // `ARef::from_raw` takes this pointer and manages it via `AlwaysRefCounted`.
> -        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(chip_ptr_as_self)) })
> +        let chip = unsafe { ARef::from_raw(NonNull::new_unchecked(chip_ptr_as_self)) };
> +
> +        // SAFETY: `c_chip_ptr` points to a valid chip with its ops initialized.
> +        // `__pwmchip_add` is the C function to register the chip with the PWM core.
> +        unsafe {
> +            to_result(bindings::__pwmchip_add(c_chip_ptr, core::ptr::null_mut()))?;
> +        }
> +
> +        let registration = Registration {
> +            chip: ARef::clone(&chip),
> +        };
> +
> +        devres::register(parent_dev, registration, GFP_KERNEL)?;
> +
> +        Ok(chip)
>      }
>  }
>  
> @@ -654,50 +668,23 @@ unsafe fn dec_ref(obj: NonNull<Chip<T>>) {
>  // structure's state is managed and synchronized by the kernel's device model
>  // and PWM core locking mechanisms. Therefore, it is safe to move the `Chip`
>  // wrapper (and the pointer it contains) across threads.
> -unsafe impl<T: PwmOps + Send> Send for Chip<T> {}
> +unsafe impl<T: PwmOps> Send for Chip<T> {}
>  
>  // SAFETY: It is safe for multiple threads to have shared access (`&Chip`) because
>  // the `Chip` data is immutable from the Rust side without holding the appropriate
>  // kernel locks, which the C core is responsible for. Any interior mutability is
>  // handled and synchronized by the C kernel code.
> -unsafe impl<T: PwmOps + Sync> Sync for Chip<T> {}
> +unsafe impl<T: PwmOps> Sync for Chip<T> {}
>  
>  /// A resource guard that ensures `pwmchip_remove` is called on drop.
>  ///
>  /// This struct is intended to be managed by the `devres` framework by transferring its ownership
>  /// via [`devres::register`]. This ties the lifetime of the PWM chip registration
>  /// to the lifetime of the underlying device.
> -pub struct Registration<T: PwmOps> {
> +struct Registration<T: PwmOps> {
>      chip: ARef<Chip<T>>,
>  }
>  
> -impl<T: 'static + PwmOps + Send + Sync> Registration<T> {
> -    /// Registers a PWM chip with the PWM subsystem.
> -    ///
> -    /// Transfers its ownership to the `devres` framework, which ties its lifetime
> -    /// to the parent device.
> -    /// On unbind of the parent device, the `devres` entry will be dropped, automatically
> -    /// calling `pwmchip_remove`. This function should be called from the driver's `probe`.
> -    pub fn register(dev: &device::Device<Bound>, chip: ARef<Chip<T>>) -> Result {
> -        let chip_parent = chip.device().parent().ok_or(EINVAL)?;
> -        if dev.as_raw() != chip_parent.as_raw() {
> -            return Err(EINVAL);
> -        }
> -
> -        let c_chip_ptr = chip.as_raw();
> -
> -        // SAFETY: `c_chip_ptr` points to a valid chip with its ops initialized.
> -        // `__pwmchip_add` is the C function to register the chip with the PWM core.
> -        unsafe {
> -            to_result(bindings::__pwmchip_add(c_chip_ptr, core::ptr::null_mut()))?;
> -        }
> -
> -        let registration = Registration { chip };
> -
> -        devres::register(dev, registration, GFP_KERNEL)
> -    }
> -}
> -
>  impl<T: PwmOps> Drop for Registration<T> {
>      fn drop(&mut self) {
>          let chip_raw = self.chip.as_raw();
> 
> ---
> base-commit: fae00ea9f00367771003ace78f29549dead58fc7
> change-id: 20251127-pwm_safe_register-e49b0a261101
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
