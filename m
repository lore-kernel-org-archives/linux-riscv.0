Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE46C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 19:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gskKUmFYnHTTHsdvnq9emMDjhMWRu+okWoy1L93jJkY=; b=TnlTqMZsw+VTi30N1XEQVadUzO
	QrkJ4wvz2BTKSPzAdUQdGBU8X6VMPEVY2vW2156wqvXjWiTFVy60rZVlM8uauQo/C3oO445ko4TXO
	09/TmPDJvzeQZKHqLO23jN20B5LzJtPS0IonpYISSN45/tlmzo0QHaOnKavZ46DC3QdKIfFAfWU9U
	9nB/2ZlcR9SQWqFesrOtmW4jjzExBi9N9T1D6XNyBXdcnPDpUoLfaEwTkmz3VkqR467DkXmoO3gKI
	LJ6u2WsPhZtO3OA3Baoepdpvp5+edoGuapeyLhADAxXOF9GPdsz/8f2Nwpf/HDD0Cwsu0b2rlcAWx
	R/jK1AvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Af6-00CChK-TT; Wed, 06 Jul 2022 19:26:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Af4-00CCgL-BS
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 19:26:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3BFAF6204F;
	Wed,  6 Jul 2022 19:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDEAC3411C;
	Wed,  6 Jul 2022 19:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657135568;
	bh=B7KWI+zxs/Q0rPLko0afLemZyMmjeukiI8Nhzv0WVnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PoosFBY5mA6HuAoVuuVa3eADaT24dr8FOlzQ3uiq2V7JbvufXQXgc6b5DYFzXAixk
	 KI0qXCYKEzhTobeEFQ7tmcVEyQjXdKE7r5EcWHYIorhqGXOXA6DI9MVSCJ5cxnklLT
	 WC9jUlxO1Tg3HL5MYm2wE3XFcr4UJh4iK+bWxm1nS9q6/jHj181LOKhxaXRG+2Tx3i
	 L/y+O3ngdLToGFKigz0aNi2vWNlEEkIue5UUwcA45R+30UtQwJ1CRXjT5SPtqjx3qc
	 tDoip3gRLC4jlzH7xk7Wxe8w3weMb5Ndf1gERxxaQoe7GAlTN/tlpCQFW6T7zENuzb
	 K2+E/hkMJGOKQ==
Date: Wed, 6 Jul 2022 21:26:00 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	daire.mcnamara@microchip.com
Subject: Re: [PATCH v7 1/2] i2c: add support for microchip fpga i2c
 controllers
Message-ID: <YsXhyB9GrfUQjy4n@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	daire.mcnamara@microchip.com
References: <20220706141313.2504237-1-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20220706141313.2504237-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_122610_476633_07732B03 
X-CRM114-Status: GOOD (  10.18  )
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
Content-Type: multipart/mixed; boundary="===============4533881624103232263=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4533881624103232263==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3FVpZi6DzgGOTZib"
Content-Disposition: inline


--3FVpZi6DzgGOTZib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2022 at 03:13:13PM +0100, Conor Dooley wrote:
> Add Microchip CoreI2C i2c controller support. This driver supports the
> "hard" i2c controller on the Microchip PolarFire SoC & the basic feature
> set for "soft" i2c controller implemtations in the FPGA fabric.
>=20
> Co-developed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Driver looks good, but what about the bindings? I shall not merge the
driver without these.


--3FVpZi6DzgGOTZib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLF4cQACgkQFA3kzBSg
Kbantg/7BJmcaf7bvoLocUXjekKA9gxizf3QtabqYBIeWT7MBMc7uhgMfPGAEUl0
MDuwfoopJsEdBsCV+OcCoL37T/7J+rJXFDoHbuDm6Uet7UkfMB7Am1IS+bl+EV+a
TvTdxUhGSg3fwHORjaa9xiTxdzCPxn80NjRDXvjH9T7ej33xcgKQAY+Vtg16HTNV
HMaJzrVt0cJf1P3wZQhGnKwK2mB4dYuvMB/5M18s0Lh9k847U+yWpqzJwo64Hn02
SRqAQAfEZJ/fPjWehvxOjL3gKR1d+HbSLMxE2xEn+Mt9qsncqtkIXD9BHGfyc2cZ
KkilV9WzKqsdEjWIlGav3NdLqL8eDfWbH8t3CmWxQ57+tNX2aZARqUMys7u3Elaf
gTq3uF4oysBijmwx2ngQHEORzb07B+X07NUZtisBSlV4gcGiQOQdIUpX8XE2MpV5
45nE8ymUeehSHG4rjB5Ez/fNl5pwUDmgDEn4OuJF6kCXn45PT0di96yBQBIfBefQ
rHzJ0afvMha7R8W46RcMjr90c9B5Qll4vqJIoiBXRkBwLbtvrAiQBwcArZMx1zHd
VPvy9TWx5G5+3M7MDMpni+Jy8XoxjGhLs7trtJ9Jhs5UUWkF8HPrZpInDhDlw9Hl
pQ4wxcOGb53jXtHlBqEi5xYeIz2RosRmVkQT8Si5fwW4OFe+ZUY=
=N2GO
-----END PGP SIGNATURE-----

--3FVpZi6DzgGOTZib--


--===============4533881624103232263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4533881624103232263==--

