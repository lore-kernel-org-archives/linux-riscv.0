Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DF4CF45CF
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 21:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJjBllU4xDHh15xhI+WGfXaQwEtJ7Te7l5cQRfqodao=; b=AnpPm6CnImmbKH5PnZse+pJ4e2
	WGx9vqAmIfdZftm2JvYxgc907UANxMhtf7ba5O4uqypyPQpds/gepvmNWGp2vRtK896lwLZ/3QsNJ
	NqtybbAHzO3cpeE9hvXSy9EWMRPGd62zaNA4O/5K52eAII5Jhhtq2aXXIVp7m7VmEtvcbe6/Q5ocD
	ZGfaDF7kWHS6WbzrvAcBTIt6SvtBcMad9qRNAtaHSoXn6SPjp0GhGs/iuQGP0zByHdt26BiQJa1XK
	PQToYyeZq35sQKS7JzvlafdqslBAAdbO34hZzimdiziBBsfnYtuTxbNCjzmRHpxxQADuXsSzD7nSc
	0o5LUR9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPb6-00000006Dgz-2Zld;
	Mon, 12 Jan 2026 21:37:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPb5-00000006Dgt-2LDJ
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 21:37:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 99BDC6000A;
	Mon, 12 Jan 2026 21:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC26CC116D0;
	Mon, 12 Jan 2026 21:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768253830;
	bh=KLfsd+rAB5DQE1cOebZTBbLwOW3l7JnPI5gfbjcl0gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fsaoy1gLa2LZFuoH3Fl5IzK774msMnPQb6ililce51w+6u1YYKJsto4Z1SW9YeJGZ
	 HT+V/71cEkwT1Qk2JUuTvDH7QCuDQjrpGl8IRd3kIuVOI1Nw9LEyX7pqJVetXJoCkg
	 +y/kA2edgrQatOWosEr30WM5N2aI0lLvAi6zVzuVUlBxFchdjeHSDjj5D/Oa+GmCCn
	 BXcLhidS4i+GrkTdNy64EVvPk5DVYgCUuMzEBfpxH6XLXMO6K+S8jTTSoac8FiO3ri
	 OMYB9hZIP7x+rOvJSoSksNFN4+I83BtEHzj59mTYd0z+00FqFBD4Rxm+ZgedZV3rW/
	 KJXSTS9WSUxLg==
Date: Mon, 12 Jan 2026 21:37:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 05/11] dt-bindings: riscv: spacemit: add K3 and
 Pico-ITX board bindings
Message-ID: <20260112-silica-unarmored-6841bb422018@spud>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
 <20260110-k3-basic-dt-v4-5-d492f3a30ffa@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20260110-k3-basic-dt-v4-5-d492f3a30ffa@riscstar.com>
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
Content-Type: multipart/mixed; boundary="===============3737243551999075979=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3737243551999075979==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q+tNi72KIO0oXHDo"
Content-Disposition: inline


--Q+tNi72KIO0oXHDo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2026 at 01:18:17PM +0800, Guodong Xu wrote:
> Add DT binding documentation for the SpacemiT K3 SoC and the board Pico-I=
TX
> which is a 2.5-inch single-board computer.
>=20
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Q+tNi72KIO0oXHDo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWVpeQAKCRB4tDGHoIJi
0kl2AP98pMkYuAMKepzV7dfRrNTcYkFAC8J93oGWZzOd2s4UHQEAq6nkowI0ND4J
vCtzUhTNqKUDK0Oa5Hy+1oMYWd3CqQI=
=5I5s
-----END PGP SIGNATURE-----

--Q+tNi72KIO0oXHDo--


--===============3737243551999075979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3737243551999075979==--

