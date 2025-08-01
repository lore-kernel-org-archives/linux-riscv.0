Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07DCC87FCB
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlRqg0mpJA0kSSAJkqF9/4PYz55qoUbqi3bmSkzyfRU=; b=VbRqKzC8fh3WFDwxnGnMn0Cqto
	aAMx0c3/o/neyVBolzi64GnEBJZsgJ0H9HJOOZdXrZY1v/WdxJVO3F868UgVM7kRV+2a3plEs/6PY
	Gqr43wyHk3ugwfQIkQQNBewMboMNRnmKZK8cRpdNWqA871GP62gTvwVoEvkUlgCvx0G9RuX+u8KVV
	WcGr9QYUPm96fLvr3NLeVhXepM/o+mSpEBYXwAPst+BV6lGZSjdQcSwze1ylPKdj7o9d8MxP35D14
	ys6PtNZ7W5lIrxfzGfWzVhUsiruZVIppBTj8j3OmKKuAqvCYB8P4cyxg9bRRZDb9CF/oSeXy70hwV
	vVNgjQYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhvTf-00000006h6N-0fKt;
	Fri, 01 Aug 2025 19:31:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhvTc-00000006h5h-2pIb
	for linux-riscv@lists.infradead.org;
	Fri, 01 Aug 2025 19:31:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1305DA558F2;
	Fri,  1 Aug 2025 19:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC65CC4CEE7;
	Fri,  1 Aug 2025 19:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754076693;
	bh=TcZbBZapmGQ0Rnr4BOG6Vs70nByafs6BaT3xqjgKgEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwqNxYPlEHQsXABuSbTPq9ikmDFweJrimgwN1Y/Be9zFSZ6otUuhGupkJ6CIMx9Os
	 ZHYkFwVXVozwzR/MiewKAJ3vFLxQIt63C06Q2sltPkBXQherTpWHpva7w82k9gxSSu
	 ADp0ixEkbF4ck5W/DoSPTfLE8NimYG0cxI8DrTjyFbbfgIe+2+EidLNFg/GxCzo4tz
	 GYLWZdALm6Y8GNyfjoAzhcyshT1M98E2g1jZ1JFtTDKZBlKQ/OdBrkdfDZmQns52Y4
	 V92ia6J+gqweIl9EN7v5XT7pLFtmX+q0EScVJfKr/0PfbamvqbTOoQpicstA6yCrib
	 SJgzl7q890WAA==
Date: Fri, 1 Aug 2025 20:31:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2] dt-bindings: riscv: Add SiFive vendor extensions
 description
Message-ID: <20250801-lunar-stream-0fdb3f0febec@spud>
References: <20250801070112.12071-1-nick.hu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20250801070112.12071-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_123136_838253_E485B6C9 
X-CRM114-Status: GOOD (  18.37  )
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
Content-Type: multipart/mixed; boundary="===============1142892081311653569=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1142892081311653569==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wbkrqDwsXdSIcaGf"
Content-Disposition: inline


--wbkrqDwsXdSIcaGf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2025 at 03:01:12PM +0800, Nick Hu wrote:
> Add description for SiFive vendor extensions "xsfcflushdlone",
> "xsfpgflushdlone" and "xsfcease". This is used in the SBI
> implementation [1].
>=20
> [1] https://lore.kernel.org/opensbi/20250708074940.10904-1-nick.hu@sifive=
=2Ecom/
>=20

> Changes in v2:
> - Update the message to indicate the user of the extensions.

This should be below the --- line.
With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
although I suppose it'll be me taking this and I can fix it up on
application?

>=20
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index ede6a58ccf53..5638297759df 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -663,6 +663,24 @@ properties:
>              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-=
5.0.0-Datasheet.pdf
> =20
>          # SiFive
> +        - const: xsfcease
> +          description:
> +            SiFive CEASE Instruction Extensions Specification.
> +            See more details in
> +            https://www.sifive.com/document-file/freedom-u740-c000-manual
> +
> +        - const: xsfcflushdlone
> +          description:
> +            SiFive L1D Cache Flush Instruction Extensions Specification.
> +            See more details in
> +            https://www.sifive.com/document-file/freedom-u740-c000-manual
> +
> +        - const: xsfpgflushdlone
> +          description:
> +            SiFive PGFLUSH Instruction Extensions for the power manageme=
nt. The
> +            CPU will flush the L1D and enter the cease state after execu=
ting
> +            the instruction.
> +
>          - const: xsfvqmaccdod
>            description:
>              SiFive Int8 Matrix Multiplication Extensions Specification.
> --=20
> 2.17.1
>=20

--wbkrqDwsXdSIcaGf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaI0WEAAKCRB4tDGHoIJi
0uYTAPsGwJFW4yNjwYW1pBmrtz8xINlz60+L0eZqXY81BKT/owEAimug6HQAtgP4
UpmPq+OYSLSIcv7IE9Am7z3Yn50aSQ0=
=6jVn
-----END PGP SIGNATURE-----

--wbkrqDwsXdSIcaGf--


--===============1142892081311653569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1142892081311653569==--

