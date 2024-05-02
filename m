Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BC4C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 15:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZAagpMg24YW9YSgROTrsxlgrFCV11HOGh2JocjspRQ=; b=iEjaxnWbup8Mp8rDw1I/kC5AGY
	v+SLKfsHvLwEtOM/T8SBRWeq64XbUxvVuO4Z9p19onBG2MKeNG1PuMDS1zwTwh4DJWMzr6eHungxC
	YCzXUf/Vg0AXQ51wnfQP4/vOS0mw2YKDYr40OIfP4qxF0EHZid6SKtG5tZfedVrMP0PWRYMtLfK0T
	Exvf1dWhSTMt5mVPDPjb7mdI5bVR466vXyAkdQ2lXzCWxf7637tojQOf6PwCAJggeMExRItngx1mP
	C0xNdLhkWhGw/S9oEC9AXI3mgkVgg8mYBi/hZINHQxNxmseHmfHp+R2wsVSfZ+uJZCw9glHndqzMp
	RHP2HQVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Ylp-0000000DBxK-2Cqp;
	Thu, 02 May 2024 15:54:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Yln-0000000DBwz-23aQ
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 15:54:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CC0A761B6D;
	Thu,  2 May 2024 15:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48100C4AF18;
	Thu,  2 May 2024 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714665290;
	bh=r8OebLc96WPRSNwChpSCzfDAiTtMCUd2QwenhT091WU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lAz1pkl9vN871eOe7gJHmVTMqyHlEPwkjJMl35emMXbcf5KQco7Sehm/W0WiUp8Cf
	 nX1rs+1d4p2hehVsxE8K1frzjYcHcip1FBf07L04Xl/02GKdoMjHIACieKABotDVrq
	 UE9jUY2HhnHOtWhLFGF9GMMcNqx9aWyH5xg328jEDxm1ba6PcYH9ChrN0rvAptopOX
	 mU/IFtYIlyvG/L0cileCrD7CnJxOgYwREqmlPNwvYrBh0SgEh2VPayg727pqCU7L7N
	 CMIzuUwuzGNZ9yggBU+M8b7/TJUaIlT1QHiRy8vmOWIekBSL1SYa9bz5yz7SL6YDu3
	 EylyBEet2EpoQ==
Date: Thu, 2 May 2024 16:54:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com
Subject: Re: [PATCH 1/3] spi: spi-microchip-core: Add support for GPIO based
 CS
Message-ID: <20240502-produce-gallery-3b8e17db9c01@spud>
References: <20240502143410.12629-1-prajna.rajendrakumar@microchip.com>
 <20240502143410.12629-2-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240502143410.12629-2-prajna.rajendrakumar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_085451_610110_CF2E0ACC 
X-CRM114-Status: UNSURE (   9.58  )
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
Content-Type: multipart/mixed; boundary="===============0711984010414731476=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0711984010414731476==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RFYwY/Nam1P3ueHY"
Content-Disposition: inline


--RFYwY/Nam1P3ueHY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2024 at 03:34:08PM +0100, Prajna Rajendra Kumar wrote:
> The SPI controller within the PolarFire SoC is capable of handling
> multiple CS, but only one CS line is wired in the MSS. Therefore,
> use GPIO descriptors to configure additional CS lines.
>=20
> Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--RFYwY/Nam1P3ueHY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjO3RgAKCRB4tDGHoIJi
0kPSAPiTRfo+gPE5ctQPx4+xDZ6kHdX4imtKH396RVtO0xx3AP9rVc/Jkfpg2Nrw
o7xTU7ZdJcc06vss/e1NxTwDdx7KAg==
=R2rj
-----END PGP SIGNATURE-----

--RFYwY/Nam1P3ueHY--


--===============0711984010414731476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0711984010414731476==--

