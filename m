Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0C8C46CCD
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 14:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PL+Y4CCzt4yQl3FmhKKA+Eu+Ij+n7hNLJTXAjRTf1Y=; b=NSgI9/Y5WCYtpg04C/MvE6LXkP
	Z4abJLMXoVqxFKpKC7KJqIMgP5c7t73oSfyKBCCtAQSbb2VWP/OkkERwPVP1GZZ5mB62a8XynhR6I
	pwB96uesqBTmB3v7kExZPKmCZH5T+uH05TsNRhvY3D1BeLrsnled1FlkzY+syO0XufFCWMZNnXBRY
	KaQ2H+DpSfn+0LgPpI91PCWyaBbN/OU9Ts6RK7j5oaGKGVWa0ApZtKOJY4APnuBj/jy+U1MtJUcd+
	2hVlLg8JSGuR6U2de72j+RdA1lqdtnvyvPxGGmPzlGuuOJJkcaVF6PyPFqFBuJ7ZyT34CNPE13Z+/
	EMJbTDRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFF5k-00B7gj-1c;
	Mon, 18 Dec 2023 14:59:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFF5g-00B7eG-2C;
	Mon, 18 Dec 2023 14:59:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 98E75CE0B2A;
	Mon, 18 Dec 2023 14:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30277C433C8;
	Mon, 18 Dec 2023 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702911568;
	bh=+s1PxLoBbDNRFaBMX1KOfgXL4tbGv/n20FEjafyPq/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mSbBcYtIEC/E7RqBQIzkCxec5TKgazZsWXYPY9+enwlKZ6OrEtXBMl8SgdPgJxfni
	 krjGAU88aSHxxRA9x2MosUdLH2JQEF3QyLCBsR4LT//axdCB2DPmzwqsq8FQ9OuVrQ
	 9FLgC5B75iasJpQCBSSE/PM26xfwWhdbZy81d6LhGHghtD+3r8iDWC07xhx6g+gh4p
	 h1ttAeppZzSTCNU8XIlDlD1c8K//wMRQYcfd1poIbVGlHSBJGByodmP+Xa7zynYPx7
	 dKgH4hQkK0Ik3hIiPZyIbjUigosGJhLSxyisitYnEJ+EFf1Yf/bmYq+R7HPmtThshI
	 dXPcLYPG7K52A==
Date: Mon, 18 Dec 2023 14:59:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 2/9] dt-bindings: net: starfive,jh7110-dwmac: Add
 JH7100 SoC compatible
Message-ID: <20231218-snowcap-charter-f8c75312eaa9@spud>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-3-cristian.ciocaltea@collabora.com>
 <A7C96942-07CB-40FD-AAAA-4A8947DEE7CA@jrtc27.com>
 <65fd52f1-6861-42b0-9148-266766d054b1@sifive.com>
 <6c62e3b2-acde-4580-9b67-56683289e45e@collabora.com>
 <20231217-spray-livestock-a59d630b751e@spud>
 <fa4b9c1d-6033-4b35-b03c-e03419edb5dc@collabora.com>
MIME-Version: 1.0
In-Reply-To: <fa4b9c1d-6033-4b35-b03c-e03419edb5dc@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_065933_187587_125B41F7 
X-CRM114-Status: GOOD (  15.77  )
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
Content-Type: multipart/mixed; boundary="===============0580663081687264207=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0580663081687264207==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xehaJyWNZIrFr2oM"
Content-Disposition: inline


--xehaJyWNZIrFr2oM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Won't this also relax the naming for all devices that allow a single
> > reset, but expect the stmmaceth one? I'm not sure that that actually
> > matters, I think the consumer bindings have constraints themselves.
>=20
> Before commit 843f603762a5 ("dt-bindings: net: snps,dwmac: Add 'ahb'
> reset/reset-name"), the 'stmmaceth' was the only possible option, hence
> there was no need for any constraints on the consumer bindings.  But
> afterwards it was allowed to use both resets, hence I think the bindings
> should have been updated at that time by adding 'maxItems: 1' to prevent
> using the 2nd reset.
>=20
> I could fix this in a separate series, if it's not something mandatory
> to be handled here.

If it is not introduced by this series, I don't see why it could not be
handled separately if needed.

--xehaJyWNZIrFr2oM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYBeSAAKCRB4tDGHoIJi
0kaHAQDOEcbXi7+qAEGh2DmnasVoZMuRlaf7aM8UbL0TedMfrAEAz4ujNDzOgg49
iA4wb0r9fYms/C/CCKtbwb34l7U9Wg8=
=8B0i
-----END PGP SIGNATURE-----

--xehaJyWNZIrFr2oM--


--===============0580663081687264207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0580663081687264207==--

