Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91191C8303C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 09:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpaMrNhWuqQSTV81jIq64KIe1J3f3mRRe+JbzISlc/Y=; b=1VKhvtuWRdqCkW
	rtydleJ/PcmARfjZYBGCvvpyt3bo29yy9QuZ6aKVMakW5yQYWUPpCUpqnO+IDEVYEmH2hYpDUAqpI
	e9n+kFQQc0j60zw/2Yf/yRk1AJBWK4M7sWnWoO+424VK9dnnGMrWqe6/xwN0Vvwe2zaGW/bH09HH3
	Ra57ai0qv+khQTrSFk7hcyojHPyRlZMOfAjZ9EXyl0V8OH7gtiIRqbQ4YPrCRz3L42ZlJWw2eL2IQ
	tgW7TTzNDV0+na1u3QjEeh3aphFl9Cg48Vmo662bLK43LKbeImZrIVBXCYuMCzba8+SJ62v+JGRfQ
	mLJ0Q0INkOrLEZAb9HOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiQq-000000021nD-198w;
	Mon, 07 Jul 2025 09:46:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhwP-00000001x1W-11Vt
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 09:15:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 669F361130;
	Mon,  7 Jul 2025 09:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFEE6C4CEEF;
	Mon,  7 Jul 2025 09:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751879712;
	bh=s5LNAqpqCTtOzeV5j3oi7jngQje+htJG71VU5WzpWQE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WDMBMGRhjhaSH4iS9+2wyp0jAQP7F9gwtbtFBmJkfmYes/iElDwBHe0qFwfq+HhEL
	 OaxleHZlFo93WjGT4aXDJv37B10j6diALCLaAE0ETwZessChqz/lT6yvLhDT2sEDnV
	 YwWA106nDbY3SW5gMPA8fmr6sWYOmU3HOOpur1+Lj0mY3Fmqgb/ebcPkkBZM9WMehg
	 /MWJnFyh2ek03Vw2uprTeRq0Gdbfgr6wjF1fd3K++bN+pL4hKo0fKjfEFT91TaALpF
	 M9Qylp4CdNrkZ/P4cpBMAjH1dqD7I95jQddwzWKaLFnYVFrZFeejyTLLxP6vQUpuSH
	 QSzAS7uzHNBVQ==
Message-ID: <1b0aba4d-5e4f-4f5e-9a3a-978d6fde2847@kernel.org>
Date: Mon, 7 Jul 2025 11:15:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] rust: pwm: Add complete abstraction layer
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
References: <20250706-rust-next-pwm-working-fan-for-sending-v9-0-42b5ac2101c7@samsung.com>
 <CGME20250706114605eucas1p17d1cbd035d14d95f4ad0588c2572b3e2@eucas1p1.samsung.com>
 <20250706-rust-next-pwm-working-fan-for-sending-v9-2-42b5ac2101c7@samsung.com>
 <aGpqqGMTU3a3O8cn@pollux> <002c8275-f17d-4a4e-b6b8-4dc74c4d510d@samsung.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <002c8275-f17d-4a4e-b6b8-4dc74c4d510d@samsung.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/7/25 9:30 AM, Michal Wilczynski wrote:
> On 7/6/25 14:23, Danilo Krummrich wrote:
>> If you overwrite this callback (as you do below) you're leaking the memory
>> allocated by pwmchip_alloc().
>>
>> The simple way to solve this would be to call pwmchip_release() from here.
> 
> Thanks, a pwmchip_release() is static though, so it's either expose the
> pwmchip_release in the header, or call kfree() here directly on pwmchip.

I'd export pwmchip_release() then, if you instead replicate what it does a
future change is pretty likely to be missed in the Rust abstraction.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
