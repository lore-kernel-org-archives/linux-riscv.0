Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A56C83F12
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 12:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WhvN3ExpsxI3mrEDtHSuHZ64xjBGE9KC3Ai7CwVZeQ=; b=OuAZK7FXEaR5StYP/D5B36p2YE
	xrhcXeNxNlHyDE+eUS20iAhlphihM6Bbtn0oRvo0VMJZtU/bIRbeXHbMVIoC7GDNtlvN52xg/ZGki
	E1RDOMySRG4M9A9g7EWjNycjSwtkD47grm8vw/JuQGe0S0zahDxqXq6zNok2jsVYX8B3XzVHAG2MW
	Mgh0G8hCF1wnN3cefvNaMABdLi+W4cw/Jwhld2rHE1HneWOqp5qyu7ZoiZbLdamdOd/QhRLV3lOZO
	/F7V09xhopB8t5vtlxhMOQHlPBV83AhuutpOUOt7wEOFWYoYgdPQZznl99H+GFiqLrhZ3+uTMeLbj
	1L4QABKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qab0L-009X1P-23;
	Mon, 28 Aug 2023 12:06:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qab0I-009X12-0s
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 12:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693224358; x=1724760358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O6MRAyoEtfQ9DRy06G8t5QMNAD8AO1fOCtzMUgHmNmw=;
  b=sSEr8XM9lBdv7z4n1nqReQOyLuezf+QUVXL9UGIJEUd3tUFUIBSswg4o
   AZ/LY0G7eMaYzbdIVtOmUKXvne3tmmJfgDrnEKNX2jX7pCGDq5iBgRdC2
   mtYzfZWTL2dZs9dkZzV1ccRfxdL7ixwfvXUU8AUL2U4KthjuTw1v8ssyR
   oni3E6nYDdjE8fs4GqySXHwPzkLu5djvHimXk+97x6qoxIhxOGgt0KJC+
   rOb4GFAnN/ocnLvoIb8s/fOQpOJh6ip8ZSUOQ3fJ3iJ6LmFvPo1ecMXWB
   PFmZTV7yd+zyC3TDjzls80fHM7QfMwPKRqEZT0HIVnjm2ZUTMJtgqZoXp
   A==;
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="asc'?scan'208";a="1589705"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Aug 2023 05:05:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 28 Aug 2023 05:05:50 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 28 Aug 2023 05:05:48 -0700
Date: Mon, 28 Aug 2023 13:05:06 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [-next v1] riscv: dts: starfive: visionfive 2: Enable usb0 and
 fix tdm pins sort order
Message-ID: <20230828-hence-unguarded-2020c68246e8@wendy>
References: <20230828115239.16012-1-hal.feng@starfivetech.com>
 <3a5e343c-a0cc-8d1b-eadc-82c3d038aaa1@linaro.org>
MIME-Version: 1.0
In-Reply-To: <3a5e343c-a0cc-8d1b-eadc-82c3d038aaa1@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_050558_424582_AA7C0321 
X-CRM114-Status: GOOD (  17.51  )
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
Content-Type: multipart/mixed; boundary="===============6490581745401791724=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6490581745401791724==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MhLadpHa6s8sAqHw"
Content-Disposition: inline

--MhLadpHa6s8sAqHw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 01:54:53PM +0200, Krzysztof Kozlowski wrote:
> On 28/08/2023 13:52, Hal Feng wrote:
> > usb0 was disabled by mistake when merging, so enable it.
> > tdm_pins node should be sorted alphabetically.
> >=20
> > Fixes: e7c304c0346d ("riscv: dts: starfive: jh7110: add the node and pi=
ns configuration for tdm")
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  .../jh7110-starfive-visionfive-2.dtsi         | 49 ++++++++++---------
> >  1 file changed, 25 insertions(+), 24 deletions(-)
> >=20
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.=
dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > index d79f94432b27..382dfb5e64e4 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > @@ -440,30 +440,6 @@ GPOEN_ENABLE,
> >  		};
> >  	};
> > =20
> > -	uart0_pins: uart0-0 {
> > -		tx-pins {
> > -			pinmux =3D <GPIOMUX(5, GPOUT_SYS_UART0_TX,
> > -					     GPOEN_ENABLE,
> > -					     GPI_NONE)>;
> > -			bias-disable;
> > -			drive-strength =3D <12>;
> > -			input-disable;
> > -			input-schmitt-disable;
> > -			slew-rate =3D <0>;
> > -		};
> > -
> > -		rx-pins {
> > -			pinmux =3D <GPIOMUX(6, GPOUT_LOW,
> > -					     GPOEN_DISABLE,
> > -					     GPI_SYS_UART0_RX)>;
> > -			bias-disable; /* external pull-up */
> > -			drive-strength =3D <2>;
> > -			input-enable;
> > -			input-schmitt-enable;
> > -			slew-rate =3D <0>;
> > -		};
> > -	};
> > -
> >  	tdm_pins: tdm-0 {
> >  		tx-pins {
> >  			pinmux =3D <GPIOMUX(44, GPOUT_SYS_TDM_TXD,
> > @@ -497,6 +473,30 @@ GPOEN_DISABLE,
> >  			input-enable;
> >  		};
> >  	};
> > +
> > +	uart0_pins: uart0-0 {
> > +		tx-pins {
> > +			pinmux =3D <GPIOMUX(5, GPOUT_SYS_UART0_TX,
> > +					     GPOEN_ENABLE,
> > +					     GPI_NONE)>;
> > +			bias-disable;
> > +			drive-strength =3D <12>;
> > +			input-disable;
> > +			input-schmitt-disable;
> > +			slew-rate =3D <0>;
> > +		};
> > +
> > +		rx-pins {
> > +			pinmux =3D <GPIOMUX(6, GPOUT_LOW,
> > +					     GPOEN_DISABLE,
> > +					     GPI_SYS_UART0_RX)>;
> > +			bias-disable; /* external pull-up */
> > +			drive-strength =3D <2>;
> > +			input-enable;
> > +			input-schmitt-enable;
> > +			slew-rate =3D <0>;
> > +		};
>=20
>=20
> What is fixed in this hunk? Order of nodes is just a style, not a bug
> needing backports.

Please split this in two parts, with one for my screwed up conflict
resolution & one for the node ordering.

Thanks,
Conor.

--MhLadpHa6s8sAqHw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOyNcgAKCRB4tDGHoIJi
0uqlAP4sF6J64UT/Pd03FqT46P6r0Od0LOWesJCEDCV4129ZIQEAqq0rQy6enR9p
UV3JE+uFdxZlRCqpcfw5cCHNW+7uFwQ=
=+HXt
-----END PGP SIGNATURE-----

--MhLadpHa6s8sAqHw--


--===============6490581745401791724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6490581745401791724==--

