Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF76606A32A
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nw9MmImZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WaluPPtm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6oNBBYanBEoJEiZP2Cbjy3FggqyfmjDVOxljqcL4KC4=; b=nw9MmImZLR2TUfQef5cCrOPGEH
	SAN13i1QTarKzYFG86YzBgH+pz/E8g0jtvcyB3WBzKNoXayHve4GR2FJySPyFavzoom8wWSbzTndH
	KnWeZ2oVuTk7AU24LBjgnC+sSQOx9ux2p2fU9liVdYhASfkWGEiyXBa0GTZ9KkdbTzCnhvI5u6ft6
	+rI7crIbxxDS9Rba02HXWggIdlC9ulSq5yOCmLgIgtd2AFXkcweuw54FAZY4DE7bf91nxN9AaQ33x
	CbTTP8DfjWrh2YK3pJP5PnbaxkhiTZza2YN25S+MAsPmshjIf97vwSVmEb08LBElm4tDBBtSBcSx+
	Hpxb7Pzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Vs-00000003aSo-14iq;
	Mon, 16 Nov 2026 18:33:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Vq-00000003aRM-3jgc;
	Mon, 16 Nov 2026 18:33:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CEEA463FB;
	Mon, 16 Nov 2026 18:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16001F000CC;
	Mon, 16 Nov 2026 18:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794853986;
	bh=W4DMrdgsLAUvBBrAedtVh2X2nrPi8BxrDXtCs7P+IMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WaluPPtmVQajcvp3iSn8n4nUrBdnmzjvcL8SQtCk/wc4+cJVkEcnzLmkx0S1GIB8n
	 lTRfAEGpyhFjU4JMR6szToKlZxCFEdwOGLEDX2rxrQTq1rDBEt1SVAH5t+KuWrgO4P
	 SqWI39DsGszLHHoHQRQGo9qVoX9DM1YyYJEGs+rO4aPdze0yoHYmIhv+84jh4DimRg
	 oP48j2zl9gB3+kCyygIxdyd2P/ytRyTCUJOiLAeHn6cjZDwW/LsahzNz7CALmz+5Tl
	 Y2Bo3LxPi1sPEjllqdCBWIfviaqNkSjKpXc8pMXzZUemcpTEn1L93wEom2dMTp/7y5
	 m5zlvuwouxfRA==
Date: Mon, 16 Nov 2026 18:32:57 +0000
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
Subject: Re: [PATCH 17/19] dt-bindings: riscv: sunxi: add the YuzukiHD Avaota
 F2
Message-ID: <20261116-coerce-abroad-f6a0d972e7d6@spud>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-17-eb71ec3ee523@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261114-v861-v1-17-eb71ec3ee523@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0293919537763464216=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0293919537763464216==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eAu7+tg1zQRG6YLP"
Content-Disposition: inline

--eAu7+tg1zQRG6YLP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--eAu7+tg1zQRG6YLP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtMWQAKCRB4tDGHoIJi
0kqjAP46j2mw4L3q+jkKbSPU8KSsnHg0/9HtMnl3SxjhCkKDjQD/Zz+2au8n8mQC
VWw54ziAbcJSElKAfoNDn+1Tq0vebgc=
=7x1B
-----END PGP SIGNATURE-----

--eAu7+tg1zQRG6YLP--


--===============0293919537763464216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0293919537763464216==--

