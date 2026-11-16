Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0DD606A329
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 18:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PGH/YszF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AvHSX4j3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DfypsaV1Hf/M20JNjFHVl5chPLVdDnBhvyseFS3jtX8=; b=PGH/YszFpu/g+niqMdSWG1C5s3
	SFA2jSeJPt3yFBXfqQ2ug0pCH7pEROrNnn2s3pQ6M2eD97RMbmIgSwyo3FGhRs8t6WBrdZI/txJWk
	VkhC3c28tinjGAdQXc9I85+wQ42JI2olbs9rOCW4c/VfFg+rCblhecD9/6VyoLsQj6qNvdfK7CpnN
	AfXsJJrjJSNE/fsSV+05f/Y8rVLR1zUO5LPtGHVLmTTEBi6nqZJgxS5xyL9Aw7ViCVRPh4y8lWMKI
	oaG/N+ZNNcDJQNRGbd9YHQ8fjp7q33Jth/ubQCqAo4Ak0e1WNB9GNbOx60iP10dj29GvirU6Hjjbr
	0b0tvnUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1TV-00000003Z4v-0HsA;
	Mon, 16 Nov 2026 18:30:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1TT-00000003Z3W-1MNh;
	Mon, 16 Nov 2026 18:30:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C16CF623DA;
	Mon, 16 Nov 2026 18:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C6E1F000CF;
	Mon, 16 Nov 2026 18:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794853838;
	bh=fq8UNJdybhSyeB6z80ooizYYo9twY2GQIUpJeSeo6z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AvHSX4j3wHDmokZU9UmVXmHC/fH1020VEVVpL9WtM3yt1ZLgWvlTQLWLh25a5F+wF
	 p3oUOOczaaWxcUzN7gYP1fNxtgc0+ZXdREZYeVZQAopYSK2pbI9yKNwIy6otK7H24J
	 edE2Xz/uQA0j+T6dxpSSGiE9qsXFnmRP/q3P1fzcbc0L8m9Dz+e7vwYIoT+3vWEI75
	 brLsfzg+hCziVtYBEbAyuBUijC55x32ZmaI6mDyvQrTnuiKvIkWR/+6x+24GYN0Nit
	 oAqvU02x6x22NLIUjcEEpldo08azcX3NHrALt5Mum6cq3oTlGfnrrZmafSe3n2a2cl
	 YerqN1Mu0CFZg==
Date: Mon, 16 Nov 2026 18:30:30 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 01/19] riscv: sunxi: describe the wider Allwinner SoC
 family
Message-ID: <20261116-trekker-dropper-f5a3f7cd7387@spud>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-1-eb71ec3ee523@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261114-v861-v1-1-eb71ec3ee523@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1445100016838785168=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1445100016838785168==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zLmNtJsl6PDzM1aQ"
Content-Disposition: inline

--zLmNtJsl6PDzM1aQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--zLmNtJsl6PDzM1aQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtLxQAKCRB4tDGHoIJi
0l6qAP9H2PZxrdM3PXC0VQDqNZHcObimsehrN1DJV6Ri5MeH5wEA4MvfzsTXAJvt
qyg5wYSgjZRDoS3t6HW/HGfIGKx1BgA=
=jF6F
-----END PGP SIGNATURE-----

--zLmNtJsl6PDzM1aQ--


--===============1445100016838785168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1445100016838785168==--

