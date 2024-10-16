Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678D1D2A555
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 19:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8gsXkk6SQBan8oi6eDPO5gYrXgJoeWzLCKDaWiM5F4=; b=IP5w9H3SNU/oO19jVmN56K8Zf0
	q1+grYbjqYdWTaSfPY45Q9XtRknFE+CSsKZePJtXJZEPt1F6hgN0ZIM0SPowj6LvE2JVkkn4n92uR
	lMBZYfpNCX8RXvye0p+dRA76TbwX7dZyx4WXwg6USUm25Q88XZp+V33I0zFr30i6G5S2AMVX0z3B1
	ut7OJeXWQQ5goQvQ/QFhmJ88YMLkk24kL0GL6o50+dgC0mw4GNrryse57qQew6zRnEPr88O6UJDWi
	8ZE4v7tX/+JZtTaFdi822kjjB5tvQM5MnsWfPETkDv2RvEigLHT+URiox7hExpXrC/tnJzq5lMWZ/
	VEDPIczw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t19wD-0000000CqVf-3QlA;
	Wed, 16 Oct 2024 19:44:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t19v8-0000000CqAn-0UVo
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 19:42:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D96B6A420FF;
	Wed, 16 Oct 2024 19:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91584C4CEC5;
	Wed, 16 Oct 2024 19:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729107776;
	bh=mZzMcn9MbCczzX11J8+TKZRX7Uh7hjxyr0xf7rLHKQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4iLvASZXoBveFjv8+9epyZ3FYoC2LL6NapNNmpAOzXB1KJ3kRDc54jMETDXw5YHS
	 cmetoNHDqC83Ujklx02sR7d6YPdtEsJX5sMGdATx+U3+cDPwfgAc1gvl+PuSAe9njh
	 ELlGAyeUVVU/xGLXeFmsssQFPdtGat14Jmru1f4Orr/1vhi/vSCXXIo6Zr8SS2d000
	 Mva4ajJUqiYHsHTXMc1ZpThEAbr50ZKVBF+yNXLzB7rlofSfQFnRQf6CGVPcw7AKWK
	 NKj+a23iHPnKFXmQU5SZoI1K1zw+scRrPeY6seTsFfRxCbuLA35vvQJe6Q1R7Ma1ls
	 gen+M4eGWLaaQ==
Date: Wed, 16 Oct 2024 20:42:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
Message-ID: <20241016-cobbler-connector-9b17ec158e3a@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
 <20241016-shallot-nerd-51eeba039ba0@spud>
 <20241016-dandelion-hypnosis-9d989bb2fdd1@spud>
 <CACRpkdbJKWcjBG5ejwsNEgnnGWj69TAtKbgaHP3NiPM5GbiGQw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdbJKWcjBG5ejwsNEgnnGWj69TAtKbgaHP3NiPM5GbiGQw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_124258_242379_23138404 
X-CRM114-Status: GOOD (  16.37  )
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
Content-Type: multipart/mixed; boundary="===============4277730142851996854=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4277730142851996854==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A7dnOTkzHLL/fEWQ"
Content-Disposition: inline


--A7dnOTkzHLL/fEWQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 09:26:13PM +0200, Linus Walleij wrote:
> On Wed, Oct 16, 2024 at 12:29=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
>=20
> > What does bring a nice simplification though, IMO, is regmap. I am
> > pretty sure that using it was one of the suggestions made last time
> > Lewis submitted this - so I think I'm going to do that instead.
>=20
> If you have the time. Using GPIO_REGMAP for MMIO is not that
> common and I think the driver is pretty neat as it stands.

As with using the common MMIO stuff, I don't think GPIO_REGMAP provides
that much value as I cannot use the direction stuff from it. I was
thinking of using regmap directly, like:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=
=3Dgpio-no-irq&id=3Dc8933e1e3600e3fa29efe28fbb2e343e133f9d67
which I think reduces how ugly the two direction functions look.

--A7dnOTkzHLL/fEWQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxAXOwAKCRB4tDGHoIJi
0nzLAP97X5rdMU9SMZrBe1Wh3xgBP+5nGo+g7+4bYyVhUFNghQD9HYvVX4AGihOk
4WFF1ruWtm4KhgoJOTAXVyYdsz6M4Ak=
=uvpR
-----END PGP SIGNATURE-----

--A7dnOTkzHLL/fEWQ--


--===============4277730142851996854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4277730142851996854==--

