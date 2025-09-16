Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C9ACAC59B
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 19:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQe2axm4aUr9AjTCM0nkWzhXgh8AoFDUISoxsy+sl54=; b=4Y1wWpZdG3Wx1GqPcWw22roeIb
	Oi7gfZ2YhC+gcwkzbuZQTPCrVK0PYXhKBxnTYTwPBGiVbU/1bO6uLP5i56Q3BT1XuP9lZ4rx4tBJU
	U9JU3GYNM+zEEam+iQzc/pIXPbnCIYdFEP9ePX/Mwy+rMZRknJ2X+5YVdqKL6SvWYyBITPOiZn5ey
	ePufM9PoMc+/C6nMrXxULH56GG1dlqnWpBitw4EvKh0AS3j8yZnwXi6MyxU44drf6mrE6pUaLWBkr
	hgaqwBYJJZwbDqqnXvt+UpgOtpx64LV1PYdbxp4eCTqbi48oVGpzrH2HOhzv7NApUVxX2UMQWt4hg
	WRbIKBng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybEh-00000008quf-1d1u;
	Tue, 16 Sep 2025 19:21:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybEg-00000008quR-3W3i
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 19:21:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B4D8160206;
	Tue, 16 Sep 2025 19:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2B1C4CEEB;
	Tue, 16 Sep 2025 19:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758050465;
	bh=6+WqFfDAReqi0O3H8d46eKzoBiYaoKSbaFyax7f1R6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YbLibwDf7yCOcK9svXpIDFUcOn32houdi7d16upgcEbaGLSNZTOrorXqEHyoimOas
	 xizUTKlJ0+Nx/BPNdCxR0b43KWKcf3/DRo3Sd0huDxC7I5LveFpwLW45Pocbe+uvAr
	 Xvhiiqm2ztQqKix/6+XVs+JZey7NT05JprdAdyW6CiYLt1TTKHh/H4WX1TUy3SQ+jq
	 zEr8yM4lpxavP+iD9nNBErkcJVvzNO9WmjP7kNkZ/hi6Fly+FAO7GLPNIYktMMr/U5
	 FDiDEQijdpHQlL8cQ1Lv/tfjS8n+VJ3ABJwsi0IlwQ+cVD9ZQc8fm1s1Vlow9xedKc
	 HLNVwN64wNpmQ==
Date: Tue, 16 Sep 2025 12:21:03 -0700
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor@kernel.org>
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
Message-ID: <aMm4n2PlI8JqmK2c@x1>
References: <20250915-ssqosid-v6-17-rc5-v2-0-2d4b0254dfd6@kernel.org>
 <20250915-ssqosid-v6-17-rc5-v2-1-2d4b0254dfd6@kernel.org>
 <20250916-landfall-easeful-782b60eb7d69@spud>
MIME-Version: 1.0
In-Reply-To: <20250916-landfall-easeful-782b60eb7d69@spud>
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
Content-Type: multipart/mixed; boundary="===============2052935827032149039=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2052935827032149039==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tpbFvsgPwTSnAM87"
Content-Disposition: inline


--tpbFvsgPwTSnAM87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 07:36:01PM +0100, Conor Dooley wrote:
> On Mon, Sep 15, 2025 at 10:13:41PM -0700, Drew Fustini wrote:
> > Document the ratified Supervisor-mode Quality of Service ID (Ssqosid)
> > extension v1.0.
> >=20
> > Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/=
Documentation/devicetree/bindings/riscv/extensions.yaml
> > index ede6a58ccf5347d92785dc085a011052c1aade14..38e3d8d38cce55022ea70eb=
52423b1163e3cb097 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -165,6 +165,12 @@ properties:
> >              ratified at commit d70011dde6c2 ("Update to ratified state=
")
> >              of riscv-j-extension.
> > =20
> > +        - const: ssqosid
> > +          description: |
> > +            The ratified Supervisor-mode Quality of Service ID (Ssqosi=
d)
> > +            extension v1.0 which adds the Supervisor Resource Manageme=
nt
> > +            Configuration (srmcfg) CSR.
>=20
> Please cite when it was added, as is done for other extensions.

I had seen the pattern of commit X from Unpriv or Priv spec but I was
having trouble adapting that for Ssqosid as it has its own v1.0 PDF.

However, I now notice 'zacas' seems to have its own spec. Would this
work for 'ssqosid'?

        - const: ssqosid
          description: |
            The Ssqosid extension for Quality of Service ID is ratified
	    as v1.0 in commit 5059e0ca641c of riscv-ssqosid.

Thanks,
Drew

--tpbFvsgPwTSnAM87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaMm4jAAKCRDb7CzD2Six
DLUeAQDO5lFaFCk4ig6oiUbCMV1B9ivTXYq9bg45BcgvGSoJ5wEAkSJ5NLq9ohsk
h+B7lIHYwZ3f6UjrMUYCusgwEo4uwgQ=
=FJJd
-----END PGP SIGNATURE-----

--tpbFvsgPwTSnAM87--


--===============2052935827032149039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2052935827032149039==--

