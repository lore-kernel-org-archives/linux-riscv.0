Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0227EC47DD9
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 15:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZxpLN9DRK6S4d8+Gs+zS4UcSwgRkha+Q6lLL1Z3suE=; b=RRgF6ZMVFfdxpzA6dkTQ3VKgM6
	A8t9F7XE1poXlQP1UNOX9B0PMWXPTuNVDPQsJQRJ7CnWJA0uK+L+DltRGQ73wl5WNiVSgXyGA0UYo
	g2TquctmWUO5P09e5GHC3uta2wUWRJ+a0d9+pdBOnd2+s35YuazmJPEsGEDmpuKAQYbsshIcRYHiJ
	amtHkIFmBl1aphL7YkOuQPWAz3SHL6X8RFR8baYFMt29W2n41xb9emamjNW/ZiR2H1zsHZuIViZt3
	RgonuO2PLl5QdUKNVKeXbdGAY5ezpr7e1ELOYm7R02rNYWJ6pMxCMtbjeb4RT/D554sejijBkUhQN
	rwzDAyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRwW2-00CmwK-1B;
	Mon, 22 Jan 2024 15:47:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRwVz-00CmvJ-2M
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 15:47:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CF7A60BC0;
	Mon, 22 Jan 2024 15:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB36C43390;
	Mon, 22 Jan 2024 15:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705938430;
	bh=MeeGlkv76uplWomLg9ocLHv3pnCOcFvMEIpYsPtsuKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fu5qJG7RkhmQ6jgIor5MANwY+t4GvT6yVQsN1DGTMGXKHe9StM1utWQISbbVvd4ac
	 B1juEMTY3B1GRWCbOe25U9Rr5uCnTDL1xmJ/yWTVXfPM0zCCKa3j9/sQiZCxGooeM9
	 iMjZ65xo3ahoMRi85ydV+lr0KflLGBU98Ga5NC+ueAdxgXb5eMu34ild0NwwsR7sf0
	 oAueXHeCXhks5ui/INetc73O1gkav8kikNXkXqCDAmWWe8iNDwYl1KfxKfVoez11Mq
	 HXJlAKaAHDgVSvShgmDTArxM1ApWambu8Ki5e2/6suTJWJNyQAGcsC93zGNmh4aeJ/
	 PeL9/w6ECTJwg==
Date: Mon, 22 Jan 2024 15:47:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: can: mpfs: add missing required clock
Message-ID: <20240122-duplicate-nutrient-0edf5dfc9c93@spud>
References: <20240122-catty-roast-d3625dbb02fe@spud>
 <20240122-breeder-lying-0d3668d98886@spud>
 <20240122-surely-crimp-ba4a8c55106d-mkl@pengutronix.de>
 <20240122-cruelly-dainty-002081f0beb2@spud>
 <20240122-smokeless-ion-63e4148c22e5-mkl@pengutronix.de>
 <20240122-uncoated-cherub-a29cba1c0035@spud>
 <20240122-pogo-reputable-b1d06ae1f1f1-mkl@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20240122-pogo-reputable-b1d06ae1f1f1-mkl@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_074711_811045_72BBC5DD 
X-CRM114-Status: GOOD (  10.16  )
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
Content-Type: multipart/mixed; boundary="===============0038040148560610833=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0038040148560610833==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZlbIajEJ0GsLUYlg"
Content-Disposition: inline


--ZlbIajEJ0GsLUYlg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 22, 2024 at 04:31:32PM +0100, Marc Kleine-Budde wrote:
> let's get this binding and the CAN driver upstream!

FWIW, the driver seems to be in a good state (or as good as it can to
someone unaware of the goings on of CAN). Hopefully the author gets
a chance to send it out soon.

Cheers,
Conor.


--ZlbIajEJ0GsLUYlg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa6N+AAKCRB4tDGHoIJi
0h2VAP4w9AGyt9LMjr1fxyGbb5m1B484LsXBg9uqxe4Tx/FZsQD9GwDu25MWq/sI
nV0HlY2+IRQ8+nMMpcWLtXqwCGwB0w4=
=MXC9
-----END PGP SIGNATURE-----

--ZlbIajEJ0GsLUYlg--


--===============0038040148560610833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0038040148560610833==--

