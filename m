Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771D5C7115A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 15:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TbLzMioIQPeAnlNsCHw8wU3suxlrsR1BqWj5kHD9r8Q=; b=cJg2fTSCe1stYG
	ElSuSgVKRRf30VpfFm3MkmqX9D2PW6xAn+381uA/2pPifsHqTfl42ttIhrgt1T9OrsPW6Lqg3fhgN
	/S61ldTCbdYREXQu2fsvYmY90kDPVJYoouicup5Ienx7WsaZTkIF89NtPT+zViwIqvVye9I8uPfcc
	ciKGY1Rrb/giRWLtG7sftmPx/evrZNtpHMj0J3dD210n1gVsP3iLKhz8pzUYGFjfADGqy8rvUNued
	RS1HDqiOfgHX/39FvZeUcWOdkDRKOwqWlmmzDpSuu4eY94OrRGIoO5/gVxdjdWo17VAAbMIaQr+Ot
	u3a9i2xffwrsulvoBGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHTa-0000000DUtM-47Dh;
	Thu, 19 Jun 2025 15:46:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEEl-0000000D1RM-25SU
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 12:19:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 701895C6691;
	Thu, 19 Jun 2025 12:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C403C4CEEA;
	Thu, 19 Jun 2025 12:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750335562;
	bh=wOtxYd7FeByenB+qByLpAwEF4ztZQ/PR/wXrB5umFwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2sVfizp/8RjiMYlKKqsnF7R2f5DhvS65P6lko53nexYpYpd6ASNO5gMQTW1b6wF9
	 zPwiLBsX5cLhpZiCkZgzQVQOdQcMQm5H1vnJNo6bpRo7GX9qHdPkm2JwDVidusIK5D
	 Z6w2GJcarqXOat8r5iPWVfDEUaiBoZyw52kVkR9sCXSqkMERPv1qaKj3KNDARM2VQD
	 Vm6vnpZ7uzpVGuZO5tF7zbSQE1TOxg29rM8rHEykwQZpestS8+PRf4NHPYVvWOL/3e
	 VEg8L8mom599SmeL2gzNC+Fe2XHzh4jLy0k0Q4NnjvunpJIwOrwDwoFWZdWUkggm8k
	 SwdbZMnO/3p+A==
Date: Thu, 19 Jun 2025 14:19:14 +0200
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
Subject: Re: [PATCH v4 4/9] pwm: Add Rust driver for T-HEAD TH1520 SoC
Message-ID: <aFQAQlB6gG3CElcN@pollux>
References: <20250618-rust-next-pwm-working-fan-for-sending-v4-0-a6a28f2b6d8a@samsung.com>
 <CGME20250618122807eucas1p22d41cd6a9ac5131d91d41dfb09b8c92a@eucas1p2.samsung.com>
 <20250618-rust-next-pwm-working-fan-for-sending-v4-4-a6a28f2b6d8a@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618-rust-next-pwm-working-fan-for-sending-v4-4-a6a28f2b6d8a@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_051923_613750_CA999023 
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

On Wed, Jun 18, 2025 at 02:27:37PM +0200, Michal Wilczynski wrote:

<snip>

> +    fn write_waveform(
> +        chip: &pwm::Chip,
> +        pwm: &pwm::Device,
> +        wfhw: &Self::WfHw,
> +        parent_dev: &Device<Bound>,
> +    ) -> Result {
> +        let data: &Self = chip.drvdata().ok_or(EINVAL)?;

<snip>

> +impl platform::Driver for Th1520PwmPlatformDriver {
> +    type IdInfo = ();
> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
> +
> +    fn probe(
> +        pdev: &platform::Device<Core>,
> +        _id_info: Option<&Self::IdInfo>,
> +    ) -> Result<Pin<KBox<Self>>> {
> +        let dev = pdev.as_ref();
> +        let resource = pdev.resource(0).ok_or(ENODEV)?;
> +        let iomem = pdev.ioremap_resource_sized::<TH1520_PWM_REG_SIZE>(resource)?;
> +        let clk = Clk::get(pdev.as_ref(), None)?;
> +
> +        clk.prepare_enable()?;
> +
> +        // TODO: Get exclusive ownership of the clock to prevent rate changes.
> +        // The Rust equivalent of `clk_rate_exclusive_get()` is not yet available.
> +        // This should be updated once it is implemented.
> +        let rate_hz = clk.rate().as_hz();
> +        if rate_hz == 0 {
> +            dev_err!(dev, "Clock rate is zero\n");
> +            return Err(EINVAL);
> +        }
> +
> +        if rate_hz > time::NSEC_PER_SEC as usize {
> +            dev_err!(
> +                dev,
> +                "Clock rate {} Hz is too high, not supported.\n",
> +                rate_hz
> +            );
> +            return Err(ERANGE);
> +        }
> +
> +        let chip = pwm::Chip::new(dev, MAX_PWM_NUM, 0)?;
> +
> +        let drvdata = KBox::new(Th1520PwmDriverData { iomem, clk }, GFP_KERNEL)?;
> +        chip.set_drvdata(drvdata);

Sorry that I didn't spot this before: Is there a reason you can't pass drvdata
directly to pwm::Chip::new()?

If not, you can initialize the pwm::Chip's drvdata on creation of the pwm::Chip.

This has the advantage that your chip.drvdata() (see write_waveform() above)
becomes infallible.

(If there are reasons this isn't possible, there are other potential solutions
to avoid chip.drvdata() to return an Option.)

> +
> +        pwm::Registration::new_foreign_owned(dev, chip, &TH1520_PWM_OPS)?;
> +
> +        Ok(KBox::new(Th1520PwmPlatformDriver, GFP_KERNEL)?.into())
> +    }
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
