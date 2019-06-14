Return-Path: <SRS0=/FlE=UN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE76C31E4E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2019 20:58:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FF0D2168B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2019 20:58:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KluDnnhh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FF0D2168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4mZALxQm83OKJ0Ol/eJcb0sDyyOeSuUfa8/15JSAwI8=; b=KluDnnhhNZ4kme3oqv1iz40Q0
	wzoXR/NzVaSIn3o8gmvAzgK1r3jGwONU1TzVoT2P1NgAQd0E4d7FfZ6CycK4RTIzemp3NHupR0/D2
	OxMPFq8TS2kaSipTFtDzWdVpINBGoAd38Rsp7fmXZ5F72eq4z3pab5rNXvioOEMlFYdE+SOC5rz8X
	qc1XLLjoDJmodwckzU5rjGftmlNezhMeSzUHvJXkirrvtSgEr33EcFeOEyhtfcM/QuDrnlcYPCoCL
	mguN0KiQ6BRtJkBnP0tAgmJd5OtW7piix19pW9fVJERkc/Gi0AV6CRfmmXJ2TwigiStIv/CaqZOJh
	x9n1yutpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbtHZ-0001NO-E8; Fri, 14 Jun 2019 20:58:45 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hbtHW-0001N4-Pv
 for linux-riscv@lists.infradead.org; Fri, 14 Jun 2019 20:58:44 +0000
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
 by pokefinder.org (Postfix) with ESMTPSA id 0F1022CF690;
 Fri, 14 Jun 2019 22:58:42 +0200 (CEST)
Date: Fri, 14 Jun 2019 22:58:41 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH REPOST v8 1/3] dt-bindings: i2c: extend existing opencore
 bindings.
Message-ID: <20190614205841.GC17899@ninjato>
References: <1559369475-15374-1-git-send-email-sagar.kadam@sifive.com>
 <1559369475-15374-2-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
In-Reply-To: <1559369475-15374-2-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190614_135842_988091_8E033B67 
X-CRM114-Status: UNSURE (   6.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, andrew@lunn.ch, peter@korsgaard.com,
 devicetree@vger.kernel.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2747620042515007102=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2747620042515007102==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline


--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 01, 2019 at 11:41:13AM +0530, Sagar Shrikant Kadam wrote:
> Reformatted compatibility strings to one valid combination on
> each line.
> Add FU540-C000 specific device tree bindings to already available
> i2-ocores file. This device is available on
> HiFive Unleashed Rev A00 board. Move interrupt under optional
> property list as this can be optional.
>=20
> The FU540-C000 SoC from sifive, has an Opencore's I2C block
> reimplementation.
>=20
> The DT compatibility string for this IP is present in HDL and available a=
t.
> https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/device=
s/i2c/I2C.scala#L73
>=20
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>

Applied to for-next, thanks!


--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0ECoAACgkQFA3kzBSg
Kbao1Q/7Bww4MUaBPH3+ZywBjlJ45ehCw3ulD5lfN/Avf0GJLLlm2qGIm/BSe9/x
V80NkEuQC1ythfVxiq+edDN+Wy5yFtsKLhkjbKzgwYTsoMBx0AbHTjXujIGo03+t
iIg2/9I/Arq+u/5g+HCDk0/4asDMVMBJVa3bniKbClWfuJ7ggWH/UbmOGXfelX7I
HpaokQT/+D8sdtibkIdt4/rgvos/3h8NC4h2CTFywsBu+A62xwiMGpORJ1yWubto
xfr6uu6Rme7if+pyvu5Oxy/FV+UJshX6+6qSI/wvJnrQx1gh/GcKr6Pz7OLk9Pvw
BNgMy5MCLRfMCUUScrCZgjFiGFkZ4vrebE2sJ1+DW7gGPnDrsSatN0oxpn/r4Abn
OI4HsSjxtFZWcBz54prvGIzXYc+9bJcACgyeJRPVEDdvVGZDX3Mg5teIgbJbt9iD
CHp8DMgfdThiIr1cYn9ORF2miTXCaWs735qjM/8QckH4Bfd6cfoDIn5KDjo/1Th5
E6aQBheFFaq85DV74R/sdXXbpRQhrVBj/Cz3SgXhgj66ooHtdVBpNdXeSDon54XG
5v+LQrcexKmF0NlEFlyqeaajxnaB0kJQnXBzz1iqeg5Tkk/Gho70zFFUYhw4OFUM
F4hXCxq7vwHamFM6W68gMEcY0vPh/QqpNNYiSjWoEKn+PR3ZTt0=
=fkzZ
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--


--===============2747620042515007102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2747620042515007102==--

