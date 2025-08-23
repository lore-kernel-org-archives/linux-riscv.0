Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98514CA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 10:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4JzDBbQATGBigtKIT0Y0Ek0CixAXJmPoEQkouQ5Dgc=; b=Gk9wP2gwanQmj7
	I8xI3Mhs0R6lDJ3EVsYZqXEoWAtEqFyij6P4colNbFNdyNr0xLWot14LckCfUHqIz2qNHKA2Je8Do
	Qna0+lqgxokud4/xhCRPtGhR2gkzVqgQRnu+ilF7jMsXask2q6KZ9HosnwolevPwJIsAk0ZMTlhnO
	geIMJJFp7+Sk8xwBWsiocVYLdnXVni5MFXRpFsPW9qSkoNtWnvHC2TiQLsS+oJsNfmXya4+RityZm
	LNTuRr701904X5LlHEES60WdpmWy92A/k8CgKauo5oJ51nr3STu+Y5vxUEKfTq87AZRRsMwVZPTFb
	7yXB/J/vGzmK1lLGuK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplG5-00000004cMi-4B30;
	Sat, 23 Aug 2025 10:14:01 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplG1-00000004cM4-2Naq
	for linux-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 10:14:00 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250823101350euoutp02194bf1a5f69296d29ffcc9149bb999b2~eXcrF_4651031710317euoutp02B
	for <linux-riscv@lists.infradead.org>; Sat, 23 Aug 2025 10:13:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250823101350euoutp02194bf1a5f69296d29ffcc9149bb999b2~eXcrF_4651031710317euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755944030;
	bh=qltGmFZ1SyA2K1lCnBKFEXirABeylZVSgPO87C54S8o=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=qZ2mfZxlunMbEi21nVsR9wiuo5tfKAO2P/WFOeySBnWBUqPcAYK55g6Wa5BjbCLrP
	 Wzjygko6mkq8k+FqkkUhts9cB+cjvlccwGwZySQKMPLg0Gz6O52uxUtY9AXxv9m7LU
	 +kR1gXVLqKEA3kIhX+lr8uxgKT99kY9NoMt693Xk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250823101349eucas1p12d4a24393d204c8b65adaf2cebbc9b9c~eXcqRcCWE2895128951eucas1p10;
	Sat, 23 Aug 2025 10:13:49 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250823101348eusmtip1788ff78e85d2824cf82721f8c28a7d70~eXcpHT5a71950219502eusmtip1X;
	Sat, 23 Aug 2025 10:13:48 +0000 (GMT)
Message-ID: <3aa6f79e-2ebf-4aff-a23c-7e79929a85f9@samsung.com>
Date: Sat, 23 Aug 2025 12:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 7/7] riscv: dts: thead: Add PWM fan and thermal
 control
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
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <aKjXzyyYd9QneIKf@x1>
X-CMS-MailID: 20250823101349eucas1p12d4a24393d204c8b65adaf2cebbc9b9c
X-Msg-Generator: CA
X-RootMTR: 20250820083548eucas1p2a40775d53dfd9f8608671cc20003fd7d
X-EPHeader: CA
X-CMS-RootMailID: 20250820083548eucas1p2a40775d53dfd9f8608671cc20003fd7d
References: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
	<CGME20250820083548eucas1p2a40775d53dfd9f8608671cc20003fd7d@eucas1p2.samsung.com>
	<20250820-rust-next-pwm-working-fan-for-sending-v14-7-df2191621429@samsung.com>
	<aKjXzyyYd9QneIKf@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_031358_188922_102D4D49 
X-CRM114-Status: GOOD (  17.41  )
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



On 8/22/25 22:49, Drew Fustini wrote:
> On Wed, Aug 20, 2025 at 10:35:42AM +0200, Michal Wilczynski wrote:
>> Add Device Tree nodes to enable a PWM controlled fan and it's associated
>> thermal management for the Lichee Pi 4A board.
>>
>> This enables temperature-controlled active cooling for the Lichee Pi 4A
>> board based on SoC temperature.
>>
>> Reviewed-by: Drew Fustini <fustini@kernel.org>
>> Tested-by: Drew Fustini <fustini@kernel.org>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 67 +++++++++++++++++++++++
>>  1 file changed, 67 insertions(+)
> 
> Do you think it makes sense to coordinate this with the "Initial thermal
> management for Lichee Pi 4A board" series [1] from Icenowy?

Hi,
It seems to me like using the HW PWM is just a better solution for
driving the fans. However as pointed in the discussion currently Rust
requires LLVM, so people compiling with gcc will not be able to compile
the driver for some time until the gcc support becomes better.

I think there is a way to express in Device Tree the fallback logic -
if Rust not available then use SW PWM. So I guess the pragmatic way to
go is to merge SW PWM temporary fix first, and later when gcc becomes
better at compiling Rust patch it up to use HW PWM instead.

> 
> Thanks,
> Drew
> 
> [1] https://lore.kernel.org/linux-riscv/20250816093209.2600355-1-uwu@icenowy.me/
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
