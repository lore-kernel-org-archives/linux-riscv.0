Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087F4C7EE30
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 20:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OtAcEwNcmQZfJE+IuhCJPskKskUoaXC61pAdzGWyLSU=; b=rCbigJQRhKmGgo
	Dqk8uD+v4rXxDGAz0nqsBp/0oDz0LL+V2+Giky6q4ihCaT5LhPOhT8Q/pYLiTdtrrgpME7VAtjs4u
	Ki1XgEtr9W24ygPtjCBS39dhyLBa8oakzDaDvY04SnL6bm67kwQtEM21gxdPY/STXgf9+UVWJfEu2
	TGAhXIHr0uswqBAWYJyZDIxNkkRWJ7un+TCqaeFMVjmBXXNEK1YZPqRF5njO1Hp3W50+liHlCzCke
	4CN76DN4tdthyH+T5nu6E7yRmrlj0N+n+0Dsm5F1SbO6P9aC1hLg5EjQBZ3FcO8tGtIlR4UrHHaLY
	c7d6PfP0/WzYdugF7ABw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhFD-00000006Wse-0acH;
	Tue, 01 Jul 2025 20:06:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhEw-00000006WnC-3k49
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 20:06:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3EE04524F;
	Tue,  1 Jul 2025 20:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C334C4CEEB;
	Tue,  1 Jul 2025 20:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751400360;
	bh=EgCnSjkxf4u1frTm53+gSUO8YuhHv0iXVp3vsJ/h0RU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hiCcDC/LMjF4xusnlzOHKMvbFAnZ5glKwkSnQD38zFYwoP5d+j+D65q8v1QxTBjvE
	 ovSjwtxKoO4AAnJsBdOZPxQiw36jM7qV9i2fUs0QZEzDhhKzmDwgikxzZTEZYJBkEE
	 nSylKd5/ukuQiI05UAv7aJpTx2aY5a+LRhVyiHzmmOzphhvJZFo0CANwewdpdDAn7p
	 d2uGSWQT3bzxAPl9WZ8G8S4iFkbpDrV8OvKzUT1Jhmw7AM5Vkpaa9nmQCrcYJuWgDA
	 dXnKlAn+RqRmebG9V1oOD6N0rXgmAjgfkugQ+voiTz9QQH+piz4p0iiZC+M2yP3SRf
	 uugx2/WRLqaZQ==
Date: Tue, 1 Jul 2025 13:05:58 -0700
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
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 0/8] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <aGQ/ph1dGIJcnyZu@x1>
References: <CGME20250701160157eucas1p1b6dfd8bf3859b07bff0cfcd171d7c939@eucas1p1.samsung.com>
 <20250701-rust-next-pwm-working-fan-for-sending-v6-0-2710932f6f6b@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250701-rust-next-pwm-working-fan-for-sending-v6-0-2710932f6f6b@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_130602_972747_9BCFFAF3 
X-CRM114-Status: UNSURE (   8.33  )
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

On Tue, Jul 01, 2025 at 06:01:37PM +0200, Michal Wilczynski wrote:
> This patch series introduces Rust support for the T-HEAD TH1520 PWM
> controller and demonstrates its use for fan control on the Sipeed Lichee
> Pi 4A board.
[snip]
> [2] - https://github.com/mwilczy/linux/commits/rust-next-pwm-working-fan-for-sending-v10/

I've tested this branch, which is now based on next-20250701, and the fan
is working correctly.

Tested-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
