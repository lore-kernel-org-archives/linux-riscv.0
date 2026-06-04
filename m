Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8DACD6E74
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 17:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhRPEnc52b3Yyfgvl4WSVFswTWv52oPZ5dF17a0HRfE=; b=OhhGtGKWuEHGujKO8zBdR9diPE
	/msigG/IGwLFwQOsx4FLEKU00rsWP2wjCoAFFSUV/nbdor0ftUet0n4PoeqtepS+NoLASmCl9uuuO
	RZ53147GSzcoQm1AusCohWKPq1cfadgfBa552DzS7t5VoIw97tgGR66C90q+TmgELNrqAqil/zg9Y
	JnIsTyNs2nN3PPpWl8SEnMJRHSCwc4cpZVk3MVfVGgbmqYWjOo75UXvTy7dqlSXaHIw8ji67laMa7
	f8IZFVxXricDhWaTg6JoT/W21p4vsvkNShu2JaxV1eOMEtZUVDp6wQKeTj1/75sqDBHtKsEUOTVvP
	I4V+43GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVBdG-0000000H85j-097s;
	Thu, 04 Jun 2026 17:13:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVBdE-0000000H85X-40xC
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 17:13:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B3A54181C;
	Thu,  4 Jun 2026 17:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231EA1F00893;
	Thu,  4 Jun 2026 17:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780593204;
	bh=3mNke4DPpjdjtMGcSKZlm7XTAekMgE3bOVU/KndyzOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PVJyKJwiKn4E+C2SFTGIzj7eZ0Pfz8EP9cwAr4kKCEOszyGFgTbErgFQUsdUm56hr
	 j4MFUxmPCMVR7CuieAhrJEFRlowxFkZK21I/gA2ohkxEJq5SLxSpEMVUWu4/NmhmVF
	 cB6zsftZUDCZyqbsRSepsPxbeYMHsKriG96aznk/2a8vNPE1V59Y+W81M40xOmjqkT
	 u/Oc5IwDzDJ6UG5bt2ih+hx4v87eP8j7JimkOqJDMi2fyiPZBEVJ/nVCWMUB7YhSmK
	 sKZxiO2rUIqnz6hdvX+x9kjlD+sZpM0ykNqMkj2qqDERYLCUGKRzBNmdxJG3nUiXEK
	 qo5+YOx6oJ5hQ==
Date: Thu, 4 Jun 2026 18:13:19 +0100
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
Subject: Re: [PATCH v3 09/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys2-pinctrl
Message-ID: <20260604-veggie-constrain-16a72066e82f@spud>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-10-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260603055347.66845-10-changhuang.liang@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============4130870096251437989=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4130870096251437989==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7KP5dV2MCZU0dpPN"
Content-Disposition: inline


--7KP5dV2MCZU0dpPN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2026 at 10:53:35PM -0700, Changhuang Liang wrote:
> +          power-source:
> +            enum: [ 0, 2 ]
> +            description: |
> +                0: power supply of 3.3V
> +                2: power supply of 1.8V

I'd rather these were given in e.g. microvolts, rather than what look
like register values, that have no meaning when looking at the dts.

--7KP5dV2MCZU0dpPN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiGyLwAKCRB4tDGHoIJi
0qJ/AQCQ/vPUMhGA0s99RrlfmIhY43MmG9ypad6INnfVMc+/ogD/XOOCyrLph3nG
xf3MOhu5OXndhUYDq+Zw0JVREEKimwI=
=gfH/
-----END PGP SIGNATURE-----

--7KP5dV2MCZU0dpPN--


--===============4130870096251437989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4130870096251437989==--

