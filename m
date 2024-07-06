Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7D6C2BD09
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 10:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTIS3TV1kGYC7gDrZ4jgWfEDExa1a8sqg+a4nUPFrJw=; b=YOHbFI7LdSwEaZ
	BodfXog4hgY9U815cKxunXGkAZiO4qr/QHT8UZA8EGYg1bJN9eQUA1hBC4OS208hX9W5gLJ7JdE5v
	7/2CUtzDRMcTxINPntrKJfsfkN75I1R/69db49DDxnUAAwtCH6yCUK0Ij+OHL0uYq5yoH6WFMYhDZ
	9LKGYnb9WiANDOyHwxdwR2LocFcJWX2dzCP2mT93mBnh5UIcsAxdCha5WEUJodtcL0DUiHu2W92Db
	XhfC3eTxs/tIGZZuXZrh59P51tD/WG7/tAXycyGfvvfDZTighmFPfk+vEmH3DrK9Mk76Mgmb7mrl+
	cvmQ74MNI9PQBWWZJVSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ33f-000000005gT-0aIL;
	Sat, 06 Jul 2024 10:54:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ33c-000000005fm-29tV
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 10:54:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C5AE7CE0A0C;
	Sat,  6 Jul 2024 10:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC8AC2BD10;
	Sat,  6 Jul 2024 10:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720263256;
	bh=Ttgueic0OcfhmSuHeW8NTeEojBfeKUJurNp/5wA3sm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFDuRnHJFUMEvcoo0y7z2mRgH7o7pSkmt2D6KY0xZTnTBWPuVPmIlSUYtXfvGTquQ
	 7Pps6uBJLlAN+j96Juc26hu+baujQc9CZFNe7XALsKEmur8SU0dJTKOeeOhShl/P7+
	 Uuk88TrxDAN5bT7xKhifI/auM1qANEjUQyHeXuM5khPmGwJ+HNegwzK/bZb2GeWRTK
	 K8mnnEeyTMQeWzmYCnLr1dl035dxdpYdcMKv4jdNRb6OWrCnqHRtwQPstblx7omazZ
	 sEpkwrdqo/nW/C5tE43IVpTgVkqYm9e++v4Ds6GtMEn/1+8CbN/09NeZAzsG/hU95T
	 NMj5RmM9MjlLw==
Date: Sat, 6 Jul 2024 18:40:07 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Inochi Amaoto <inochiama@outlook.com>, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Meng Zhang <zhangmeng.kevin@spacemit.com>
Subject: Re: [PATCH v3 08/11] riscv: dts: add initial SpacemiT K1 SoC device
 tree
Message-ID: <ZokfBzjvwN0IUQIX@xhacker>
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
 <20240703-k1-01-basic-dt-v3-8-12f73b47461e@gentoo.org>
 <Zoanxksn0nio4MPg@xhacker>
 <20240705063839.GA3042186@ofsar>
 <ZojEEAdUwxPJwqIS@xhacker>
 <20240706050556.GA3590714@ofsar>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240706050556.GA3590714@ofsar>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_035420_931405_3FFBE710 
X-CRM114-Status: GOOD (  47.16  )
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

On Sat, Jul 06, 2024 at 05:05:56AM +0000, Yixun Lan wrote:
> 
> On 12:12 Sat 06 Jul     , Jisheng Zhang wrote:
> > On Fri, Jul 05, 2024 at 06:38:39AM +0000, Yixun Lan wrote:
> > > 
> > > On 21:46 Thu 04 Jul     , Jisheng Zhang wrote:
> > > > On Wed, Jul 03, 2024 at 02:55:11PM +0000, Yixun Lan wrote:
> > > > > From: Yangyu Chen <cyy@cyyself.name>
> > > > > 
> > > > > Banana Pi BPI-F3 motherboard is powered by SpacemiT K1[1].
> > > > > 
> > > > > Key features:
> > > > > - 4 cores per cluster, 2 clusters on chip
> > > > > - UART IP is Intel XScale UART
> > > > > 
> > > > > Some key considerations:
> > > > > - ISA string is inferred from vendor documentation[2]
> > > > > - Cluster topology is inferred from datasheet[1] and L2 in vendor dts[3]
> > > > > - No coherent DMA on this board
> > > > >     Inferred by taking vendor ethernet and MMC drivers to the mainline
> > > > >     kernel. Without dma-noncoherent in soc node, the driver fails.
> > > > > - No cache nodes now
> > > > >     The parameters from vendor dts are likely to be wrong. It has 512
> > > > >     sets for a 32KiB L1 Cache. In this case, each set is 64B in size.
> > > > >     When the size of the cache line is 64B, it is a directly mapped
> > > > >     cache rather than a set-associative cache, the latter is commonly
> > > > >     used. Thus, I didn't use the parameters from vendor dts.
> > > > > 
> > > > > Currently only support booting into console with only uart, other
> > > > > features will be added soon later.
> > > > > 
> > > > > Link: https://docs.banana-pi.org/en/BPI-F3/SpacemiT_K1_datasheet [1]
> > > > > Link: https://developer.spacemit.com/#/documentation?token=BWbGwbx7liGW21kq9lucSA6Vnpb [2]
> > > > > Link: https://gitee.com/bianbu-linux/linux-6.1/blob/bl-v1.0.y/arch/riscv/boot/dts/spacemit/k1-x.dtsi [3]
> > > > > Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> > > > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > > > ---
> > > > >  arch/riscv/boot/dts/spacemit/k1.dtsi | 376 +++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 376 insertions(+)
> > > > > 
> > > > > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > > > new file mode 100644
> > > > > index 0000000000000..a076e35855a2e
> > > > > --- /dev/null
> > > > > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > > > > @@ -0,0 +1,376 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > > > > +/*
> > > > > + * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
> > > > > + */
> > > > > +
> > > > > +/dts-v1/;
> > > > > +/ {
> > > > > +	#address-cells = <2>;
> > > > > +	#size-cells = <2>;
> > > > > +	model = "SpacemiT K1";
> > > > > +	compatible = "spacemit,k1";
> > > > > +
> > > > > +
...
> > > > > +	soc {
> > > > > +		compatible = "simple-bus";
> > > > > +		interrupt-parent = <&plic>;
> > > > > +		#address-cells = <2>;
> > > > > +		#size-cells = <2>;
> > > > > +		dma-noncoherent;
> > > > > +		ranges;
> > > > > +
> > > > > +		uart0: serial@d4017000 {
> > > > > +			compatible = "spacemit,k1-uart", "intel,xscale-uart";
> > > > 
> > > > no, this is not a correct hw modeling. The doc on spacemit says
> > > > all the uart support 64 bytes FIFO, declaring xscale only makes
> > > > use of 32 bytes FIFO.
> > > yes, I also noticed it's 64 bytes FIFO
> > > 
> > > > 
> > > > IIRC, 8250_pxa is a xscale uart with 64 bytes FIFO, so this should be
> > > > "mrvl,pxa-uart" or "mrvl,mmp-uart"
> > > 
> > > 
> > > for mrvl,pxa-uart, I think you imply to use drivers/tty/serial/8250/8250_pxa.c,
> > > which turn out doesn't work on k1 SoC, for the record, we need to adjust
> > 
> > Really? I just tried "mrvl,pxa-uart" with rc6, it works perfectly, and the FIFO
> > in the driver logic is 64bytes now. Am I misssing something or you never tried it?
> > 
> Ok, I realised it's the clock issue
> 
> still, I'm not fully convinced about using "mrvl,pxa-uart",
> e.g this driver hardcoded tz_loadsz to 32, not sure if K1 suffer same problem
> 5208e7ced520 ("serial: 8250_pxa: Configure tx_loadsz to match FIFO IRQ level")

I believe the problem commit 5208e7ced520 tries to solve is: the
mmp|pxa-uart only support threshold up to 32Bytes, tz_loadsz will be
fifo size by default, this will cause probleme with 64Bytes FIFO.

> 
> also, what's the preference when choosing driver between 8250_pxa.c vs 8250_of.c?

Good question. I have no preference. But there are two problems with
8250_of, I have sent out patches[1][2] to address them.

After these two patches, both the earlycon and uart FIFO logic work too
with below dts properties:
		uart0: serial@d4017000 {
			compatible = "mrvl,mmp-uart";
			...
                        reg-shift = <2>;
                        reg-io-width = <4>;
                        tx-threshold = <32>;
                        fifo-size = <64>;
                        no-loopback-test;
			...
		}

Link: https://lore.kernel.org/linux-riscv/20240706082928.2238-1-jszhang@kernel.org/ [1]
Link: https://lore.kernel.org/linux-riscv/20240706101856.3077-1-jszhang@kernel.org/ [2]

> it occur to me that 8250_pxa.c is more specially tailored for pxa hardware, while
> 8250_of.c is more generic.. besides, should we consider one more step if we want to

there's a work around for Erratum #74 in 8250_pxa, while I believe the
Errata doesn't exisit in K1, so from this PoV it seems 8250_of is
better, no?

> support DMA mode in the future (vendor uart driver has DMA support)?

Adding dma engine support to 8250_of is doable.

> 
> 
> > >  drivers/tty/serial/8250/Kconfig to enable the driver for ARCH_SPACEMIT,
> > >  and change uart compatible to "spacemit,k1-uart", "mrvl,pxa-uart"
> > > 
> > > for mrvl,mmp-uart, I see two choices, one using 8250_pxa.c which has same result
> > > as mrvl,pxa-uart, another choice would using the driver of 8250_of.c 
> > > and it work as same as "intel,xscale-uart", I don't see any difference..
> > > 
> > > P.S: there is possibly a side problem that "mrvl,mmp-uart" from 8250_of.c doesn't 
> > > really compatile with "mrvl,mmp-uart" from 8250_pxa.c, but I think it's another story
> 
> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
