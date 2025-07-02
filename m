Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6710EC83F04
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 16:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OFYkZPSR/NiFc1wLpBb5iGxoQ2kZoeaDdJp6Ye9CP6g=; b=lVRXDzEZoxivt1
	4faEUiCV42LZc6Ws13qz0fdLdf0NEty/1lJGSOC3aqPcY9anINdGJPlI4+o5eFsWi8g/5E0ojzW+2
	6T98DzJW95nsxqDrJYUrOBt3lhql6KJTX4DB3iynYOlSlfYGKk5pYkFDDU13JTRKfQYrUb608Ds/X
	Xq+7VAzMOrTAeSZXJri2FO64dy2DmqW7c7EYwQsY53DV8fxPxZ0gJyPF2EyaAoCiMWsb5iUaNezwG
	IE7aew40wQyPuxpLDJQssNa8AoSADGttd9kjJd5/AE6Ar+MaxGCOTBts8U1BU8BOegiOU9xl6nY9L
	BGWo+qOAmdhgVjTzbQAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0AI-00000008vZX-3KTM;
	Wed, 02 Jul 2025 16:18:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzGn-00000008lV0-2Fu2
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 15:21:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DB605C578A;
	Wed,  2 Jul 2025 15:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A127C4CEE7;
	Wed,  2 Jul 2025 15:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751469668;
	bh=M/1qI026Rf8MHuDJoLIxqcQbHcw9InNMCIRG1daBlW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gt1ABjjID7Yl1S93DXNEXXx9Gu+slXGI3XlUkze9+VdPfBrRji29vH/Za7ojXIyJc
	 NoY/8Kk5iCroXeRw/044bIbHoRswoHsJy00tTHMdd1NAnNLUdJg0rNQvTJQNRoa9Vk
	 oEjZWsS/9UOnwcmtp+bEdcCepAJJ1B4kb1zCN2LG1SUT3mtc2IoqUnW2p1WwAm+aBU
	 kUKnxBuGnEEuO9FWQHj+ewubg6e7wXbxE7icOT9PkwujBlhN8Kwtdx2p0aFiwVd+FD
	 rthuZtHy4zRT/tsB04nNnve7FTpvTj7Q0Dppc1lF1c4kvsndaOBiafeh1s4WRaKNNR
	 dih7Dip1xrTLg==
Date: Wed, 2 Jul 2025 17:21:00 +0200
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
Subject: Re: [PATCH v7 4/8] rust: pwm: Add driver operations trait and
 registration support
Message-ID: <aGVOXNqnSjCm8fQl@pollux>
References: <20250702-rust-next-pwm-working-fan-for-sending-v7-0-67ef39ff1d29@samsung.com>
 <CGME20250702134958eucas1p26baf0f661006f5b79c31b2afa683baee@eucas1p2.samsung.com>
 <20250702-rust-next-pwm-working-fan-for-sending-v7-4-67ef39ff1d29@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702-rust-next-pwm-working-fan-for-sending-v7-4-67ef39ff1d29@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082109_671721_680C3C9D 
X-CRM114-Status: GOOD (  12.90  )
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

On Wed, Jul 02, 2025 at 03:45:32PM +0200, Michal Wilczynski wrote:
> +impl Registration {
> +    /// Registers a PWM chip with the PWM subsystem.
> +    ///
> +    /// Transfers its ownership to the `devres` framework, which ties its lifetime
> +    /// to the parent device.
> +    /// On unbind of the parent device, the `devres` entry will be dropped, automatically
> +    /// calling `pwmchip_remove`. This function should be called from the driver's `probe`.
> +    pub fn register(
> +        dev: &device::Device<Bound>,
> +        chip: ARef<Chip>,
> +        ops_vtable: &'static PwmOpsVTable,
> +    ) -> Result {

One thing I did miss here: Given that this should give us the guarantee that the
parent device of the Chip is always bound, you have to add a check for this
here, i.e. fail if `dev.as_raw() != chip.parent().as_raw()`.

> +        let c_chip_ptr = chip.as_raw();
> +
> +        // SAFETY: `c_chip_ptr` is valid because the `ARef<Chip>` that owns it exists.
> +        // The vtable pointer is also valid. This sets the `.ops` field on the C struct.
> +        unsafe {
> +            (*c_chip_ptr).ops = ops_vtable.as_raw();
> +        }
> +
> +        // SAFETY: `c_chip_ptr` points to a valid chip with its ops initialized.
> +        // `__pwmchip_add` is the C function to register the chip with the PWM core.
> +        unsafe {
> +            to_result(bindings::__pwmchip_add(c_chip_ptr, core::ptr::null_mut()))?;
> +        }
> +
> +        let registration = Registration { chip };
> +
> +        devres::register(dev, registration, GFP_KERNEL)
> +    }
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
