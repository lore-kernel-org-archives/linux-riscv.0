Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E97D46BF9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLAGV6gGxxY5/+mQFcwKCY9DehsiXJ1MN+8f73ISldc=; b=he7917rjCW4LxEKz4xYt7nJz8L
	sAe89ssJe4d9BwBt/Wh3tkoKkExVw7AS2C4TJfKtpto4xJE8E8NaHIn+oq87wXY9G61L5z/KQoncs
	gmvofEDUx0UqtDo7Vtx/DhLGvVSIARpv7wNH8UG1AbYrXtnCGYPUcjlMHROFFEH3gIAjBP5AGU/oV
	983JamsiHoAYd5aq/yLATCDqcwbScwvI+LraJgjGT6273XEft3SnBODyWRUqUQXGONbEzP6XeRwB9
	cH+gdQMgHxN3WI4U9OeewC+urZp52z3R8aB5tx2liOlzjw8O7xhowfQ0TSTuw1XhwLtaCjrlV+cgW
	2gRfXprA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBs5-0000000Gign-0xXD;
	Wed, 28 Jan 2026 20:10:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBs2-0000000Gigd-1fx9
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 720E56000A;
	Wed, 28 Jan 2026 20:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278F7C4CEF1;
	Wed, 28 Jan 2026 20:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769631033;
	bh=cbUTU7UNDP0PcQPrkgEPxOaWJaIp7t5a4TDdNENC9sQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RyHHTAlKb5eS4BFX+Ch9ajyVf8ZIjISXgZhpX65ZmewBuzaGEjODnpepq0cOhxXk+
	 W9UaEu3RJk+MAqDZ3u9jGCKTdLdT3toK6JV7DrCPovZkLjRxpUi8Qcn9txEPHy9Y+1
	 KrLShf3iCnzBS8+GW/3JnqVlaId+Xq0SmY8+3LGVboM1vmvI7SCh9PHzP44d4301OE
	 mcdeHvsYe/MHNgvuNf1CQj8Smc1ZXZVDt42NChEyssMcY0BbdimGVWmUWqOoKZoyOP
	 NKbAg8iGCxIs8bymtpsQ19QZfpg9uKtAK9CRTvMX7VXmUp2NvcjXXqKpRSFPAUDSpT
	 wwpo2DdbEvCag==
Date: Wed, 28 Jan 2026 20:10:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: Add Supm extension description
Message-ID: <20260128-steering-luckless-565bb14495a1@spud>
References: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com>
 <20260125-supm-ext-id-v2-1-1e3b9714c860@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20260125-supm-ext-id-v2-1-1e3b9714c860@riscstar.com>
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
Content-Type: multipart/mixed; boundary="===============7149445237762130639=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7149445237762130639==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qxguFY5XCRtrbMWp"
Content-Disposition: inline


--qxguFY5XCRtrbMWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2026 at 09:36:06AM +0800, Guodong Xu wrote:
> Add description for the Supm extension. Supm indicates support for pointer
> masking in user mode. Supm is mandatory for RVA23S64.
>=20
> Add dependency check that Supm requires either Smnpm or Ssnpm.
>=20
> The Supm extension is ratified in commit d70011dde6c2 ("Update to ratified
> state") of riscv-j-extension.
>=20
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

FWIW, this is missing my 6.20/7.0 (whichever it ends up being) PR cos
I'd like some other folks to look at the series. If Paul/Palmer are
happy with it though,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
> v2: Add dependency check for Sump.
>     Put the check blok after single-letters and before Z*.
> ---
>  .../devicetree/bindings/riscv/extensions.yaml      | 27 ++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index c6ec9290fe07..2b0a8a93bb21 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -262,6 +262,23 @@ properties:
>              ratified in RISC-V Profiles Version 1.0, with commit b1d8066=
05f87
>              ("Updated to ratified state.")
> =20
> +        - const: supm
> +          description: |
> +            The standard Supm extension for pointer masking support in u=
ser
> +            mode (U-mode) as ratified at commit d70011dde6c2 ("Update to
> +            ratified state") of riscv-j-extension.
> +
> +            Supm represents a combination of underlying hardware capabil=
ity
> +            (Smnpm or Ssnpm), U-mode consumer privilege level, and M/S-m=
ode
> +            software configuration that enables pointer masking for U-mo=
de.
> +
> +            DO NOT include this property in device trees targeting privi=
leged
> +            system software (S-mode or M-mode).
> +
> +            This property is only appropriate in device trees provided to
> +            U-mode software where the next-higher-privilege-mode supports
> +            Smnpm or Ssnpm and enables it for U-mode.
> +
>          - const: svade
>            description: |
>              The standard Svade supervisor-level extension for SW-managed=
 PTE A/D
> @@ -907,6 +924,16 @@ properties:
>          then:
>            contains:
>              const: b
> +      # Supm depends on Smnpm or Ssnpm
> +      - if:
> +          contains:
> +            const: supm
> +        then:
> +          oneOf:
> +            - contains:
> +                const: smnpm
> +            - contains:
> +                const: ssnpm
>        # Za64rs and Ziccrse depend on Zalrsc or A
>        - if:
>            contains:
>=20
> --=20
> 2.43.0
>=20

--qxguFY5XCRtrbMWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXptMwAKCRB4tDGHoIJi
0i/IAPwIYQeMxvZnB3qX0r5k2G4LWuHgJmduU+vhmMmN4Dp59gD/S6sCI+hDlciv
V3PF2CQwUvIJFEDbW9Mt1wkk+BIUggk=
=TPgz
-----END PGP SIGNATURE-----

--qxguFY5XCRtrbMWp--


--===============7149445237762130639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7149445237762130639==--

