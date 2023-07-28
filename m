Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944ECC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 11:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxUghrZyEuM6aPjJQtLhWV7ZJJA//Vj6TzFtyl6Nwk4=; b=h2DgX19KdCsssCjE4kzC0J0z5c
	MkZF9dMPKLdqXlJ53tv4UkP2ywNr3a25fV4il/sHole/mzUwFPUqzJZXtC91P57PescmhbUUPwBu/
	vSTfHW+l5BW3N9V5RaWLFLRO9kNJVaoev/7SGF73qlGTj8muM7piiUZLAAketcWolqOPMmcHirEJi
	1ymVYQ26RbxUJwhGhnRquMYpcSb5oC1hARt4K+QZN8nLFOEVdA9kQHZ4+OdxXQJveG3qKy5mvmysP
	Mav8aDcBrMSzklZtIQpce+IDDIIUm4OT4IBMMjDCkremUUnbhanRDaw0EWLxfYCtrYCH9eut5d3rl
	lzypb2Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPLJf-00371R-16;
	Fri, 28 Jul 2023 11:07:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPLJc-00370U-1L
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 11:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690542444; x=1722078444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Aka8gvuYwnBE1qjG5Cx27//2rg7/9tsuBUh8r9GeeDU=;
  b=1Kfzbrru1N55O5j/yQvvKEQyQcgET5Jycy/5qjla6r+kJy1jL5XBYcui
   nuS+R+NrUFcQR8q9UwJxgoCXUWgpcVJl7mBLQ63JWiJzleRP22ol1TUE9
   4Ell5CZuSfeGvirsVlJPYAPJW9XjG/ECDwtpJBcM31JPtPNvEqDjKdcCC
   00SqKtJ3u/boypd3UnoxbJryyfMkR//9M3uekEujZPkT8wyCpHa5L+Hjx
   T46OBHGmf83QWpAH9HCZO8UzCePvD2rCy/NU1LauYO2WzzARn4I1Hk9ll
   Y2NLvgrB/J0E3xsRYruPLjebJqU8SKPpulVKrP5111k0jqvFBQSgEUfaC
   g==;
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="asc'?scan'208";a="226626857"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2023 04:07:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 04:07:12 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 28 Jul 2023 04:07:10 -0700
Date: Fri, 28 Jul 2023 12:06:35 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Eric Lin <eric.lin@sifive.com>
CC: Conor Dooley <conor@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <zong.li@sifive.com>,
	<greentime.hu@sifive.com>, <vincent.chen@sifive.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
Message-ID: <20230728-corrosive-crown-54dfd6dd3919@wendy>
References: <20230720135125.21240-1-eric.lin@sifive.com>
 <20230720135125.21240-2-eric.lin@sifive.com>
 <20230720-slept-guru-216e2803061e@spud>
 <20230728-facedown-husked-9813fa79d9a0@wendy>
 <CAPqJEFrObCSEXx+qTOp_JY3m5Ano59x=U4fFCBJ32ufLUx+6PA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPqJEFrObCSEXx+qTOp_JY3m5Ano59x=U4fFCBJ32ufLUx+6PA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_040724_532509_424623EF 
X-CRM114-Status: GOOD (  20.99  )
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
Content-Type: multipart/mixed; boundary="===============8797574463492317308=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8797574463492317308==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yr02wk+FfM9y0tjy"
Content-Disposition: inline

--Yr02wk+FfM9y0tjy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 04:24:08PM +0800, Eric Lin wrote:
> On Fri, Jul 28, 2023 at 3:06=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> > On Thu, Jul 20, 2023 at 06:10:51PM +0100, Conor Dooley wrote:
> > > On Thu, Jul 20, 2023 at 09:51:19PM +0800, Eric Lin wrote:

> > > > +description:
> > > > +  The SiFive Private L2 Cache Controller is per core and
> > > > +  communicates with both the upstream L1 caches and
> > > > +  downstream L3 cache or memory, enabling a high-performance
> > > > +  cache subsystem.
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/cache-controller.yaml#
> > > > +
> > >
> > > I'm pretty sure that I pointed out last time around that you need to =
add
> > > something like in the ccache driver:
> > >
> > > select:
> > >   properties:
> > >     compatible:
> > >       contains:
> > >         enum:
> > >           - sifive,ccache0
> > >           - sifive,fu540-c000-ccache
> > >           - sifive,fu740-c000-ccache
> > >
> > > otherwise this binding will be used for anything containing "cache" in
> > > the dt-binding.
> > > For this binding, I think that the following is sufficient:
> > >
> > > select:
> > >   properties:
> > >     compatible:
> > >       contains:
> > >           const: sifive,pl2cache1
> > >
>=20
> Sorry, I misunderstood your meaning.
> To be honest, I'm not quite familiar with the usage of the select propert=
y.
> When should we use the select property?
> May I ask, is there a document to detail introduce each property and
> its usage like the device-tree spec?
> I think it would be very helpful for beginners writing correct
> dt-binding and it can save much reviewers time.

You need this select because otherwise this binding will match against
every other user of "cache" in the tree. It's explained here:
https://docs.kernel.org/devicetree/bindings/writing-schema.html

Thanks,
Conor.

--Yr02wk+FfM9y0tjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMOhOwAKCRB4tDGHoIJi
0gAsAP9n7SLd/UwEsj+M3d9jv2unEvtzM1+jOnjUIu5bDMSlkgD/f7qD0m5FiV5D
klvEB4+xPiMifa296wZGHkTM5YhzxAc=
=IuWE
-----END PGP SIGNATURE-----

--Yr02wk+FfM9y0tjy--


--===============8797574463492317308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8797574463492317308==--

