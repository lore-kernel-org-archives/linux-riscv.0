Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3C1C27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 16:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BxFEQ50ghkkLjbQUAcaB/EUr+6wCK/MK+C5lDNJJqc=; b=qTEAs8BPNO3+kaR/WwFqs83pZ3
	E8lsQlhSuMSCFyN05k9ajotiTMwQ7jYbhLyntH3jOXI/IRajAMUerY1gF+trfFdJ/BBaSGNuTRkqh
	0FzxD1wKSs6anU2VHh5Ax+59OxSmYAZo8bsmSVXhsfklv3mzf6PfVunaWRIQ8znt8mVZ/j0foHPgP
	ahg2KpG1c5BUT20LUsBZdswJp7Pi24BzQ0FabUpBwrIXYsQKmYiDxBm7vpxhbyuy9tUfLqI2rNLB0
	omskiKrtw9j2zxxVUVJE1twg5n0WbsIJajGlLO+trcrBnrT5ulnnYGZDJ2kFT67g9zVuQ6yACISo5
	XsFIgPUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhto-00000005nZ8-3EQj;
	Mon, 10 Jun 2024 16:29:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhtk-00000005nWe-0sCz
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 16:29:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2CC07CE16CA;
	Mon, 10 Jun 2024 16:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D21C2BBFC;
	Mon, 10 Jun 2024 16:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718036969;
	bh=Brmahvm4Yc2awdlg8pCbCM4vutFLaNRGWciE5wW/mBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J4la2Tf2AWfy3SsQXpKsi5iMpBXuatfTSLmKnfqdaFgTMwr9jky2WaHuum2W9v0A7
	 tF4oUXkvy9W5N+bRD+uPzWwm2XooXhl2jWm/7ocz+rm/Rdx8NTDOakGrmlmfLoUtxs
	 3xENG8tF5/Xm46JHQhx8Z2pa95DwnhneFRKZyPYqBWfuOeozmfICy9pN91FYuS53Fj
	 2R9ynJ8u6SSrDC9T1LNH7nJ5/yhV8MVGfEsTYmN9LfAvuA0brCD1U3UzEkWScUoiAV
	 2pSVrP551vX3vnyck6QmVrhnFbbD7z36cdvIXJaE/6o4m+Ltom916vbHTcEfZbFich
	 Qfb9w1ahqwRNA==
Date: Mon, 10 Jun 2024 17:29:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/13] dt-bindings: thead: add a vlen register length
 property
Message-ID: <20240610-unaltered-crazily-5b63e224d633@spud>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
 <20240609-xtheadvector-v1-2-3fe591d7f109@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240609-xtheadvector-v1-2-3fe591d7f109@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_092932_626853_AEA8E5A3 
X-CRM114-Status: GOOD (  20.54  )
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
Content-Type: multipart/mixed; boundary="===============6223630934876788106=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6223630934876788106==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7a3nHEEpIFMkcfnt"
Content-Disposition: inline


--7a3nHEEpIFMkcfnt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 09, 2024 at 09:45:07PM -0700, Charlie Jenkins wrote:
> Add a property analogous to the vlenb CSR so that software can detect
> the vector length of each CPU prior to it being brought online.
> Currently software has to assume that the vector length read from the
> boot CPU applies to all possible CPUs. On T-Head CPUs implementing
> pre-ratification vector, reading the th.vlenb CSR may produce an illegal
> instruction trap, so this property is required on such systems.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/thead.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documen=
tation/devicetree/bindings/riscv/thead.yaml
> index 301912dcd290..5e578df36ac5 100644
> --- a/Documentation/devicetree/bindings/riscv/thead.yaml
> +++ b/Documentation/devicetree/bindings/riscv/thead.yaml
> @@ -28,6 +28,13 @@ properties:
>            - const: sipeed,lichee-module-4a
>            - const: thead,th1520
> =20
> +thead,vlenb:

This needs to move back into cpus.yaml, this file documents root node
compatibles (boards and socs etc) and is not for CPUs. If you want to
restrict this to T-Head CPUs only, it must be done in cpus.yaml with
a conditional `if: not: ... then: properties: thead,vlenb: false`.

Please test your bindings.

Thanks,
Conor.

> +  $ref: /schemas/types.yaml#/definitions/uint32
> +  description:
> +    VLEN/8, the vector register length in bytes. This property is requir=
ed in
> +    systems where the vector register length is not identical on all har=
ts, or
> +    the vlenb CSR is not available.
> +
>  additionalProperties: true
> =20
>  ...
>=20
> --=20
> 2.44.0
>=20

--7a3nHEEpIFMkcfnt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmcp4wAKCRB4tDGHoIJi
0gVEAQDisUaq6cRgwS43d8aFe/cyWmfTzOM3tCUfWvDJ7AnVuwD9EFVnAEjsPyON
r50kgk8Vr8uPuUh+qeyS+8kydQEtQwI=
=QXX5
-----END PGP SIGNATURE-----

--7a3nHEEpIFMkcfnt--


--===============6223630934876788106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6223630934876788106==--

