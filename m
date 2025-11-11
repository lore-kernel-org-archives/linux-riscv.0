Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD584CCFA1E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 16:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85bmZV2ezL74AZS0u4hHEdbfiZgZ8obRcici9TSqXNk=; b=OYQvDNxcOq/AdP+mwGOiO/ljyz
	imBtumP6Gd6oaNp+fRVR2CYbxCEwRok/dyl+TC2xXj5Zx/fHMm4HmXSa+rwZlrlIzNsdKG2pNOU1+
	j8hyfzhSsiwRrH4gfwtak0cRuEXiSBSQCvmPkr0wHo2wJ4ZZP3Pyfj8oNXAu2pH36GlJ4H7tu60wk
	Rx4+kX2xzDvwA5r+oEFOVOeZKOifCLMCr0aDO9cNdSWtKOBIUn4dL5R3BPmmZbZX+QJjyAw1aCXTU
	Nuoj1rauX+3QwA1ah/i1pSwFAqz4jgJXiuO9Xrr/Sbn0utxJKwZVpgbz4Pzk36BUcbDJky+XZxWg0
	8BAOXZeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrZ1-00000007Uae-3EfD;
	Tue, 11 Nov 2025 16:49:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrYz-00000007UZn-35LJ
	for linux-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 16:49:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D22541B09;
	Tue, 11 Nov 2025 16:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CF8C113D0;
	Tue, 11 Nov 2025 16:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762879789;
	bh=kpe5yNkzl1ylQk4HWkjZz+J5d1iHVL1ZFwBmlT0/iSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YNF/G/l6d2q9beti94869bl7xQ9koe+hfeuOxk06ralzTMh3MnL7CTaQ75CXGqwlT
	 cTu9797bpTWYDVc/45hPIR27L0H3tPjZWIGLCftY2WgdAKpBSZIh5y5F9cHcgEwKi8
	 o5JRm7Zvlt2uUL1SW4fZpWHR0PAgcrn2xgRe2QzhuJuyjkLMaIwuWB2SvzgpTGfpLn
	 LHtu/i6Um5qulwEIcIxfPLOETnL1gs4upbgMO3uykP5v4kaOjHQWWjHpXLugUCoIHg
	 2HmDoW9y5VRg8DdadyrVZcGXKXDIbzZ8amTyxdFShr4OcBftR2cTdiDmMA5vXRTBFh
	 0B6yWBltDpvYQ==
Date: Tue, 11 Nov 2025 16:49:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: claudiu.beznea@tuxon.dev, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/5] reset: mpfs: add non-auxiliary bus probing
Message-ID: <20251111-cattle-stole-7bdec770bbe0@spud>
References: <20251110-zookeeper-femur-68a0ae346397@spud>
 <20251110-evict-gratified-bb816e2799a2@spud>
 <2fabead977bee651800790f6b0d6323ffdc372c5.camel@pengutronix.de>
 <20251111-apron-dispersal-6bd72d4a41a1@spud>
MIME-Version: 1.0
In-Reply-To: <20251111-apron-dispersal-6bd72d4a41a1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_084949_819191_76392001 
X-CRM114-Status: GOOD (  13.85  )
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
Content-Type: multipart/mixed; boundary="===============8817838263659330520=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8817838263659330520==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+1N/XShC9pu5yYwB"
Content-Disposition: inline


--+1N/XShC9pu5yYwB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 04:46:31PM +0000, Conor Dooley wrote:
> On Mon, Nov 10, 2025 at 12:34:16PM +0100, Philipp Zabel wrote:
> > On Mo, 2025-11-10 at 11:23 +0000, Conor Dooley wrote:
> >=20
> > With the superfluous cleanup include fixed.
> >=20
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> >=20
> > and
> >=20
> > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> >=20
> > to be merged with the reset of the series.
>=20
> Cool, I have dropped the include and pushed the patch to the
> clk-microchip branch:
> https://git.kernel.org/at91/c/4a75fcd2000e1af452343aac6e34387f8e794f37

And of course I made a mistake hand assembling this, that's the hash
=66rom before I removed the header. The actual commit is here:
https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git/commit/?h=3D=
clk-microchip&id=3D781f60e45bdfe351aad692ac0fa89e36f8bf4a36

--+1N/XShC9pu5yYwB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRNpKAAKCRB4tDGHoIJi
0strAQCaeCfO/jKbKqDwIwnIpTIJ/gnmLI4l3QhScBIpyCR9CwEAr7UHKcT+Ph1N
4Ox+Rgxn0tyGTs0P83gtbFaLQqUJnQk=
=hPke
-----END PGP SIGNATURE-----

--+1N/XShC9pu5yYwB--


--===============8817838263659330520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8817838263659330520==--

