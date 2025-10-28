Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D459CCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 10:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ngNDorM+vAoNJUxwHAyhFP4UKaoQLl5F/WWvpVoe/CE=; b=pvfco7tf4PmTxk
	m4459wcI4sGlwhe7wNx8cttYfBUUDUwKnV5xKs5em3rcKMqg1NhGOauq7+GGc8WGTJpSE6CHV9Rny
	oykr8Ai/d+CIVbee3vUYnCnjnE5o4CjqDkff1BB0WExtdPPk44xRwFyN7WwFaLJK4iLpg2KK6xwJO
	DqXkbnGnAkPc2jFm7AxnZCLzAdxYouArL9VixCd2p5Wr0USTPlltmVtLvT0RpSCNZVBcES9ofnbul
	THpO9tb+Zzv1vh0N6i/jSfMCeqDfB6U/DyZyQQIAev2Z4hv5t9gNJGXJiBA1zzPRh324clzND+uo6
	TZCJOPacrfQYP6DwAeYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDge7-0000000FiYy-0djR;
	Tue, 28 Oct 2025 10:09:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDge5-0000000FiYQ-0pQr
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 10:09:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D66564405C;
	Tue, 28 Oct 2025 10:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07486C4CEE7;
	Tue, 28 Oct 2025 10:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761646180;
	bh=Q7g2gyuPLSJChCHcvMFGH4HAyWjvBka1p5B2EDIKhmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ixeRD/jnRPrSmS9fJPaZK6MChs5+lg18GLQo/GSADRXbs35ugkCYatWhwZ9WazBWy
	 xYl0WCOzrR+CH7qFbug6hZsjm+J8QzcIndDUMmlvcIsi8Dx44OzyYM3vWa1QRyPT/N
	 Z3Lb+8jCwz77IGFIJSD7cFxXH70jygxBS2VwkYmSbFVzAxvFPc/p6m+yHhG0gYdHXR
	 JLfd1SOPTqBCr7/jVk6P0SX6QwYDy3QAg0mXjbcbNjSTk4o/lcoveRovbQDdMZT5bZ
	 2AfmkMub8lm+wvEbdx7ZyXOZXfaSvnVce96RXJaG6i3EBAIHPhqMpuDWyQeC5H93t8
	 M+RlOYpZLnI3Q==
Date: Tue, 28 Oct 2025 10:09:31 +0000
From: Drew Fustini <fustini@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Benno Lossin <lossin@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, Elle Rhumsaa <elle@weathered-steel.dev>
Subject: Re: [PATCH v16 7/7] riscv: dts: thead: Add PWM fan and thermal
 control
Message-ID: <aQCWWxWxN9sD3Dep@gen8>
References: <20251016-rust-next-pwm-working-fan-for-sending-v16-0-a5df2405d2bd@samsung.com>
 <CGME20251016133824eucas1p29ff4403869bcf49efe1c982d42a01f52@eucas1p2.samsung.com>
 <20251016-rust-next-pwm-working-fan-for-sending-v16-7-a5df2405d2bd@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016-rust-next-pwm-working-fan-for-sending-v16-7-a5df2405d2bd@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_030941_254946_A2455CBE 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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

On Thu, Oct 16, 2025 at 03:38:07PM +0200, Michal Wilczynski wrote:
> Add Device Tree nodes to enable a PWM controlled fan and it's associated
> thermal management for the Lichee Pi 4A board.
> 
> This enables temperature-controlled active cooling for the Lichee Pi 4A
> board based on SoC temperature.
> 
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> Tested-by: Drew Fustini <fustini@kernel.org>
> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 67 +++++++++++++++++++++++
>  1 file changed, 67 insertions(+)

Applied to thead-dt-for-next, thanks!

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
