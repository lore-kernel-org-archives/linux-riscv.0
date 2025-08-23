Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D64CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 10:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMHEogHKEvrcPjhjjsV1K5NhoJ/u5FlBLJ03Hf+mLNk=; b=IeW9WPSLIZFqWw
	kpp30gouTWoVqfJiOciJhyVJoEA/3AaplqHFErUnkZACj0hTG9jtk4k3YDvSA158e817dkfkXcHH2
	tPyTbBjIklEIcOoGd2xEF9di0tCEQvmT4kiEYS3KI/o8EiD7QYmqb/M9daAyArvH1JizTqCU5D0vt
	gBJmy/LIlx7COc7BiLEAe5zEmPXsec1xsf1lWWHpR7Eqpjk40DISbHggYSL2aXrxAddlaEBxr0MIo
	ucOGap49X4M5pyDPAI7rhyD+7D0hqyljau5cQmD6ZEq2mMY6urbxEkezT6RgOhKJW3tqTl7VfhI1t
	oeTXhWYVVYRj4BXNeS0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplJe-00000004ca6-3rSJ;
	Sat, 23 Aug 2025 10:17:42 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplJa-00000004cZe-12EW
	for linux-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 10:17:41 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250823101730euoutp010fcac9e424c529022088c6cd4d48720f~eXf4JAtKd1280312803euoutp01J
	for <linux-riscv@lists.infradead.org>; Sat, 23 Aug 2025 10:17:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250823101730euoutp010fcac9e424c529022088c6cd4d48720f~eXf4JAtKd1280312803euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755944250;
	bh=D4wK6GdZ/4jViHNG+K4863aSZhyyAegTqee1+ujAQvs=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=mk8o5ICr2N9ZxC9HGU6/6YWKdkW5UkmQr0qiC+Rl79raEHOfYQ7n46l5Dw+hP6UkQ
	 9lvYAhqlHcqGzM9HRlQ6ehBppVoPixb+ymKBMhyTaVNizw9ji1d407LfGJdySDR5gu
	 Hbd6E/tPzuXo8DlRCd1ZIcDyNY8ZhQlLucqBg7gE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250823101729eucas1p2fecd1d04cdc29bd6cbb24bc73d07dbd2~eXf3F_K2b2217822178eucas1p2b;
	Sat, 23 Aug 2025 10:17:29 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250823101728eusmtip1059e9beb9dcc8db475e73c7644924bcb~eXf18dMid1939419394eusmtip1K;
	Sat, 23 Aug 2025 10:17:27 +0000 (GMT)
Message-ID: <8f63a814-1310-4edd-9394-38f71e017edb@samsung.com>
Date: Sat, 23 Aug 2025 12:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 7/7] riscv: dts: thead: Add PWM fan and thermal
 control
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: Drew Fustini <fustini@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
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
	Daniel Almeida <daniel.almeida@collabora.com>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Content-Language: en-US
In-Reply-To: <3aa6f79e-2ebf-4aff-a23c-7e79929a85f9@samsung.com>
X-CMS-MailID: 20250823101729eucas1p2fecd1d04cdc29bd6cbb24bc73d07dbd2
X-Msg-Generator: CA
X-RootMTR: 20250820083548eucas1p2a40775d53dfd9f8608671cc20003fd7d
X-EPHeader: CA
X-CMS-RootMailID: 20250820083548eucas1p2a40775d53dfd9f8608671cc20003fd7d
References: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
	<CGME20250820083548eucas1p2a40775d53dfd9f8608671cc20003fd7d@eucas1p2.samsung.com>
	<20250820-rust-next-pwm-working-fan-for-sending-v14-7-df2191621429@samsung.com>
	<aKjXzyyYd9QneIKf@x1> <3aa6f79e-2ebf-4aff-a23c-7e79929a85f9@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_031738_560455_C3ABD507 
X-CRM114-Status: GOOD (  19.30  )
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



On 8/23/25 12:13, Michal Wilczynski wrote:
> 
> 
> On 8/22/25 22:49, Drew Fustini wrote:
>> On Wed, Aug 20, 2025 at 10:35:42AM +0200, Michal Wilczynski wrote:
>>> Add Device Tree nodes to enable a PWM controlled fan and it's associated
>>> thermal management for the Lichee Pi 4A board.
>>>
>>> This enables temperature-controlled active cooling for the Lichee Pi 4A
>>> board based on SoC temperature.
>>>
>>> Reviewed-by: Drew Fustini <fustini@kernel.org>
>>> Tested-by: Drew Fustini <fustini@kernel.org>
>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>>> ---
>>>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 67 +++++++++++++++++++++++
>>>  1 file changed, 67 insertions(+)
>>
>> Do you think it makes sense to coordinate this with the "Initial thermal
>> management for Lichee Pi 4A board" series [1] from Icenowy?
> 
> Hi,
> It seems to me like using the HW PWM is just a better solution for
> driving the fans. However as pointed in the discussion currently Rust
> requires LLVM, so people compiling with gcc will not be able to compile
> the driver for some time until the gcc support becomes better.
> 
> I think there is a way to express in Device Tree the fallback logic -

Sorry I meant 'there is NO way to express this in Device tree'

> if Rust not available then use SW PWM. So I guess the pragmatic way to
> go is to merge SW PWM temporary fix first, and later when gcc becomes
> better at compiling Rust patch it up to use HW PWM instead.
> 
>>
>> Thanks,
>> Drew
>>
>> [1] https://lore.kernel.org/linux-riscv/20250816093209.2600355-1-uwu@icenowy.me/
>>
> 
> Best regards,

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
