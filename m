Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB1DC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 20:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EC3MMCJ7uQMFpsKtEQ4Gr6re/PzuWK46bS5Rl7Ih5Gk=; b=EXErB0c3+EDMFlCjoyX5ni7ej4
	Y+9+Q7fJI63wanK1ZmmWQ1VBJ8x2r/FB46hjfKhwBJMrG7ydETWHvJ10ItS4VdubDb6H2ep1SDYc5
	pcBo+D2/eQjwOFsk2Q9KHMgnSF2oIjNL8fpP/aG77295l5KRbnmj+IF57HoiAxiC5l+QNwVXD3Bgj
	am1+To8njjdQfjBMEBPlADG084s3WAUkzxCR+HqspQklOEW+ptMarkGec/aZcWoE563NzXiuGlKjc
	s81r9LCL+GqqUKvwnoxOveZBlcb3GMoVwstIBIXqlZfBm748JDfIM/VKKxq/GCdaddh7yYkoLue6v
	vWubGhIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7jhJ-0042fW-6E; Tue, 20 Dec 2022 20:58:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7jhG-0042cl-Pb
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 20:58:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F324861572;
	Tue, 20 Dec 2022 20:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06EBC433D2;
	Tue, 20 Dec 2022 20:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671569924;
	bh=x403go0noSlBok3l6ETWm1H3es1ov0ErW3hoGi/bwMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aU3RHF9M+DZ4tI565UV/fbP23ssYCNG9RrmVtrLxQP6C9Dyad3GbQN4ByNAkRnWmH
	 +GmPE6SFXeBFvKJAT6EGzTHjzr+KXLxVhYwmT9jgY/DIZ5hjEuFw1Iasw5UEiBKqnO
	 gmYqW96z3Yi5oJZUotd5OAhXnvIn010Ou4Z7YcnMfEpT52Vpdt4euSQNhNXSBwVK5y
	 y7ToHcx3su6+z+LttHYc6iyjqUjp9ytxuocCKPkMUilZbeh9TfZyCbPnP6E78VxZFu
	 pjYfvZPm/TtMp6Q0531Jv63rNcAOsKFKyQNpMqdBJOieMWweCVeBWCOeVi3t64LBP0
	 YQVDkK43LtMBQ==
Date: Tue, 20 Dec 2022 20:58:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: riscv: Add StarFive JH7110 SoC and
 VisionFive 2 board
Message-ID: <Y6Ih/oG661gkA9Rd@spud>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20221220011247.35560-2-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_125846_943583_694BE451 
X-CRM114-Status: GOOD (  13.59  )
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
Content-Type: multipart/mixed; boundary="===============0619986056821560950=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0619986056821560950==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QuMAt+cWIHQmpruC"
Content-Disposition: inline


--QuMAt+cWIHQmpruC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2022 at 09:12:41AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> Add device tree bindings for the StarFive JH7110 RISC-V SoC
> and the VisionFive 2 board equipped with it.
>=20
> VisionFive 2 board has version A and version B, which are
> different in gmac and phy chip. The version A board has one
> 1000Mbps and one 100Mbps Ethernet ports while the version B
> board has two 1000Mbps Ethernet ports.
>=20
> Link: https://doc-en.rvspace.org/Doc_Center/jh7110.html
> Link: https://doc-en.rvspace.org/Doc_Center/visionfive_2.html
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Unless Emil objects, I'll queue this for 6.3 once -rc1 has been tagged.

Thanks,
Conor.
=20

--QuMAt+cWIHQmpruC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6Ih4QAKCRB4tDGHoIJi
0ow7AQCts2dR5OUFsLgM+2Wp9kFTFTakGv8Ot3caCKUwNJ8MxQD+KvD5x2VCii5O
85RYKGwAvcTntvHA9kodjRaPru06QAY=
=bgMZ
-----END PGP SIGNATURE-----

--QuMAt+cWIHQmpruC--


--===============0619986056821560950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0619986056821560950==--

