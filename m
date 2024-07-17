Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15712C3DA60
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 17:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KrvweTNsGHWp4Lec3Laxn0cqSP7hCCv3wq5PAnrrXM=; b=pQ4mNIcB/CA2dhD3keSlg55J1x
	NFBtE3GtwOaE/vh0cONQGmoxJQ9/jRoudaX5hDDVUqxYho0agzJAfKA2/mmP5MELos/xcVBNh5PUz
	DqoVnF4LgNLFeFCuyq2tYZ7XXBAwrvzaJfzFppnKXYe6YBYt/MN/2vEzjmKRwuu22HnennO5IIugr
	rJZJpoc20+LpLFOrqCtKoUXQnZoeWIJ/pSKdv3F6k63aWTG6MYfLqv28nKBa028N/+pPKG05TrvRi
	qQH53E2arqbsCIUCZ4X7mUGye/7s9AAjYIWQfLEbwZisc/lsPJdYc8uJnlmedACVw3DDqvECKJBec
	YoUkju5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU8Cn-0000000ESag-2cC0;
	Wed, 17 Jul 2024 17:12:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU8Cl-0000000ESa1-28zC
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 17:12:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B2603CE1691;
	Wed, 17 Jul 2024 17:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA312C2BD10;
	Wed, 17 Jul 2024 17:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721236351;
	bh=6oJ8M1vrPdRG3kOHgOQHSnbwDAXJpmALAEax66ou1oA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QjBmm/VIWHe0C7PpHR3d0xvqkAlxrS0/zTVIoPL6I0BJlYsbzKRwv1LCWpswjZiia
	 MIKZIwenfzoUsa945uXX4ODBOKhaMYmj6sxxxPo7zsHKiPGaEcdaqeWtcylpoV6Jto
	 nwdvua/9cyZS06chD15CIDpIBMixLHdehVWWCwApdMZN/eEvW98DDAXlv/WlG9ZUlP
	 GnrtpvQYZhQyEBpLkluWoy8WhGwjUU+KwvmcWWHpzjUWvnePDnSWCL+kNkUKxmQ5X2
	 faD9u8YBYIwS7G5vp0fL1h+vh2KTvBArozwr2OW14nMcjeXMRY2U7Fj/mKSSdEE2Z9
	 BwrZA+g/4ZA4w==
Date: Wed, 17 Jul 2024 18:12:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Yuntao Dai <d1581209858@live.com>
Cc: Inochi Amaoto <inochiama@outlook.com>, jassisinghbrar@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mailbox: add Sophgo cv18x SoCs
 mailbox
Message-ID: <20240717-flail-revisable-8f232da8f1c5@spud>
References: <SYBP282MB223825D5903777B937A8A377C4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
 <SYBP282MB22382E1C032FDE2D36E6B58DC4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
 <IA1PR20MB49537F9F04E601413EA1C86FBBA12@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240715-upriver-grumbly-e8f6172f6a72@spud>
 <SYBP282MB2238C5F2D4B10061FA241CCFC4A32@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <SYBP282MB2238C5F2D4B10061FA241CCFC4A32@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_101239_732414_4EDA9BA2 
X-CRM114-Status: GOOD (  14.69  )
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
Content-Type: multipart/mixed; boundary="===============3108927910874534757=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3108927910874534757==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ALmOSiU6N73KQalJ"
Content-Disposition: inline


--ALmOSiU6N73KQalJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 01:06:46AM +0800, Yuntao Dai wrote:

> > >  > +examples:
> > >  > +  - |
> > >  > +    #include <dt-bindings/interrupt-controller/irq.h>
> > >  > +
> > >  > +    mailbox: mailbox@1900000 {
> >=20
> > And while you're fixing the things Inochi pointed out, drop the
> > "mailbox:" label, you've got no references to it.
> >=20
>=20
> Yes, in this patch there is no references to it, but mailbox client node
> will need it.
> I tested this patch using mailbox-test as the client, like:
> "
> mailbox-test {
> 	compatible =3D "mailbox-test";
> 	mbox-names =3D "rx", "tx";
> 	mboxes =3D <&mailbox 0 1 &mailbox 1 2>;
> };
> "
>=20
> If you think it is better to drop the label in this patch, I will drop it.

Just drop it from the example, you can keep it in the actual dts. We try
to keep these examples to a minimum.

--ALmOSiU6N73KQalJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpf7egAKCRB4tDGHoIJi
0r0OAP4hwn7NIolPccLar8BktnpwAvS8869Jr6xLgazY2aBeGAD/QQ1X61946YGW
Vc7h4srCoFWWRrrUZHX9RMBrvz3DqQo=
=dw44
-----END PGP SIGNATURE-----

--ALmOSiU6N73KQalJ--


--===============3108927910874534757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3108927910874534757==--

