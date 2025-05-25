Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879ABC54E90
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 12:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+9pe01cEKcIuO8OC++GacqIcbjkFi80mgEM1/onQJo=; b=se/nfDHCXoulXX
	CJckrgK9qlMthGaGyVr71WqSD3dp6IeGK02M/+AUWNF40pVLzir/F64ZZrS8PBescSZZCCb7xl1jw
	ZYRC7nl9uTtfkbmfnfwVqYstIpz/2nOw41owOfG42L7PcB9JNCN2CEcKlZWiEff0GHfsID/y/VcG8
	e8/88vqECdrJUX0HsEofRoLxsDHrkv3QNz5gAdwI+X9M4kRHYYnJLoA0UuOdEcExCQN/UlwWmHfFv
	9/ioNqb3PsTC8jkZS7eIzr5JHmInpugIzxQGVWQFzy8h7jYfeFlJc+9tkhMQu7Y0L9LfGNw1DZtgH
	k8YoQb08ybfQivTSP2BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJA4q-000000072kI-3d60;
	Sun, 25 May 2025 12:03:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJA4p-000000072jw-03UG
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 12:03:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3854B5C12AC;
	Sun, 25 May 2025 12:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3982C4CEEA;
	Sun, 25 May 2025 12:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748174617;
	bh=ZroNZhDGWJdIoldyG/mgeggU87AzdoTiS+PmGR/PpdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FxyrIgloPxQEkwU/Tn8ICqbDkMKIEsHYjtig4BDG8X627bskdEvhXJB63YMq81H+q
	 A7ueDYXb9mKQwGU2uy72aetT0wubSV6eu1PEQkwavQ2as5t+P87lGWcEK0hLKrmFMx
	 TtDA5/mXAhyH8N8tHeKq/f/45Hl2F1TpDsIG3rTpKnu3rqXbq0wpKOs/IdWN35ZnoL
	 hbHZjbgLeRCSe0QebuwBZjzESJin8R8rKvWQbwp/ChV6AiETfbWXsjcUjM74d0dDMj
	 y7QOdo0yq62XXQ9BzBVxAcT6k6UcCySdzLY4vpnipb4MxjYNX+FrCvyEKTOeqId6mP
	 UVrLZrF4/QB8A==
Date: Sun, 25 May 2025 14:03:29 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
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
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 2/6] pwm: Add Rust driver for T-HEAD TH1520 SoC
Message-ID: <aDMHEcpJn8nyJHFV@pollux.localdomain>
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <CGME20250524211521eucas1p1929a51901c91d1a37e9f4c2da86ff7b0@eucas1p1.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-2-bdd2d5094ff7@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250524-rust-next-pwm-working-fan-for-sending-v1-2-bdd2d5094ff7@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_050339_142890_603FAF54 
X-CRM114-Status: GOOD (  14.23  )
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

On Sat, May 24, 2025 at 11:14:56PM +0200, Michal Wilczynski wrote:
> diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..4665e293e8d0bdc1a62a4e295cdaf4d47b3dd134
> --- /dev/null
> +++ b/drivers/pwm/pwm_th1520.rs
> @@ -0,0 +1,272 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2025 Samsung Electronics Co., Ltd.
> +// Author: Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +//! Rust T-HEAD TH1520 PWM driver
> +use kernel::{c_st
> +
> +struct Th1520PwmChipData {
> +    clk: Clk,
> +    iomem: kernel::devres::Devres<IoMem<0>>,

Why IoMem<0>? If you put the expected memory region size for this chip instead
all your subsequent accesses can be iomem.write() / iomem.read() rather than the
fallible try_{read,write}() variants.

> +impl Th1520PwmChipData {
> +    fn _config(
> +        &self,
> +        hwpwm: u32,
> +        duty_ns: u64,
> +        period_ns: u64,
> +        target_polarity: pwm::Polarity,
> +    ) -> Result<u32> {
> +        let regs = self.iomem.try_access().ok_or_else(|| {
> +            pr_err!("PWM-{}: Failed to access I/O memory in _config\n", hwpwm);

Here and throughout the whole driver, please use the dev_*!() print macros.
Drivers have no reason to use the pr_*!() macros.

> +impl pwm::PwmOps for Th1520PwmChipData {
> +    // This driver implements get_state
> +    fn apply(
> +        pwm_chip_ref: &mut pwm::Chip,
> +        pwm_dev: &mut pwm::Device,
> +        target_state: &pwm::State,
> +    ) -> Result {

I assume those callbacks can't race with pwmchip_remove() called from driver
remove()? I.e. the callbacks are guaranteed to complete before pwmchip_remove()
completes?

If so, this function signature can provide the parent device of the pwm::Chip as
device::Device<device::Bound> reference.

This would allow you to access iomem more efficiently.

Instead of

	data.iomem.try_access()

you could do

	data.iomem.access(parent) // [1]

which does get you rid of the atomic check and the RCU read side critical
section implied by try_access().

Actually, I should have added this comment and explanation to the abstraction
patch, but forgot about it. :)

[1] https://gitlab.freedesktop.org/drm/kernel/-/blob/drm-next/rust/kernel/devres.rs?ref_type=heads#L213

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
