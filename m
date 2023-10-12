Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E884ECDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 13:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jpyst/yivGoolGAE0I9mURoEmQQOWw1Y5SIrF2JvW5E=; b=yj/MvaG8oRNL2XoIZd8gFXdmut
	QJyQGn/lPfP3ujMCe1dznmN/gQgXvQXTbaqu38sk+XDRj7zpwG7oTpMkWhY9c1PiifROb53Q8C0sy
	6ZffDpo5fI8x8EyMflJ/4vBQz9olG9LD55raO45vthMSUQt7soMw6sH/02tIH0kraylJx7TAAW38J
	iziUQ31CH9sA1jw3zBLrW8TavPmGqCtYINJF2gH5Rycpm2eaV+2AaojUolADbJH8Ox6W0UmajrfzT
	XL3qBFcTHFMYuJGS95ARPnG8HJTy66q2WLqn2ojZ/gg/8GXH9kAaTeu9jp0j4OcfMleqCdxEa9SuD
	FvjAif1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqw5V-0017Rj-0E;
	Thu, 12 Oct 2023 13:50:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqw5R-0017Pk-0f
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 13:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6721BCE26FB;
	Thu, 12 Oct 2023 13:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113F5C433C9;
	Thu, 12 Oct 2023 13:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697118645;
	bh=MOnTFzPsgaiw5z0OTC72mCTag1CO1+AnxUxm3+li5Hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RNbCPeD8XJOri94mQkP0BcFH6MgculKCU5LzTb5Yapy9WaAh+MmA1TmjwWKywH0p6
	 2d0lA3F3c5UwZOkZ/X8FXHz6d2HoDnWEIfxbuPpqjq5N+4PpfH+I3LNEIMa5cKTkYh
	 mTyv0EKQpxwzaJ3fRGZEpgVxstBG2Ns9VgdZ4kS9vHW17eZVW2msRGu6bNIOTM+Rgh
	 fVPB8jwJhrDaDLKMHcFa+DXn/GZhXkrrZ87OgM5ocHQLPjUP73kxbJxVFqwGRXREJU
	 jAZt83B5o4LD7n+6gpB46RZesYh1ILlc9+M9lxZAwjgpd22OMWbd/iX8fWelhAhJXh
	 4i+wsS1N5mLcg==
Date: Thu, 12 Oct 2023 14:50:40 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v1 10/13] dt-bindings: riscv: add Zihintntl ISA extension
 description
Message-ID: <20231012-ambiguity-angular-d8c69cc01535@spud>
References: <20231011111438.909552-1-cleger@rivosinc.com>
 <20231011111438.909552-11-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231011111438.909552-11-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_065049_585354_339AFC14 
X-CRM114-Status: GOOD (  17.10  )
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
Content-Type: multipart/mixed; boundary="===============8337249162978608960=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8337249162978608960==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ffU11xaBPoUA4wKk"
Content-Disposition: inline


--ffU11xaBPoUA4wKk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 01:14:35PM +0200, Cl=E9ment L=E9ger wrote:
> Add description for Zihintntl ISA extension[1] which can now be reported
> through hwprobe for userspace usage.
>=20
> [1] https://drive.google.com/file/d/13_wsN8YmRfH8YWysFyTX-DjTkCnBd9hj/view

Ditto. Who is even hosting this google drive anyway? I'd rather see
GitHub links to docs from the releases, but since youre pointing at the
ISA manual I suppose those do not really exist.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 4c923800d751..70c2b0351357 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -247,6 +247,12 @@ properties:
>              The standard Zihintpause extension for pause hints, as ratif=
ied in
>              commit d8ab5c7 ("Zihintpause is ratified") of the riscv-isa-=
manual.
> =20
> +        - const: zihintntl
> +          description:
> +            The standard Zihintntl extension for non-temporal locality h=
ints, as
> +            ratified in commit 0dc91f5 ("Zihintntl is ratified") of the
> +            riscv-isa-manual.
> +
>          - const: zihpm
>            description:
>              The standard Zihpm extension for hardware performance counte=
rs, as
> --=20
> 2.42.0
>=20

--ffU11xaBPoUA4wKk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSf5sAAKCRB4tDGHoIJi
0gC2AQD48YxgYkelm7aLEyIMUPGcp0GjgzEJ5HTxkUKhc+hw8QD/bS9XpWTiVQvm
Q+es7WC1l3yctYOGH/AlHpnA4qG/fQA=
=ovFo
-----END PGP SIGNATURE-----

--ffU11xaBPoUA4wKk--


--===============8337249162978608960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8337249162978608960==--

