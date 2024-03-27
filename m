Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8985EC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 18:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8CU1yHtNBOxNYtI/gbUV9Yiv8RNddIt/kpmJWmE1nw=; b=bZi6ieDT3anShjjgqzrAafBotJ
	mnn+om54OEuh6zYCE1UO3GBc/z3BFa33FnRtwR57XAvV9MgxHylxYBSWx0i+1uoW3MM1s5qcJsDCB
	bP0ov5GT8iLdhW0E2DgwYvF8qVHp6qAOt9au1y2qEYYeA1p5Lvpum4Xug3OmaDjqtct+uE23sOatS
	l7YII7rwjxthPhrFlcwudefQCtDHt4WruQqS45Dx4XkbFEfprGVPYPF2fXMusPiMjvZRseNu3Kul4
	HaTkcdcpX0aVr9w5jHpNoqAq+nKtiRf/U5wE49x4MHyU3sHhf1qPc8aTv4faudY9o+9rqZ9/QE6me
	OYhVO0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXg4-0000000AT9g-1P2H;
	Wed, 27 Mar 2024 18:07:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXg0-0000000AT8h-1gxg
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 18:07:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 105AE61630;
	Wed, 27 Mar 2024 18:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F87C433A6;
	Wed, 27 Mar 2024 18:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711562822;
	bh=/bu3JpKJr0qnVs//UM1Yw62jMcXqbFvPuluMhcemfBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I0wk9Ph0DhJ4VlgbRH0d78KXTKNFsEUmzcYHqfxk5mODxKk7rXnpm0PiYFuMIs6hI
	 6P6HOATZW6Bh2JmaKrsjSj3pDKSmbdBuVcUpH8yO0c/nir7cEtxxg8HZob7vTKxZG0
	 wmidW7OSGxrIHc/Bcy5+AMgTFrfbbg7+6WD/0wElzC9hW2mS90RBn9ju1xkQAJ3ll4
	 +pXN2N7HN/hWdRj/kkTTNmgAHkD8rxhtYLOQ5GF4SCM3wajKaNUqIPkhQqugyTxqFg
	 N8AF2GxZ4pOotjVpRSMSHfX0PR0hDYZEnWc9eqPAezpJJuoiNae5socdBEdJyus7e/
	 fF1UJDXmbMJHQ==
Date: Wed, 27 Mar 2024 18:06:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: add Milkv Mars board device
 tree
Message-ID: <20240327-cotton-fang-37f6d8fde0e5@spud>
References: <20240131132600.4067-1-jszhang@kernel.org>
 <20240131132600.4067-7-jszhang@kernel.org>
 <20240206-magma-deem-2c88e45a545a@spud>
MIME-Version: 1.0
In-Reply-To: <20240206-magma-deem-2c88e45a545a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_110704_524316_D78E75DE 
X-CRM114-Status: GOOD (  17.19  )
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
Content-Type: multipart/mixed; boundary="===============1731968697361848550=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1731968697361848550==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0VltnKYIOb8VcZm1"
Content-Disposition: inline


--0VltnKYIOb8VcZm1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Tue, Feb 06, 2024 at 07:13:48PM +0000, Conor Dooley wrote:
> On Wed, Jan 31, 2024 at 09:26:00PM +0800, Jisheng Zhang wrote:
> > The Milkv Mars is a development board based on the Starfive JH7110 SoC.
> > The board features:
> >=20
> > - JH7110 SoC
> > - 1/2/4/8 GiB LPDDR4 DRAM
> > - AXP15060 PMIC
> > - 40 pin GPIO header
> > - 3x USB 3.0 host port
> > - 1x USB 2.0 host port
> > - 1x M.2 E-Key
> > - 1x eMMC slot
> > - 1x MicroSD slot
> > - 1x QSPI Flash
> > - 1x 1Gbps Ethernet port
> > - 1x HDMI port
> > - 1x 2-lane DSI and 1x 4-lane DSI
> > - 1x 2-lane CSI
> >=20
> > Add the devicetree file describing the currently supported features,
> > namely PMIC, UART, I2C, GPIO, SD card, QSPI Flash, eMMC and Ethernet.
> >=20
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>=20
> Got a dtbs_check issue in the patchwork CI:
>=20
>   +arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: gmac1-rgmii-rxin-c=
lock: 'clock-frequency' is a required property
>   +	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>   +arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: gmac1-rmii-refin-c=
lock: 'clock-frequency' is a required property
>   +	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>=20
> Can you fix that please? Also, I applied some patches the other day that
> seem to conflict quite a bit with the common board dts patch. Would you
> please do a rebase on top of that please?

Been going through stuff on my todo list now that the merge window is
closed. Could you please resend this with the rebase done?

Thanks,
Conor.

--0VltnKYIOb8VcZm1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgRgQgAKCRB4tDGHoIJi
0pBPAQCiBXJv2E98EL2KnrNrG4R6lov/fM6sLaACMedaJDc7uQD+L4Rwr/7Nrzcv
3NycjRUFPZtsx0EM7+vyd1cyKFonnw4=
=lyg8
-----END PGP SIGNATURE-----

--0VltnKYIOb8VcZm1--


--===============1731968697361848550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1731968697361848550==--

