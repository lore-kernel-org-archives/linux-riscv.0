Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C69C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 15:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcrjSy4ziBCFf2sUo4BW8eh80/mbGTApXPTI8edkTEc=; b=NZNU7qBCvWtm4Sz51v38z/zl3Q
	JZDqcWfEsiLHBEbzXC7MyWKoR3aEjuYi/nrsgrhfZs+NI7b26KeFuDeOHlyS5fXGtphO3FgyvJP30
	+o72FjDaMTZmyFiYeSCzTw1Y9O+YLN/BG9CmTFbkKplJ5+6l9SAANeGlAM9pqihWUIkRzMwJ/CiSf
	BkJx/u8UaHm4o8shLLB9hYMK+OEj715nOWmnYn2ZNHI21Iz9VatTrmU87tEIZO53FvDcBtOX28jcf
	dYlg4YRvCAY9dpDdN2lxqqHmVPe6pO+F3/9hjhPK3VXLNCC/s8iAlqIhs+RG8ybvd+JgD9WOCs9Iw
	t0ztKhUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzIHA-00000000Zw3-1ieM;
	Tue, 23 Apr 2024 15:41:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzIH7-00000000ZvN-1szh
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 15:41:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9FC22CE1154;
	Tue, 23 Apr 2024 15:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F4CC2BD11;
	Tue, 23 Apr 2024 15:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713886896;
	bh=OnUR5ZTH3ib/xsiRvY5RaBExyt2bYFtPkTTCfjWrMAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XYgWBV7mbHOz6IiEf/2oGVM6dOLAgUp95qKZ0FXThv43HZCaYurXUVuPfVQUToy+x
	 2D2NaLmd9J89DDEG8FBvHbcfvkwrJFTOO7YOR77PFIK7TArlllgIDJZ+VZLssU1V14
	 tAQ7LZo6K9JtlbbvrsQX/5C0WoP5jkp0NCcFzaQ6b/pGo5ajDuth1v59215DDn0X0T
	 UDuPLNjZsO0BwD/E4/Lplv3A314naJzdIZLcijPYFJ8xVsqybuuEfZokHoO0Yzapql
	 g3d7ys4Ys81dCRsYyXeTPLEHU/Hwq/BQFKAMaEyYqxkEM1hh/5qgr3hWgHYVGb2g5b
	 moHrTFuM1+NKQ==
Date: Tue, 23 Apr 2024 16:41:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	leyfoon.tan@starfivetech.com, jeeheng.sia@starfivetech.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dt-bindings: cache: Add docs for StarFive
 Starlink cache controller
Message-ID: <20240423-depravity-premium-b7ff778014f4@spud>
References: <20240423072639.143450-1-joshua.yeong@starfivetech.com>
 <20240423072639.143450-3-joshua.yeong@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240423072639.143450-3-joshua.yeong@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_084141_731604_D6ED3BA4 
X-CRM114-Status: UNSURE (   7.63  )
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
Content-Type: multipart/mixed; boundary="===============7713620004502146845=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7713620004502146845==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dQ3vim3zqT9txeSW"
Content-Disposition: inline


--dQ3vim3zqT9txeSW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 03:26:39PM +0800, Joshua Yeong wrote:
> Add DT binding documentation used by StarFive's
> JH8100 SoC Starlink cache controller.
>=20
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>

Other than Rob's bot's report, this looks alight to me.

--dQ3vim3zqT9txeSW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZifWrAAKCRB4tDGHoIJi
0l5CAQDJLOQk3+8wxytgri/eE0jyCXIMubVtypxaKKSI8743DAD8C9SYRFeHe69e
JpFhPVut94uUmk15b1Kznlz61Lpd5QM=
=5LcH
-----END PGP SIGNATURE-----

--dQ3vim3zqT9txeSW--


--===============7713620004502146845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7713620004502146845==--

