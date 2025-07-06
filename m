Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E541C83F03
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 12:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZo28/kDQb3EYk4giCf4GkehdfHLJe6W+kIMW77KChI=; b=2iZxiSdottkBpJ
	mve/pQrPy0MhTCAKxXBEDQUcSWb34Y7RHh1UhyBuVWs3CV7i3s+mEob8S/V0YlhEoQ12MTQruBpPG
	Y/X1vXrhV3TNTW4nUwOJIcwPkkiBSbxU6LwsfZ8GyHywqTwfPU78nE2K33odwNLD+7sADYWLwLtXb
	1RRGhnIjryh4KgsKXpSjkIRihk+2YN6gfuq3/gTGy2ZESK2lIfO8UlBPExADwUEcIro8fzG5TGwk9
	N7Rx88aqOxFYiRwdVPPSlInBUtwKzy7TG9cJgm6IRb0TedHYdfAGgAsJJu9hcb8Sc9IeZ8ZyiVTcS
	CXGFfyNIIxxLW67DnA3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYOOr-00000000EjA-39ic;
	Sun, 06 Jul 2025 12:23:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYOOo-00000000Eil-2ilH
	for linux-riscv@lists.infradead.org;
	Sun, 06 Jul 2025 12:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E0075C3EEB;
	Sun,  6 Jul 2025 12:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEFFC4CEED;
	Sun,  6 Jul 2025 12:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751804593;
	bh=N9UmR9j9pvw9tZRtfgFGkozm66WwP+U632CwPMwSDvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvKzmebUf9otplXwr5ryEJ4O83J9v6x8lvkereRCNeDd8gDPRBFo1mcWtF7/OX9LL
	 Bw1/h5LEZK6GU3oHQmZZfvmvId9/n4Bdbxn4Lcp0Ua8G3YgxAt/8zpxr3JI8VvP3JT
	 nKHL7qs8l+zj0k0M25yOxa1wl6xpsq8s9ph4q+Rz6SUCUqzO7Pa4HHzREUaA4qTUDA
	 JQ3R+egY/vsznt0t/gU82DuJE5eckmxDai8NSTOGByegZQ0luomY93iOS1hXJCkGi5
	 P10tVzcnjC6bfk1gresM7dcJOnCgcdmWNOI7wucpLFXPpmNwKAvssg9KU9j6tOA1eR
	 bPwoN9NSA4QPQ==
Date: Sun, 6 Jul 2025 14:23:04 +0200
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
Subject: Re: [PATCH v9 2/6] rust: pwm: Add complete abstraction layer
Message-ID: <aGpqqGMTU3a3O8cn@pollux>
References: <20250706-rust-next-pwm-working-fan-for-sending-v9-0-42b5ac2101c7@samsung.com>
 <CGME20250706114605eucas1p17d1cbd035d14d95f4ad0588c2572b3e2@eucas1p1.samsung.com>
 <20250706-rust-next-pwm-working-fan-for-sending-v9-2-42b5ac2101c7@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250706-rust-next-pwm-working-fan-for-sending-v9-2-42b5ac2101c7@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_052314_776022_38AF45A8 
X-CRM114-Status: GOOD (  18.49  )
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

On Sun, Jul 06, 2025 at 01:45:13PM +0200, Michal Wilczynski wrote:
> +/// Trait defining the operations for a PWM driver.
> +pub trait PwmOps: 'static + Sized {
> +    /// The type of the owned driver data (e.g., `Pin<KBox<...>>`).
> +    type DrvData: 'static + ForeignOwnable;
> +    /// The driver-specific hardware representation of a waveform.
> +    ///
> +    /// This type must be [`Copy`], [`Default`], and fit within `PWM_WFHWSIZE`.
> +    type WfHw: Copy + Default;
> +
> +    /// Optional hook for when a PWM device is requested.
> +    fn request(
> +        _chip: &Chip<Self::DrvData>,
> +        _pwm: &Device,
> +        _parent_dev: &device::Device<Bound>,
> +    ) -> Result {
> +        Ok(())
> +    }
> +
> +    /// Optional hook for when a PWM device is freed.
> +    fn free(_chip: &Chip<Self::DrvData>, _pwm: &Device, _parent_dev: &device::Device<Bound>) {}

NIT: I can't think of a case providing this callback in Rust is useful. Do you
have a clear use-case in mind? Otherwise, I'd not provide this callback until
you have one. Should be trivial to add later on.

> +impl<T: PwmOps> Adapter<T> {

<snip>

> +    /// # Safety
> +    ///
> +    /// `dev` must be a valid pointer to a `bindings::device` embedded within a
> +    /// `bindings::pwm_chip`. This function is called by the device core when the
> +    /// last reference to the device is dropped.
> +    unsafe extern "C" fn release_callback(dev: *mut bindings::device) {
> +        // SAFETY: The function's contract guarantees that `dev` points to a `device`
> +        // field embedded within a valid `pwm_chip`. `container_of!` can therefore
> +        // safely calculate the address of the containing struct.
> +        let c_chip_ptr = unsafe { container_of!(dev, bindings::pwm_chip, dev) };
> +
> +        // SAFETY: `c_chip_ptr` is a valid pointer to a `pwm_chip` as established
> +        // above. Calling this FFI function is safe.
> +        let drvdata_ptr = unsafe { bindings::pwmchip_get_drvdata(c_chip_ptr) };
> +
> +        if !drvdata_ptr.is_null() {

Is this check needed? I think one can't create a pwm::Chip instance without
providing a T, so this pointer can't be NULL I think.

> +            // SAFETY: `drvdata_ptr` was stored by `Chip::new` from an owned `T::DrvData`
> +            // and is guaranteed to be valid if non-null. `from_foreign` can safely
> +            // reclaim ownership to allow Rust to drop and free the data.
> +            let _owned_drvdata = unsafe { T::DrvData::from_foreign(drvdata_ptr.cast()) };
> +        }
> +    }

If you overwrite this callback (as you do below) you're leaking the memory
allocated by pwmchip_alloc().

The simple way to solve this would be to call pwmchip_release() from here.

<snip>

> +impl<T: 'static + ForeignOwnable> Chip<T> {
> +    /// Allocates and wraps a PWM chip using `bindings::pwmchip_alloc`.
> +    ///
> +    /// Returns an [`ARef<Chip>`] managing the chip's lifetime via refcounting
> +    /// on its embedded `struct device`.
> +    pub fn new<O: PwmOps<DrvData = T>>(
> +        parent_dev: &device::Device,
> +        npwm: u32,
> +        sizeof_priv: usize,
> +        drvdata: T,
> +    ) -> Result<ARef<Self>> {
> +        // SAFETY: `parent_device_for_dev_field.as_raw()` is valid.
> +        // `bindings::pwmchip_alloc` returns a valid `*mut bindings::pwm_chip` (refcount 1)
> +        // or an ERR_PTR.
> +        let c_chip_ptr_raw =
> +            unsafe { bindings::pwmchip_alloc(parent_dev.as_raw(), npwm, sizeof_priv) };
> +
> +        let c_chip_ptr: *mut bindings::pwm_chip = error::from_err_ptr(c_chip_ptr_raw)?;
> +
> +        // Set the custom release function on the embedded device. This is the crucial step
> +        // to ensure `drvdata` is freed when the chip's refcount reaches zero, regardless
> +        // of whether `Registration::register` was called.
> +        // SAFETY: `c_chip_ptr` points to a valid chip.
> +        unsafe { (*c_chip_ptr).dev.release = Some(Adapter::<O>::release_callback); }

This overwrites [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pwm/core.c?h=v6.16-rc4#n1601

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
