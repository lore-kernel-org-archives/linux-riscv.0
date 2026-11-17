Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B2E606A32A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 17:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZbAMwFAA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nohL5RVb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D490vsuXRUM4DaEtDXbTHBgdotxmRLKNw0QcuLsasRI=; b=ZbAMwFAAsjlzxLYjvs64277mMF
	P0TtQc3be9Z+6Dhjgr87a6qmsdIQ54OtYP7hnhC5lrAnIlP6HbgJwr5/UDtllBlEXx0J0yddoMyg7
	ycsD+4nbCqf4n2EO6jFMF+Z+uQqzSFnRhKQ9hl1gkjQGXgKpYK7C12CBawmQ9idnNsejwlclu2ZCe
	0MrzNWXv71v5/3tpjMjCpjexB6/dRDunNpIbYvU/oib+3X9I0nKJBry9bLgoRbiyEg24B2wr6PGHE
	p+Vvrcjop4nK3bSkKFR+RzRI0Wy2mXWu6GTIEF3GFS8yTry3fiLv6c+U6HK7Mce65sq3ngsrbngsu
	gA/y97Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMzM-00000006ZMj-0O8u;
	Tue, 17 Nov 2026 17:29:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMzI-00000006ZJJ-0ilv
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 17:28:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B5F24131D;
	Tue, 17 Nov 2026 17:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509DE1F000CC;
	Tue, 17 Nov 2026 17:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936535;
	bh=wQcSUYQL3Pq5KKkb7/1z2kjXyCgi6wTpcgrI6k/1zug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nohL5RVb23MA05VdY6Ds9sRm+y8bwpMFts8Ytzb5Mm4oA7RgSmNC8B7FVKCjLrgtW
	 bLP9Jx7rlXfe36QapiLVlrfpwkKtwgWLXTr3JXNtHNrpJ8StdWpCS/YnstgF6mZErC
	 oZ7bFwxA0miMFFX4qLJEB5pNllUbEktG0BI7ZlHvj5MTofLh9FInnThH4R06canHLr
	 q5F/asXaheKGALKxM27g1eZ98P0PvEOODD3vNS0RDEHt8gjEb/90g20QsuW9eSe4yA
	 wrFBEtVeMhQ50OqEAmgk2w2ocFsLgTwt+FiP6A/SvnflGGWuSbLc2WIrPFj8e6hA5b
	 M881GSI46N8JQ==
Date: Tue, 17 Nov 2026 17:28:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Hiago De Franco <hfranco@baylibre.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: pwm: sophgo: add PWM controller for
 CV1800B
Message-ID: <20261117-impish-dipped-3177675d9ea8@spud>
References: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
 <20261117-milkv-duo-pwm-v1-1-3f1786ea57b7@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261117-milkv-duo-pwm-v1-1-3f1786ea57b7@baylibre.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6983728091615497026=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6983728091615497026==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TNXTGBunDxcfULCz"
Content-Disposition: inline

--TNXTGBunDxcfULCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--TNXTGBunDxcfULCz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavyO0gAKCRB4tDGHoIJi
0gZ7AP9wGtq7rXQpu9xAty+Q78SmrK8DVsrvCJiTqcE24Y/G6gD/QsdJayxk263D
NDXQSKT4jV9QQiI3mvXrFjXlGy5zdAQ=
=+4yC
-----END PGP SIGNATURE-----

--TNXTGBunDxcfULCz--


--===============6983728091615497026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6983728091615497026==--

