Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580A0CE8349
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnKQjc/ibuuKj56Wu9BQsvMe8u5m7VjqlQ4mcjEE6eA=; b=PeT6vhwotRy+4JvCeptfs1ICE3
	+mXMEU/eTAz0zkEsite2z5P/c6hdURWty7KyeAgaBImnfULP8Sjg9PUfweUOoibX6W6sC9rzZYYqz
	vzuWk77P1M1ihe/E2yjvhHaGZn9J4zRAkbTUEhXcGH3/zSrz29OZkg++PYhRngbl3CYLl49NJv7vZ
	XJ1HyGkKbCayV5tHw4JsNAoMfOJ8gU2duaIsqqKoQuCx1NDVSqbR7xV/WwUkjVFvo+V1nHq3exeDQ
	MSrZKuVVEw9VPxj/EPJvW8TbVfZf+81HrookZ9HoD6iS+XoNlTgvlxZb7TDVhISomj3AVjeF+cFCG
	cxRl+X5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHAZ-0000000HTFO-46Sr;
	Mon, 30 Sep 2024 14:14:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGsh-0000000HPW9-2LUP
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:56:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DFB185C1101;
	Mon, 30 Sep 2024 13:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66E8C4CECE;
	Mon, 30 Sep 2024 13:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727704566;
	bh=vY2/ZJaIITkqinrDuxkwQ8SQ7pATOYMl7NM5kwz/bcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RsTXPcURHj4NGESNY8Wovdg8I5ZV8AH5sbtqv6xZKgGQszSQ8O7Bj4fjf5s3ZK2Se
	 eNLlsZz3kEcKf22SdFmJmsadpfrSRUEyCfIkkJJ97vt9KC7/t+eBp7ZeWWbHKuWFHz
	 dMiI34gf6GsmiFPTF7tVGX1bX/AdDYLA0xFtSQs725DSccw29UHHm0G/XPmrBm4Td6
	 kalOy9Zo8mx01gloAKIoJCjUyuUtaNWiy9xPKfWsltAfwKrLSWfzInE5Qu21UTriHd
	 23UOjHeJDaAxWw76HWcSRiyLBJ0Wfdgkvub1CU9tnSNHPj3V9WMc54PNJbBMRFP9FR
	 8zHUOII/gp1GA==
Date: Mon, 30 Sep 2024 14:56:01 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [linux][PATCH v2 17/20] dt-bindings: timer: sifive,clint: add
 PIC64GX compatibility
Message-ID: <20240930-snoring-unrivaled-e38467343b3d@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-18-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-18-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_065607_673782_3E64D9C9 
X-CRM114-Status: UNSURE (   9.96  )
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
Content-Type: multipart/mixed; boundary="===============3856369662737710769=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3856369662737710769==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dSbwHpb80TnozwLx"
Content-Disposition: inline


--dSbwHpb80TnozwLx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:46AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> As mention in sifive,clint.yaml, a specific compatible should be used
> for PIC64GX, so here it is.
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--dSbwHpb80TnozwLx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqt8QAKCRB4tDGHoIJi
0rCvAP4vzWvnhiMvF2ZY727kJEZwoxR525N4pnNj7KNgJPIvzwEApJcgXaWQguqJ
CMrkpDxQgZiPsoJKHJFePVHjEYbcPQg=
=6F/K
-----END PGP SIGNATURE-----

--dSbwHpb80TnozwLx--


--===============3856369662737710769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3856369662737710769==--

