Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B11606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 18:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PJ7ChS5e;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GfxdPic9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vsEDZCFIKK7alt1qv1aMYGoQiTn5hAKuX6x42DBa0/M=; b=PJ7ChS5eVMzIf5ZbYUbHeA7Gvb
	W45Djnfk+kDrpPOmcIXLPmrUyrU3m58cBTJCMr3m4y+qqutP70khJuKI8e8+6+d9J2ykVE4QKx3KZ
	C76LuHhgOO06M+hsifhLoXTM9qYVFBigOdt6EM4nTFodoN3GzqgvVBYXxAIXeEZCADw9YbTly3se7
	cawSWaKRSZ41yVdRkdNXSWQcTlPVP+CHfW5JIexpae8gN29UdCNe6Z3i43L4SdvbS3mMmjGdhC7aO
	me2e227ssX/wSii7HV0P3Xf5NNfWEMebUe8jEkY4LRHBD/5pJU/oI3PTFT+PcdSUdD8LyAxLPk39I
	/4uhrrTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqKe-00000004lQ0-0a8d;
	Tue, 10 Nov 2026 18:12:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqKd-00000004lPt-1QfT
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 18:12:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C4A8445791;
	Tue, 10 Nov 2026 18:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154581F0089F;
	Tue, 10 Nov 2026 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794334349;
	bh=4t5jJ2a6wGaTNdEQ0yY6CxbRv9iR+ZbkEFBvnff4R4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GfxdPic9p0dLd37DWoZXEk9nrtP2bo+Sr9tf1ZlHHP2D0Vlh+MgfDBmRFVN3oN2aI
	 1RTQPJI6fFjBhZx3oEqqkwJcAlc7QguNkzrRhMYpEiwWx4WXve20QBhyw4tOqrtz1y
	 4ghkLjfo4hmSECDcgjuRo67a0Sl8SXevmyI07moRwX5gjspdFOkRTXuWHWBMrrAPVI
	 Rt4+bPpVWNX3XDLYjEYyk07k8GUPjdistR60+tcLuBoaFG5sUgJkB7jUJ1DqU8QsOs
	 egOcBoJlLCVHx/PlC/0+RH1A9uXjIixtlPnENu6x0ACVWUBESaOmMjUY3S1mubOpmN
	 mpN/trXm+Iw8A==
Date: Tue, 10 Nov 2026 18:12:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Xincheng Ji <jixincheng@ultrarisc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Lunn <andrew@lunn.ch>, Jia Wang <wangjia@ultrarisc.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 0/7] riscv: Add device tree support for UltraRISC
 DP1000
Message-ID: <20261110-amused-strobe-d6cf2bf24861@spud>
References: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
 <179419183382.2791817.17305257804227954338.b4-reply@b4>
 <20261109-december-oil-cb6524baf274@spud>
 <179427984780.3452989.12543035151641565906.b4-reply@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <179427984780.3452989.12543035151641565906.b4-reply@b4>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0005191168220403728=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0005191168220403728==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5Abm0SE5GQSId6z6"
Content-Disposition: inline

--5Abm0SE5GQSId6z6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:04:07AM +0800, Xincheng Ji wrote:
> Hi Conor,
>=20
> Jia has left UltraRISC, but the platform maintenance handover was
> unfortunately missed. I would like to take over maintenance of the
> UltraRISC platform and will send a MAINTAINERS patch adding myself.
> The existing repository URL will remain unchanged.
>=20
> For this series, yes, I was hoping you could pick it up while we
> complete the handover. Would that be possible?

I suppose I can. Send a new version with your name instead of Jia, and
add my git tree to the entry for now:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/

Cheers,
Conor.

--5Abm0SE5GQSId6z6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavNehAAKCRB4tDGHoIJi
0n8cAQC1pXu850Nmr6dz3U9KsrFWkyjC1yOZ00xPIAUryB50WQD/f/hUphJ3d6Fv
ZIZxVHG1PO+rzMOz54EU5GKNqf+YvAU=
=gDr2
-----END PGP SIGNATURE-----

--5Abm0SE5GQSId6z6--


--===============0005191168220403728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0005191168220403728==--

