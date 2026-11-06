Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1ED606A32C
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 17:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=leOeBrsS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O83jgpIh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LJTyz89N9TMefU8tUlR/EzumicZa+ZB/mKyu12TYhHw=; b=leOeBrsSA8AErfebtoT066wVtS
	f2hkbciy1Ml2rHyp5STPZ8eU7QfyDj3iyd1UNRFu1mMX9qt8KVLpN2ymtKRVH39PAc3kMejJLizku
	oQfEzN+QcUfCvHxGEokauJ6ZXBSDBvduWm5Zy1nJZNv1SXXThIsWkpGM/FvxfdwJBfGMX5VoG9OLX
	896BulSIZv+DbMFyBKksyQhJupXl7an258+5HazDnYvIPhL2ct6jcwx+iNLNnSyjBXdXKeizOH9A0
	fvm2za59fSaBGl4v5FHQHv7jeYRRnQlBVz1R7YIN5evp5cAtSiPAHJt9CWoZeAO7rrWHYhb6UbSzd
	DoMrLF4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNsr-0000000DFky-2BvA;
	Fri, 06 Nov 2026 17:37:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNsq-0000000DFkf-3VRT
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 17:37:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D489A601BF;
	Fri,  6 Nov 2026 17:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8895E1F0089F;
	Fri,  6 Nov 2026 17:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793986667;
	bh=gzXUUp+3kGXCL2KE4Dw9AAUPV/Re3Wk69iRm3DbCkyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O83jgpIhzzEHm/1SdA1olTRMRaDxmsP1ThiOE0mx5MfOzyJycbPWGBZP0ay0GJZHl
	 4mJPDcjr4ShzQWmb3O9H8tuDW7FvjdV5wJtPqduJFtkY6Fi/K1T+z7NO+NcIAxKfxO
	 yZrG1Y4qJ4cCR3Mba1fo5L8y1gYjtXgynoDubpib8Xc66UJJb5DibAJCUN0p9Ealkj
	 r/qZmvV2gKExI/3wsBtSvDou98UlQHG7wYaasg3EDBpg/SgooMXH8mLP/Zb6hCc4v0
	 MEKCSMDqk7COOIDUcgvWMtUJE5w8v/XoF18GFIc2RZ+0ZN4JauHhrLDBrNmKrlM65U
	 pU+cblhjJpjHQ==
Date: Fri, 6 Nov 2026 17:37:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiayu Du <duge1256@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@kernel.org,
	troy.mitchell@linux.spacemit.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
Message-ID: <20261106-cartload-percent-138747dcd4ad@spud>
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-2-duge1256@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261106060525.346873-2-duge1256@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0940703540108012542=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0940703540108012542==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ee509AZx53jUEgBj"
Content-Disposition: inline

--Ee509AZx53jUEgBj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Ee509AZx53jUEgBj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4QZgAKCRB4tDGHoIJi
0jyOAPi8fHRhLGVqM182Gzy3UpQvIry4Uqap4X2Fotqw5kA7AQCwcUH4NOyFCqIf
ggKPhUszL9Fc0yu8kWw4SOYoDjz/AA==
=q0C3
-----END PGP SIGNATURE-----

--Ee509AZx53jUEgBj--


--===============0940703540108012542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0940703540108012542==--

