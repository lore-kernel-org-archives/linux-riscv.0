Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB31F606A334
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DQOUEWPt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPAeudQF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IOop/iGf3Prtfj0HXytroMBjtNm5Yf/tPKMqnM5c2Wg=; b=DQOUEWPt6SgvIhQYG2+3h/nIuz
	7ox5MbO+MY/wVsieYgcaTCPoU7HANmKyQ+ZoHadgLsRpKG68TjTInrItatN10O4+gIv/R5W+j8P/S
	0FtRJ8fmGQEPSQUDNh7OIPnQAbUl/bIkV/Zm8/VMlojg7uenjl7Cyi/X34a9UbhbCOuqPRGq+uDOm
	4lSCQOZi2M5h3625027XcJUOVyhn8g03Rk/3c0jSV4SaBt3rdSvKRAlLVqBoU8T8QlQfdpXp2V5zd
	77HMLx1JMWB030esgunwuyrBwltSvUN3Lumk8BX3U8V1Iz0XY3+/ufNACTdpoacvtR+9aaDGqUweQ
	w4fpffLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrqN-0000000D4TF-35uo;
	Fri, 13 Nov 2026 14:01:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrqM-0000000D4Sy-2iuL
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 14:01:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B8FA6273F;
	Fri, 13 Nov 2026 14:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2299B1F000C5;
	Fri, 13 Nov 2026 14:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794578489;
	bh=Ie+nbm9Jsxef1EvK7rBLzcV6Szu01z+wcddOuAojf4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QPAeudQFxH4QAX2HQej9QKa1y/FEWB6fTpug0QdZuH8b7/q6Cjz0cqGr5lVutTTZ7
	 B7HJzb1/VG59UBBUyXXyFDvJeSZDnAvLSa5+PmbnnzW3pym8RVfvYOArEb6A/KgiOc
	 2lvSq4SGH4z9NpV1KjQlg6t0AMSTIccjGirAPHV04cxVI+Xfnoimve1SeLyxSBlD4p
	 Q3bqGYD3uJde65FB8X+5O0nRP2kLwOv8Nirf78rg5zlelsaxoUU1/ZBcVKdioGnerb
	 xJYmMqCzLSzOm4Br56NTHH2qWoGfZRy7VlCPpnqc9FQg7XIasK5D481Lgb5sAKpgqM
	 APVKuUWW6NMGg==
Date: Fri, 13 Nov 2026 14:01:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Mina Hui-Min Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jic23@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	randolph@andestech.com, cyyang772@andestech.com,
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 13/19] dt-bindings: cache: rename
 andestech,ax45mp-cache to andestech,llcache
Message-ID: <20261113-domestic-pull-f0a931907df5@spud>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-14-minachou@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261113071143.1446167-14-minachou@andestech.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8919089078473756938=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8919089078473756938==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uqgblaYPlAZjqv10"
Content-Disposition: inline

--uqgblaYPlAZjqv10
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 03:11:37PM +0800, Mina Hui-Min Chou wrote:
> The binding now covers Andes last level caches beyond AX45MP and uses
> andestech,llcache as the generic compatible. Rename the file to match
> it.
>=20
> Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>

Squash this with the other binding patch please.

> ---
>  .../{andestech,ax45mp-cache.yaml =3D> andestech,llcache.yaml}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/cache/{andestech,ax45mp-cache.y=
aml =3D> andestech,llcache.yaml} (97%)
>=20
> diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cac=
he.yaml b/Documentation/devicetree/bindings/cache/andestech,llcache.yaml
> similarity index 97%
> rename from Documentation/devicetree/bindings/cache/andestech,ax45mp-cach=
e.yaml
> rename to Documentation/devicetree/bindings/cache/andestech,llcache.yaml
> index da9688cc95f7..f97038d39b0e 100644
> --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> +++ b/Documentation/devicetree/bindings/cache/andestech,llcache.yaml
> @@ -2,7 +2,7 @@
>  # Copyright (C) 2023 Renesas Electronics Corp.
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
> +$id: http://devicetree.org/schemas/cache/andestech,llcache.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
>  title: Andestech Last Level Cache Controller
> --=20
> 2.34.1
>=20

--uqgblaYPlAZjqv10
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavcYNAAKCRB4tDGHoIJi
0jA5AQDk53IltjGYyWywsW2UsQmTBs0rjNnTg1RB2LCM8JdZRgD/XKBVI/Zxi6rd
ondOB2YJU33P9yniwrvay6A7J2ZrVgY=
=8pfH
-----END PGP SIGNATURE-----

--uqgblaYPlAZjqv10--


--===============8919089078473756938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8919089078473756938==--

