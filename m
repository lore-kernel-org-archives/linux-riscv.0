Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549B3C197A0
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 17:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K977ybtJ0l5lknHEjAb8Ou/7ZXF+jcMgPRMQnZG2D7o=; b=Z7yxp/dL4YCPNoUm/klem/FyO0
	vk1IOuRFk0Vi3f3OSkKCLXFyZ4xjRoph6JmGPmdryXVkJDm17vzMijiuBAQNDE7V9rzPmfOYwjDmv
	Hy6GxnKJpzTeAdr3WK7Mkj+SkwJQehoeCAeVOEH6fM8xkoc7fN3XjW58EwlCENQguK01GfCl+yILP
	BcdqjemogJrYrsMW1WhnERBsYFCZqFfrnGFY9Zb25ArJ4k3gnB7Wl3rr7R06zbFGf6B68AiCfETjN
	fGCmTDWhaUth12N+tb3NxkRVWPHU7WxrDx+om52EshuufrKLIC7rL7j819ZyqABI0KJz4dyLBD0d8
	HVw8dCEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3gb9-004Dcn-2F;
	Thu, 16 Nov 2023 17:56:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3gb6-004Dbz-32;
	Thu, 16 Nov 2023 17:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JTOSSzmkti/CwkIFzl38dTbWRkcFa2xCEPwQSmwX8aA=; b=UXcT341eLiIQ8qsos7iMI7Xife
	1dwpjpYa7p94IDhbWJ9EOOFCcxvYRqVQJ2WSi4hQtvWTJkoaZ3EUCdPgHZq3sacnXxg4cF3tOfVt6
	Yibp1HCg7NmYSxuQUAnR8C+wH2xHrBbQyXQqKzif4nlK4mp41EANoj/IKpJ2J43i8onf/IDa52Kd7
	Ps91yQldJCOpGUdkbBZKPmLDI7vAvuXqZVG+q815xKKufQGgC3nfpz3xO52s7Xiax8Fl8s5hUMjMy
	vqUyWFVZILQC4eOMAjK+iDC9HhGxNBcAmbeGewju9c9HvWIo1orWciTJeOTwC/9Lg+l+Cka6xc/b1
	Tv4IPwdA==;
Received: from ams.source.kernel.org ([145.40.68.75])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3gb1-005jwK-2J;
	Thu, 16 Nov 2023 17:56:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5CC88B81C8B;
	Thu, 16 Nov 2023 17:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49CB0C433C8;
	Thu, 16 Nov 2023 17:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700157353;
	bh=JTOSSzmkti/CwkIFzl38dTbWRkcFa2xCEPwQSmwX8aA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFyoDzEMgrhUh2OxSpogBRBdx/kxk2p6NXUbDjjjl4EwgWbPltzgZixN/p8bEtMi7
	 hKGIPprRoW/tOD8Qi79NE84j5zepPPPfDTZ4nGeBlQ/kfEvXdSTu504rIhA0hRfivw
	 otOlkcUPnhOfuI3QGcCn7TyQWtn2zoL4S1oS43gRY3NxT1gobz1QaTr1DCgXPKxuT6
	 iETnqxuNlPQ+vxs2F2//BHVqDgh9I14q059z8Lx1OZVi2DuLkrZvhkcXnD8TvBMG8/
	 ZbCvJ1T99RoNUpsb7o/vOmb0CiVd4cgH494by8++yRUaYyitC8OskXl2dJ+ztFQ4Gj
	 NSvbNuQH7f1SQ==
Date: Thu, 16 Nov 2023 17:55:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Samin Guo <samin.guo@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	geert@linux-m68k.org
Subject: Re: [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
Message-ID: <20231116-stellar-anguished-7cf06eb5634a@squawk>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <f253b50a-a0ac-40c6-b13d-013de7bac407@lunn.ch>
 <233a45e1-15ac-40da-badf-dee2d3d60777@collabora.com>
 <cb6597be-2185-45ad-aa47-c6804ff68c85@collabora.com>
MIME-Version: 1.0
In-Reply-To: <cb6597be-2185-45ad-aa47-c6804ff68c85@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_175607_999525_4723F3FC 
X-CRM114-Status: GOOD (  21.88  )
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
Content-Type: multipart/mixed; boundary="===============2536453450097734416=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2536453450097734416==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uAMF7mMjCIyQbaxj"
Content-Disposition: inline


--uAMF7mMjCIyQbaxj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 03:15:46PM +0200, Cristian Ciocaltea wrote:
> On 10/30/23 00:53, Cristian Ciocaltea wrote:
> > On 10/29/23 20:46, Andrew Lunn wrote:
> >> On Sun, Oct 29, 2023 at 06:27:12AM +0200, Cristian Ciocaltea wrote:
> >>> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
> >>> RGMII-ID.
> >>>
> >>> TODO: Verify if manual adjustment of the RX internal delay is needed.=
 If
> >>> yes, add the mdio & phy sub-nodes.
> >>
> >> Please could you try to get this tested. It might shed some light on
> >> what is going on here, since it is a different PHY.
> >=20
> > Actually, this is the main reason I added the patch. I don't have access
> > to this board, so it would be great if we could get some help with test=
ing.
>=20
> @Emil, @Conor: Any idea who might help us with a quick test on the
> BeagleV Starlight board?

I don't have one & I am not sure if Emil does. Geert (CCed) should have
one though. Is there a specific test you need to have done?

--uAMF7mMjCIyQbaxj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVZXoQAKCRB4tDGHoIJi
0tu2AP9drj6GsHST1GuwVshDCPfcDCHRO+vR+I1UqBAWPOMUXwEAqSxcPaC1TyWe
GMY51dqgFxkhTDyvFRD6foJdL4VC4w8=
=kvIZ
-----END PGP SIGNATURE-----

--uAMF7mMjCIyQbaxj--


--===============2536453450097734416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2536453450097734416==--

