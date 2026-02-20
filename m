Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEEAC5ACC0
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 22:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CacDm8iWjdJPomAkSB1M8SXMx6dQkICRV0HfFqlu9/k=; b=WYImebWd9TeycV8zkQW/byk2d2
	x+nVfwLhOURs3ZBHmSxYAFcbnQxOuZYJwIWUXjIvqavTOLKT4iInShFIJTG6lQUKIwgsD0M1qMJ3c
	lINietrXdXXScrDeP1sZoutEtj4mB66jwkPWwrVk06b+62NWHh82Yb2IwF+0CUxbGP8Ki/ON3kRPp
	gePlXrj0kUa4KLOOStMQTL1xrvwkShyR4zg05Vn5318NIzkojsJawrqPGWr5itXvmIA4pMZIGl8zD
	zZ7Rrejpws/bKFeZfxmdxcHaC9IhZ040WzF7q9c1fukc7lJBSkDNJQ/uL+tJNhj9YfYxwAf5BRE7f
	i1j/udKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtZ41-0000000FfBT-0Hbx;
	Fri, 20 Feb 2026 22:33:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtZ3z-0000000FfBN-3fUH
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 22:33:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ECC5060123;
	Fri, 20 Feb 2026 22:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A792BC116C6;
	Fri, 20 Feb 2026 22:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771626810;
	bh=G9PuysDIOK/utZRbimCSxhU/vbP4rAjGxg+IEV+ae54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNXx+2cPe2NT7jVmcXy7HE3rBU8gwmDxq6hL5mJOFf02N4LMXhG1I18E9a/bDBo95
	 bAJraTFMNy6JFmPIPfqhegVu1VGFhNE2uSGy55whYy+FUwAoN5DewVQyGoDpuOhobf
	 NFa2rAV4bDOUAvjlRUTrjN7Nku+/Y60InifvB2G4kLa15yfaqv1cbAowVl0KDPzxpd
	 1S2NqywtjlmmBwP3q6HCNJzF0BXLIX9WBZdS+5o0c/yOsaIWeMgCWdEy61WpIHoUG5
	 Z86BcMyrkXz1EE9ram94kvly2XqDkzL6Ry0uy8W/82ZixMUrF8iNARRjT6ndArXMDH
	 pDvQDdqyzrLIA==
Date: Fri, 20 Feb 2026 22:33:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Max Hsu <max.hsu@sifive.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
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
Subject: Re: [PATCH 2/5] dt-bindings: interrupt-controller: Add SiFive
 FU740-C000 PLIC
Message-ID: <20260220-outdoors-shortwave-1d96b888d6c2@spud>
References: <20260220-fu740-v1-0-c8af54130c58@sifive.com>
 <20260220-fu740-v1-2-c8af54130c58@sifive.com>
 <20260220-contest-ambiguity-1a4099520bdf@spud>
 <CAHibDyy1mA2s9_UjKGPemRaKNSvyq07Ok5+4yruQ1uXX+R-Pkg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHibDyy1mA2s9_UjKGPemRaKNSvyq07Ok5+4yruQ1uXX+R-Pkg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1351006555236416630=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1351006555236416630==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1+7JBjJXa3ddPAxb"
Content-Disposition: inline


--1+7JBjJXa3ddPAxb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 21, 2026 at 02:49:19AM +0800, Max Hsu wrote:
> On Fri, Feb 20, 2026 at 09:23:18 +0000, Conor Dooley wrote:
> > So do the general rules for devicetree bindings, that's not something
> > SiFive specific FWIW.
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks for the review and the ack, Conor.
>=20
> I'll update the commit message in v2 to reference the general device
> tree conventions.

It's fine as-is, was just pointing out that this is a general guideline.
The SiFive document is mostly about the naming of the fallback
compatibles etc that represent the IP core, rather than the soc-specific
part.

--1+7JBjJXa3ddPAxb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZjhNAAKCRB4tDGHoIJi
0iSNAP9hJhb7PGWy2jnnfpHwcJa19CkzkGwxwor9OoYtlCtP7AEAwzDYTk1Mm1E8
1RRVikALQOU4P5c2hFz7flV/0fZGfws=
=WXTM
-----END PGP SIGNATURE-----

--1+7JBjJXa3ddPAxb--


--===============1351006555236416630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1351006555236416630==--

