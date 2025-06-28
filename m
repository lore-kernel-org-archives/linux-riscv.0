Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F931C7EE39
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jun 2025 15:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/GjrtCa8augZLkdLYgYUC//NN8LCtDgKrCfaaUYyYY=; b=zDfZghVhOksQg9
	cGusxSgc/Vl4GEk1xAi7OOcI0iHFzb+GAJ1Wimwd+sIzgN14did1FntE1MuJtsB+j9nnKRHRdYz92
	oDJWd5q5LotGhbRFviU8TT2eA6ulbqtiQajRixBl05awBodluWeZjH+cJcugCfbd74bSjSZD3F9t3
	JuEhNwKD7IABTihuQ/0JRKFwLF2duu6suNX0mHJsSOB89wkQTarEyL848Zy9XcG9mE2ktsb6ZPdQH
	HtyBqHVPMOdWsHDmViY1kZPgbTfoli8NKm0noWEJyHQHF6L+Yo/zGXODidmpG0SZqkUx/ZX+ltonN
	mTiX09eFSX5ibaCNCl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVXHH-0000000GwhD-37By;
	Sat, 28 Jun 2025 15:15:39 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVX2G-0000000GvRj-40Ho
	for linux-riscv@lists.infradead.org;
	Sat, 28 Jun 2025 15:00:11 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250628150000euoutp028e699506b44881f09d6926182d0631d2~NPOilRCuW0811708117euoutp02F
	for <linux-riscv@lists.infradead.org>; Sat, 28 Jun 2025 15:00:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250628150000euoutp028e699506b44881f09d6926182d0631d2~NPOilRCuW0811708117euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751122800;
	bh=iPLiuotXR3pLvhRQOSqtXf5NifLPkVWrQ6ZXxbZuw3Q=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=mSr5CnBZRzfx6aAp1yHyfCqkZDU3yQrUc9FGDXIfhXuN/5RNTxpqMWbve4iE44X3c
	 z28wZiTlUzWA34JXyivzg5KHAdNqjX1PbVJbSJHmk2NQfq6nF/X9JKKJ9MGtuPDZz3
	 FSj3tcn/dUE8FYlgx+2howgQo/6AQQnGbtkGw8oE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250628145958eucas1p2a6252159d9e210271037f04a5f64bcf2~NPOhNrPea2071620716eucas1p2L;
	Sat, 28 Jun 2025 14:59:58 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250628145957eusmtip27308016313ad13db5410a2ce67c9e323~NPOgCb8Jg2822428224eusmtip2D;
	Sat, 28 Jun 2025 14:59:57 +0000 (GMT)
Message-ID: <08b44fb5-1dad-4cc8-a843-85ac2fa6b7e9@samsung.com>
Date: Sat, 28 Jun 2025 16:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] rust: pwm: Add core 'Device' and 'Chip' object
 wrappers
To: Danilo Krummrich <dakr@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Drew Fustini <drew@pdp7.com>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
	Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, Benno
	Lossin <lossin@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <aF6Kvrk3UTC1Jj5Q@pollux>
X-CMS-MailID: 20250628145958eucas1p2a6252159d9e210271037f04a5f64bcf2
X-Msg-Generator: CA
X-RootMTR: 20250623180859eucas1p10ebb40f33046d52618ba738ebbbaa664
X-EPHeader: CA
X-CMS-RootMailID: 20250623180859eucas1p10ebb40f33046d52618ba738ebbbaa664
References: <20250623-rust-next-pwm-working-fan-for-sending-v5-0-0ca23747c23e@samsung.com>
	<CGME20250623180859eucas1p10ebb40f33046d52618ba738ebbbaa664@eucas1p1.samsung.com>
	<20250623-rust-next-pwm-working-fan-for-sending-v5-2-0ca23747c23e@samsung.com>
	<aF6Kvrk3UTC1Jj5Q@pollux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_080009_602450_82F0A6EA 
X-CRM114-Status: GOOD (  19.14  )
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



On 6/27/25 14:12, Danilo Krummrich wrote:
> On Mon, Jun 23, 2025 at 08:08:50PM +0200, Michal Wilczynski wrote:
>> +    /// Gets the *typed* driver-specific data associated with this chip's embedded device.
>> +    pub fn drvdata<T: 'static>(&self) -> &T {
>> +        // SAFETY: `self.as_raw()` gives a valid pwm_chip pointer.
>> +        // `bindings::pwmchip_get_drvdata` is the C function to retrieve driver data.
>> +        let ptr = unsafe { bindings::pwmchip_get_drvdata(self.as_raw()) };
>> +
>> +        // SAFETY: The only way to create a chip is through Chip::new, which initializes
>> +        // this pointer.
>> +        unsafe { &*ptr.cast::<T>() }
>> +    }
>> +
>> +    /// Sets the *typed* driver-specific data associated with this chip's embedded device.
>> +    pub fn set_drvdata<T: 'static + ForeignOwnable>(&self, data: T) {
>> +        // SAFETY: `self.as_raw()` gives a valid pwm_chip pointer.
>> +        // `bindings::pwmchip_set_drvdata` is the C function to set driver data.
>> +        // `data.into_foreign()` provides a valid `*mut c_void`.
>> +        unsafe { bindings::pwmchip_set_drvdata(self.as_raw(), data.into_foreign().cast()) }
>> +    }
> 
> I think this is unsound, e.g. what happens if someone calls set_drvdata() twice?
> Then you leak the ForeignOwnable from the first call.
> 
> Anyways, this does not need to be public, you should just call
> bindings::pwmchip_set_drvdata() once in Self::new().
> 
> Please also see [1], where I introduce generic accessors for drvdata for Device.

Thanks, it would be a great idea to update the code after below patchset
is merged.

> 
> [1] https://lore.kernel.org/lkml/20250621195118.124245-3-dakr@kernel.org/
> 
>> +    /// Allocates and wraps a PWM chip using `bindings::pwmchip_alloc`.
>> +    ///
>> +    /// Returns an [`ARef<Chip>`] managing the chip's lifetime via refcounting
>> +    /// on its embedded `struct device`.
>> +    pub fn new<T: 'static + ForeignOwnable>(
>> +        parent_dev: &device::Device,
>> +        npwm: u32,
>> +        sizeof_priv: usize,
>> +	drvdata: T,
>> +    ) -> Result<ARef<Self>> {
>> +        // SAFETY: `parent_device_for_dev_field.as_raw()` is valid.
>> +        // `bindings::pwmchip_alloc` returns a valid `*mut bindings::pwm_chip` (refcount 1)
>> +        // or an ERR_PTR.
>> +        let c_chip_ptr_raw =
>> +            unsafe { bindings::pwmchip_alloc(parent_dev.as_raw(), npwm, sizeof_priv) };
>> +
>> +        let c_chip_ptr: *mut bindings::pwm_chip = error::from_err_ptr(c_chip_ptr_raw)?;
>> +
>> +        // Cast the `*mut bindings::pwm_chip` to `*mut Chip`. This is valid because
>> +        // `Chip` is `repr(transparent)` over `Opaque<bindings::pwm_chip>`, and
>> +        // `Opaque<T>` is `repr(transparent)` over `T`.
>> +        let chip_ptr_as_self = c_chip_ptr.cast::<Self>();
>> +
>> +	// SAFETY: The pointer is valid, so we can create a temporary ref to set data.
>> +        let chip_ref = unsafe { &*chip_ptr_as_self };
>> +        chip_ref.set_drvdata(drvdata);
>> +
>> +        // SAFETY: `chip_ptr_as_self` points to a valid `Chip` (layout-compatible with
>> +        // `bindings::pwm_chip`) whose embedded device has refcount 1.
>> +        // `ARef::from_raw` takes this pointer and manages it via `AlwaysRefCounted`.
>> +        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(chip_ptr_as_self)) })
>> +    }
>> +}
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
