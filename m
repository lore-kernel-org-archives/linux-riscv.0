Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BE7C47DA9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 17:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41IWz/MVkwSRpDY0CuX/jQLd2MMommcepn6Oo/vq4/4=; b=EC0SWqDOGha6X/U6yLcEU3AufU
	06aRX+V1WHn9TYGMHeMMRjq+eGPgiyknCUaOlgXN99OFSFZM/+k1bA+poXlZYAV6oJQGkn50ESW30
	OrutViesxUyp5GfiPVoZK6MjOKqH29RspswXY9fbOmIc5Gy+fopvOJf1dvywkcyNCaqMJvxTLJyeA
	PyFs97Iiy2ILLNQzIbmozCAkf9qmrdYV5pJjax3sDpEgTX422jwAd8cE0e0ivYq85daa9yiE+vHxn
	U3FMRBddt5ACyHS9n8C09jG4HT8vO9f28pAP8NXqF4809bjeIzUWLl9WYmmB17BdkI/ky36oWBFbX
	3q6L7Phg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrVk-0000000HUfv-0ki7;
	Tue, 30 Jan 2024 17:03:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrVh-0000000HUei-1d7U
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 17:02:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D831160F07;
	Tue, 30 Jan 2024 17:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14292C43609;
	Tue, 30 Jan 2024 17:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706634176;
	bh=SXaLPfDZAvSOvV1Meuu6KFULLIZdu+ujJNFiM7oIWY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dvoSdqNeIiWSDsCr2ioyEf58I7OUGQb9uOX26I5X1yuzX/WwCAaZ6jzR8t4UQBX7L
	 BlitvCOVARsj5HhNBRufBvScpFuOCrQjwRv0E/5FeIJ1f5nVd/yxWkK8rKYQ8I02A3
	 yOQZMODrPQDmXmt1ydm95wv2CFFJ1xsqrun+tvXtwBQrv6iVvmePUC+pyES5d9QUtu
	 WYUKX0tGqB+XrI1FafYq0WrUMJEqe9MU/YlLbHBbLbGRYzoriiRPQ4pdIVUYIVt7r6
	 B8yXwEwzUV6NO3seSe0zy22uB5EfIwBPraYmtfkrkPzmYdTi/x13T760qIkDyAKU2X
	 bvoJB8qBTVqRg==
Date: Tue, 30 Jan 2024 17:02:50 +0000
From: Conor Dooley <conor@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 2/4] dt-bindings: can: Add bindings for CAST CAN
 Controller
Message-ID: <20240130-extruding-yodel-8580cc390b64@spud>
References: <20240129031239.17037-1-william.qiu@starfivetech.com>
 <20240129031239.17037-3-william.qiu@starfivetech.com>
 <20240129-garnet-polar-65afd461a1c6@spud>
 <ZQ0PR01MB125387EBAB0E6883FAD077859F7DA@ZQ0PR01MB1253.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ0PR01MB125387EBAB0E6883FAD077859F7DA@ZQ0PR01MB1253.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_090257_531737_C11A02AC 
X-CRM114-Status: GOOD (  20.67  )
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
Content-Type: multipart/mixed; boundary="===============8462071065742690100=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8462071065742690100==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6HBub9x1mt/td7wn"
Content-Disposition: inline


--6HBub9x1mt/td7wn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 06:30:54AM +0000, William Qiu wrote:
> > From: Conor Dooley <conor@kernel.org>
> > On Mon, Jan 29, 2024 at 11:12:37AM +0800, William Qiu wrote:

> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - cast,can
> > > +      - cast,canfd
> >=20
> > I don't like these uber generic compatibles that have no users as a fal=
lback.
> > Allowing them in the binding only really discourages people from creati=
ng device
> > specific compatibles.
> > Secondly, this is some purchased IP that I am sure has a versioning sch=
eme and
> > the compatibles that you have created do not reflect that.
> > If they were being used as a fallback, I would request some versioning.
> > That's not going to really work though since the canfd features on the
> > jh7110 require setting u0_can_ctrl_can_fd_enable, so neither of these
> > compatibles really has a use right now.
> >=20
> I'll add some tag to do versioning.

I don't want to see a "cast,can-<something>" compatible allowed in
isolation either as there is no user for it.
The generic compatibles like that should only be permitted in
combination with a device specific one - particularly since there are
bits in implementation defined registers that control whether or not
canfd is enabled.

--6HBub9x1mt/td7wn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbkrugAKCRB4tDGHoIJi
0gttAP4/q8qVZkSoUY5SEHx4IMoXGOkLA6t5XrEBE2tGdNgmnAD+IW65Z6LW6bDe
j71PnmrSgtOR9MjEvpq0SgpOkZfnlQ4=
=asIB
-----END PGP SIGNATURE-----

--6HBub9x1mt/td7wn--


--===============8462071065742690100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8462071065742690100==--

