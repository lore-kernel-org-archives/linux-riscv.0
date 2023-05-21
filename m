Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F7AC77B7C
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 17:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEi8WlBDj+Ume0JsoyHOoz/OLmQAtgUZke1DnpmxWt4=; b=uvsVVN5iTU7YEIMPslwnj/7fSM
	XylveMMCwUrmDX9y8IOGrtR6CK7Kk81ZCn4+1WeljPINdPt8/p4VPAmiCgv6fGZk3k9XhCAtKMt1j
	uwY3FVmn9tOX/ej48ttR4b1d8zYY3e7Wp3uHP/F9ollrPn92kSWNqP8rWDffW8cmJB+DtylZzG+YR
	MJ3pTmfM4VXkbvoCeuLE4RVpMrzJwILw5SJPT3iw/jr9lWX/KicD7CVq4IXDd4Xdhv6n0HLLXXy1k
	B5WLdsLOEDgy0adKUaNVB00NgARycaVnc35qpYjUzHj4HxVbBvwa4lUcuCfQFtJi2B1hZ8iMYgBcJ
	4CfPNpbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0mXy-004ESR-0I;
	Sun, 21 May 2023 17:08:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0mXv-004ERd-02
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 17:08:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F81A60F5A;
	Sun, 21 May 2023 17:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1780AC433D2;
	Sun, 21 May 2023 17:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684688917;
	bh=EA/dMN8uSmBLu0XJzQQrrnI0PyUW/NRfOEu9PpWl6rY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5Be11gQhXTmIpiBfldqTfPjPIpLCHql53dVblRRB+MMAJDOYixcoh3wUOO2c/kto
	 6Li2ifUIM10h7J9+0HbhfcE12usA1k5mamV27sG9eQbERsm5upJe9EYH+3qH2oUpvG
	 tBlTeoWnOyByQY79USYdL5tZuJrYPqi5QC/HqKTy3P6DbnPd+U9FPSEY27foEyiPGB
	 +US7bShnmG+9AmF+fS8sZvT3i+6o45VH0Zi/05lz8OkrHK+IVIZ2pJXqjV+hkysmoM
	 pWTa9yx6SYBE0Or3PYDXAYqVK5oiGvZslnkMm39RsGYi4qafAWe9DKjS3uMOHDzBWU
	 /t+uJOGSfCojg==
Date: Sun, 21 May 2023 18:08:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	heiko@sntech.de
Subject: Re: [PATCH 3/5] riscv: dts: add initial T-HEAD light SoC device tree
Message-ID: <20230521-licorice-follicle-2f83e82f8bce@spud>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-4-jszhang@kernel.org>
 <20230507-calamari-gentleman-bbe62af06f92@spud>
 <ZFkiotPacIMUghDP@xhacker>
 <20230508-unmoved-unvocal-9a6c5fc0c629@spud>
 <CAJF2gTSFm32ozEDy_3zvrf05USJ8FxCsaGK-2FbkJQsPUDQXmA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTSFm32ozEDy_3zvrf05USJ8FxCsaGK-2FbkJQsPUDQXmA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_100839_122937_A18C4DCD 
X-CRM114-Status: GOOD (  26.99  )
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
Content-Type: multipart/mixed; boundary="===============2111286959437129998=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2111286959437129998==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8G3irSIrB1WawZQb"
Content-Disposition: inline


--8G3irSIrB1WawZQb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 21, 2023 at 11:37:58PM +0800, Guo Ren wrote:
> On Tue, May 9, 2023 at 12:44=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Tue, May 09, 2023 at 12:26:10AM +0800, Jisheng Zhang wrote:
> > > On Sun, May 07, 2023 at 10:35:12PM +0100, Conor Dooley wrote:
> > > > On Mon, May 08, 2023 at 02:23:02AM +0800, Jisheng Zhang wrote:
> > > >
> > > > > +         c910_0: cpu@0 {
> > > > > +                 compatible =3D "thead,c910", "riscv";
> > > > > +                 device_type =3D "cpu";
> > > > > +                 riscv,isa =3D "rv64imafdc";
> > > >
> > > > Does this support more than "rv64imafdc"?
> > > > I assume there's some _xtheadfoo extensions that it does support,
> > > > although I am not sure how we are proceeding with those - Heiko mig=
ht
> > > > have a more nuanced take.
> > > >
> > > > > +         reset: reset-sample {
> > > > > +                 compatible =3D "thead,reset-sample";
> > > >
> > > > What is a "reset-sample"?
> > >
> > > This node is only for opensbi. The compatible string is already in
> > > opensbi. Do we also need to add dt-binding for it in linux?
> >
> > If it's to be included in the kernel's dts, then yes, you do need a
> > dt-binding. If you remove it, then you don't :)
> >
> > That said, "thead,reset-sample" is a strangely named compatible, so if
> > you do keep it it may end up needing a rename!

> How about compatible =3D "thead,reset-th1520" ?

"vendor,soc-function" is more typical, but "reset" is usually used for
reset controllers of which this isn't as far as I can tell.
I commented on the v2, hoping that you might actually know what the IP
block' full/proper name is:
https://lore.kernel.org/all/20230518-driving-secluding-793b3192776e@spud/

Do you?

Cheers,
Conor.

--8G3irSIrB1WawZQb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGpQEAAKCRB4tDGHoIJi
0kCCAP9n2k/2fmZwxGGppz0pZC0qiT6h8lZ8vMVzSsmZd2NsAQD+J2Tr7Hxg2Bgt
tnCER3gtzOoAHhHn+MwFUX4Oy4EtugU=
=DDuI
-----END PGP SIGNATURE-----

--8G3irSIrB1WawZQb--


--===============2111286959437129998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2111286959437129998==--

