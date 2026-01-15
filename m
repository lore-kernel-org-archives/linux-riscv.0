Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF4ED4661B
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 19:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpsdgHAEjr57mvBIYTdGnZCdE7hAVBBnY2rxK7LkKUo=; b=k0mUEOvlH6VCp/gVbu4kU5bZU/
	4qcUQ/wY3KfO7G6ZcFBdfTLyK+l8V4kn0tIbTv4UixaH085rdsDdRJNohYuPpzkZVrIU326Apb60P
	A7isnjU69eAyaiHPPGYvHsOMejmX9NwbtdWUoFp6Y17Odlf2DcJYHRMs39KdppzJdVh9CMm8mPbPr
	28cF23PKJ6ISPJ1/CDSrEp8fBL0WnOIfU4G43Muc6IN3ACearyzbqnBJV4sHFJ8egysaiLfPOEg1E
	53sa+RbFfV+UEl0Bbni9+dMiqjimARUWMK0uRmLZNDNrbUJqzBzzVyJDWHqtX2Hnm+EKbcgYSUT60
	W//BfT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSwG-0000000D3wr-37AQ;
	Thu, 15 Jan 2026 19:23:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSwF-0000000D3wj-1ODh
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 19:23:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77E7B60130;
	Thu, 15 Jan 2026 19:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CC8C116D0;
	Thu, 15 Jan 2026 19:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768505002;
	bh=BE+THqVX1sbLmEF4P2vfennNAHrg37bKeXrmdyHM4dQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTmlSRdyp9NEEMz8t7E3Fs3qUkkLSUtwyI/PHOTagj4EufDmnSJ5yBcIAKb7SLC8j
	 QdpZagpHHUUpxGiwwPiRMHtHlfoIRKhvktf4Okfn67oin0ZOEZHURDpuDRR9wdR8ag
	 8a+66dq+HVAqpjmZPL96LpugKKROczkAkAHrPABvHICP1Oa1EB2VhqA6W2cE42tBAX
	 fpopycaFXj2pxvpROzFxn/LFYFP6Ynqvah2wbdo0nEkM6PYWguCjgsiBsso0pj/jqt
	 eYFooCgCd4jX31WSIi7iUEYpdiViKyucmVaF+YwH/T7XmCYCwpS+y+FubAtiaPcEOi
	 eBVOP1DbxqW3Q==
Date: Thu, 15 Jan 2026 19:23:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, cyy@cyyself.name,
	dlemoal@kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn
Subject: Re: [PATCH v3 0/2] Initial support for 100ask CanMV-K230 DshanPi
Message-ID: <20260115-proud-radish-c835a76d0446@spud>
References: <20260115060801.16819-1-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260115060801.16819-1-jiayu.riscv@isrc.iscas.ac.cn>
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
Content-Type: multipart/mixed; boundary="===============0841001209882405017=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0841001209882405017==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PlhTWjX+jHpIknN/"
Content-Disposition: inline


--PlhTWjX+jHpIknN/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 02:07:59PM +0800, Jiayu Du wrote:
> This series adds initial support for the 100ask CanMV-K230 DshanPi
> board based on Canaan K230 RISC-V SoC. There is a module on this
> development board.
>=20
> The board and module are documented, the basic board/module devicetrees
> are added.
>=20
> This series is based on the K230 clock series[1] and the patch 3 of the
> k230 pinctrl series[2].
>=20
> Link:  https://lore.kernel.org/all/20251127-b4-k230-clk-v9-0-3aa09e17faf5=
@zohomail.com/ [1]
> Link:  https://lore.kernel.org/all/20240926-k230-pinctrl-v2-3-a9a36fba4b3=
4@163.com/ [2]

Right, I've grabbed patch 3 from [2] and put it on my k230-basic branch.
Do you intend sending a new clock driver series soon? Last time I looked
(about a month ago) you had some changes proposed about critical clocks.
I'd like to try get this stuff merged but obviously it depends on that
clock set. I'll happy send Stephen a PR to smooth things along if the
drivers are ready, but it looks like you need to send another version?

Cheers,
Conor.
>=20
> Changes in v3:
> - Delet the model and compatible of the root node in the dtsi file.
> - Use clock-50000000 as the node name.
> - Link to v2: https://lore.kernel.org/all/20260104070911.219588-1-jiayu.r=
iscv@isrc.iscas.ac.cn/
>=20
> Changes in v2:
> - Add a minus sign before items.
> - Link to v1: https://lore.kernel.org/all/20251229061318.16756-1-jiayu.ri=
scv@isrc.iscas.ac.cn/
>=20
> Jiayu Du (2):
>   dt-bindings: riscv: canaan: add 100ask K230 boards compatible strings
>   riscv: dts: canaan: Add initial dshanpi board DT files
>=20
>  .../devicetree/bindings/riscv/canaan.yaml     |  5 ++
>  arch/riscv/boot/dts/canaan/Makefile           |  1 +
>  .../boot/dts/canaan/k230-canmv-dshanpi.dts    | 82 +++++++++++++++++++
>  .../dts/canaan/k230-canmv-module-dshanpi.dtsi | 26 ++++++
>  4 files changed, 114 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv-module-dshanpi.=
dtsi
>=20
> --=20
> 2.52.0
>=20

--PlhTWjX+jHpIknN/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWk+pQAKCRB4tDGHoIJi
0jpBAPwMCSDxW/ccYcIjgtR1QljuO3PJuOBynsc5NuV311iIkgD9GZhUb8n3Segi
iYWs8F+FoNzcKA5YE0Nua/rlcyPyBgE=
=3qZO
-----END PGP SIGNATURE-----

--PlhTWjX+jHpIknN/--


--===============0841001209882405017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0841001209882405017==--

