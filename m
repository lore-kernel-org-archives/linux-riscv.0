Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D72ACD37AC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 17:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVIib8HIMKqzwyZwSRB05ItIpxSh/NiWs5Uo3+wwoRA=; b=3ubcjM2IpJ2rTr9c6b/HrK5Sbe
	bzfdb5w0yId5RItRbiYr251zNslaHnm27RCiA+5ij8ehhsY2zI0+LqG1HNbDCyJhHodWRynM4+R4G
	JYO4o0qQBCPfbhhjJ4RlPBnXAH5hO742x1Fv12WzdxqD5CBJYGUSOvi6fx3PSYO4krtRgF+oCl//c
	7kgM76k4E1+66/RXdOehUP3WPuid9njLjA+50SrECZmQLR9D/7IQSxWPs47GrLAgC1/Y3Qtl8hPPt
	Fb5Wd3M8TryOzmHkqHZatUwsEdLGIKTOcFGNsS4JCik2JjacsHXfawgY0Bi5wtArEm5ezXpxvugDm
	/eYHdcfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaCz-00000006FLh-1Dch;
	Thu, 14 May 2026 17:50:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaCy-00000006FLQ-1DGq
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 17:50:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7914360132;
	Thu, 14 May 2026 17:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3DEC2BCB3;
	Thu, 14 May 2026 17:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778781051;
	bh=vgBsgGXe+zv6+W6MvoN9aWXs4JINY+nECk3GKt5x/P8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E8f6kfTItwwyHlhuFGNz3o8xDm0Saj3GLBDvYYT5rnyZASc77iQqDjaOIVdIW6ydP
	 RAI3iIMBI/NX+1nT5b8Mxp13VcDeV6UJsi4WBD4PfOCTQ1HDHdyZ0zDvX7CeIRPgc5
	 ajMm5+IS4ALHyel0HZgSNQ+25HwXMaXo1EsynL8aG5kOu7TghvnjlWkSoAlWqt0K0Y
	 uE4yBunz/rS9fby4aYr2KPgRPaMuuX7GvPRv5Kj2C+zAgrGWMshDTMMWKv/xjFkCEW
	 Vj4GddrkwgOe7bJh96tQvK4IQREQF9Yk5p8J9iaCQN4Xa3cI/xE1wNBUazl7MUpv7A
	 Il2wYDsXKK/Jg==
Date: Thu, 14 May 2026 18:50:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 11/12] soc: starfive: Add socinfo driver for JHB100 SoC
Message-ID: <20260514-filler-footgear-3ae65c9b8c92@spud>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
 <20260512083521.3448-12-changhuang.liang@starfivetech.com>
 <20260512-mushroom-helpless-0815d0885abb@spud>
 <ZQ4PR01MB120205CCC0A3229824701640F2062@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260513-headstand-hertz-bf31fe6c1938@spud>
 <ZQ4PR01MB1202150D76C700778EB29978F2072@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ4PR01MB1202150D76C700778EB29978F2072@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
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
Content-Type: multipart/mixed; boundary="===============8039607428116287369=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8039607428116287369==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="58SM5AM6G6irs/hi"
Content-Disposition: inline


--58SM5AM6G6irs/hi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 01:07:37AM +0000, Changhuang Liang wrote:
>=20
> This is at the same priority level as most drivers. If some drivers use
>  soc_device_match() and are registered earlier than this driver, issues
>  may arise. It might be possible to lower the level by using subsys_initc=
all.
>=20
> What do you think?

If this is the level it has to be to avoid probe issues, that;s okay.

--58SM5AM6G6irs/hi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYLdAAKCRB4tDGHoIJi
0kJDAP9O0q8w4WvGaOhEQWn9xc/1yHmmppNMJ6J57RBwoR5TEQEAw3kmCD4WPpQ9
nJ4Q03CWPpKy44/6gTmDgMs1k8bWWAQ=
=O8cT
-----END PGP SIGNATURE-----

--58SM5AM6G6irs/hi--


--===============8039607428116287369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8039607428116287369==--

