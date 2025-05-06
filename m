Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9DAC3ABBC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 20:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYolpZ+P9fD3DA78y6sVQe3DMJUeoqKB5GJ2+vhfgo8=; b=FkT6RQGKjEAyD+a/idt8kQbJXV
	veRY33WVcQb7PAkt3kOhh29fDfyzt2rqe88eEMbRfZMjNC3wrd7t8VfPscHMXD3fz7SK8jUWCO2II
	o+WQazHxBm2XS4JeWtzZ5SIayU1KyCB4L/Hy9a5Rj0gC/hEIEbZvjuMfqArA3GIbP0eNpRlTlP1m+
	Da2vr0mU3rX39G9s0QJGIihXQsvm7RrUx361qmcYhs+qY7txOxQ8jRbA/ZleKq5YCe370/sbieJJZ
	f5bgdnvuv50c1Dz2bL6Kay0uL/oJzoHPAubU4Cp4N3Glcy3ifubFY53ARU8jRzwo4SJvzTDuNsdJa
	Arx50xgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCObF-0000000DKWO-1No6;
	Tue, 06 May 2025 20:09:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCL2C-0000000CeS9-2lM1
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 16:20:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BD8C8A4D659;
	Tue,  6 May 2025 16:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B872C4CEE4;
	Tue,  6 May 2025 16:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548443;
	bh=ffcpxlWjSEshf5NcicDlb/m67mTvD/u3Mouc4HHrfXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JqOu6pB8m+qYaRr1P2LXzSuy0Tn8Oo30S+afmUZDcTkselexJTLXbirWpS+nRdrVl
	 es407zMXNM7gbLi3ookAni5E2KNB4W0AkTPIghN0K3PXDaab4dzjfeZNVatuKQvOpu
	 Cwbhm0bEr6q9f7dfxgde8iscwE546fd0P3LJtA0FZAPcCeX/oidwqnWzFP0RJqZkM4
	 KSQDzgRepikagtYEmT2R21rz9PCMXkEvtceCsX2zgmw00rQzfljyG3OWucHTVlQAyk
	 WDi720Vc+1bdTkvHH5MQyLO3A9nq/6HM3nqKam4dV52aYhV8Vy3E2YENIoXZ1P4dBR
	 9GnagFPZwYEBQ==
Date: Tue, 6 May 2025 17:20:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: sophgo: Use precise
 compatible for CV1800 series SoC
Message-ID: <20250506-rhyme-gangway-023d58f1488a@spud>
References: <20250504104553.1447819-1-inochiama@gmail.com>
 <20250504104553.1447819-2-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250504104553.1447819-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_092044_766476_82A5310F 
X-CRM114-Status: GOOD (  10.35  )
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
Content-Type: multipart/mixed; boundary="===============4658102761986612561=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4658102761986612561==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J7ij7iB+WCTcP2Yg"
Content-Disposition: inline


--J7ij7iB+WCTcP2Yg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 04, 2025 at 06:45:50PM +0800, Inochi Amaoto wrote:
> As previous binding uses a wildcard compatible for existed clock device
> of CV1800 series SoC, it is not suitable for existed requirement. The
> only exception is sophgo,sg2000-clk, it does match a real device, so
> keep it as is.
>=20
> Add new precise compatible for existed clock devices of CV1800 series
> SoCs and make old wildcard compatible deprecated.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--J7ij7iB+WCTcP2Yg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo21QAKCRB4tDGHoIJi
0otGAQCWZraHz/cRq5N3eF/1QZha/fa65MJtkglr3lJkKPPA2gEAsZX+9TUKCii9
XXKXZikRNTV4EP7DGbVw8OT8lQ4HyQg=
=ueEX
-----END PGP SIGNATURE-----

--J7ij7iB+WCTcP2Yg--


--===============4658102761986612561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4658102761986612561==--

