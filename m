Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D113C3ABCC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fckgEzq4WbdEOOp2Jm36lcpJuuqMlJzFAUzdp7wSiwk=; b=o2yd7tx8V6vTpMVKnBIqUIFGrv
	n9VFWEht/SA4iNWfzN0QV2FK4ORqP1CIOwi+OypcIzjRtUX/kVLE01CyX1jZefVGuBKRKcaC+JIcm
	PvqpwiGdZ+gouM299Bm7yWNfFsJGvnukawCl5qSHJQ8aTu2eigauGgg9jAPJUzW50Irj/DdLYprp8
	AgT0B3qtjCUM8PB2H5c75+b/To8oRCWCiawtzqzEVrVtpq0jpCzmLWeuA3wzu16G8KGtHYHZ5j9Zg
	cqcdtoehVIrDjhR0/AGNn0udmbroQVMiAWK4St3jiYa8qI1UqAwKlib+xqtNeV0rF3BBXlvjD3ZIf
	18by0vSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWOx-0000000A7f1-3oD6;
	Mon, 12 May 2025 16:53:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEW8H-0000000A4Du-3Skw
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 16:36:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8864649D95;
	Mon, 12 May 2025 16:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DF3C4CEE7;
	Mon, 12 May 2025 16:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747067761;
	bh=UutJlU+U+PC5vuoNA8XGRVHw2fxOnOzKGMbcX7lytaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SSyE2Rshzk/e7uG3PUwLrxTCh8AkVdBjpx8zmMElp5s2/yjKvmA21DCqT7ros70hC
	 pbYTmPG8PCxKXvs6IH50TBkQMP/ANIPXjlmQZXxVKZySs+CuCQ8Pf3v1WdOX0ES8dl
	 dzvSo+pa9CJ5f68urBDVTA7nkH71oVoUMO1hidWV59KzBw4OhxcS01bQhx5JJQUwxi
	 SBNjxwuAdF0DtjnPmv0T6x2U5pgROpKx2cIB/dJd9algKOwgoJ9HWNzNfvyft6fQlF
	 0j1JFPKPpogfZ/8Ozgz7QRk7/7ohynTL9Bptk+ycXlA4sfpUeOpoq8/wHmmCLyJwIJ
	 ae5MElyQ/OTAg==
Date: Mon, 12 May 2025 17:35:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: riscv: add Sophgo x4 EVB bindings
Message-ID: <20250512-dugout-twenty-4eaf88653c5d@spud>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
 <4a9236b67a368423c1bb1a86720dfcd7593f0d1b.1746811744.git.rabenda.cn@gmail.com>
 <5hn5ywklwlc2cfjeesarg7hcf2knsujloxijzp46o26ox33yzo@6kuf3bkqqigf>
MIME-Version: 1.0
In-Reply-To: <5hn5ywklwlc2cfjeesarg7hcf2knsujloxijzp46o26ox33yzo@6kuf3bkqqigf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_093601_892105_79751C72 
X-CRM114-Status: GOOD (  14.86  )
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
Content-Type: multipart/mixed; boundary="===============3373905411951492662=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3373905411951492662==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VG9g93rQvIs17bvF"
Content-Disposition: inline


--VG9g93rQvIs17bvF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 10, 2025 at 06:37:00AM +0800, Inochi Amaoto wrote:
> On Sat, May 10, 2025 at 02:13:29AM +0800, Han Gao wrote:
> > Add DT binding documentation for the Sophgo x4 EVB board [1].
> >=20
> > Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG20=
42-x4-EVB [1]
> >=20
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Docu=
mentation/devicetree/bindings/riscv/sophgo.yaml
> > index ee244c9f75cc..0f93f4cbfc6c 100644
> > --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> > @@ -35,6 +35,7 @@ properties:
> >            - enum:
> >                - milkv,pioneer
> >                - sophgo,sg2042-x8evb
> > +              - sophgo,sg2042-x4evb
> >            - const: sophgo,sg2042
> > =20
> >  additionalProperties: true
> > --=20
> > 2.47.2
> >=20
>=20
> Please keep alphabetical order.

Additionally, I think it'd be pretty reasonable to add both of these
compatibles at the same time since they're variants p much.

--VG9g93rQvIs17bvF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCIjbAAKCRB4tDGHoIJi
0tR+AP9b1shg4Lu3AUTKYTsqnHrJDBmUrhh7PZoACkE4XpNE9gEAuE9hd5Hl+qrd
3/aiIfboh3RAGHvZudETddxnf5DulwY=
=GPQK
-----END PGP SIGNATURE-----

--VG9g93rQvIs17bvF--


--===============3373905411951492662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3373905411951492662==--

