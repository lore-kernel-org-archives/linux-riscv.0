Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C544CD6E57
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 15:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrFkb7zXk2D3rXZTOhaUCEkiV+lrW4nCvvxZcERcu+Y=; b=WoXy46WodP4An9tq7HfFIxh1Yp
	g7+GJZbUGKChErBJF2b2zRt9jQ17ksoHO3WzXRGczAs9S6amsIPUrvEnWWwjf9ONLdQpFw5U29vk/
	3eVzbTpnWyjE0pWFgWjpm4O7sqatC9T8CLlPIyGOffl3mJX2eMamW16Yo7L6+gBuMZ2jTz53AaE2t
	xQJgUDCXJ+bZObo4//Jb0gDWmkskzjfnxcMTvLjK+As+fQArjCPlrxCNAihdolVWaCw1Pm9Rw4Pgq
	Ch9FAKadeKUpoK41DfdamilzCya+VQWiK7gZlMatVP02M54sIjygw9/GHNzfjHBbpCHrNtWBKyf5Z
	wTgalkQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnKL-0000000FLqa-0t2D;
	Wed, 03 Jun 2026 15:16:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnKJ-0000000FLqE-2jsF
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 15:16:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EBB8E601DD;
	Wed,  3 Jun 2026 15:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846B01F00893;
	Wed,  3 Jun 2026 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780499774;
	bh=E15Z2HLpNxRdOoHi9lUwcc6adK9szvvSvtwq3QLPM0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H5JYwOQTiAby5DiNxuTlBrOH3Yt+5EvwTBKNlX1yS0VY/SLLg3OYlcP68KWLquWFv
	 2l66Kc9Al2RnTB8qbrXCFSVo5jhbqqyStmgb85lT5KRbH0BoV+8QR1MWovLV4Y2wpq
	 69BBCjl59y+RddFbjopMEZbzei/76ugUQ0r3XduoUpbR1KGAhsx64HFTmCTCNld/kR
	 hXtFKZVtNmp+ZgJD/eiBpJzBVfDREE7iP2MvtWhxAzPJ08Q6s63x9JPCmbz1l948d/
	 bwqB9KsG4uRbB5L30LWfuXiA+iSrdBT/0In59JUEGScPT9gduLf30c7W8MYRIHvThE
	 r/bXOxI3UbmyA==
Date: Wed, 3 Jun 2026 16:16:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v3 01/21] dt-bindings: pincfg-node: Add property
 'input-debounce-ns'
Message-ID: <20260603-prevail-stereo-e5c6f56a433a@spud>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-2-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260603055347.66845-2-changhuang.liang@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============5075394961291130708=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5075394961291130708==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="71FISapX4KtVwp+B"
Content-Disposition: inline


--71FISapX4KtVwp+B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--71FISapX4KtVwp+B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBFOQAKCRB4tDGHoIJi
0t5jAPsG52WyxIdGqkWQXbNR7WWwBbFJJlig8nviGZ33zar7yQEA6vpxDt44oWRn
+RG29Due1ymZZztK7tR9/NKS9Q5p1wc=
=2VF4
-----END PGP SIGNATURE-----

--71FISapX4KtVwp+B--


--===============5075394961291130708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5075394961291130708==--

