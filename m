Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C31B606A328
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 22:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d3N4aD9/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yn+HB5Pt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JW83nPpuEvy6aPgq4L0IqoizPcERdXt3fL+Sj6YyuAU=; b=d3N4aD9/axdHpoFBrwHmgZab3r
	j4HRPTtZw0ebx9qkL4XuThru+wDMZ68ST3MyIA0ogTdLsdI4OXDoJMeM2I25aejOMrU2ziVC1YNXT
	VbQQx25q51xh5YoOW2oM96LD22mylk73nYRAcDPbeYvLT8mwUdokG7Go8WzwKqaoqY0NqHu2AnjxQ
	qSbbcaiwvmE84td7EFvfz6Ku96nZBbtzMwtJwjmbVzBSBU9uezhNGm5ntmiju5gd6epqdChyx20F4
	K770GB2kbFJzjdg8zbHCskDpFR5EBRE3y41rT0QJQhxaXfuCgWrtcYTl9g1pCRb8C1PsqhiPizx5v
	6cOEO4LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMXs-00000003nFH-0Mfv;
	Tue, 03 Nov 2026 21:59:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMXr-00000003nFB-0OfY
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 21:59:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BAE78418A1;
	Tue,  3 Nov 2026 21:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D163A1F0093A;
	Tue,  3 Nov 2026 21:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793743194;
	bh=MNEOt9VZRcR5cxDPRhprRTacbjlbv+swu9XQ3Jea9s4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yn+HB5PtgNhb4YyAKYfINjCQ1WL2um0+1Yu9AOm5B4oZ+Majg1nA49I5jVbpUFx9C
	 WAZ0Ukeen/lnVRKVEtIQfzpIcIuhOjujV0uSVjPZpGhTAowklji4dQC/IeR59Dqg2p
	 lULYi0oIafMscFoE8ATZzaausQXRsVVUOcTme0w6TwfSzg3YgalfnXm268NTIkTxNC
	 ISER45MkdEVdQ8DqL+anIUcnmWjpdLWFA/oEyEh+y5E4El/XuAoeUvUPlzpQlrCn1D
	 kW85AgYkkL22XjcGDlCSPOMl2Eife0OOnhbsw6dFg1SVkB5+Q45mxY4d0Pyn0kLCXb
	 Gmn02qMjoZeZA==
Date: Tue, 3 Nov 2026 21:59:48 +0000
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 0/8] Add support for MIPS P8700
Message-ID: <20261103-agent-lagging-d7fe1c9334f1@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2668583139353670110=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2668583139353670110==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="viG2zBJ53BPGuLlN"
Content-Disposition: inline

--viG2zBJ53BPGuLlN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 04:11:24PM +0100, Aleksa Paunovic via B4 Relay wrot=
e:
> The MIPS P8700 is a multi-core RISC-V microprocessor system, supporting
> both single-cluster and multi-cluster configurations. [1]
> This series adds full description of the platform,
> including the Boston FPGA board configured with a P8700 bitfile.
>=20
> The P8700 cores support the RV64GCZba_Zbb (G =3D IMAFD) Standard ISA,
> with a caveat: the A extension is only partially supported, and all ZAAMO
> extension instructions are emulated on the SBI level. The device tree
> intentionally does not reflect this fact. Vladimir Kondratiev's series
> improves performance by directly substituting AMO instructions with LR/SC=
=2E [4]
> The two patchsets do not depend on one another.
>=20
> The board itself is the same board as 'img,boston', configured with a dif=
ferent
> bitfile [3]. The Boston board has been supported since commit 6e62a888029b
> ("MIPS: generic: Support MIPS Boston development boards") (thanks to Maci=
ej for finding the ref).
>=20
> GlobalFoundries has acquired MIPS [2] and the vendor prefix
> for all newly added MIPS RISC-V hardware reflects that fact.
>=20
> I tested this series both on QEMU and a Boston board
> configured with a single P8700 CPU,
> after applying the necessary U-Boot and OpenSBI changes
> to match the 'compatible' strings and the changed MTIMER register order.
> We are planning to upstream these as well.
>=20
> Links:
> [1] https://mips.com/wp-content/uploads/2025/11/P8700-F_Programmers_Refer=
ence_Manual-TM.pdf
> [2] https://gf.com/news-and-events/news/globalfoundries-completes-acquisi=
tion-of-mips/
> [3] https://training.mips.com/cps_mips/Examples/MD00901_Boot-MIPS_Example=
_Boot_Code_for_MIPS_Cores.pdf
> [4] https://lore.kernel.org/all/20261026-lrsc-only-v3-0-ec29c8190fb1@mobi=
leye.com/
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
> Changes in v2:
> - Patch 1: Replace "MIPS Technology" with "MIPS Technologies".
> - Patch 3: Name the FPGA used and add the versioned bitfile compatible.
> - Patch 5: Drop hart indexes from MSWI.
> - Patch 6: Swap mtimecmp and mtime, require reg-names both for mtime and =
mtimecmp on P8700.
> - Original patch 7: Dropped.
> - Patch 7 (previously 8): Remove additional harts that are not
>   present in the bitfile I have. Reflect changes made in patches 3, 5 and=
 6.
>   Remove riscv,cbom-block-size. Drop undocumented compatibles. Other mino=
r changes.
> - Link to v1: https://lore.kernel.org/r/20260914-p8700-dts-v1-0-3267f14eb=
ce1@htecgroup.com
>=20
> ---
> Aleksa Paunovic (8):
>       dt-bindings: vendor-prefixes: Add GlobalFoundries, Inc.
>       dt-bindings: riscv: cpus: add gf,mips-p8700
>       dt-bindings: riscv: Add MIPS Boston board compatible
>       dt-bindings: interrupt-controller: Add MIPS P8700 APLIC
>       dt-bindings: interrupt-controller: Add MIPS P8700 ACLINT MSWI
>       dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
>       riscv: dts: gf: Initial support for the P8700 Boston board
>       riscv: defconfig: Enable GF SoCs
>=20
>  .../bindings/interrupt-controller/riscv,aplic.yaml |   1 +
>  .../thead,c900-aclint-mswi.yaml                    |  11 ++
>  Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
>  Documentation/devicetree/bindings/riscv/gf.yaml    |  33 +++++
>  .../bindings/timer/thead,c900-aclint-mtimer.yaml   |  35 ++++++
>  .../devicetree/bindings/vendor-prefixes.yaml       |   4 +-
>  arch/riscv/Kconfig.socs                            |   6 +
>  arch/riscv/boot/dts/Makefile                       |   1 +
>  arch/riscv/boot/dts/gf/Makefile                    |   2 +
>  arch/riscv/boot/dts/gf/p8700-boston.dts            | 135 +++++++++++++++=
++++++
>  arch/riscv/boot/dts/gf/p8700.dtsi                  |  82 +++++++++++++
>  arch/riscv/configs/defconfig                       |   1 +
>  12 files changed, 311 insertions(+), 1 deletion(-)

You're missing a MAINTAINERS entry for the platform, since someone is
going to have to pick up the patches for the arch/riscv/boot/dts/gf and
that someone is neither Palmer nor Paul.
See Documentation/process/maintainer-soc.rst for more info.

I'd apply patches as a very last resort, but even then you'd need an entry
to make sure that you're CCed on patches for the platform because I
don't care about the platform and would just apply things that look
correct if there was no reviews provided.

Cheers,
Conor.

--viG2zBJ53BPGuLlN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupZVAAKCRB4tDGHoIJi
0j8jAP0elQ6xEE0Ug/vOqIcSp2/BB/x+gF6B8IwhhvAEYASzHAEAiCTUupZjw2cb
WoB3TwfC0koKxoMK1XzyW9zV/MRKtQc=
=2wQ/
-----END PGP SIGNATURE-----

--viG2zBJ53BPGuLlN--


--===============2668583139353670110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2668583139353670110==--

