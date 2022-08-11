Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D452C19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 10:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1SrFpNT16UkCLqyNAo8Wg+M4phvcxkTxXsU7SZi7JI=; b=1hAx4pbsW/cJ206WHkckZPlNul
	esXxe8RlYZcICVsV2dwladoFyb2OFq+PJYOEjLVykZKOmIe3dCdFTXAyrsBbBb0z/h3ajGC5+Qluu
	JIpUHFXZM3jUfr71ch0Ro9r5lJncYw7QZt+Oz+nrkmFHsjiuqg0KBTRClXdGiASDcoE0VPV9Z3QZj
	y75SlaWZIFa4LCcxHi/dbksFytO3gE2tlkd4cPg9/edckQML+qGApNuyLehvVa0NSF4IzbJadq1o4
	pNCpkjrMYwUnr1WbqUXSjwFDJuwTeeN5NOQvA6vRBqLCEgQMIJ6EWcB/DSv6Lorlhtkmzxs6Gw0W9
	XBcQZ6lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM5j3-00BKq5-2d; Thu, 11 Aug 2022 10:47:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM5j0-00BKns-E3
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 10:47:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BD770B81FF7;
	Thu, 11 Aug 2022 10:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C06AC433D6;
	Thu, 11 Aug 2022 10:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660214854;
	bh=4WoU4PzTqSWaKAiYjQxMqeztaU+Fg5MuY24q8LVMV78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aYoM1/Vt15qtgK7KyhfqAX4/Yb0rFlmcFB7dAw2aNMEox9rqxt8EMfPlcNJ0QpfcH
	 dHCDd0nEpUcjZabJF8Uwqd9dlTZnOAP4gyk5yPEihH6/EAj16MJIeG0p2jt112fxk2
	 RO/U8rFO2bu0lYH3Wpunc8Tt14++HrUbamVXLNYTjsvYq+aaLGXHAybzQwT5SJdIe/
	 fRAieTTLS/igvRrWJkjW3k65trDPyWj0axh73bKuh1TZGvD6YRy/SWjg18wHTRmY/T
	 fj7kShu035g5kp6Iy3VczUU7KQA/uqYST4dv0KTTMasskriY/QpBAsm16GjTJXlSoN
	 Tki++/bIG+qFg==
Date: Thu, 11 Aug 2022 12:47:27 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: rectify entry for RISC-V/MICROCHIP
 POLARFIRE SOC SUPPORT
Message-ID: <YvTePwvp5AigV0Ax@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220811070506.12252-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220811070506.12252-1-lukas.bulwahn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_034738_641296_5D8CA956 
X-CRM114-Status: GOOD (  11.29  )
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
Content-Type: multipart/mixed; boundary="===============3580069343630004668=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3580069343630004668==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Fg/PWpkMsj86wcD"
Content-Disposition: inline


--/Fg/PWpkMsj86wcD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2022 at 09:05:06AM +0200, Lukas Bulwahn wrote:
> Commit 3cbd67384677 ("MAINTAINERS: add the Polarfire SoC's i2c driver")
> adds the file entry for drivers/i2c/busses/i2c-microchip-core.c, but the
> file is actually named drivers/i2c/busses/i2c-microchip-corei2c.c.
>=20
> Repair this file reference in RISC-V/MICROCHIP POLARFIRE SOC SUPPORT.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Wolfram Sang <wsa@kernel.org>


--/Fg/PWpkMsj86wcD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL03jsACgkQFA3kzBSg
Kbb9ug//XvIqb1Vway8MBwrhbNGpzOqOcN4Q2c8JUiZ3oNXlBHxMTik8nRbX+JTq
fpafbNe7CRZ1SUyIgKcz/bmagZj3dNS+3oeE9vBOi2fWBGb8xMGhTzNQib6Z+q8m
N6NfsX7y5t7Z/IracHQhhTrVAd8nKRbNnQd9BqQhnGgR/ZJTX6QFzeoF6byhaa3c
wX+SH46dADmYghkFdPRtNx72TlQElL1raj7Lqb7u9tlGF3NgbVQISjjPYbepx8u3
LfRMAYanVCXMZO1tUOfXo2yZakquAl5S//Xmfx4nvpO7IU/hcF6LUVjxtGNPoDdQ
M+n6ctoCtpZkblt/TyExfP7ijZ+cx6bPGsu0fnbiB9KoeU4BcXvPmCHvY8N9B320
6hRucRjlYEHA6M1Cr7OCL7jikLlJtts3qnJoKO6bB3bfADUID4/KekJfeDB9NqYj
oWTeKhF8Ekudd7v4W2+QK/QHuDHlTAW4rJuSp0Tk+6QqAFy9W8x55hHIAqu+8gr3
Jzfb+3Gd+CDT2eXEaPPTBPV3WqX/pSyH9IGfUPSOaQgjVKmLfsda02ZvmBrWoI+b
v9rSEma+xmrtiupifePbvgQcwM9k6WdxG0WblT0fwnKgZSXOya9/cZTUpy79D/ml
f9ZkG9s5+t80w0F6KKRQ82z4s5soiVy4nlAtvbLOLx1Q2YfWAb0=
=edpy
-----END PGP SIGNATURE-----

--/Fg/PWpkMsj86wcD--


--===============3580069343630004668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3580069343630004668==--

