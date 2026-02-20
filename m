Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945B6C5CFE6
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 22:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8d3+jf6siTBfVhhcdCeI+bNMFwxrDoUCiaPh6T1Igc=; b=I0uszkCSVawx6ykQUMp9zg+yfT
	dYbo3oCAm1WbT/rp08vjZqGw8XlJ4ulqktWmECOLD4wR3NX3VMdfWK1y2nE9cO6lLTdaiQb9/AM68
	0lzGr5fArTn7+ZtKlS93hK9xZVRnPizhr/l0H00we+toGfkqRTS73b1q3qv/b4xMb3Ho7acR8b4i4
	/14bBsh0bqA+T2G8RgZl9QxcTZV92/hFe8sJtltxYg8NWZ8UKUw2A1iEMtz72sk4kHClbcDsoEaP2
	NUvn3xZTASgKAQkAyfLvr2pP4W6dOe7Rpcjo1e2ha+Khbqfpawf93G2XWLQ4Ym21WGbxlpCnwrg3X
	4enulfjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtYYQ-0000000Fdu6-0V88;
	Fri, 20 Feb 2026 22:00:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtYYM-0000000Fdtk-0NXl
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 22:00:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E789438CD;
	Fri, 20 Feb 2026 22:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05829C116C6;
	Fri, 20 Feb 2026 22:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771624849;
	bh=j8ewDZamzs1TUqrD98btJHbb2prX1tgCIDCSHXyKP0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=svX6zwOaYzJn1xmxcW4F3TCS53OmLgF9S4IfY5MLZ9Awz2faOYHVqXgrtO5KzI/aN
	 tMO1jyfo9oo2ArMO0nOZ9IWZsUBZrpEaeE/lx+nFVBrMlM0Dtdmca2wE9iT4Bs27Qr
	 FWM0tICDnXU7z8Tta2YyudsmnXCi1bg7HipnwVpRRqp7bUBkdbqXPCBmCH1y01RDLa
	 nFSUhGIfqgph98KbTIDHblrfmwAZFkMKoe/IPCGv+AoKTzW6NSZN9u0R0YhwqxUtNQ
	 pjcq0RPyQJuuv+jQj/AvZ9H6kg0gRM1fnS3Q7q2x/OMr142BnQH/suq6Mb5e2oxSyl
	 ZdRne+uuPFfqw==
Date: Fri, 20 Feb 2026 22:00:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Max Hsu <max.hsu@sifive.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 3/5] net: macb: Add support for SiFive FU740-C000
Message-ID: <20260220-backtrack-saturday-b85344cd5eb6@spud>
References: <20260220-fu740-v1-0-c8af54130c58@sifive.com>
 <20260220-fu740-v1-3-c8af54130c58@sifive.com>
 <45821cd4-214c-43c0-ab2d-bbf34d9ec911@lunn.ch>
 <CAHibDyzQAWgGP9sktLtnpND-Qr6FRrTA=HEiweyDD6rWm=8=5g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHibDyzQAWgGP9sktLtnpND-Qr6FRrTA=HEiweyDD6rWm=8=5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_140050_815420_9F9AD2F7 
X-CRM114-Status: GOOD (  12.99  )
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
Content-Type: multipart/mixed; boundary="===============7117965437666213383=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7117965437666213383==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="owSUAfZltS+zhmwj"
Content-Disposition: inline


--owSUAfZltS+zhmwj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 21, 2026 at 02:35:03AM +0800, Max Hsu wrote:
> Thanks for the review, Andrew!
>=20
> Based on Conor's feedback on patch 1, I'll be dropping this patch entirely
> in v2. Instead, I'll use a fallback compatible string pattern
> ("sifive,fu740-c000-gem", "sifive,fu540-c000-gem") in the device tree,
> which makes this driver change redundant.
>=20
> Since there will be no net subsystem changes in v2, the series will go
> through the devicetree and RISC-V trees instead.

Nope, you still have one patch for net - the dt-binding for the macb
goes via net. Nothing in this series goes via devicetree or RISC-V trees
either.
Generally, bindings go through driver trees and dts patches go through
the soc tree.

Cheers,
Conor.

--owSUAfZltS+zhmwj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZjZigAKCRB4tDGHoIJi
0ppkAQDELcLSGsd9+CZKBIRTpROITc+zabzoqZ2zjM8e+CEGYAEAuTFkDeKn4vsG
nyHlHlHuc1eRatDuaFWmAN81FiAvBAg=
=gWwp
-----END PGP SIGNATURE-----

--owSUAfZltS+zhmwj--


--===============7117965437666213383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7117965437666213383==--

