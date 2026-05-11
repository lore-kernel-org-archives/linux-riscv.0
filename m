Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52D0CD37B2
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51OgS3H6I/LjVHhACEY/yWJ2Nt4Qq3cHSvmonAZZ3Q0=; b=ayX66Wnq7muCW3J7Mncx6EUAUK
	TpRoMDqrAf3jIEle5rfLY6q44T1yrrQVAThRXCPT4xs14sYA2bQ1IyDjWXN205f6yjTo05Vks443y
	UZ8zHie5FYZSlZngZCraeHKTrYaWFN7ADZDHfh4tpRbjN00jXojpIHCYcG6zfrTsiN3IztfXstah/
	aq3fS0qyBOFGVLqsFLXNuEEe99rmqzoTXe5IjpASpAkjJE5V+4+Wh4XNNScXmHfNhdTu9HqSDFtQQ
	8nI0G1Lr9HDWbA+c8R+Hv4zlk3rBK4rdfIJCi54dwaSU+q5jAdC4sOq08Zvid5TMeaiSr/auukrv9
	VcB2ulCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT6W-0000000E8op-3PmG;
	Mon, 11 May 2026 16:03:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT6V-0000000E8oL-0Igw
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 16:03:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 872B360120;
	Mon, 11 May 2026 16:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E40DC2BCB0;
	Mon, 11 May 2026 16:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778515414;
	bh=tnssC6hzI7TtVFOUZpDeV/SJwOj+VIPiHlIHrHS+MsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1CJx+ErexpwUsremaPUA5m1lnGcSosFevHHgUgV6uys97zQ/7Vq1EH08p4nNhO5H
	 RosKpfe3GV+sKrldFLpaww1uxpYl5Zt87ATj015vIBQWKqL7gYdPz5eqkzz96S9dAU
	 w2yrmoEpxPn/5rwULZxNMAOnalZbAetuaJGufkdaros7fkJCKzt75MwHatBPQqenJ/
	 ACy6EDfEW/NtYjPhpouOBU/fQjjFVuvR9RAWgHa/8yTBblF32IY8jiTIIk/IP87QX2
	 1baJNxgkMOWxAr58N/2qBqxvsF8MYVl/P36Krldtxnj5ZcuT/EfwDT3IY9MAcFG8W4
	 LOounhu7CatcQ==
Date: Mon, 11 May 2026 17:03:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: soc: spacemit: k3: Add PCIe DBI
 clock IDs
Message-ID: <20260511-freebee-pebbly-585cb309a00c@spud>
References: <20260511-06-pci-clk-fix-v2-0-c9a5e563bab3@kernel.org>
 <20260511-06-pci-clk-fix-v2-3-c9a5e563bab3@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260511-06-pci-clk-fix-v2-3-c9a5e563bab3@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============6787342072296772371=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6787342072296772371==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JBh/GwDPbWz+MZ2f"
Content-Disposition: inline


--JBh/GwDPbWz+MZ2f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 02:59:11AM +0000, Yixun Lan wrote:
> Add clock IDs of PCIe DBI (Data Bus Interface) clock.
>=20
> Signed-off-by: Yixun Lan <dlan@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--JBh/GwDPbWz+MZ2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagH90QAKCRB4tDGHoIJi
0vnbAPwKILdBfNPqMJ1bvTlNTvWQekjhYzoZzigGKTzY3YcAngEApU6smdGXVENQ
bNK9AQxsbubcUW1bZ9aMkD1xe69eawc=
=9jgE
-----END PGP SIGNATURE-----

--JBh/GwDPbWz+MZ2f--


--===============6787342072296772371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6787342072296772371==--

