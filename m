Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3247ACCFA05
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rn9rUVAaxoXIPWDVZaZ9Sh3+L5KoWw4zOvqlV178l38=; b=eX9cN5ANXW1yIfAenwFTWf56kV
	eevR8tiCPHncLIoCNJQ41m4o97eFHl9vEI5J6hWRn0qmmpraMK8DnwMIziKAqfHHgcZe2CgxhoQXA
	vj9jlgtQd2AJHsyHwKuWDgEd8NkygEU4Gqh2qZohLniozrhusSp0O7Mhi8obkzYgtXOK2msXcxX+m
	3uSd68TOAsgG5iN/nqGHAI+BBQeHozlEf5MpCN6w68Ul6whNUhxUc4P0GBrP2S5MhlCS+mjdH8Uy+
	muWq/qSQ9/tHGtTjY1HDUOc9hY5gxQzSMl+jeCxlHzhaYqsZY8YxcqaJmfejocT+UYd7SEVLXAbyS
	R4xYwz0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQ3T-00000000DOb-14nM;
	Fri, 07 Nov 2025 17:15:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQ3S-00000000DNv-08BH
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 17:15:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3464561918;
	Fri,  7 Nov 2025 17:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668E1C2BC9E;
	Fri,  7 Nov 2025 17:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762535716;
	bh=wROMYKg2N1OjiujHzH/OALnykfRakpiHN3hWWRaj9DQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e/CxTtZJ/D87CBIw/f3F/dg+S7KD+lIqG2aknSC1mS6Q6YKlcVmZEXM050harUpZ0
	 CTtSRbs70TkSHCO9MVS/uLfJfelrwUGKJfQ4GsrEEJ+67x556cv7l8oopZDR7Iuw4X
	 eDhfZVdzvsUejoidssQhBp9ozWuh8HH3KYf8HcgWp4EnRuiYB4XUJ7sy/hUPvrPr9t
	 aN+9qTkY61ZdBbwQu5qAsX9J1QPWGzU7sYtNvIAb3ISF7tib8NwHDB1H1+aZzZpRag
	 m9kMXcx2WeWhJ/gFlCCYhdhuAYJCv3rjvOVoZhm44qng2f4sfl0YqjONvk4ZZvyeyk
	 LY2CP8GwwygWg==
Date: Fri, 7 Nov 2025 17:15:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>
Subject: Re: [PATCH v3 3/3] spi: add support for microchip "soft" spi
 controller
Message-ID: <20251107-emit-slip-b1ab5f7d5591@spud>
References: <20251107122104.1389301-1-prajna.rajendrakumar@microchip.com>
 <20251107122104.1389301-4-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20251107122104.1389301-4-prajna.rajendrakumar@microchip.com>
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
Content-Type: multipart/mixed; boundary="===============0587418032686344391=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0587418032686344391==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wc23uQNPEgglFmMF"
Content-Disposition: inline


--wc23uQNPEgglFmMF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 12:21:04PM +0000, Prajna Rajendra Kumar wrote:
> Introduce driver support for the Microchip FPGA CoreSPI IP.
>=20
> This driver supports only Motorola SPI mode and frame size of 8-bits.
> TI/NSC modes and wider frame sizes are not currently supported.
>=20
> Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--wc23uQNPEgglFmMF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4pHwAKCRB4tDGHoIJi
0n6GAQDgNSLwY3dMGjRyvG52Ssh+BfQDNYV/qknCblCQ2pc1uQD+J9rpCjsz1X12
HuGnNEZO8BVKo3bchTzlWFUolLDK3wk=
=hcVO
-----END PGP SIGNATURE-----

--wc23uQNPEgglFmMF--


--===============0587418032686344391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0587418032686344391==--

