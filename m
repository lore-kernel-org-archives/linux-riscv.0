Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29107C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 15:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+f3bLAEoLIYfCV8uDnth4QGofwx56jAC4pEkZ9tPKU=; b=3H1evw3jB71ycLlTriP1PVWbme
	H00ogHiuFL6Ih4vgjjSotMj+HeRObt+1pfI1rRZ9yhFxxch3TndqlEp38l2M6Ax81V2IVM+KfxLSt
	GJJohtPAzcsrTB1AQpUdKexAbCbXE2VqbiP/evQje7xfg6K5/gicBPCt7UvOeTdWW414w5DIueaZJ
	aZAxLfiG46ofBn89JNF4zIAbAwyqTM9ne7qmg2QqLnRaQR7WASEUiBbrmKb0gs6lzsxxEjZxaknc0
	b6eDc8LAbYOevJwrEXmlfTLV9brsmAEfBMFAUzVNYHnk3N8kyxXID4A8xpypSymsrGHQzJIpMS8VK
	SRvGBe5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOfNc-00000007CDT-1qAz;
	Tue, 02 Jul 2024 15:25:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOfNZ-00000007CCt-2RFD
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 15:25:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE54D61E09;
	Tue,  2 Jul 2024 15:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523A0C116B1;
	Tue,  2 Jul 2024 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719933912;
	bh=cc7nvHqqj6c3V+LFIi1X86+pPFAUbngIvHertngi76w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OhK+QYhE7XaL488ISYDfSItk/bnFEpOvq9q6T8ma2uPOF1C2yzK2VHrRMvApxk+yi
	 l9CfI7GmUe2VQKzm/CJbV7E+Drx5kPrTL+YH5sNAbp/CgVgHrf5naOTT11Dj8fgy5m
	 3HJ6rwcgKb+swO0wtLyfIVWndxnTo287pRy7YYlRVh6kiZ1NDkEMe4bnah5/teQwsL
	 PexfjxVWll9z7nCb06g6s4wZ77uCimP5ayt2mmwxDLMxMyxaCrkQyx6rA0FbOncQKB
	 lGhQQJu22xAdPvM9YPx9cDG1LZejEOIulj0QmT15yu71eH9GOEtLqTMpK2KFlLSUkc
	 0YUj40EpeB3Pw==
Date: Tue, 2 Jul 2024 16:25:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Yixun Lan <dlan@gentoo.org>,
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
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v2 08/10] riscv: dts: add initial SpacemiT K1 SoC device
 tree
Message-ID: <20240702-appease-attire-6afbe758bf0f@spud>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
 <20240627-k1-01-basic-dt-v2-8-cc06c7555f07@gentoo.org>
 <CAJM55Z9jeAQTsVjRiLeofDm1RyMWCuHXC0a-pdKtpUiTkSjJCA@mail.gmail.com>
 <20240702012847.GA2447193@ofsar>
 <IA1PR20MB4953C031CB453AA0E51657B3BBDC2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953C031CB453AA0E51657B3BBDC2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_082513_731085_C1FB2C01 
X-CRM114-Status: GOOD (  30.83  )
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
Content-Type: multipart/mixed; boundary="===============1468994220082178594=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1468994220082178594==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8t7ClsDF1V/WRNDh"
Content-Disposition: inline


--8t7ClsDF1V/WRNDh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 09:35:45AM +0800, Inochi Amaoto wrote:
> On Tue, Jul 02, 2024 at 01:28:47AM GMT, Yixun Lan wrote:
> > On 12:49 Mon 01 Jul     , Emil Renner Berthing wrote:
> > > Yixun Lan wrote:
> > > > From: Yangyu Chen <cyy@cyyself.name>
> > > >
> > > > Banana Pi BPI-F3 motherboard is powered by SpacemiT K1[1].
> > > >
> > > > Key features:
> > > > - 4 cores per cluster, 2 clusters on chip
> > > > - UART IP is Intel XScale UART
> > > >
> > > > Some key considerations:
> > > > - ISA string is inferred from vendor documentation[2]
> > > > - Cluster topology is inferred from datasheet[1] and L2 in vendor d=
ts[3]
> > > > - No coherent DMA on this board
> > > >     Inferred by taking vendor ethernet and MMC drivers to the mainl=
ine
> > > >     kernel. Without dma-noncoherent in soc node, the driver fails.
> > > > - No cache nodes now
> > > >     The parameters from vendor dts are likely to be wrong. It has 5=
12
> > > >     sets for a 32KiB L1 Cache. In this case, each set is 64B in siz=
e.
> > > >     When the size of the cache line is 64B, it is a directly mapped
> > > >     cache rather than a set-associative cache, the latter is common=
ly
> > > >     used. Thus, I didn't use the parameters from vendor dts.
> > > >
> > > > Currently only support booting into console with only uart, other
> > > > features will be added soon later.
> > > >
> > ...
> >=20
> > > > +		clint: timer@e4000000 {
> > > > +			compatible =3D "spacemit,k1-clint", "sifive,clint0";
> > > > +			reg =3D <0x0 0xe4000000 0x0 0x10000>;
> > > > +			interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>,
> > > > +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> > > > +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> > > > +					      <&cpu3_intc 3>, <&cpu3_intc 7>,
> > > > +					      <&cpu4_intc 3>, <&cpu4_intc 7>,
> > > > +					      <&cpu5_intc 3>, <&cpu5_intc 7>,
> > > > +					      <&cpu6_intc 3>, <&cpu6_intc 7>,
> > > > +					      <&cpu7_intc 3>, <&cpu7_intc 7>;
> > > > +		};
> > > > +
> > > > +		uart0: serial@d4017000 {
> > > > +			compatible =3D "spacemit,k1-uart", "intel,xscale-uart";
> > > > +			reg =3D <0x0 0xd4017000 0x0 0x100>;
> > > > +			interrupts =3D <42>;
> > > > +			clock-frequency =3D <14857000>;
> > > > +			reg-shift =3D <2>;
> > > > +			reg-io-width =3D <4>;
> > > > +			status =3D "disabled";
> > > > +		};
> > > > +
> > > > +		/* note: uart1 skipped */
> > >=20
> > > The datasheet page you link to above says "-UART (=D710)", but here y=
ou're
> > > skipping one of them. Why? I can see the vendor tree does the same, b=
ut it
> > > would be nice with an explanation of what's going on.
> > >=20
> > /* note: uart1 in 0xf0612000, reserved for TEE usage */
> > I would put something like this, does this sound ok to you?
> >=20
> > more detail, iomem range from 0xf000,0000 - 0xf080,0000 are dedicated f=
or TEE purpose,
> > It won't be exposed to Linux once TEE feature is enabled..
> >=20
> > skipping uart1 may make people confused but we are trying to follow dat=
asheet..
>=20
> Instead of skipping it, I suggest adding this to reserved-memory area,=20
> which make all node visible and avoid uart1 being touched by mistake.

No, don't make it reserved-memory - instead add it as
status =3D "reserved"; /* explanation for why */
Also, I'd appreciate if the nodes were sorted by unit address in the
dtsi.

Thanks,
Conor.

--8t7ClsDF1V/WRNDh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoQb0gAKCRB4tDGHoIJi
0tEwAQDbZqSQrUgTmMpfdmDuQPr0P0SBOkFpJs0/aPbXIvDa3AEAltJ5Hgikal1T
3Be6wU3wIZBpw+4BQ/NmiOt4fe2a7AA=
=zeit
-----END PGP SIGNATURE-----

--8t7ClsDF1V/WRNDh--


--===============1468994220082178594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1468994220082178594==--

