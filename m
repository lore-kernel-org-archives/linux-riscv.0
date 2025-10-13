Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B13CCA476
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 10:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XV+T51DBTDwUQdMlF1jqnzACOii4yCwoKZPNPSOL1bU=; b=BG6SHSjpaXNAJ6
	RcZF0yW2DgiOl4klfIX9dViIcbtmrkvaIeqsZKHGsQvF/BibudFd6Ni66XRAZrAA/sSLAGUx0btYR
	wOt5TrxZBsDDFk+mhHXdjBbxGCPC3ym14sjFCez9wxog0Fn/YtaVLuc11j6ej0xI9g1UjGnMJqv3N
	B+GfVQ0XMl6mCj0jTiJrXvyAe1wnHbvIzmPqiac0F39CQ441a4Bdi+W0kW8345vl0tVS/dpmkE/P6
	x6jegi3um1S6lNjupz4NtCVvTGlasPftcejGY6L+kk35R+bKJrXStzL+nB3WAV/1Q70BQU0XW7b1u
	DjgPbI9ctvOogj4dHXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Fio-0000000CtsD-3QKA;
	Mon, 13 Oct 2025 10:24:06 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Fil-0000000Ctrn-0nSE
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 10:24:06 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251013102359euoutp023e68355ce66384b62b7bb0a4107f899c~uBfGWzx0D2908829088euoutp02k
	for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 10:23:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251013102359euoutp023e68355ce66384b62b7bb0a4107f899c~uBfGWzx0D2908829088euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760351039;
	bh=UnxQhZSRzfDFHS/D+zsLXL9vQESyx9y8MHFtVnINwB8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=hczjRAc5sAsVVuqk7io4cMp5EeDgpCA4y2nrzojt/HHD6vfIIrHk/yXAXJFt/3sDP
	 rJUiuJntpffugfk2DSER0bFeEBE0KItThToljffG4WPrxIqTMDv+KnQyXfbVjbJyH1
	 QOZBhgKOxp9T50pE8M3yjrNrOx77ZgypB6bB+H/g=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251013102358eucas1p2bf340beaea688bfc2ec0d85019598612~uBfFerfHD2166621666eucas1p2X;
	Mon, 13 Oct 2025 10:23:58 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251013102357eusmtip11cff881700a54a60ed0370ce2fe7b2be~uBfEVhpjC1713817138eusmtip1I;
	Mon, 13 Oct 2025 10:23:57 +0000 (GMT)
Message-ID: <bf7cf406-cf4c-415e-b70d-4ffc1f15835d@samsung.com>
Date: Mon, 13 Oct 2025 12:23:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
	Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, Benno
	Lossin <lossin@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Drew Fustini <fustini@kernel.org>, Daniel Almeida
	<daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, Elle Rhumsaa <elle@weathered-steel.dev>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250930-rust-next-pwm-working-fan-for-sending-v15-0-5661c3090877@samsung.com>
X-CMS-MailID: 20251013102358eucas1p2bf340beaea688bfc2ec0d85019598612
X-Msg-Generator: CA
X-RootMTR: 20250930122729eucas1p2c4f1c07a4a504a59ba691b407a39420d
X-EPHeader: CA
X-CMS-RootMailID: 20250930122729eucas1p2c4f1c07a4a504a59ba691b407a39420d
References: <CGME20250930122729eucas1p2c4f1c07a4a504a59ba691b407a39420d@eucas1p2.samsung.com>
	<20250930-rust-next-pwm-working-fan-for-sending-v15-0-5661c3090877@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_032403_852861_30F3C02C 
X-CRM114-Status: GOOD (  25.12  )
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



On 9/30/25 14:20, Michal Wilczynski wrote:
> This patch series introduces Rust support for the T-HEAD TH1520 PWM
> controller and demonstrates its use for fan control on the Sipeed Lichee
> Pi 4A board.
> 
> The primary goal of this patch series is to introduce a basic set of
> Rust abstractions for the Linux PWM subsystem. As a first user and
> practical demonstration of these abstractions, the series also provides
> a functional PWM driver for the T-HEAD TH1520 SoC. This allows control
> of its PWM channels and ultimately enables temperature controlled fan
> support for the Lichee Pi 4A board. This work aims to explore the use of
> Rust for PWM drivers and lay a foundation for potential future Rust
> based PWM drivers.
> 
> The core of this series is a new rust/kernel/pwm.rs module that provides
> abstractions for writing PWM chip provider drivers in Rust. This has
> been significantly reworked from v1 based on extensive feedback. The key
> features of the new abstraction layer include:
> 
>  - Ownership and Lifetime Management: The pwm::Chip wrapper is managed
>    by ARef, correctly tying its lifetime to its embedded struct device
>    reference counter. Chip registration is handled by a pwm::Registration
>    RAII guard, which guarantees that pwmchip_add is always paired with
>    pwmchip_remove, preventing resource leaks.
> 
>  - Modern and Safe API: The PwmOps trait is now based on the modern
>    waveform API (round_waveform_tohw, write_waveform, etc.) as recommended
>    by the subsystem maintainer. It is generic over a driver's
>    hardware specific data structure, moving all unsafe serialization logic
>    into the abstraction layer and allowing drivers to be written in 100%
>    safe Rust.
> 
>  - Ergonomics: The API provides safe, idiomatic wrappers for other PWM
>    types (State, Args, Device, etc.) and uses standard kernel error
>    handling patterns.
> 
> The series is structured as follows:
>  - Expose static function pwmchip_release.
>  - Rust PWM Abstractions: The new safe abstraction layer.
>  - TH1520 PWM Driver: A new Rust driver for the TH1520 SoC, built on
>    top of the new abstractions.
>  - Device Tree Bindings & Nodes: The remaining patches add the necessary
>    DT bindings and nodes for the TH1520 PWM controller, and the PWM fan
>    configuration for the Lichee Pi 4A board.
> 
> Testing:
> Tested on the TH1520 SoC. The fan works correctly. The duty/period
> calculations are correct. Fan starts slow when the chip is not hot and
> gradually increases the speed when PVT reports higher temperatures.
> 
> The patches doesn't contain any dependencies that are not currently in
> the mainline kernel anymore.
> 
> ---
> Changes in v15:
> - Update the TH1520 driver; read the hardware state directly instead of
>   using state, fix an integer overflow using saturating arithmetic, and
>   add handling zero period edge cases.
> - Add dbg prints, and also update them for using the preferred format
>   for emiting a waveform.
> - Remove the consumer side Args wrapper from the abstraction layer.
> - Link to v14: https://lore.kernel.org/r/20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com
> 

Hi Uwe,
Would you like me to re-base on v6.18-rc1 ?

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
