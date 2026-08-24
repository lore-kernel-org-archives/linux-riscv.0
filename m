Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA85C5DF81
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 17:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpqpUxVO9X3s9rH9q3rcCvEPlxBVhSFpl35HMImYYys=; b=q+ee0eRpCPshrh+Vj37k9jMwpK
	GzOS0AJOmKJ4+faHaXlajbzNgmhURiS2BJfS5evuY3/JbRitphT6DFMYtrCLwwMWtor9bsfouurTi
	y+evTQgaIsLzx40XjZjQ33Y+QDnbGqG2gpsHNnahrwAFuTgGsJ+yeOOJMhBACGYDur3WNl3sfSYFo
	p4keUz4zGWbvCE3BdiU1A1cwI8oZbndbbd8Xf2upP4nJbPXDnl6YXklyTekKghfi9MNLGeKf/JOp7
	N08E3hzptzSczFY0Yn79eOIhnz4Xi1vnZFRcX6TvdtggbMZI3urv4dJz0KXWfgq6uZGEbeYLQCZuU
	qSQJ9kEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY56-0000000H6lZ-1hqy;
	Mon, 24 Aug 2026 17:03:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY54-0000000H6lA-2z1x
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 17:03:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EDD926011F;
	Mon, 24 Aug 2026 17:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6531F000E9;
	Mon, 24 Aug 2026 17:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787591009;
	bh=G4ende/eoSLGEho90gxNQm7ra22ei4NzAi2Oc7rX2x8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HIn+NgEcO83a9spf+othD0fuBD3XjMlfQgyM9ZIOebuVND7H5z/Gh90cF7efDB804
	 aHxQqdro97ffwBzQbLphOCZgK5GCDC8bycOjQBsrb0SzRU5fe9bOUN9aSqGnJaCucf
	 zxzM+iXZ/r2K+y6x1F4LUOZNkH9OYQ90EuQvWdq2+wPnpC0/Xt/4PUUGL8722O4sMD
	 vfKyAA05V1ayM5xKrXQY57ob21Uzz9G90FMSUo6ImjpVEA/45kfxtXUxGU96TvAMCY
	 4LaLcnQwlw1DrLeFp7uT934SW6R6jHxxJfS7rpKuSSZIXY3WAKaird/Gtb5q8Xz4E/
	 j109idqLdbusA==
Date: Mon, 24 Aug 2026 18:03:21 +0100
From: Conor Dooley <conor@kernel.org>
To: wangjia@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH 09/12] dt-bindings: dma: snps,dw-axi-dmac: Add UltraRISC
 DP1000 compatible
Message-ID: <20260824-moneywise-magician-50d8e6ff79ea@spud>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-9-61ab7aebe9e5@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260824-ultrarisc-dts-v1-9-61ab7aebe9e5@ultrarisc.com>
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
Content-Type: multipart/mixed; boundary="===============6855224778714050726=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6855224778714050726==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HuDlyXuePX1vv+S/"
Content-Disposition: inline

--HuDlyXuePX1vv+S/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--HuDlyXuePX1vv+S/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaox5WQAKCRB4tDGHoIJi
0mE6AQDxuqES34FDVU9rYRaZnYR8X63SNXH55rWUuKWbhDaWHAD9HBoKTNBmlCl2
Zg8qGGAo2ZCE7MhOGmxFmInhTHKYPQ0=
=vmBp
-----END PGP SIGNATURE-----

--HuDlyXuePX1vv+S/--


--===============6855224778714050726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6855224778714050726==--

