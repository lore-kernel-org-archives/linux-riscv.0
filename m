Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613E2CD5BB1
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qapPKTAax9jmyv4CpgIebYj50lPu9dkGcDEWR9hYFQA=; b=mbI+OPinQnntRD
	t6nEj6kQEb4mg/uGNyqVcVZRImm8yDUuuf5lndwgyPqUeuMp59jfecawTfcMFiZiLI7dIt4e4vESP
	VOKf2Dw6H8gZZe4MOZma3wgnyd9+N4uQ/phmqntgjeE1NhLZM1kTE/w/v7fG7RiKZM/SJ5jMSr6Yg
	Qxoi1DhUnFoVW9ELsqiTsR2pr/oFCMBsmEJzLIibrbc1onn9RMTxpfmOaXk+eIzXPkGbenIAYmB5a
	fycitYW2DMWmmxg8umxF0/YhsCPgiEEcsJ532t89oXC96MM+eSSyj8E23dOIOO/Qw3H8sN/4dMVsY
	sr2Gl2zBAgxDskY8LCWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWPq-0000000HQbg-3vv5;
	Mon, 25 May 2026 14:36:26 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWPn-0000000HQak-0gHp
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 14:36:25 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260525143617euoutp02324171afb5cf3ca2b27281fbed9aa529~y1bVAMCcV2631226312euoutp023
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 14:36:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260525143617euoutp02324171afb5cf3ca2b27281fbed9aa529~y1bVAMCcV2631226312euoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779719777;
	bh=ihliREZgMzReUYNbym7+k9r3BOHcnboQjI39K8/coEA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=qBKb45KzlYodRsq1ggqya+gyQ1dvTuRoBHimsXpeTiXtd8fDvhJe4HKeDZAWzJMBo
	 XLboiRqMklGRmoFTEQhyuIcWuAQ/2AJAv4iz86BrCt1qqdURNZVAJsQNy8QymqXxBH
	 3kSz8vYiqjniLQt1am7/ZKP983nS/cQZhW6HIWmo=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260525143615eucas1p185f94e18bbc0a8f178354df3559e8e64~y1bTGZ3s_3257432574eucas1p1q;
	Mon, 25 May 2026 14:36:15 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260525143614eusmtip2d4576676ff0d43b22887b9deb3631a72~y1bSZgOpC2236822368eusmtip2e;
	Mon, 25 May 2026 14:36:14 +0000 (GMT)
Message-ID: <8857fc45-b787-4661-b27b-8976e655f7c9@samsung.com>
Date: Mon, 25 May 2026 16:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] pwm: th1520: Remove requirement for
 mul_u64_u64_div_u64_roundup
To: mhi@mailbox.org, Drew Fustini <fustini@kernel.org>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
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
In-Reply-To: <20260525-pwm-th1520-fix-v1-1-814e537c6812@mailbox.org>
X-CMS-MailID: 20260525143615eucas1p185f94e18bbc0a8f178354df3559e8e64
X-Msg-Generator: CA
X-RootMTR: 20260525131112eucas1p1d7e4836f71c81686e1f71e4007e344ec
X-EPHeader: CA
X-CMS-RootMailID: 20260525131112eucas1p1d7e4836f71c81686e1f71e4007e344ec
References: <CGME20260525131112eucas1p1d7e4836f71c81686e1f71e4007e344ec@eucas1p1.samsung.com>
	<20260525-pwm-th1520-fix-v1-1-814e537c6812@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_073623_789384_5D0FAD9A 
X-CRM114-Status: GOOD (  14.21  )
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



On 5/25/26 15:11, Maurice Hieronymus via B4 Relay wrote:
> From: Maurice Hieronymus <mhi@mailbox.org>
> 
> The cycle register is always u32, so cycles_to_ns() can take a u32
> instead of a u64. With that narrowing, cycles * NSEC_PER_SEC is at most
> u32::MAX * 1e9 (~4.3e18), which fits in u64 without overflow. The
> saturating arithmetic is therefore no longer needed, and the ceiling
> division can use Rust's u64::div_ceil() directly instead of the
> open-coded numerator/denominator form.
> 
> This also drops the TODO referring to a future
> mul_u64_u64_div_u64_roundup kernel helper, which is no longer required.
> 
> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>

Hi Maurice,

Thanks for sending this.

I agree that this optimization makes perfect sense when looking at the
TH1520 driver in isolation. However, since this is currently the only
Rust PWM driver in the tree, it serves as the reference implementation
for future drivers.

We need cycles_to_ns to remain a generic blueprint. Many PWM controllers
have 64-bit registers, and in the C API, it is standard practice to use
helpers like DIV64_U64_ROUND_UP regardless of the register size (e.g.
axi_pwmgen). Resolving the TODO by assuming 32-bit registers removes
that generic capability.

At the time this was merged, the equivalent Rust math helpers didn't
exist yet, which is why the open-coded saturating math is there as a
placeholder.

To move forward, we should fix this by implementing the proper generic
64-bit math helper in the Rust abstractions, rather than narrowing the
types here. Are you open to looking into adding the Rust equivalent for
mul_u64_u64_div_u64_roundup instead?

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
