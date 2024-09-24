Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE87CF9C6B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 16:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umsSA0Q2z7vdsfaqpRFOrmC2jnEy2fRdGNtR2SijOnA=; b=Sf85T0SRuK2S76CWkLYR69rmjb
	5zXik2DgeqKw8/gF5W0s8hMjMGGoWj44UW6UEAcogdPY9qq0lR3z55NcVHTtjhvm4x1+SiyUxUOxu
	H6ogIM5kPiIZN4QftgRxzZ0+ZN3a9sVBs/y4girYLhIRkL/pImpRKc9t7ZCe6u7eXy2qvb1rOZHEo
	mjyQF1iVW+zy6v0FH90F3u9SIIHf+J+B1MnE34VwDO3Jco9FK5+jbZWxyrXql0NoBIBuWjw9pYYks
	Mqsy3uJjcNB3MdLy+M1Exsb9wOTgHPAA6CCOJrboT4rV7j60WanUIY6YwIY3IVs7VFzC5VK2oPBD0
	XWqc52gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st8TI-00000002qx5-2mG3;
	Tue, 24 Sep 2024 16:33:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st8SW-00000002qhi-1fca
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 16:32:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D7945C5B7C;
	Tue, 24 Sep 2024 16:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F86C4CEC4;
	Tue, 24 Sep 2024 16:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727195534;
	bh=oryTiLrzqpBideC04Yo8+knXVyCH+BqfydoGzD6x9G4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gKt/X549n1d8+xpD6mx1F8WAqmaI638ga64G9N4965FKL/Af8uth0kpwRlMGogb5n
	 79w48rQHXcEA9G1YZhRCz70CvDx+AQNPcbk6yXdvMCEGyaNW+PYzgfJ+eZvKCor5FR
	 l6PacQwukJCLZTU/fZz8iAdFTijpoVwsvRlAIODmLcbhNmNZ95TRoRBxLRBQxwSzrT
	 wfNX4gPLAauSclS9EJeG62yr1ywft746TJmaild/+9D6MK/+YY+IqoXC1dhtqjbqpO
	 Ncv4ak9m5zX66pbVLXKv91HMxS6MnAvzaSuYvsJbPgoI6wPQErmUBzbf5tKCLw+FoV
	 Bkx1ZZ9lL8eXg==
Date: Tue, 24 Sep 2024 17:32:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <liujh2818@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junhui Liu <liujh2818@outlook.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: reset: Add support for canaan,k230-rst
Message-ID: <20240924-amicably-deserving-6e1ab5da11af@spud>
References: <20240924-k230-reset-v1-0-d0cdc11989eb@outlook.com>
 <20240924-k230-reset-v1-1-d0cdc11989eb@outlook.com>
MIME-Version: 1.0
In-Reply-To: <20240924-k230-reset-v1-1-d0cdc11989eb@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_093216_531329_D84C6B94 
X-CRM114-Status: GOOD (  11.03  )
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
Content-Type: multipart/mixed; boundary="===============0903911527486425978=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0903911527486425978==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ACDapMgSuw0TQGYv"
Content-Disposition: inline


--ACDapMgSuw0TQGYv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 02:00:40PM +0800, Junhui Liu wrote:
> From: Junhui Liu <liujh2818@outlook.com>
>=20
> Introduces a reset controller driver for the Kendryte K230 SoC,
> resposible for managing the reset functionality of the CPUs and
> various sub-modules.
>=20
> Signed-off-by: Junhui Liu <liujh2818@outlook.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--ACDapMgSuw0TQGYv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvLpiQAKCRB4tDGHoIJi
0puaAP0epM/2Qkp4MI6TZwm7MYSYaxwTef9ENDnrZDvp1Ld6UQD5AU2PBJAICCDw
x8InvyIg9n6tlZCISb6hGJdMdSJurQE=
=WXPJ
-----END PGP SIGNATURE-----

--ACDapMgSuw0TQGYv--


--===============0903911527486425978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0903911527486425978==--

