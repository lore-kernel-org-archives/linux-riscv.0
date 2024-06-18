Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A30AC27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 15:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFrNrWR1OjzRREDjWhh/gUoJh8fZGB5ha+eay3CWzAc=; b=lJqDKodle/KaPXro6r93+fyEu/
	2Wd9zddf/KI6lK1hXHAh+shCc0+yrFfip8eAUGFVoD0A3nZKLK2RDc8fOyMotpD3GrFq7PeA0rtYH
	tHtDyNBrsCtyY8jolKsBZeat8pHqxUaAHE1Z/G9oKz2NOmje6Af/IzJhB0YG+xXiBzaAFnx4NoFm9
	E05WhoVuEfboP76lx10a1UGFzkWOOevlg2fG3H1VMymBAb57Ge9jH2IvoqaKyOh3XhmyUB9u2Gk7l
	rItsn7kZgb3sGKRXerRZ34zhQTvzsDMKl5Z5s8LvvY0K5mUoXJ+AXVm0SOCV41xYpBYIASDbHw3+w
	cELmnPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJb1K-0000000FfbS-1VIu;
	Tue, 18 Jun 2024 15:45:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJb1D-0000000FfaO-1LOs
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 15:45:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C618A611E6;
	Tue, 18 Jun 2024 15:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA61C3277B;
	Tue, 18 Jun 2024 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718725510;
	bh=F7qCtL/TRa349qM37w7NX5SEsgwuB7UBQB2JKXbO30M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QIBegaMWQG3p5eCRWU7hN/GtAe7kFGPfJL9wZulH13R0JGSuaQUQ7XgICX3ts+Zql
	 VOqWGFk6x0dXWPjjIpJM/E3L9v15K3/mf9YT+7AdS5I5sxBUpfujP2v6t7Zsky7luZ
	 tbU3TeHeQE6mmJLxuRjz64DwHKGotM1s8Ut54A6WKQJ6+sF9GXQciAxP1dAhTQDPbS
	 l/LvK6mOEn8apzaqbB7P2sG2eonFLDe/WrMHA0cWIWbp3G8bSchzRyFacYQSCsUzYn
	 2NTGh8rnz+Oh+neBRnZeQuFw2cD/NPqRtnVMTWeIXZgtLlyQjbBMsyrc1R4UuOA51Z
	 PGPxSgM2QroSg==
Date: Tue, 18 Jun 2024 16:45:06 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, Anup Patel <anup.patel@wdc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/9] dt-bindings: riscv: add SpacemiT K1 bindings
Message-ID: <20240618-populace-percent-565e71ffd493@spud>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_D3577BC67116D732862BE4A7B187EF4ED005@qq.com>
 <171856332052.2487659.8752285245461346812.robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <171856332052.2487659.8752285245461346812.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_084511_465265_9B74DD8B 
X-CRM114-Status: GOOD (  18.39  )
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
Content-Type: multipart/mixed; boundary="===============3289053145157497753=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3289053145157497753==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7cbKCabtDyz99omE"
Content-Disposition: inline


--7cbKCabtDyz99omE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2024 at 12:42:00PM -0600, Rob Herring (Arm) wrote:
>=20
> On Mon, 17 Jun 2024 01:20:48 +0800, Yangyu Chen wrote:
> > Add DT binding documentation for the SpacemiT K1 Soc[1] and the Banana
> > Pi BPi-F3 board[2] which used it.
> >=20
> > [1] https://www.spacemit.com/en/spacemit-key-stone-2/
> > [2] https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3
> >=20
> > Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> > ---
> >  .../devicetree/bindings/riscv/spacemit.yaml   | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/spacemit.ya=
ml
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/r=
iscv/spacemit.yaml: 'maintainers' is a required property

Whoever takes on platform maintainership should add themseves here.

> 	hint: Metaschema for devicetree binding documentation
> 	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>=20
> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/tencen=
t_D3577BC67116D732862BE4A7B187EF4ED005@qq.com
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>=20

--7cbKCabtDyz99omE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnGrggAKCRB4tDGHoIJi
0qc6AQCwbB9+9rTwl/Zl4qPNTiLVl+i8RK5ECwxNYFI72oFLHgD8CtzW+3tkQ+vi
YfA4XLHuuGKZBpevxhVsCD3loUe1gQI=
=ho0M
-----END PGP SIGNATURE-----

--7cbKCabtDyz99omE--


--===============3289053145157497753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3289053145157497753==--

