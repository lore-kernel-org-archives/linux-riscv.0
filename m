Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AB6CA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 16:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ultb8txiaDDv4s76SjDfxM5CBJ0W1nrgmhrkeGgnBZs=; b=q0l9xeMN2LQD0GENuq35f1/iw7
	slKqWHaQ1mMLRCyszJRBcdxT1OiElZeaNctRCNOgoZEYsY++CSFk31qT04D3wV1WGPZarc2oBj8BO
	ceGn1BCTzRrHIM2C3Umh/SgZ1jxVaKdwC4lCWHS/go1xuoyUNnL0yKk9KBVw8k26xgk5vfMLl1qJ8
	qurWtk4jb9MC3bX8MWQlSVOlgvO/aXHFUkrZ58tOzoUZ4YiihetA+7cO+ofDYzHbN8F0VsYetHrro
	POw66h3075WXkMOx+hQjP1jgqCya4D6Wn9SS4h6fgMgpe9ucSjaTzUlggdDoNhbITlv00hfEY03Ny
	F5JGklZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgBK-0000000C2X9-0IOD;
	Fri, 02 Oct 2026 16:32:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgBJ-0000000C2X3-22TJ
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 16:32:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F29954399F;
	Fri,  2 Oct 2026 16:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918281F000FF;
	Fri,  2 Oct 2026 16:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790958740;
	bh=uxfVBfwSOuB75D2e85exi7+uFfYhlsrQty+NcIv6boQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aTyp1hXZirIF8DPS3ieHatIXXXqhaXTWz+btP36Tt5fv80utdU7+b5/yPsjX+ESvp
	 XJHYdYEGH6AJL9sOw1AxcJF4cd3zfgOOmStVrxRxmqN397I5zGyjeh3utvOg+7fh8H
	 FeKb8PEgR0BKxZN5oKZcTVRTnbvko7eOgSBStanRz+AZd/d+Zp/nJAnEmlNTmyYEjY
	 I6xuLRGtNDeGL3++2P30Dtk3Gim0ilbDsXEpw2V5EQumGqWETyY0Rk9+Mn/Q2QFWya
	 CG1FzcINM8wu4r/ndtNUdPI9t7D8bQsO73FwdkicgVcr+ocG1NRnb2pXCxbJ6LehMe
	 dxj+59/R+4ZLA==
Date: Fri, 2 Oct 2026 17:32:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: anlogic,dr1v90-cru: make
 external clocks optional
Message-ID: <20261002-diminish-hemlock-53c312598e59@spud>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
 <20261003-dr1v90-cru-dt-fix-v2-1-6e7d96612ac0@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20261003-dr1v90-cru-dt-fix-v2-1-6e7d96612ac0@pigmoral.tech>
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
Content-Type: multipart/mixed; boundary="===============5135325498239745375=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5135325498239745375==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WhWOesNcYkUJujB7"
Content-Disposition: inline

--WhWOesNcYkUJujB7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--WhWOesNcYkUJujB7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar/cjAAKCRB4tDGHoIJi
0jK+AQCyOByJ7hzNNmJWJcqHDvrRKrtzDP9vD9HLVd4wkDyZwgEAozMYNFcYlsV/
w3pfnIkuUnenISTZtRovKm2GxW1kiQA=
=700p
-----END PGP SIGNATURE-----

--WhWOesNcYkUJujB7--


--===============5135325498239745375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5135325498239745375==--

