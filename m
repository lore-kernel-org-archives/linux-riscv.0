Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EF7C61CE7
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ci6wbF9Z+BcNwW3+VQwXpOgHKhV9dGz7GG0s2wd4J/4=; b=JeViWCtE0ygRXGVwCwCas+0u3a
	0zvvvaBICUHd13jy+DZX0LBY0j2Hv9GVPiCnhtft/N1QKh5oHfzGeU0nB0Nnxr5SivTn1QHYcN0B9
	tgP06HEg4Ifi0j36BbtYhhhBPLjI6Srt1b738taMjFIWYD6H+Ymbb/MyIz6NYmNV0Lavh6Cq+8+iP
	Xh8j+SyVo0XCTdV4aVq8Fnwz4JCZq7XJXxgaHzL1Msctdoriw3KXy2sFfZErZYtszMR+ckUQuYe7m
	LWOcL2OW8gZ9WavgnAdiXDWCm9AWmSZlkU0io+otuL32IcAWBkNeaZSTW9pt5i8RrffEGGVnFcfmf
	fkDlEaYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNZUM-00000000bB2-2ES2;
	Fri, 06 Jun 2025 16:00:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNZUL-00000000bAl-1FHw
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 16:00:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61E4C61135;
	Fri,  6 Jun 2025 16:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E375C4CEEB;
	Fri,  6 Jun 2025 16:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749225612;
	bh=Y1KQtPS81IExz4pchO3Uiy9RWFy+znuf0PIIHykxx+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PGySD9tq4ZQpSu/Wtj4XFkBDmmsKZGnIVxxl1oj7eYsTqQuRu23KRSHoeD85Vspgy
	 qxr+RhnwQFbveIX9CanFdBmFn8T/0wkywf65ZQIyrbHCzJnLpH6UpTcJbS3go7IGSe
	 7s6DuAYrZ200X3NBJxDFBQ5CdA5SSzLA5vhHCPYcuP5/H4aPZavwJcedFv7BS53s6z
	 o5izOMHe7gmyuWPWE1uGR4QhhMprbnqP1t3OncMPMCS0+8Hz/10g/w9QUUSi1mRSYX
	 1U8CS6d3aoF3I1AUnB8P546Ro7jroNxfuLYz6CVoVtk+Jhya/c1o93fFEqxvwUvGon
	 bqkT0VtUHxX0Q==
Date: Fri, 6 Jun 2025 17:00:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	tim609@andestech.com
Subject: Re: [PATCH v5 0/8] add Voyager board support
Message-ID: <20250606-booth-icky-b416c1827a43@spud>
References: <20250602060747.689824-1-ben717@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20250602060747.689824-1-ben717@andestech.com>
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
Content-Type: multipart/mixed; boundary="===============3800712939602499062=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3800712939602499062==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XnSn4wlHT+08Cik0"
Content-Disposition: inline


--XnSn4wlHT+08Cik0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 02, 2025 at 02:07:39PM +0800, Ben Zong-You Xie wrote:
> The Voyager is a 9.6=E2=80=9D x 9.6=E2=80=9D Micro ATX form factor develo=
pment board
> including Andes QiLai SoC. This patch series adds minimal device tree
> files for the QiLai SoC and the Voyager board [1].
>=20
> Now only support basic uart drivers to boot up into a basic console. Other
> features will be added later.
>=20
> [1] https://www.andestech.com/en/products-solutions/andeshape-platforms/q=
ilai-chip/

Ball is in your court now, after rc1 make a tree and get it in
linux-next, and then send a pr to soc@kernel.org with this new content.
Perhaps the defconfig should go separately, I can take that one if you
want.

Cheers,
Conor.

> ---
> Changelog from v4 to v5:
>   - Rebase the series on torvalds/master
>   - Clarify the patch dependencies (2 <- 4 <- 5 <- 6) in the patch descri=
ption
>=20
> v4: https://lore.kernel.org/all/20250514095350.3765716-1-ben717@andestech=
=2Ecom/
>=20
> Changelog from v3 to v4:
>   - Restore the modification to cache-sets and cache-size in patch 6
>   - Do not constrain renesas,r9a07g043f-ax45mp-cache since it's independe=
nt to
>     this series.
>   - Delete the redundant example added by patch 6
>=20
> v3: https://lore.kernel.org/all/20250513094933.1631493-1-ben717@andestech=
=2Ecom/
>=20
> Changelog from v2 to v3:
>   - Rebase the series on Conor/riscv-soc-for-next
>   - Reform patch 6 as suggested by Conor
>   - Modify l2_cache's compatible in qilai.dtsi due to patch 6
>   - Add Conor's Acked-by tag to patch 4
>   - Add Conor's Acked-by tag to patch 5
>   - Add Conor's Acked-by tag to patch 9
>=20
> v2: https://lore.kernel.org/all/20250503151829.605006-5-ben717@andestech.=
com/
>=20
> Changelog from v1 to v2:
>   - Add detailed descriptions to PLIC_SW and PLMT0
>   - Move the aliases node and memory node from qilai.dtsi to qilai-voyage=
r.dts
>   - Drop "status =3D okay" in each CPU node since the status property is =
by
>     default "okay"
>   - Reorder the nodes in qilai.dtsi by unit address in ascending order
>   - Add myself as the maintainer of Andes's SoC tree
>   - Add Rob's Reviewed-by tag to patch 2
>   - Add Rob's Acked-by tag to patch 3
>   - Add Rob's Acked-by tag to patch 6.
>=20
> v1: https://lore.kernel.org/all/20250407104937.315783-1-ben717@andestech.=
com/
>=20
> ---
> Ben Zong-You Xie (8):
>   riscv: add Andes SoC family Kconfig support
>   dt-bindings: riscv: add Andes QiLai SoC and the Voyager board bindings
>   dt-bindings: interrupt-controller: add Andes QiLai PLIC
>   dt-bindings: interrupt-controller: add Andes machine-level software
>     interrupt controller
>   dt-bindings: timer: add Andes machine timer
>   riscv: dts: andes: add QiLai SoC device tree
>   riscv: dts: andes: add Voyager board device tree
>   riscv: defconfig: enable Andes SoC
>=20
>  .../andestech,plicsw.yaml                     |  54 +++++
>  .../sifive,plic-1.0.0.yaml                    |   1 +
>  .../devicetree/bindings/riscv/andes.yaml      |  25 +++
>  .../bindings/timer/andestech,plmt0.yaml       |  53 +++++
>  MAINTAINERS                                   |   9 +
>  arch/riscv/Kconfig.errata                     |   2 +-
>  arch/riscv/Kconfig.socs                       |   9 +
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/andes/Makefile            |   2 +
>  arch/riscv/boot/dts/andes/qilai-voyager.dts   |  28 +++
>  arch/riscv/boot/dts/andes/qilai.dtsi          | 186 ++++++++++++++++++
>  arch/riscv/configs/defconfig                  |   1 +
>  12 files changed, 370 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/andestech,plicsw.yaml
>  create mode 100644 Documentation/devicetree/bindings/riscv/andes.yaml
>  create mode 100644 Documentation/devicetree/bindings/timer/andestech,plm=
t0.yaml
>  create mode 100644 arch/riscv/boot/dts/andes/Makefile
>  create mode 100644 arch/riscv/boot/dts/andes/qilai-voyager.dts
>  create mode 100644 arch/riscv/boot/dts/andes/qilai.dtsi
>=20
> --
> 2.34.1
>=20

--XnSn4wlHT+08Cik0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEMQhgAKCRB4tDGHoIJi
0iR/AP9kPQhWU7yiu4elPR9CbPEUL9giMIDGnTOMdYaas3PcgwEAsiTkRJcBi9T7
Y/QETMvnZHsQfGe/qM/xmH2VNJ/ZQAE=
=6So4
-----END PGP SIGNATURE-----

--XnSn4wlHT+08Cik0--


--===============3800712939602499062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3800712939602499062==--

