Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB33CD98E3
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 15:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DU8oUfyptQWGnH97KJtEWVhlThzmjc97v3TIbZmDNeA=; b=2gojUYnXLNQs9ec3rBa6JdcSeD
	oSDomfWp3SwbFtu4B7ICsLHQ0y21S6xuQF7kX05FuBmjUJ9nu+44xnCy1UByRyW+miwz+XQGLgi1l
	uD//pkbYM52Kz5rp8ITz9vqnYZIE8MitGUQscBirJJnkOX2MgrSLYuVagU9y7gGNSQ5Gx4k0ef0eD
	xVSf8rjzNwlsSdcyyO/CGT8FSn7KphVwaW+aEFUOw4WPHcKQsobSwnzOeeKZCsXJXOGymCgk+LH0c
	bLRs3IuwuP9tIGCzzikAcg+brl4A8V+NA5mmo4MSfztp0iaZJAfCbwK5qpbn2rcOWmtY+MNe2GIyL
	ZlXC80Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVkt-0000000G1EA-1ZdG;
	Tue, 16 Jun 2026 15:31:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVks-0000000G1E4-31TS
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 15:31:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E561600AB;
	Tue, 16 Jun 2026 15:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D54E1F00A3A;
	Tue, 16 Jun 2026 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781623869;
	bh=H4q3EaMMaI2HFEM9XMWLyy+ranKnuc2iJ9R48LAi+Co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ltwzz9ahZ1f/RKzdJ5velxbsLeSwb6LIbPVG92hCsCHIuJC6Q8lC3JuB0FS6DqCKY
	 lIv7hr7q5pHYYm9pv1a6AXauU9jtgXSQW87un/uK/QjazdZaZru0Cc/MXB1srkUI3D
	 9lIKkA5MDSeHWRr2150Gs5NYGUqgf4zKmbfCg1d8Ni2VbL44FPfzzacBV18zwmSv/5
	 w14pjfaMHy3aF6aeol1qiZPtQg5sjdPb48bccqOQCRz/bx8GJBaxbhPwSa36G/ygp4
	 0fPX9LLEDtorjqb/OtqsXOGHqYGBpbqNEi3N+p9a5M/2FoF8an/HWhabzRRzOS5K8X
	 EzhaiVrflUUeA==
Date: Tue, 16 Jun 2026 16:31:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH 6/7] riscv: dts: eswin: add I2C controller support
Message-ID: <20260616-greeter-securely-16e742490a4a@spud>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-7-pinkesh.vaghela@einfochips.com>
 <20260615-lumpiness-profusely-155422288c31@spud>
 <SJ2PR04MB8896A5877CCFC177FA5D5A9583E52@SJ2PR04MB8896.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SJ2PR04MB8896A5877CCFC177FA5D5A9583E52@SJ2PR04MB8896.namprd04.prod.outlook.com>
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
Content-Type: multipart/mixed; boundary="===============4924439264617996396=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4924439264617996396==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WNod8yUaohcmzurl"
Content-Disposition: inline


--WNod8yUaohcmzurl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 11:57:33AM +0000, Pinkesh Vaghela wrote:
> On Mon, Jun 15, 2026 at 10:05 PM +0530, Conor Dooley wrote:
> > On Mon, Jun 15, 2026 at 05:50:15PM +0530, Pinkesh Vaghela wrote:
> > > +		i2c0: i2c@50950000 {
> > > +			compatible =3D "snps,designware-i2c";
> >=20
> > Missing a soc-specific compatible here for all i2c controllers.
>=20
> We are using generic DesignWare I2C driver for all I2C controllers with
> no changes required in the driver. Do we still need to add soc-specific
> compatible for all i2c controllers?

Yes. Just use "snps,designware-i2c" as a fallback.

Thanks,
Conor.

--WNod8yUaohcmzurl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajFsNwAKCRB4tDGHoIJi
0rUXAQCh5hx72iaCwvhODXXBrj/a0alO+abHFoxSfaBo+7vy2QD8DF0KE8HEDctE
m5ZQMaLYkLda7O1wmlcME+9t698Z6ws=
=E+bB
-----END PGP SIGNATURE-----

--WNod8yUaohcmzurl--


--===============4924439264617996396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4924439264617996396==--

