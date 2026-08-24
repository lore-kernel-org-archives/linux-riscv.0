Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C98C5DF81
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 17:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0UHAms/sozyuL1jllkdygrNpOv4OzYgtRZ02JddLkM=; b=q9B9t8AirgZbQ8wceJ0zjtDMTR
	+3Y8eIECtv6vEsCA5tinYJrXNOjwACu0u7vB3ltFv01JoGYdLHbwLct7baFs0cc0rs7qpgq+TRSmy
	i8IgohwPdjqVA13jqk910y1n+PJ6H5xvimoXBuaqfhkR7zoLae2ZZVpPUKBLWYuE9vyBe2e4xtH9P
	5qHbacDaeRuW37Ic1fYfWJfs+4WJTj3SVWSLcoPgVTuvfO9sgTqQumIj9mOEJBsr7qpJ0qrhVGW/a
	NGz527M42zVt3ja1OgMR2DUMzm5icvZnvzn0JPLJyt5tyJEwI+YdPFr4MMfIcB1LCz0uiCNqj8V7Z
	S+zdBdOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY4d-0000000H6az-3870;
	Mon, 24 Aug 2026 17:03:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY4c-0000000H6an-2vaz
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 17:03:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 73CC441649;
	Mon, 24 Aug 2026 17:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EACA1F00A3F;
	Mon, 24 Aug 2026 17:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787590982;
	bh=Sn3NQoSJzme6L36GWmLFTgLStTVci8FzNomPEM0B8kA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gNgdcvcIx8a+a5bYeU8B+fnCWUfUncnAfuZiekiUAceIeDGDCFrW3N6hWSGkZJal8
	 N7zzKfe3co6R2YMKW38IE/yyX1yUx0RNgAbKV9H5gf2vUSPQsvPlXiuHNFqd/rdoCv
	 jOQV8xOUfI8Py+cHAniffUfVAQZrDWaqoEqFxCYf7TWJXgBJdIP4ejXV3sVKu2svob
	 poU8QxyvF4VQzWLEjlsY1mWNXUrzXI3P9ryT7y0zE8wOc2AzGgwDmBeYxc/P/l5e+R
	 rf6SeUUFaMMh2kcrsgmnUpHe8t/zCQeOjp5aabgxkGivsHn/PehKN/Ip/sNw0SRnv8
	 lUmjVHFv2mjgQ==
Date: Mon, 24 Aug 2026 18:02:54 +0100
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
Subject: Re: [PATCH 03/12] dt-bindings: riscv: cpus: Add UltraRISC CP100
 compatible
Message-ID: <20260824-retry-line-91ca75e4697b@spud>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-3-61ab7aebe9e5@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260824-ultrarisc-dts-v1-3-61ab7aebe9e5@ultrarisc.com>
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
Content-Type: multipart/mixed; boundary="===============4839119816670543041=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4839119816670543041==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZxiAF7oUeylrgdrp"
Content-Disposition: inline

--ZxiAF7oUeylrgdrp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ZxiAF7oUeylrgdrp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaox5PgAKCRB4tDGHoIJi
0sDrAP9XKwIBEaR3MpxaxdfbOGBHs01AvWxiZMtJrBwMXqdaIAEAipE1uMvHlsAh
TWL/wBRbELQlrVyX37Va7BNMl5rYxAM=
=EULM
-----END PGP SIGNATURE-----

--ZxiAF7oUeylrgdrp--


--===============4839119816670543041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4839119816670543041==--

