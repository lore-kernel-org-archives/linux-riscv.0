Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCEDC5AD49
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 08:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QU/JGShLaAPnrN2T4IttmvaZQkemXkTRvVNS3HC0r64=; b=baCQ/PAgL6410Y
	hdUtG4WuU45oN9qhGc/+ejUjhk6VmtzDuQoHKmg4m/H1ujYCJhk38PC1Z7xrJWlPKYYU+p6MVKjie
	3mmV6P9Ho5uk5UrnnrYWo4UJOyp1oQ5uUD+UHVOCMpNiyyRY/TWqHNs/ZrCSeAs9zDYnoEuzObTeF
	g0bvwFrplZZippuq/lMLnLX3ic63cRiFDwagLN8l1DcWkn6x2s3cerjMdqbOmJGKYcjS7KtuFGSb2
	Ya+hA4S/sV7Ve/4QIzST16YyQ6+Op7QOzQTh1S/pmzFxuPwQ7Jdg1bDrrO4eWAWNStmGh7MovU+Pl
	2FYI3Wvsva4ckRi782GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJT99-00000008Nqx-1Ywx;
	Mon, 26 May 2025 08:25:23 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJT6v-00000008NaG-1oCP
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 08:23:09 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250526082300euoutp01be373c960ea918112694e174f729b565~DBhf4TZdx0891608916euoutp01h
	for <linux-riscv@lists.infradead.org>; Mon, 26 May 2025 08:23:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250526082300euoutp01be373c960ea918112694e174f729b565~DBhf4TZdx0891608916euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748247780;
	bh=yq9eUkHNh2SHLTI8CnZfNyE1BKVwTGaK17l/Xp0Hbxc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=lx0L9q3lMgOSLW69WE+VDgyRsn8eVEYdNXxO8uBjbEd/fPcgEk5TW6lZ2nJUiG5ef
	 Lbp8YRobMp2FIyeD9GVpuWTj9oCoj6JqR1zZPMzyNn5DhaglMXWXAgOLHX9sWgrou7
	 y4ZFNGd1xiTz2crSyWj4QFIqrcMnSTcw9PiX39ts=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250526082259eucas1p143075f090b60860195f47e547f8c4e5f~DBhfKhplY1082510825eucas1p1o;
	Mon, 26 May 2025 08:22:59 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250526082258eusmtip15c42b44a218a5904b5cf08dcfe50c7da~DBheGz27J3227532275eusmtip1K;
	Mon, 26 May 2025 08:22:58 +0000 (GMT)
Message-ID: <b5f4af17-05ef-453d-8f04-283590ae5b87@samsung.com>
Date: Mon, 26 May 2025 10:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/6] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
To: Drew Fustini <pdp7pdp7@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice
	Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
	Krummrich <dakr@kernel.org>, Drew Fustini <drew@pdp7.com>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
	Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <aDJGgLZ9tITwGBxq@x1>
X-CMS-MailID: 20250526082259eucas1p143075f090b60860195f47e547f8c4e5f
X-Msg-Generator: CA
X-RootMTR: 20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187
X-EPHeader: CA
X-CMS-RootMailID: 20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187
References: <CGME20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187@eucas1p2.samsung.com>
	<20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
	<aDJGgLZ9tITwGBxq@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_012306_050579_53FB4585 
X-CRM114-Status: GOOD (  26.94  )
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



On 5/25/25 00:21, Drew Fustini wrote:
> On Sat, May 24, 2025 at 11:14:54PM +0200, Michal Wilczynski wrote:
>> This patch series introduces Rust support for the T-HEAD TH1520 PWM
>> controller and demonstrates its use for fan control on the Sipeed Lichee
>> Pi 4A board.
>>
>> The primary goal of this patch series is to introduce a basic set of
>> Rust abstractions for the Linux PWM subsystem. As a first user and
>> practical demonstration of these abstractions, the series also provides
>> a functional PWM driver for the T-HEAD TH1520 SoC. This allows control
>> of its PWM channels and ultimately enables temperature controlled fan
>> support for the Lichee Pi 4A board. This work aims to explore the use of
>> Rust for PWM drivers and lay a foundation for potential future
>> Rust based PWM drivers.
>>
>> The series is structured as follows:
>>
>> Patch 1/6: Introduce basic PWM abstractions
>> This patch lays the groundwork by adding a Kconfig option for Rust PWM
>> abstractions, necessary C helper functions, and a new Rust module
>> (rust/kernel/pwm.rs). This module provides initial safe wrappers for
>> core PWM data structures (Chip, Device, State, Args, Polarity) and
>> functions (devm_chip_alloc, devm_chip_add), along with a basic PwmOps
>> trait focusing on the .apply callback needed by PWM chip providers.
>>
>> Patch 2/6: Add PWM driver for TH1520 SoC
>> This introduces the Rust based PWM driver for the T-HEAD TH1520 SoC.
>> It implements the PwmOps trait using the abstractions from the first
>> patch and handles the specifics of the TH1520 hardware for configuring
>> period, duty cycle, and polarity. Resource management leverages devm
>> for the PWM chip and Rust DevRes for I/O memory, and RAII for clock
>> handling.
>>
>> Patch 3/6: dt-bindings: Add PWM T-HEAD controller dt-binding
>> This patch adds the Device Tree binding documentation for the T-HEAD
>> TH1520 PWM controller.
>>
>> Patch 4/6: riscv: dts: thead:: Add PWM controller node
>> This patch adds the actual Device Tree node for the TH1520 PWM controller.
>>
>> Patch 5/6: riscv: dts: thead: Add PVT node
>> Add pvt node for thermal sensor.
>>
>> Patch 6/6: riscv: dts: thead: Add PWM fan and thermal control
>> This final patch adds the Device Tree configuration for a PWM controlled
>> fan to the Sipeed Lichee Pi 4A board DTS file. 
>>
>> Testing:
>> Tested on the TH1520 SoC. The fan works correctly.
>>
>> Points for Discussion:
>> The rust/kernel/pwm.rs abstraction layer is currently minimal,
>> focusing on the immediate needs of this driver. Feedback on its design,
>> scope, and potential for generalization would be highly appreciated.
>> General feedback on the Rust implementation, FFI wrapping patterns, and
>> adherence to kernel development practices is very welcome.
>>
>> The patches are based on rust-next, with some dependencies which are not
>> merged yet - platform Io support [1] and clk abstractions [2]. 
>>
>> Reference repository with all the patches together can be found on
>> github [3].
>>
>> [1] - https://lore.kernel.org/rust-for-linux/20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com/
>> [2] - https://lore.kernel.org/rust-for-linux/0ec0250c1170a8a6efb2db7a6cb49ae974d7ce05.1747634382.git.viresh.kumar@linaro.org/ 
>> [3] - https://protect2.fireeye.com/v1/url?k=53ce9a1b-32458f21-53cf1154-74fe4860008a-0c44c7bcb0c6b2a5&q=1&e=b41cbed0-2556-4543-be6a-a1333ab74001&u=https%3A%2F%2Fgithub.com%2Fmwilczy%2Flinux%2Fcommits%2Frust-next-pwm-working-fan-for-sending%2F
> 
> Thanks for the patch series. It will be great to have PWM working
> upstream.
> 
> I've not built Linux with Rust before, so I'm going through the quick
> start [1]. I've also never built Linux with LLVM before but clang seems
> like the best compiler to use for Rust. Are you using LLVM?

Hi Drew,
You're correct, Clang is the way to go for Rust in the kernel. I also
followed the official quick start guide. To answer your question
directly: yes, I'm using LLVM. This is the exact command I use for
cross-compilation:

make ARCH=riscv LLVM=1

CROSS_COMPILATION variable seems to be unnecessary for the LLVM
toolchain.

After the build, I load the kernel binary onto my Lichee Pi 4A board
(running Debian Trixie) via TFTP, which is the same process I used with
the GNU toolchain.

> 
> Drew
> 
> [1] https://docs.kernel.org/rust/quick-start.html
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
