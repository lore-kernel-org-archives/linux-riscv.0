Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4202CFD376
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Nov 2025 13:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXT3KCKVWzz5M5cz3Bf58mDeiYwIvtFWF5J/ZkHuJ1g=; b=R3IOOPj/54ezM8
	hvLknyWtpQZg3Zd+awDqCB5gxsigBbqY5RLN9KXLgzdItvCB7wtJ9VBAWBTxtOBQDsQm8+xz36MNC
	xp5/uN86O1/CxF2s79iCAu7YoqdE20d8oj7HIcGMEtGU0CZ/y7s3Qac5fl1sQSq0MxOgWEv1pfENX
	D7nnXhDPxIRxRnSp2i519Y5V6NuxyNHufpiJaLK1YT/F5xDFrZHwbWxk217qkD6CBhg9s+EUIdqgI
	tIfMqnWijPaBsqJFNZ4obdK++e+eN5MS51YiR2YUmMZ0h9aB18XS0DDqPCyh682Azj+7FVF+Rc7ug
	2bOFVDht3Bdh4JqgL23g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOyvh-00000000VO3-2FYV;
	Fri, 28 Nov 2025 13:54:33 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOyvd-00000000VNg-3xJ7
	for linux-riscv@lists.infradead.org;
	Fri, 28 Nov 2025 13:54:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764338057; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GVcsODU4Em5oQcyTBZuCN05hBvAfqzcC+7oB6ixqrWlp8kJDEKHlA3xG7V56de/Zeb+34XNz698y/NxwnUDiIxYoR+84qA64Co5zGDRz7VNbgUg/vZx1UK2MjSRwpvDTy9fVyVxGpC8o8IgNpU4mJFa/w9FmqVDLkoBX0pdc4Dk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764338057; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nOSl6atG5UR1v+/ptm7hHNQ9b34udSVJqzkuaFN3mHU=; 
	b=SK1AYHGfwAChnSWkag1kKPcIjx7exBe/9UXbwGwx4+Wza/5JJVWH3lOjodDb924dl6AlWK+UsUdRb+Bm6/m7KRCtv5zfWBRWdwnFjmDWoV7GT96WXOs4HAGNhaO4E2C7VoY5winEyG41hFIEqZMOe8hFButcItFiOdyyCrBNTBI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764338057;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=nOSl6atG5UR1v+/ptm7hHNQ9b34udSVJqzkuaFN3mHU=;
	b=JxX2OTKHtPjEB2F718jTO/D4ydL9aZwlLNv4ClPBpwSXWDIRZ4odxcpNgh1RYhXW
	vJGF6njHfHqBAqhE1JBfws3zWl+PkiHIcqN8/i5jlaXjj4lIozAJaddxYvt4Dm/X9kT
	pK/VflFVbnEWUQzb8GnGAjDnJDYaUf/L+dQQFtFs=
Received: by mx.zohomail.com with SMTPS id 1764338054098535.2594267091282;
	Fri, 28 Nov 2025 05:54:14 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] Move pwm registration into pwm::Chip::new
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251127-pwm_safe_register-v1-1-d22d0ed068ac@posteo.de>
Date: Fri, 28 Nov 2025 10:53:57 -0300
Cc: Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Message-Id: <C474FD43-BC88-4F21-BAA3-08FEDB368BB2@collabora.com>
References: <20251127-pwm_safe_register-v1-1-d22d0ed068ac@posteo.de>
To: Markus Probst <markus.probst@posteo.de>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_055430_050287_3F7B73C4 
X-CRM114-Status: GOOD (  28.30  )
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



> On 27 Nov 2025, at 14:15, Markus Probst <markus.probst@posteo.de> wrote:
> 
> The `pwm::Registration::register` function provides no guarantee that the
> function isn't called twice with the same pwm chip, which is considered
> unsafe.
> 
> Add the code responsible for the registration into `pwm::Chip::new`. The
> registration will happen before the driver gets access to the refcounted
> pwm chip and can therefore guarantee that the registration isn't called
> twice on the same pwm chip.
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
> drivers/pwm/pwm_th1520.rs |  4 +---
> rust/kernel/pwm.rs        | 53 ++++++++++++++++++-----------------------------
> 2 files changed, 21 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> index 955c359b07fb..1919b5a1f69e 100644
> --- a/drivers/pwm/pwm_th1520.rs
> +++ b/drivers/pwm/pwm_th1520.rs
> @@ -363,7 +363,7 @@ fn probe(
>             return Err(EINVAL);
>         }
> 
> -        let chip = pwm::Chip::new(
> +        pwm::Chip::new(
>             dev,
>             TH1520_MAX_PWM_NUM,
>             try_pin_init!(Th1520PwmDriverData {
> @@ -372,8 +372,6 @@ fn probe(
>             }),
>         )?;
> 
> -        pwm::Registration::register(dev, chip)?;
> -
>         Ok(KBox::new(Th1520PwmPlatformDriver, GFP_KERNEL)?.into())
>     }
> }
> diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
> index cb00f8a8765c..c5d03ee8bc95 100644
> --- a/rust/kernel/pwm.rs
> +++ b/rust/kernel/pwm.rs
> @@ -173,7 +173,7 @@ pub struct RoundedWaveform<WfHw> {
> }
> 
> /// Trait defining the operations for a PWM driver.
> -pub trait PwmOps: 'static + Sized {
> +pub trait PwmOps: 'static + Send + Sync + Sized {
>     /// The driver-specific hardware representation of a waveform.
>     ///
>     /// This type must be [`Copy`], [`Default`], and fit within `PWM_WFHWSIZE`.
> @@ -585,7 +585,7 @@ unsafe fn bound_parent_device(&self) -> &device::Device<Bound> {
>     /// Returns an [`ARef<Chip>`] managing the chip's lifetime via refcounting
>     /// on its embedded `struct device`.
>     pub fn new(
> -        parent_dev: &device::Device,
> +        parent_dev: &device::Device<Bound>,
>         num_channels: u32,
>         data: impl pin_init::PinInit<T, Error>,
>     ) -> Result<ARef<Self>> {
> @@ -623,7 +623,21 @@ pub fn new(
>         // SAFETY: `chip_ptr_as_self` points to a valid `Chip` (layout-compatible with
>         // `bindings::pwm_chip`) whose embedded device has refcount 1.
>         // `ARef::from_raw` takes this pointer and manages it via `AlwaysRefCounted`.
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
>     }
> }
> 
> @@ -654,50 +668,23 @@ unsafe fn dec_ref(obj: NonNull<Chip<T>>) {
> // structure's state is managed and synchronized by the kernel's device model
> // and PWM core locking mechanisms. Therefore, it is safe to move the `Chip`
> // wrapper (and the pointer it contains) across threads.
> -unsafe impl<T: PwmOps + Send> Send for Chip<T> {}
> +unsafe impl<T: PwmOps> Send for Chip<T> {}
> 
> // SAFETY: It is safe for multiple threads to have shared access (`&Chip`) because
> // the `Chip` data is immutable from the Rust side without holding the appropriate
> // kernel locks, which the C core is responsible for. Any interior mutability is
> // handled and synchronized by the C kernel code.
> -unsafe impl<T: PwmOps + Sync> Sync for Chip<T> {}
> +unsafe impl<T: PwmOps> Sync for Chip<T> {}
> 
> /// A resource guard that ensures `pwmchip_remove` is called on drop.
> ///
> /// This struct is intended to be managed by the `devres` framework by transferring its ownership
> /// via [`devres::register`]. This ties the lifetime of the PWM chip registration
> /// to the lifetime of the underlying device.
> -pub struct Registration<T: PwmOps> {
> +struct Registration<T: PwmOps> {
>     chip: ARef<Chip<T>>,
> }
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
> impl<T: PwmOps> Drop for Registration<T> {
>     fn drop(&mut self) {
>         let chip_raw = self.chip.as_raw();
> 
> ---
> base-commit: fae00ea9f00367771003ace78f29549dead58fc7
> change-id: 20251127-pwm_safe_register-e49b0a261101
> 
> 

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
