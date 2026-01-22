Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5003D62613
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 11:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8v/29Bexga12trRaN34/oIX0ESUsHLNJJADLuT6A4Q=; b=WIqpFMIBSyVBvK3ndt4a3QjrTR
	2tZgpqCwpK60Rwuh1GXxfkjq44VA4q9mjSvxmh0b/7hnclzaRrL4aKN27Fvi4gczCBWc3IByX5g+L
	FqjpPKxYwGvEZrLVfbfDM+95ICYRvdapz/CxjfHCMj3xW/ChUtFFT2tZqWwuix0r8FR2fuftRy7zq
	1zlKjbY/ZB2C92wo97AVVtfR6SvhvMTj91pbZYgGth+c7sLdbHGHEZvVJgm/QaMCTnpyfRtujvjiz
	BpIq50azboUgrPqncvR/2xIQpnOK1vNTqMwtZiovTjyHuZunuEO9EVeRofaIfg+0JEDQQm1z7RmBx
	v9IKCXUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visr0-00000006y5f-48zx;
	Thu, 22 Jan 2026 11:27:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visr0-00000006y4x-0Rzs
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 11:27:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6055B60053;
	Thu, 22 Jan 2026 11:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC1AC116C6;
	Thu, 22 Jan 2026 11:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769081276;
	bh=cqjws9ooAjsbBwZ61CYWYQ//fsA2CNwseWVKxBI1+0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7vPrBhG7gXRu4QD0E8T9ufg4w39M2sZzihMhPpevwBb6pqdsc5vX8wYg4WlhxgL2
	 3B/UkK+As2Rn/y3O2q8ulnMeMM4XMzxJOhYL015tDP39vgZ1oQR5Uxg5BstdEOGIGa
	 eI9east+ya8K+bsJ52XXgk5R7yjD+I8oRCazfyudNMmQu7jtv39Ufc2lWz+g465RyW
	 OTACBH5GZYQLO+/HTjUcPgKOEk2PGNeRnPCTKtl3doK6+LnZdBlwosUfMiM603d0vr
	 mMl6ARbX+3rL6Bc8q5nHobSI5l8pJNSG0vfbLF7MOkOqqdKY5Hj61vgv3i/QjHWDoF
	 S5NOiZLm56ztA==
Date: Thu, 22 Jan 2026 11:27:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Guodong Xu <guodong@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
Message-ID: <77bc5a5f-666d-4beb-ab78-99a242d72a39@sirena.org.uk>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
 <20260122101122-GYA63789@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20260122101122-GYA63789@gentoo.org>
X-Cookie: Don't read everything you believe.
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
Content-Type: multipart/mixed; boundary="===============0116772995307330725=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0116772995307330725==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kCU7aOWPcG50IcvN"
Content-Disposition: inline


--kCU7aOWPcG50IcvN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 22, 2026 at 06:11:22PM +0800, Yixun Lan wrote:
> On 17:43 Thu 22 Jan     , Guodong Xu wrote:

> > Patch 1, n_voltages is corrected to match hardware register widths, as the
> > previous values prevented regulators from reaching higher operational
> > voltages (e.g., 3.3V on LDOs).

> This patch bring system-wide change that not only affect Bananapi F3..

> Please also provide fix for other boards, I think you may not be able
> to test all boards, but make sure the patches are available, so people
> who interested can test, P.S I can help on milkv jupiter board

Patch 1 looks like it should be OK as is?

--kCU7aOWPcG50IcvN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlyCbUACgkQJNaLcl1U
h9D/aQf/dEWaK9GmzmmF+ESbSHBcwMTmMmByHHPPRFKrNnkGd9hynfVF6M9fDOHD
EfN1Lm1BPwuFZF3+/qUg3drebJxFEPVPRfT5kxC+TJ5Bxf6200kqu7RkZiTNpA3H
ftvyR5aZr1r2lP+nbk5f8BICKQWgcxQ1W4iRnd69UcpV4yRSZe9J3j8PyxNnaaYE
uWYmlgCnYyOlCMjA/kQGRmXVC9p+qyIouIX4W1ixUw20wmKPIVrhEI48GcS4sWgR
m85lhXE84rP9UX0S3p+8sWp3hp36sP6VCzB+RCu84jwPdsdrz5++TPVMg5lK2wc9
aBcV2THb3moaWueejc7XDx9tG0j9tQ==
=L0Vb
-----END PGP SIGNATURE-----

--kCU7aOWPcG50IcvN--


--===============0116772995307330725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0116772995307330725==--

