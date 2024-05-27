Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BBFC25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 16:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xn5sk8CbrarxOlpkdlcvV5iyZWMfq6b6xe3aoFLpqkw=; b=Rcz21h6M3Ry4Y2u7eeYmLjBpqw
	OdpeZULiiSRv50ieYSjLq0xyJL3zZbUDS17Qs0CmV+a01lJxYfoFIpivlLfdJ4pWflY+GwEc4b/e5
	NESOiapBnETeSeZHvbIJhbi2Q7uqH/K16ghYPyLT3feGOGmpQSZPlkCllXen8bzVTnOPLRwIeAgX4
	7DVYsFsivIIbsjDA4Z9zhQ8kuxhMhUGIZDJS4PX8PdQsmi5PEwVmA5cQQNXTD61savcXD13SRc+d9
	/PLy7o1YAfRmfB74lphY1rq6e+/whMbcqzfxMSoJoVOT5YFl3NDuSrxGXswWiJC+LoLAh/p6CDFc7
	urGc0Giw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBdOc-0000000Ftdg-2ioI;
	Mon, 27 May 2024 16:40:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBdOZ-0000000Ftcl-2Y4p
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 16:40:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EAC48CE0FA6;
	Mon, 27 May 2024 16:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22A8C2BBFC;
	Mon, 27 May 2024 16:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716828021;
	bh=7iZ9vDuxB849murmlJ92FXc4F0iO2D4qSBeHgvVAro4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ruHCRjHtggFppAV5loUV9K5CgSe2B/hiJz8/R6e0ejS9kaOgpgMDne44EVGyBnl2o
	 qosTJeJ47+2Tm42o2MqoQkGxcJ9GgcK7+wDX5X80Ey63+6EW7pQVoiM6qQ/OSuqEKU
	 CfsiM+Pt86y1ikiji+KSP0/R2UAxDS8TxELSDq9SXjR++f43TFfd3a6ulzhYp2XeR4
	 ivgFcnCGvoVW8QZPcLIt0o8sdnE/LgxZ41owCg4E7AXpPcuIpyLhXYXEcYR9Y/tcBV
	 CitzQdZmZxQkClGioo663FgDUq3t/gHCGx9DW2g3PpMB881uL12pO2TWErljb3KsuR
	 Dk414q1kOrRzQ==
Date: Mon, 27 May 2024 17:40:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/5] dt-bindings: riscv: Add Sipeed LicheeRV Nano board
 compatibles
Message-ID: <20240527-backspin-sacrifice-7df47c7378e4@spud>
References: <20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com>
 <20240527-sg2002-v1-3-1b6cb38ce8f4@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20240527-sg2002-v1-3-1b6cb38ce8f4@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_094024_177942_9FC54E95 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3353641563284375712=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3353641563284375712==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A/6qWgFT6Jr3Mu1d"
Content-Disposition: inline


--A/6qWgFT6Jr3Mu1d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 12:28:19PM +0200, Thomas Bonnefille wrote:
> Document the compatible strings for the Sipeed LicheeRV Nano board which
> uses the SOPHGO SG2002 SoC.
>=20
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--A/6qWgFT6Jr3Mu1d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlS3bwAKCRB4tDGHoIJi
0lcCAQCUgoKLVC/COJkYlJlldDCP/R4Q0iLUk2+4Cs21V7FVCQD/cyBEclg2lqzt
mxBEHKb9q3erNPFWJAGWNWj1KKQ7hwA=
=NreR
-----END PGP SIGNATURE-----

--A/6qWgFT6Jr3Mu1d--


--===============3353641563284375712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3353641563284375712==--

