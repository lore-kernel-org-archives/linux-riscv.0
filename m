Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6146CD6E57
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 16:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GCp0RC/VHr375C3FXC3Sp6dSLwQEcldbJyZ9jrOfeY=; b=qAv/XUovSV9CCWKoQXZPLhVL3m
	RFhIeqoBq8mMvnw0hciwpvLNzHfzRv/pu0tzftmGVPzqgnIlCjmQjLKFtlZXHapcYqQzRHCj9C8fD
	G8vTHgzdEavi9JLvPeIXhWtEOoomDwz6GNVatkoLvXRbkUMJKhggMUh829ibsodrPeC4k1LMPDyBl
	OCPfxnCPPSWtyIPU3m7OAjfcEMZTwAcwHYbK83sZh5fAbfagpJuaVXt67e7lQUT1ecHhdDHtmuVPD
	/0ep4QUJtz+TBs+yslbUd33ZTnBG9Ln9i18qKPEq2VQokWwkolepEtWE6Ov+dw85cewAZmAaF8jPf
	doGEYaEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoHS-0000000FVI1-0DyB;
	Wed, 03 Jun 2026 16:17:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoHR-0000000FVHn-2B6J
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 16:17:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 99177601F0;
	Wed,  3 Jun 2026 16:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D2D1F00893;
	Wed,  3 Jun 2026 16:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780503440;
	bh=STmgb4eCzuj3QUyDrbNGukfTitiuFEoTNqL7diLYpq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cPFnGYX6kVV8XG6BLqIDkBOCao6GfzWE+EYujXj0F9bPVTufgayrsW6wml0EvBTuq
	 lPb05VYOm4DgU3piQv6n+E8SHaWec9nrD6rvja3+QRgX4JLklmHr+xL6vrkDprZja/
	 lab+aaZx8TsP7JPoXxkenEOgeczeOcXmHCp8puokw+E2G9ln35YAzQl3e/Sn2bSf0X
	 GhEfRUM4kZSzAlQ+/zsHeWMTTHbK2ht0wGQ+cm5+ic5X7A2p0U2vChiq4vVy3qbqH7
	 VgdaKwq52yvE4NyvZwST0GumYyIr9qe2dXyG1AINQ57m1P2S/ahHOBGSKGzJJwTa30
	 qDYWaP5mgxerg==
Date: Wed, 3 Jun 2026 17:17:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <fustini@kernel.org>, Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 5/7] dt-bindings: riscv: add Smrnmi extension description
Message-ID: <20260603-deviate-steadier-9ff6a23c5e57@spud>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-6-joel@jms.id.au>
MIME-Version: 1.0
In-Reply-To: <20260603074222.593243-6-joel@jms.id.au>
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
Content-Type: multipart/mixed; boundary="===============6654876979145619012=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6654876979145619012==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yNASxG9BLdH4uAVz"
Content-Disposition: inline


--yNASxG9BLdH4uAVz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--yNASxG9BLdH4uAVz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBTiwAKCRB4tDGHoIJi
0kbSAP9kgT70mva4v9V2xH/K4hakrtleDSRqYCgMGRnprAgEIQEAr9YGD/YVGhxM
pOWj8Tps+sLahUnos02ypNnRWaqJ5Qs=
=2eh+
-----END PGP SIGNATURE-----

--yNASxG9BLdH4uAVz--


--===============6654876979145619012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6654876979145619012==--

