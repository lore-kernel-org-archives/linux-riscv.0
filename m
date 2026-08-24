Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F06C5DF81
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 17:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i64Kd8CHSvKDWvEghtv6tVwtI2hMB8K3lC6jZ6pBkmw=; b=wLwG7C6woed8h2+NGe8e89u3sO
	ptdI8f0Ay2bMu6E4aQVyfIbD+RN/LIYWL5Ffh78Ox3hZGxXgWll4L4NUhQioKAUWSrsTjdHBYKOCP
	vDUHc75SwndFxfD6blaigxqMms9g/DfAjrYGteKVXUbW7ce4hvxaqWh7XnvQEgzl0wBm6jKvHOlk/
	NcKa4BFw6XvHm7B+kL++JY87W4v8NRkX91o1F9cDb2h2+71Pv+Emn0aTX7ng9IP44QZCIJRTibjgT
	wSLw7YXDtlTGElRUW1FxTklN1NnkPB8bjipgNcTDwTW+A5SxV2YDJmtikxeEq9ePToUpxeEvJiG1q
	X4cQCtRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYGG-0000000H8hC-3BAS;
	Mon, 24 Aug 2026 17:15:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYGF-0000000H8gV-0wpc
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 17:15:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B8CD601E9;
	Mon, 24 Aug 2026 17:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F5D1F000E9;
	Mon, 24 Aug 2026 17:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787591702;
	bh=6Sc5Y9vCSGbnpzxV5PcaxCNo/0x15tmyZtQNLFn68Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bhot1lF6tWKfFQjY6mgoobH0Us+PcA8VLqnTpZIXawZaqyOm614zxG3qJt0baUF6W
	 k+jmpqXhcWfmvce8MI2KPylqfYvfRM0/wcZuBtb7IVfBeqYllkGISH07a39ojormNp
	 wPpiS1A2W9NSzQplVM4pbkFVBxQ3yfLpUxJxbaiTElhhX7xo+UTxSgIsGGZk2+pz8c
	 ignWUNVU6gfZgJBlG9ceXQsOyfJarQGF6Lhcma+19uaR/fkEf9kzLue+oigPyKhH1Z
	 kFxmO8Do0/zHKdHIFuEfdidX9aX7RLougmWghGVwHvcuYQYrMtT9WxQCi1XKl9meqc
	 muo/2+4QuEHgw==
Date: Mon, 24 Aug 2026 18:14:54 +0100
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
Subject: Re: [PATCH 07/12] dt-bindings: i2c: dw: Add compatible for UltraRISC
 DP1000 SoC
Message-ID: <20260824-aging-umbilical-8e68cfcea468@spud>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-7-61ab7aebe9e5@ultrarisc.com>
 <20260824-oppressed-jogging-5b055ca274b1@spud>
MIME-Version: 1.0
In-Reply-To: <20260824-oppressed-jogging-5b055ca274b1@spud>
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
Content-Type: multipart/mixed; boundary="===============4959675877538010992=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4959675877538010992==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nYx2eXSGYSMMPrV6"
Content-Disposition: inline

--nYx2eXSGYSMMPrV6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 06:07:29PM +0100, Conor Dooley wrote:
> On Mon, Aug 24, 2026 at 01:54:20PM +0800, Jia Wang via B4 Relay wrote:
> > From: Jia Wang <wangjia@ultrarisc.com>
> >=20
> > Add the SoC-specific compatible string and use the generic one as fallb=
ack
> > for the UltraRISC DP1000 I2C controller.
> >=20
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Same here, I was too hasty - please add some constraints like clocks
being required etc.


--nYx2eXSGYSMMPrV6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaox8DgAKCRB4tDGHoIJi
0gSyAQCaBIW9bAhXt5j3k7rcMtWvFlse2pAXUaOee4/+801w2wD9H2KW+zz7KzT+
CxJhvXEmTdJV1oOXfYdU7jBei/IjUQI=
=p5ke
-----END PGP SIGNATURE-----

--nYx2eXSGYSMMPrV6--


--===============4959675877538010992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4959675877538010992==--

