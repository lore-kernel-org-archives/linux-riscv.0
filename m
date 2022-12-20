Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F260CC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 22:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIptfDiFf43N0DxKLrwnFI+4MofghpYOuDtIG9CwEtM=; b=4EBXh9Er2jEMxT1k1aXlb04Li3
	FZqKqyLoRk/DYuwRuf5y6SQuvraPlzs/xYt5eC69NNztqox2HZpSu5Jr/ZWVxYXl2jkbivTWBPXNV
	KfA2J88rImkfZHSaVChCu/CSZUe5nN9PGInO77ufXla5MeYHNRnjqgPXkKz5foFYO1BkpDrxhIOn5
	usv6H5O8kOCqJR0AG7IKfOOKk84hxImEJgr6IahP7+YvITkuHiE6j9ewFtMkIdvxxaT3Nu8RkAUAJ
	ZwqKkt/BAM2U669oO1eiV+0OcglZCWChI1Q8AY5RDA2aDdnJwTUe5XC2IriRQ6HrsozqfT0p43i9f
	UwdceFDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7l6Z-005DBB-Mq; Tue, 20 Dec 2022 22:28:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7l6W-005D73-Aw
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 22:28:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9FFF6B819DB;
	Tue, 20 Dec 2022 22:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A136C433D2;
	Tue, 20 Dec 2022 22:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671575333;
	bh=Gi9Ls7AdTRHk2NMViPiZtntvSG7jlfdDk6QPGIlIDk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2Hr59aznR/dX/hFFLfxgtR/hNttX/zFoD+8XS8K3C8x/ehvqqzmC/l71nYvFn+yP
	 iO4Z/kQYDfD5GhwRAtgYEHAER6BKLLexTEklL8wvkLA/hBYPoMWbuUXLpd3Jglt7IF
	 xlQcRLW15MCgoTPTPjH8j4Ja0uRQQzvSWNZGy496FfmCBxqhGC/as8o9Yw5mtLNRRF
	 vQvo44t+6WxGQPAnuDceEQVJ4nCONP0OLBADUFlM9p7VwQ+NT7S6at5U9J8Hqo3DhP
	 Xuu6KzpTt4fLgCw3kLUCM5kCvt1fkL34IXZ2Tna6bSpu57a/pm84MTbD9unlQce9pt
	 iAzYJ5WkgHezw==
Date: Tue, 20 Dec 2022 22:28:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/11] reset: starfive: Factor out common JH71X0 reset
 code
Message-ID: <Y6I3IPsmz1YTC3IV@spud>
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-5-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20221220005054.34518-5-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_142856_578345_DCD58F4C 
X-CRM114-Status: GOOD (  13.13  )
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
Content-Type: multipart/mixed; boundary="===============3982611676545920518=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3982611676545920518==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4WoZxz9j6RMJx5Ww"
Content-Disposition: inline


--4WoZxz9j6RMJx5Ww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2022 at 08:50:47AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> The StarFive JH7100 SoC has additional reset controllers for audio and
> video, but the registers follow the same structure. On the JH7110 the
> reset registers don't get their own memory range, but instead follow the
> clock control registers. The registers still follow the same structure
> though, so let's factor out the common code to handle all these cases.

Is it a bit ornery to want to see this as a movement and an extraction
in two different patches? Would prob be easier to follow that way.


--4WoZxz9j6RMJx5Ww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6I3IAAKCRB4tDGHoIJi
0iXqAQDCrwUaYH97jklrhn1ap1Ye2f0+ecPva4uRKLo+1303zwEA4Bhi59oLFzXz
5IZzLDO6LoOXnqMg1y6dWpcMagnIzQU=
=9HFU
-----END PGP SIGNATURE-----

--4WoZxz9j6RMJx5Ww--


--===============3982611676545920518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3982611676545920518==--

