Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A48C25B78
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 17:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/22YnfNf7oNUvBPEZI5K626tcT3jBhMLRSJGwtDKjDM=; b=TgffD4BWpx+ni1l6R2CIlTErKS
	U+woSGsx1iQ3LB2Q9kgagxpY7yyc5jsASksWpI7oekKXjq7RziEUfxrayyZBrW+9NqFv4gYRTMe1o
	TzDzz3TsY32IVvP5e+B9yZ7tC5e4DDcNeoZ624UBdYaCWr3Qy6T5Gw4aj2IScFq1T8lLwpBIOJvzD
	PnVjrZODxdWtmhzUxrr1M8AVWRgBMra0sglLzwOiIJ17A9P+2pSPN7PzqWwsKk5xiz0MVnTxQIUcz
	kPke2OY/3cFBAl4yVY1LW6722Tl4Fy4P2Gg0G/e5fMC+4u7FOU83Y/WCDowMqQXWsudeBO+UbXZ3q
	yzCPiHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBeai-0000000G0k7-0piT;
	Mon, 27 May 2024 17:57:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBeaf-0000000G0jj-47la
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 17:56:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E50461A34;
	Mon, 27 May 2024 17:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DD3C2BBFC;
	Mon, 27 May 2024 17:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716832617;
	bh=xJfRQZyOb9ZjlBIvuRLICUQph7EB4GQE2wQqkDfH07o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rHPiEbVtgUkPWQrMOiEJ3tCoHPdiYgS46nBpgyHJQmLh1Gw/QSKGr+jpNZr6hsDqI
	 FpsMqZjsRTk8nSMWvL2YCdZgY+xC4LTD1kz+eOBj53LPKCESo7DNM7Kq8tFaf/TAGY
	 XSdyViSacRu5vhL2yC9CAd+mUFPSLYjl9dmCNIWVrXxR9UB5F/odW6iIhn1uwqIHd4
	 Rq6W9E8B5KD2ZhKvBULliWHsjdP5TuwyUxe/Eidf9mlfjPFF5D14+Amed3xs8GiaQh
	 28aE8sSiXNnyJnzdCf8Wvswawl0h13TSroxbzCK3ghw39KoiLBmZswmsV5EYCbcF2X
	 yjuNCmPDefWlg==
Date: Mon, 27 May 2024 18:56:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Henry Bell <dmoo_dv@protonmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2 v2] RISC-V: add Star64 board devicetree
Message-ID: <20240527-guru-gratify-2626be43b1c0@spud>
References: <sQqtfYJc5p5nCV1CUpJC_eti56gLvmhqfMv4DY-aojB0sCARXzXRBveErmAN0spUDzvux3m5LdcmU-i4BfNDCCckVQfHLpH1QakaXdpnXuo=@protonmail.com>
 <20240524-omen-smell-6c9349065883@spud>
MIME-Version: 1.0
In-Reply-To: <20240524-omen-smell-6c9349065883@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_105658_089858_CF3CD170 
X-CRM114-Status: GOOD (  11.42  )
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
Content-Type: multipart/mixed; boundary="===============1162823693240852192=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1162823693240852192==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1Sn0De3yrAQc1jyn"
Content-Disposition: inline


--1Sn0De3yrAQc1jyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 07:48:50PM +0100, Conor Dooley wrote:
> On Thu, May 23, 2024 at 09:55:37PM +0000, Henry Bell wrote:
> > Add star64,pine64 to JH7110 compatability
> >=20
> > Signed-off-by: Henry Bell <dmoo_dv@protonmail.com>
>=20
> $subject here is wrong, it should match other commits to
> Documentation/devicetree/bindings/riscv/starfive.yaml.
> If there's nothing else to fix with the patchset, I'll fix it up on
> application.

Applied with a fixed up commit message.

--1Sn0De3yrAQc1jyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlTJZAAKCRB4tDGHoIJi
0i0tAP4rO0rk9qWCg5RqkVH89K6dpbJwGc3uAUE/M1qDrOTz2wEAkLR9kZAg2zhU
dJa4MsowTMZTXTSs3wRMoA8iGGXyBQo=
=q1M3
-----END PGP SIGNATURE-----

--1Sn0De3yrAQc1jyn--


--===============1162823693240852192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1162823693240852192==--

