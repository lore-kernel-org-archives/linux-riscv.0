Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11F6CD6E57
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76oRl0NR7CDpFww3mSyjoeZWUuEQCT7WueMy4mYwHc4=; b=TCObMrhr1H32vQXYkZl2z2OtMN
	ALJyyKsFsMQUnPupoXqs7tPBNs4dtWRvi+AdyeK6FTbYLngHfRe2Gf317rhxIW7H5O1mDFrl1gCKY
	6v5N74BGpP08V9JGu6YMa8+TtW+ycb/4v8cFgEGDWhTPhlguvR9CFMdyblEpUpUWLr1MUHFO/c7MF
	QCcYeLEOWdlepThGFNSGLuyrXSQWmOCIxL7KcQE58738rAr6vpHnUxkwGi7VdfZKNiQzv/FY9bIzM
	LksDkTx829mUvp8x82huaE3+35d0s+ZYPX/AjzYkcrQCl+90/AspFclCdii3HiE73fwnPTQWltYb4
	szLCnm0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoJJ-0000000FVar-2hQn;
	Wed, 03 Jun 2026 16:19:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoJH-0000000FVaI-1Cvv
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 16:19:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DAB7341A19;
	Wed,  3 Jun 2026 16:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0A71F00893;
	Wed,  3 Jun 2026 16:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780503554;
	bh=RYDnMoFkGoMbthW/cDkhbVtgE1RhM2hvasPu/pp1fPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OBzHvjOfeinUk3riPEpdNHaTpETsDDcFkNtgEheKfP/+biEZ1wNMO7gb3QuSzDVAg
	 JemIRVGrGkx311d84Qx8oWMMfwjGBs2j07Z3tkvUlkYDJ73q4zATm7GQ+HiB6YnSPB
	 /KlaSBiJqV/CNSSh4vGV9rrkPuFxmX9I+FSLQULVdOr0Jn24nABnlZkxmS/dJ0iwkl
	 53QffyEuOmQnVerG6rZ4br0ztXm8aR5/P5aLGQJzSf4dSiEhES+ncohYzJgf8ZLW37
	 oSZCnR9g2j/7Q71RVoEPVfy8zrgaLhEBQa5Z6chSr+bAzdo27om75cEjDQ69ePpjSZ
	 TYPC92NBZRLVg==
Date: Wed, 3 Jun 2026 17:19:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: aplic: Add Tenstorrent Atlantis
 compatible
Message-ID: <20260603-landed-starting-e9ae05ee5bad@spud>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-2-joel@jms.id.au>
MIME-Version: 1.0
In-Reply-To: <20260603074222.593243-2-joel@jms.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_091915_348707_39A874C9 
X-CRM114-Status: GOOD (  12.57  )
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
Content-Type: multipart/mixed; boundary="===============1912315997687365804=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1912315997687365804==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o6fKTAQ8s6Qwklcx"
Content-Disposition: inline


--o6fKTAQ8s6Qwklcx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:12:13PM +0930, Joel Stanley wrote:
> Add compatible for APLIC in Tenstorrent Atlantis SoC.
>=20
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

And here. The contents all look fine of course.
pw-bot: changes-requested

> ---
>  .../devicetree/bindings/interrupt-controller/riscv,aplic.yaml    | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv=
,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,=
aplic.yaml
> index 0718071444d2..d4e17861eda4 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.=
yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.=
yaml
> @@ -29,6 +29,7 @@ properties:
>        - enum:
>            - qemu,aplic
>            - spacemit,k3-aplic
> +          - tenstorrent,atlantis-aplic
>        - const: riscv,aplic
> =20
>    reg:
> --=20
> 2.47.3
>=20

--o6fKTAQ8s6Qwklcx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBT/gAKCRB4tDGHoIJi
0l5GAP0fvT0M06cFFeyqtsR+mNv08/sfjuufzpFb4swLyoR5vgEAwnmvpoSNybTy
zZq6Bj6p+IYUyQcI479x6VQKnYjgkwg=
=oPhm
-----END PGP SIGNATURE-----

--o6fKTAQ8s6Qwklcx--


--===============1912315997687365804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1912315997687365804==--

