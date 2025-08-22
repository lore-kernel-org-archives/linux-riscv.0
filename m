Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7CCCA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 10:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gVHjj8TYg37z1ND2ggq+78lyskyjmokE6cezaRjJKEw=; b=ceqMww0RZSaWAd
	Q/sCUXPF3x/w8A1qw2sebem8qxx2zrYEoUmzYJniwWfWIoSvEefWkVUhQGuIr9E7mfGtNbzGWiP8P
	KywpprDKr+gKLe2rQpJhSWDeUiCnwQTODjqfdJVGbx0HXVAoTTedXyJNB93Vt3NsZ6UmCuRmgvMxx
	q/UFzb1iSASZNjBP+oijZfrCWsKPlFMOE09H/FygXZOsG8WNtkFD3BzhIICDukODfHpqYEw1vGsjS
	yPymFAndPDQvXkG6e18LdN0H2sd9q9OOCjYr+TP4suZxEEFB99u264ZIB0+OknHLDlMj7s5B6q7hV
	3ghu6opXY/JaJtWZRJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uploa-00000004f9Q-3ZuO;
	Sat, 23 Aug 2025 10:49:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upYhO-00000003SGi-386L
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 20:49:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1E37A58BAE;
	Fri, 22 Aug 2025 20:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E0FC4CEED;
	Fri, 22 Aug 2025 20:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755895761;
	bh=wmRCLD9hOfy0sueOqSOzM5LT8HdFfskptuv1HyGoOiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TREzWGI/KHNYiYiVKXn4mwg3b3FDPsPm24JWVzD9c1QWsPwZ6vnvsxHNQPR75cOJD
	 h/72DFHoP8T0ao4DFDBGMhPYmu0IpfPbmRiWJNdFGLE8YO0Pa1T9ke5JUiElqtV6JH
	 lFeNa8Tmod24lBIkxtq/BTVX2iwnt1whenapPUEn1FFg3jKjuIiKO1JD/bpDEZJIA9
	 AbpPQ+Q8zrHEMbcdMsVdOUsMkUfoVPRiZcMnwgg2ORnHfLFsr+ZZ0lQLLbpHDjcAg3
	 N/Xw7dzGn05qpazPV5vG/uSe1RTsGssQHCRo+QUHzeniWihGOHjCssXmIX9qvG88hS
	 iXu7Mi4hl2xXg==
Date: Fri, 22 Aug 2025 13:49:19 -0700
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
	devicetree@vger.kernel.org
Subject: Re: [PATCH v14 7/7] riscv: dts: thead: Add PWM fan and thermal
 control
Message-ID: <aKjXzyyYd9QneIKf@x1>
References: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
 <CGME20250820083548eucas1p2a40775d53dfd9f8608671cc20003fd7d@eucas1p2.samsung.com>
 <20250820-rust-next-pwm-working-fan-for-sending-v14-7-df2191621429@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250820-rust-next-pwm-working-fan-for-sending-v14-7-df2191621429@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_134922_852775_DEA050D5 
X-CRM114-Status: UNSURE (   9.12  )
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

On Wed, Aug 20, 2025 at 10:35:42AM +0200, Michal Wilczynski wrote:
> Add Device Tree nodes to enable a PWM controlled fan and it's associated
> thermal management for the Lichee Pi 4A board.
> 
> This enables temperature-controlled active cooling for the Lichee Pi 4A
> board based on SoC temperature.
> 
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> Tested-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 67 +++++++++++++++++++++++
>  1 file changed, 67 insertions(+)

Do you think it makes sense to coordinate this with the "Initial thermal
management for Lichee Pi 4A board" series [1] from Icenowy?

Thanks,
Drew

[1] https://lore.kernel.org/linux-riscv/20250816093209.2600355-1-uwu@icenowy.me/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
