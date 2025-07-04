Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E51C83F0B
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 15:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKf65OIbql11f4gBO2BK/cQFtN9nCPH0CFAJ8s5RYEU=; b=2Gr7JNV8U3DZ0X
	UoqXGGU5SdBlCL2c3KPVgTnCloZdzp0w+E1D64gUYXhJ2y8TjGBr9nNSkS0mJcan++5VGCkPVGHNu
	NIrGT1N0BokJkdSVB0LCKbFOIXp9VfglvZyzHcJZv6gzm54P08qfcT0dwMnTunUZEsOHmbXSnZQS7
	/t8nTRJbULr4jluFpUAc4x0qRSHSkLHytmRVNEQBSOb03oplghaftS/RVRFzZgqhvUYZknQ0fncJ9
	hihpDaHUuHwwCMoKh+LV5PZKqbdbPHuowjj0Q/8Co/fuvWyYqDWL1B+fYJN3L7/igvbGPzF1OspxF
	L7nk9g5CCMujcL/qqLdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiEl-0000000Eo5M-0oDR;
	Fri, 04 Jul 2025 15:22:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi5V-0000000EmcW-148k
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 15:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F4CC5C55BE;
	Fri,  4 Jul 2025 15:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA33FC4CEE3;
	Fri,  4 Jul 2025 15:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751641948;
	bh=hZ10LiY5FNP/Dp6S+DBqAzx6uQgjXZaS8IlUwEsCGJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hhI3At/YWlFOPWeQNgWpOK/z7lt5fmnRr4cDgf1YXwCzaIRmj36teIkXdk7vE86Yt
	 NQaVta+0qbjEWCt/cT9wzERra7juB8zjgR7V2k/ukkD63VLKuDw+9Oo6W9quS3s7Zv
	 xO3423zNVGe9iqbpSlSXMLV+N5484Ts6ILuRp7iIiPxYpqQFjPXb3vmbOjQBHrNVWR
	 UIl/QOTjK9iUzBsfpRaZPNscXPlIZnEuCr9Ljx7zP0JfPDSNXEF/o+dJEiqxZgOB88
	 eRGMJOBnjk6stxn3bVpqeCjPrOeZxL2WG+MMbxUZ8EqkZsE57LfLXjv/EbQA0EGwpD
	 uzpEujK8cHkVQ==
Date: Fri, 4 Jul 2025 17:12:20 +0200
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
Subject: Re: [PATCH v8 2/7] rust: pwm: Add core 'Device' and 'Chip' object
 wrappers
Message-ID: <aGfvVMBpNoFEJEgC@pollux>
References: <20250704-rust-next-pwm-working-fan-for-sending-v8-0-951e5482c9fd@samsung.com>
 <CGME20250704120212eucas1p1c9ffeefa41b0ddb27db74d26174831bf@eucas1p1.samsung.com>
 <20250704-rust-next-pwm-working-fan-for-sending-v8-2-951e5482c9fd@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250704-rust-next-pwm-working-fan-for-sending-v8-2-951e5482c9fd@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_081229_382339_7AFDBE96 
X-CRM114-Status: GOOD (  14.43  )
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

On Fri, Jul 04, 2025 at 02:01:12PM +0200, Michal Wilczynski wrote:
> +impl<T: 'static + ForeignOwnable> Chip<T> {
> +    /// Allocates and wraps a PWM chip using `bindings::pwmchip_alloc`.
> +    ///
> +    /// Returns an [`ARef<Chip>`] managing the chip's lifetime via refcounting
> +    /// on its embedded `struct device`.
> +    pub fn new(
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
> +        // Cast the `*mut bindings::pwm_chip` to `*mut Chip`. This is valid because
> +        // `Chip` is `repr(transparent)` over `Opaque<bindings::pwm_chip>`, and
> +        // `Opaque<T>` is `repr(transparent)` over `T`.
> +        let chip_ptr_as_self = c_chip_ptr.cast::<Self>();
> +
> +        // SAFETY: The pointer is valid, so we can create a temporary ref to set data.
> +        let chip_ref = unsafe { &*chip_ptr_as_self };
> +        // SAFETY: `chip_ref` points to a valid chip from `pwmchip_alloc` and `drvdata` is a valid,
> +        // owned pointer from `ForeignOwnable` to be stored in the chip's private data.
> +        unsafe { bindings::pwmchip_set_drvdata(chip_ref.as_raw(), drvdata.into_foreign().cast()) }

I think that's great now, but you're missing one last piece: You have to ensure
that drvdata is freed eventually. Here you call into_foreign(), but I think
you're missing from_foreign() in pwm_ops::free.

You also have to ensure that your pwm_ops::free() callback is properly called if
a Chip<T> is dropped *before* it has been registered.

Note that, since Chip is now generic over T, you can easily make the
PwmOpsVTable a const within Chip and set the vtable in Chip::new().

See also how drm::Device does this in [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/drm/device.rs

> +
> +        // SAFETY: `chip_ptr_as_self` points to a valid `Chip` (layout-compatible with
> +        // `bindings::pwm_chip`) whose embedded device has refcount 1.
> +        // `ARef::from_raw` takes this pointer and manages it via `AlwaysRefCounted`.
> +        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(chip_ptr_as_self)) })
> +    }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
