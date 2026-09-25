Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCADC98321
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 17:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4GhS+reipayJ+J5wN7zWevkk8afK+fHsLxxdPsR3xw=; b=hZT1M9kCh98JZgjOA2y6eor0ft
	lce9MGP/y5iAxQEQVYsdeBXS70lnqAUPPbbDnNbU+9SdnN4dVUQSrXaXNi6YMvAP6Erku5Xp7z5T4
	qcJaoZ4L2VM1gfhdR1erFRKbRWQnJiHls9FylEacXzYcH5NBi11VyblijSKrMDEuhOg7XRESSvP3M
	MjhVXmzP6rNuxBARgmtpmfJzT5qEGeR0gJsaLs0xY+jcMv5AxSlzP9ItM2qBe7Hd5TKsuE0xQD9A3
	c4ZACXApy725VObDN0FvsDk11s3rZwA/fQ2/DaRHfL1lBGbjbd5KQh+U+mr0FNUt1QjuDE8as+QBE
	5zXA9pow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9WR-0000000E3CW-2s4m;
	Fri, 25 Sep 2026 17:15:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9WP-0000000E3CL-43Qw
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 17:15:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1024660136;
	Fri, 25 Sep 2026 17:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9841F00893;
	Fri, 25 Sep 2026 17:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790356540;
	bh=8wrQukkbLvvWOUtbkwn8ZxkTSNRmKfGQ5MVi7iQyHbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mqc5Y7d8JpciDSrcjetG2MsERuGJmWf9V2sE8IQ5qoBatO3pnNgtR3u9vhEAWwLeJ
	 nWyIO6pNuDAHm/Z7iKXO+93/G7c444ZH9LE4CM3vX+fVhuSTOUuizOstlCJZYAArbE
	 6n8E0w7tP5cQbawz0Q8nhNVVr5FfOzyENFqUoEBs8M+2fALSmSj9BhdmIy2b9dYQzk
	 kTFJ6qRZj/VMSFygB7WrvWmZ+cD+ElKSQZMiBmdIAm4nrgUAPmlrRa1eO0wyhMHFYf
	 8NVOMiZDeCgpsQA8CNZvjAtMH3+nYOM8YSfjhdmCsdDOkbSBWph78Kop3rcFAVmnkO
	 yxXngypmG1whQ==
Date: Fri, 25 Sep 2026 18:15:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Joshua Yeong <joshua.yeong@starfivetech.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"rahul@summations.net" <rahul@summations.net>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"lftan.linux@gmail.com" <lftan.linux@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Message-ID: <a5d0d4df-7e8e-4f12-b011-e41b66efd8a7@sirena.org.uk>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
 <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
 <9c0ae39b-d214-40f5-b010-cdea14ccc774@kernel.org>
 <c2c57bf0-e610-4353-93a4-84edfd08e767@sirena.org.uk>
 <SH0PR01MB08411AA7F403A71D2D7470A6F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <0db3ed29-8bb8-4dc3-a4cb-cc5b9bf2e893@kernel.org>
 <SH0PR01MB0841C933DE1E00C4012BDF53F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <ed0c4c67-6933-455a-937d-f5888d124538@kernel.org>
MIME-Version: 1.0
In-Reply-To: <ed0c4c67-6933-455a-937d-f5888d124538@kernel.org>
X-Cookie: Love America -- or give it back.
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
Content-Type: multipart/mixed; boundary="===============5638584243196340066=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5638584243196340066==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DWHGYh3WZIaCg574"
Content-Disposition: inline


--DWHGYh3WZIaCg574
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2026 at 05:18:08PM +0200, Krzysztof Kozlowski wrote:
> On 25/09/2026 09:14, Joshua Yeong wrote:

> > While the above method works but I'm trying to get the entire simplify to the following.

> > user-app-b {
> > 	compatible = "...";
> > 	voltage-domains = <&rpmi-voltage 0x01>;

> I see. Why power domains do not fit here?

The spec seems to map very clearly onto voltage regulators, it describes
voltages in mV:

  https://github.com/riscv-non-isa/riscv-rpmi/blob/main/src/srvgrp-voltage.adoc

I really don't see any problem describing this as regulators, it seems
to fulfil exactly the same role as SCMI regulators, supporting things
like SD slots where the OS genuinely needs to control voltages on a
mostly system power controller system.

--DWHGYh3WZIaCg574
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2rDYACgkQJNaLcl1U
h9CdSwgAgMFKO17AuqQP+TIfWFVvmgx8SAxLdZAciDJp7vUz0+KV+gs7mIAFG/bW
TF5hZ6o+AxJDaoZJB0MNnKwD1icT7bYsDNgD8ofXBZvUnfAQxttR3SiVsb1Uhw7I
BPsnwGkDGg0ma9wokkrd+M3ah3d5i0Doooq05z1mgEeiQOre89STDUd7zB0riO/8
/fa+MTIH8U3+pA2o4MtzgxaEkklWCthmRxSoNknvv6rFPGk7vWm+CNfA5SZaAuXS
k0bpugjYmOHrmrCTvbogP5pMPtmhqYkYAIGtpZBY1FEBjJKO5y97nHiByWEQHVpU
WK4Eq5kaV8sgtElCA0/E0bn5rRGa2w==
=kWHX
-----END PGP SIGNATURE-----

--DWHGYh3WZIaCg574--


--===============5638584243196340066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5638584243196340066==--

