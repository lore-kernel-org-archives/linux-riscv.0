Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8383EC83F1A
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 16:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PxqLFw9TvGf64ar/naE/6HgySoqBjDX5rg/x/46xQek=; b=IMyPnRgB4r51beo20ozaOx8pTk
	1qTeLFtyN9H6F3PAhUOPtmFqkwNyA6V5Xd8J2WUa9ScOr1KDhBECb6ppN79lja0CXRSswDLMTo2VO
	t8+4fwfSrbAzuYwTLLPpYnzqAsZ9AtXWyXCox4B1KXFgDj3KiO77b6VO3f6MMBFAxX0qR+jS6aSRd
	cxB6Khw//k8Ys+41GaMugB9qMa0kVpitZ8uBIQy0XGyEgLHSLY8Vy7UMyrMt3MRs+56M42NWPcVKv
	LQXt3YW05RRM1nPflyAh/Y0q8FG6/fpPrqL+Fs4AF+2PJ8a4LeUaWrHWXMaAxVJ+5N84UHnD87tx7
	TvijRO3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFQV-00000002xOX-2twJ;
	Tue, 22 Jul 2025 16:01:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEl0-00000002qXh-2dvt
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 15:18:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC9AF61360;
	Tue, 22 Jul 2025 15:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA2BC4CEEB;
	Tue, 22 Jul 2025 15:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753197497;
	bh=fGAsWfNt/z2iWfbEh9n7rz2FAHRGTRMDGKrGQIo3ivc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QANBn87iMG9qnMcejys0/rBOp/MPEBt2RfiqQ4Z3kAl0CdUwvRsnjmpobqFpfXitG
	 0xQ9+/qwCPyAs+3UlRxho4xxG/kua6Xc9t9TIOUOXu9DQ5EKZEIkxPQbCvmX6IVsL/
	 ZjHCsp73PPQZEpbAa/OpjLkHQcZ0rurpFcALk1i1r1JgVH1GXHvsr+oBw2zDe/6z8d
	 2L8LVv8/1vEX6TE3xmt53Jt3rhMNDqbwhHPjqfFJr70a1AYEc7r3r0z3Ru+cHXKkcE
	 H4Y2cd72e4TUodbeB/hSNHKlQeiUx1UiLgGpsGeU4gaPnFyzgNannH2XsESjxEDowC
	 XyLigMYiK+y/Q==
Date: Tue, 22 Jul 2025 16:18:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
	git@xilinx.com, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] dt-bindings: riscv: cpus: Add AMD MicroBlaze V 64bit
 compatible
Message-ID: <20250722-glitzy-worshiper-7574af025084@spud>
References: <adf316c097ae416eb8565f2f1d67a98c413a71d2.1753169138.git.michal.simek@amd.com>
MIME-Version: 1.0
In-Reply-To: <adf316c097ae416eb8565f2f1d67a98c413a71d2.1753169138.git.michal.simek@amd.com>
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
Content-Type: multipart/mixed; boundary="===============2092487643453727081=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2092487643453727081==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r+Au2k4XYYAgwXda"
Content-Disposition: inline


--r+Au2k4XYYAgwXda
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 09:25:40AM +0200, Michal Simek wrote:
> 32bit version has been added by commit 4a6b93f56296 ("dt-bindings: riscv:
> cpus: Add AMD MicroBlaze V compatible") but 64bit version also exists and
> should be covered by binding too.
>=20
> Signed-off-by: Michal Simek <michal.simek@amd.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Although maybe I should pick this up myself? LMK if you want me to,
rather than it going via the xilinx tree.

--r+Au2k4XYYAgwXda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaH+rtAAKCRB4tDGHoIJi
0vacAP4zbN3Fu+D/dt7INleDrr3nJ9mrPD2r+G3p5CicM2ALCAEA08iTkS686xJY
Uu4OrgvMrLyDB2t1mClhYrqsyJcw0wM=
=Lceo
-----END PGP SIGNATURE-----

--r+Au2k4XYYAgwXda--


--===============2092487643453727081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2092487643453727081==--

