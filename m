Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858ACC25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 16:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LUAtiQ1NnctC9dSKWFKx0wzAwqj/aP2aMREK2456Hw=; b=WmfufqtRGv6weHshDh1iaJuDP8
	PuTiOSCLtUF0ITIyLHJjue8P0ViVsHgfSU0RWyBy8bpcrOC16JVmY8ghMT9aBLpNnl4bRG2DUXnSc
	foc2TlVHee9gzzmN/49Sx7ozWI5KR8xlCY1VkNv1gfOJgLJYkHhJjUk8cp6YwFVO5lb26XuX0XDAW
	VO1cly2676Kclj8FUX3/7FpCG3o+mTdLD4acT0fxBs2xLvQBKo8Ctq7k2zoN886ADGoCROa1uvrGJ
	RexsNeSV6JC0v78EWOo5hjW8eZnUwtsZNac0141Z5DDqm+YeDczob4CyilMmJlnTOLtqVPYddgeIe
	RVIRbaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBdNg-0000000FtSM-2SpE;
	Mon, 27 May 2024 16:39:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBdNd-0000000FtRs-36CJ
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 16:39:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BFEF61982;
	Mon, 27 May 2024 16:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70707C2BBFC;
	Mon, 27 May 2024 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716827964;
	bh=1TXFRO5AfBwTHoHEFlxxuQUmCZrVsLs15FvJqcvK7/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I9oIi2qgfnpDWTQaCgrs88Bd6CtrrO01tIv8/4lH6J4UeUqSCaFmEzgdCjl9puZ/q
	 TiB258i1HP3lsATzEvhmw4dWAF5LSpvaxMaxxeKSl86uUfSbI8yxOCRku/NyXqHxAv
	 1/V5oquZI9ADqUcuqGDQbTssLwcLqaCO7fl4AdNRqsNESw9sWcR3hvt+KKUyORjLG7
	 3WiAHEOuQuT1Njzras6m4PhN2Rsp9ahpVZ3KSnao5c5144NRUW/ECc3xahMU2bMJpG
	 07sUlra9Z6dQoHJdwvB3oprzMnQii7Ph55/CfKNMtGYeqAQRcoKcq/0Kx2UiM92EX7
	 UdTREyrpKkBSg==
Date: Mon, 27 May 2024 17:39:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: interrupt-controller: Add SOPHGO SG2002
 plic
Message-ID: <20240527-keg-strategic-a3b89051f8c2@spud>
References: <20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com>
 <20240527-sg2002-v1-1-1b6cb38ce8f4@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20240527-sg2002-v1-1-1b6cb38ce8f4@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_093926_132186_C030B012 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6137283277994883701=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6137283277994883701==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l9Jwkp5MR9utH8tD"
Content-Disposition: inline


--l9Jwkp5MR9utH8tD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 12:28:17PM +0200, Thomas Bonnefille wrote:
> Add compatible string for SOPHGO SG2002 Platform-Level Interruter
> Controller.
>=20
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--l9Jwkp5MR9utH8tD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlS3NwAKCRB4tDGHoIJi
0iGJAQDY5vSSo75AlJcaoesp4zpch97rFPlydyalwIu+HOUlSgEAo3vZQcVsaKk9
CFKqzrtt6LNiZ35A9X7soSx7/XLIEwg=
=u+Dj
-----END PGP SIGNATURE-----

--l9Jwkp5MR9utH8tD--


--===============6137283277994883701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6137283277994883701==--

