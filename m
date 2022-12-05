Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AAAC4708D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 10:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gc7XcMUHW45G1f+OB+tH3d7okDjNCnJsQUuh/U1S+0c=; b=j4Mwbmv0wBzvdH1OWUemkC1fHO
	IMXieSZTcmCvNXn9sPLmBotbN7hs6lEg4ckkaVTQXKt6Vfw+FtEY4EchrZOzhPsPiIpLUlxGeclqj
	3dG3j2SK6SaVZKYuT5EWRmCVTNB5D0YJPLIJzgf43I4yriH4YnsNghX2bAmr1m54M9JikHw+7tSy9
	lIFffZGS+gUi9WRyBeX7fRkwVoOOoY18Nc7zZA2Dnt4Fhsa0PksOcBadYSRxLBUn4DlNkLKCXonaa
	KmeTzjvXMr6+iWGM4A6NepbAkkRFCuy6xXqrDR9b8TxWxT7ZNAV6BdqYXHs6QhHeGHOjSBIOWR5kg
	+b7HDBKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p28qV-000q9l-PI; Mon, 05 Dec 2022 10:37:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p28qS-000puD-OA
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 10:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1670236629; x=1701772629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jYfx+B+UAYkydHRZ5isoOVyDSGssXGO6Y1vwW6SpTNk=;
  b=LWpJ9ypkmiyCv4Zh/MQPGhx8gKgxmbr5DOou5HvA6kES40rxFEPPHBbJ
   cecIKdJu1S4rEvvksNbVpTiXiEZUX+/F1f5lpcT1rb6MLclux+PSuNrXB
   R56nGQyyP5KEKE5HLUDUGo+uwnhLauZ0xdGou99CsZxWJcFQQIWbbZm1T
   qt0XGsgNCRBhVwIZ9KRtE8JJWriufkwMD57xogA41oz2+jbSJ4QyBXNys
   mvjspZ+Zxfz5FiBCtw691MdHOlmz4Zwdtd0CJIyE6yLHCbTKRVmkEI88m
   O18zbbkx+h1QSRStIvQluUDvj/kfZ1HMehyddKxHnI8sf4lDwSTstfrmF
   g==;
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="asc'?scan'208";a="191713849"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Dec 2022 03:37:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Dec 2022 03:37:00 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 5 Dec 2022 03:36:58 -0700
Date: Mon, 5 Dec 2022 10:36:39 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Icenowy Zheng <uwu@icenowy.me>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Marc Zyngier <maz@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel@sholland.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 2/3] dt-bindings: timer: sifive,clint: add compatible for
 OpenC906
Message-ID: <Y43Jt3YOSbFyh954@wendy>
References: <20221121041757.418645-1-uwu@icenowy.me>
 <20221121041757.418645-3-uwu@icenowy.me>
 <98005150-83a7-5439-0db1-d93d459c3809@linaro.org>
 <b924d37d716fa8b1fd93102b1d51fac221f43d59.camel@icenowy.me>
 <d0f3ce4f-5676-f5e1-f04f-dd069679b2d3@linaro.org>
 <81C2234E-C92D-4F78-8295-7C6DD0A9BBC4@icenowy.me>
 <20221130181330.GA2544489-robh@kernel.org>
 <Y4j+Gpptk3NAFBNV@spud>
 <4ad56fa249a30167844abcedac53d198606511d8.camel@icenowy.me>
MIME-Version: 1.0
In-Reply-To: <4ad56fa249a30167844abcedac53d198606511d8.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_023708_822077_28B9337F 
X-CRM114-Status: GOOD (  37.92  )
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
Content-Type: multipart/mixed; boundary="===============5038676314869122440=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5038676314869122440==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CSc7m2POAGcYksfe"
Content-Disposition: inline

--CSc7m2POAGcYksfe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2022 at 02:12:54PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2022-12-01=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 19:18 +0000=EF=
=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > On Wed, Nov 30, 2022 at 12:13:30PM -0600, Rob Herring wrote:
> > > On Tue, Nov 22, 2022 at 03:41:27PM +0800, Icenowy Zheng wrote:
> > > >=20
> > > >=20
> > > > =E4=BA=8E 2022=E5=B9=B411=E6=9C=8822=E6=97=A5 GMT+08:00 =E4=B8=8B=
=E5=8D=883:35:48, Krzysztof Kozlowski
> > > > <krzysztof.kozlowski@linaro.org> =E5=86=99=E5=88=B0:
> > > > > On 22/11/2022 08:18, Icenowy Zheng wrote:
> > > > > > =E5=9C=A8 2022-11-21=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 11:06 =
+0100=EF=BC=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> > > > > > > On 21/11/2022 05:17, Icenowy Zheng wrote:
> > > > > > > > T-Head OpenC906 is a open-source-licensed fixed-
> > > > > > > > configuration of
> > > > > > > > C906,
> > > > > > > > which is now public and able to be integrated.
> > > > > > > >=20
> > > > > > > > Add a compatible for the CLINT shipped as part of
> > > > > > > > OpenC906, which
> > > > > > > > should
> > > > > > > > just be ordinary C9xx CLINT.
> > > > > > > >=20
> > > > > > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > > > > > ---
> > > > > > > > =C2=A0Documentation/devicetree/bindings/timer/sifive,clint.=
yam
> > > > > > > > l | 1 +
> > > > > > > > =C2=A01 file changed, 1 insertion(+)
> > > > > > > >=20
> > > > > > > > diff --git
> > > > > > > > a/Documentation/devicetree/bindings/timer/sifive,clint.ya
> > > > > > > > ml
> > > > > > > > b/Documentation/devicetree/bindings/timer/sifive,clint.ya
> > > > > > > > ml
> > > > > > > > index aada6957216c..86703e995e31 100644
> > > > > > > > ---
> > > > > > > > a/Documentation/devicetree/bindings/timer/sifive,clint.ya
> > > > > > > > ml
> > > > > > > > +++
> > > > > > > > b/Documentation/devicetree/bindings/timer/sifive,clint.ya
> > > > > > > > ml
> > > > > > > > @@ -35,6 +35,7 @@ properties:
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 - const: sifive,clint0
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 - enum:
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - thead,openc906-clint
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 - allwinner,sun20i-d1-clint
> > > > > > >=20
> > > > > > > Add entries sorted alphabetically. This should be squashed
> > > > > > > with
> > > > > > > previous
> > > > > > > patch.
> > > > > >=20
> > > > > > I make it a seperated patch because I think it's a
> > > > > > questionable
> > > > > > approach.
> > > > > >=20
> > > > > > If you think it's okay, I will just squash it and put it as
> > > > > > the second
> > > > > > patch in the next iteration, with adding openc906-plic as the
> > > > > > first
> > > > > > one.
> > > > >=20
> > > > > What is a questionable approach? Why commit msg is not saying
> > > > > this?
> > > >=20
> > > > Ah I mentioned it in the cover letter. The problem is just I
> > > > doubt whether
> > > > binding strings for single SoCs are necessary.
> > >=20
> > > They are.
> > >=20
> > > Unless all the quirks/bugs/features are somehow guaranteed to be
> > > exactly=20
> > > the same as other SoCs sharing the same compatible string, or there
> > > is=20
> > > another mechanism to identify the exact version (e.g. a version=20
> > > register).
> >=20
> > Icenowy,
> >=20
> > Having thought about this a little - are we not *more* likely to see
> > bug/quirk disparity between implementations of the OpenC906 stuff by
> > the very nature of being an open-source IP?
>=20
> It's an open-source edition of a specific version of the commercial IP,
> a fixed configuration.
>=20
> In addition, maybe we can just retrieve the version infomation via a T-
> Head custom CPU configuration register, mcpuid. Despite the
> implementation of this register is weird -- it contains 7 different
> read-only values, with the most significant nibble behaving as an
> index.

You lot all know the situation here a lot more than I do...
I don't think "letting" people use the bare "thead,c900-foo" makes much
sense as it gives us no chance to deal with quirks down the line.
I don't think that using "thead,openc906-clint", "thead,c900-clint"
makes all that much sense either, in case someone does something wacky
with the open-source version of the core.

That leaves us with either:
"vendor,soc-clint", "thead,openc906-clint", "thead,c900-clint"
or:
"vendor,soc-clint", "thead,c900-clint"
right?

The first one seems like possibly the better option as you'd kinda
expect that, in a perfect word, all of the open-source IP
implementations would share quirks etc?

Thanks,
Conor.


--CSc7m2POAGcYksfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY43JtwAKCRB4tDGHoIJi
0toiAP0Wp6WtOkNedxf/lHQRpp41vBitePX07cxy201boMcEOAD/Wp9iYknpe+Ir
SYzdybJGmgh0saRrntCdz76LUhf4vAw=
=Nmh2
-----END PGP SIGNATURE-----

--CSc7m2POAGcYksfe--


--===============5038676314869122440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5038676314869122440==--

