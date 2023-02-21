Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEA5C64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjaevZ1AVEezCCuWKbvdl6jeiZbg73A2DykxrQpcxAY=; b=XTxDvbP1qm6keBVUmFvc+7UDES
	b1ujEJ3aop/nhZMSvenGq8cO9zWrs/GTmQPeLohj25YdYSdo4uXg/VJsaSur0QZMRdwrgYlqlQtXg
	cYYlUqn9Qwrw4dEdR5DyFNFtPGehkT8RWXNDkw2YNKLlqbEwnjHsUeshlOsdFrXQ9myWGMT/poLST
	BNLlB4znFx51kRCy/bvU3nS02Q7moAhdannrmRetsf1O+ma4jcIp9oW1XIXqaDG+z6emQ9ZaASqO/
	Zq5x9kSvlCFokL/pYD0Wmh4ZU9k3e3MnEO/SQHY0aD96zPhfVmcwoWNDRjF6TE9z7nT3d81i1V9/p
	IQ8S6YWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUWGY-00975D-3W; Tue, 21 Feb 2023 17:17:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUWGV-00974c-4X
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 17:17:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6CB4FB81031;
	Tue, 21 Feb 2023 17:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A867DC433D2;
	Tue, 21 Feb 2023 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676999836;
	bh=u/EX2EEQLLbGyZmnT1nRhHzcrS5k9v/S2qzFSwI8ijw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qL5sKm4UG9apubmZQOMu+2H8s1iMRxk332jvTjBXjj6XbrbSLqgbaCUlVG2jmFGU6
	 q7xcC7/tKWXfiidzwA3hh4+tFnEc5zq6b1b5DzJbSV7J2IXDmdMdTg0kfLCLIfVq89
	 jF232yre1YArVaxORYLJbJnO6/pcoU9FcYBYuCbgOYDbPi8zdM8zp0AUimBRIU84Ds
	 jIUHErPXVmgewD1QMa0I6VmaxB3hrHVVraG1sbW/rudjSAa2USIZ7cGpgrknyqSqIY
	 Tyk8GnXvpDmkFvFRnmdzQgMsOre3awurR2jWbCVCF67hnK37Mc8simqIe21HHyGYI0
	 ixruPVbrFDspw==
Date: Tue, 21 Feb 2023 17:17:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/19] reset: starfive: Rename "jh7100" to "jh71x0"
 for the common code
Message-ID: <Y/T8lu07JEc7diPs@spud>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-8-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230221024645.127922-8-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_091719_358034_7383403D 
X-CRM114-Status: GOOD (  11.37  )
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
Content-Type: multipart/mixed; boundary="===============4434549957405406966=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4434549957405406966==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fU6grjyUvyTM1/0x"
Content-Disposition: inline


--fU6grjyUvyTM1/0x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 10:46:33AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> For the common code will be shared with the StarFive JH7110 SoC.
>=20
> Reported-by: kernel test robot <lkp@intel.com>

And here too ;)


--fU6grjyUvyTM1/0x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/T8lgAKCRB4tDGHoIJi
0qXhAP94QqAsDlyOI5fHCgHZs6qx2RXiYS6SxH6gymSLvkvA1wD+IQEXOwyELVes
GPlcOEKTxiMv4SmHMsUhmgV7V77l3gs=
=m9Wi
-----END PGP SIGNATURE-----

--fU6grjyUvyTM1/0x--


--===============4434549957405406966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4434549957405406966==--

