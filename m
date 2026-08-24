Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F93C5DF9C
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 17:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/qsRJ7Fvbnt4zgMZ7xfwoXF71vSVLZ4H2PKZNRLi+4=; b=0RAsOcSCGmlosY97hNxhQ/1xPZ
	eHgbaxX0sDSYHylLgKHyspsspTJVDPMg8eADi+SgRhcZrvIoaFAf1q4ro4+VHcF5QxBVWaea/anod
	I6EBo/lOeewUDlIuUbV1/D/8gQm2MKY3oy9a9WIjXUaToml6hbX0O5zNejDgRgHl97d5gbBIJnMid
	wRDUyJki+zejJv6T4h2A4XRUVUqNR+zq4lBSMlvPjEQ88wb4j7k250Zcap1DhQe/J8sI8aAg5Kc6j
	wHRz6Vf4BUlCnF4Glg8/ZnVl6LtrF7VkJkxGwJLUVwR3n9zDDv3Xl45h5nJwMAGJVhIn0WK6BsljL
	sdG0iZ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYDM-0000000H86g-0gjB;
	Mon, 24 Aug 2026 17:12:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYD8-0000000H85j-2ySl
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 17:12:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DE6643876;
	Mon, 24 Aug 2026 17:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEC31F000E9;
	Mon, 24 Aug 2026 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787591510;
	bh=QmBjA/7Pt1CAISLRFjIkOWVfg1UkXdlPJNuR6XK+ZI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H5WLLDoiYxZpZevTMBEtekNp/E4YQuVXOvH7GIKxU5Cd60LI+LGLd9OF1+0mQwGNs
	 80ZStiLwXTcIh3HDiR2Jp4auVgov60TK9aCuuYqBY9fqHkaT/uQb8ddA3ndkpjSQms
	 zEU3Fk/7++L95b0BdXucGakOCQA4q0pyVhzDzWBwe2y/g5qZxx6r/zW2trwnWlzMZu
	 Z7sbfePhudhjELMTp4wbt346JNJOlifhKAnYc4oC1Kqp1CmMGO9Xq87Dl2TxFSWyk2
	 AwDJpXJd8CQn4i0sHuXGB+R0R3z/MBc8cI8qN+GdSASZpyiFFtZxGqlMKSGWnoAR1b
	 WbHRkNv3PvJzA==
Date: Mon, 24 Aug 2026 18:11:42 +0100
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
Message-ID: <20260824-throat-arguably-779a75446a81@spud>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-9-61ab7aebe9e5@ultrarisc.com>
 <20260824-moneywise-magician-50d8e6ff79ea@spud>
MIME-Version: 1.0
In-Reply-To: <20260824-moneywise-magician-50d8e6ff79ea@spud>
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
Content-Type: multipart/mixed; boundary="===============7913319290307709326=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7913319290307709326==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fyl9wjdcdHZIWmh8"
Content-Disposition: inline

--fyl9wjdcdHZIWmh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 24, 2026 at 06:03:21PM +0100, Conor Dooley wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Actually no, please add constraints for your device.

--fyl9wjdcdHZIWmh8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaox7TgAKCRB4tDGHoIJi
0hYUAPwO50AResC409Y4PYuHIKXlDGt3GpoNlAXU3Da35Ms8BgD+P1vtliOEQ7EQ
J4IiOM+kQiLdUSwMHFqSCHhxwvBtQgs=
=owuq
-----END PGP SIGNATURE-----

--fyl9wjdcdHZIWmh8--


--===============7913319290307709326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7913319290307709326==--

