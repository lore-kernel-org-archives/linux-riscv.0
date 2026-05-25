Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA0FCD5BC9
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 21:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2CLfjK80XCSNKrJYSqatQx39paRQzm3nCg9Rw3lHOA=; b=0rPLUu4zwpS7qV
	o18Zv42DIIk1Hjn+5EEnFaqzlI6DGCfakWydA+KxeB7i4pKbyozz8OAi6HT9dySzbukCFNRr9Zusu
	kTBTdIULIn+Uk5Y+4GlVBtlDsQt41b1X04HGmD4Obb617GcgQAmpAOAlPPFaO+KOETy053H+s8Lx5
	7bghHuQti/zhupbOtf0TueP7DkfyFcpwJNFvNXx7WHuLWfrJljr9cobmG533oYKs9MwVDq3AWt+Mk
	/5zXm9ygVjG05blGHH7QnlgCNdDSbFmCeqP/ZVQq0rcCd12yNJumJAI7e068WNPMpS78zyK/cL2hG
	0qNuJjhY81c1ph8oQZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRd08-00000000W0N-3Apc;
	Mon, 25 May 2026 21:38:20 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRd02-00000000Vye-48hf
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 21:38:19 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260525213808euoutp026c6356b85f538d43f891355007fe007a~y7LqGn4g40491004910euoutp02d
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 21:38:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260525213808euoutp026c6356b85f538d43f891355007fe007a~y7LqGn4g40491004910euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779745088;
	bh=0zAzb+SBaqshUeBbHDXG9ssb7rtPUCjTfo5KBdrF4y0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=WBHeBCer/TMXLmOp/0xMC5CrppofN7AT8AEuIzqC1DkMFfEkhYrhUA0lOjVwJdST5
	 Q5y/hdhoOpPdPG5teLDtzAKzNeVS2QuY4mjPvzYS1NKQhwHsZeYcphfXkegYnWT+5p
	 h1NxZ1mmeh8A4XoL9gW0iLKgT77ynRuj+9MKGMg4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260525213807eucas1p297d843b9d4e24701b2f6687161b810e8~y7Lo9OACg2594025940eucas1p2Y;
	Mon, 25 May 2026 21:38:07 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260525213806eusmtip209cf2a762ef7e89bdb6b780de832be7c~y7LoQfLL90048200482eusmtip20;
	Mon, 25 May 2026 21:38:06 +0000 (GMT)
Message-ID: <58245ce0-7271-4b07-b866-0037ff68d92c@samsung.com>
Date: Mon, 25 May 2026 23:38:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] pwm: th1520: Remove requirement for
 mul_u64_u64_div_u64_roundup
To: Maurice Hieronymus <mhi@mailbox.org>, Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <1f550af5b8d1fa2aaa9936d5b0010c156e0cb455.camel@mailbox.org>
X-CMS-MailID: 20260525213807eucas1p297d843b9d4e24701b2f6687161b810e8
X-Msg-Generator: CA
X-RootMTR: 20260525131112eucas1p1d7e4836f71c81686e1f71e4007e344ec
X-EPHeader: CA
X-CMS-RootMailID: 20260525131112eucas1p1d7e4836f71c81686e1f71e4007e344ec
References: <CGME20260525131112eucas1p1d7e4836f71c81686e1f71e4007e344ec@eucas1p1.samsung.com>
	<20260525-pwm-th1520-fix-v1-1-814e537c6812@mailbox.org>
	<8857fc45-b787-4661-b27b-8976e655f7c9@samsung.com>
	<1f550af5b8d1fa2aaa9936d5b0010c156e0cb455.camel@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_143816_424408_751FC0F4 
X-CRM114-Status: GOOD (  18.65  )
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



On 5/25/26 17:51, Maurice Hieronymus wrote:
> On Mon, 2026-05-25 at 16:36 +0200, Michal Wilczynski wrote:
>>
>> To move forward, we should fix this by implementing the proper
>> generic
>> 64-bit math helper in the Rust abstractions, rather than narrowing
>> the
>> types here. Are you open to looking into adding the Rust equivalent
>> for
>> mul_u64_u64_div_u64_roundup instead?
> 
> I would be definitely down, to help with that.
> 
> Before I start working on it, a couple of clarification questions.
> 
> Should I implement this as a thin FFI wrapper calling the C-Functions?
> Or do you prefer to have a re-implementation in Rust.
> 
> Since mul_u64_u64_div_u64_roundup is a macro: Is it okay if this will
> be a small Rust function or should it be a macro as well?
> 
> Thanks a lot,

Apologies, I have to correct my statement from before after discussing
with Uwe. The reason the macro was used in the mentioned driver is NOT
that PWM controllers have 64-bit registers - Uwe isn't aware of that
being a real pattern either, and I was inferring it from the code rather
than from hardware reality. The actual reason the macros get used isn't
unified across drivers and we should pin that down separately rather
than block your patch on it.

So please hold off on the Rust helper for now - your initial patch might
be the right direction.

> 
> Maurice
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
