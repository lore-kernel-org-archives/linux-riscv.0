Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C52C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 15:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKiImHHN9m4wVbCixZtp/FOvjOm9ws/s4ORLeCjVA0A=; b=niYzlf9h8IKJ7P5uPWcqAr6xXz
	eATBtynOyMI9cSQ+rA7UZ0waeKlr1dpSjlMHXNgIL/99S1lICVGqSOvwiFJLEsPROBEnYU3B4cAtE
	ScTiLx8IketorOg+8+8zAN7ZaXawABf3E4WrXEBYXnuprFGE99istLpJDlzkAyFMH1swSGnpz8ZOK
	Y1/gdrhqO+djXzktzQMyqlUYR6edVDXISpw7sU4J9R+do70Hzg6fjrJuG/Nj2Xju0NV4w875M+srO
	0JYv/RMrkbVgRokIMcbNWlOWOJG+BE9dWTrAFjeD8KQ56WGYgLL3PcMZoFLSL+onzVxx7LAD8qDOq
	/N/ZmRHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8j6R-00BE6R-2R;
	Thu, 30 Nov 2023 15:37:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8j6P-00BE5g-25
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 15:37:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 37F0E61F3F;
	Thu, 30 Nov 2023 15:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF54C433C8;
	Thu, 30 Nov 2023 15:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701358638;
	bh=DEfwEsrfdTaKSTIEFXZCNrvfb8NRUdxB2lcPYr3uym8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XxEaiHVP7qZe4urDwuhAjWNUOqvcNbTmmnjp3zvHvTrcVrOI5a6MkCRnKJe3DisYH
	 49hiAlNp461XtD2aXDu6NUYXMYOivZRTkBebqD1T41eiIvPK7mrKZtiallTL6Z4Xfc
	 FR+HNRnuTLOLA7t78AGwGDJbQNm3TBv2oZme/FZAZ/Z5BZtW/htwkOwvRUUZ8MwcEA
	 TMPalRnHagMa+dqBn9JPB1FAB2NOVBFQrJW8UkYVTnlUUwiiq7uBHuHve3GVR8ioJX
	 24zn1VFmWGgOKdNViGBg+pNnNl1u3mX94wxyk8MxhEUM32OnG4JtpM9LtP73lqacAi
	 mnYfIW71J4F3A==
Date: Thu, 30 Nov 2023 15:37:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Kwanghoon Son <k.son@samsung.com>, p.zabel@pengutronix.de,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, jszhang@kernel.org, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, inki.dae@samsung.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Document th1520 reset control
Message-ID: <20231130-strict-yarn-0b7ec0f47bc1@spud>
References: <20230918045125.4000083-1-k.son@samsung.com>
 <CGME20230918045134epcas1p1b80b338b66512a976c3783cd0e51da50@epcas1p1.samsung.com>
 <20230918045125.4000083-2-k.son@samsung.com>
 <20230918-4ef7f52da269f3a7e4023bb3@fedora>
 <005301d9eab7$5688c920$039a5b60$@samsung.com>
 <20230919-42333064be342f6ab125dd75@fedora>
 <5f437109d2be2b8843f549a661054a2e3ec0d66e.camel@xry111.site>
MIME-Version: 1.0
In-Reply-To: <5f437109d2be2b8843f549a661054a2e3ec0d66e.camel@xry111.site>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_073721_726464_FEB2A3EA 
X-CRM114-Status: GOOD (  22.76  )
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
Content-Type: multipart/mixed; boundary="===============3779295822459763182=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3779295822459763182==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WAKvEsPGuWM3Yjbn"
Content-Disposition: inline


--WAKvEsPGuWM3Yjbn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 12:42:09AM +0800, Xi Ruoyao wrote:
> On Tue, 2023-09-19 at 09:47 +0100, Conor Dooley wrote:
> > Guo,
> >=20
> > On Tue, Sep 19, 2023 at 02:08:32PM +0900, Kwanghoon Son wrote:
> > > > > > +=A0=A0=A0=A0=A0 - const: thead,th1520-reset
> > > > > > +=A0=A0=A0=A0=A0 - const: syscon
> > > > >=20
> > > > > iDumb question perhaps, but why is this a syscon?
> > > >=20
> > > > This is good point.
> > > > In fact, I took it from the vendor kernel, and I tried to keep it a=
s same as I could.
> > > > Vendor also followed drivers/reset/reset-imx7.c
> > > > As Rob said, if don't need it, I'll change it.
> >=20
> > > I have investigated vendor kernels, but it is still not sure reset in=
formation.
> > > I thought this is about sys_reg, but without datasheet, can't tell.
> > > Therefore, should be stopped patch for a while until knows better com=
es out.
> >=20
> > Is there documentation in English you can provide to these people that
> > are trying to add support for your product?
>=20
> It can be downloaded from
> https://dl.sipeed.com/shareURL/LICHEE/licheepi4a/09_Doc now.  Click on
> "TH1520 User Manual.zip" and enter a captcha.  The doc about resetting
> is in chapter 5 of "TH1520 System User Manual.pdf".

Thanks Xi! Pity there was no response from the vendor to this for
months :(

--WAKvEsPGuWM3Yjbn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWisKAAKCRB4tDGHoIJi
0ne4AQCpH/mzJjeMQBRdjUbmAWLMVpb472UKnn6JbArl6ZbhFgD8CmPgI9f8BrQH
RGR80riMhYQ+yIOzdEQrWILkVlerWgE=
=Mv8t
-----END PGP SIGNATURE-----

--WAKvEsPGuWM3Yjbn--


--===============3779295822459763182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3779295822459763182==--

