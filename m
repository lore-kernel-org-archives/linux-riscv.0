Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC17C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 08:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Sb15sgwl3LfO/fzugHXNHYBl4w64L5xggKoJo8DrI0=; b=fuVSIAZ+7TIgOFZMTDLVJG+rMu
	D3rtAouNyIzvE9WgGfYljkEA5KpaMxnu7+KuJ6guj9O/wRAa5LRDcpfUGRnZf0YzA6i2zN5prGewy
	DH+gHA3Qb9bEgpiNrnHGy5DI9IBWxnbqO5BtYJUWephRA1ShEdUscLCs0nIwJxKMqXcNGyKNc++0f
	2Oo21DOuBlcCDAf9ZFbiguW3lJw+PGigdyLsZffL/erpjUOCSHfnU+H2jB4QwP4WmSz5LiUH6NSpi
	m2QQssj0xnFk+7h5YL6r5hmaIeiD8CjgHy+k8W0JqJmzoX1lHBT4TWEn8CYNAhDEDkjT/e8l3hM0P
	frtGeX2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpc4-00B2NB-1L;
	Mon, 22 Jan 2024 08:25:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpc1-00B2M8-35
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 08:24:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C75060FDB;
	Mon, 22 Jan 2024 08:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09E8C433C7;
	Mon, 22 Jan 2024 08:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705911896;
	bh=drF9HS0qNEy+0/grGYgRcmiwZBDcpQyCv996fd/G5Uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s1URRlGjJA38bXP5Tqq7X0QiPyWe3UraXQYziiFt47585KnHSGCL0jFjJwEmzttNe
	 i2sGsduyPw2Sg1I6HXBlaiQ3g9W51qyA8zeUoJFdgwPA8Cm7eSnjqMH/eVdgQlyoXw
	 0McCO5WsZwHz4i1coBWQBIgcnyJR2yFipOTrLmYtOth4Y9xXxJoaDrMC8fzMKnmxaX
	 UkGde0+cJfWZ21larnsTS7hcRJ+jZUe36eTbgWWA0sJTX0msi+zXPEUToMVXZjTpRx
	 RbW16AveJ/rfSy4EPmMpApjuHanWfaPCZU4CE/3jzTjygb0GjWBB4q5iPKBcCf+H2+
	 S9s+9RrCs2Rhw==
Date: Mon, 22 Jan 2024 08:24:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRD?=
 =?utf-8?Q?H_v1_1=2F2=5D_dt-bindings?= =?utf-8?Q?=3A?= media: starfive: Match
 driver and yaml property names
Message-ID: <20240122-uncivil-almost-631137081fd9@spud>
References: <20240119100639.84029-1-changhuang.liang@starfivetech.com>
 <20240119100639.84029-2-changhuang.liang@starfivetech.com>
 <20240119-despair-festival-59ab2d4d896b@wendy>
 <SHXPR01MB0671E2150D9A2707F12E0901F270A@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
 <20240119-preamble-calm-7724e17fcebc@wendy>
 <BJXPR01MB0662E6EEEEF888BD90A1FCE5F275A@BJXPR01MB0662.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <BJXPR01MB0662E6EEEEF888BD90A1FCE5F275A@BJXPR01MB0662.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_002458_081566_517BCE64 
X-CRM114-Status: GOOD (  21.32  )
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
Content-Type: multipart/mixed; boundary="===============2540034626322078951=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2540034626322078951==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="691fbi7YiHqy5KOf"
Content-Disposition: inline


--691fbi7YiHqy5KOf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 01:33:56AM +0000, Changhuang Liang wrote:
>=20
> > On Fri, Jan 19, 2024 at 12:57:22PM +0000, Changhuang Liang wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know
> > > the content is safe
> > >
> > > Hi , Conor
> > >
> > > > =E4=B8=BB=E9=A2=98: Re: [PATCH v1 1/2] dt-bindings: media: starfive=
: Match driver
> > > > and yaml property names
> > > >
> > > > On Fri, Jan 19, 2024 at 02:06:38AM -0800, Changhuang Liang wrote:
> > > > > Drop some unused properties for clocks, resets and interrupts for
> > > > > StarFive JH7110 camera subsystem.
> > > >
> > > > What do you mean "unused"?
> > > >
> > > > Do these clocks etc exist but are not used by the driver?
> > > >
> > > > Or do they not exist at all?
> > > >
> > > > The two are very different!
> >=20
> > > These clocks etc exist but are not used by the driver.
> >=20
> > That's not an acceptable reason for removing them from the binding. If =
they
> > exist, they should be documented, regardless of whether the driver make=
s use
> > of them. NAK.
>=20
> If so, how to avoid the warning of dtbs_check.

By also adding the clocks, resets and interrupts to the dts.

--691fbi7YiHqy5KOf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa4mUwAKCRB4tDGHoIJi
0h/FAP9OymvQKrw2lHv7pji+pa6/xaJNsKHlv4dCxUXnS+SjUgD+ItSiNki3Vypi
yxKXpfp0nWKwBR7x5uxNdhSO9OoXtQs=
=tSBw
-----END PGP SIGNATURE-----

--691fbi7YiHqy5KOf--


--===============2540034626322078951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2540034626322078951==--

