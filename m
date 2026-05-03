Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A824FF886F
	for <linux-riscv@archiver.kernel.org>; Sun,  3 May 2026 17:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onFGYUa+mbg8kcyue/sTtJteTeQyfQL6huZnmhepJuA=; b=aDa3fWhMgFCMOmNLHMlx2Tbvh8
	4ieozD010ZsdldNwaqz02ZxcaCKQVWCKEN2fT83XpoJwQHDq0VYf/eG+PRo7MqpaCYzy8r8BSTYcs
	SobJX82xadF3EJf7Up8ImzPUdu2fHef1UitbHsIe1naa1RLK1KkN2Ir09OEy290nRRbFZ4xucyOdw
	d73mdGYEIEMNJWbc8hs/e7trvPTPBOguuSq5ko7FLA6fbeTDY1Gfp1D7XBBP3OEG02dZghiT6lvk2
	CZ7noxaQBDOzupm1GXwqFCVq+/Uu/YYfc+ez1+A6GPNfecEEpp6/7cPiwOUSNQK/WjBKYwhjFZJRs
	1i/YjCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJb6G-0000000BSil-3hEZ;
	Sun, 03 May 2026 17:59:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJb6F-0000000BSib-3T3w
	for linux-riscv@lists.infradead.org;
	Sun, 03 May 2026 17:59:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0AA4460008;
	Sun,  3 May 2026 17:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499DBC2BCB4;
	Sun,  3 May 2026 17:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777831166;
	bh=V7NtC9da5pci0GATUEjHGjX1eH1+sSs6O7RY2S2mlzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l61zVq3DeuKczuKBRBq4ZywWYih7F08eteaPxDXC8HqdCrgLIuY12cCZpipfkQxC6
	 80y3acacZQytq2RHyLbS1hfOLZIfLiPOVX2sh+5hmkMcEPecbQwGgTs1sCxKaecY2Y
	 JvoMZXndmL1EH1QC1XrwiSHVA0OpJ4AOtBmL1EzPjchkC2aIl+hSi78yo8/GkYABHu
	 RcJa+7sPI+AJEsWxm9w7mmFeWbYY18QNTw6r/0V3/O1zb5UH6dG2b2NS7ECUZCkkbu
	 E8Y2pc5W6d8MQhOoPJANeE+OMdDA2059U+56w8uYF0x0Eaf1MCnsOkjgjg+iEf5NoZ
	 rBrqXdxzNqE0Q==
Date: Sun, 3 May 2026 18:59:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: spacemit: k3: Add PCIe DBI clock
 IDs
Message-ID: <20260503-cupped-feeble-5a12fd4ae263@spud>
References: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
 <20260430-06-pci-clk-fix-v1-1-32fdc77c02ab@kernel.org>
 <20260430-plug-bolt-8ff9137717fa@spud>
 <20260502113201-GKB3266396@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260502113201-GKB3266396@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============7371819228832717005=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7371819228832717005==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YQEsGXXZOZUQogqG"
Content-Disposition: inline


--YQEsGXXZOZUQogqG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 02, 2026 at 11:32:01AM +0000, Yixun Lan wrote:
> On 19:55 Thu 30 Apr     , Conor Dooley wrote:
> > On Thu, Apr 30, 2026 at 10:30:26AM +0000, Yixun Lan wrote:
> > > Add clock IDs of PCIe DBI (Data Bus Interface) clock.
> > >=20
> > > Fixes: efe897b557e2 ("dt-bindings: soc: spacemit: k3: add clock suppo=
rt")
> >=20
> > Why is this a fix? As-is, this looks like you're abusing the Fixes tag
> > so that this gets backported alongside things that are a fix that depend
> > on it.
> Ok, will drop the Fixes tag, since the PCIe isn't actually activated yet

If you do need it as part of a backport, look at the stable docs for how
to specify dependencies for a fix.

--YQEsGXXZOZUQogqG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafeM+QAKCRB4tDGHoIJi
0mzWAQDqO536gtDVStLwRG6bUI1CWGx3BjHlTtvdgP4o4/Ki+wEA/Ii8Qtw1Uw8I
0Mi2/eCeT+1SnC2mWly9dwTfe2JiHA0=
=pIko
-----END PGP SIGNATURE-----

--YQEsGXXZOZUQogqG--


--===============7371819228832717005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7371819228832717005==--

