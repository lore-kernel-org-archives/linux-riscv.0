Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD67C98321
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 17:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWB1LlW35BY5De32uQkWGnkTy3T9urzaK90/uvRQiQ8=; b=Ok4yjwE4sh3Xs9hcy/sLiLfQmk
	LWKYE5bEp+UY18fHjYtqBzvCHd1aadhIXxGj6DUjcgeCwcKMEHM0Ee5Fd8/GLouwkLQnRh/26lhPD
	m0M7zuENfVsQ9euF7OBWGXmvkCwu4Zu0veUWRgNKokSGkRLIFn/CSDIdi1pVJTEEeIbceJNUUe8nF
	27fWEj50tzY6DIgtV/hRHMLSiaw5GLpHfcZaO/TX/MNc7OM6dxDR+0msq9GHqeHjAnSphQL6hnEcB
	cJAc1alMY5OUVMr1q7halOm1IU4CstB32wdHsrzivhJ/FWTXX5NIVj7U4M1S6u2b780MOzxpfXNRK
	F1v+b5/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9b5-0000000E3Tp-0ctW;
	Fri, 25 Sep 2026 17:20:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9b3-0000000E3Th-36Pi
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 17:20:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D284160136;
	Fri, 25 Sep 2026 17:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781BC1F000FF;
	Fri, 25 Sep 2026 17:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790356828;
	bh=9mtMs1F8URTL/dYKicvxLK2zBTs6tbZNKZ1u22zz9SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b/6+HumMP7kPnpdXsDR8qrKrbab2uwIwHABKXxhkhixQh+tUW4n+nvdkC58doeNeg
	 d19x4o0FJsX4zkZj/h7uCI87IPZEbsSzrQW1rjzd7lgyKB8jOz38fBXKzqR79VVLBj
	 xcs8A9W3tucdTnozTX0wHlQanQ5UTffAPsflZ/TW3J3khdbkm05VZCT6rRmqAp+CDt
	 GL2t5XH1YuCoq//pI1C4C2dXAxQyARbTrTlZNM0vQ+G1mOH+VT4PvBfuLygCzVtz2Z
	 9XaiLsvV8fUbnPttAmLkBKTTvM3zPL48jVTaxomSCtQIWTAGWHwQpdxClJzlncTElr
	 sDA8oCpaEirCw==
Date: Fri, 25 Sep 2026 18:20:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"rahul@summations.net" <rahul@summations.net>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"lftan.linux@gmail.com" <lftan.linux@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Message-ID: <767ad0d8-5886-4c09-b41a-681059b211b4@sirena.org.uk>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
 <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
 <9c0ae39b-d214-40f5-b010-cdea14ccc774@kernel.org>
 <c2c57bf0-e610-4353-93a4-84edfd08e767@sirena.org.uk>
 <SH0PR01MB08411AA7F403A71D2D7470A6F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <0db3ed29-8bb8-4dc3-a4cb-cc5b9bf2e893@kernel.org>
 <SH0PR01MB0841C933DE1E00C4012BDF53F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <SH0PR01MB0841C933DE1E00C4012BDF53F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
X-Cookie: Love America -- or give it back.
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
Content-Type: multipart/mixed; boundary="===============4321837396337227882=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4321837396337227882==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6d2JNYG1b86DxwHU"
Content-Disposition: inline


--6d2JNYG1b86DxwHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2026 at 07:14:14AM +0000, Joshua Yeong wrote:

> rpmi-voltage: rpmi-voltage {
> 	mboxes = <0x0c 0x1004 0x00>;
> 	#voltage-domain-cells = <0x01>;
> 	compatible = "riscv,rpmi-voltage";
> };

> The user does not need to map any other information under
> /rpmi-voltage/regulators/volt1 , since the value are being decided by
> the platform microcontroller.  The fields like 'names', '
> regulator-max-microvolt' and ' regulator-min-microvolt' are being
> discovered during runtime instead.

We still want constraints, partly just as a matter of policy since we
don't touch the hardware without explicit configuration and partly so
that we can have additional constraints outside the firmware represented
(either due to it being hard to fix a misdescription in firmware or due
to needing to accout for some additional restriction that comes from
something like an incomplete DT).

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--6d2JNYG1b86DxwHU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2rVYACgkQJNaLcl1U
h9BgrggAgDyhsfxohSdyqHdW4q/wtZW8puPnBGyIVH8LSsrSt/PaB7PW2iI/psK0
uahbIBFuxTHZ3IYFCT/y8S/a2zALvfLf2oQArhst89RBMHzCA7yFao7Frh07JJ/t
tbMuWK0RbvJCYuMiysEm1Pw6BYTgjRmfhgTOWLefbpZinhIjYDY3Q8G+YPmKKmId
3JD9dmUPLe0MX2TVJRYaaidNS3upNftJhNd3dWVsqVHf6/u/ZoW7f4aRwvi9sFEB
bxJGGCcYdriLS6Xb9ymfl6KABEfMUm8iuiSCZNHOGoP1M7ciSNz0CGbl3wYB2rzg
7pAL74BFEDv2UHrE+MxlOIYYjrsoyw==
=xPca
-----END PGP SIGNATURE-----

--6d2JNYG1b86DxwHU--


--===============4321837396337227882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4321837396337227882==--

