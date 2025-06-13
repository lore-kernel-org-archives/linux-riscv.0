Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23F5C71136
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 15:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyzMisn3Uud/4+39wq98iHhLCYeLLuFYrfDp4ELrubM=; b=JJXMNekqQruXn7weUnycDx0zP0
	CMrvacpVd5gEkVLyWg+yV7WeWpswls54K5mwYS81k/WUEv8t3VoZP94ZhdRuRnuwf61DRpFL5EkpR
	AS3AgqsBXmWCri8IZzs0K3kO/rrbeAcCkHTNpynkYpj8VMemqDjyCboGOxOc2ALQB2dztESYZigLe
	sE6U9OpOYPGwJdr+4Kf6xKRltRbZ2s8Ub4wZJ6cGtNUuQdSJGPG5jT6sF534l9VpoKorlHDY3L2YU
	hmVgZdBqt0Yi6/Qd4E618OST1nC76p6JzJ7+yrqFviQS2Eeqz2nxKGRzVUtYWjyZo6FcfNs761G40
	hDSEfxsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6MR-0000000GszI-2wrU;
	Fri, 13 Jun 2025 15:30:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5Pi-0000000GhND-46SJ;
	Fri, 13 Jun 2025 14:29:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4F62AA511BE;
	Fri, 13 Jun 2025 14:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B00C4CEE3;
	Fri, 13 Jun 2025 14:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749824990;
	bh=XjIGrMXI9Lwf15i7w/n2nAnmVq8n5EfiQ7/Rpe0jmao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HKZxsEGA0hFa/XuJii3LvwPMfo7ZKkj6l3tLAyNYYpDWhVJhPvaAoMc7+KrQen0Nr
	 OLR0b5WXa7Zz96+Q5E/JUFeRjlf7NJ5i5zwkeXozWiapm8WocyHWDt4uefY8aR6wQa
	 Sw5IWlV2SrwpVwAYJ4T0VGsknXPfTjUUfKISFX0rS8k3GrexPd4czmkU1+2w4dVFHB
	 dAefyMlvUIWXYvOURB8l/KsR/xCTxOkGmq/xwlBVg3HYfgjUJmFyiyD0lPLv56K9HR
	 E9zHBNMKkCO+unEpbFAYSoCB4acHnncuws4PspxrjiY47Gz9CXXHFEsCwuEMyVEYig
	 7CwyCRrGjv9LQ==
Date: Fri, 13 Jun 2025 15:29:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Message-ID: <20250613-deflation-aerosol-fed1d566fd0b@spud>
References: <20250611081804.1196397-1-inochiama@gmail.com>
 <20250611081804.1196397-2-inochiama@gmail.com>
 <20250612-siesta-verbalize-6a7768ebc648@spud>
 <jf76ak6b5edgqhx4rkhcsfpmcpkrxci7rq373ld2apue67q7hh@3fb346tgaxcq>
MIME-Version: 1.0
In-Reply-To: <jf76ak6b5edgqhx4rkhcsfpmcpkrxci7rq373ld2apue67q7hh@3fb346tgaxcq>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_072951_079787_A7503ABA 
X-CRM114-Status: GOOD (  20.87  )
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
Content-Type: multipart/mixed; boundary="===============2691040114607529377=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2691040114607529377==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3c8vFvw0nmfKFBPv"
Content-Disposition: inline


--3c8vFvw0nmfKFBPv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 06:02:27AM +0800, Inochi Amaoto wrote:
> On Thu, Jun 12, 2025 at 05:07:37PM +0100, Conor Dooley wrote:
> > On Wed, Jun 11, 2025 at 04:18:02PM +0800, Inochi Amaoto wrote:
> > > The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
> > > "VBUS_DET" to get the right operation mode. If this pin is not
> > > connected, it only supports setting the mode manually.
> > >=20
> > > Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> >=20
> > I'm having a bit of trouble finding the v3 etc, could you provide a
> > link?
> > I think what is here is sane, but I want to make sure that review
> > comments on previous versions have been addressed. "dfn:" searches for
> > both driver and binding filenames turned up nothing.
> >=20
>=20
> The v3 is
> https://lore.kernel.org/all/IA1PR20MB4953C1876484E149AA390DD5BB1D2@IA1PR2=
0MB4953.namprd20.prod.outlook.com/
> It is a long time ago when sending these patch.

Thanks. I think this patch looks okay, but probably worth Rob or
Krzysztof taking a look, even if you seem to have removed the props that
were objected to.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--3c8vFvw0nmfKFBPv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEw12AAKCRB4tDGHoIJi
0rFvAP9S13o/LIdwmUHfvdi3xmI2QY28l91ctWFzgrUilzPCYAD/SjWjbDN8whBn
xzbmH9XlaGdqGPG+RXchp8YvmnNg5ws=
=1aby
-----END PGP SIGNATURE-----

--3c8vFvw0nmfKFBPv--


--===============2691040114607529377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2691040114607529377==--

