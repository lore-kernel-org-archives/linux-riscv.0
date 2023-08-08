Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C58C04A94
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 07:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGdekdk8ps2P1QNYrayojzQ3yNgcC2ivXLTYoW914lA=; b=F11RmzAIhJ2oiHUs7DAV1X2Q0H
	mgvWI2ZbOfhTuUPcohV8t2PG2bpFlNw5pbmZ96hp26GYgoJR+d8mcdE9lQS4qL44+OBgTg5ovG7pP
	PARjj0EAsCLxSGkFTVZqFH9y7lBak+36WlkAFa3i9sTfIpKSFMM6rGy5QxzcdefGISBgzzAgDZDeY
	EkN12Vn61PFe7GxKhBwTTJDKl6Jy7MUxGF4fMEQRjHBHqhIU0BLo453ObiQsmqP2qd++CH7dWKrQ9
	OYlwwYAiuwOm0H1U4lajoj3i+EFLp0ffS5FpnOCcivE0zX0ZLq71i2fJwepPs0tmQrUBcHLImGiSR
	Yk92ymGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTGuu-001rt0-1V;
	Tue, 08 Aug 2023 07:14:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTGur-001rs8-29
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 07:14:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D1CBD623E1;
	Tue,  8 Aug 2023 07:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C036C433C7;
	Tue,  8 Aug 2023 07:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691478844;
	bh=JbqXnIWrhvRK/1VedLU0rkf4ac3M8lve+ZdK83upX3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=moDdluEutiSAWzxfn3EQ4PLVJ3yFae5/MaJPjCRjcvChu+Zzgi6gLb3emqsDZtt5+
	 3rh4iFtv9GwYcBjym5ZiRUF7Kpc0/xEyy7AsdXWKxBhwW36mTXsvZ5RRNCrvl+0Agv
	 t6ZDVlYY8vBpkRq4BqulZ5aoiqUvvCZ4wQhM12XlGyXgs5hFanhwUI5ZJRpNiF5zBB
	 XBzrsOX437OFtMaukrBO98qPcjeA/Oxm9sz1WC/z0bVDgNjGD8nQpQUpOQOGH7C/Nw
	 BMvszDYySSkk2CZJnCuTA75QZMsX7YK2a6RtGIA47/3OhHjirYGw5YWTfS0cLwNqIq
	 jAaweAciLz4IQ==
Date: Tue, 8 Aug 2023 08:13:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: dts: starfive - Add crypto and trng node
Message-ID: <20230808-despair-calm-40ca60de2afb@spud>
References: <20230808061150.81491-1-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230808061150.81491-1-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_001405_767254_BE2AF9DB 
X-CRM114-Status: GOOD (  12.19  )
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
Content-Type: multipart/mixed; boundary="===============0643562424188099931=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0643562424188099931==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PomhQBfiuNGfjeLQ"
Content-Disposition: inline


--PomhQBfiuNGfjeLQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2023 at 02:11:48PM +0800, Jia Jie Ho wrote:
> The following patches add hardware cryptographic and trng module nodes
> to JH7110 dts. Patches have been tested on VisionFive2 board.
>=20
> Best regards,
> Jia Jie
>=20
> Jia Jie Ho (2):
>   riscv: dts: starfive - Add crypto and DMA node for JH7110

>   riscv: dts: starfive - Add hwrng node for JH7110 SoC

I only got one patch, where is the other?

--PomhQBfiuNGfjeLQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNHrNAAKCRB4tDGHoIJi
0nfxAQDxMCy1nMLMOOxrNbqguwHV91F4BpZ9+JdAKtsnKC9RlgEAitOeXozvIkSa
3fvAp6UpdtjkfDJJdq5/41c70FXLmQ8=
=YX3x
-----END PGP SIGNATURE-----

--PomhQBfiuNGfjeLQ--


--===============0643562424188099931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0643562424188099931==--

