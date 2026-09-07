Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEFEC79F99
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CfOmpg5A7WgZJeDGmyDBewy/FicDRzzF7O8OOenEj8=; b=o87voShBRca7yL8k/wOfqAsc/L
	15UtW1rFSz1lmf/DU0s4vUwMzarKtJoQuj1+y+CqwEkuFuO1Bd0JU5izufkrxJ5jjhGv4j57GdjED
	VoCz15DajrugPLBTV/bSOQHCQFPrnCF0tVNCWA8s+SerZ5NZsMw4Ad1+wR0Fef8UNyXWerKAO+kIv
	NYlsFAiT0xeNF2iuA+g4OZBTYR4WJYmz28geBIKtBaOExdTPK4i/+oNkeJfhJwkjmF0pQ12DnkPdf
	vGZlDfY52SjMq71qrcJM/7vo7gFSZEsAZscNa5DZCnqJhga6ChvpJPjtScjqC6R1SV9L/9X9kdl/R
	RXNZb3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3dZS-00000007WzJ-0Cpd;
	Mon, 07 Sep 2026 17:55:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3dZO-00000007Wys-3gcs
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 17:55:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A12E4439EE;
	Mon,  7 Sep 2026 17:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C281F00A3A;
	Mon,  7 Sep 2026 17:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788803750;
	bh=zFwZ3aTuoG6l+JlOvi4Rn1XMOdYQDYfEgriG4skJbTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cK493fxywA8XFTOxG3eZ/rlNaeOOXkIUPItPfxPqTJOZf6Yb++DEBM6Ke1a0JXhHW
	 mlZCW7U/B8OI3MNwWomDSQSs6vkRejRnsgZxqcF9AodbQTFB49yce0ZzFbjLZPS+aU
	 GEpn68UHD4fOLIfqrE+ANtQ/0tBex3X7aQCizLghHidAOlPbAXfPXz51Qa+E8vg0FA
	 bFzMAoZbgv0OU221WIzvQETlxIr/AZ6AbrE4depKbKZa8pdf8wF57UVJ5AJpY9+OrS
	 /nczJxX5PGv4FaFrQKt3DeuKjZN3nOcezh3Wlabo4IggzELtwycocnVhhE38ATxMMX
	 L9xA66gjKdpCQ==
Date: Mon, 7 Sep 2026 18:55:43 +0100
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
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 07/10] dt-bindings: dma: snps,dw-axi-dmac: Add
 UltraRISC DP1000 compatible
Message-ID: <20260907-dash-valiant-80719d39c13d@spud>
References: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
 <20260907-ultrarisc-dts-v2-7-5eb4c97477c5@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260907-ultrarisc-dts-v2-7-5eb4c97477c5@ultrarisc.com>
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
Content-Type: multipart/mixed; boundary="===============6887419036100245958=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6887419036100245958==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nfvFzp1kLlzNBImv"
Content-Disposition: inline

--nfvFzp1kLlzNBImv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--nfvFzp1kLlzNBImv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap76nwAKCRB4tDGHoIJi
0hjzAQD4g7slfKh4B+IH2bYyZuLbUUWCwQd+pppRBZeItD+R5QD+NNBkXVmmVTny
IKYWMhJEYSx8VRzVDMtzOvfad+AyXgk=
=dsHn
-----END PGP SIGNATURE-----

--nfvFzp1kLlzNBImv--


--===============6887419036100245958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6887419036100245958==--

