Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1009BC5DF81
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 17:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tt7/9fPqceqtmJN3BMidR/PLt4HHGsV46foU9zPN/ec=; b=yqi4zRLSfVF+lwk9j8wxoTdiBc
	FFxxKgr1qMWS8f39r54KyYT/eY7Kj2if9TQ3ipEb5j2QGahMV8oyX9+8NHc6SSrLwqS2MDHLFOQzL
	+796lG7NWk6UBydHFN/faX768ON1Xzuj2OppCCpOiD2paPYQtzPlJlMj/YaKy9mVUTZb+p7/vpOs/
	vNsuu1AaVxrzFDhBTDHDykbB6RwUSgt3vpvRexEytIi3/4d17QWiTSDZDJ4H2jPsolfSXYYugRnhW
	FXNoZVhASVQN6Nr2p+TzXAxqrBZwxnet9g9Uqu3QTS8YjamhdpVJftNXVaFQfn2nkpWMwVdpShh/G
	6VM/WI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYH0-0000000H8ot-3mh5;
	Mon, 24 Aug 2026 17:15:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYGx-0000000H8oe-2XBG
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 17:15:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CF7E6011F;
	Mon, 24 Aug 2026 17:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FD11F00A3D;
	Mon, 24 Aug 2026 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787591746;
	bh=y+jQX8iGRF9zxf6ir3GlAbpF8oS/QWr64Rgn2fFb4dY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HdNQ8vrf6bbX9kg++osOlIuhRkGzl1huo6GemVtdEsLNe13NkqR6OSfJ5J6RFFoQO
	 dmUck/jnjUFx0/OmXjwnc+Up2+F146tOEbjxdDqx8deTpTTgTh5AuF3mDjxxjnDgrF
	 c81HjWpCgQvVjL6L4rypxwXax+N0mAWKr1t/Bz88QeXhywnbFSm+XbyAUOsJE4wgcr
	 4ApnvUCQ6wxi/3t4cohzX9DixnNALwWjHEcPA4Zs28PIBXuQjA8S63VHThbWdITYEz
	 rQyAL5zHK2bcSx7DCOhISBBE7ct4RdMLDBMdCBYxFZxMclPHYmVO0LvNHf4BrXmTHp
	 Rr/MSyZXnS8MQ==
Date: Mon, 24 Aug 2026 18:15:38 +0100
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
Subject: Re: [PATCH 06/12] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for UltraRISC DP1000 SoC
Message-ID: <20260824-slouchy-displace-c3f65dd5a2d1@spud>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-6-61ab7aebe9e5@ultrarisc.com>
 <20260824-paycheck-luridness-6de48a00a262@spud>
MIME-Version: 1.0
In-Reply-To: <20260824-paycheck-luridness-6de48a00a262@spud>
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
Content-Type: multipart/mixed; boundary="===============7689358857314725231=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7689358857314725231==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pBly7SlyXFqOWhxZ"
Content-Disposition: inline

--pBly7SlyXFqOWhxZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 24, 2026 at 06:07:07PM +0100, Conor Dooley wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

And another case of being too hasty, same applies here. Please add some
constraints for your device.

Thanks,
Conor.

--pBly7SlyXFqOWhxZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaox8OgAKCRB4tDGHoIJi
0rQOAP9moZE+lJgb6oPgBgEZd/NnXh2mbJQ9JlBisNmCK3ELmQD9ErE+hEzGQnqF
m3Uv3/60n8UWdGer9coC71vchvgwIAk=
=w9lH
-----END PGP SIGNATURE-----

--pBly7SlyXFqOWhxZ--


--===============7689358857314725231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7689358857314725231==--

