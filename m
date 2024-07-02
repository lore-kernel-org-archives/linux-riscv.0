Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55692C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 01:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=untJZtgZZrVtWo+RtnwIX/zQel/OV1WBIFI/Bs7XkbY=; b=AzUDzfadgJPOAZ
	D5mhl1W9wLfxSEkBy975h+seMOIDEk8wWkIDz9GBdXUIt2kgwO9Eg6F1dWk/sXWjUrgnzXnnbV/6h
	BzmHtlKLjJs7+N8j7AC4go9PHf73+y8wPo/cWGBMn+kO88CkEQwbiZdoAiyniWmO1uZtByr6PhQfy
	MuqVZmKwAy022kRpNASJ7wRcnxz1CUyWWVOtgOpBMzsH4COvZE7PF4mm6I4c3xsw4AfzPG07NDrlC
	uWDILpVc4eOE927gKfBF6X0ZNeI2UgGYStERnOqoamKUwpZQvrrqu/iFPRKJCZJH6osr9hz9DIewf
	GJUrFWX6jIGWmYJHTNww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOSKI-00000005Gra-2JRV;
	Tue, 02 Jul 2024 01:28:58 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOSKG-00000005GrA-318b
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 01:28:58 +0000
Date: Tue, 2 Jul 2024 01:28:47 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
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
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v2 08/10] riscv: dts: add initial SpacemiT K1 SoC device
 tree
Message-ID: <20240702012847.GA2447193@ofsar>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
 <20240627-k1-01-basic-dt-v2-8-cc06c7555f07@gentoo.org>
 <CAJM55Z9jeAQTsVjRiLeofDm1RyMWCuHXC0a-pdKtpUiTkSjJCA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z9jeAQTsVjRiLeofDm1RyMWCuHXC0a-pdKtpUiTkSjJCA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_182856_812283_B25CF151 
X-CRM114-Status: GOOD (  21.56  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12:49 Mon 01 Jul     , Emil Renner Berthing wrote:
> Yixun Lan wrote:
> > From: Yangyu Chen <cyy@cyyself.name>
> >
> > Banana Pi BPI-F3 motherboard is powered by SpacemiT K1[1].
> >
> > Key features:
> > - 4 cores per cluster, 2 clusters on chip
> > - UART IP is Intel XScale UART
> >
> > Some key considerations:
> > - ISA string is inferred from vendor documentation[2]
> > - Cluster topology is inferred from datasheet[1] and L2 in vendor dts[3]
> > - No coherent DMA on this board
> >     Inferred by taking vendor ethernet and MMC drivers to the mainline
> >     kernel. Without dma-noncoherent in soc node, the driver fails.
> > - No cache nodes now
> >     The parameters from vendor dts are likely to be wrong. It has 512
> >     sets for a 32KiB L1 Cache. In this case, each set is 64B in size.
> >     When the size of the cache line is 64B, it is a directly mapped
> >     cache rather than a set-associative cache, the latter is commonly
> >     used. Thus, I didn't use the parameters from vendor dts.
> >
> > Currently only support booting into console with only uart, other
> > features will be added soon later.
> >
...

> > +		clint: timer@e4000000 {
> > +			compatible =3D "spacemit,k1-clint", "sifive,clint0";
> > +			reg =3D <0x0 0xe4000000 0x0 0x10000>;
> > +			interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>,
> > +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> > +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> > +					      <&cpu3_intc 3>, <&cpu3_intc 7>,
> > +					      <&cpu4_intc 3>, <&cpu4_intc 7>,
> > +					      <&cpu5_intc 3>, <&cpu5_intc 7>,
> > +					      <&cpu6_intc 3>, <&cpu6_intc 7>,
> > +					      <&cpu7_intc 3>, <&cpu7_intc 7>;
> > +		};
> > +
> > +		uart0: serial@d4017000 {
> > +			compatible =3D "spacemit,k1-uart", "intel,xscale-uart";
> > +			reg =3D <0x0 0xd4017000 0x0 0x100>;
> > +			interrupts =3D <42>;
> > +			clock-frequency =3D <14857000>;
> > +			reg-shift =3D <2>;
> > +			reg-io-width =3D <4>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		/* note: uart1 skipped */
> =

> The datasheet page you link to above says "-UART (=D710)", but here you're
> skipping one of them. Why? I can see the vendor tree does the same, but it
> would be nice with an explanation of what's going on.
> =

/* note: uart1 in 0xf0612000, reserved for TEE usage */
I would put something like this, does this sound ok to you?

more detail, iomem range from 0xf000,0000 - 0xf080,0000 are dedicated for T=
EE purpose,
It won't be exposed to Linux once TEE feature is enabled..

skipping uart1 may make people confused but we are trying to follow datashe=
et..


-- =

Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
