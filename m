Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BADA606A32F
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4z9xyLFE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XxuGxQvk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KfIJUg4W7lIDAkOc1Ed+m/KgbBuP6NHI56fpdBPrdto=; b=4z9xyLFE6pYLu/IP7X5atPDrXv
	50Oq6LK/R5ll30wolIqttzSvv6ywqr2jVLlP466eM5OIWvD2a66qcUzjahTXpkUo8U8zX5SlHl3zO
	VYYhg4m/+brs+0Y60+JncarOVaapoFSXxb41+LsUKCHK8ZH61q3BdvA7sB06dTZsJqNhzZxSpUEHq
	dwEda+IfiyAwfC7jyKGFlvk52ShYXPmKCUVgiHmLC25w+znQsOydYc+8N6BLUEwwpUkJB+JSgek/Q
	JgIdObxW9c67oThl2nZwG/wTOBNCs8lRVQMAjQRy+J8k8Z53XUQg6vBwRZ9c8wkIj4fs7JOPyLSQF
	BbK0FSgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTk2R-00000009quz-2HAE;
	Wed, 18 Nov 2026 18:05:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTk2Q-00000009quX-2tXm
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:05:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 07A2D45F4A;
	Wed, 18 Nov 2026 18:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3DA1F000C5;
	Wed, 18 Nov 2026 18:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025141;
	bh=iy4jAwl3tdKn7xHbVstEL76bWYCBGuwge5wZFpuQUGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XxuGxQvkRBuWaPVhzYog8gklmRmEsUM7/bbpLmEzs6KnKDpWLNarLFZohhSk7cCTK
	 MCrZEqmmc8G+CH4Xee5x9lMXiQKmyimvXbeRpGD38ZOp0Djxu9bEj7DYnD+AM7kf3T
	 frUXONl5sLhpwMdMaBEF6gUHHLxAQEXTDepgGTpUvSEg1NXRHH66/kYZa89yxB+nsy
	 Zraqd7n+lEOKlGcui0vDLw+HpGFK7B2wlRZQF1cZuyKgTcGRqcitQoKmdiBUU7BWU1
	 DzUleDQ62DOYrL1SEFZzDGig9Yl5Qt3371w578v6HMm/9uo5VBFsNehQwSwR2NeJqD
	 yyWj7lX33YFTg==
Date: Wed, 18 Nov 2026 18:05:36 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Fr=E9d=E9ric_Mah=E9?= <frederic.mahe@cirad.fr>
Cc: Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: spacemit: k1: Add RCPU2 PWM
 clocks
Message-ID: <20261118-afflicted-composed-a1fe7eb09a25@spud>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
 <20261117205951.140146-2-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261117205951.140146-2-frederic.mahe@cirad.fr>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0622916874180215211=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0622916874180215211==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9VzPwkqfixvtSRyh"
Content-Disposition: inline

--9VzPwkqfixvtSRyh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9VzPwkqfixvtSRyh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3o8AAKCRB4tDGHoIJi
0o+oAQDl1DZYSo+zVgDDQsKqmrS77/nLdUAQthq0LltDP8m6IgD/UkYdyfxwqcT/
ViWqyGCTM/EA18gs3hD2EeHm722OtA8=
=kFrt
-----END PGP SIGNATURE-----

--9VzPwkqfixvtSRyh--


--===============0622916874180215211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0622916874180215211==--

