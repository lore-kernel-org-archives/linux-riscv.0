Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B356C5DF9C
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlUm2YvjlMXbZdF5GhTHz+6fkkFX+AulmE4mp22iVw0=; b=QWiISFQjKSh22UJisArU8YNO/1
	m5fsQVypJT86/US/GYbubjJus9XXtSAW8HVQj0bgSo6f14FCSlxHtcUvvP9dHXSOVgM0N4A+RODq4
	+6RPLwLshQYlrl5z9crfFgf9sVPYTAEgU1FNrLGbuSE9Oxv8Xevzh/yjS7+DIxnL8q/XuF5mIxbMB
	8q5zPEGLPu6oStuzXx9q9met24BfFCyhu/+QzyktUQab+BRLcQ0dj8eMXQF/TaRPN8R0Ody4AGmfF
	y81Uq3O5IgEh7Pp61agSW4c7Xx9qkfF7Nb9W+xtvdptINY41mNZ68QUPiXNDzZ+jp/eCz5L7y4XVw
	3iOp0SWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY6s-0000000H7Hc-0pgE;
	Mon, 24 Aug 2026 17:05:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY6r-0000000H7HP-0U0J
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 17:05:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C143C43354;
	Mon, 24 Aug 2026 17:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2391F000E9;
	Mon, 24 Aug 2026 17:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787591120;
	bh=V+HlwEGMztP9hq5Wdb99DLJ26ljUC88APb9lq0jwsnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cqixNsBgUNffSQfBMYbRlWVQuvJsYhSuHkgZPafvzIYsqwc+wzKVJjZeJjMQgcVGW
	 VAIQgEITrVFLvyfkhu23BK4ZuASmU7a9eDYA0nYduGplOrgMq3/g4FcZfbcLOqeBym
	 wVjDGwAS8yNJ2Qq30kHzfgch+htWFbuT7/HYU/E9n0+FHcxaY+Ul9GgeMpysjsKemN
	 vtYf6eYtCjgEoKjejr2UZF95JHCiHgcs0nvK2cjhPUKO/L33fyMkVLFg0az9+q2zvI
	 Bu+Db0EC32vUVm1+O2r6HFqQTqc89JP52bwEtGhX/I1VaddasvyuxBym9znBoihloC
	 19VmhKRqAYSMg==
Date: Mon, 24 Aug 2026 18:05:12 +0100
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
Subject: Re: [PATCH 05/12] dt-bindings: timer: Add UltraRISC DP1000 CLINT
Message-ID: <20260824-pellet-trailing-31f6e54eacd7@spud>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-5-61ab7aebe9e5@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260824-ultrarisc-dts-v1-5-61ab7aebe9e5@ultrarisc.com>
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
Content-Type: multipart/mixed; boundary="===============8690303888958056007=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8690303888958056007==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="odfjFMtJIeHsFJs5"
Content-Disposition: inline

--odfjFMtJIeHsFJs5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--odfjFMtJIeHsFJs5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaox5yAAKCRB4tDGHoIJi
0vmZAQDxz+Re2YDaSHq+n+Jl18vTflYxCFxmy3VOXx5r8jXv0gEA8ZyEMy2fpXMo
88b25Q7ZyEjCcQToWcKoJJFmVtAp2As=
=sFIq
-----END PGP SIGNATURE-----

--odfjFMtJIeHsFJs5--


--===============8690303888958056007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8690303888958056007==--

