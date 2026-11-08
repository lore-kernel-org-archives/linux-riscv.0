Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1CF606A323
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 22:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sU3lcjck;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LXRE6x6S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H9XZXuwSmFVGgEfale2hMpCsuRVjQIwGFm7ghog28cE=; b=sU3lcjckvL3/qwkb5DAmAKNIYu
	U4diYrSaghbTubImsAC3KqS8n6YfWsXtXgT2WTXNGa4BvZjvpJVXceXp9rUaX1P8CY+8wDVVKfo9W
	nLTHsdHO7T+FnMkAtJg2/E6Bsb2+sGdITce5tAbjRiYm9r4eTRMrK8Z8TK13k1wIegLbpnFsDRRrr
	NgC9A7HnL8XTLxNZwIZ4/yFjlRtAP2Ca3xNboRDtxMISbMwMg6e5fxgVkNy39uv5Hiso7mnm8mMRy
	/Vy94LVaqw2Yj3x00pdlHYULSMQ8qJK9e4m1urYh+LhKdK/mx2Awz8+Yag1qlDXDzYalzuVumd7ZB
	4Mwfqhcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBos-0000000GrzK-1JPT;
	Sun, 08 Nov 2026 22:57:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBor-0000000GrzE-0vdp
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 22:57:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B8D934147C;
	Sun,  8 Nov 2026 22:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D71C1F0089F;
	Sun,  8 Nov 2026 22:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794178620;
	bh=20LGVkr7OyVCpXpA7vzhMSUIjmcZLUme60763s7WuI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LXRE6x6SdG7IyarknMia1YiU8msG0Ve5ktruCyF0lCx+UVcgvavx8E+O78sPKTsGG
	 x5+n5UPog+1EzaoORkKrMCILjgKfrifmQUiZVggZUBou2tqsshQs2fe5PG51J+trjH
	 dKpNJY0KX5zLqfrgGZEfZDmflcz024+wfgXVOl4nnvuWXLPsZcydJrzH6WkbsZrlN4
	 HBO2PGhub/47bFEdy+0XlTr2OPB5YVKtkl+Q8WIDCWSPgdljaHJI6b4F3wfI4qsbqg
	 1VoEn+HG0mveOemARyuRmlDOMjnHg7wBGxZyuMlJXXd9evDRmRKRh/Yp3xS5Pe18nV
	 ue8KI0YIlRAbQ==
Date: Sun, 8 Nov 2026 22:56:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Owen O'Hehir <oo.hehir@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: rtc: Add StarFive JH7110 RTC
Message-ID: <20261108-arrogant-comfy-702e4005ffb9@spud>
References: <20261108212826.15890-1-oo.hehir@gmail.com>
 <20261108212826.15890-2-oo.hehir@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261108212826.15890-2-oo.hehir@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2186621799679482373=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2186621799679482373==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SjCXAX+7+0ikTLlp"
Content-Disposition: inline

--SjCXAX+7+0ikTLlp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--SjCXAX+7+0ikTLlp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavD+MQAKCRB4tDGHoIJi
0pnsAP0eKWJ6w6W1snNjKukK8Fjs/2I49K2VUTuJDFtynSBZkgD+PikODNItjDsS
5JRL6HhB3lWBTwpaxHIxtWpOFzjT7wM=
=iVtu
-----END PGP SIGNATURE-----

--SjCXAX+7+0ikTLlp--


--===============2186621799679482373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2186621799679482373==--

