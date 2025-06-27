Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FB6C7EE31
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 12:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRc+8TTbxw8cR0yEVNh1KICJvucWlmG1IdPCSBpyX0Y=; b=c+YOils2nuPUcd
	i7Aa65JYE/JRkRyLKxxQkfxie3A+J7eg7KgC+ktAjTD7VWHy0XG5rf2yHolCrOIaOY9LUd6gkQRKs
	LxPaucpSNkRZZgeztD8T4VtNOBI/PUrmvfDVVJQiS425bDKVqy+VTJmamGKt1M0S1LK47dwtKcKBX
	8NGt0UfFUiTtzAQeMSWgYDRoOebYRaJZWkW5yWN0dpPmO3/BfD/TDm9XWhX1jNbh/NtsjO+HZ6m/7
	L7jQbYQ/om4Hcd/JjjZYWMC9Hvggno33UyS3c2s6nPYEjcYPXFyZ8XI8x8eOlc1AQMkJjaOGCosok
	Fw01wPiBWLNQgz9cSqrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8dm-0000000Ehkr-0VtQ;
	Fri, 27 Jun 2025 12:57:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7wt-0000000Ebnd-3AXP
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 12:12:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A96D5C6C5B;
	Fri, 27 Jun 2025 12:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6153C4CEE3;
	Fri, 27 Jun 2025 12:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751026374;
	bh=C6oegAaJ6Q9XOuL86FjJu5fzYxEuJUZ71dKO2pzkkNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sftZOyclg0UnjLvH59IBt3TWlpu4GVOW4KuMn8IEDuNrH2vgoHXZSa2IWzQCGGp+F
	 0iUvAhRQ8QbFdRyHnK3kbDHevMUO6/pDQ7eHfiAtXrWH9DIYuA/NwwCHmddErxrQvd
	 EhxQxR03CgCIJuprGt35iCoWpUVCp+i+9GYzHYmqCMamk57ZxzoAcZV10yeMpZGRgH
	 WbHRJ/tm6DnZBbQf0qPzqtq98A+E+4qpYoFnp9m+E+HUrLW2WRyDh3QCP2VZJ/mOph
	 ss/bWH7nlFaFJ5IAA3BwX3vWRvHMEvx3OjT+YMWHWPmbhgU0blePaRiruCixQxauZ7
	 sDQ1YZKaxcHNA==
Date: Fri, 27 Jun 2025 14:12:46 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Benno Lossin <lossin@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 2/9] rust: pwm: Add core 'Device' and 'Chip' object
 wrappers
Message-ID: <aF6Kvrk3UTC1Jj5Q@pollux>
References: <20250623-rust-next-pwm-working-fan-for-sending-v5-0-0ca23747c23e@samsung.com>
 <CGME20250623180859eucas1p10ebb40f33046d52618ba738ebbbaa664@eucas1p1.samsung.com>
 <20250623-rust-next-pwm-working-fan-for-sending-v5-2-0ca23747c23e@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623-rust-next-pwm-working-fan-for-sending-v5-2-0ca23747c23e@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_051255_879927_7239C93C 
X-CRM114-Status: GOOD (  15.35  )
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

On Mon, Jun 23, 2025 at 08:08:50PM +0200, Michal Wilczynski wrote:
> +    /// Gets the *typed* driver-specific data associated with this chip's embedded device.
> +    pub fn drvdata<T: 'static>(&self) -> &T {
> +        // SAFETY: `self.as_raw()` gives a valid pwm_chip pointer.
> +        // `bindings::pwmchip_get_drvdata` is the C function to retrieve driver data.
> +        let ptr = unsafe { bindings::pwmchip_get_drvdata(self.as_raw()) };
> +
> +        // SAFETY: The only way to create a chip is through Chip::new, which initializes
> +        // this pointer.
> +        unsafe { &*ptr.cast::<T>() }
> +    }
> +
> +    /// Sets the *typed* driver-specific data associated with this chip's embedded device.
> +    pub fn set_drvdata<T: 'static + ForeignOwnable>(&self, data: T) {
> +        // SAFETY: `self.as_raw()` gives a valid pwm_chip pointer.
> +        // `bindings::pwmchip_set_drvdata` is the C function to set driver data.
> +        // `data.into_foreign()` provides a valid `*mut c_void`.
> +        unsafe { bindings::pwmchip_set_drvdata(self.as_raw(), data.into_foreign().cast()) }
> +    }

I think this is unsound, e.g. what happens if someone calls set_drvdata() twice?
Then you leak the ForeignOwnable from the first call.

Anyways, this does not need to be public, you should just call
bindings::pwmchip_set_drvdata() once in Self::new().

Please also see [1], where I introduce generic accessors for drvdata for Device.

[1] https://lore.kernel.org/lkml/20250621195118.124245-3-dakr@kernel.org/

> +    /// Allocates and wraps a PWM chip using `bindings::pwmchip_alloc`.
> +    ///
> +    /// Returns an [`ARef<Chip>`] managing the chip's lifetime via refcounting
> +    /// on its embedded `struct device`.
> +    pub fn new<T: 'static + ForeignOwnable>(
> +        parent_dev: &device::Device,
> +        npwm: u32,
> +        sizeof_priv: usize,
> +	drvdata: T,
> +    ) -> Result<ARef<Self>> {
> +        // SAFETY: `parent_device_for_dev_field.as_raw()` is valid.
> +        // `bindings::pwmchip_alloc` returns a valid `*mut bindings::pwm_chip` (refcount 1)
> +        // or an ERR_PTR.
> +        let c_chip_ptr_raw =
> +            unsafe { bindings::pwmchip_alloc(parent_dev.as_raw(), npwm, sizeof_priv) };
> +
> +        let c_chip_ptr: *mut bindings::pwm_chip = error::from_err_ptr(c_chip_ptr_raw)?;
> +
> +        // Cast the `*mut bindings::pwm_chip` to `*mut Chip`. This is valid because
> +        // `Chip` is `repr(transparent)` over `Opaque<bindings::pwm_chip>`, and
> +        // `Opaque<T>` is `repr(transparent)` over `T`.
> +        let chip_ptr_as_self = c_chip_ptr.cast::<Self>();
> +
> +	// SAFETY: The pointer is valid, so we can create a temporary ref to set data.
> +        let chip_ref = unsafe { &*chip_ptr_as_self };
> +        chip_ref.set_drvdata(drvdata);
> +
> +        // SAFETY: `chip_ptr_as_self` points to a valid `Chip` (layout-compatible with
> +        // `bindings::pwm_chip`) whose embedded device has refcount 1.
> +        // `ARef::from_raw` takes this pointer and manages it via `AlwaysRefCounted`.
> +        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(chip_ptr_as_self)) })
> +    }
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
