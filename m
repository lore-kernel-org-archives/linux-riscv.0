Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25A9D74958
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 13:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S54y8JxFQm5PHmbU+UcmOJPlS+XDgrP4PMlFYokFFUw=; b=dFVbm023Balwcefl4UhBuEvjZB
	4tuFEMpcVM2xSNK8IlRIp/D4bwCPfo/DPpTMfsKeDb5/fpCInEMrUkj18qVgpi5aMdj0Hd2lPZvVl
	V+xbCwD1cVZL70YNuqXFwN0YtH5eVYAc22duExAEpCxdT5V+McwrttBttpxCj3XbqktxD67ISlxS5
	2Es/9wX7/c5MrNfgf8tLkHVE27qfTAHNzb0Hcpsgzy469IlD+zm22R7V+doZoCeCS7HT61fBGx3Xj
	49fx2Pc6QUlumEo72vo4T/N8TfH/2Y8axxad20xj4TSuL39vJ3qIzudj7Wsy3j6nI4WK6bigairZx
	f7aGKyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UvK-00000003dS1-20M7;
	Thu, 31 Oct 2024 13:09:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UaO-00000003aXS-0UXP
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 12:47:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6F171A442A3;
	Thu, 31 Oct 2024 12:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB11C4CED1;
	Thu, 31 Oct 2024 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730378296;
	bh=6zINfUhcq11skpHNYXg2rHHDLkTZ5uPjWErNSLSYvfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRSn412O09IxxRHRbjZCA85hxExQTsyRkLKhBlg7kn2tMf+s3si5Wtz/R7t+1CEaF
	 AhQtCH+9h6ZjixbmrtmudnlAakAA5RCI37MtRDWHznNgymxCYByKvnFCCZBZK8MJvA
	 np0SsqnTBTMdWV3auWHlSdVy8Y48n2Y4g9IAhdHFn4r351RIVia+phwNrMnLXn9ImV
	 1aatHUw13d5gFgXm85kUnKwwwT5uP2bxsuWLDbHfPmn1+Jlp3IX2HOTiwcBZO3l8nr
	 sMEa0V5iGxC8UnWGdeH3lc6sXZuAVzxSdx2RoMDgZV/tNGpbohHe8XxlIpn3/WiV8M
	 9B1BcKQp2kvaw==
Date: Thu, 31 Oct 2024 12:38:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Inochi Amaoto <inochiama@outlook.com>, Guo Ren <guoren@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Anup Patel <apatel@ventanamicro.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/3] dt-bindings: interrupt-controller: Add Sophgo
 SG2044 ACLINT SSWI
Message-ID: <20241031-armored-marbled-36cfb6d599e3@spud>
References: <20241031060859.722258-1-inochiama@gmail.com>
 <20241031060859.722258-2-inochiama@gmail.com>
 <esuteqvz37blehx6wa5cj5ixlglcbullhuls3rcvjtuiviqqpb@ojho3arlnwst>
MIME-Version: 1.0
In-Reply-To: <esuteqvz37blehx6wa5cj5ixlglcbullhuls3rcvjtuiviqqpb@ojho3arlnwst>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_054736_252148_3E449556 
X-CRM114-Status: GOOD (  12.91  )
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
Content-Type: multipart/mixed; boundary="===============5819283155217474377=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5819283155217474377==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QH+DklLw2VTXfWnH"
Content-Disposition: inline


--QH+DklLw2VTXfWnH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 02:14:40PM +0800, Inochi Amaoto wrote:
> On Thu, Oct 31, 2024 at 02:08:57PM +0800, Inochi Amaoto wrote:
> > Sophgo SG2044 has a new version of T-HEAD C920, which implement
> > a fully featured T-HEAD ACLINT device. This ACLINT device contains
> > a SSWI device to support fast S-mode IPI.
> >=20
> > Add necessary compatible string for the T-HEAD ACLINT sswi device.
> >=20
> > Link: https://www.xrvm.com/product/xuantie/C920
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
>=20
> Hi, Conor,
>=20
> Could you review it again? I have updated the description of
> the binding and mark the device is T-HEAD specific.

Only thing I would say is that
title: Sophgo sg2044 ACLINT Supervisor-level Software Interrupt Device
should probably be
title: T-Head c900 ACLINT Supervisor-level Software Interrupt Device
or similar, since this isn't Sophgo's IP.

w/ that,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
(dunno if Thomas is willing to change that on application)

--QH+DklLw2VTXfWnH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyN6MgAKCRB4tDGHoIJi
0iNMAQC8918qceXht4v+i90x6glN4L4mOHgWG7iUzkRIq6wpuwD+PUBMu/Kdjoxt
jsgV7kPADBYAj4UKKBuMWJ1JrevOjAY=
=40NK
-----END PGP SIGNATURE-----

--QH+DklLw2VTXfWnH--


--===============5819283155217474377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5819283155217474377==--

