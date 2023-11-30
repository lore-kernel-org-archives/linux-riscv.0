Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D80C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 15:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHajl2UkBVrwJbgEzG427NeIjewZkx6WllNxPP/+7Mg=; b=zaPvcpRHlRcDAqQCa8KVWjiEuF
	xqSg7l7RZt1fzi954hvjLXc/FXzMAP8Fu/PM9RtMPc2wJ/E2RfC2NLHMIJwsUwNfY+KMMaavmfki1
	4CFuI791ybH78XW3FCqkZFinK3dyw/JjI6NZmiH/LNtCw7ErjV8C01crC/iMOc+HHvvKd4oFb70rV
	0swvO20CKSvwQofTx1zP/f8Phs7SJBFfBB4NsoeIKj7z81dzPOjniFTSGowvMPfCXyZ481cpkPBYB
	odG0Ci98s4UHWAAng92nqM2Q8v1R4RCNHQ95owD7Z8OZAoE17WwS7RczqKGsyC+W6ep9p821a+IMi
	vY3t4vQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ieR-00BAh7-2f;
	Thu, 30 Nov 2023 15:08:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ieP-00BAgJ-2I
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 15:08:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8A0C61F0E;
	Thu, 30 Nov 2023 15:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7266C433C9;
	Thu, 30 Nov 2023 15:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701356904;
	bh=4wdwU/K0jATvkk/atcXZBxJh/WUP8EwtMGcCyE3gUeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tlHuYFHTFVwq14ftdT6EnINBJeymXG/v3mOua2ezi5Xn/8MOP4eKlziMM0025U0YI
	 ra36o/EOTsrXsl8qcps/T5RVOwYVRMyza/+yoaqHCwulQLvtj8dtfItbvbGz2esLai
	 fa7POSmXASjbbjoANg+BhDbI0y4tDdbinq4LWgosoNxTeY9+34QySmeX9nvnAwtStF
	 ZGrJM8vMgJ5R7mOk69Sr4eldKQ53rk89r6RtuB1G6Xujb1UPPtMoLzQT2dvnQSJEkO
	 A8//ahSoj8QrVQAqRhl5o9O+oV8qY6oQK+tIEsyhYK12enynYWXwK47t9X4FuDsJjy
	 e8I/Yki3ksb+Q==
Date: Thu, 30 Nov 2023 15:08:18 +0000
From: Conor Dooley <conor@kernel.org>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: "kernel@esmil.dk" <kernel@esmil.dk>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"krzk@kernel.org" <krzk@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"jirislaby@kernel.org" <jirislaby@kernel.org>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	"drew@beagleboard.org" <drew@beagleboard.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: riscv: Add StarFive Dubhe compatibles
Message-ID: <20231130-maturely-avert-e1dc87b36bbd@spud>
References: <20231129060043.368874-1-jeeheng.sia@starfivetech.com>
 <20231129060043.368874-2-jeeheng.sia@starfivetech.com>
 <20231129-revisit-prefix-5327168e91f3@spud>
 <08daada77b3e40049ef83f4eb762240c@EXMBX066.cuchost.com>
MIME-Version: 1.0
In-Reply-To: <08daada77b3e40049ef83f4eb762240c@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_070825_836352_30945892 
X-CRM114-Status: GOOD (  18.19  )
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
Content-Type: multipart/mixed; boundary="===============4999045060141605412=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4999045060141605412==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RhPgo4Il/hPk7nxW"
Content-Disposition: inline


--RhPgo4Il/hPk7nxW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 06:04:51AM +0000, JeeHeng Sia wrote:
>=20
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Wednesday, November 29, 2023 10:46 PM
> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> > Cc: kernel@esmil.dk; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.=
org; krzk@kernel.org; conor+dt@kernel.org;
> > paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; da=
niel.lezcano@linaro.org; tglx@linutronix.de;
> > anup@brainfault.org; gregkh@linuxfoundation.org; jirislaby@kernel.org; =
michal.simek@amd.com; Michael Zhu
> > <michael.zhu@starfivetech.com>; drew@beagleboard.org; devicetree@vger.k=
ernel.org; linux-riscv@lists.infradead.org; linux-
> > kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>
> > Subject: Re: [PATCH v2 1/6] dt-bindings: riscv: Add StarFive Dubhe comp=
atibles
> >=20
> > On Wed, Nov 29, 2023 at 02:00:38PM +0800, Sia Jee Heng wrote:
> > > Add new compatible strings for Dubhe-80 and Dubhe-90. These are
> > > RISC-V cpu core from StarFive Technology and are used in StarFive
> > > JH8100 SoC.
> > >
> > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > ---
> > >  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Docu=
mentation/devicetree/bindings/riscv/cpus.yaml
> > > index f392e367d673..493972b29a22 100644
> > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > @@ -48,6 +48,8 @@ properties:
> > >                - thead,c906
> > >                - thead,c910
> > >                - thead,c920
> > > +              - starfive,dubhe-80
> > > +              - starfive,dubhe-90
> >=20
> > s goes before t.
> Noted. Will fix it.

With the re-order,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--RhPgo4Il/hPk7nxW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWilYgAKCRB4tDGHoIJi
0iCtAP4nKPPe89Aie1cg6UtOVOK8OT9ZB+Xb/O+6Am1DPsGhWwEA5igg7/ujUZcP
J8H/nEGTpT7wdjwt5SqaGwLxKfGUNwA=
=R4A9
-----END PGP SIGNATURE-----

--RhPgo4Il/hPk7nxW--


--===============4999045060141605412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4999045060141605412==--

