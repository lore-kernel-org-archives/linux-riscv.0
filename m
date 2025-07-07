Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6053CC83F07
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 07:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRfUPKWY0tkUPH5LM4g6/VhMg0fueFAzvf9Zb6Ghnlg=; b=OTsLHU8PBAvwW3
	YoedrLkQE/fs3Ajr1zuM6Ymw47zS7JSu2ZI+QR+s/dBjj+HJfuRoPcSqOIUOa8tBxCZZOr1xeOnUh
	0z8+taY7CmbGEuLEt3cbnczslOcxtUxWh/5biO8887PwppNsrlgnWz9apxMX4+BOCwLzAmQmEz3KG
	kzLuTGzO/b/ujCKwGS3Z1NbyXHNRwTDu41X0NFaahJwYEPWGcjV5wtCyAEjty2KWjdetmHMUSBZbO
	arNFpcXQBXCG2aD8j3Vk92/9fn/2+8xs1J0/aK73/gk/FK4XAp2dYyTE5ySuofSfGzTR1i0GmjcS0
	A4hCcLd4MCMt7dHjLfiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgQN-00000001iJZ-3BEe;
	Mon, 07 Jul 2025 07:38:03 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgJ0-00000001gl7-1o8y
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 07:30:29 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250707073019euoutp02190c82c04e017e69ae1b26c806fb5d0b~P55fYL9ZU1280312803euoutp02g
	for <linux-riscv@lists.infradead.org>; Mon,  7 Jul 2025 07:30:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250707073019euoutp02190c82c04e017e69ae1b26c806fb5d0b~P55fYL9ZU1280312803euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751873419;
	bh=Q5MiDO4kvDAjyRPyePkrhFPW14vb6d7EHum8/0WQ8v4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=nTcmJlWE9ADFjtTB8/5dbhfElVYFVx1jEthmk7Ctq63wpWZA0y3SsvT87qm57mCtz
	 rUjt3bDhvweBckPVDFw5OznBTOS+vV7+8SZ9nHBpYZQENs4/FWNurFGCw+oFHkPpQ1
	 XHWI3W7f3PQJvFFlwDzHrIxWLH38TC9yfJ59Mtd0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250707073018eucas1p1a0c2e714826a2571f8c5281b8ef0457c~P55eomzep1941219412eucas1p1u;
	Mon,  7 Jul 2025 07:30:18 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250707073017eusmtip20a0a1f63bf89beef337da1edc73632c1~P55dgBGZm2165621656eusmtip2K;
	Mon,  7 Jul 2025 07:30:17 +0000 (GMT)
Message-ID: <002c8275-f17d-4a4e-b6b8-4dc74c4d510d@samsung.com>
Date: Mon, 7 Jul 2025 09:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] rust: pwm: Add complete abstraction layer
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
In-Reply-To: <aGpqqGMTU3a3O8cn@pollux>
X-CMS-MailID: 20250707073018eucas1p1a0c2e714826a2571f8c5281b8ef0457c
X-Msg-Generator: CA
X-RootMTR: 20250706114605eucas1p17d1cbd035d14d95f4ad0588c2572b3e2
X-EPHeader: CA
X-CMS-RootMailID: 20250706114605eucas1p17d1cbd035d14d95f4ad0588c2572b3e2
References: <20250706-rust-next-pwm-working-fan-for-sending-v9-0-42b5ac2101c7@samsung.com>
	<CGME20250706114605eucas1p17d1cbd035d14d95f4ad0588c2572b3e2@eucas1p1.samsung.com>
	<20250706-rust-next-pwm-working-fan-for-sending-v9-2-42b5ac2101c7@samsung.com>
	<aGpqqGMTU3a3O8cn@pollux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_003027_851052_294DE884 
X-CRM114-Status: GOOD (  24.11  )
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



On 7/6/25 14:23, Danilo Krummrich wrote:
> On Sun, Jul 06, 2025 at 01:45:13PM +0200, Michal Wilczynski wrote:
>> +/// Trait defining the operations for a PWM driver.
>> +pub trait PwmOps: 'static + Sized {
>> +    /// The type of the owned driver data (e.g., `Pin<KBox<...>>`).
>> +    type DrvData: 'static + ForeignOwnable;
>> +    /// The driver-specific hardware representation of a waveform.
>> +    ///
>> +    /// This type must be [`Copy`], [`Default`], and fit within `PWM_WFHWSIZE`.
>> +    type WfHw: Copy + Default;
>> +
>> +    /// Optional hook for when a PWM device is requested.
>> +    fn request(
>> +        _chip: &Chip<Self::DrvData>,
>> +        _pwm: &Device,
>> +        _parent_dev: &device::Device<Bound>,
>> +    ) -> Result {
>> +        Ok(())
>> +    }
>> +
>> +    /// Optional hook for when a PWM device is freed.
>> +    fn free(_chip: &Chip<Self::DrvData>, _pwm: &Device, _parent_dev: &device::Device<Bound>) {}
> 
> NIT: I can't think of a case providing this callback in Rust is useful. Do you
> have a clear use-case in mind? Otherwise, I'd not provide this callback until
> you have one. Should be trivial to add later on.
> 
>> +impl<T: PwmOps> Adapter<T> {
> 
> <snip>
> 
>> +    /// # Safety
>> +    ///
>> +    /// `dev` must be a valid pointer to a `bindings::device` embedded within a
>> +    /// `bindings::pwm_chip`. This function is called by the device core when the
>> +    /// last reference to the device is dropped.
>> +    unsafe extern "C" fn release_callback(dev: *mut bindings::device) {
>> +        // SAFETY: The function's contract guarantees that `dev` points to a `device`
>> +        // field embedded within a valid `pwm_chip`. `container_of!` can therefore
>> +        // safely calculate the address of the containing struct.
>> +        let c_chip_ptr = unsafe { container_of!(dev, bindings::pwm_chip, dev) };
>> +
>> +        // SAFETY: `c_chip_ptr` is a valid pointer to a `pwm_chip` as established
>> +        // above. Calling this FFI function is safe.
>> +        let drvdata_ptr = unsafe { bindings::pwmchip_get_drvdata(c_chip_ptr) };
>> +
>> +        if !drvdata_ptr.is_null() {
> 
> Is this check needed? I think one can't create a pwm::Chip instance without
> providing a T, so this pointer can't be NULL I think.
> 
>> +            // SAFETY: `drvdata_ptr` was stored by `Chip::new` from an owned `T::DrvData`
>> +            // and is guaranteed to be valid if non-null. `from_foreign` can safely
>> +            // reclaim ownership to allow Rust to drop and free the data.
>> +            let _owned_drvdata = unsafe { T::DrvData::from_foreign(drvdata_ptr.cast()) };
>> +        }
>> +    }
> 
> If you overwrite this callback (as you do below) you're leaking the memory
> allocated by pwmchip_alloc().
> 
> The simple way to solve this would be to call pwmchip_release() from here.

Thanks, a pwmchip_release() is static though, so it's either expose the
pwmchip_release in the header, or call kfree() here directly on pwmchip.

> 
> <snip>
> 
>> +impl<T: 'static + ForeignOwnable> Chip<T> {
>> +    /// Allocates and wraps a PWM chip using `bindings::pwmchip_alloc`.
>> +    ///
>> +    /// Returns an [`ARef<Chip>`] managing the chip's lifetime via refcounting
>> +    /// on its embedded `struct device`.
>> +    pub fn new<O: PwmOps<DrvData = T>>(
>> +        parent_dev: &device::Device,
>> +        npwm: u32,
>> +        sizeof_priv: usize,
>> +        drvdata: T,
>> +    ) -> Result<ARef<Self>> {
>> +        // SAFETY: `parent_device_for_dev_field.as_raw()` is valid.
>> +        // `bindings::pwmchip_alloc` returns a valid `*mut bindings::pwm_chip` (refcount 1)
>> +        // or an ERR_PTR.
>> +        let c_chip_ptr_raw =
>> +            unsafe { bindings::pwmchip_alloc(parent_dev.as_raw(), npwm, sizeof_priv) };
>> +
>> +        let c_chip_ptr: *mut bindings::pwm_chip = error::from_err_ptr(c_chip_ptr_raw)?;
>> +
>> +        // Set the custom release function on the embedded device. This is the crucial step
>> +        // to ensure `drvdata` is freed when the chip's refcount reaches zero, regardless
>> +        // of whether `Registration::register` was called.
>> +        // SAFETY: `c_chip_ptr` points to a valid chip.
>> +        unsafe { (*c_chip_ptr).dev.release = Some(Adapter::<O>::release_callback); }
> 
> This overwrites [1].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pwm/core.c?h=v6.16-rc4#n1601
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
