Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32D0D2CE01
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 16:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnKujX9f/mTKTSCJ85NymzdkGaPwY7vxxAdN5syPaZY=; b=domCs/vPz3dPDBY5WdXIwL7UB6
	1nXGj52raYADub8vJyftZVIbhUBv6NN38ZuqKB5JFJfRq7168kInDT11ap4/1YqOlWbpWJbdu/mKT
	l8wTKsyulHyewyB84skKqaEtZoRHhIXq/po8EPzIHs5VksgKyCpcSjwkdvu/Sm1eUBMc60GVy6aDK
	P+wWBT1fV6ccLdCbUqSU/0hJZaV/3H9/il+vsYJIDEOqLTw6xGTvi9iP0OBnoja9jwYn7EwcL15+F
	fKlix62XBXr8DnkTmJ9At0ADNqUEQ3yAO3luWSnN9jGJ+tnENx0JWhZ/vIJHqQYEHanhGl5GEo6aa
	Ec381z1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3I3d-0000000BX5Y-0DN5;
	Tue, 22 Oct 2024 16:48:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Hkb-0000000BSn4-21y4
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 16:28:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EC92AA44188;
	Tue, 22 Oct 2024 16:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1BCC4CEC3;
	Tue, 22 Oct 2024 16:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729614531;
	bh=87Hj2MBEy325Y9mIUYVzyJy2Kc9E81HbJvfmCb01J3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXUcFdDCWRNAtSwfiPxg5zWvZ0VgQbqC2DFAe0C/GgDrCK2r7S9u+EquuutSYnQ0Q
	 iLvxcE7UMNGDQtVC20qrTOyEXcSU3szt24wGU1Uogjw4LeE1GEMk9pEmV/EHJgcHra
	 qGFWV2ihpiwGKh5FMywbfLZNC8v8tfjUPvdqKVr0iMmC7ff1J614mqK+OQMVfEKuuX
	 H0falu0ulNL6lhupAbtUWTmtfbxcy7pH0VVPXlQtqWg4uJPq+wtCTcLLI9aly7AIkI
	 HarMVffNwg8mln4P55rbWA+Px5vascrVBIod/19XmYvh8QsuD3wccEFP1oPWCPpvPW
	 H6qydWoxdB4IA==
Date: Tue, 22 Oct 2024 17:28:46 +0100
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
Message-ID: <20241022-unrushed-dragonish-2949ee887824@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
 <20241016-shallot-nerd-51eeba039ba0@spud>
 <20241016-dandelion-hypnosis-9d989bb2fdd1@spud>
 <CACRpkdbJKWcjBG5ejwsNEgnnGWj69TAtKbgaHP3NiPM5GbiGQw@mail.gmail.com>
 <20241016-cobbler-connector-9b17ec158e3a@spud>
MIME-Version: 1.0
In-Reply-To: <20241016-cobbler-connector-9b17ec158e3a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_092853_609080_17DCF2B2 
X-CRM114-Status: GOOD (  21.61  )
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
Content-Type: multipart/mixed; boundary="===============0927605278449580504=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0927605278449580504==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GJngKmvlq7nwNriG"
Content-Disposition: inline


--GJngKmvlq7nwNriG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 08:42:51PM +0100, Conor Dooley wrote:
> On Wed, Oct 16, 2024 at 09:26:13PM +0200, Linus Walleij wrote:
> > On Wed, Oct 16, 2024 at 12:29=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> >=20
> > > What does bring a nice simplification though, IMO, is regmap. I am
> > > pretty sure that using it was one of the suggestions made last time
> > > Lewis submitted this - so I think I'm going to do that instead.
> >=20
> > If you have the time. Using GPIO_REGMAP for MMIO is not that
> > common and I think the driver is pretty neat as it stands.
>=20
> As with using the common MMIO stuff, I don't think GPIO_REGMAP provides
> that much value as I cannot use the direction stuff from it. I was
> thinking of using regmap directly, like:
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=
=3Dgpio-no-irq&id=3Dc8933e1e3600e3fa29efe28fbb2e343e133f9d67
> which I think reduces how ugly the two direction functions look.

Sorry to bother you Linus, but I was hoping to see some sort of comment
here before I squash this stuff and submit a new version. Is something
like what I linked above acceptable?

--GJngKmvlq7nwNriG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxfSvgAKCRB4tDGHoIJi
0h5kAQDKBegFI2rak7HFJbK0iwWK2tdka7YhCjyxJnQhb4X1fAEAi0xxQnIUfefJ
1ngWUp4/1xqVFHaH+QaFPgi2aW7X3QI=
=uuEI
-----END PGP SIGNATURE-----

--GJngKmvlq7nwNriG--


--===============0927605278449580504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0927605278449580504==--

