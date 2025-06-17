Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88208C7115B
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 15:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4VCjDcT5QMy16JJWLp35XSA9dJGLnpAqHswXVTme1M=; b=2QhlwSPHJCk/eI
	cKtUQF0GIwJrIkiIDMjKBboOKWDgEBNpHo03DENaqCJaPnNK35DUlImildiccLFhcq4NPRDr5X7zg
	3U4YewuuLC3Ywg2QIrvStKOAQYZEO+qBJNLh56b4/RoktAdB+s2fvpKQaaFYAKkpcZqRdvHNgZJhM
	WStoGSKZGYWMVK8rTBFCZHjx/uT7sQ8V95NC3Cti2hoayYaQ2fdZKrDMN/kSZXgEiq+8OBjfFW2kb
	U8ZT4x4ZHWI2UEUalDgzWSmlKPZlZfqhh0M0EbRgPNYZTYi2HWOG0PwpCU1Y0OjdnUbZPxiExqpXa
	LeJGlC5mOzvrH135DGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYJ3-00000007k33-0xyb;
	Tue, 17 Jun 2025 15:33:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXUs-00000007b9h-18RM
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 14:41:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C26C05C643D;
	Tue, 17 Jun 2025 14:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD93C4CEE3;
	Tue, 17 Jun 2025 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750171269;
	bh=XdJb0Fw4Rr6pT0ZoN+vrT8BJNFqp2n7RZt9bLdoicy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dSTCRk8Uwi677vKg6k6lOAWXdtA+M+meFSVzjlFArZ9bvcH54PzhYbqd7CJlg63T/
	 xJ0+p8rTVazZ6/wO72ITTYo2jiM5Tbugln+L3yIBtD9EBCyLvlK3Uf+wo/ABwAm3Vy
	 fPAoXHXkEsLyBw49G9HKJjcjV6mofeyhQa4lbM/8mb3sWMomcQgyA7/LvkGC8yKDG9
	 odnD5n9ZIAUz+x2GSLx7JB/j6pW2RBIQtlbDvHkin8zrtZV/xYDMLS6fmj6g31qdWG
	 HZkv+V2DMP0ZzeS0iAymfIqkXqCiWdwpzWqjTJXdU4eV1g/aaKOhKSpv5Kz+VAmX7Z
	 jrf/zUgEtABtw==
Date: Tue, 17 Jun 2025 16:41:00 +0200
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
Subject: Re: [PATCH v3 3/9] rust: pwm: Add driver operations trait and
 registration support
Message-ID: <aFF-fNOOEzoiomFu@pollux>
References: <20250617-rust-next-pwm-working-fan-for-sending-v3-0-1cca847c6f9f@samsung.com>
 <CGME20250617140838eucas1p2a31af5a73297580c2421263c1c6ba700@eucas1p2.samsung.com>
 <20250617-rust-next-pwm-working-fan-for-sending-v3-3-1cca847c6f9f@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250617-rust-next-pwm-working-fan-for-sending-v3-3-1cca847c6f9f@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_074110_396061_16647A9A 
X-CRM114-Status: GOOD (  17.25  )
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

On Tue, Jun 17, 2025 at 04:07:26PM +0200, Michal Wilczynski wrote:
> +/// Manages the registration of a PWM chip, ensuring `pwmchip_remove` is called on drop.
> +pub struct Registration {
> +    chip: ManuallyDrop<ARef<Chip>>,

Why is this ManuallyDrop when you call ManuallyDrop::drop(&mut self.chip) as
the last thing in Registration::drop()?

I think you don't need ManuallyDrop here.

> +}
> +
> +impl Registration {
> +    /// Registers a PWM chip (obtained via `Chip::new`) with the PWM subsystem.
> +    ///
> +    /// Takes an [`ARef<Chip>`]. On `Drop` of the returned `Registration` object,
> +    /// `pwmchip_remove` is called for the chip.
> +    pub fn new(chip: ARef<Chip>, ops_vtable: &'static PwmOpsVTable) -> Result<Self> {

For the reason mentioned in [1] this should either return Result<Devres<Self>>
or just Result, if you use Devres::new_foreign_owned() (see also [2]).

In case of the latter, the Registration instance is automatically dropped once
the parent device is unbound.

If you go with the first, you can drop the Devres<Registration> (and hence the
inner Registration) at any arbitrary point of time, but Devres will still
gurarantee that the inner Registration is dropped once the parent device is
unbound, i.e. it can't out-live driver unbind.

This guarantees that the &Device<Bound> instance you provide in the callbacks
below is guaranteed to be valid.

[1] https://lore.kernel.org/lkml/aFF7qqlexxh540FW@pollux/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/drm/driver.rs#n134

> +        // Get the raw C pointer from ARef<Chip>.
> +        let c_chip_ptr = chip.as_raw().cast::<bindings::pwm_chip>();
> +
> +        // SAFETY: `c_chip_ptr` is valid (guaranteed by ARef existing).
> +        // `ops_vtable.as_raw()` provides a valid `*const bindings::pwm_ops`.
> +        // `bindings::__pwmchip_add` preconditions (valid pointers, ops set on chip) are met.
> +        unsafe {
> +            (*c_chip_ptr).ops = ops_vtable.as_raw();
> +            to_result(bindings::__pwmchip_add(c_chip_ptr, core::ptr::null_mut()))?;
> +        }

Please split this up into separate unsafe blocks.

> +        Ok(Registration {
> +            chip: ManuallyDrop::new(chip),
> +        })
> +    }
> +}
> +
> +impl Drop for Registration {
> +    fn drop(&mut self) {
> +        let chip = &**self.chip;
> +        let chip_raw: *mut bindings::pwm_chip = chip.as_raw();
> +
> +        // SAFETY: `chip_raw` points to a chip that was successfully registered via `Self::new`.
> +        // `bindings::pwmchip_remove` is the correct C function to unregister it.
> +        unsafe {
> +            bindings::pwmchip_remove(chip_raw);
> +            ManuallyDrop::drop(&mut self.chip); // Drops the ARef<Chip>
> +        }

Same here, but I don't think ManuallyDrop is needed anyways.

> +    }
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
