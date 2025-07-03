Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9857C83F03
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 22:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cg6F0skcwDRMxY5mjY1HGM3kjWKXV+ElUFaR7B3hCNA=; b=v15dKbU0BQbmVf
	NiY5SzhCeTF0hTOm5BteO6pCFYkQIohFxi+449npNo37EG9nvCKUTLOfcFX1o2Vu947pzRMj8yQP6
	RqN5Y7ql8c61Sdkyg5bl0B8AgbBbIrTw2jONIG7gqKb3Czro8k2hcQayj5CnAt7g+jWm07lw67eY9
	KxobSclaEnBDHVyGlGpopMbqq5+8TQ4CpcsyS9i5B8IyBn17KBUx9rvQRt17uEytdL3y0ykzqKV2J
	JIrnz1f9kkniQuASCDWKSsKNYEFhjPNQeO8qLA62Hgv7qbgQGmUc6nQE7C2tIf1vS7LfOuyvVji1V
	rdywf7bqrBwHQ4Us8uOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSa0-0000000CkL6-2FXj;
	Thu, 03 Jul 2025 22:38:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXREG-0000000Cask-0xL9
	for linux-riscv@bombadil.infradead.org;
	Thu, 03 Jul 2025 21:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O94o4jozzFFAfKsJVa9lwJ7EljQwKROq2DUyFvePVVY=; b=fsSd4lUMhFD57oNILD2mDfZEtj
	A6H607lXdRYGRYO1i1/VhLpg+x9/YvdyH7J4lbYayDY1V9NPWraYcssdE4BwoKoIIa67X8rIQv+vF
	sQZ+9xlHfz/mhTCx0KmF78dQfOHF9efa/47XiPoZqTOc0f5LLt37KT2UOV/GMUrrY+U7ZNELqVyA3
	M1W2OiieldsoBE0qrw3DGxIMyFT3LJWUL/OMdjxiebzzyAwaYoXZVtlSIBuTXcKPcGEn2Z4QDgOsN
	9s78numfvR3DtSKwX+tlb0N+9VnUCbJD5sj3Y2CuGddkeJSigDTO2F+tB6l8phDyM/zmZWMV5JWkJ
	1F/NpQrQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRED-00000007k61-0BWA
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 21:12:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 53103A53A62;
	Thu,  3 Jul 2025 21:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2B6C4CEEB;
	Thu,  3 Jul 2025 21:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751577130;
	bh=BccBPphFegUfvo9vaJnC2YeCQIMSxr8COvMz3kKjdFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MM2xOjYPR/IlHPzFnc4v2tVz/O2tS3X1RNb1e1zd37lyGL3SuN4QC2cD2rggrgojM
	 YqnQMLcCzLbZYB97rUY8sid3KisERGoNEM89VfLjSqmgPU4GFfBsbGO/oMLjNDC6CB
	 +bmZ5tUZ0Uj0Z5JJHvqMlBG5QZAUjDq9eCOGUaaLy9RA7rzjPaVijO25n2XibWN2/A
	 s4rdeHqvUtmuJ1qG71Px/2qpMUJm45f1tAwV9dQb+oTmxlm5jzgEVWE8uOiGVSnZrW
	 7OjzF+BqqRhVtSUZU8NXUsq095I++8WhR8gdQ5XmKnXnTj+i7ie+9J+OuR+w6ZyKfC
	 FOk/GBTTD0aUw==
Date: Thu, 3 Jul 2025 14:12:08 -0700
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
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 8/8] riscv: dts: thead: Add PWM fan and thermal control
Message-ID: <aGbyKAYPc3Hqc+uY@x1>
References: <20250702-rust-next-pwm-working-fan-for-sending-v7-0-67ef39ff1d29@samsung.com>
 <CGME20250702135003eucas1p114a5ce5dea469242940b7e2e44a7ad59@eucas1p1.samsung.com>
 <20250702-rust-next-pwm-working-fan-for-sending-v7-8-67ef39ff1d29@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702-rust-next-pwm-working-fan-for-sending-v7-8-67ef39ff1d29@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_221221_424734_A298CE02 
X-CRM114-Status: UNSURE (   7.42  )
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

On Wed, Jul 02, 2025 at 03:45:36PM +0200, Michal Wilczynski wrote:
> Add Device Tree nodes to enable a PWM controlled fan and it's associated
> thermal management for the Lichee Pi 4A board.
> 
> This enables temperature-controlled active cooling for the Lichee Pi 4A
> board based on SoC temperature.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Drew Fustini <fustini@kernel.org>

I'll apply this to the thead-dt-for-next branch once the PWM driver is
accepted by Uwe.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
