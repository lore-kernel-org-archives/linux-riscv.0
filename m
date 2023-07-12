Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DB5EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 15:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvkKKAA9HOXQHGCn+1l2/F4yrbMK5UK5CM+8r5VVpsg=; b=lDPXR9heShpE/PpaudSfY4SBt+
	y0t+StlDdy30mAoSrQWiSK6z25U1ACxCUdJsKiaUnfYnsSb6Iynkf0cUJJxsVuPgj7qHN8v/BKQA1
	AD+zrEX12yAFMUJ+4dGVZk/uHq9HrM5HAs7S3J4gEA/Uy2tnvaUSZIfBjJQowJM13610HV0lo2WDt
	nFQcX8xV5nHArKMLVqvv2LrGB536dQUSbKtoDF4UVbSFWIQJkVBbgo6fBxrkF7yROE3wudP3kzyjK
	3BXytfArwQDH8z5jLiOivwCOd5Vcwy1bxfRD+Bmkwz7HkkxQnm6uXkvigrfJ5NmcVgT7Dy+75ivBx
	0CJtfgMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJbOK-000Hdp-1F;
	Wed, 12 Jul 2023 15:04:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJbOH-000HdJ-1D
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 15:04:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9D53161834;
	Wed, 12 Jul 2023 15:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D7FC433C8;
	Wed, 12 Jul 2023 15:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689174268;
	bh=cPZS4lpGF39/+6fc8hJLnEFDpn06rPvyjR7zxfkgJgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bqNdVlqiX4VkCYKNJtfvJFQcFUSkHFnUNB4s3ev/IXmgBbnS6GjL/+EXk7R6J/NXG
	 eYr2EWMhxxW6r4/i1DotW6DhwuKQu0MohXiZYbxm9r+zsJFIqun66k0NMLXpUyqbtl
	 8T3Bq1Rgq8rzChC337pLPnahCNoxZiuAkA75Raz/BPBrWpmBueLOBtTJoj6EJW13/s
	 czdQKBQo/JrJi1Sy57f+cuBdxQ4L3HRdMUa0fwoKxPkLGXr2l+xWIjhf5k8amweNa7
	 JhYmg289Qjl5VhIYyjMCbjs+D+CIXvhWsBHhbGuc7rA1TRJvCvVhQCqxelnLIwYMUg
	 d9lfVv0mgrPiA==
Date: Wed, 12 Jul 2023 16:04:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: RISC-V: Re-word the I extension binding
Message-ID: <20230712-dumpling-submerge-af53ed9ce484@spud>
References: <20230711225212.11542-1-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230711225212.11542-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_080429_494249_1F6AEC3B 
X-CRM114-Status: GOOD (  24.63  )
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
Content-Type: multipart/mixed; boundary="===============1660553863491549788=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1660553863491549788==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pIztD/2xnckBt6EN"
Content-Disposition: inline


--pIztD/2xnckBt6EN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 03:52:12PM -0700, Palmer Dabbelt wrote:
> I'd argue this changes the definition of the I binding, as there was
> more than just the counters that got split out (CSRs and fence.i at
> least).  We haven't released these bindings yet, so IIUC it's OK to
> change the definition still.
>=20
> I think this matches the original intent, or at least what the
> implementation does.

Depends on what you consider "original". My intent with these new
bindings was to deliberately exclude from `i` things that are already in
extensions at the time of writing, so that when an platform shows up
that decided not to implement them, it does not need a special case
added.
I'm fine with doing it this way though, if that is what you want, but
what do you mean by "the implementation does"? To align the
implementation with the meaning in the current binding, would we need
to refuse harts in riscv_early_of_processor_hartid() in Linux?

>=20
> Fixes: aeb71e42caae ("dt-bindings: riscv: deprecate riscv,isa")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml        | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index cc1f546fdbdc..31ec244bd32f 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -67,13 +67,11 @@ properties:
>        anyOf:
>          # single letter extensions, in canonical order
>          - const: i
> -          description: |
> -            The base integer instruction set, as ratified in the 20191213
> -            version of the unprivileged ISA specification.
> -
> -            This does not include Chapter 10, "Counters", which was move=
d into
> -            the Zicntr and Zihpm extensions after the ratification of the
> -            20191213 version of the unprivileged specification.
> +          description:
> +            The base integer instruction set, as specified by the 2.2
> +            version of the unprivileged ISA specification, formally know=
n as
> +            the user-level ISA.  This definition of I includes various
> +            extensions that were later split out.
> =20
>          - const: m
>            description:
> --=20
> 2.40.1
>=20

--pIztD/2xnckBt6EN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK7A+AAKCRB4tDGHoIJi
0pJUAP42p8ReR3ES/r6GTNH0AONZ7RhnwfW5UMgq3e5t3Dh4OgD/XDuPrVldeEPm
f74q9aqqIrMMeMIuX+jSlmf8LOsr5g8=
=2tHU
-----END PGP SIGNATURE-----

--pIztD/2xnckBt6EN--


--===============1660553863491549788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1660553863491549788==--

