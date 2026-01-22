Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE65D6CFA2
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 18:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOv+PUQogkQfy9rS+N5/Z+Gh9BrgkGf8AEKeNlHHUaQ=; b=liX5Ida1taaetvOk6+bBZqtLWO
	Fhr/EkrvsPAB8UGtY2687AiEtDhMZT+dL9IDKhvToucNHSysmKvTs+saoddo9fxe43izycga4teCn
	1/kyrXt4qXIvtgmx+A4rKSg1dehC2k7LhT9bcmMeyQXyy17z0hiivU8P/i/luJBubqO/8V1/cZUtm
	aqmU+rRq4f7LAMwsZJqzDVEeH/3+fxMEgZzZS+NgL0lb+iRjEcwEGVBgUQc6KLYSaH4vmWPVKTJYY
	nZiHtS7KCRgn8cGTUdxTIoFBzNnfMHN/PKQwprcD0UlFLQ5qKfXm4lhky5wsAKR3b+Yb05vRFDB/V
	Rd84Buxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viznM-00000007fII-0YbD;
	Thu, 22 Jan 2026 18:52:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viznJ-00000007fHc-1QRs
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 18:52:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9472240B68;
	Thu, 22 Jan 2026 18:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E0BC19423;
	Thu, 22 Jan 2026 18:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769107956;
	bh=0V8Y5eVJy8Va7o6YR4MucS7wmP4IbYdB6u3T0vqBFkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OY+CRaIhHiTE4ubaMdTXZ+eTymp+O2qsx4SaX3DnPCFakjcC2/XMR1lIpatwSaqWt
	 q6Z9zOQbe38EYaAiVM0+vWvzXHaicCYgZd3VjBD8Xhr3eJKhko7Iv03tS7bGRoisoP
	 88Cys5otmDXL7Iy1mj3JfkPJ2wPEytn/FnkOXOYfkBn+rJZib0yzY8b03qvMrntgre
	 5c2fspZD2FKAvek1XxnDaMjzuKUwAKYeT2ynZIGxKwQE9AcoYRCkcHaWE7SrO8m9ma
	 vecI4kbdqVuOQgJLHEWq38F4EIhYZyYSe/oYRPZyBNP4AzQMbaaSa38RSUbcq+upFC
	 zeuyOrHliutFQ==
Date: Thu, 22 Jan 2026 18:52:31 +0000
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: riscv: Add Supm extension description
Message-ID: <20260122-headlamp-champion-0bbad2551d33@spud>
References: <20260116-supm-ext-id-v1-0-5fcf778ba4a6@riscstar.com>
 <20260116-supm-ext-id-v1-1-5fcf778ba4a6@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20260116-supm-ext-id-v1-1-5fcf778ba4a6@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_105237_424080_13DDF582 
X-CRM114-Status: GOOD (  18.28  )
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
Content-Type: multipart/mixed; boundary="===============3293424855974423556=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3293424855974423556==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="81dh77ACAYQKu44u"
Content-Disposition: inline


--81dh77ACAYQKu44u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 10:10:31AM +0800, Guodong Xu wrote:
> Add description for the Supm extension. Supm indicates support for pointer
> masking in user mode. Supm is mandatory for RVA23S64.
>=20
> The Supm extension is ratified in commit d70011dde6c2 ("Update to ratified
> state") of riscv-j-extension.
>=20
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 17 +++++++++++=
++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 4ffd61926505..1922dff03787 100644
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

Should we therefore make this require that Smnpm or Ssnpm are present?

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
>=20
> --=20
> 2.43.0
>=20

--81dh77ACAYQKu44u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXJx7gAKCRB4tDGHoIJi
0rrLAP9+fJ2YwqDLg2ufwFGAYpV04xBNeRNMujDywFtcEXyZCwEApEgBGJywQbRE
OqdtJ2qzI1d0kt1LDSw8Q+/m/utpuwg=
=FGwz
-----END PGP SIGNATURE-----

--81dh77ACAYQKu44u--


--===============3293424855974423556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3293424855974423556==--

