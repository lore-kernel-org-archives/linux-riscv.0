Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5C0C83F17
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Jul 2025 16:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IesxIIZBW/vlSD1IP3+ysEJj2bRFD6RSMvs2/SYk7co=; b=nRBTPlZCCwMwkK
	tjFf1YXAuPTMhrYHWZ8noOLVdxdFQE97s3AXoX8NFDabAcQMtai1ajunqbWsrtRBMCyvVYbTW0uFQ
	K6KA1efi71zC1m3bVGmSdgH/IN/YNdU2dqwAqd9mN7wVIbSD5ZizVk6q2nZJ3sXlLr/rglHjMFFz+
	x4+86AsWsR1dnD9ld5KLEjR7OV2nYWROTmbXsuWshjMdr9EITBE+lGsNsAh7vssgr3sMSC23I2bSe
	odii4Z6aRa1Rgqw0ZltTTgIjhIUNy62h4SksdRDqAXct+JYvNFk2D0k+RvFKyLeckNPOXmgFo9RSk
	2CspXFyFYVIaDjQ+2qkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufiCW-0000000BfYi-3F5D;
	Sat, 26 Jul 2025 16:56:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufiCU-0000000BfYM-2Hp9
	for linux-riscv@lists.infradead.org;
	Sat, 26 Jul 2025 16:56:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4457E416BF;
	Sat, 26 Jul 2025 16:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CACC4CEED;
	Sat, 26 Jul 2025 16:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753549005;
	bh=xCg92gP7rQbNoUCfPTgJWW0kbd3zy4lJS0U+Oc7rzE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAEP8JjfEeyrcttfxZEbDEHjBgfO55KtsgsatqYzi1s6K0e+o0B9i+1HobATxhrgz
	 +ju5skj6e7otHw/yFssY+Bjt70NO4bd/+izWVOuzcdrSOqa+uulPsxFTzoM3Xeq49V
	 AGGzrn0xjrQ2UAQO8DSYY0CB+d6M/ybh2m8UPJPmDkIFBNYU+ynLBogKCzIrXibizM
	 0BLOcNlvaozyGjCVPWnYPQxlseiKodg4+AZgL0GVhv3GwfECx11ZyV5LIsTlKji3CR
	 gpUADD68JeDTNoH7ay0TTP1bPDXMBkhhg1l4F7f51c93YDevHyAcIBk8vb4tdScSmE
	 jT2MsyR9WgQGw==
Date: Sat, 26 Jul 2025 09:56:43 -0700
From: Drew Fustini <fustini@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alex Gaynor <alex.gaynor@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <drew@pdp7.com>,
	Fu Wei <wefu@redhat.com>, Gary Guo <gary@garyguo.net>,
	Guo Ren <guoren@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 8/9] riscv: dts: thead: Add PVT node
Message-ID: <aIUIy5ykeZi+BNXA@x1>
References: <20250623-rust-next-pwm-working-fan-for-sending-v5-0-0ca23747c23e@samsung.com>
 <CGME20250623180907eucas1p10c0ca6b667debcc8139402d97e4ef800@eucas1p1.samsung.com>
 <20250623-rust-next-pwm-working-fan-for-sending-v5-8-0ca23747c23e@samsung.com>
 <175340623531.3513.5896709502242556676@lazor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <175340623531.3513.5896709502242556676@lazor>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_095646_605286_DC981F62 
X-CRM114-Status: GOOD (  13.58  )
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

On Thu, Jul 24, 2025 at 06:17:15PM -0700, Stephen Boyd wrote:
> Quoting Michal Wilczynski (2025-06-23 11:08:56)
> > Add PVT DT node for thermal sensor.
> > 
> > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > ---
> >  arch/riscv/boot/dts/thead/th1520.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > index 26996422e1efe5d2dde68819c2cec1c3fa782a23..bef30780034e06b07aa29b27b0225ea891a4b531 100644
> > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > @@ -669,6 +669,17 @@ padctrl_aosys: pinctrl@fffff4a000 {
> >                         thead,pad-group = <1>;
> >                 };
> >  
> > +               pvt: pvt@fffff4e000 {
> 
> Node name should probably be 'thermal-sensor@fffff4e000' then.

Thanks for pointing this out. It does seem like 'pvt@' is unusual:

$ git grep -l 'thermal-sensor@' arch/*/boot/dts | wc -l
57
$ git grep -l 'pvt@' arch/*/boot/dts | wc -l
1

$ git grep -l 'thermal-sensor@' Documentation/devicetree/bindings/ | wc -l
14
$ git grep -l 'pvt@' Documentation/devicetree/bindings/ | wc -l
2

The 6.17 PR for dts has already happened, so I'll do a fix once I can
update my thead-dt-fixes branch to 6.17-rc1.

thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
