Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B8BCAC59A
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Sep 2025 21:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjrWNpijK/P/rwqmT0y9Xwp8MVs//0MK+67BPZbYdW8=; b=aaoegFN6SWO5lifTnijs5ThV2k
	L+w33leE5OLjlyMSdogOhfQmrHo6Ed5i3f2xV1oV+6oEQ9Rgxi94HndjEd50MzABU9dBxCGgRyHXl
	hR3fT9UDkvHz27W6p6X5bbyRb6HP7Tvc7ZOCaHuy8WCUTvbkTWWc2ziCuEyKAY41thEkROKhupOWv
	2a0GRrU8RWM9aKVUH8nJqHFI5NHojEvJuuMELZkaYW6QvG68pmRl6mRgDrQ+WTBE8ACUsh8tT0/SQ
	OB8Il3ZPfFc3SYiTLqu9ybKsoBIuSNfJsuM6XYaa58g20PN7+ms5c6yICRSxAaHnIZqLeMkyAMR5Z
	tQf9qfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RW7-00000008F3f-36nS;
	Sun, 21 Sep 2025 21:22:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RW2-00000008F2x-3dX8
	for linux-riscv@lists.infradead.org;
	Sun, 21 Sep 2025 21:22:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7906840046;
	Sun, 21 Sep 2025 21:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD94C4CEE7;
	Sun, 21 Sep 2025 21:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758489757;
	bh=FfaSe140mcWx+5UOLTrRKCtyL3nIIKPUV/4Fn/ZxxyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sZbrg/c1Tlz/SC8p2ImWDZfmjBBXU5q5KqwYxyO3CdMFVDWWcyHa6psEzHuMzITaT
	 /YzgQkUj0iSec/ioqadcRy+uEc02QYcWkvwpgX/8WZoFGUnAzf/TvFVoamqU7P+mYY
	 pmulic5sQb7T3OTv3KXpGrifKDEHguTO7ulauMDHMqVZ+saKJzPGzYJaiU17k/PsLZ
	 L6/Czh8wtuBVPGlX24WHODb2tXetQrWR6ZihUgYAqAlpoEgEPMrWfes3M5POcGybpY
	 wjZDjDarKM/QwG7s4tp1E/RkDKgbzWrdS8nspHhRSCxWTc1q+LfDXaoM+JiIRQiwh0
	 5W+SU4eWBwkkg==
Date: Sun, 21 Sep 2025 22:22:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	James Morse <james.morse@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Vasudevan Srinivasan <vasu@rivosinc.com>, guo.wenjia23@zte.com.cn,
	liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: riscv: Add Ssqosid extension
 description
Message-ID: <20250921-praying-module-6a94b3510482@spud>
References: <20250920-ssqosid-v6-17-rc5-v3-0-5093162922d8@kernel.org>
 <20250920-ssqosid-v6-17-rc5-v3-1-5093162922d8@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250920-ssqosid-v6-17-rc5-v3-1-5093162922d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_142238_920202_BAEB7A7F 
X-CRM114-Status: UNSURE (   5.79  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============2934439726039527335=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2934439726039527335==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Im1OnXI+wDR1opM0"
Content-Disposition: inline


--Im1OnXI+wDR1opM0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Im1OnXI+wDR1opM0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNBslwAKCRB4tDGHoIJi
0iBnAP9QK5OUnppWh5JFkOmqVjJHymCA82qhsBOC5l1deD+XxwD8DY86nmCWEIGK
0Vr5AbEic0vlD+Kfh3aiA61aRx6MqAs=
=4SqQ
-----END PGP SIGNATURE-----

--Im1OnXI+wDR1opM0--


--===============2934439726039527335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2934439726039527335==--

