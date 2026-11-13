Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64043606F5DB
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 16:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bWm7xZ7j;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KUTFsNZc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sZ6pNLjY3mNRTuiQ/4SyzZO1Phwl7ZRBqwTlmwEKL1Y=; b=bWm7xZ7jpsY5xz9eLPWr2QWop8
	wVMeGveb/jEULzI0gI33sjRLR7w7HiooEr4Y/FynaCVjjroAfn5rQu+tk4qcnkOsbBxslX887BZWH
	iMGgST2vDhDd8IT9Bfx8O7vqFPVU4TRzIl79E5geSfuFpF9ne9kk8HeZ3871z37wTcjULr88jr1yG
	/H7HS9l92kn+m6wiB80ZbSkLHPPCSIO7cxFxQ3KDT/Xtf9pHGU8G+VHA3PamhcYvyni7hPF8hPsyr
	e3uDzdfDQCZG45osx5U2nKTln8d/HB0cZihAGKfQ675EMNX3Rq1oLmeEdDy7iKGjNUaolROKp8+wo
	sJ/hULaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuXM-0000000DflI-4B2w;
	Fri, 13 Nov 2026 16:54:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuXM-0000000Dfl8-0Nq6
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 16:54:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 377DD611A2;
	Fri, 13 Nov 2026 16:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265871F000C4;
	Fri, 13 Nov 2026 16:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588842;
	bh=BBxU1eOV9BEr66yuB0ebbyYvleBXLvIO6pcvkVDyONw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KUTFsNZc22b8aHlWP+r3Odk/Gs/CKeg0AFX98nXe1f+J7TwRgUtiUkeXra02DE10H
	 F6bY3+LjPAZ2ih3c4kmDNoSHReU80HXuq5JNHKDOhAEMXSoydZvFNGufhtvwJr3GpD
	 bmyRyT9sP4KyeA2J3Il5+p4yjbXTpUPY/BNxonlZXN/n0Ezh8dzk4g8zXM5x+5FVeG
	 8Jp6BuNY3LfJ0oYqIX7DcQBcGi0WLuXNrpWwwyiw0coBYWklNW5iGaOJhhSIMeE0bW
	 F7jiWikpiQpNF7JTDBNOsjnTJHNV6Th5crMRA+xbbNHTKuALbh0EoIQ86VSru4es2n
	 D910q/N6WG68Q==
Date: Fri, 13 Nov 2026 16:53:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: spacemit: Add K3 BS01DCMA
 RV2768
Message-ID: <20261113-hull-unsafe-5d0e83589cc2@spud>
References: <20261113-k3-bs01dcma-v2-0-3f0de4a3e1ca@linux.spacemit.com>
 <20261113-k3-bs01dcma-v2-1-3f0de4a3e1ca@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261113-k3-bs01dcma-v2-1-3f0de4a3e1ca@linux.spacemit.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5850000616898194533=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5850000616898194533==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/jbMhdWX25YFWmZZ"
Content-Disposition: inline

--/jbMhdWX25YFWmZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/jbMhdWX25YFWmZZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavdApgAKCRB4tDGHoIJi
0grhAQDrVeCC4bdhfiu51OMI62/BUDXDdIG2ekR6JH/BWepPHQD/X0IyOl/DQrDM
PxeUOcyB3JK5V/9DTbqaCnx/ZMQaFwI=
=4piD
-----END PGP SIGNATURE-----

--/jbMhdWX25YFWmZZ--


--===============5850000616898194533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5850000616898194533==--

