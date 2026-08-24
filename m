Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE273C5DF81
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 17:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adCETl9WImlmICQKPDabe+Gme+VSDwsYt+9QMoTyUkE=; b=YNgMmEhWXh6leOdYsxeOC9NOLz
	cs4226dlw+oWQbmn/cFYL4GvbYJq8zOjov9u9jztroljMM7hsBpSgeCsC+HzSfn/4grWYlH5Jl9X1
	reIRK0pLNWSZArqlnEpBDnltxz+oB1+WiuDSSD/B8Zb8lNS/bgWGxvKccqbCkkMo+7FgEx0UyAhLP
	lc+UhCQ44KhRGL1deWSf9pjTCmKbU4ezr6VXALmE55svjNeYhuVO04lBxysCAFAV+l9C5GN6c6iay
	OkHJZrFQ6x3bLbtMNKdNFJiW/KFNyrhKMIrJ/MNH9lmeYuSYoMj0FEbWJCj6+8I0aoejIxsa3Ak7/
	8o2QThfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY5Y-0000000H6tS-2D9b;
	Mon, 24 Aug 2026 17:04:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY5W-0000000H6t7-3XmB
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 17:03:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 89EF442A5B;
	Mon, 24 Aug 2026 17:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523661F000E9;
	Mon, 24 Aug 2026 17:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787591037;
	bh=zx6wtmxEDr87XTfq/xXzxMw3WpxfP3T0Uqne9w4Hlic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ARXBbPjbsXyFXA6jl6HmtNZenFpylqyE06MYLgtJNvhX+BvbR8fbXUKmWElbcv7PC
	 UpWhaPRGDNV5v7NJYgz67y72hzRsrqORGU7EokwpDbwzRE1Ey443vy0crfy6wk7nm2
	 8eCYZVUAll50vj7YEevhuuUuSj/jFjnv9wNNvp2XTp+EjziFI/VKu5Ss/P8BkUmlLJ
	 k2gwI6Sc7uqwTf2qc2kkJ7FE4eKKDcRbh0L4YYTIn2T/QaiF29ARLcSL44gECH8sa5
	 htEqpPNgU4uruk6R7ZHCHtrGFLw1XJttbJlXO75blkcafGnwpKouVbsbsvmRo3MPUk
	 3UMJr4vZs/S/g==
Date: Mon, 24 Aug 2026 18:03:49 +0100
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
Subject: Re: [PATCH 02/12] dt-bindings: vendor-prefixes: Add shenrongda
Message-ID: <20260824-quotable-seventy-87597d24cabb@spud>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-2-61ab7aebe9e5@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260824-ultrarisc-dts-v1-2-61ab7aebe9e5@ultrarisc.com>
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
Content-Type: multipart/mixed; boundary="===============8914916333063168501=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8914916333063168501==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VBbgSIA6PKblOnpl"
Content-Disposition: inline

--VBbgSIA6PKblOnpl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--VBbgSIA6PKblOnpl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaox5dQAKCRB4tDGHoIJi
0iZiAQCeCX+ycV74wI6lO/DGRbMc0Lct2DjNjwwPxnjzu+eV0gEAqvQWiC9T/47a
gCnhsQ6WaUYzlErQLhp8EkAg+acPmwg=
=M/rF
-----END PGP SIGNATURE-----

--VBbgSIA6PKblOnpl--


--===============8914916333063168501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8914916333063168501==--

