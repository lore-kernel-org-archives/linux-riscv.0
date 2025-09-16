Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFEFCAC592
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 18:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzffhyO1b2wvVAO64bncde53PYQK2O6ydzIL0XSlnHU=; b=i4/owKZNfO2wKSf5qDOToHD1pW
	OeWC9fLlJXeR/qTBBAcIztGlxuh3nYskvjSoJ467NWiSx4iWK678j6QO/h6iYM070aVl2TrNRzODE
	fvCw+b+jWKxfGglrZSwe+GkVErgaSz4iz4r51oiVMBxzl0GM6p0ugtFqeemzItmHGUbLIlHcYPivq
	wGESsUhw+GXUb5zbYFuQiayo+IEUfX/Sa1qcGZuOqYKvBFODa34nRFFypxweNlpQShLnIwFCUx8w+
	MCak++xbaQNXlzXNi5yyl9lJtya4vDHzCnYC21CAomE5qzvWpdquRBZPZ1xYHG1pCzQX8O2uqCGWn
	r1jlitfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyaXB-00000008m6B-2wTT;
	Tue, 16 Sep 2025 18:36:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyaXA-00000008m5w-1bg6
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 18:36:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A06B601DD;
	Tue, 16 Sep 2025 18:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D081AC4CEF0;
	Tue, 16 Sep 2025 18:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758047767;
	bh=mHVkIV4tL9Rda/ZarYcZ290uoCuLvSzpJ80gAfOXuEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u/dzIpvoyd6EvdfR20kPcrLEC6vsoQbOs/RrSP5qvaQXZbwUeTRbXW1sjo20E7HqO
	 UXS+/57GbnY8vvB07UPvR7ONlWhF3UX1zQmjs3hPfMY+s/8xAUzRR7yp48i3ubcoOO
	 LQAaUzLDYRVxo6v+mKRy4gzt7pafTO1QP5Ks5q8fOc9LQp6DIfdEdcs61N4B6pvp9X
	 KiCguWfbcwuVwTGY4q1sNqwRhyLUeCKt/FAUpoe1nt/j9+ET0J3nAyUq135Wh+YvR0
	 YhounW9R5QJvEGlP8wqRLH4+Ub4DbqUAznnceT52Y6BpEJ5SfYg9vh4oCu7lgkeNVD
	 yXAYP7BYncyoA==
Date: Tue, 16 Sep 2025 19:36:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	James Morse <james.morse@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Vasudevan Srinivasan <vasu@rivosinc.com>, guo.wenjia23@zte.com.cn,
	liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: Add Ssqosid extension
 description
Message-ID: <20250916-landfall-easeful-782b60eb7d69@spud>
References: <20250915-ssqosid-v6-17-rc5-v2-0-2d4b0254dfd6@kernel.org>
 <20250915-ssqosid-v6-17-rc5-v2-1-2d4b0254dfd6@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250915-ssqosid-v6-17-rc5-v2-1-2d4b0254dfd6@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============6961054092308888979=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6961054092308888979==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FU1bsTvOEaaQEW9g"
Content-Disposition: inline


--FU1bsTvOEaaQEW9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 10:13:41PM -0700, Drew Fustini wrote:
> Document the ratified Supervisor-mode Quality of Service ID (Ssqosid)
> extension v1.0.
>=20
> Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index ede6a58ccf5347d92785dc085a011052c1aade14..38e3d8d38cce55022ea70eb52=
423b1163e3cb097 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -165,6 +165,12 @@ properties:
>              ratified at commit d70011dde6c2 ("Update to ratified state")
>              of riscv-j-extension.
> =20
> +        - const: ssqosid
> +          description: |
> +            The ratified Supervisor-mode Quality of Service ID (Ssqosid)
> +            extension v1.0 which adds the Supervisor Resource Management
> +            Configuration (srmcfg) CSR.

Please cite when it was added, as is done for other extensions.

> +
>          - const: sstc
>            description: |
>              The standard Sstc supervisor-level extension for time compar=
e as
>=20
> --=20
> 2.34.1
>=20

--FU1bsTvOEaaQEW9g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMmuEQAKCRB4tDGHoIJi
0ko0AP4y/Tm22kiiCODnBOJhdTw0+XbdBqYIFr7KJlQpw/Kk/wD/WygUmJ+J8TFO
g9bt9U9BwC0FQdrnHRefqDL3JtQtQQ4=
=UDCY
-----END PGP SIGNATURE-----

--FU1bsTvOEaaQEW9g--


--===============6961054092308888979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6961054092308888979==--

