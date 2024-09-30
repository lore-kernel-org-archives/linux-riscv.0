Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F823CE8347
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQojBznCaSvVCDNBIoJX7aDZnMD+VyElXxyuLT/LxmE=; b=PpNkJkF8j/0ZMAWdN7XUupHrr8
	f6QwmhFvdDd/MTRQPF97azg27X9OFzwo1qyzegwUL7i3qD6/KbhTXGagaqFTu94S+6R1kxVPCJdeH
	Ir8ZDY/zdIOzEHbTnx4rHaqhkBJCh+3leUl/h/mg+JCgXlAUdnDWnJ2jH/lQbQnVLZib+ulcqOOqG
	OuQHWh26dzmHBrVs/W424OGk39k14OCnBSsoy5I3ihUSq5AEYsoLksmbuUh8KPNKQuwvj02eOmJG8
	FYKqhjtCtQtPL7ZszJ7b+AxT7n9fx1vwRWhzrc9cS7LOpeHG5reRaSb/VlrbW6hXmd9tB9jn3EaxN
	mQXvDVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHAB-0000000HSuY-48XZ;
	Mon, 30 Sep 2024 14:14:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGi8-0000000HMLd-3yoE
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:45:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 520D35C4B4B;
	Mon, 30 Sep 2024 13:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8CE4C4CEC7;
	Mon, 30 Sep 2024 13:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727703912;
	bh=XDMOUbaodttEOjqygaG+KV2OBgc5SWE0zH8P44Ue7g8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GF5vOw9L52CDYPz5WyX7bk1+QI2ylyPu8T3dig7bJZJEH1CZSWfNgXWbzM8Q2GNMf
	 pV9OIAoE4u1nT6kvC4MOHtr30a1gcxQtetq3od9cyTBbd/4A6bwUU477OZFPdh3/Li
	 Egk0t4TCatnywg9lhpl9txh8ZXEigHqHUe4v6Zzs/xM+OAMeIm37mNPSrAB27QzX+Q
	 LLiJyelYZfQqvnT3sOWHsr/PzKgQjLXcCTiPEBi7kOOrG6yV8hgGQAL6Z9vXy/WUxJ
	 rxDxmcO9PNvJ2TMxhGu6/FmRlCaG7l4g0upXYgLiv2CcgvOKpRg1Wksg6zcKI7KUqb
	 7pQ2wVYYxI4KA==
Date: Mon, 30 Sep 2024 14:45:07 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 04/20] dt-bindings: spi: add PIC64GX SPI/QSPI
 compatibility to MPFS SPI/QSPI bindings
Message-ID: <20240930-undrafted-mammal-0308550b621b@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-5-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-5-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_064513_054742_85745E17 
X-CRM114-Status: UNSURE (   8.91  )
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
Content-Type: multipart/mixed; boundary="===============1090735574571561207=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1090735574571561207==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lTgx9h43bP85ngCk"
Content-Disposition: inline


--lTgx9h43bP85ngCk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:33AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX SPI/QSPI are compatible with MPFS SPI/QSPI, just use
> fallback mechanism
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--lTgx9h43bP85ngCk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqrYwAKCRB4tDGHoIJi
0pXoAQCxk5D3pG/9f7uU5cG2212GvwpqtVgQJNyOQWAw/SSquwEAr54S7syoA2xX
mnlENWuNQscB87oEV1z8bQZgsLRdCAw=
=gOvb
-----END PGP SIGNATURE-----

--lTgx9h43bP85ngCk--


--===============1090735574571561207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1090735574571561207==--

