Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6CDC64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 18:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnG4js29fpU9FdGR0pzPbnlTL8Y4ooTdYB4e7pDFRr4=; b=Mxz5bEh80QQtgN0KaugkVpIAnS
	evacRQ5CZwOd8XXZ6Dsj2+8mx/WE49F4roWhohOyhusUMNZbDQxu0bJo0i1qo6GlzNC5/ZbFw4U82
	W1JZGJKRWBD5AyeXpzPkx8zJQLvILOut3ogCnXb/9KkgG0ThyoGHBxYLcjUOmpvbr8uBddzDDpIRN
	GLFJ11qTo/Mt/t638cAb3mkStyq7nADmfLcEUR66SHgj51kq7NwdV3k9sUHqP0qGNZnwMkwJQ8kA2
	ou85sZfQzm29yudNWvMafNOLRAF9dIY3IW8YNnb4qwRbgIBp+8s0dJvMs5VmEPeLSAUNo9kHiL1R5
	AbvPwVaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWhxs-00Af5O-63; Mon, 27 Feb 2023 18:11:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWhxl-00Af3b-JY
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 18:11:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4F1C960EF4;
	Mon, 27 Feb 2023 18:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFC2C433D2;
	Mon, 27 Feb 2023 18:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677521459;
	bh=DOHUe/rKd4Y5se+LG1sBl0aEKX8kJIlO/WrMBCDbdHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqfwDOSlaSp5BGPrGTKvNyP1z/82q2jPCl9GCkK0TE/mwKVwg4OVRMb5mqpmnKe1y
	 T1boAN57lDvG1V7nmVpu14zrcNZqR9gBvGGzs/hGRxeltb3R6QiXpFftkn4JTH4CqZ
	 W6g+0dCzNFx2giXVyVAxyvYxgUHUHHZcnY730nmic7gG1aRPXzYTwwU2Wm40cKoVmj
	 jPH6NNOg2gELeCg+Pb+uk/fOLFYyZSomCkD0zXUJ01nv/+DSzXUm9hJ61KRoIDmhmJ
	 k+jMyqF9dan2/HyBoAzPNhnB0FLYVJaLSf3HLra11CBnBq1cH5SGq5R6vcCecpWe8n
	 cF5PNLOJx93mQ==
Date: Mon, 27 Feb 2023 18:10:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 17/19] riscv: dts: starfive: Add initial StarFive
 JH7110 device tree
Message-ID: <Y/zyLLdpf4zTXISh@spud>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-18-hal.feng@starfivetech.com>
 <Y/T5eL4s8FSlbgQh@spud>
 <af029196-6ebe-aae1-af7e-fdb327c14c82@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <af029196-6ebe-aae1-af7e-fdb327c14c82@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_101101_758562_2B8D3D75 
X-CRM114-Status: GOOD (  19.57  )
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
Content-Type: multipart/mixed; boundary="===============3207271385102522464=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3207271385102522464==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jchMPtDjeYaZT9S4"
Content-Disposition: inline


--jchMPtDjeYaZT9S4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2023 at 03:16:51PM +0800, Hal Feng wrote:
> On Tue, 21 Feb 2023 17:03:52 +0000, Conor Dooley wrote:
> > On Tue, Feb 21, 2023 at 10:46:43AM +0800, Hal Feng wrote:
> >=20
> >> +		S7_0: cpu@0 {
> >> +			compatible =3D "sifive,s7", "riscv";
> >> +			reg =3D <0>;
> >> +			d-cache-block-size =3D <64>;
> >> +			d-cache-sets =3D <64>;
> >> +			d-cache-size =3D <8192>;
> >> +			d-tlb-sets =3D <1>;
> >> +			d-tlb-size =3D <40>;
> >> +			device_type =3D "cpu";
> >> +			i-cache-block-size =3D <64>;
> >> +			i-cache-sets =3D <64>;
> >> +			i-cache-size =3D <16384>;
> >> +			i-tlb-sets =3D <1>;
> >> +			i-tlb-size =3D <40>;
> >> +			mmu-type =3D "riscv,sv39";
> >> +			next-level-cache =3D <&ccache>;
> >> +			riscv,isa =3D "rv64imac_zicsr_zba_zbb";
> >=20
> > I still think that adding just zicsr here is pointless. If you're going
> > to be specific, why not also mention that you have zifencei too?
>=20
> I would like to remove "_zicsr" in the next version. Thanks.
>=20
> >=20
> >> +			tlb-split;
> >> +			status =3D "disabled";
> >> +
> >> +			cpu0_intc: interrupt-controller {
> >> +				compatible =3D "riscv,cpu-intc";
> >> +				interrupt-controller;
> >> +				#interrupt-cells =3D <1>;
> >> +			};
> >> +		};
> >=20
> > Rest of this looks fine to me though, thanks for adding the s7
> > compatible and zba/zbb :)
>=20
> Thanks for your review. :)

I hadn't actually given you one yet ;)

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--jchMPtDjeYaZT9S4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/zyFQAKCRB4tDGHoIJi
0uCOAP0RG8BuWjiHLKsk9Ta/tG1NUylVpgAZoi/pMyqsZdEj3AEA6Oh4RV2oBS2o
sASwV0YiwNzQ/L/MsZJwES9WoODoXQ4=
=WQDI
-----END PGP SIGNATURE-----

--jchMPtDjeYaZT9S4--


--===============3207271385102522464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3207271385102522464==--

