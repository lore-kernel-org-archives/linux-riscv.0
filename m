Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A70EC83F03
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 22:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qTV1OkxUZ3SoOv2RsjxHZAcc3u7HWI06RdwPRdAho6E=; b=KeTA8oKgJpFStH
	Fqn09mxtUjaxBRmncOjL9DdWCm8cZ4/kF2JNnzsY85w7eMBS78PJsdhZqsYo7q7s2SeSLCBi1lPJu
	27hxxcRF80Y6pKGn/DCHjeuKzfv8Lm/EL1AEIiWQIT5/qZiFCg5IyJgJA+SW0OFoipW7+bFEp8VTT
	XYcBD0o9foNtaej3Bnv7tW0MiN7CtLJYWSaevEtIlX/NP5eIQ6cx1vCxAApdj76I0HgF1lNeAWmG0
	xla2pL5axCLMPwDIoWg/J058GCXAKtmhOx4duXvgapyp/rLKUF4+qtTJNnbCHh7VwHy6bTquUudbt
	0tlO0CDCHU0Hsx8lUTxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSaA-0000000CkMx-0geQ;
	Thu, 03 Jul 2025 22:39:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRGT-0000000Cb2C-1hCS
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 21:14:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC53B43B4E;
	Thu,  3 Jul 2025 21:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674D6C4CEE3;
	Thu,  3 Jul 2025 21:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751577279;
	bh=dT3HXJdueQ/TtIh10MafcagW9grURrInOFDiHaE4YAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dN6Y+S7/irGC1QtJuoxuGkKwnvtHa2E3PZfRG8brGqKjhENIg5sioAaRoEwKW/GWg
	 Px8Zee01GDBXIyQpKdR6AmE7H/hcij1i6TaDgl0enlVzXeIxJK5yCFCt0ELN3RZqi7
	 MS1a85taNpTxP+e0HVLcTexZLqfXWIOHhlM8fIn5MlfpaViQm+0kGIVa6mwPb+yRQ7
	 Eihg1+bDXPdvTdYpEgh7v8qNSiPA+o+by5E1lcu1KgZLi9yRRmoaF0N1iKi5Gm+Hyl
	 AdexxqsUF/bp5/NP+pMeGcD+A3cJsi7TaRCzZFEx9PUac8awfMllymNHmf+v2xSIkC
	 IiV/b5sRd2JzQ==
Date: Thu, 3 Jul 2025 14:14:37 -0700
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
Subject: Re: [PATCH v7 7/8] riscv: dts: thead: Add PWM controller node
Message-ID: <aGbyvc16om2v7Qpv@x1>
References: <20250702-rust-next-pwm-working-fan-for-sending-v7-0-67ef39ff1d29@samsung.com>
 <CGME20250702135002eucas1p29d0a0393fec6158a3ca158ea09b61cf1@eucas1p2.samsung.com>
 <20250702-rust-next-pwm-working-fan-for-sending-v7-7-67ef39ff1d29@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702-rust-next-pwm-working-fan-for-sending-v7-7-67ef39ff1d29@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_141441_463283_F8A51D54 
X-CRM114-Status: UNSURE (   6.29  )
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

On Wed, Jul 02, 2025 at 03:45:35PM +0200, Michal Wilczynski wrote:
> Add the Device Tree node for the T-HEAD TH1520 SoC's PWM controller.
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
