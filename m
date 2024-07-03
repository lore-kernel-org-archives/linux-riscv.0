Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771C3C30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 09:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LI3sTx4nHwCkNTNXT3p2eN7fA/5PrLmlyzO5ZBjK0kM=; b=ZJBhUOplSDod7P
	cucW1F1mMQUfnFBfMrspL22EouTUYsJ9YrE2B5CFZz0ngAUfZMJKHHo0j1wIWScEMuPoXrC1C+lPR
	YCUUG4apN6oeJkIfamkhVbP/8J2gt8sYjU9eI/hO7w8XwtnmYpywUQ587yZ+NWg7a/NbxNEeUMmW1
	dHEfS8F4fP8ouZEvARf0Rh8K/xc10kWfHkLsUOUEGeEEvR4dXiuYdYQOiX/b8zYlHlDtOEuNIL+ql
	tXTQixg7FNdXrOHJESsikk/SWlTeAOdPmtx3loeKQgXvL7LhKntlrynZuj1uTMde/AV0vbOaA4qj2
	BLEM9vCgB8YbFCyG7KWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwTz-00000009agp-1NSp;
	Wed, 03 Jul 2024 09:40:59 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwTv-00000009ag4-3SaP
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 09:40:57 +0000
Date: Wed, 3 Jul 2024 09:40:49 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v2 08/10] riscv: dts: add initial SpacemiT K1 SoC device
 tree
Message-ID: <20240703094049.GB2676251@ofsar>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
 <20240627-k1-01-basic-dt-v2-8-cc06c7555f07@gentoo.org>
 <CAJM55Z9jeAQTsVjRiLeofDm1RyMWCuHXC0a-pdKtpUiTkSjJCA@mail.gmail.com>
 <20240702012847.GA2447193@ofsar>
 <IA1PR20MB4953C031CB453AA0E51657B3BBDC2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240702-appease-attire-6afbe758bf0f@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240702-appease-attire-6afbe758bf0f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_024055_913535_A5081B49 
X-CRM114-Status: GOOD (  31.21  )
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

Hi Conor:

On 16:25 Tue 02 Jul     , Conor Dooley wrote:
> On Tue, Jul 02, 2024 at 09:35:45AM +0800, Inochi Amaoto wrote:
> > On Tue, Jul 02, 2024 at 01:28:47AM GMT, Yixun Lan wrote:
> > > On 12:49 Mon 01 Jul     , Emil Renner Berthing wrote:
> > > > Yixun Lan wrote:
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
> > > > > - Cluster topology is inferred from datasheet[1] and L2 in vendor=
 dts[3]
> > > > > - No coherent DMA on this board
> > > > >     Inferred by taking vendor ethernet and MMC drivers to the mai=
nline
> > > > >     kernel. Without dma-noncoherent in soc node, the driver fails.
> > > > > - No cache nodes now
> > > > >     The parameters from vendor dts are likely to be wrong. It has=
 512
> > > > >     sets for a 32KiB L1 Cache. In this case, each set is 64B in s=
ize.
> > > > >     When the size of the cache line is 64B, it is a directly mapp=
ed
> > > > >     cache rather than a set-associative cache, the latter is comm=
only
> > > > >     used. Thus, I didn't use the parameters from vendor dts.
> > > > >
> > > > > Currently only support booting into console with only uart, other
> > > > > features will be added soon later.
> > > > >
> > > ...
> > > =

> > > > > +		clint: timer@e4000000 {
> > > > > +			compatible =3D "spacemit,k1-clint", "sifive,clint0";
> > > > > +			reg =3D <0x0 0xe4000000 0x0 0x10000>;
> > > > > +			interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>,
> > > > > +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> > > > > +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> > > > > +					      <&cpu3_intc 3>, <&cpu3_intc 7>,
> > > > > +					      <&cpu4_intc 3>, <&cpu4_intc 7>,
> > > > > +					      <&cpu5_intc 3>, <&cpu5_intc 7>,
> > > > > +					      <&cpu6_intc 3>, <&cpu6_intc 7>,
> > > > > +					      <&cpu7_intc 3>, <&cpu7_intc 7>;
> > > > > +		};
> > > > > +
> > > > > +		uart0: serial@d4017000 {
> > > > > +			compatible =3D "spacemit,k1-uart", "intel,xscale-uart";
> > > > > +			reg =3D <0x0 0xd4017000 0x0 0x100>;
> > > > > +			interrupts =3D <42>;
> > > > > +			clock-frequency =3D <14857000>;
> > > > > +			reg-shift =3D <2>;
> > > > > +			reg-io-width =3D <4>;
> > > > > +			status =3D "disabled";
> > > > > +		};
> > > > > +
> > > > > +		/* note: uart1 skipped */
> > > > =

> > > > The datasheet page you link to above says "-UART (=D710)", but here=
 you're
> > > > skipping one of them. Why? I can see the vendor tree does the same,=
 but it
> > > > would be nice with an explanation of what's going on.
> > > > =

> > > /* note: uart1 in 0xf0612000, reserved for TEE usage */
> > > I would put something like this, does this sound ok to you?
> > > =

> > > more detail, iomem range from 0xf000,0000 - 0xf080,0000 are dedicated=
 for TEE purpose,
> > > It won't be exposed to Linux once TEE feature is enabled..
> > > =

> > > skipping uart1 may make people confused but we are trying to follow d=
atasheet..
> > =

> > Instead of skipping it, I suggest adding this to reserved-memory area, =

> > which make all node visible and avoid uart1 being touched by mistake.
> =

> No, don't make it reserved-memory - instead add it as
> status =3D "reserved"; /* explanation for why */
Ok, got

> Also, I'd appreciate if the nodes were sorted by unit address in the
> dtsi.
so I would move "plic, clint" after node of uart9 as this suggestion

for uart1, its unit-address is 0xf0610000, it should be moved to after clint
(once unit-address sorted), if we follow this rule strictly.
but it occur to me this is not very intuitive, if no objection, I would put
it between uart0 and uart2 (thus slightly break the rule..)

P.S: I can cook a separated patch for adding uart1 node, should better for =
review

-- =

Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
