Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81280CD6E57
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 16:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDot0heBz7JWX2WyNyMIpCj0Q/u5PZ5dHq8N6I+Hoqo=; b=Wec0FALuZ6PiiP8d3ihuVRf3A/
	pHCKi8wRQob+GEHuDo90gW30NC7vJR5CJMIuPyCx0Z/4bF5gjUanC190NMBnG2jiY28kxvEGOlGpx
	Xt46W4RazMJDYYRmViMkbuAVfgpdS59KLfUiLW85JTKMxvFw0dp1EUJLn8Q/LvNYYcGydTujlWMDI
	NyS53CmOgQ5C1bGVg5LCNVCDkraSyGjA4Z1UHUqFXk//8Sb2VivK4XdmmY69brXsF+GA0p05Hj6i1
	5kXxkKUUI5MeOfAuMmH3OD8S0yJhvgCW2LrR2SkQa3CGpkwNEgowwpb3Swhaq/6Llki+5MUauhNGt
	LlDZ2UVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoHs-0000000FVLT-14Tq;
	Wed, 03 Jun 2026 16:17:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoHq-0000000FVKs-0mfT
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 16:17:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9C8742A13;
	Wed,  3 Jun 2026 16:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6471F00898;
	Wed,  3 Jun 2026 16:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780503465;
	bh=oZrCq03vD+W7CnEX3l5q3h1hepjeCf4/ygYLn31YoL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZWSldL2ZiXpFW3jwjJWtQr8OT0DAL9K4RRNxBR4xKm/e2Kcq0duqn2px+j2OJY6WA
	 T4irrP12C31C6lOEKygjx89UUlWKbyTGW468vBkYLu7JElqNGmPv1mzfA/8jU+l15S
	 wGD7/nkus/x57oVnzeVn4TSrA7yEzMJvWntb6cGJZdpU+VF0JEpCRax/rt2J3F+VnD
	 WBRLAXI0ahZy+hC15GMTwgqAj6y53/StyS2WMj1pOPx3GhCDVWmGgC5JK9Ty20ZIMt
	 8a0jwaB/wZdGoUPiPsUsHVytBiX82xFbf432yLUjC9DbqwG04cdZbxSsqwVwUO+tm9
	 jWfJX8GK3Np+g==
Date: Wed, 3 Jun 2026 17:17:41 +0100
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
Subject: Re: [PATCH 6/7] dt-bindings: riscv: Add Tenstorrent Atlantis platform
Message-ID: <20260603-enrich-primal-69483cc92b84@spud>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-7-joel@jms.id.au>
MIME-Version: 1.0
In-Reply-To: <20260603074222.593243-7-joel@jms.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_091746_245375_7DDD0240 
X-CRM114-Status: GOOD (  13.13  )
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
Content-Type: multipart/mixed; boundary="===============7831138685897429683=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7831138685897429683==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qgBMOnVz6MeZyK6M"
Content-Disposition: inline


--qgBMOnVz6MeZyK6M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:12:18PM +0930, Joel Stanley wrote:
> Add compatible for the Tenstorrent Atlantis platform.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Drew Fustini <fustini@kernel.org>

This one has weird signoff stuff.
pw-bot: changes-requested

> ---
>  Documentation/devicetree/bindings/riscv/tenstorrent.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml b/D=
ocumentation/devicetree/bindings/riscv/tenstorrent.yaml
> index e15359b2aab6..7fb640e38455 100644
> --- a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
> +++ b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
> @@ -22,6 +22,10 @@ properties:
>          items:
>            - const: tenstorrent,blackhole-card
>            - const: tenstorrent,blackhole
> +      - description: Tenstorrent Atlantis
> +        items:
> +          - const: tenstorrent,atlantis-evb
> +          - const: tenstorrent,atlantis
> =20
>  additionalProperties: true
> =20
> --=20
> 2.47.3
>=20

--qgBMOnVz6MeZyK6M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBTpQAKCRB4tDGHoIJi
0iDiAQCisvgMhNdE+uYp81bLvRKeSjsd8VI9jc5Zm9HN+H6hPQEA5o/26XX+Vw+S
yTEQhDEp765BindUwHoJq/KTinlwfQ0=
=LejP
-----END PGP SIGNATURE-----

--qgBMOnVz6MeZyK6M--


--===============7831138685897429683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7831138685897429683==--

