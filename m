Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68970606A335
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 19:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bLplrgsD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=brOEXCv7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mQP+oOfCuooS16ktOZywXp7bQjQyFyQIR16l/OIGATM=; b=bLplrgsDwJ4OkKQ+pqhH/qy2H9
	FHMlzZJAyb6Qq12yf8BWgbHcp5Y0OAGjrqrHIzUP3rvlmtraCLL73cD0K9l4/1HdAh5cDe9R6Sglu
	F90Fq2KFLRUMvP+EE37hD8+n1TshXyX2K84mXQa8h94sHCEYhiOe25yQ0QfJmcpIX+mpcSzavWkGf
	BAPsFsYLaQA6FNAzrOehHCVNz40sg6OKjTKMnwtEZwgO//jwF9HfqoCYORQ/jM2s2mrbZQ+waSy1i
	wHiOO7oW4nm+o+5cvypCL7+8biWg2T6XFlvz8W9n8cUIk6VVXCVOR3NLloaGSIDBp0idGSdooc2ux
	m008OvmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMW0V-0000000AG5P-2RSG;
	Thu, 29 Oct 2026 19:41:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMW0U-0000000AG4w-1YvK;
	Thu, 29 Oct 2026 19:41:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 88D1543ACF;
	Thu, 29 Oct 2026 19:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6161F01816;
	Thu, 29 Oct 2026 19:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793302909;
	bh=B17oc8WpndzlQmt4uZst9Vo/pqlNk6e5++M2mkaal6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=brOEXCv7ghTKpvSCrtN65OvP1JadGCZnR0AVm2KJBlxV0jnfcvm7n07hHq4Mch4PW
	 jeJTwdgTw83R/cVx2PB12wW7LD3/R2YQhRNIT0HCmely3WIOwYC6dk4tx9iQNVyHbg
	 qgRTxXF9mAHV48jYAQbxR3qgNwaieg8rz+bceWBFC4pjbvIH88oRy7QjmWMgyfVf4z
	 nssGbpdnDpBaA5bEaHABoRakiIFsG1msCoONk67sNi0kwAdX+8/Oq8Rr01h/hz++ST
	 LVooCNqdQZfm058k1ywEaJRDI3bLgvMnSi3vDRpbZOKDaljUABd0W0D/57Jb3FpHbw
	 USl/lW2gvgPug==
Date: Thu, 29 Oct 2026 19:41:40 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Subject: Re: [PATCH RFC 09/18] dt-bindings: riscv: add Melon Pi V1 and V2
Message-ID: <20261029-repacking-pastor-380e92e1ce94@spud>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-9-74d58ce85bd8@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261027-a210-scmi-v1-9-74d58ce85bd8@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Drew Fustini <fustini@kernel.org>, Radu Rendec <radu@rendec.net>, Yao Zi <me@ziyao.cc>, Paul Walmsley <paul.walmsley@sifive.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vivian Wang <wangruikang@iscas.ac.cn>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Jassi Brar <jassisinghbrar@gmail.com>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-serial@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, linux-gpio@vger.kernel.org, Daniel Lezcano <daniel.lezcano@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Paul Walmsley <pjw@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Inochi Amaoto <inochiama@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============7542676709540522242=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7542676709540522242==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dsKkk7RTBz7aJOQa"
Content-Disposition: inline

--dsKkk7RTBz7aJOQa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--dsKkk7RTBz7aJOQa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOhdAAKCRB4tDGHoIJi
0uF7AQClUV/fqro5Tr5TDnC2Mpw74PScgpYqEc454b6R/ZRx7gEA+KLcCpIvyNI6
XIZZZW4Uf2sDbwWWSY6vEUwZk24bcQI=
=fYYP
-----END PGP SIGNATURE-----

--dsKkk7RTBz7aJOQa--


--===============7542676709540522242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7542676709540522242==--

