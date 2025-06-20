Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385C0C7115B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 00:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+QuMJcnv7WGhGGTRl3faEp4Fm3Gvam+UwXCX+XtZYQ=; b=i8aRJ9LUHaY4fR
	MJLKjN/uA14EGNGlVJpWiPhS+csznC+o1r5u2LQn/bMCEiD0rqhFa8/rcCzLH5Z+V6I9GP8poUv1n
	PZSUPW/jmxWuEbhLESljiEGzvIEPaUDHqH/HDHYSXJjLe/TDtCJt/fPxQnnFf0LpZQRvNIjzrJUwl
	/HtG1kqkvDhQ66f09wqaVATWqN22Ycs2y9EgyCGsDWXv8QYkHhmkY70Af3sUCgnWr8hJAw99Cgovd
	DhhFMtAKgjzjyaJ6ujEs28u0FjUIJ98np2rS+wpV5AZXvY8LIRVZ4k8t+1Ve4+83e6TM57kHt5pif
	mUfqgW7IRvUUY0fg+znA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSQ01-0000000EV75-1R6G;
	Fri, 20 Jun 2025 00:52:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSPzy-0000000EV6j-2Uv8
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 00:52:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E5414AB62;
	Fri, 20 Jun 2025 00:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5B7C4CEEA;
	Fri, 20 Jun 2025 00:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750380773;
	bh=ArNMFWMOWO/Ezp/JG8136kkvpDFoqlGtBCU0I6dYd6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JznyF8u9CMVwysl/pVIOQpzpdi4NmP+ZIvsYNyZvMGQIm1MKoSb4wvd7R1+cO2juI
	 I4E5jDmoxYdIJZt96RDM9url9J8gair5IM3+1Yw9lmP3HOUtjN6yPsWMvNlbz8wV0o
	 lNOxX8a34MO2cxTnTgQhEfzpc7CqBR8IaJLA4FtoP6HkT1PvkLXhCnF/Tq0GaGEp17
	 ppfmE+x4kieQF2y5qjAlPn+M4e5kX/b7Vn/fZVouiYTuySAT//OTJZpbB9mS3PnDXM
	 JmpawmYWS9UNfgO3FXBR6xelyIZHSkVH4TjyBUMojcZ3oGnf5IRIaAS42V/LG6f1KA
	 l/nKfcWgvf/jA==
Date: Thu, 19 Jun 2025 17:52:51 -0700
From: Drew Fustini <fustini@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v4 0/9] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <aFSw44++s7xMkJ9I@x1>
References: <CGME20250618122801eucas1p2f9ca464e9e5c8d954d5150500952aeed@eucas1p2.samsung.com>
 <20250618-rust-next-pwm-working-fan-for-sending-v4-0-a6a28f2b6d8a@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618-rust-next-pwm-working-fan-for-sending-v4-0-a6a28f2b6d8a@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_175254_654900_867039EB 
X-CRM114-Status: UNSURE (   8.67  )
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

On Wed, Jun 18, 2025 at 02:27:33PM +0200, Michal Wilczynski wrote:
> This patch series introduces Rust support for the T-HEAD TH1520 PWM
> controller and demonstrates its use for fan control on the Sipeed Lichee
> Pi 4A board.
[snip]
> [2] - https://github.com/mwilczy/linux/commits/rust-next-pwm-working-fan-for-sending-v8/

I checked out your branch and get a compiler error about missing pwm.c:

$ make W=1 LLVM=1 ARCH=riscv
  CALL    scripts/checksyscalls.sh
  BINDGEN rust/bindings/bindings_helpers_generated.rs
rust/helpers/helpers.c:34:10: fatal error: 'pwm.c' file not found
Unable to generate bindings: clang diagnosed error: rust/helpers/helpers.c:34:10: fatal error: 'pwm.c' file not found

make[2]: *** [rust/Makefile:371: rust/bindings/bindings_helpers_generated.rs] Error 1
make[2]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
make[1]: *** [/home/pdp7/linux/Makefile:1280: prepare] Error 2
make: *** [Makefile:248: __sub-make] Error 2

Did I do something wrong?

My kernel config:
ihttps://gist.github.com/pdp7/8f5b4324a43119f39d4c40158bf3325e

Thanks,
Drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
