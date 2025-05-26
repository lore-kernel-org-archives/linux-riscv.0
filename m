Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BC8C5AD49
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6LJoing+mVbZvUajm/i9UXZ65GHWsM765k81ydjuN8=; b=RrHxkoS6gXPk5z
	ADSG/0fURpcUQyAVuJdzuxFju8AiosNrgWEUkDnven6jMm/E6Lpfo5WzEIEjpIimYacic5hHXHpWt
	ugqdTILkISFoNXSiwqayMMPnjvrzX8MhK8HiQy17+lErgjhYINMZdQACdXZijSAW7aNQ8m4XONltg
	g43+aSKk/l6xMNxfuEU28VA7vL2U4LckXNY1Edg3LguFpykFGDjnaol2wVFmIcqypAYTV/WtCTFdS
	YohAk6nWoxhhR0IvpwTzCyQFl/lupSIbW21r7eE6zWPAgPU20XbHpvniZ7s1D/mWA09DxDN256NDS
	v51wx52Hlm/Dh3EuR61Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTjP-00000008SUU-3Ii1;
	Mon, 26 May 2025 09:02:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTih-00000008SMp-0WsM
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 09:02:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA6885C5B2D;
	Mon, 26 May 2025 08:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 355C0C4CEE7;
	Mon, 26 May 2025 09:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748250125;
	bh=dN/e6uhiPG0gbtb1wPFzzVl1DX4FB152MF7H9e4ibV8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=bdR91CGUEmWkCYOZTftiSKKI4OzJqQ3ATjbzVx9FaySp2fTLbRstZR0/VYQMdirxI
	 ihEUXGt2TX9j6+AEXjLgjxoy2k+75rvx+6eVrFdYy08O3SYWwNXgUc3lr9051mnF+P
	 1z4TNJ4qwATNqXRl7ZOHvgzr6FHi1RPwcWgN/RE9cz9q7nEmTNHj7xPIVGo5D5RmiZ
	 RU6FAvPeVL6ri6u6wG7lbtL46aLMGxfau3O45zztpA0mqmuJnhFaHWe2hiY1SeSEE/
	 aOhDXjTYaI7vCq5OHwCdVJENXPFQUin5ak4mR7yipel7BrfRfmmFiKE/1aoIn+CaAE
	 e9FGsdk8YMIPg==
Mime-Version: 1.0
Date: Mon, 26 May 2025 11:01:58 +0200
Message-Id: <DA5YY0YF28GO.3DONTQDLY6VBD@kernel.org>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Drew Fustini" <drew@pdp7.com>, "Guo
 Ren" <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, <linux-kernel@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 0/6] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
From: "Benno Lossin" <lossin@kernel.org>
To: "Michal Wilczynski" <m.wilczynski@samsung.com>, "Drew Fustini"
 <pdp7pdp7@gmail.com>
X-Mailer: aerc 0.20.1
References: <CGME20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187@eucas1p2.samsung.com> <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com> <aDJGgLZ9tITwGBxq@x1> <b5f4af17-05ef-453d-8f04-283590ae5b87@samsung.com>
In-Reply-To: <b5f4af17-05ef-453d-8f04-283590ae5b87@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_020207_214565_E1909C66 
X-CRM114-Status: GOOD (  11.54  )
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

On Mon May 26, 2025 at 10:22 AM CEST, Michal Wilczynski wrote:
> On 5/25/25 00:21, Drew Fustini wrote:
>> Thanks for the patch series. It will be great to have PWM working
>> upstream.
>> 
>> I've not built Linux with Rust before, so I'm going through the quick
>> start [1]. I've also never built Linux with LLVM before but clang seems
>> like the best compiler to use for Rust. Are you using LLVM?
>
> Hi Drew,
> You're correct, Clang is the way to go for Rust in the kernel. I also
> followed the official quick start guide. To answer your question
> directly: yes, I'm using LLVM.

Just to let you know, there is an effort to get rustc to work with a gcc
backend rustc_gcc_codegen [1]. And there also is the gccrs project [2]
trying to create a gnu Rust compiler.

[1]: https://rust-for-linux.com/rustc_codegen_gcc
[2]: https://rust-for-linux.com/gccrs

They have made a lot of progress over the last year, so we're hopeful
that they become usable in the near future. But for the moment,
Clang/LLVM is the way to go.

Hope this helps!

---
Cheers,
Benno

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
